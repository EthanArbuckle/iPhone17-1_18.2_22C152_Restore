@interface CKSceneDelegate
+ (Class)containerClassForType:(int64_t)a3;
+ (id)stateFromUserInfoDictionary:(id)a3;
+ (id)userInfoDictionaryForState:(id)a3;
- (CKConversation)conversation;
- (CKMacToolbarController)toolbarController;
- (CKSceneDelegate)init;
- (UIWindow)window;
- (UIWindowScene)scene;
- (id)canActivatePredicate;
- (id)predicateMatchingConversation:(id)a3;
- (id)prefersToActivatePredicate;
- (id)stateRestorationActivityForScene:(id)a3;
- (int64_t)type;
- (void)_scene:(id)a3 openItemProviders:(id)a4;
- (void)installDebugHandlerForScene:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setToolbarController:(id)a3;
- (void)setWindow:(id)a3;
- (void)showDebugMenu;
- (void)showInspectorViewForChatItems:(id)a3 parallelIndexes:(id)a4;
- (void)showInspectorViewForConversations:(id)a3;
- (void)showInspectorViewForMessage:(id)a3;
- (void)updateSceneActivationConditions;
- (void)updateSceneTitleForConversation:(id)a3;
@end

@implementation CKSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = [v9 session];
      v16 = [v15 persistentIdentifier];
      *(_DWORD *)buf = 138412802;
      id v29 = v14;
      __int16 v30 = 2080;
      v31 = "-[CKSceneDelegate scene:willConnectToSession:options:]";
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "%@: %s %@", buf, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v10;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Session: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v10 stateRestorationActivity];
      v20 = [v19 activityType];
      v21 = [v10 stateRestorationActivity];
      *(_DWORD *)buf = 138412546;
      id v29 = v20;
      __int16 v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Session state restoration activity: %@ %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v11;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Connection options: %@", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"CKSceneDelegate.m", 100, @"Invalid parameter not satisfying: %@", @"[scene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  id v23 = objc_storeWeak((id *)&self->_scene, v9);
  [(CKSceneDelegate *)self installDebugHandlerForScene:v9];

  v24 = [(CKSceneDelegate *)self window];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  [v24 setWindowScene:WeakRetained];

  v26 = [(CKSceneDelegate *)self window];
  [v26 makeKeyAndVisible];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)installDebugHandlerForScene:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v9 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v10, &location);
      v8 = objc_msgSend(v7, "statusBarManager", v9, 3221225472, __47__CKSceneDelegate_installDebugHandlerForScene___block_invoke, &unk_1E56215C8);
      [v8 setDebugMenuHandler:&v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (CKSceneDelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKSceneDelegate;
  v2 = [(CKSceneDelegate *)&v7 init];
  if (v2)
  {
    v3 = +[CKUIBehavior sharedBehaviors];
    id v4 = (UIWindow *)objc_alloc_init((Class)[v3 windowClass]);
    window = v2->_window;
    v2->_window = v4;
  }
  return v2;
}

- (void)sceneWillEnterForeground:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v7 = [v3 session];
      v8 = [v7 persistentIdentifier];
      int v9 = 138412802;
      id v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[CKSceneDelegate sceneWillEnterForeground:]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v7 = [v3 session];
      v8 = [v7 persistentIdentifier];
      int v9 = 138412802;
      id v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[CKSceneDelegate sceneDidBecomeActive:]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

+ (Class)containerClassForType:(int64_t)a3
{
  if (a3 && a3 != 1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CKSceneDelegate.m", 68, @"+containerClassForType: should not be called for scene delegate type: %zd", a3);
  }
  objc_super v7 = objc_opt_class();

  return (Class)v7;
}

- (int64_t)type
{
  return -1;
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = [v4 session];
      int v9 = [v8 persistentIdentifier];
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2080;
      v16 = "-[CKSceneDelegate sceneDidDisconnect:]";
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v13, 0x20u);
    }
  }
  toolbarController = self->_toolbarController;
  if (toolbarController)
  {
    [(CKMacToolbarController *)toolbarController removeItemProviders];
    __int16 v11 = self->_toolbarController;
    self->_toolbarController = 0;
  }
  v12 = [(CKSceneDelegate *)self window];
  [v12 setWindowScene:0];

  objc_storeWeak((id *)&self->_scene, 0);
}

- (void)sceneWillResignActive:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = [v3 session];
      v8 = [v7 persistentIdentifier];
      int v9 = 138412802;
      id v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[CKSceneDelegate sceneWillResignActive:]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = [v3 session];
      v8 = [v7 persistentIdentifier];
      int v9 = 138412802;
      id v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[CKSceneDelegate sceneDidEnterBackground:]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void __47__CKSceneDelegate_installDebugHandlerForScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showDebugMenu];
}

- (void)showDebugMenu
{
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (v4)
  {
    id v7 = +[DebugInspectorContainerViewControllerFactory debugMenuViewController];
    v5 = [(CKSceneDelegate *)self window];
    id v6 = [v5 rootViewController];
    [v6 presentViewController:v7 animated:1 completion:0];
  }
}

