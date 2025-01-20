@interface CKMessagesSceneDelegate
- (BOOL)_messageUnknownFilteringEnabled;
- (BOOL)_shouldShowMadridRegistrationView;
- (BOOL)handlingLaunchTask;
- (BOOL)isLocked;
- (BOOL)isSuspended;
- (BOOL)shouldShowRegistrationOverride;
- (BOOL)willPresentRegistrationViewController;
- (CKMessagesController)messagesController;
- (CKMessagesSceneDelegate)init;
- (CKRegistrationViewController)madridRegistrationController;
- (CKSceneDelegateState)storedState;
- (NSSet)alertSuppressionContexts;
- (id)_oldInputContextIdentifiers;
- (id)canActivatePredicate;
- (id)conversation;
- (id)prefersToActivatePredicate;
- (id)sharedConversationList;
- (id)stateRestorationActivityForScene:(id)a3;
- (int64_t)type;
- (void)__showMadridRegistrationViewIfNecessary;
- (void)__updateAppSnapshot;
- (void)_cancelPendingAppSnapshotUpdate;
- (void)_chatItemsDidChange:(id)a3;
- (void)_clearOldInputContextIdentifiersIfNeeded;
- (void)_conversationFilteringStateChangedNotification:(id)a3;
- (void)_createMadridRegistrationViewIfNecessary;
- (void)_destroyMadridRegistrationView;
- (void)_handleAccountsChanged:(id)a3;
- (void)_handleDaemonConnected:(id)a3;
- (void)_handleDaemonDisconnected:(id)a3;
- (void)_madridRegistrationControllerDidComplete;
- (void)_mainThread_updateMadridRegistrationViewAnimated:(BOOL)a3;
- (void)_prepareForResume:(BOOL)a3;
- (void)_prepareForSuspend;
- (void)_scene:(id)a3 openItemProviders:(id)a4;
- (void)_scheduleDeferredSetup;
- (void)_showMadridRegistrationViewIfNecessary;
- (void)_updateAppSnapshot;
- (void)_updateMadridRegistrationViewAnimated:(BOOL)a3;
- (void)_updateStoredState;
- (void)_updateStoredStateSuspendTime:(id)a3;
- (void)dealloc;
- (void)messagesController:(id)a3 didUpdateCurrentConversation:(id)a4;
- (void)presentOnboardingViewControllerIfNeeded;
- (void)processAppleEventDictionary:(id)a3;
- (void)processLaunchEventContext:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setHandlingLaunchTask:(BOOL)a3;
- (void)setLocked:(BOOL)a3;
- (void)setMadridRegistrationController:(id)a3;
- (void)setShouldShowRegistrationOverride:(BOOL)a3;
- (void)setStoredState:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setWillPresentRegistrationViewController:(BOOL)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation CKMessagesSceneDelegate

- (void)_madridRegistrationControllerDidComplete
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "First run controller finished. Dismissing and restoring state", buf, 2u);
    }
  }
  if ([(CKRegistrationViewController *)self->_madridRegistrationController isViewLoaded])
  {
    v4 = [(CKMessagesSceneDelegate *)self messagesController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__CKMessagesSceneDelegate__madridRegistrationControllerDidComplete__block_invoke;
    v7[3] = &unk_1E5620C40;
    v7[4] = self;
    [v4 dismissViewControllerAnimated:1 completion:v7];
  }
  else
  {
    [(CKMessagesSceneDelegate *)self _destroyMadridRegistrationView];
    v5 = [(CKMessagesSceneDelegate *)self storedState];
    v6 = [(CKMessagesSceneDelegate *)self messagesController];
    +[CKUserActivityHandler restoreState:v5 navigationProvider:v6];

    [(CKMessagesSceneDelegate *)self presentOnboardingViewControllerIfNeeded];
  }
}

- (void)presentOnboardingViewControllerIfNeeded
{
  v3 = [(CKMessagesSceneDelegate *)self messagesController];
  int v4 = [v3 shouldPresentOnboarding];

  if (v4)
  {
    id v5 = [(CKMessagesSceneDelegate *)self messagesController];
    [v5 presentOnboardingViewControllerIfNeeded];
  }
}

- (CKMessagesSceneDelegate)init
{
  v15.receiver = self;
  v15.super_class = (Class)CKMessagesSceneDelegate;
  v2 = [(CKSceneDelegate *)&v15 init];
  if (v2)
  {
    v3 = objc_alloc_init(CKMessagesController);
    messagesController = v2->_messagesController;
    v2->_messagesController = v3;

    id v5 = [(CKMessagesSceneDelegate *)v2 messagesController];
    [v5 setMessagesControllerDelegate:v2];

    v6 = [(CKSceneDelegate *)v2 window];
    v7 = [(CKMessagesSceneDelegate *)v2 messagesController];
    [v6 setRootViewController:v7];

    if (([MEMORY[0x1E4F6BDC0] smsEnabled] & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:v2 selector:sel__handleAccountsChanged_ name:*MEMORY[0x1E4F6B820] object:0];
    }
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__handleDaemonConnected_ name:*MEMORY[0x1E4F6BAC8] object:0];
    [v9 addObserver:v2 selector:sel__handleDaemonDisconnected_ name:*MEMORY[0x1E4F6BAD0] object:0];
    [v9 addObserver:v2 selector:sel__chatItemsDidChange_ name:*MEMORY[0x1E4F6B8D8] object:0];
    [v9 addObserver:v2 selector:sel__conversationFilteringStateChangedNotification_ name:CKMessageFilteringChangedNotification[0] object:0];
    [v9 addObserver:v2 selector:sel__conversationFilteringStateChangedNotification_ name:CKMessageSpamFilteringChangedNotification object:0];
    [v9 addObserver:v2 selector:sel__updateStoredStateSuspendTime_ name:@"CKAudioControllerStoppedPlaybackNotification" object:0];
    v10 = dispatch_get_global_queue(25, 0);
    dispatch_async(v10, &__block_literal_global_268);

    v11 = +[CKLinkIntentsManager sharedManager];
    v12 = [(CKMessagesSceneDelegate *)v2 messagesController];
    [v11 registerMessagesNavigator:v12];

    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_shouldShowRegistrationOverride = [v13 BOOLForKey:@"AlwaysShowMadridRegistration"];
  }
  return v2;
}

