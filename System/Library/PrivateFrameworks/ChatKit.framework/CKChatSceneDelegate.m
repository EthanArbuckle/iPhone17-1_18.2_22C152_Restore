@interface CKChatSceneDelegate
- (BOOL)hasDetailsNavigationController;
- (BOOL)isDetailsNavigationControllerDetached;
- (BOOL)shouldConfigureChatControllerAsCollapsed;
- (CKChatSceneDelegate)init;
- (CKCoreChatController)chatController;
- (CKDetailsNavigationController)detailsNavigationController;
- (CKInteractionNotificationView)dismissOnInteractionView;
- (CKNavigationController)navigationController;
- (CKSendMenuPresentation)sendMenuPresentation;
- (NSSet)alertSuppressionContexts;
- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3;
- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3;
- (id)activeSendMenuPresentationForChatController:(id)a3;
- (id)conversation;
- (id)newInputSnapshotView;
- (id)prefersToActivatePredicate;
- (id)stateRestorationActivityForScene:(id)a3;
- (id)viewToSizeEffectPreviewOverlay;
- (int64_t)type;
- (void)__updateAppSnapshot;
- (void)_chatItemsDidChange:(id)a3;
- (void)_handleChatDisplayNameChangedNotification:(id)a3;
- (void)_handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification:(id)a3;
- (void)_handleRegistryWillUnregisterChatNotification:(id)a3;
- (void)_scene:(id)a3 openItemProviders:(id)a4;
- (void)_updateAppSnapshot;
- (void)chatController:(id)a3 didDetachDetailsNavigationController:(id)a4;
- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4;
- (void)chatController:(id)a3 requestDeleteJunkConversation:(id)a4;
- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4;
- (void)chatController:(id)a3 requestRecoverJunkConversation:(id)a4;
- (void)didDismissSendMenu:(id)a3 usingPresentationContext:(id)a4;
- (void)dismissAndReopenDetailsNavigationController;
- (void)dismissDetailsNavigationController;
- (void)dismissDetailsViewAndShowConversationList;
- (void)doneButtonPressedForChatController:(id)a3;
- (void)loadAndShowConversationWithMessageGUID:(id)a3 withInlineReplyOverlay:(BOOL)a4;
- (void)presentDetailsNavigationController:(id)a3;
- (void)requestDismissKeyboardSnapshotForSendMenu;
- (void)requestShowKeyboardSnapshotForSendMenu;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setChatController:(id)a3;
- (void)setDetailsNavigationController:(id)a3;
- (void)setDismissOnInteractionView:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setSendMenuPresentation:(id)a3;
- (void)setupCKDismissOnInteractionView;
- (void)showConversation:(id)a3;
- (void)showConversation:(id)a3 scrollToMessage:(id)a4 withInlineReplyOverlay:(BOOL)a5;
- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 withInlineReplyOverlay:(BOOL)a5 animate:(BOOL)a6;
- (void)tearDownCKDismissOnInteractionView;
- (void)windowSceneDidBecomeVisible:(id)a3;
@end

@implementation CKChatSceneDelegate

- (CKChatSceneDelegate)init
{
  v11.receiver = self;
  v11.super_class = (Class)CKChatSceneDelegate;
  v2 = [(CKSceneDelegate *)&v11 init];
  if (v2)
  {
    v3 = [[CKNavigationController alloc] initWithRootViewController:v2->_chatController];
    navigationController = v2->_navigationController;
    v2->_navigationController = v3;

    v5 = [(CKSceneDelegate *)v2 window];
    [v5 setRootViewController:v2->_navigationController];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__chatItemsDidChange_ name:*MEMORY[0x1E4F6B8D8] object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__handleRegistryWillUnregisterChatNotification_ name:*MEMORY[0x1E4F6BA78] object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__handleChatDisplayNameChangedNotification_ name:*MEMORY[0x1E4F6B898] object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification_ name:*MEMORY[0x1E4F6BA28] object:0];
  }
  return v2;
}