- (void)showInspectorViewForMessage:(id)a3
{
  id v9 = a3;
  int v4 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v5 = [v4 isInternalInstall];

  if (v5)
  {
    id v6 = +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForMessage:v9];
    id v7 = [(CKSceneDelegate *)self window];
    v8 = [v7 rootViewController];
    [v8 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)showInspectorViewForConversations:(id)a3
{
  id v9 = a3;
  int v4 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v5 = [v4 isInternalInstall];

  if (v5)
  {
    id v6 = +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForConversations:v9];
    id v7 = [(CKSceneDelegate *)self window];
    v8 = [v7 rootViewController];
    [v8 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)showInspectorViewForChatItems:(id)a3 parallelIndexes:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v8 = [v7 isInternalInstall];

  if (v8)
  {
    id v9 = +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForChatItems:v12 parallelIndexes:v6];
    id v10 = [(CKSceneDelegate *)self window];
    __int16 v11 = [v10 rootViewController];
    [v11 presentViewController:v9 animated:1 completion:0];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v5 session];
      __int16 v11 = [v10 persistentIdentifier];
      int v13 = 138412802;
      id v14 = v9;
      __int16 v15 = 2080;
      v16 = "-[CKSceneDelegate scene:openURLContexts:]";
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v13, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "URL Contexts: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v5 session];
      __int16 v11 = [v10 persistentIdentifier];
      int v13 = 138412802;
      id v14 = v9;
      __int16 v15 = 2080;
      v16 = "-[CKSceneDelegate _scene:openItemProviders:]";
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v13, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Item Providers: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)stateRestorationActivityForScene:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      int v8 = [v4 session];
      id v9 = [v8 persistentIdentifier];
      *(_DWORD *)buf = 138412802;
      id v17 = v7;
      __int16 v18 = 2080;
      uint64_t v19 = "-[CKSceneDelegate stateRestorationActivityForScene:]";
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%@: %s %@", buf, 0x20u);
    }
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.Messages.StateRestoration"];
  __int16 v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[CKSceneDelegate type](self, "type", @"CKCanvasStateRestorationContainerType"));
  __int16 v15 = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  [v10 addUserInfoEntriesFromDictionary:v12];

  return v10;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v5 session];
      __int16 v11 = [v10 persistentIdentifier];
      int v14 = 138412802;
      id v15 = v9;
      __int16 v16 = 2080;
      id v17 = "-[CKSceneDelegate scene:continueUserActivity:]";
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v14, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = [v6 activityType];
      int v14 = 138412546;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = (const char *)v6;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "User activity: %@ %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

+ (id)userInfoDictionaryForState:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = 0;
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v11 = v3;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Failed archiving scene state: %@, error: %@", buf, 0x16u);
      }
    }
    id v7 = 0;
  }
  else
  {
    int v14 = @"CKCanvasStateRestorationContainerState";
    v15[0] = v4;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }

  return v7;
}

+ (id)stateFromUserInfoDictionary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"CKCanvasStateRestorationContainerState"];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DC0];
    id v6 = +[CKSceneDelegateState unarchivingClasses];
    id v12 = 0;
    id v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v12];
    id v8 = v12;

    if (!v8) {
      goto LABEL_13;
    }
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Failed unarchiving scene state data: %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Didn't find scene state data in userInfo dictionary: %@", buf, 0xCu);
    }
  }
  id v7 = 0;
LABEL_13:

  return v7;
}

- (void)updateSceneActivationConditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(CKSceneDelegate *)self scene];
      id v5 = [v4 session];
      id v6 = [v5 persistentIdentifier];
      int v15 = 138412546;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Updating scene activation conditions for scene: %@ %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F42D60]);
  id v8 = [(CKSceneDelegate *)self canActivatePredicate];
  [v7 setCanActivateForTargetContentIdentifierPredicate:v8];

  id v9 = [(CKSceneDelegate *)self prefersToActivatePredicate];
  [v7 setPrefersToActivateForTargetContentIdentifierPredicate:v9];

  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v7 canActivateForTargetContentIdentifierPredicate];
      int v15 = 138412290;
      __int16 v16 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "canActivateForTargetContentIdentifierPredicate: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v7 prefersToActivateForTargetContentIdentifierPredicate];
      int v15 = 138412290;
      __int16 v16 = v13;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "prefersToActivateForTargetContentIdentifierPredicate: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v14 = [(CKSceneDelegate *)self scene];
  [v14 setActivationConditions:v7];
}

- (id)canActivatePredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
}

- (id)prefersToActivatePredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (id)predicateMatchingConversation:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Creating preferred activation predicate for conversation: %@", buf, 0xCu);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v3 groupID];
  if ([v6 length])
  {
    id v7 = [NSString stringWithFormat:@"sms:%@", v6];
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self beginswith[cd] %@", v7];
    [v5 addObject:v8];
    id v9 = [NSString stringWithFormat:@"groupid=%@", v6];
    id v10 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    id v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];

    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self beginswith[c] 'sms://' AND (self contains[cd] %@ OR self contains[cd] %@)", v9, v11];
    [v5 addObject:v12];
  }
  id v13 = [v3 recipient];

  if (v13)
  {
    id v14 = [v3 recipient];
    int v15 = [v14 defaultIMHandle];
    __int16 v16 = [v15 ID];

    __int16 v17 = [NSString stringWithFormat:@"recipient=%@", v16];
    __int16 v18 = NSString;
    uint64_t v19 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    uint64_t v20 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v19];
    v21 = [v18 stringWithFormat:@"recipient=%@", v20];

    uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self beginswith[c] 'sms://' AND (self contains[cd] %@ OR self contains[cd] %@)", v17, v21];
    [v5 addObject:v22];
  }
  if ([v5 count])
  {
    id v23 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (void)updateSceneTitleForConversation:(id)a3
{
  id v4 = a3;
  if ([v4 hasDisplayName]) {
    [v4 displayName];
  }
  else {
  id v6 = [v4 name];
  }

  id v5 = [(CKSceneDelegate *)self scene];
  [v5 setTitle:v6];
}

- (UIWindowScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIWindowScene *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (CKMacToolbarController)toolbarController
{
  return self->_toolbarController;
}

- (void)setToolbarController:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_destroyWeak((id *)&self->_scene);
}

@end