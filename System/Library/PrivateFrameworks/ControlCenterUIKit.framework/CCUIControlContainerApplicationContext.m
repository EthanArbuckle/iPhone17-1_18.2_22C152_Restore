@interface CCUIControlContainerApplicationContext
- (CCUIControlContainerApplicationContext)initWithApplicationBundleIdentifier:(id)a3;
- (NSArray)applicationShortcuts;
- (NSString)applicationBundleIdentifier;
- (UIMenu)contextMenuForApplicationShortcuts;
- (id)_application;
- (id)_assetProvider;
- (id)_menuItemForShortcutItem:(id)a3;
- (id)_queue_fetchDynamicApplicationShortcutItems;
- (id)_queue_fetchStaticApplicationShortcutItems;
- (void)_activateApplicationForShortcutItem:(id)a3;
- (void)_fetchApplicationIfNeeded;
- (void)_queue_setFetchedDynamicMenuItems:(id)a3;
- (void)_queue_setFetchedStaticMenuItems:(id)a3;
- (void)_queue_updateDynamicApplicationShortcutsActions;
- (void)_queue_updateStaticApplicationShortcutsActions;
- (void)_updateApplicationShortcutsActionsIfNecessary;
@end

@implementation CCUIControlContainerApplicationContext

- (CCUIControlContainerApplicationContext)initWithApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUIControlContainerApplicationContext;
  v5 = [(CCUIControlContainerApplicationContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v6;

    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    menuItemsFetchQueue = v5->_menuItemsFetchQueue;
    v5->_menuItemsFetchQueue = (OS_dispatch_queue *)SerialWithQoS;

    [(CCUIControlContainerApplicationContext *)v5 _updateApplicationShortcutsActionsIfNecessary];
  }

  return v5;
}

- (NSArray)applicationShortcuts
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_fetchedStaticMenuItems) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  if (self->_fetchedDynamicMenuItems) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  return (NSArray *)v4;
}

- (UIMenu)contextMenuForApplicationShortcuts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(CCUIControlContainerApplicationContext *)self _updateApplicationShortcutsActionsIfNecessary];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CCUIControlContainerApplicationContext *)self applicationShortcuts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) menuElement];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    v10 = [MEMORY[0x1E4FB1970] menuWithChildren:v3];
  }
  else
  {
    v10 = 0;
  }

  return (UIMenu *)v10;
}

- (void)_updateApplicationShortcutsActionsIfNecessary
{
  if (!self->_fetchedStaticMenuItems)
  {
    menuItemsFetchQueue = self->_menuItemsFetchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke;
    block[3] = &unk_1E6AD41E8;
    block[4] = self;
    dispatch_async(menuItemsFetchQueue, block);
  }
  id v4 = self->_menuItemsFetchQueue;
  if (self->_fetchedDynamicMenuItems)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_3;
    v5[3] = &unk_1E6AD41E8;
    v5[4] = self;
    dispatch_sync(v4, v5);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_2;
    v6[3] = &unk_1E6AD41E8;
    v6[4] = self;
    dispatch_async(v4, v6);
  }
}

uint64_t __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateStaticApplicationShortcutsActions");
}

uint64_t __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDynamicApplicationShortcutsActions");
}

uint64_t __87__CCUIControlContainerApplicationContext__updateApplicationShortcutsActionsIfNecessary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDynamicApplicationShortcutsActions");
}

- (id)_application
{
  [(CCUIControlContainerApplicationContext *)self _fetchApplicationIfNeeded];
  application = self->_application;
  return application;
}

- (void)_fetchApplicationIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_application)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA5E90]);
    id v4 = [(CCUIControlContainerApplicationContext *)obj applicationBundleIdentifier];
    uint64_t v5 = [v3 initWithApplicationBundleIdentifier:v4];
    application = obj->_application;
    obj->_application = (SBFApplication *)v5;

    v2 = obj;
  }
  objc_sync_exit(v2);
}

- (void)_queue_updateStaticApplicationShortcutsActions
{
  BSDispatchQueueAssert();
  id v3 = [(CCUIControlContainerApplicationContext *)self _queue_fetchStaticApplicationShortcutItems];
  [(CCUIControlContainerApplicationContext *)self _queue_setFetchedStaticMenuItems:v3];
}