- (int64_t)type
{
  return 1;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __58__CKChatSceneDelegate_scene_willConnectToSession_options___block_invoke;
  v29 = &unk_1E5621088;
  id v11 = v8;
  id v30 = v11;
  id v12 = v9;
  id v31 = v12;
  id v13 = v10;
  id v32 = v13;
  v33 = self;
  v14 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(&v26);
  v14[2](v14, v15, v16, v17);
  -[CKChatSceneDelegate showConversation:](self, "showConversation:", 0, v26, v27, v28, v29);
  v18 = +[CKUIBehavior sharedBehaviors];
  int v19 = [v18 useMacToolbar];

  if (v19)
  {
    v20 = [[CKMacToolbarController alloc] initWithScene:v11 connectingToSession:v12 inStandaloneWindow:1];
    [(CKSceneDelegate *)self setToolbarController:v20];

    v21 = [(CKChatSceneDelegate *)self chatController];
    v22 = [(CKSceneDelegate *)self toolbarController];
    [v21 configureWithToolbarController:v22];

    v23 = [(CKChatSceneDelegate *)self chatController];
    [v23 presentMacToolbarController];
  }
  v24 = [v13 userActivities];
  v25 = [v13 URLContexts];
  +[CKUserActivityHandler chatScene:v11 willConnectToSession:v12 userActivities:v24 urlContexts:v25 windowSceneDelegate:self];
}

id __58__CKChatSceneDelegate_scene_willConnectToSession_options___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 56);
  v5.super_class = (Class)CKChatSceneDelegate;
  return objc_msgSendSuper2(&v5, sel_scene_willConnectToSession_options_, v1, v2, v3);
}

- (void)windowSceneDidBecomeVisible:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKChatSceneDelegate;
  [(CKSceneDelegate *)&v3 windowSceneDidBecomeVisible:a3];
}

- (void)sceneWillEnterForeground:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKChatSceneDelegate;
  [(CKSceneDelegate *)&v5 sceneWillEnterForeground:a3];
  v4 = [(CKChatSceneDelegate *)self chatController];
  [v4 prepareForResume];

  [(CKSceneDelegate *)self updateSceneActivationConditions];
}

- (void)sceneDidEnterBackground:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKChatSceneDelegate;
  [(CKSceneDelegate *)&v5 sceneDidEnterBackground:a3];
  v4 = [(CKChatSceneDelegate *)self chatController];
  [v4 prepareForSuspend];
}

- (void)sceneDidDisconnect:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKChatSceneDelegate;
  [(CKSceneDelegate *)&v7 sceneDidDisconnect:a3];
  v4 = [(CKChatSceneDelegate *)self conversation];

  if (v4)
  {
    objc_super v5 = +[CKCurrentConversationsManager sharedInstance];
    v6 = [(CKChatSceneDelegate *)self conversation];
    [v5 removeConversation:v6];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CKChatSceneDelegate scene:openURLContexts:]";
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKChatSceneDelegate;
  [(CKSceneDelegate *)&v9 scene:v6 openURLContexts:v7];
  +[CKUserActivityHandler chatScene:v6 openURLContexts:v7];
}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CKChatSceneDelegate _scene:openItemProviders:]";
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKChatSceneDelegate;
  [(CKSceneDelegate *)&v9 _scene:v6 openItemProviders:v7];
}

- (void)setChatController:(id)a3
{
  objc_super v5 = (CKCoreChatController *)a3;
  if (self->_chatController != v5)
  {
    objc_super v9 = v5;
    objc_storeStrong((id *)&self->_chatController, a3);
    id v6 = +[CKUIBehavior sharedBehaviors];
    if ([v6 useMacToolbar])
    {
      id v7 = [(CKSceneDelegate *)self toolbarController];

      objc_super v5 = v9;
      if (!v7) {
        goto LABEL_7;
      }
      id v8 = [(CKSceneDelegate *)self toolbarController];
      [(CKCoreChatController *)v9 configureWithToolbarController:v8];

      [(CKCoreChatController *)v9 presentMacToolbarController];
    }
    else
    {
    }
    objc_super v5 = v9;
  }
LABEL_7:
}

