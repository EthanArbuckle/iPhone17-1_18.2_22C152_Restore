@interface CCUIAppLauncherViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldRequestAuthenticationForTransitionToExpandedContent;
- (CCUIAppLauncherModule)module;
- (id)_assetProvider;
- (id)_menuItemForShortcutItem:(id)a3;
- (id)leadingImageForMenuItem:(id)a3;
- (void)_activateApplicationForShortcutItem:(id)a3;
- (void)_queue_setFetchedMenuItems:(id)a3;
- (void)_queue_updateApplicationShortcutsActions;
- (void)_updateApplicationShortcutsActionsIfNecessary;
- (void)_updateWithFetchedMenuItemsIfNecessary;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)buttonTouchDown:(id)a3 forEvent:(id)a4;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)requestAuthenticationForTransitionToExpandedContentModuleWithCompletionHandler:(id)a3;
- (void)setModule:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willResignActive;
@end

@implementation CCUIAppLauncherViewController

- (void)buttonTouchDown:(id)a3 forEvent:(id)a4
{
  v5 = objc_msgSend(a4, "allTouches", a3);
  v6 = [v5 anyObject];
  uint64_t v7 = [v6 type];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  [WeakRetained handleTouchDownWithTouchType:v7];
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  v5 = objc_msgSend(a4, "allTouches", a3);
  v6 = [v5 anyObject];
  uint64_t v7 = [v6 type];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  [WeakRetained handleTapWithTouchType:v7];
}

- (id)leadingImageForMenuItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 icon];

  return v8;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)CCUIAppLauncherViewController;
  [(CCUIMenuModuleViewController *)&v9 viewDidLoad];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  uint64_t v4 = [WeakRetained iconGlyph];
  [(CCUIMenuModuleViewController *)self setGlyphImage:v4];

  id v5 = objc_loadWeakRetained((id *)&self->_module);
  v6 = [v5 displayName];
  [(CCUIMenuModuleViewController *)self setTitle:v6];

  [(CCUIButtonModuleViewController *)self setValueText:0];
  [(CCUIButtonModuleViewController *)self setSelectedValueText:0];
  [(CCUIMenuModuleViewController *)self setIndentation:3];
  SerialWithQoS = (OS_dispatch_queue *)BSDispatchQueueCreateSerialWithQoS();
  menuItemsFetchQueue = self->_menuItemsFetchQueue;
  self->_menuItemsFetchQueue = SerialWithQoS;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIAppLauncherViewController;
  [(CCUIMenuModuleViewController *)&v4 viewDidAppear:a3];
  [(CCUIAppLauncherViewController *)self _updateApplicationShortcutsActionsIfNecessary];
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  int v4 = [WeakRetained supportsApplicationShortcuts];

  if (v4)
  {
    [(CCUIAppLauncherViewController *)self _updateApplicationShortcutsActionsIfNecessary];
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__CCUIAppLauncherViewController_shouldBeginTransitionToExpandedContentModule__block_invoke;
    v8[3] = &unk_1E6AD4780;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(menuItemsFetchQueue, v8);
    [(CCUIAppLauncherViewController *)self _updateWithFetchedMenuItemsIfNecessary];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __77__CCUIAppLauncherViewController_shouldBeginTransitionToExpandedContentModule__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1280) count])
  {
    uint64_t result = 1;
  }
  else
  {
    v3.receiver = *(id *)(a1 + 32);
    v3.super_class = (Class)CCUIAppLauncherViewController;
    uint64_t result = (uint64_t)objc_msgSendSuper2(&v3, sel_shouldBeginTransitionToExpandedContentModule);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIAppLauncherViewController;
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](&v7, sel_didTransitionToExpandedContentMode_);
  if (v3)
  {
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__CCUIAppLauncherViewController_didTransitionToExpandedContentMode___block_invoke;
    block[3] = &unk_1E6AD41E8;
    block[4] = self;
    dispatch_async(menuItemsFetchQueue, block);
  }
  else
  {
    [(CCUIAppLauncherViewController *)self _updateApplicationShortcutsActionsIfNecessary];
  }
}

uint64_t __68__CCUIAppLauncherViewController_didTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setFetchedMenuItems:", 0);
}

- (BOOL)shouldRequestAuthenticationForTransitionToExpandedContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  char v3 = [WeakRetained requestAuthenticationForExpandedModule];

  return v3;
}

- (void)requestAuthenticationForTransitionToExpandedContentModuleWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v8 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
    int v6 = [WeakRetained requestAuthenticationForExpandedModule];

    if (v6)
    {
      objc_super v7 = [(CCUIMenuModuleViewController *)self contentModuleContext];
      [v7 requestAuthenticationWithCompletionHandler:v8];
    }
    else
    {
      v8[2](v8, 1);
    }
    int v4 = v8;
  }
}

- (void)willResignActive
{
  menuItemsFetchQueue = self->_menuItemsFetchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CCUIAppLauncherViewController_willResignActive__block_invoke;
  block[3] = &unk_1E6AD41E8;
  block[4] = self;
  dispatch_async(menuItemsFetchQueue, block);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__CCUIAppLauncherViewController_willResignActive__block_invoke_2;
  v4[3] = &unk_1E6AD41E8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
}

uint64_t __49__CCUIAppLauncherViewController_willResignActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setFetchedMenuItems:", 0);
}

uint64_t __49__CCUIAppLauncherViewController_willResignActive__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMenuItems:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (void)_updateApplicationShortcutsActionsIfNecessary
{
  if (!self->_fetchedMenuItems)
  {
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__CCUIAppLauncherViewController__updateApplicationShortcutsActionsIfNecessary__block_invoke;
    block[3] = &unk_1E6AD41E8;
    block[4] = self;
    dispatch_async(menuItemsFetchQueue, block);
  }
}