- (CKMessagesController)messagesController
{
  return self->_messagesController;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "scene %@ will connect to session: %@", buf, 0x16u);
    }
  }
  v12 = [v10 URLContexts];
  v13 = [v10 _itemProviderCollections];
  if ([v12 count] || objc_msgSend(v13, "count"))
  {
    if ([v12 count]) {
      [(CKMessagesSceneDelegate *)self scene:v8 openURLContexts:v12];
    }
    if ([v13 count]) {
      [(CKMessagesSceneDelegate *)self _scene:v8 openItemProviders:v13];
    }
  }
  else if (![(CKMessagesSceneDelegate *)self handlingLaunchTask])
  {
    v20 = [v10 shortcutItem];

    if (v20)
    {
      v21 = [v10 shortcutItem];
      v22 = [(CKMessagesSceneDelegate *)self messagesController];
      v23 = [(CKMessagesSceneDelegate *)self messagesController];
      v24 = [v23 chatController];
      +[CKShortcutHandler performActionForShortcutItem:v21 navigationProvider:v22 chatController:v24 completion:&__block_literal_global_114_4];
    }
    else
    {
      v21 = [v10 userActivities];
      v25 = [v9 stateRestorationActivity];
      +[CKUserActivityHandler messagesScene:v8 willConnectToSession:v9 userActivities:v21 stateRestorationActivity:v25 windowSceneDelegate:self];
    }
  }
  [(CKMessagesSceneDelegate *)self _scheduleDeferredSetup];
  v26.receiver = self;
  v26.super_class = (Class)CKMessagesSceneDelegate;
  [(CKSceneDelegate *)&v26 scene:v8 willConnectToSession:v9 options:v10];
  v14 = [MEMORY[0x1E4F42738] sharedApplication];
  objc_super v15 = [v14 pendingAppleEventInfoDictionary];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F42738] sharedApplication];
    [v16 setPendingAppleEventInfoDictionary:0];

    [(CKMessagesSceneDelegate *)self processAppleEventDictionary:v15];
  }
  v17 = [MEMORY[0x1E4F42738] sharedApplication];
  v18 = [v17 pendingLaunchEventContext];

  if (v18)
  {
    v19 = [MEMORY[0x1E4F42738] sharedApplication];
    [v19 setPendingLaunchEventContext:0];

    [(CKMessagesSceneDelegate *)self processLaunchEventContext:v18];
  }
}

- (BOOL)handlingLaunchTask
{
  return self->_handlingLaunchTask;
}

- (void)_scheduleDeferredSetup
{
  id v2 = [(CKMessagesSceneDelegate *)self messagesController];
  [v2 performSelector:sel_performResumeDeferredSetup withObject:0 afterDelay:0.0];
}

- (void)sceneWillEnterForeground:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessagesSceneDelegate;
  [(CKSceneDelegate *)&v5 sceneWillEnterForeground:a3];
  int v4 = [MEMORY[0x1E4F42738] sharedApplication];
  -[CKMessagesSceneDelegate _prepareForResume:](self, "_prepareForResume:", [v4 systemIsAnimatingApplicationLifecycleEvent]);
}

- (void)_prepareForResume:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = @"NO";
      if (v3) {
        v6 = @"YES";
      }
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "prepareForResume, animating %@", (uint8_t *)&v18, 0xCu);
    }
  }
  v7 = +[CKPluginExtensionStateObserver _sharedInstanceIfInitialized];
  [v7 prepareForResume];

  if ([(CKMessagesSceneDelegate *)self isSuspended])
  {
    CKResetCachedUserSettings();
    IMResetCachedUserSettings();
    IMResetCachedCarrierSettings();
    id v8 = [MEMORY[0x1E4F6E668] sharedInstance];
    [v8 resetCacheSubscriptionInfo];

    if (CKiMessageSupported())
    {
      id v9 = [MEMORY[0x1E4F6BC98] sharedInstance];
      [v9 blockUntilConnected];
    }
    id v10 = [(CKMessagesSceneDelegate *)self messagesController];
    [v10 prepareForResume];

    [(CKMessagesSceneDelegate *)self _scheduleDeferredSetup];
    if ([(CKMessagesSceneDelegate *)self _shouldShowMadridRegistrationView])
    {
      [(CKMessagesSceneDelegate *)self _updateMadridRegistrationViewAnimated:1];
    }
    else if (![(CKMessagesSceneDelegate *)self handlingLaunchTask])
    {
      v11 = [(CKMessagesSceneDelegate *)self storedState];
      v12 = [(CKMessagesSceneDelegate *)self messagesController];
      +[CKUserActivityHandler restoreState:v11 navigationProvider:v12];
    }
    [(CKMessagesSceneDelegate *)self setHandlingLaunchTask:0];
    v13 = [(CKMessagesSceneDelegate *)self messagesController];
    objc_msgSend(v13, "parentControllerDidResume:animating:", -[CKMessagesSceneDelegate isLocked](self, "isLocked"), v3);

    [(CKMessagesSceneDelegate *)self setLocked:0];
    [(CKMessagesSceneDelegate *)self setSuspended:0];
    v14 = [(CKMessagesSceneDelegate *)self messagesController];
    objc_super v15 = [v14 currentConversation];
    [v15 updateUserActivity];

    [(CKSceneDelegate *)self updateSceneActivationConditions];
    v16 = [MEMORY[0x1E4F42738] sharedApplication];
    [v16 _clearFailureBadge];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CKClientDidResumeNotification", 0, 0, 1u);
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[CKMessagesSceneDelegate sceneDidBecomeActive:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CKMessagesSceneDelegate;
  [(CKSceneDelegate *)&v7 sceneDidBecomeActive:v4];
  if (![(CKMessagesSceneDelegate *)self isSuspended])
  {
    v6 = [(CKMessagesSceneDelegate *)self messagesController];
    [v6 parentControllerDidBecomeActive];
  }
  [(CKMessagesSceneDelegate *)self _showMadridRegistrationViewIfNecessary];
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)_showMadridRegistrationViewIfNecessary
{
  BOOL v3 = [MEMORY[0x1E4F6BC98] sharedInstance];
  char v4 = [v3 isConnected];

  if (v4)
  {
    if (CKRegistrationBypassEnabled()
      || (+[CKUIBehavior sharedBehaviors],
          objc_super v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isRunningInStoreDemoMode],
          v5,
          v6))
    {
      [(CKMessagesSceneDelegate *)self presentOnboardingViewControllerIfNeeded];
    }
    else
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___showMadridRegistrationViewIfNecessary object:0];
      [(CKMessagesSceneDelegate *)self performSelector:sel___showMadridRegistrationViewIfNecessary withObject:0 afterDelay:0.0];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(33);
      objc_super v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Not showing registration view as we aren't connected to the daemon", v8, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
    [(CKMessagesSceneDelegate *)self presentOnboardingViewControllerIfNeeded];
  }
}