- (id)conversation
{
  uint64_t v2 = [(CKChatSceneDelegate *)self chatController];
  objc_super v3 = [v2 conversation];

  return v3;
}

- (void)loadAndShowConversationWithMessageGUID:(id)a3 withInlineReplyOverlay:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CKChatSceneDelegate loadAndShowConversationWithMessageGUID:withInlineReplyOverlay:]";
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  id v8 = [MEMORY[0x1E4F6BC30] sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CKChatSceneDelegate_loadAndShowConversationWithMessageGUID_withInlineReplyOverlay___block_invoke;
  v10[3] = &unk_1E56213D0;
  v10[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  [v8 loadMessageWithGUID:v9 completionBlock:v10];
}

void __85__CKChatSceneDelegate_loadAndShowConversationWithMessageGUID_withInlineReplyOverlay___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 lastObject];
  if (v4)
  {
    objc_super v5 = *(void **)(a1 + 32);
    id v7 = v4;
    id v6 = [v4 guid];
    [v5 showConversationAndMessageForChatGUID:v6 messageGUID:*(void *)(a1 + 40) withInlineReplyOverlay:*(unsigned __int8 *)(a1 + 48) animate:1];

    v4 = v7;
  }
}

- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 withInlineReplyOverlay:(BOOL)a5 animate:(BOOL)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[CKChatSceneDelegate showConversationAndMessageForChatGUID:messageGUID:withInlineReplyOverlay:animate:]";
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v14, 0xCu);
    }
  }
  id v11 = +[CKConversationList sharedConversationList];
  BOOL v12 = [v11 conversationForExistingChatWithGUID:v8];

  if (v12)
  {
    if (v9
      && ([v12 ensureMessageWithGUIDIsLoaded:v9],
          (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(CKChatSceneDelegate *)self showConversation:v12 scrollToMessage:v13 withInlineReplyOverlay:1];
    }
    else
    {
      [(CKChatSceneDelegate *)self showConversation:v12];
    }
  }
}

- (void)showConversation:(id)a3
{
}

- (void)showConversation:(id)a3 scrollToMessage:(id)a4 withInlineReplyOverlay:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v32 = "-[CKChatSceneDelegate showConversation:scrollToMessage:withInlineReplyOverlay:]";
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  id v11 = [(CKChatSceneDelegate *)self conversation];

  if (v11)
  {
    BOOL v12 = +[CKCurrentConversationsManager sharedInstance];
    id v13 = [(CKChatSceneDelegate *)self conversation];
    [v12 removeConversation:v13];
  }
  if (v8)
  {
    int v14 = +[CKCurrentConversationsManager sharedInstance];
    [v14 addConversation:v8];

    uint64_t v15 = +[CKCurrentConversationsManager sharedInstance];
    [v15 loadHistoryForConversation:v8 keepAllCurrentlyLoadedMessages:0];

    [v8 isBusinessConversation];
    uint64_t v16 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConversation:v8];
    [v16 setDelegate:self];
    [v16 setSendMenuDelegate:self];
    [v16 setShouldShowDoneButton:CKIsRunningInMacCatalyst() == 0];
    [v16 setShowingInStandAloneWindow:1];
    [(CKChatSceneDelegate *)self setChatController:v16];
    uint64_t v17 = v16;
    v18 = v17;
  }
  else
  {
    uint64_t v17 = objc_alloc_init(CKBlankTranscriptController);
    [(CKChatSceneDelegate *)self setChatController:0];
    v18 = 0;
  }
  int v19 = [(CKChatSceneDelegate *)self navigationController];
  id v30 = v17;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v19 setViewControllers:v20];

  v21 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v20) = [v21 useMacToolbar];

  if (v20)
  {
    v22 = [(CKChatSceneDelegate *)self navigationController];
    [v22 setNavigationBarHidden:1];
  }
  v23 = [(CKChatSceneDelegate *)self navigationController];
  v24 = [v23 view];
  [v24 setNeedsLayout];

  v25 = [(CKChatSceneDelegate *)self navigationController];
  uint64_t v26 = [v25 view];
  [v26 layoutIfNeeded];

  [(CKSceneDelegate *)self updateSceneActivationConditions];
  [(CKSceneDelegate *)self updateSceneTitleForConversation:v8];
  if (v9 && v5)
  {
    uint64_t v27 = [(CKBlankTranscriptController *)v18 conversation];
    v28 = [v9 guid];
    id v29 = (id)[v27 ensureMessageWithGUIDIsLoaded:v28];

    [(CKBlankTranscriptController *)v18 scrollToMessage:v9 highlight:1 withInlineReplyOverlay:1];
  }
}