uint64_t __78__CCUIAppLauncherViewController__updateApplicationShortcutsActionsIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateApplicationShortcutsActions");
}

- (void)_queue_setFetchedMenuItems:(id)a3
{
  int v6 = (NSArray *)a3;
  BSDispatchQueueAssert();
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchedMenuItems != v6) {
    objc_storeStrong((id *)&v5->_fetchedMenuItems, a3);
  }
  objc_sync_exit(v5);
}

- (void)_updateWithFetchedMenuItemsIfNecessary
{
  BSDispatchQueueAssertMain();
  if (self->_fetchedMenuItems)
  {
    if (![(CCUIMenuModuleViewController *)self menuItemCount])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __71__CCUIAppLauncherViewController__updateWithFetchedMenuItemsIfNecessary__block_invoke;
      v3[3] = &unk_1E6AD41E8;
      v3[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
    }
  }
}

uint64_t __71__CCUIAppLauncherViewController__updateWithFetchedMenuItemsIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMenuItems:*(void *)(*(void *)(a1 + 32) + 1280)];
}

- (void)_queue_updateApplicationShortcutsActions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  id v5 = [WeakRetained _application];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v6 = [v5 staticApplicationShortcutItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(CCUIAppLauncherViewController *)self _menuItemForShortcutItem:*(void *)(*((void *)&v23 + 1) + 8 * v10)];
        [v3 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v12 = [v5 dynamicApplicationShortcutItems];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [(CCUIAppLauncherViewController *)self _menuItemForShortcutItem:*(void *)(*((void *)&v19 + 1) + 8 * v16)];
        [v3 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  [(CCUIAppLauncherViewController *)self _queue_setFetchedMenuItems:v3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CCUIAppLauncherViewController__queue_updateApplicationShortcutsActions__block_invoke;
  block[3] = &unk_1E6AD41E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__CCUIAppLauncherViewController__queue_updateApplicationShortcutsActions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithFetchedMenuItemsIfNecessary];
}

- (id)_assetProvider
{
  assetProvider = self->_assetProvider;
  if (!assetProvider)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
    id v5 = [WeakRetained _application];

    id v6 = objc_alloc(MEMORY[0x1E4F9F798]);
    uint64_t v7 = [v5 bundleURL];
    uint64_t v8 = (SCUIAssetProvider *)[v6 initWithBundleURL:v7];
    uint64_t v9 = self->_assetProvider;
    self->_assetProvider = v8;

    assetProvider = self->_assetProvider;
  }
  return assetProvider;
}

- (id)_menuItemForShortcutItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 icon];
  id v6 = [(CCUIAppLauncherViewController *)self _assetProvider];
  uint64_t v7 = objc_msgSend(v5, "scui_iconImageWithAssetProvider:", v6);

  uint64_t v8 = [CCUIAppShortcutMenuModuleItem alloc];
  uint64_t v9 = [v4 localizedTitle];
  uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__CCUIAppLauncherViewController__menuItemForShortcutItem___block_invoke;
  v16[3] = &unk_1E6AD47A8;
  objc_copyWeak(&v18, &location);
  id v12 = v4;
  id v17 = v12;
  uint64_t v13 = [(CCUIMenuModuleItem *)v8 initWithTitle:v9 identifier:v11 handler:v16];

  uint64_t v14 = [v12 localizedSubtitle];
  [(CCUIMenuModuleItem *)v13 setSubtitle:v14];

  [(CCUIAppShortcutMenuModuleItem *)v13 setIcon:v7];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v13;
}

uint64_t __58__CCUIAppLauncherViewController__menuItemForShortcutItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _activateApplicationForShortcutItem:*(void *)(a1 + 32)];

  return 1;
}

- (void)_activateApplicationForShortcutItem:(id)a3
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 bundleIdentifierToLaunch];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
    id v7 = [WeakRetained applicationIdentifier];
  }
  BOOL v9 = [v4 activationMode] == 1;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB17F0]) initWithSBSShortcutItem:v4];

  v19[0] = *MEMORY[0x1E4F625F8];
  uint64_t v11 = [NSNumber numberWithBool:v9];
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E4F625E0];
  id v18 = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  uint64_t v13 = *MEMORY[0x1E4F626A0];
  v19[2] = *MEMORY[0x1E4F62688];
  v19[3] = v13;
  v19[4] = *MEMORY[0x1E4F62658];
  v20[1] = v12;
  v20[2] = MEMORY[0x1E4F1CC38];
  v20[3] = MEMORY[0x1E4F1CC38];
  v20[4] = @"CCUIAppLaunchOriginControlCenter";
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];

  id v15 = objc_loadWeakRetained((id *)&self->_module);
  uint64_t v16 = [v15 contentModuleContext];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__CCUIAppLauncherViewController__activateApplicationForShortcutItem___block_invoke;
  v17[3] = &unk_1E6AD4480;
  v17[4] = self;
  [v16 openApplication:v7 withOptions:v14 completionHandler:v17];
}

void __69__CCUIAppLauncherViewController__activateApplicationForShortcutItem___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1288));
    uint64_t v2 = [WeakRetained contentModuleContext];
    [v2 dismissModule];
  }
}

- (CCUIAppLauncherModule)module
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  return (CCUIAppLauncherModule *)WeakRetained;
}

- (void)setModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_module);
  objc_storeStrong((id *)&self->_fetchedMenuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsFetchQueue, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
}

@end