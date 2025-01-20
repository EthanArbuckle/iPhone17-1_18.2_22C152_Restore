@interface BNBannerSceneComponentProvider
+ (id)delegateAssociatedWithSceneForPresentableWithUniqueIdentifier:(id)a3;
+ (void)registerDelegate:(id)a3 forSceneForPresentableWithUniqueIdentifier:(id)a4;
+ (void)unregisterDelegateForSceneForPresentableWithUniqueIdentifier:(id)a3;
- (BNBannerClientContainerViewController)containerViewController;
- (BNBannerSceneComponentProvider)initWithScene:(id)a3;
- (BNBannerSceneComponentProviderDelegate)delegate;
- (UIScene)_scene;
- (UIWindow)sceneWindow;
- (id)_actionRespondersForScene:(id)a3;
- (id)_newSceneWindowWithRootViewController:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BNBannerSceneComponentProvider

+ (void)registerDelegate:(id)a3 forSceneForPresentableWithUniqueIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11 && v7)
  {
    if (registerDelegate_forSceneForPresentableWithUniqueIdentifier__onceToken != -1) {
      dispatch_once(&registerDelegate_forSceneForPresentableWithUniqueIdentifier__onceToken, &__block_literal_global_305);
    }
    id v8 = (id)__presentableUniqueIDsToDelegates;
    objc_sync_enter(v8);
    v9 = [(id)__presentableUniqueIDsToDelegates objectForKey:v7];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, a1, @"BNBannerSource.m", 723, @"Delegate already registered for scene with unique ID '%@'", v7 object file lineNumber description];
    }
    [(id)__presentableUniqueIDsToDelegates setObject:v11 forKey:v7];
    objc_sync_exit(v8);
  }
}

uint64_t __94__BNBannerSceneComponentProvider_registerDelegate_forSceneForPresentableWithUniqueIdentifier___block_invoke()
{
  __presentableUniqueIDsToDelegates = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  return MEMORY[0x1F41817F8]();
}

+ (void)unregisterDelegateForSceneForPresentableWithUniqueIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    id v4 = (id)__presentableUniqueIDsToDelegates;
    objc_sync_enter(v4);
    [(id)__presentableUniqueIDsToDelegates removeObjectForKey:v5];
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

+ (id)delegateAssociatedWithSceneForPresentableWithUniqueIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (id)__presentableUniqueIDsToDelegates;
    objc_sync_enter(v4);
    id v5 = [(id)__presentableUniqueIDsToDelegates objectForKey:v3];
    objc_sync_exit(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_newSceneWindowWithRootViewController:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v7 = objc_opt_class();
  id v8 = WeakRetained;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = objc_loadWeakRetained((id *)&self->_scene);
    [v15 handleFailureInMethod:a2, self, @"BNBannerSource.m", 751, @"Scene is not a window scene: %@", v16 object file lineNumber description];
  }
  id v11 = off_1E63B9388;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v5 isAccessibilityIgnoringSmartInvertColors];
    if (v12) {
      id v11 = off_1E63B9380;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = (void *)[objc_alloc(*v11) initWithWindowScene:v10];
  [v13 setAccessibilityIgnoresInvertColors:v12];
  [v13 setRootViewController:v5];
  [v13 setHidden:0];

  return v13;
}

- (BNBannerSceneComponentProvider)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BNBannerSceneComponentProvider;
  id v5 = [(BNBannerSceneComponentProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BNBannerSceneComponentProvider *)v5 _setScene:v4];
  }

  return v6;
}

- (void)_setScene:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained != v4)
  {
    if (!v4)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [v6 sceneWillInvalidateForBannerSceneComponentProvider:self];
      }
    }
    uint64_t v7 = objc_msgSend(v4, "bn_presentableUniqueIdentifier");
    uint64_t v8 = [(id)objc_opt_class() delegateAssociatedWithSceneForPresentableWithUniqueIdentifier:v7];
    v9 = (void *)v8;
    if (!v4 || v8)
    {
      id v10 = objc_storeWeak((id *)&self->_scene, v4);

      if (v4 && v9)
      {
        [(BNBannerSceneComponentProvider *)self setDelegate:v9];
        [(id)objc_opt_class() unregisterDelegateForSceneForPresentableWithUniqueIdentifier:v7];
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v9 containerViewControllerForBannerSceneComponentProvider:self];
          containerViewController = self->_containerViewController;
          self->_containerViewController = v11;

          v13 = [(BNBannerSceneComponentProvider *)self _newSceneWindowWithRootViewController:self->_containerViewController];
          sceneWindow = self->_sceneWindow;
          self->_sceneWindow = v13;
        }
        else if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
        {
          -[BNBannerSceneComponentProvider _setScene:]();
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
    {
      -[BNBannerSceneComponentProvider _setScene:]();
    }
  }
}

- (void)_sceneWillInvalidate:(id)a3
{
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_containerViewController)
  {
    v9[0] = self->_containerViewController;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR)) {
      -[BNBannerSceneComponentProvider _settingsDiffActionsForScene:]();
    }
    id v5 = 0;
  }
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  return v7;
}

- (id)_actionRespondersForScene:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_containerViewController)
  {
    v9[0] = self->_containerViewController;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR)) {
      -[BNBannerSceneComponentProvider _actionRespondersForScene:]();
    }
    id v5 = 0;
  }
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  return v7;
}

- (UIWindow)sceneWindow
{
  return self->_sceneWindow;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (BNBannerSceneComponentProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNBannerSceneComponentProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BNBannerClientContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_sceneWindow, 0);
}

- (void)_setScene:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BEC04000, v0, (uint64_t)v0, "Delegate '%{public}@' is unable to provide a container view controller for scene: %{public}@", v1);
}

- (void)_setScene:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BEC04000, v0, v1, "No delegate registered for scene: %{public}@", v2);
}

- (void)_settingsDiffActionsForScene:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BEC04000, v0, v1, "%{public}s: No container view controller for scene: %{public}@", (uint8_t *)v2);
}

- (void)_actionRespondersForScene:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BEC04000, v0, v1, "%{public}s: No container view controller for scene: %{public}@", (uint8_t *)v2);
}

@end