- (id)stateRestorationActivityForScene:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[CKChatSceneDelegate stateRestorationActivityForScene:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CKChatSceneDelegate;
  id v6 = [(CKSceneDelegate *)&v13 stateRestorationActivityForScene:v4];
  id v7 = [CKSceneDelegateState alloc];
  id v8 = [(CKChatSceneDelegate *)self conversation];
  id v9 = [v8 groupID];
  id v10 = [(CKSceneDelegateState *)v7 initWithUnreadMessages:0 groupID:v9 composingNewMessage:0 filterMode:0 showingInbox:0];

  id v11 = +[CKSceneDelegate userInfoDictionaryForState:v10];
  if (v11) {
    [v6 addUserInfoEntriesFromDictionary:v11];
  }

  return v6;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CKChatSceneDelegate scene:continueUserActivity:]";
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CKChatSceneDelegate;
  [(CKSceneDelegate *)&v18 scene:v6 continueUserActivity:v7];
  id v9 = [v7 userInfo];
  id v10 = +[CKSceneDelegate stateFromUserInfoDictionary:v9];

  if (v10)
  {
    id v11 = +[CKConversationList sharedConversationList];
    BOOL v12 = [v10 groupID];
    objc_super v13 = [v11 conversationForExistingChatWithChatIdentifier:v12];
    int v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      uint64_t v16 = +[CKConversationList sharedConversationList];
      uint64_t v17 = [v10 groupID];
      id v15 = [v16 conversationForExistingChatWithGroupID:v17];
    }
    [(CKChatSceneDelegate *)self showConversation:v15];
  }
}

- (void)_chatItemsDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CKChatSceneDelegate _chatItemsDidChange:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  id v6 = [(CKSceneDelegate *)self scene];
  BOOL v7 = [v6 activationState] == 2;

  if (v7)
  {
    id v8 = [v4 userInfo];
    id v9 = [v4 object];
    id v10 = [(CKChatSceneDelegate *)self conversation];
    id v11 = [v10 chat];
    BOOL v12 = v9 == v11;

    if (v12)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v26 = 0;
      int v19 = [v8 objectForKey:*MEMORY[0x1E4F6B8E0]];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __43__CKChatSceneDelegate__chatItemsDidChange___block_invoke;
      v22[3] = &unk_1E56213F8;
      id v23 = v9;
      v24 = buf;
      [v19 enumerateIndexesWithOptions:2 usingBlock:v22];
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        if (IMOSLoggingEnabled())
        {
          v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v21 = 0;
            _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Not snapshotting, update includes typing item", v21, 2u);
          }
        }
      }
      else
      {
        [(CKChatSceneDelegate *)self _updateAppSnapshot];
      }

      _Block_object_dispose(buf, 8);
    }
    else if (IMOSLoggingEnabled())
    {
      objc_super v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = [(CKChatSceneDelegate *)self conversation];
        id v15 = [v14 chat];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Not snapshotting, updated chat items for chat: %@ is not current chat: %@", buf, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [(CKSceneDelegate *)self scene];
      uint64_t v18 = [v17 activationState];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Not snapshotting, updated chat items but scene state isn't background: %lu", buf, 0xCu);
    }
  }
}