void __31__CKMessagesSceneDelegate_init__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  if (IMOSLoggingEnabled())
  {
    v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      id v2 = @"YES";
      if (!v0) {
        id v2 = @"NO";
      }
      int v3 = 138412290;
      char v4 = v2;
      _os_log_impl(&dword_18EF18000, v1, OS_LOG_TYPE_INFO, "Initialized IDSServerBag: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)__showMadridRegistrationViewIfNecessary
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ((CKiMessageSupported() && ![MEMORY[0x1E4F6BDC0] smsEnabled]
     || self->_shouldShowRegistrationOverride)
    && [(CKMessagesSceneDelegate *)self _shouldShowMadridRegistrationView])
  {
    v22 = self;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    int v3 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    char v4 = [MEMORY[0x1E4F6BDB8] iMessageService];
    uint64_t v5 = [v3 accountsForService:v4];

    uint64_t v30 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v30)
    {
      uint64_t v6 = *(void *)v34;
      uint64_t v29 = *MEMORY[0x1E4F6C660];
      uint64_t v28 = *MEMORY[0x1E4F6C650];
      uint64_t v27 = *MEMORY[0x1E4F6C658];
      uint64_t v26 = *MEMORY[0x1E4F6B838];
      uint64_t v25 = *MEMORY[0x1E4F6B840];
      uint64_t v23 = *(void *)v34;
      uint64_t v24 = *MEMORY[0x1E4F6B830];
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v5);
          }
          id v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v8 registrationFailureReason] == 20
            || [v8 registrationFailureReason] == 26)
          {
            id v9 = [v8 registrationFailureAlertInfo];
            uint64_t v10 = [v9 objectForKey:v29];
            v11 = [v9 objectForKey:v28];
            v12 = [v9 objectForKey:v27];
            v13 = [v9 objectForKey:v26];
            v14 = [v13 valueForKey:v25];
            uint64_t v15 = [v14 integerValue];

            if (v15 == 1)
            {
              v16 = [v13 valueForKey:v24];
            }
            else
            {
              v16 = 0;
            }
            if (v10) {
              BOOL v17 = 0;
            }
            else {
              BOOL v17 = v12 == 0;
            }
            BOOL v18 = v17 && v11 == 0;
            if (!v18 && (sAlreadyShowUserNotificationDialogForCurrentLoginCycle & 1) == 0)
            {
              sAlreadyShowUserNotificationDialogForCurrentLoginCycle = 1;
              v19 = [MEMORY[0x1E4F6C410] userNotificationWithIdentifier:@"ServerAlerts" title:v10 message:v12 defaultButton:v11 alternateButton:v16 otherButton:0];
              [MEMORY[0x1E4F6C418] sharedInstance];
              v21 = uint64_t v20 = v5;
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __66__CKMessagesSceneDelegate___showMadridRegistrationViewIfNecessary__block_invoke;
              v31[3] = &unk_1E562C7C0;
              id v32 = v13;
              [v21 addUserNotification:v19 listener:0 completionHandler:v31];

              uint64_t v5 = v20;
              uint64_t v6 = v23;
            }
          }
        }
        uint64_t v30 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v30);
    }

    [(CKMessagesSceneDelegate *)v22 _updateMadridRegistrationViewAnimated:1];
  }
  else
  {
    [(CKMessagesSceneDelegate *)self presentOnboardingViewControllerIfNeeded];
  }
}

- (id)_oldInputContextIdentifiers
{
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  int v3 = [v2 objectForKey:@"max-number-of-text-input-context-identifiers"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 300;
  }
  uint64_t v5 = +[CKConversationList sharedConversationList];
  uint64_t v6 = [v5 conversations];

  if ([v6 count] >= v4)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__CKMessagesSceneDelegate__oldInputContextIdentifiers__block_invoke;
    v10[3] = &unk_1E562C7E8;
    unint64_t v12 = v4;
    id v7 = v8;
    id v11 = v7;
    [v6 enumerateObjectsWithOptions:2 usingBlock:v10];
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)dealloc
{
  [(CKMessagesSceneDelegate *)self _destroyMadridRegistrationView];
  v3.receiver = self;
  v3.super_class = (Class)CKMessagesSceneDelegate;
  [(CKMessagesSceneDelegate *)&v3 dealloc];
}

- (int64_t)type
{
  return 0;
}

- (void)processAppleEventDictionary:(id)a3
{
  id v4 = a3;
  id v7 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v5 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v6 = [v5 chatController];
  +[CKUserActivityHandler processAppleEventDictionary:v4 animate:1 navigationProvider:v7 chatController:v6];
}

- (void)processLaunchEventContext:(id)a3
{
  id v4 = a3;
  id v7 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v5 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v6 = [v5 chatController];
  +[CKUserActivityHandler processLaunchEventContext:v4 animate:1 navigationProvider:v7 chatController:v6];
}

