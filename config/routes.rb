Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :applications, only: [:index]
  resources "studentapplications"
  resources "clients", only: [:new, :create]
  resources "sponsors", only: [:new, :create]
  resources "users"
  # resources :cars, :except => [:new, :index, :delete]
  get '/about' => 'static_pages#about'
  get '/team' => 'static_pages#team'
  get '/home' => 'static_pages#home'
  get '/admin' => 'admin#index'
  get '/admin/viewapps' => 'admin#viewapps'
  get '/admin/editusers' => 'admin#editusers'
  get '/admin/viewessays/:id' => 'admin#viewessays'
  get '/admin/newdeadline' => 'admin#new_deadline'
  get '/admin/prompts' => 'admin#prompts'
  post '/studentapplications/change_status' => 'studentapplications#change_status'
  post '/users/update_or_destroy' => 'users#update_or_destroy'
  post '/admin/setdeadline' => 'admin#set_deadline'
  post '/admin/newprompt' => 'admin#newprompt'
  post '/admin/deleteprompt/:id' => 'admin#deleteprompt'
  # admin test
  # get '/admin/' => 'admin#admin_page'
  
  # get '/login' => 'users#show'
  # post '/login' => 'users#login'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
