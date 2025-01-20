@interface QLServiceViewController
+ (id)_getServiceWithUUID:(id)a3;
+ (id)_serviceViewControllers;
- (NSUUID)uuid;
- (QLServiceViewController)init;
- (UIViewController)mainViewController;
- (void)_configurePreviewCollectionViewController;
- (void)_registerServiceViewController;
- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3;
- (void)invalidateService;
- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3;
@end

@implementation QLServiceViewController

- (QLServiceViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)QLServiceViewController;
  v2 = [(QLServiceViewController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    [(QLServiceViewController *)v2 _registerServiceViewController];
    v5 = v2;
  }

  return v2;
}

- (UIViewController)mainViewController
{
  if (self->_isAccessoryView) {
    WeakRetained = self;
  }
  else {
    WeakRetained = (QLServiceViewController *)objc_loadWeakRetained((id *)&self->_mainViewController);
  }

  return (UIViewController *)WeakRetained;
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  if (self->_isAccessoryView)
  {
    uint64_t v3 = (void (*)(void))*((void *)a3 + 2);
    id WeakRetained = a3;
    v3();
  }
  else
  {
    p_mainViewController = &self->_mainViewController;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_mainViewController);
    [WeakRetained preparePreviewCollectionForInvalidationWithCompletionHandler:v5];
  }
}

- (void)invalidateService
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = (NSObject **)MEMORY[0x263F62940];
  v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
    *(_DWORD *)buf = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_DEBUG, "%@ %@ invalidateService #Remote", buf, 0x16u);
  }
  QLRunInMainThread();
}

id __44__QLServiceViewController_invalidateService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  [WeakRetained willMoveToParentViewController:0];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  v4 = [v3 view];
  [v4 removeFromSuperview];

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  [v5 removeFromParentViewController];

  v6 = (id *)(*(void *)(a1 + 32) + 984);

  return objc_storeWeak(v6, 0);
}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __81__QLServiceViewController_configureAsAccessoryViewContainerForPreviewCollection___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(unsigned char **)(a1 + 40);
  if (v3)
  {
    v2[976] = 1;
    id v4 = +[QLServiceViewController _getServiceWithUUID:*(void *)(a1 + 32)];
    id v8 = [v4 mainViewController];

    id v5 = [*(id *)(a1 + 40) view];
    v6 = [v5 layer];
    [v6 setHitTestsAsOpaque:1];

    objc_super v7 = [*(id *)(a1 + 40) view];
    [v8 setRemoteAccessoryContainer:v7];
  }
  else
  {
    [v2 _configurePreviewCollectionViewController];
  }
}

- (void)_configurePreviewCollectionViewController
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[QLPreviewCollection previewCollectionClassName];
  NSClassFromString(v3);
  id v4 = objc_opt_new();

  id v5 = [(QLServiceViewController *)self _hostApplicationBundleIdentifier];
  [v4 setHostApplicationBundleIdentifier:v5];

  v6 = (NSObject **)MEMORY[0x263F62940];
  objc_super v7 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    objc_super v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    __int16 v9 = +[QLPreviewCollection previewCollectionClassName];
    *(_DWORD *)buf = 138412546;
    v28 = v4;
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_INFO, "Created controller (%@) from class name (%@) #Remote", buf, 0x16u);
  }
  [(QLServiceViewController *)self addChildViewController:v4];
  id v10 = [(QLServiceViewController *)self view];
  uint64_t v11 = [v4 view];
  [v10 addSubview:v11];

  [v4 didMoveToParentViewController:self];
  v12 = [v4 view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(QLServiceViewController *)self view];
  v14 = (void *)MEMORY[0x263F08938];
  v25 = @"preview";
  v15 = [v4 view];
  v26 = v15;
  v16 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  v17 = [v14 constraintsWithVisualFormat:@"H:|[preview]|" options:0 metrics:0 views:v16];
  [v13 addConstraints:v17];

  v18 = [(QLServiceViewController *)self view];
  v19 = (void *)MEMORY[0x263F08938];
  v20 = objc_msgSend(v4, "view", @"preview");
  v24 = v20;
  v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v22 = [v19 constraintsWithVisualFormat:@"V:|[preview]|" options:0 metrics:0 views:v21];
  [v18 addConstraints:v22];

  objc_storeWeak((id *)&self->_mainViewController, v4);
}

+ (id)_serviceViewControllers
{
  if (_serviceViewControllers_onceToken != -1) {
    dispatch_once(&_serviceViewControllers_onceToken, &__block_literal_global_309);
  }
  v2 = (void *)_serviceViewControllers__serviceViewControllers;

  return v2;
}

uint64_t __50__QLServiceViewController__serviceViewControllers__block_invoke()
{
  _serviceViewControllers__serviceViewControllers = [MEMORY[0x263F08A88] weakObjectsPointerArray];

  return MEMORY[0x270F9A758]();
}

+ (id)_getServiceWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a1, "_serviceViewControllers", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        __int16 v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_registerServiceViewController
{
  id v3 = +[QLServiceViewController _serviceViewControllers];
  [v3 addPointer:self];
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 992, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_destroyWeak((id *)&self->_mainViewController);
}

@end