void __62__CKMessagesSceneDelegate_scene_willConnectToSession_options___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = @"NO";
      if (a2) {
        id v4 = @"YES";
      }
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "performActionForShortcutItem in willConnectToSession completed: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)sceneWillResignActive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[CKMessagesSceneDelegate sceneWillResignActive:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesSceneDelegate;
  [(CKSceneDelegate *)&v6 sceneWillResignActive:v4];
  [(CKMessagesSceneDelegate *)self setHandlingLaunchTask:0];
}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[CKMessagesSceneDelegate sceneDidEnterBackground:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesSceneDelegate;
  [(CKSceneDelegate *)&v6 sceneDidEnterBackground:v4];
  [(CKMessagesSceneDelegate *)self _prepareForSuspend];
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CKMessagesSceneDelegate sceneDidDisconnect:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKMessagesSceneDelegate;
  [(CKSceneDelegate *)&v9 sceneDidDisconnect:v4];
  if (CKIsRunningInMacCatalyst())
  {
    objc_super v6 = [(CKMessagesSceneDelegate *)self messagesController];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      id v8 = [(CKMessagesSceneDelegate *)self messagesController];
      [v8 persistColumnWidths:self];
    }
  }
  [(CKMessagesSceneDelegate *)self _cancelPendingAppSnapshotUpdate];
  [(CKMessagesSceneDelegate *)self _prepareForSuspend];
}

- (id)stateRestorationActivityForScene:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKMessagesSceneDelegate;
  int v5 = [(CKSceneDelegate *)&v12 stateRestorationActivityForScene:v4];
  [(CKMessagesSceneDelegate *)self _updateStoredState];
  objc_super v6 = [(CKMessagesSceneDelegate *)self storedState];
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Archiving messages scene state object: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = CKConversationListFilterModeStringValue([v6 filterMode]);
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "[Filter Mode] Archived filter mode: %@", buf, 0xCu);
    }
  }
  uint64_t v10 = +[CKSceneDelegate userInfoDictionaryForState:v6];
  if (v10) {
    [v5 addUserInfoEntriesFromDictionary:v10];
  }

  return v5;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CKMessagesSceneDelegate *)self setHandlingLaunchTask:1];
  id v10 = [(CKMessagesSceneDelegate *)self messagesController];
  id v8 = [(CKMessagesSceneDelegate *)self messagesController];
  objc_super v9 = [v8 chatController];
  +[CKUserActivityHandler messagesScene:v7 continueUserActivity:v6 withNavigationProvider:v10 chatController:v9 completion:&__block_literal_global_132_2];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(CKMessagesSceneDelegate *)self setHandlingLaunchTask:1];
  objc_super v9 = [(CKMessagesSceneDelegate *)self messagesController];
  id v10 = [(CKMessagesSceneDelegate *)self messagesController];
  id v11 = [v10 chatController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__CKMessagesSceneDelegate_windowScene_performActionForShortcutItem_completionHandler___block_invoke;
  v13[3] = &unk_1E5622358;
  id v14 = v7;
  id v12 = v7;
  +[CKShortcutHandler performActionForShortcutItem:v8 navigationProvider:v9 chatController:v11 completion:v13];
}

uint64_t __86__CKMessagesSceneDelegate_windowScene_performActionForShortcutItem_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_prepareForSuspend
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "prepareForSuspend", buf, 2u);
    }
  }
  id v4 = +[CKSpringBoardActionManager sharedInstance];
  [v4 updateShortcutItems];

  if (![(CKMessagesSceneDelegate *)self isSuspended])
  {
    int v5 = [(CKMessagesSceneDelegate *)self messagesController];
    [v5 prepareForSuspend];

    -[CKMessagesSceneDelegate setLocked:](self, "setLocked:", [(id)*MEMORY[0x1E4F43630] isSuspendedUnderLock]);
    if ([(CKMessagesSceneDelegate *)self isLocked]) {
      goto LABEL_13;
    }
    id v6 = [(CKMessagesSceneDelegate *)self messagesController];
    if ([v6 isComposingMessage])
    {
      id v7 = [(CKMessagesSceneDelegate *)self messagesController];
      if ([v7 currentCompositionHasContent])
      {
      }
      else
      {
        id v8 = +[CKConversationList sharedConversationList];
        int v9 = [v8 hasActiveConversations];

        if (!v9) {
          goto LABEL_13;
        }
        id v6 = [(CKMessagesSceneDelegate *)self messagesController];
        [v6 cancelNewMessageCompositionAnimated:0];
      }
    }

LABEL_13:
    [(CKMessagesSceneDelegate *)self _updateStoredState];
    *(void *)buf = 0;
    BOOL v18 = buf;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    id v10 = [MEMORY[0x1E4F42738] sharedApplication];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke;
    v16[3] = &unk_1E5620B90;
    v16[4] = buf;
    uint64_t v11 = [v10 beginBackgroundTaskWithExpirationHandler:v16];

    *((void *)v18 + 3) = v11;
    [(CKMessagesSceneDelegate *)self _clearOldInputContextIdentifiersIfNeeded];
    id v12 = [MEMORY[0x1E4F42738] sharedApplication];
    if ([v12 isProtectedDataAvailable])
    {
      if (CKHasAnyWatchPaired())
      {
        char v13 = CKActivePairedWatchSupportsEncryptedKeys();

        if ((v13 & 1) == 0) {
          goto LABEL_20;
        }
      }
      else
      {
      }
      CKMigrateTextInputIdentifiersIfNeeded();
    }
    else
    {
    }
LABEL_20:
    uint64_t v14 = *MEMORY[0x1E4F43740];
    if (*((void *)v18 + 3) != *MEMORY[0x1E4F43740])
    {
      uint64_t v15 = [MEMORY[0x1E4F42738] sharedApplication];
      [v15 endBackgroundTask:*((void *)v18 + 3)];

      *((void *)v18 + 3) = v14;
    }
    [(CKMessagesSceneDelegate *)self setSuspended:1];
    _Block_object_dispose(buf, 8);
  }
}

