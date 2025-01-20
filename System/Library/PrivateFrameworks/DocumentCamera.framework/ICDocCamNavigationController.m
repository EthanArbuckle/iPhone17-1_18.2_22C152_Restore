@interface ICDocCamNavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (ICDocCamNavigationController)initWithImageCache:(id)a3 docCamDelegate:(id)a4 remoteDocCamDelegate:(id)a5;
- (int64_t)_preferredModalPresentationStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)prepareForDismissal;
@end

@implementation ICDocCamNavigationController

- (ICDocCamNavigationController)initWithImageCache:(id)a3 docCamDelegate:(id)a4 remoteDocCamDelegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (DCDebugInterfaceEnabled()) {
    v11 = &off_2642A8CA0;
  }
  else {
    v11 = off_2642A8C98;
  }
  v12 = (void *)[objc_alloc(*v11) initWithImageCache:v10];

  uint64_t v13 = objc_opt_class();
  v14 = DCDynamicCast(v13, (uint64_t)v12);
  [v14 setDelegate:v9];

  uint64_t v15 = objc_opt_class();
  v16 = DCDynamicCast(v15, (uint64_t)v12);
  [v16 setDelegate:v8];

  v20.receiver = self;
  v20.super_class = (Class)ICDocCamNavigationController;
  v17 = [(ICDocCamNavigationController *)&v20 initWithRootViewController:v12];
  v18 = v17;
  if (v17) {
    [(ICDocCamNavigationController *)v17 setModalPresentationStyle:0];
  }

  return v18;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (void)prepareForDismissal
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [(ICDocCamNavigationController *)self viewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
        uint64_t v9 = objc_opt_class();
        id v10 = DCDynamicCast(v9, (uint64_t)v8);

        if (v10) {
          [v8 prepareForDismissal];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(ICDocCamNavigationController *)self viewControllers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
        uint64_t v17 = objc_opt_class();
        v18 = DCDynamicCast(v17, (uint64_t)v16);

        if (v18) {
          [v16 prepareForDismissal];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end