void __43__CKChatSceneDelegate__chatItemsDidChange___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = [*(id *)(a1 + 32) chatItems];
  id v7 = [v6 objectAtIndex:a2];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_handleRegistryWillUnregisterChatNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "++++ ChatKit Internal Consistency Error ++++", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = (id)objc_opt_class();
        id v10 = [v4 object];
        id v11 = objc_opt_class();
        *(_DWORD *)buf = 136315650;
        uint64_t v27 = "-[CKChatSceneDelegate _handleRegistryWillUnregisterChatNotification:]";
        __int16 v28 = 2112;
        id v29 = v9;
        __int16 v30 = 2112;
        id v31 = v11;
        id v12 = v11;
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      uint64_t v13 = objc_opt_class();
      int v14 = [v4 object];
      uint64_t v24 = v13;
      uint64_t v25 = objc_opt_class();
      id v23 = "-[CKChatSceneDelegate _handleRegistryWillUnregisterChatNotification:]";
      _CKLog();
    }
    if (_CKShouldLog()) {
      _CKLogBacktrace();
    }
  }
  id v15 = objc_msgSend(v4, "object", v23, v24, v25);
  uint64_t v16 = [(CKChatSceneDelegate *)self conversation];
  uint64_t v17 = [v16 chat];
  BOOL v18 = v15 == v17;

  if (v18)
  {
    if (IMOSLoggingEnabled())
    {
      int v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "The chat for this scene has been unregistered. Requesting scene destruction.", buf, 2u);
      }
    }
    [(CKChatSceneDelegate *)self showConversation:0];
    v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [(CKSceneDelegate *)self scene];
    v22 = [v21 session];
    [v20 requestSceneSessionDestruction:v22 options:0 errorHandler:&__block_literal_global_6];
  }
}

void __69__CKChatSceneDelegate__handleRegistryWillUnregisterChatNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error closing scene: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_handleChatDisplayNameChangedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "++++ ChatKit Internal Consistency Error ++++", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = (id)objc_opt_class();
        id v10 = [v4 object];
        id v11 = objc_opt_class();
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = "-[CKChatSceneDelegate _handleChatDisplayNameChangedNotification:]";
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v11;
        id v12 = v11;
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      uint64_t v13 = objc_opt_class();
      int v14 = [v4 object];
      uint64_t v22 = v13;
      uint64_t v23 = objc_opt_class();
      uint64_t v21 = "-[CKChatSceneDelegate _handleChatDisplayNameChangedNotification:]";
      _CKLog();
    }
    if (_CKShouldLog()) {
      _CKLogBacktrace();
    }
  }
  id v15 = objc_msgSend(v4, "object", v21, v22, v23);
  uint64_t v16 = [(CKChatSceneDelegate *)self conversation];
  uint64_t v17 = [v16 chat];
  BOOL v18 = v15 == v17;

  if (v18)
  {
    if (IMOSLoggingEnabled())
    {
      int v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "The display name for the chat has been changed. Updating scene title", buf, 2u);
      }
    }
    v20 = [(CKChatSceneDelegate *)self conversation];
    [(CKSceneDelegate *)self updateSceneTitleForConversation:v20];
  }
}

- (void)_handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification with notification: %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    uint64_t v6 = [v4 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(43);
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "++++ ChatKit Internal Consistency Error ++++", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(43);
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v10 = (id)objc_opt_class();
          id v11 = [v4 object];
          id v12 = objc_opt_class();
          *(_DWORD *)buf = 136315650;
          id v29 = "-[CKChatSceneDelegate _handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification:]";
          __int16 v30 = 2112;
          id v31 = v10;
          __int16 v32 = 2112;
          uint64_t v33 = v12;
          id v13 = v12;
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        uint64_t v14 = objc_opt_class();
        id v15 = [v4 object];
        uint64_t v26 = v14;
        uint64_t v27 = objc_opt_class();
        uint64_t v25 = "-[CKChatSceneDelegate _handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification:]";
        _CKLog();
      }
      if (_CKShouldLog()) {
        _CKLogBacktrace();
      }
    }
    uint64_t v16 = [(CKChatSceneDelegate *)self conversation];
    uint64_t v17 = [v16 chat];
    BOOL v18 = [v17 guid];

    int v19 = [v4 object];
    if ([v19 containsObject:v18])
    {
      [(CKChatSceneDelegate *)self showConversation:0];
      v20 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v21 = [(CKSceneDelegate *)self scene];
      uint64_t v22 = [v21 session];
      [v20 requestSceneSessionDestruction:v22 options:0 errorHandler:&__block_literal_global_137];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v4;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Currently shown conversation is not deleted as apart of notification: %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "CKChatSceneDelegate: Warning - nil notification for _handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification", buf, 2u);
    }
  }
}