void __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke(uint64_t a1)
{
  id v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke_cold_1(v2);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E4F43740];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)CKMessagesSceneDelegate;
  id v6 = a4;
  id v7 = a3;
  [(CKSceneDelegate *)&v18 scene:v7 openURLContexts:v6];
  id v8 = [v6 anyObject];

  int v9 = [v8 URL];
  id v10 = [v8 options];
  uint64_t v11 = [v10 sourceApplication];

  id v12 = [v8 options];
  char v13 = [v12 _sourceProcessHandle];

  [(CKMessagesSceneDelegate *)self setHandlingLaunchTask:1];
  uint64_t v14 = [v7 activationState];

  uint64_t v15 = [(CKMessagesSceneDelegate *)self messagesController];
  v16 = [(CKMessagesSceneDelegate *)self messagesController];
  BOOL v17 = [v16 chatController];
  +[CKUserActivityHandler openURL:v9 animate:v14 == 0 sourceApplication:v11 originatingProcess:v13 navigationProvider:v15 chatController:v17 completion:&__block_literal_global_143_1];
}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesSceneDelegate;
  id v6 = a4;
  [(CKSceneDelegate *)&v10 _scene:a3 openItemProviders:v6];
  id v7 = [(CKMessagesSceneDelegate *)self messagesController];
  id v8 = [(CKMessagesSceneDelegate *)self messagesController];
  int v9 = [v8 chatController];
  +[CKUserActivityHandler openItemProviders:v6 navigationProvider:v7 chatController:v9];
}

- (void)_updateStoredState
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Updating stored CKSceneDelegateState", buf, 2u);
    }
  }
  id v4 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v5 = [v4 isComposingMessage];

  if (v5)
  {
    id v6 = [(CKMessagesSceneDelegate *)self messagesController];
    unsigned int v39 = [v6 currentCompositionHasContent];
  }
  else
  {
    unsigned int v39 = 0;
  }
  id v7 = [(CKMessagesSceneDelegate *)self messagesController];
  unsigned int v38 = [v7 isShowingSelectionView];

  id v8 = [(CKMessagesSceneDelegate *)self messagesController];
  unsigned int v37 = [v8 isCollapsed];

  int v9 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v10 = [v9 isTopVCChatNavigationController];

  if (v5
    && ([(CKMessagesSceneDelegate *)self messagesController],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isCollapsed],
        v11,
        v12))
  {
    char v13 = [(CKMessagesSceneDelegate *)self messagesController];
    uint64_t v14 = [v13 composeChatController];
  }
  else
  {
    char v13 = [(CKMessagesSceneDelegate *)self messagesController];
    uint64_t v14 = [v13 chatController];
  }
  uint64_t v15 = (void *)v14;

  v16 = [v15 conversation];
  BOOL v17 = [(CKMessagesSceneDelegate *)self messagesController];
  objc_super v18 = [v17 conversationListController];
  unint64_t v19 = [v18 filterMode];

  uint64_t v20 = [(CKMessagesSceneDelegate *)self messagesController];
  int v21 = [v20 isShowingInboxViewController];

  v22 = +[CKConversationList sharedConversationList];
  uint64_t v23 = [v22 relevantUnreadLastMessages];

  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      CKConversationListFilterModeStringValue(v19);
      uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v25;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "[Filter Mode] determined current filterMode: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = CKConversationListFilterModeStringValue(v19);
      uint64_t v28 = (void *)v27;
      uint64_t v29 = @"NO";
      *(_DWORD *)buf = 138414338;
      if (v10) {
        uint64_t v30 = @"YES";
      }
      else {
        uint64_t v30 = @"NO";
      }
      if (v37) {
        uint64_t v31 = @"YES";
      }
      else {
        uint64_t v31 = @"NO";
      }
      if (v38) {
        id v32 = @"YES";
      }
      else {
        id v32 = @"NO";
      }
      if (v39) {
        long long v33 = @"YES";
      }
      else {
        long long v33 = @"NO";
      }
      if (v5) {
        long long v34 = @"YES";
      }
      else {
        long long v34 = @"NO";
      }
      v41 = v34;
      __int16 v42 = 2112;
      v43 = v33;
      __int16 v44 = 2112;
      v45 = v32;
      __int16 v46 = 2112;
      v47 = v31;
      if (v21) {
        uint64_t v29 = @"YES";
      }
      __int16 v48 = 2112;
      v49 = v30;
      __int16 v50 = 2112;
      v51 = v16;
      __int16 v52 = 2112;
      uint64_t v53 = v27;
      __int16 v54 = 2112;
      v55 = v29;
      __int16 v56 = 2112;
      v57 = v23;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "upating stored state. isComposingNewMessage: %@ messageHasContent: %@ isShowingSelectionView: %@ isControllerCollapsed: %@ isTopVCChatNavigationController: %@ conversation: %@ filterMode: %@ isShowingInbox: %@ unreadLastMessages: %@", buf, 0x5Cu);
    }
  }
  LOBYTE(v36) = v21;
  long long v35 = +[CKSceneDelegateState stateFromIsComposingNewMessage:v5 messageHasContent:v39 isShowingBlankTranscript:v38 isControllerCollapsed:v37 isTopVCChatNavigationController:v10 conversation:v16 filterMode:v19 isShowingInbox:v36 unreadMessages:v23];
  [(CKMessagesSceneDelegate *)self setStoredState:v35];
}

- (void)setStoredState:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (CKSceneDelegateState *)a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CKConversationListFilterModeStringValue([(CKSceneDelegateState *)v4 filterMode]);
      id v6 = (CKSceneDelegateState *)objc_claimAutoreleasedReturnValue();
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Filter Mode] Updating stored filter mode to: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Updating stored state to: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  storedState = self->_storedState;
  self->_storedState = v4;
}