- (id)_queue_fetchStaticApplicationShortcutItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(CCUIControlContainerApplicationContext *)self _application];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(v4, "staticApplicationShortcutItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(CCUIControlContainerApplicationContext *)self _menuItemForShortcutItem:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_queue_updateDynamicApplicationShortcutsActions
{
  BSDispatchQueueAssert();
  id v3 = [(CCUIControlContainerApplicationContext *)self _queue_fetchDynamicApplicationShortcutItems];
  [(CCUIControlContainerApplicationContext *)self _queue_setFetchedDynamicMenuItems:v3];
}

- (id)_queue_fetchDynamicApplicationShortcutItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(CCUIControlContainerApplicationContext *)self _application];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(v4, "dynamicApplicationShortcutItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(CCUIControlContainerApplicationContext *)self _menuItemForShortcutItem:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)_menuItemForShortcutItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 icon];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v12 = v8;

    long long v13 = [v12 systemImageName];
    uint64_t v14 = [MEMORY[0x1E4FB1818] _systemImageNamed:v13];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v5;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          objc_super v11 = v10;
        }
        else {
          objc_super v11 = 0;
        }
      }
      else
      {
        objc_super v11 = 0;
      }
      id v12 = v11;

      long long v13 = [v12 systemImageName];
      uint64_t v14 = [MEMORY[0x1E4FB1818] systemImageNamed:v13];
    }
    else
    {
      id v12 = [v4 icon];
      long long v13 = [(CCUIControlContainerApplicationContext *)self _assetProvider];
      uint64_t v14 = objc_msgSend(v12, "scui_iconImageWithAssetProvider:", v13);
    }
  }
  long long v15 = (void *)v14;

  v16 = [CCUIApplicationShortcutMenuModuleItem alloc];
  uint64_t v17 = [v4 localizedTitle];
  v18 = [MEMORY[0x1E4F29128] UUID];
  v19 = [v18 UUIDString];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke;
  v37[3] = &unk_1E6AD47A8;
  objc_copyWeak(&v39, &location);
  id v20 = v4;
  id v38 = v20;
  v21 = [(CCUIMenuModuleItem *)v16 initWithTitle:v17 identifier:v19 handler:v37];

  v22 = [v20 localizedSubtitle];
  [(CCUIMenuModuleItem *)v21 setSubtitle:v22];

  [(CCUIApplicationShortcutMenuModuleItem *)v21 setIcon:v15];
  v23 = (void *)MEMORY[0x1E4FB13F0];
  v24 = [(CCUIMenuModuleItem *)v21 title];
  v25 = [(CCUIApplicationShortcutMenuModuleItem *)v21 icon];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke_2;
  v35 = &unk_1E6AD44F8;
  v26 = v21;
  v36 = v26;
  v27 = [v23 actionWithTitle:v24 image:v25 identifier:0 handler:&v32];

  v28 = [(CCUIMenuModuleItem *)v26 subtitle];

  if (v28)
  {
    v29 = [(CCUIMenuModuleItem *)v26 subtitle];
    [v27 setSubtitle:v29];
  }
  v30 = [[CCUIContextMenuItem alloc] initWithMenuElement:v27];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  return v30;
}

uint64_t __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _activateApplicationForShortcutItem:*(void *)(a1 + 32)];

  return 1;
}

uint64_t __67__CCUIControlContainerApplicationContext__menuItemForShortcutItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (id)_assetProvider
{
  assetProvider = self->_assetProvider;
  if (!assetProvider)
  {
    id v4 = [(CCUIControlContainerApplicationContext *)self _application];
    id v5 = objc_alloc(MEMORY[0x1E4F9F798]);
    uint64_t v6 = [v4 bundleURL];
    id v7 = (SCUIAssetProvider *)[v5 initWithBundleURL:v6];
    uint64_t v8 = self->_assetProvider;
    self->_assetProvider = v7;

    assetProvider = self->_assetProvider;
  }
  return assetProvider;
}

- (void)_activateApplicationForShortcutItem:(id)a3
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 bundleIdentifierToLaunch];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(CCUIControlContainerApplicationContext *)self applicationBundleIdentifier];
  }
  uint64_t v8 = v7;

  BOOL v9 = [v4 activationMode] == 1;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB17F0]) initWithSBSShortcutItem:v4];

  v20[0] = *MEMORY[0x1E4F625F8];
  objc_super v11 = [NSNumber numberWithBool:v9];
  v21[0] = v11;
  v20[1] = *MEMORY[0x1E4F625E0];
  v19 = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  uint64_t v13 = *MEMORY[0x1E4F62688];
  v21[1] = v12;
  v21[2] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = *MEMORY[0x1E4F626A0];
  v20[2] = v13;
  v20[3] = v14;
  v20[4] = *MEMORY[0x1E4F62658];
  v21[3] = MEMORY[0x1E4F1CC38];
  v21[4] = @"CCUIAppLaunchOriginControlCenterControl";
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];

  v16 = [CCUIContentModuleContext alloc];
  uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
  v18 = [(CCUIContentModuleContext *)v16 initWithModuleIdentifier:v8 uniqueIdentifier:v17];

  [(CCUIContentModuleContext *)v18 openApplication:v8 withOptions:v15 completionHandler:0];
}

- (void)_queue_setFetchedStaticMenuItems:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  BSDispatchQueueAssert();
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchedStaticMenuItems != v6) {
    objc_storeStrong((id *)&v5->_fetchedStaticMenuItems, a3);
  }
  objc_sync_exit(v5);
}

- (void)_queue_setFetchedDynamicMenuItems:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  BSDispatchQueueAssert();
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_fetchedDynamicMenuItems != v6) {
    objc_storeStrong((id *)&v5->_fetchedDynamicMenuItems, a3);
  }
  objc_sync_exit(v5);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsFetchQueue, 0);
  objc_storeStrong((id *)&self->_fetchedDynamicMenuItems, 0);
  objc_storeStrong((id *)&self->_fetchedStaticMenuItems, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end