void __89__CKChatSceneDelegate__handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error closing scene: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_updateAppSnapshot
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[CKChatSceneDelegate _updateAppSnapshot]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Scheduling snapshot generation", (uint8_t *)&v5, 2u);
    }
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___updateAppSnapshot object:0];
  [(CKChatSceneDelegate *)self performSelector:sel___updateAppSnapshot withObject:0 afterDelay:2.0];
}

- (void)__updateAppSnapshot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CKChatSceneDelegate __updateAppSnapshot]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  int v4 = [(CKSceneDelegate *)self scene];
  uint64_t v5 = [v4 activationState];

  if (v5 == 2)
  {
    if (CKIsScreenLocked())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Not snapshotting, iOS device is locked", buf, 2u);
        }
      }
    }
    else
    {
      im_main_thread();
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(CKSceneDelegate *)self scene];
      uint64_t v9 = [v8 activationState];
      *(_DWORD *)buf = 134217984;
      id v11 = (const char *)v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Not snapshotting, scene state isn't background: %lu", buf, 0xCu);
    }
  }
}

void __42__CKChatSceneDelegate___updateAppSnapshot__block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Telling UIKit to update our scene snapshot", v6, 2u);
    }
  }
  objc_super v3 = [MEMORY[0x1E4F42738] sharedApplication];
  int v4 = [*(id *)(a1 + 32) scene];
  uint64_t v5 = [v4 session];
  [v3 requestSceneSessionRefresh:v5];
}

- (NSSet)alertSuppressionContexts
{
  objc_super v3 = [MEMORY[0x1E4F1CA80] set];
  int v4 = [(CKChatSceneDelegate *)self conversation];

  if (v4)
  {
    uint64_t v5 = [(CKChatSceneDelegate *)self conversation];
    uint64_t v6 = +[CKAlertSuppressionContextHelper alertSuppressionContextsForVisibleChatControllerWithConversation:v5];

    [v3 addObjectsFromArray:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Not adding alert suppression contexts for conversation: no conversation found", v10, 2u);
    }
  }
  id v8 = (void *)[v3 copy];

  return (NSSet *)v8;
}

- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4
{
  id v5 = a4;
  sendMenuPresentation = self->_sendMenuPresentation;
  if (sendMenuPresentation)
  {
    [(CKSendMenuPresentation *)sendMenuPresentation dismissAnimated:0 completion:0];
    uint64_t v7 = self->_sendMenuPresentation;
    self->_sendMenuPresentation = 0;
  }
  id v8 = [(CKSceneDelegate *)self window];
  uint64_t v9 = [v8 rootViewController];
  id v10 = (void *)[v5 newSendMenuPresentationWithPresentingViewController:v9 delegate:self];
  [(CKChatSceneDelegate *)self setSendMenuPresentation:v10];

  id v11 = [(CKChatSceneDelegate *)self sendMenuPresentation];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__CKChatSceneDelegate_chatController_requestPresentSendMenu___block_invoke;
  v13[3] = &unk_1E5620C40;
  id v14 = v5;
  id v12 = v5;
  [v11 beginPresentationWithCompletion:v13];
}

uint64_t __61__CKChatSceneDelegate_chatController_requestPresentSendMenu___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFinishPresentTransition];
}

- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4
{
  [(CKSendMenuPresentation *)self->_sendMenuPresentation removeSendMenuFromViewHierarchy];
  sendMenuPresentation = self->_sendMenuPresentation;
  self->_sendMenuPresentation = 0;
}