- (void)_handleAccountsChanged:(id)a3
{
  BOOL v4 = [(CKMessagesSceneDelegate *)self _shouldShowMadridRegistrationView];
  madridRegistrationController = self->_madridRegistrationController;
  if (v4)
  {
    if (!madridRegistrationController)
    {
      [(CKMessagesSceneDelegate *)self _updateStoredState];
      [(CKMessagesSceneDelegate *)self _showMadridRegistrationViewIfNecessary];
    }
  }
  else if (madridRegistrationController)
  {
    [(CKMessagesSceneDelegate *)self _updateMadridRegistrationViewAnimated:1];
  }
}

- (void)_handleDaemonConnected:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_handleDaemonConnected: [%@]", (uint8_t *)&v6, 0xCu);
    }
  }
  if ([(CKMessagesSceneDelegate *)self _shouldShowMadridRegistrationView]) {
    [(CKMessagesSceneDelegate *)self _updateMadridRegistrationViewAnimated:1];
  }
}

- (void)_handleDaemonDisconnected:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6BC98], "sharedInstance", a3);
  [v4 connectToDaemon];

  if (!self->_madridRegistrationController)
  {
    [(CKMessagesSceneDelegate *)self _updateStoredState];
    [(CKMessagesSceneDelegate *)self _showMadridRegistrationViewIfNecessary];
  }
}

void __66__CKMessagesSceneDelegate___showMadridRegistrationViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_super v3 = [*(id *)(a1 + 32) valueForKey:*MEMORY[0x1E4F6B840]];
  if ([v3 integerValue] == 1)
  {
    uint64_t v4 = [v7 response];

    if (v4 != 1) {
      goto LABEL_5;
    }
    objc_super v3 = [*(id *)(a1 + 32) valueForKey:*MEMORY[0x1E4F6B848]];
    uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    int v6 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    [v5 openSensitiveURL:v6 withOptions:0];
  }
LABEL_5:
}

uint64_t __67__CKMessagesSceneDelegate__madridRegistrationControllerDidComplete__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _destroyMadridRegistrationView];
  id v2 = [*(id *)(a1 + 32) storedState];
  objc_super v3 = [*(id *)(a1 + 32) messagesController];
  +[CKUserActivityHandler restoreState:v2 navigationProvider:v3];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 presentOnboardingViewControllerIfNeeded];
}

- (void)_createMadridRegistrationViewIfNecessary
{
  if (CKiMessageSupported())
  {
    if (!self->_madridRegistrationController)
    {
      objc_super v3 = objc_alloc_init(CKRegistrationViewController);
      madridRegistrationController = self->_madridRegistrationController;
      self->_madridRegistrationController = v3;

      [(CKRegistrationViewController *)self->_madridRegistrationController setModalPresentationStyle:2];
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      uint64_t v8 = __67__CKMessagesSceneDelegate__createMadridRegistrationViewIfNecessary__block_invoke;
      int v9 = &unk_1E5623970;
      objc_copyWeak(&v10, &location);
      uint64_t v5 = _Block_copy(&v6);
      -[CKRegistrationViewController setCompletionBlock:](self->_madridRegistrationController, "setCompletionBlock:", v5, v6, v7, v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __67__CKMessagesSceneDelegate__createMadridRegistrationViewIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _madridRegistrationControllerDidComplete];
}

- (void)_destroyMadridRegistrationView
{
  madridRegistrationController = self->_madridRegistrationController;
  if (madridRegistrationController)
  {
    if ([(CKRegistrationViewController *)madridRegistrationController isViewLoaded])
    {
      uint64_t v4 = self->_madridRegistrationController;
      uint64_t v5 = [(CKMessagesSceneDelegate *)self messagesController];
      [(CKRegistrationViewController *)v4 setErrorPresentationViewController:v5];

      uint64_t v6 = [(CKRegistrationViewController *)self->_madridRegistrationController view];
      [v6 removeFromSuperview];
    }
    uint64_t v7 = self->_madridRegistrationController;
    self->_madridRegistrationController = 0;

    sAlreadyShowUserNotificationDialogForCurrentLoginCycle = 0;
  }
}

- (void)_mainThread_updateMadridRegistrationViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKMessagesSceneDelegate *)self _createMadridRegistrationViewIfNecessary];
  madridRegistrationController = self->_madridRegistrationController;
  if (madridRegistrationController)
  {
    uint64_t v6 = madridRegistrationController;
    if (+[CKRegistrationViewController shouldShowRegistration]|| self->_shouldShowRegistrationOverride)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(33);
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Showing registration view", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
        _CKLogExternal();
      }
      uint64_t v8 = [(CKMessagesSceneDelegate *)self messagesController];
      int v9 = [v8 presentedViewController];

      if (v9 != v6)
      {
        id v10 = [(CKMessagesSceneDelegate *)self messagesController];
        uint64_t v11 = [v10 presentedViewController];

        if (v11)
        {
          if (![(CKMessagesSceneDelegate *)self willPresentRegistrationViewController])
          {
            [(CKMessagesSceneDelegate *)self setWillPresentRegistrationViewController:1];
            int v12 = [(CKMessagesSceneDelegate *)self messagesController];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke;
            v22[3] = &unk_1E5623DE8;
            v22[4] = self;
            uint64_t v23 = v6;
            BOOL v24 = v3;
            [v12 dismissViewControllerAnimated:v3 completion:v22];
          }
        }
        else
        {
          char v13 = [(CKMessagesSceneDelegate *)self messagesController];
          [v13 presentViewController:v6 animated:v3 completion:0];
        }
      }
      goto LABEL_21;
    }
    uint64_t v14 = [(CKMessagesSceneDelegate *)self messagesController];
    uint64_t v15 = [v14 presentedViewController];
    if (v15 == v6)
    {
      objc_super v18 = [(CKRegistrationViewController *)v6 view];
      unint64_t v19 = [v18 window];

      if (v19)
      {
        uint64_t v20 = [(CKMessagesSceneDelegate *)self messagesController];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_3;
        v21[3] = &unk_1E5620C40;
        v21[4] = self;
        [v20 dismissViewControllerAnimated:v3 completion:v21];

        goto LABEL_21;
      }
    }
    else
    {
    }
    [(CKMessagesSceneDelegate *)self _destroyMadridRegistrationView];
    v16 = [(CKMessagesSceneDelegate *)self storedState];
    BOOL v17 = [(CKMessagesSceneDelegate *)self messagesController];
    +[CKUserActivityHandler restoreState:v16 navigationProvider:v17];

    [(CKMessagesSceneDelegate *)self presentOnboardingViewControllerIfNeeded];
