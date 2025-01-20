@interface ASBackgroundObserver
- (ASBackgroundObserver)initWithViewController:(id)a3 block:(id)a4;
- (UIViewController)viewController;
- (id)block;
- (void)_hostDidEnterBackground:(id)a3;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)dealloc;
@end

@implementation ASBackgroundObserver

- (ASBackgroundObserver)initWithViewController:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASBackgroundObserver *)self init];
  objc_storeWeak((id *)&v8->_viewController, v7);

  uint64_t v9 = MEMORY[0x21D484070](v6);
  id block = v8->_block;
  v8->_id block = (id)v9;

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:v8 selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x263F83930] object:0];
  [v11 addObserver:v8 selector:sel__hostDidEnterBackground_ name:@"_UIViewServiceHostDidEnterBackgroundNotification" object:0];

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASBackgroundObserver;
  [(ASBackgroundObserver *)&v4 dealloc];
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v5 = [WeakRetained viewIfLoaded];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];

  if (!v7 || ([v9 object], v8 = objc_claimAutoreleasedReturnValue(), v8, v7 == v8)) {
    (*((void (**)(void))self->_block + 2))();
  }
}

- (void)_hostDidEnterBackground:(id)a3
{
  objc_super v4 = [a3 object];
  id v10 = [v4 parentViewController];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (WeakRetained != v10)
  {
    do
    {
      id v6 = [WeakRetained parentViewController];

      if (v6)
      {
        uint64_t v7 = [WeakRetained parentViewController];
      }
      else
      {
        v8 = [WeakRetained presentingViewController];

        if (!v8) {
          goto LABEL_8;
        }
        uint64_t v7 = [WeakRetained presentingViewController];
      }
      id v9 = (id)v7;

      id WeakRetained = v9;
    }
    while (v9 != v10);
  }
  (*((void (**)(void))self->_block + 2))();
  id WeakRetained = v10;
LABEL_8:
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_destroyWeak((id *)&self->_viewController);
}

@end