- (BOOL)shouldConfigureChatControllerAsCollapsed
{
  return 0;
}

- (void)chatController:(id)a3 requestDeleteJunkConversation:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CKConversationList sharedConversationList];
  [v8 deleteConversation:v7];
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [(CKSceneDelegate *)self scene];
      id v11 = [v10 session];
      id v12 = [v11 persistentIdentifier];
      int v16 = 138412290;
      uint64_t v17 = v12;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Junk conversation deleted, closing scene: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v13 = [MEMORY[0x1E4F42738] sharedApplication];
  id v14 = [(CKSceneDelegate *)self scene];
  id v15 = [v14 session];
  [v13 requestSceneSessionDestruction:v15 options:0 errorHandler:&__block_literal_global_145];
}

void __68__CKChatSceneDelegate_chatController_requestDeleteJunkConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error closing scene: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)chatController:(id)a3 requestRecoverJunkConversation:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = +[CKConversationList sharedConversationList];
  v7[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  [v5 recoverJunkMessagesInConversations:v6];
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  objc_super v3 = [(CKChatSceneDelegate *)self navigationController];
  [v3 systemMinimumLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [v3 view];
  uint64_t v13 = [v12 effectiveUserInterfaceLayoutDirection];

  if (v13) {
    double v14 = v11;
  }
  else {
    double v14 = v7;
  }
  if (!v13) {
    double v7 = v11;
  }

  double v15 = v5;
  double v16 = v14;
  double v17 = v9;
  double v18 = v7;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  objc_super v3 = [(CKChatSceneDelegate *)self navigationController];
  double v4 = [v3 view];
  [v4 safeAreaInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)doneButtonPressedForChatController:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = [(CKSceneDelegate *)self scene];
      double v7 = [v6 session];
      double v8 = [v7 persistentIdentifier];
      int v12 = 138412290;
      double v13 = v8;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Closing scene for doneButtonPressedForChatController: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  double v9 = [MEMORY[0x1E4F42738] sharedApplication];
  double v10 = [(CKSceneDelegate *)self scene];
  double v11 = [v10 session];
  [v9 requestSceneSessionDestruction:v11 options:0 errorHandler:&__block_literal_global_147];
}

void __58__CKChatSceneDelegate_doneButtonPressedForChatController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error closing scene for doneButtonPressedForChatController: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)dismissDetailsViewAndShowConversationList
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = [(CKSceneDelegate *)self scene];
      id v5 = [v4 session];
      uint64_t v6 = [v5 persistentIdentifier];
      int v10 = 138412290;
      double v11 = v6;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Closing scene for dismissDetailsViewAndShowConversationList: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  double v7 = [MEMORY[0x1E4F42738] sharedApplication];
  double v8 = [(CKSceneDelegate *)self scene];
  double v9 = [v8 session];
  [v7 requestSceneSessionDestruction:v9 options:0 errorHandler:&__block_literal_global_149_0];
}

void __64__CKChatSceneDelegate_dismissDetailsViewAndShowConversationList__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error closing scene for dismissDetailsViewAndShowConversationList: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)chatController:(id)a3 didDetachDetailsNavigationController:(id)a4
{
  [(CKChatSceneDelegate *)self setDetailsNavigationController:a4];
  id v5 = [(CKChatSceneDelegate *)self detailsNavigationController];
  [v5 setIsDetached:1];
}