LABEL_21:
  }
}

void __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messagesController];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_2;
  v5[3] = &unk_1E5620C40;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  [v2 presentViewController:v4 animated:v3 completion:v5];
}

uint64_t __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWillPresentRegistrationViewController:0];
}

uint64_t __76__CKMessagesSceneDelegate__mainThread_updateMadridRegistrationViewAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _destroyMadridRegistrationView];
  id v2 = [*(id *)(a1 + 32) storedState];
  uint64_t v3 = [*(id *)(a1 + 32) messagesController];
  +[CKUserActivityHandler restoreState:v2 navigationProvider:v3];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 presentOnboardingViewControllerIfNeeded];
}

- (void)_updateMadridRegistrationViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(CKMessagesSceneDelegate *)self _mainThread_updateMadridRegistrationViewAnimated:v3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__CKMessagesSceneDelegate__updateMadridRegistrationViewAnimated___block_invoke;
    v5[3] = &unk_1E5622A18;
    v5[4] = self;
    BOOL v6 = v3;
    dispatch_sync(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __65__CKMessagesSceneDelegate__updateMadridRegistrationViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainThread_updateMadridRegistrationViewAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_shouldShowMadridRegistrationView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = CKiMessageSupported() == 0;
  int v4 = [MEMORY[0x1E4F6BDC0] smsEnabled];
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  char v6 = [v5 isRunningInStoreDemoMode];

  int v7 = CKRegistrationBypassEnabled();
  if (((v3 | v4) & 1) != 0
    || v7
    || (v6 & 1) != 0
    || !+[CKRegistrationViewController shouldShowRegistration])
  {
    return self->_shouldShowRegistrationOverride;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(33);
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v11 = @"YES";
      __int16 v12 = 2112;
      char v13 = @"NO";
      __int16 v14 = 2112;
      uint64_t v15 = @"NO";
      __int16 v16 = 2112;
      BOOL v17 = @"NO";
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "_shouldShowMadridRegistrationView: %@, smsEnabled: %@, registrationBypassEnabled: %@, isDemoMode: %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_CKShouldLogExternal()) {
      _CKLogExternal();
    }
  }
  return 1;
}

- (void)__updateAppSnapshot
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [(CKSceneDelegate *)self scene];
  uint64_t v3 = [v2 activationState];

  if (v3 == 2)
  {
    if (CKIsScreenLocked())
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Not snapshotting, iOS device is locked", (uint8_t *)&v5, 2u);
      }
      goto LABEL_6;
    }
    im_main_thread();
  }
  else if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Not snapshotting, scene state is %ld", (uint8_t *)&v5, 0xCu);
    }
LABEL_6:
  }
}

void __46__CKMessagesSceneDelegate___updateAppSnapshot__block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Telling UIKit to update scene snapshot", v6, 2u);
    }
  }
  uint64_t v3 = [MEMORY[0x1E4F42738] sharedApplication];
  int v4 = [*(id *)(a1 + 32) scene];
  int v5 = [v4 session];
  [v3 requestSceneSessionRefresh:v5];
}

- (void)_cancelPendingAppSnapshotUpdate
{
}

- (void)_updateAppSnapshot
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Scheduling snapshot generation", v4, 2u);
    }
  }
  [(CKMessagesSceneDelegate *)self _cancelPendingAppSnapshotUpdate];
  [(CKMessagesSceneDelegate *)self performSelector:sel___updateAppSnapshot withObject:0 afterDelay:10.0];
}

- (void)_updateStoredStateSuspendTime:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CKMessagesSceneDelegate *)self storedState];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 updateStoredDate:v6];

  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [(CKMessagesSceneDelegate *)self storedState];
      int v9 = [v8 date];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Audio playback has stopped. Updated stored state suspendTime to %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_chatItemsDidChange:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKMessagesSceneDelegate *)self isSuspended])
  {
    int v5 = +[CKPluginExtensionStateObserver sharedInstance];
    char v6 = [v5 passKitUIPresented];

    if ((v6 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = [(CKSceneDelegate *)self scene];
          int v9 = [v8 session];
          int v10 = [v9 persistentIdentifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v10;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Chat items did change while suspended %@", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v11 = [v4 userInfo];
      uint64_t v12 = [v4 object];
      char v13 = [v11 objectForKey:*MEMORY[0x1E4F6B8E0]];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x2020000000;
      char v51 = 0;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __47__CKMessagesSceneDelegate__chatItemsDidChange___block_invoke;
      v44[3] = &unk_1E56213F8;
      id v14 = v12;
      id v45 = v14;
      p_long long buf = &buf;
      [v13 enumerateIndexesWithOptions:2 usingBlock:v44];
      if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        uint64_t v15 = [(CKMessagesSceneDelegate *)self messagesController];
        int v16 = [v15 isShowingChatController];

        if (v16)
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = [(CKMessagesSceneDelegate *)self messagesController];
              unint64_t v19 = [v18 chatController];
              uint64_t v20 = [v19 conversation];
              *(_DWORD *)v47 = 138412290;
              __int16 v48 = v20;
              _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Messages controller showing chat controller with conversation: %@", v47, 0xCu);
            }
          }
          int v21 = [(CKMessagesSceneDelegate *)self messagesController];
          v22 = [v21 chatController];
          uint64_t v23 = [v22 conversation];
          id v43 = [v23 chat];

          if (v43 == v14)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v27 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v47 = 0;
                _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Updated chat is visible chat, not popping back to conversation list before snapshotting", v47, 2u);
              }
            }
            int v26 = 1;
          }
          else
          {
            BOOL v24 = [(CKMessagesSceneDelegate *)self storedState];
            v41 = [v24 groupID];

            if ([v41 isEqualToString:@"-1"])
            {
              id v25 = 0;
            }
            else
            {
              uint64_t v28 = [(CKMessagesSceneDelegate *)self sharedConversationList];
              uint64_t v29 = [v28 conversationForExistingChatWithChatIdentifier:v41];
              uint64_t v30 = v29;
              if (v29)
              {
                id v25 = v29;
              }
              else
              {
                uint64_t v31 = [(CKMessagesSceneDelegate *)self sharedConversationList];
                id v25 = [v31 conversationForExistingChatWithGroupID:v41];
              }
            }
            if (objc_msgSend(v25, "isCurrentlyPlayingAudio", v41))
            {
              if (IMOSLoggingEnabled())
              {
                id v32 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v47 = 0;
                  _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Last active conversation is currently playing audio. Not restoring to conversation list.", v47, 2u);
                }
              }
              int v26 = 0;
            }
            else
            {
              long long v33 = [(CKMessagesSceneDelegate *)self messagesController];
              long long v34 = [(CKMessagesSceneDelegate *)self storedState];
              int v26 = [v33 shouldRestoreToConversationListForState:v34];

              if (v26)
              {
                if (IMOSLoggingEnabled())
                {
                  long long v35 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)v47 = 0;
                    _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, " => Showing unread conversations for snapshot", v47, 2u);
                  }
                }
                uint64_t v36 = [(CKMessagesSceneDelegate *)self messagesController];
                unsigned int v37 = [(CKMessagesSceneDelegate *)self storedState];
                unsigned int v38 = [v37 unreadLastMessages];
                int v26 = [v36 showUnreadConversationsWithLastConversation:v25 ignoringMessages:v38];
              }
            }
          }
        }
        else
        {
          int v26 = 0;
        }
        unsigned int v39 = [(CKMessagesSceneDelegate *)self messagesController];
        int v40 = [v39 isShowingConversationListController];

        if ((v40 | v26) == 1) {
          [(CKMessagesSceneDelegate *)self _updateAppSnapshot];
        }
      }

      _Block_object_dispose(&buf, 8);
    }
  }
}

void __47__CKMessagesSceneDelegate__chatItemsDidChange___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  char v6 = [*(id *)(a1 + 32) chatItems];
  id v7 = [v6 objectAtIndex:a2];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_conversationFilteringStateChangedNotification:(id)a3
{
  id v4 = [(CKMessagesSceneDelegate *)self messagesController];
  int v5 = [v4 isShowingConversationListController];

  if (v5)
  {
    [(CKMessagesSceneDelegate *)self _updateAppSnapshot];
  }
}

- (NSSet)alertSuppressionContexts
{
  id v2 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v3 = [v2 alertSuppressionContexts];

  return (NSSet *)v3;
}

- (id)prefersToActivatePredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:0];
}

- (id)canActivatePredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
}

- (void)messagesController:(id)a3 didUpdateCurrentConversation:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Messages controller updated current conversation to: %@, updating scene activation conditions", (uint8_t *)&v9, 0xCu);
    }
  }
  [(CKSceneDelegate *)self updateSceneActivationConditions];
  [(CKSceneDelegate *)self updateSceneTitleForConversation:v7];
}

- (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (id)sharedConversationList
{
  return +[CKConversationList sharedConversationList];
}

- (void)_clearOldInputContextIdentifiersIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CKConversationList sharedConversationList];
  int v4 = [v3 loadingConversations];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "skipping UITextInputContextIdentifiers cleanup since conversations list is loading", (uint8_t *)&v20, 2u);
      }
    }
  }
  else
  {
    if (CKIsRunningInMessages())
    {
      id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    else
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.MobileSMS"];
    }
    id v7 = v6;
    uint64_t v8 = [v6 objectForKey:@"__CK_clearTextInputContextIdentifierKey"];

    if (!v8)
    {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"__CK_clearTextInputContextIdentifierKey"];
      int v9 = [(CKMessagesSceneDelegate *)self _oldInputContextIdentifiers];
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v20 = 134217984;
          uint64_t v21 = [v9 count];
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "cleaning %lu UITextInputContextIdentifiers", (uint8_t *)&v20, 0xCu);
        }
      }
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(MEMORY[0x1E4F42D40], "clearTextInputContextIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v12);
      }
    }
  }
}

void __54__CKMessagesSceneDelegate__oldInputContextIdentifiers__block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  char v7 = [v10 isPending];
  uint64_t v8 = v10;
  if ((v7 & 1) == 0)
  {
    if (*(void *)(a1 + 40) <= a3)
    {
      int v9 = [v10 deviceIndependentID];
      if (v9) {
        [*(id *)(a1 + 32) addObject:v9];
      }

      uint64_t v8 = v10;
    }
    else
    {
      *a4 = 1;
    }
  }
}

- (id)conversation
{
  id v2 = [(CKMessagesSceneDelegate *)self messagesController];
  uint64_t v3 = [v2 chatController];
  int v4 = [v3 conversation];

  return v4;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (CKSceneDelegateState)storedState
{
  return self->_storedState;
}

- (CKRegistrationViewController)madridRegistrationController
{
  return self->_madridRegistrationController;
}

- (void)setMadridRegistrationController:(id)a3
{
}

- (BOOL)shouldShowRegistrationOverride
{
  return self->_shouldShowRegistrationOverride;
}

- (void)setShouldShowRegistrationOverride:(BOOL)a3
{
  self->_shouldShowRegistrationOverride = a3;
}

- (void)setHandlingLaunchTask:(BOOL)a3
{
  self->_handlingLaunchTask = a3;
}

- (BOOL)willPresentRegistrationViewController
{
  return self->_willPresentRegistrationViewController;
}

- (void)setWillPresentRegistrationViewController:(BOOL)a3
{
  self->_willPresentRegistrationViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madridRegistrationController, 0);
  objc_storeStrong((id *)&self->_storedState, 0);

  objc_storeStrong((id *)&self->_messagesController, 0);
}

void __45__CKMessagesSceneDelegate__prepareForSuspend__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "migration task has timed out", v1, 2u);
}

@end