- (BOOL)hasDetailsNavigationController
{
  id v2 = [(CKChatSceneDelegate *)self detailsNavigationController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isDetailsNavigationControllerDetached
{
  id v2 = [(CKChatSceneDelegate *)self detailsNavigationController];
  char v3 = [v2 isDetached];

  return v3;
}

- (void)presentDetailsNavigationController:(id)a3
{
  id v6 = a3;
  id v4 = [(CKChatSceneDelegate *)self detailsNavigationController];

  id v5 = v6;
  if (v4 != v6)
  {
    [(CKChatSceneDelegate *)self setDetailsNavigationController:v6];
    id v5 = v6;
  }
}

- (void)dismissDetailsNavigationController
{
  char v3 = [(CKChatSceneDelegate *)self detailsNavigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [(CKChatSceneDelegate *)self setDetailsNavigationController:0];
}

- (void)dismissAndReopenDetailsNavigationController
{
  char v3 = [(CKChatSceneDelegate *)self detailsNavigationController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__CKChatSceneDelegate_dismissAndReopenDetailsNavigationController__block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __66__CKChatSceneDelegate_dismissAndReopenDetailsNavigationController__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) chatController];
  [v1 presentDetailsViewController];
}

- (void)setupCKDismissOnInteractionView
{
  char v3 = [CKInteractionNotificationView alloc];
  id v4 = [(CKSceneDelegate *)self window];
  [v4 bounds];
  id v5 = -[CKInteractionNotificationView initWithFrame:](v3, "initWithFrame:");
  [(CKChatSceneDelegate *)self setDismissOnInteractionView:v5];

  id v6 = [(CKChatSceneDelegate *)self dismissOnInteractionView];
  [v6 setDelegate:self];

  double v7 = [(CKChatSceneDelegate *)self dismissOnInteractionView];
  [v7 setAutoresizingMask:18];

  id v9 = [(CKSceneDelegate *)self window];
  double v8 = [(CKChatSceneDelegate *)self dismissOnInteractionView];
  [v9 addSubview:v8];
}

- (void)tearDownCKDismissOnInteractionView
{
  char v3 = [(CKChatSceneDelegate *)self dismissOnInteractionView];
  [v3 removeFromSuperview];

  [(CKChatSceneDelegate *)self setDismissOnInteractionView:0];
}

- (id)prefersToActivatePredicate
{
  char v3 = [(CKChatSceneDelegate *)self conversation];
  id v4 = [(CKSceneDelegate *)self predicateMatchingConversation:v3];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }
  id v6 = v5;

  return v6;
}

- (id)activeSendMenuPresentationForChatController:(id)a3
{
  return self->_sendMenuPresentation;
}

- (void)didDismissSendMenu:(id)a3 usingPresentationContext:(id)a4
{
}

- (id)newInputSnapshotView
{
  if (!self->_chatController) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  chatController = self->_chatController;

  return (id)[(CKCoreChatController *)chatController newInputSnapshotView];
}

- (void)requestShowKeyboardSnapshotForSendMenu
{
  char v3 = [(CKChatSceneDelegate *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    chatController = self->_chatController;
    [(CKCoreChatController *)chatController requestShowKeyboardSnapshotForSendMenu];
  }
}

- (void)requestDismissKeyboardSnapshotForSendMenu
{
  char v3 = [(CKChatSceneDelegate *)self chatController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    chatController = self->_chatController;
    [(CKCoreChatController *)chatController requestDismissKeyboardSnapshotForSendMenu];
  }
}

- (id)viewToSizeEffectPreviewOverlay
{
  id v2 = [(CKSceneDelegate *)self window];
  char v3 = [v2 rootViewController];
  id v4 = [v3 view];

  return v4;
}

- (CKDetailsNavigationController)detailsNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsNavigationController);

  return (CKDetailsNavigationController *)WeakRetained;
}

- (void)setDetailsNavigationController:(id)a3
{
}

- (CKNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (CKCoreChatController)chatController
{
  return self->_chatController;
}

- (CKInteractionNotificationView)dismissOnInteractionView
{
  return self->_dismissOnInteractionView;
}

- (void)setDismissOnInteractionView:(id)a3
{
}

- (CKSendMenuPresentation)sendMenuPresentation
{
  return self->_sendMenuPresentation;
}

- (void)setSendMenuPresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendMenuPresentation, 0);
  objc_storeStrong((id *)&self->_dismissOnInteractionView, 0);
  objc_storeStrong((id *)&self->_chatController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_destroyWeak((id *)&self->_detailsNavigationController);
}

@end