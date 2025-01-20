@interface CKUserActivityHandler
+ (BOOL)_messageUnknownFilteringEnabled;
+ (BOOL)hasBusinessRecipientWithRecipientIDs:(id)a3;
+ (BOOL)isPreferencesURL:(id)a3;
+ (BOOL)restoreState:(id)a3 navigationProvider:(id)a4;
+ (BOOL)restoreStateFromUserActivity:(id)a3 withNavigationProvider:(id)a4;
+ (id)conversationfromLaunchEventContext:(id)a3;
+ (id)createPluginPayloadForCloudKit:(id)a3;
+ (id)createPluginPayloadForCloudKitPlusCollaborationMetadata:(id)a3 shareOptions:(id)a4;
+ (id)createPluginPayloadForCloudKitWithLaunchContext:(id)a3;
+ (id)createPluginPayloadForFileProvider:(id)a3 sendCopyFileURLs:(id)a4;
+ (id)createPluginPayloadForPendingCollaboration:(id)a3;
+ (id)finalCompositionFromExistingComposition:(id)a3 pluginPayloadComposition:(id)a4 shareOptions:(id)a5;
+ (id)validIntentDictionaryWithURLParameters:(id)a3;
+ (void)_sendCollaborationInitationForURL:(id)a3 originatingProcess:(id)a4 chat:(id)a5 conversation:(id)a6 recipientIDs:(id)a7 navigationProvider:(id)a8 animate:(BOOL)a9;
+ (void)_setMessageFilterModeBy:(id)a3 navigationProvider:(id)a4;
+ (void)_showPeerPaymentUIForPerson:(id)a3 amount:(id)a4 navigationProvider:(id)a5 chatController:(id)a6;
+ (void)chatScene:(id)a3 openURLContexts:(id)a4;
+ (void)chatScene:(id)a3 willConnectToSession:(id)a4 userActivities:(id)a5 urlContexts:(id)a6 windowSceneDelegate:(id)a7;
+ (void)compositionFromDictionary:(id)a3 completion:(id)a4;
+ (void)fileProviderCompositionFromPluginPayload:(id)a3 url:(id)a4 shareOptions:(id)a5 previousComposition:(id)a6 completion:(id)a7;
+ (void)loadConversationWithMessageGUID:(id)a3 withInlineReplyOverlay:(BOOL)a4 navigationProvider:(id)a5;
+ (void)messagesScene:(id)a3 continueUserActivity:(id)a4 withNavigationProvider:(id)a5 chatController:(id)a6 completion:(id)a7;
+ (void)messagesScene:(id)a3 willConnectToSession:(id)a4 userActivities:(id)a5 stateRestorationActivity:(id)a6 windowSceneDelegate:(id)a7;
+ (void)openItemProviders:(id)a3 navigationProvider:(id)a4 chatController:(id)a5;
+ (void)openSMSURL:(id)a3 animate:(BOOL)a4 navigationProvider:(id)a5 chatController:(id)a6 originatingProcess:(id)a7;
+ (void)openSURFURL:(id)a3 navigationProvider:(id)a4;
+ (void)openURL:(id)a3 animate:(BOOL)a4 sourceApplication:(id)a5 originatingProcess:(id)a6 navigationProvider:(id)a7 chatController:(id)a8 completion:(id)a9;
+ (void)processAppleEventDictionary:(id)a3 animate:(BOOL)a4 navigationProvider:(id)a5 chatController:(id)a6;
+ (void)sendBackgroundCollaborationForUserActivity:(id)a3 withNavigationProvider:(id)a4 chatController:(id)a5 completion:(id)a6;
+ (void)setChatControllerCompositionForConversation:(id)a3 navigationProvider:(id)a4 composition:(id)a5;
+ (void)setupFinalCompositionWithExistingComposition:(id)a3 withPluginPayloadComposition:(id)a4 shareOptions:(id)a5 conversation:(id)a6 animated:(BOOL)a7 navigationProvider:(id)a8;
+ (void)showConversation:(id)a3 animated:(BOOL)a4 navigationProvider:(id)a5;
+ (void)updateChatController:(id)a3 composition:(id)a4;
@end

@implementation CKUserActivityHandler

+ (void)messagesScene:(id)a3 willConnectToSession:(id)a4 userActivities:(id)a5 stateRestorationActivity:(id)a6 windowSceneDelegate:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      v21 = "+[CKUserActivityHandler messagesScene:willConnectToSession:userActivities:stateRestorationActivity:windowSceneDelegate:]";
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v20, 0xCu);
    }
  }
  if ([v13 count])
  {
    v17 = [v13 anyObject];
    [v15 scene:v11 continueUserActivity:v17];
  }
  else
  {
    v18 = [v14 activityType];
    int v19 = [v18 isEqualToString:@"com.apple.Messages.StateRestoration"];

    if (v19) {
      [v15 scene:v11 continueUserActivity:v14];
    }
  }
}

+ (void)chatScene:(id)a3 willConnectToSession:(id)a4 userActivities:(id)a5 urlContexts:(id)a6 windowSceneDelegate:(id)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [v13 anyObject];
  if (v16
    || ([v12 stateRestorationActivity], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = v16;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Chat Scene - Found non-state restoration user activity in connection options: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    [v15 scene:v11 continueUserActivity:v16];
  }
  if (v14)
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = v14;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Chat Scene - Found non-state restoration url contexts in connection options: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    [v15 scene:v11 openURLContexts:v14];
  }
}

+ (void)chatScene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = [v6 anyObject];
    v10 = [v9 URL];
    unsigned __int8 v20 = 0;
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v10;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Chat Scene - opening url: %@", buf, 0xCu);
      }
    }
    id v12 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    id v19 = 0;
    id v13 = [v12 chatForURL:v10 outMessageText:0 outRecipientIDs:0 outService:0 outMessageGUID:&v19 presentOverlay:&v20];
    id v14 = v19;

    id v15 = [v5 delegate];
    v16 = v15;
    if (v14)
    {
      [v15 loadAndShowConversationWithMessageGUID:v14 withInlineReplyOverlay:v20];
    }
    else
    {
      v17 = +[CKConversationList sharedConversationList];
      v18 = [v17 conversationForExistingChat:v13];

      [v16 showConversation:v18];
    }
  }
}

+ (void)messagesScene:(id)a3 continueUserActivity:(id)a4 withNavigationProvider:(id)a5 chatController:(id)a6 completion:(id)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v68 = a7;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v75 = "+[CKUserActivityHandler messagesScene:continueUserActivity:withNavigationProvider:chatController:completion:]";
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  id v15 = [v11 activityType];
  int v16 = [v15 isEqualToString:@"com.apple.Messages.StateRestoration"];

  if (v16)
  {
    [(id)objc_opt_class() restoreStateFromUserActivity:v11 withNavigationProvider:v12];
    goto LABEL_7;
  }
  uint64_t v21 = [v11 activityType];
  int v22 = [v21 isEqualToString:*MEMORY[0x1E4F28AC0]];

  if (v22)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CB10];
    v24 = [v11 webpageURL];
    unsigned __int8 v20 = [v23 ckSMSURLFromBusinessChatURL:v24];

    if (v20)
    {
      BOOL v25 = [v67 activationState] == 0;
      v26 = objc_opt_class();
      v27 = [v11 _sourceApplication];
      v28 = [v11 _originatingProcess];
      [v26 openURL:v20 animate:v25 sourceApplication:v27 originatingProcess:v28 navigationProvider:v12 chatController:v13 completion:v68];

      goto LABEL_54;
    }
    goto LABEL_7;
  }
  v38 = [v11 activityType];
  int v39 = [v38 isEqualToString:@"com.apple.Messages.BackgroundCollaboration"];

  if (v39)
  {
    [(id)objc_opt_class() sendBackgroundCollaborationForUserActivity:v11 withNavigationProvider:v12 chatController:v13 completion:v68];
    goto LABEL_7;
  }
  v40 = [v11 activityType];
  int v41 = [v40 isEqualToString:@"StagedActivityData"];

  if (!v41)
  {
LABEL_7:
    v17 = (void *)MEMORY[0x1E4F1CB10];
    v18 = [v11 userInfo];
    id v19 = [v18 objectForKey:*MEMORY[0x1E4F6BA10]];
    unsigned __int8 v20 = [v17 URLWithString:v19];

    if (v20)
    {
      objc_msgSend((id)objc_opt_class(), "openURL:animate:sourceApplication:originatingProcess:navigationProvider:chatController:completion:", v20, objc_msgSend(v67, "activationState") == 0, 0, 0, v12, v13, v68);
      goto LABEL_54;
    }
    if (messagesScene_continueUserActivity_withNavigationProvider_chatController_completion__onceToken != -1) {
      dispatch_once(&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion__onceToken, &__block_literal_global_213);
    }
    if (messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier)
    {
      v29 = [v11 userInfo];
      v66 = [v29 objectForKey:messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier];

      if (v66)
      {
        id v30 = v66;
        if ([v30 hasPrefix:@"at_"])
        {
          v31 = [v30 componentsSeparatedByString:@"_"];
          uint64_t v32 = [v31 lastObject];

          id v30 = (id)v32;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_2;
        aBlock[3] = &unk_1E562AD58;
        id v73 = v12;
        v33 = _Block_copy(aBlock);
        v34 = [MEMORY[0x1E4F6BC30] sharedInstance];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_3;
        v69[3] = &unk_1E562AD80;
        id v70 = v30;
        id v71 = v33;
        id v35 = v30;
        id v36 = v33;
        [v34 loadMessageWithGUID:v35 completionBlock:v69];

        v37 = v73;
LABEL_19:

        goto LABEL_54;
      }
      if (messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType
        && messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString)
      {
        id v35 = [v11 activityType];
        if ([(id)messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType isEqualToString:v35])
        {
          v53 = [v11 userInfo];
          v37 = [v53 objectForKey:messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString];

          [v12 performSearchForQuery:v37];
          v54 = [MEMORY[0x1E4F42738] sharedApplication];
          v55 = [v54 testPerformSearchDelegate];

          if (v55)
          {
            v56 = [MEMORY[0x1E4F42738] sharedApplication];
            v57 = [v56 testPerformSearchDelegate];
            [v57 testPerformSearch:v37];
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(33);
        v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v52, OS_LOG_TYPE_INFO, "Couldn't find CoreSpotlight symbols", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
        _CKLogExternal();
      }
    }
    v59 = [v11 interaction];
    v60 = [v59 intent];

    v61 = [v11 interaction];
    if (+[SMSApplicationIntentsHelper isSendMessageInteraction:v61])
    {
      v62 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      v63 = +[CKConversationList sharedConversationList];
      +[SMSApplicationIntentsHelper continueWithSendMessageInteraction:v61 chatRegistry:v62 navigationProvider:v12 conversationList:v63 chatController:v13];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v64 = v60;
        v62 = [v64 payee];
        v63 = [v64 currencyAmount];

        [(id)objc_opt_class() _showPeerPaymentUIForPerson:v62 amount:v63 navigationProvider:v12 chatController:v13];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_53:

          goto LABEL_54;
        }
        id v65 = v60;
        v62 = [v65 payer];
        v63 = [v65 currencyAmount];

        [(id)objc_opt_class() _showPeerPaymentUIForPerson:v62 amount:v63 navigationProvider:v12 chatController:v13];
      }
    }

    goto LABEL_53;
  }
  v42 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v43 = objc_opt_class();
  v44 = [v11 userInfo];
  v45 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4FADF48]];
  unsigned __int8 v20 = [v42 unarchivedObjectOfClass:v43 fromData:v45 error:0];

  v46 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v47 = objc_opt_class();
  v48 = [v11 userInfo];
  v49 = [v48 objectForKeyedSubscript:@"currentMembers"];
  v50 = [v46 unarchivedObjectOfClass:v47 fromData:v49 error:0];

  if (v20)
  {
    v51 = +[CKComposition compositionForTUConversationActivity:v20];
    [v12 showNewMessageCompositionPanelWithRecipients:v50 composition:v51 animated:0];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(33);
      v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v58, OS_LOG_TYPE_INFO, "Failed to unarchive activity.", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
  }

LABEL_54:
}

void __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke()
{
  if (!messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier)
  {
    v0 = (void **)MEMORY[0x192FBA870]("CSSearchableItemActivityIdentifier", @"CoreSpotlight");
    if (v0) {
      v1 = *v0;
    }
    else {
      v1 = 0;
    }
    objc_storeStrong((id *)&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier, v1);
  }
  if (!messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType)
  {
    v2 = (void **)MEMORY[0x192FBA870]("CSQueryContinuationActionType", @"CoreSpotlight");
    if (v2) {
      v3 = *v2;
    }
    else {
      v3 = 0;
    }
    objc_storeStrong((id *)&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType, v3);
  }
  if (!messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString)
  {
    v4 = (void **)MEMORY[0x192FBA870]("CSSearchQueryString", @"CoreSpotlight");
    if (v4) {
      id v5 = *v4;
    }
    else {
      id v5 = 0;
    }
    objc_storeStrong((id *)&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString, v5);
  }
}

uint64_t __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) showConversationAndMessageForChatGUID:a2 messageGUID:a3 animate:0];
}

void __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = [a3 lastObject];
  id v5 = [v6 guid];
  (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, *(void *)(a1 + 32));
}

+ (BOOL)restoreStateFromUserActivity:(id)a3 withNavigationProvider:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 userInfo];
  v9 = +[CKSceneDelegate stateFromUserInfoDictionary:v8];

  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = CKConversationListFilterModeStringValue([v9 filterMode]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "[Filter Mode] Restore state made with filter mode: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v19 = 2112;
      unsigned __int8 v20 = v9;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Restoring messages scene state from user activity: %@, with state: %@", buf, 0x16u);
    }
  }
  if (v9)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v7);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__CKUserActivityHandler_restoreStateFromUserActivity_withNavigationProvider___block_invoke;
    v15[3] = &unk_1E5624D70;
    v17[1] = a1;
    id v16 = v9;
    objc_copyWeak(v17, (id *)buf);
    [v7 setDeferredHandleURLBlock:v15];
    objc_destroyWeak(v17);

    objc_destroyWeak((id *)buf);
  }
  else if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "State is nil, no state to restore to.", buf, 2u);
    }
  }
  return v9 != 0;
}

void __77__CKUserActivityHandler_restoreStateFromUserActivity_withNavigationProvider___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Messages controller deferredHandleURLBlock called, restoring state", v6, 2u);
    }
  }
  v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 restoreState:v4 navigationProvider:WeakRetained];
}

+ (BOOL)restoreState:(id)a3 navigationProvider:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Restoring state: %@", buf, 0xCu);
    }
  }
  v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (![v8 integerForKey:@"BypassStateRestore"])
  {
    char v9 = [MEMORY[0x1E4F42738] shouldMakeUIForDefaultPNG];
    char v10 = v5 ? v9 : 1;
    if ((v10 & 1) == 0)
    {
      int v13 = [(__CFString *)v5 composingNewMessage];
      id v14 = [(__CFString *)v5 groupID];
      id v15 = [(__CFString *)v5 unreadLastMessages];
      unint64_t v16 = [(__CFString *)v5 filterMode];
      if (IMOSLoggingEnabled())
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          CKConversationListFilterModeStringValue(v16);
          v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          id v67 = v18;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "[Filter Mode] Restoring with filter mode: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v20 = @"NO";
          *(_DWORD *)buf = 138412802;
          if (v13) {
            unsigned __int8 v20 = @"YES";
          }
          id v67 = v20;
          __int16 v68 = 2112;
          v69 = v14;
          __int16 v70 = 2112;
          id v71 = v15;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Restoring application state. isComposingNew=%@  groupID=%@ unreadLastMessages=%@", buf, 0x20u);
        }
      }
      uint64_t v21 = [v6 conversationListController];
      [v21 setFilterMode:v16];

      if ([(id)objc_opt_class() _messageUnknownFilteringEnabled])
      {
        int v22 = [v6 conversationListController];
        [v22 updateConversationList];
      }
      if (+[CKStarkManager isCarPlayConnected])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "  => CarPlay screen connected, restoring to converation list to ensure no messages are unintentionally marked as read.", buf, 2u);
          }
        }
        [v6 showConversationListWithAnimation:0];
LABEL_30:
        v24 = 0;
        char v25 = 1;
        goto LABEL_98;
      }
      if (v13)
      {
        if ([v6 currentCompositionHasContent])
        {
          if (IMOSLoggingEnabled())
          {
            v26 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "  => Already showing transcript or new composition", buf, 2u);
            }
          }
          goto LABEL_30;
        }
        if (([v6 isComposingMessage] & 1) == 0)
        {
          v37 = +[CKDraftManager sharedInstance];
          id v64 = 0;
          id v65 = 0;
          v38 = [v37 draftForPendingConversationWithRecipients:&v65 chatIdentifier:&v64];
          id v39 = v65;
          id v40 = v64;

          if (IMOSLoggingEnabled())
          {
            int v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = [v39 componentsJoinedByString:@", "];
              *(_DWORD *)buf = 138412546;
              id v67 = v42;
              __int16 v68 = 2112;
              v69 = v38;
              _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "  => Showing new message composition panel, recipients=%@   composition=%@", buf, 0x16u);
            }
          }
          [v6 showNewMessageCompositionPanelWithRecipients:v39 composition:v38 chatID:v40 animated:1];

          goto LABEL_30;
        }
      }
      v27 = [MEMORY[0x1E4F6BC98] sharedInstance];
      if ([v27 isConnected])
      {
        v28 = +[CKConversationList sharedConversationList];
        if (![v28 loadedConversations])
        {
          v34 = +[CKUIBehavior sharedBehaviors];
          int v35 = [v34 showsCompositionPanel];

          if (v35)
          {
            if (IMOSLoggingEnabled())
            {
              id v36 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "  => Showing empty new message composition panel", buf, 2u);
              }
            }
            if (([v6 isComposingMessage] & 1) == 0) {
              [v6 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
            }
            goto LABEL_30;
          }
LABEL_42:
          if (!v14) {
            goto LABEL_48;
          }
          if (IMOSLoggingEnabled())
          {
            v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v67 = v14;
              _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "  => Looking up conversation with group ID: %@", buf, 0xCu);
            }
          }
          if ([(__CFString *)v14 isEqualToString:@"-1"]) {
            goto LABEL_48;
          }
          if (CKiMessageSupported())
          {
            if (IMOSLoggingEnabled())
            {
              id v30 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "    => Ensuring we have a connection to the daemon before looking up any conversations", buf, 2u);
              }
            }
            v31 = [MEMORY[0x1E4F6BC98] sharedInstance];
            [v31 blockUntilConnected];
          }
          uint64_t v32 = +[CKConversationList sharedConversationList];
          v33 = [v32 conversationForExistingChatWithChatIdentifier:v14];
          if (v33)
          {
            v24 = v33;
          }
          else
          {
            uint64_t v43 = +[CKConversationList sharedConversationList];
            v24 = [v43 conversationForExistingChatWithGroupID:v14];

            if (!v24)
            {
              if (IMOSLoggingEnabled())
              {
                v63 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v67 = v14;
                  _os_log_impl(&dword_18EF18000, v63, OS_LOG_TYPE_INFO, "  => No conversation found for ID %@", buf, 0xCu);
                }
              }
LABEL_48:
              v24 = 0;
              char v25 = 0;
              goto LABEL_98;
            }
          }
          if (IMOSLoggingEnabled())
          {
            v44 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v67 = v24;
              _os_log_impl(&dword_18EF18000, v44, OS_LOG_TYPE_INFO, "  => Found conversation: %@", buf, 0xCu);
            }
          }
          v45 = [(__CFString *)v24 unsentComposition];
          if (IMOSLoggingEnabled())
          {
            v46 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v67 = v45;
              _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_INFO, "  => Found composition: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v47 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              int v48 = [(__CFString *)v45 hasNonwhiteSpaceContent];
              v49 = @"NO";
              if (v48) {
                v49 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              id v67 = v49;
              _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "    => Found composition has non-whitespace: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              int v51 = [(__CFString *)v45 hasContent];
              v52 = @"NO";
              if (v51) {
                v52 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              id v67 = v52;
              _os_log_impl(&dword_18EF18000, v50, OS_LOG_TYPE_INFO, "    => Found composition has content: %@", buf, 0xCu);
            }
          }
          if ([(__CFString *)v45 hasContent])
          {
            if (IMOSLoggingEnabled())
            {
              v53 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v67 = v24;
                _os_log_impl(&dword_18EF18000, v53, OS_LOG_TYPE_INFO, "  => Conversation has unsent content, restoring to it: %@", buf, 0xCu);
              }
            }
            char v25 = [v6 resumeToConversation:v24];
          }
          else
          {
            char v25 = 0;
          }

LABEL_98:
          if ([(__CFString *)v24 isCurrentlyPlayingAudio])
          {
            if (IMOSLoggingEnabled())
            {
              v54 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18EF18000, v54, OS_LOG_TYPE_INFO, "Last active conversation is currently playing audio. Not restoring to conversation list.", buf, 2u);
              }
            }
            if (v25) {
              goto LABEL_131;
            }
          }
          else
          {
            if (v25) {
              goto LABEL_131;
            }
            if ([v6 shouldRestoreToConversationListForState:v5])
            {
              if (IMOSLoggingEnabled())
              {
                v55 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18EF18000, v55, OS_LOG_TYPE_INFO, "  => Showing unread conversations", buf, 2u);
                }
              }
              if ([v6 showUnreadConversationsWithLastConversation:v24 ignoringMessages:v15]) {
                goto LABEL_131;
              }
            }
          }
          v56 = [(__CFString *)v24 chat];
          v57 = [v56 lastMessage];
          BOOL v58 = v57 != 0;

          if (!v24) {
            BOOL v58 = 0;
          }
          if (IMOSLoggingEnabled())
          {
            v59 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = @"NO";
              *(_DWORD *)buf = 138413058;
              if (v58) {
                v61 = @"YES";
              }
              else {
                v61 = @"NO";
              }
              id v67 = v61;
              __int16 v68 = 2112;
              v69 = v24;
              if (!v57) {
                v60 = @"YES";
              }
              __int16 v70 = 2112;
              id v71 = v14;
              __int16 v72 = 2112;
              id v73 = v60;
              _os_log_impl(&dword_18EF18000, v59, OS_LOG_TYPE_INFO, "  => canRestoreToLastConversation: %@, lastConversation: %@, groupID: %@, isConversationEmpty: %@", buf, 0x2Au);
            }
          }
          if (!v58) {
            goto LABEL_129;
          }
          if (IMOSLoggingEnabled())
          {
            v62 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v62, OS_LOG_TYPE_INFO, "  => Restoring to last conversation", buf, 2u);
            }
          }
          if (([v6 resumeToConversation:v24] & 1) == 0)
          {
LABEL_129:
            if (![(__CFString *)v5 showingInbox])
            {
              BOOL v11 = 0;
              goto LABEL_132;
            }
            [v6 showInboxViewControllerAnimated:0];
          }
LABEL_131:
          BOOL v11 = 1;
LABEL_132:

          goto LABEL_11;
        }
      }
      goto LABEL_42;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (void)sendBackgroundCollaborationForUserActivity:(id)a3 withNavigationProvider:(id)a4 chatController:(id)a5 completion:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v41 = a4;
  id v39 = a5;
  id v40 = a6;
  if (IMOSLoggingEnabled())
  {
    char v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = [v9 userInfo];
      *(_DWORD *)buf = 138412290;
      id v48 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Received user activity to send background collaboration with userInfo: %@", buf, 0xCu);
    }
  }
  id v12 = [MEMORY[0x1E4FADA90] sharedInstance];
  uint64_t v13 = [v12 conversationManager];
  id v14 = (id)[(id)v13 activeConversations];

  id v15 = [v9 _originatingProcess];
  LOBYTE(v13) = [v15 hasEntitlement:@"com.apple.private.messages.collaboration-initiate-send"];

  if (v13)
  {
    unint64_t v16 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v36 = [v16 beginBackgroundTaskWithExpirationHandler:&__block_literal_global_192_0];

    v17 = [v9 userInfo];
    v38 = [v17 objectForKeyedSubscript:@"shud"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)MEMORY[0x1E4F28DC0];
      __int16 v19 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      v27 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
      id v46 = 0;
      v28 = [v18 unarchivedObjectOfClasses:v27 fromData:v38 error:&v46];
      id v29 = v46;

      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v48 = v28;
          _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Unarchived dictionary from user activity data: %@", buf, 0xCu);
        }
      }
      if (v28)
      {
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_204;
        v42[3] = &unk_1E562ADA8;
        id v43 = v9;
        uint64_t v45 = v36;
        id v44 = v41;
        [a1 compositionFromDictionary:v28 completion:v42];

        v31 = v43;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          int v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "No shud data so cannot send the collaboration", buf, 2u);
          }
        }
        v31 = [MEMORY[0x1E4F42738] sharedApplication];
        [v31 endBackgroundTask:v36];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Found no shud data on user activity so not able to share collaboration with FaceTime", buf, 2u);
        }
      }
      v28 = [MEMORY[0x1E4F42738] sharedApplication];
      [v28 endBackgroundTask:v36];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = [v9 _originatingProcess];
      *(_DWORD *)buf = 138412802;
      id v48 = v9;
      __int16 v49 = 2112;
      v50 = @"com.apple.private.messages.collaboration-initiate-send";
      __int16 v51 = 2112;
      v52 = v33;
      _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "received userActivity: (%@) to send collaboration but the originating process was missing the entitlement: %@ to do so: %@ ", buf, 0x20u);
    }
  }
}

void __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Background task expired for sending a background collaboration", v1, 2u);
    }
  }
}

void __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_204(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Created composition %@ from dictionary", (uint8_t *)&v17, 0xCu);
    }
  }
  id v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"FaceTimeUUID"];

  if (v6
    && ([MEMORY[0x1E4F6BC40] sharedRegistry],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 existingConversationForFaceTimeConversationUUID:v6],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v8;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Found FaceTime conversation for collaboration %@", (uint8_t *)&v17, 0xCu);
      }
    }
    char v10 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    BOOL v11 = [v10 chatForFaceTimeConversation:v8];

    if (v11
      && (+[CKConversationList sharedConversationList],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 conversationForExistingChat:v11],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          v12,
          v13))
    {
      [*(id *)(a1 + 40) showConversation:v13 animate:0];
      id v14 = [*(id *)(a1 + 40) chatController];
      [v3 setSourceApplicationID:@"com.apple.FaceTime"];
      +[CKFaceTimeCollaborationUtilities startCollaborationWithComposition:v3 faceTimeConversation:v8 imChat:v11 chatController:v14 backgroundTaskID:*(void *)(a1 + 48)];
    }
    else
    {
      unint64_t v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_204_cold_1((uint64_t *)(a1 + 32), v11 == 0, v16);
      }

      uint64_t v13 = [MEMORY[0x1E4F42738] sharedApplication];
      [v13 endBackgroundTask:*(void *)(a1 + 48)];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Did not find FaceTime conversation with UUID %@", (uint8_t *)&v17, 0xCu);
      }
    }
    v8 = [MEMORY[0x1E4F42738] sharedApplication];
    [v8 endBackgroundTask:*(void *)(a1 + 48)];
  }
}

+ (void)compositionFromDictionary:(id)a3 completion:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v6, "allKeys", v35);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "All keys in collaborationDictionary = %@", buf, 0xCu);
    }
  }
  id v9 = objc_msgSend(v6, "objectForKey:", @"fileObjects", v35);
  char v10 = [v9 objectForKeyedSubscript:@"fileURLs"];
  BOOL v11 = [v6 objectForKey:@"CKShare"];
  id v12 = [v6 objectForKey:@"CollaborationOptions"];
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__59;
  __int16 v51 = __Block_byref_object_dispose__59;
  id v52 = 0;
  id v52 = [v6 objectForKey:@"CollaborationShareOptions"];
  uint64_t v13 = v48[5];
  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v12 == 0;
  }
  if (!v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F3BE00] shareOptionsWithOptionsGroups:v12];
    unint64_t v16 = (void *)v48[5];
    v48[5] = v15;

    uint64_t v13 = v48[5];
  }
  if (!v13 && v12)
  {
    uint64_t v17 = [MEMORY[0x1E4F3BE00] shareOptionsWithOptionsGroups:v12];
    id v18 = (void *)v48[5];
    v48[5] = v17;
  }
  uint64_t v19 = [v6 objectForKey:@"CollaborationMetadata"];
  uint64_t v20 = [v6 objectForKey:@"CollaborationMode"];
  int v21 = [v20 BOOLValue];

  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = @"NO";
      uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))v48[5];
      if (v21) {
        uint64_t v23 = @"YES";
      }
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v59 = v24;
      *(_WORD *)v60 = 2112;
      *(void *)&v60[2] = v19;
      *(_WORD *)&v60[10] = 2112;
      *(void *)&v60[12] = v23;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Data received from collaborationDictionary: fileObject: %@, cloudKitObjects: %@, share options: %@, metadata: %@, isCollaborative: %@", buf, 0x34u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "CollaborationMetadata from collaborationDictionary %@", buf, 0xCu);
    }
  }
  if ([v9 count] && objc_msgSend(v10, "count"))
  {
    uint64_t v26 = [v9 objectForKeyedSubscript:@"fileURLs"];
    v27 = +[CKUserActivityHandler createPluginPayloadForFileProvider:v26 sendCopyFileURLs:MEMORY[0x1E4F1CBF0]];
  }
  else if ([v11 count])
  {
    v27 = +[CKUserActivityHandler createPluginPayloadForCloudKitPlusCollaborationMetadata:v11 shareOptions:v48[5]];
  }
  else
  {
    v27 = 0;
  }
  [v27 setSendAsCopy:v21 ^ 1u];
  if (objc_opt_respondsToSelector())
  {
    v28 = [(id)v48[5] summary];
    id v29 = v28;
    if (!v28)
    {
      uint64_t v4 = CKFrameworkBundle();
      id v29 = [v4 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    [v27 setCollaborationOptionsSummary:v29];
    if (!v28)
    {
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__59;
  *(void *)v60 = __Block_byref_object_dispose__59;
  *(void *)&v60[8] = 0;
  *(void *)&v60[8] = [v6 objectForKey:@"token"];
  if (IMOSLoggingEnabled())
  {
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = *(void *)(*(void *)&buf[8] + 40);
      LODWORD(v53) = 138412290;
      *(void *)((char *)&v53 + 4) = v31;
      _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "kevin@@@ token %@", (uint8_t *)&v53, 0xCu);
    }
  }
  *(void *)&long long v53 = 0;
  *((void *)&v53 + 1) = &v53;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__59;
  v56 = __Block_byref_object_dispose__59;
  id v57 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__59;
  v45[4] = __Block_byref_object_dispose__59;
  id v46 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke;
  v37[3] = &unk_1E562AE20;
  id v32 = v27;
  id v38 = v32;
  id v33 = v10;
  id v39 = v33;
  id v41 = buf;
  v42 = v45;
  id v43 = &v53;
  id v44 = &v47;
  id v34 = v36;
  id v40 = v34;
  +[CKComposition compositionWithShelfPluginPayload:v32 completionHandler:v37];

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v47, 8);
}

void __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) payloadCollaborationType] == 1)
  {
    id v7 = [*(id *)(a1 + 40) firstObject];
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "FileProvider backed collaboration. Loading media object object from item at url: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      [v9 UTF8String];
      BOOL v10 = sandbox_extension_consume() == -1;
      int v11 = IMOSLoggingEnabled();
      if (v10)
      {
        if (v11)
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v17;
            _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Failed to consume sandbox token: %@", (uint8_t *)&buf, 0xCu);
          }
          goto LABEL_24;
        }
      }
      else if (v11)
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Succesfully consumed sandbox token", (uint8_t *)&buf, 2u);
        }
LABEL_24:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "No sandbox token", (uint8_t *)&buf, 2u);
      }
      goto LABEL_24;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__59;
    uint64_t v36 = __Block_byref_object_dispose__59;
    id v37 = 0;
    id v37 = [*(id *)(a1 + 32) url];
    id v18 = [v7 lastPathComponent];
    uint64_t v19 = [v18 stringByRemovingPercentEncoding];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke_247;
    v24[3] = &unk_1E562ADF8;
    uint64_t v29 = *(void *)(a1 + 64);
    id v20 = v7;
    uint64_t v21 = *(void *)(a1 + 72);
    id v25 = v20;
    uint64_t v30 = v21;
    id v22 = v5;
    uint64_t v23 = *(void *)(a1 + 80);
    id v26 = v22;
    uint64_t v31 = v23;
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 48);
    p_long long buf = &buf;
    +[CKComposition mediaObjectFromItemAtURL:v20 filename:v19 completion:v24];

    _Block_object_dispose(&buf, 8);
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Collaboration is not backed by FP. Will not load media object.", (uint8_t *)&buf, 2u);
    }
  }
  uint64_t v14 = [v5 compositionWithCollaborationShareOptions:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  unint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_26:
}

void __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke_247(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412802;
      id v26 = v6;
      __int16 v27 = 2112;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Created mediaObject: %@ from url: %@. Error: %@", buf, 0x20u);
    }
  }
  BOOL v10 = +[CKComposition compositionWithShelfMediaObject:v6];
  uint64_t v11 = [*(id *)(a1 + 40) compositionByAppendingComposition:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) compositionWithCollaborationShareOptions:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  unint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = [*(id *)(a1 + 48) collaborationMetadata];

  int v18 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v18)
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "PluginPayload already has collaboration metadata so not updating now", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (v18)
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        id v26 = v21;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Did not receive metadata for file URL %@ , fetching metadata", buf, 0xCu);
      }
    }
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 32);
    id v24 = *(id *)(a1 + 56);
    SWCollaborationMetadataForDocumentURL();
  }
}

void __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke_248(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int v11 = 138412546;
        id v12 = v8;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "error loading collaboration metadata for documentURL: %@ error:%@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) setCollaborationMetadata:v5];
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        BOOL v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int v11 = 138412546;
        id v12 = v5;
        __int16 v13 = 2112;
        id v14 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Received updated collaborationMetadata: %@ for document url: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    +[CKUserActivityHandler fileProviderCompositionFromPluginPayload:*(void *)(a1 + 32) url:*(void *)(a1 + 40) shareOptions:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) previousComposition:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) completion:*(void *)(a1 + 48)];
  }
}

+ (void)fileProviderCompositionFromPluginPayload:(id)a3 url:(id)a4 shareOptions:(id)a5 previousComposition:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke;
  v21[3] = &unk_1E562AE70;
  id v22 = v12;
  id v23 = v11;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v11;
  id v20 = v12;
  +[CKComposition compositionWithShelfPluginPayload:v19 completionHandler:v21];
}

void __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_2;
  v5[3] = &unk_1E5622E00;
  id v6 = a1[4];
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v11 = a1[8];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F59BA8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_3;
  v4[3] = &unk_1E562AE48;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  [v2 userNameAndEmail:v3 containerSetupInfo:0 completionHandler:v4];
}

void __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(id *)(a1 + 32);
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = v9;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Error while trying to get the user name and email : %@.", (uint8_t *)&v19, 0xCu);
      }
    }
    id v12 = [v10 shelfPluginPayload];
    [v12 setSendAsCopy:1];
  }
  else
  {
    id v13 = [*(id *)(a1 + 40) collaborationMetadata];
    id v12 = (void *)[v13 copy];

    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = v8;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Setting initiatorHandle to: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    [v12 setInitiatorHandle:v8];
    id v15 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    id v16 = [v15 personNameComponentsFromString:v7];
    [v12 setInitiatorNameComponents:v16];
    [*(id *)(a1 + 40) setCollaborationMetadata:v12];
    uint64_t v17 = [v10 compositionByAppendingText:0 shelfPluginPayload:*(void *)(a1 + 40) shelfMediaObject:0 collaborationShareOptions:*(void *)(a1 + 48)];

    id v18 = [*(id *)(a1 + 56) compositionByAppendingComposition:v17];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    id v10 = (id)v17;
  }
}

+ (void)processAppleEventDictionary:(id)a3 animate:(BOOL)a4 navigationProvider:(id)a5 chatController:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Processing Apple Event Dictionary", v12, 2u);
    }
  }
}

+ (id)conversationfromLaunchEventContext:(id)a3
{
  return 0;
}

+ (id)createPluginPayloadForFileProvider:(id)a3 sendCopyFileURLs:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 firstObject];
  id v8 = [v6 firstObject];
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "FileURL = %@, sendCopyURLs = %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v10 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v7 data:0];
  [v10 setPayloadCollaborationType:1];
  [v10 setSendAsCopyURL:v8];

  return v10;
}

+ (id)createPluginPayloadForCloudKit:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKey:@"share"];
  id v11 = 0;
  id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
  id v6 = v11;
  if (v6 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Received error while unarchiving the ckshare. Error:%@", buf, 0xCu);
    }
  }
  id v8 = [v5 URL];
  id v9 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v8 data:0];
  [v9 setPayloadCollaborationType:2];
  [v9 setCloudKitShare:v5];

  return v9;
}

+ (id)createPluginPayloadForCloudKitPlusCollaborationMetadata:(id)a3 shareOptions:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  id v35 = v5;
  id v39 = [v5 objectForKey:@"share"];
  unint64_t v6 = 0x1E4F28000uLL;
  id v54 = 0;
  id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v39 error:&v54];
  id v8 = v54;
  if (v8 && IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Received error while unarchiving the ckshare. Error:%@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v40 = [v7 URL];
  id v41 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v40 data:0];
  [v41 setPayloadCollaborationType:2];
  [v41 setCloudKitShare:v7];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Creating metadata from CKShare", (uint8_t *)&buf, 2u);
    }
  }
  uint64_t v38 = [v40 fragment];
  if (v38)
  {
    id v11 = [NSString stringWithFormat:@"#%@", v38];
    int v12 = [v40 absoluteString];
    id v33 = [v12 stringByReplacingOccurrencesOfString:v11 withString:&stru_1EDE4CA38];
  }
  else
  {
    id v33 = &stru_1EDE4CA38;
  }
  id v37 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
  if (v37)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
  }
  else
  {
    id v13 = 0;
  }
  if (![v13 conformsToType:*MEMORY[0x1E4F44408]]
    || ![v13 conformsToType:*MEMORY[0x1E4F44378]]
    || ![v13 conformsToType:*MEMORY[0x1E4F44390]]
    || ([v13 conformsToType:*MEMORY[0x1E4F444D8]] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v13 = 0;
  }
  uint64_t v36 = [v7 currentUserParticipant];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__59;
  uint64_t v61 = __Block_byref_object_dispose__59;
  id v62 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  __int16 v51 = __Block_byref_object_copy__59;
  id v52 = __Block_byref_object_dispose__59;
  id v53 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__CKUserActivityHandler_createPluginPayloadForCloudKitPlusCollaborationMetadata_shareOptions___block_invoke;
  aBlock[3] = &unk_1E562AE98;
  void aBlock[4] = &buf;
  aBlock[5] = &v48;
  id v15 = (void (**)(void *, void *))_Block_copy(aBlock);
  v15[2](v15, v36);
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    id v32 = v8;
    [v7 allParticipants];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v57 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v44;
      while (2)
      {
        unint64_t v19 = v6;
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v21 role] == 1)
          {
            v15[2](v15, v21);
            unint64_t v6 = v19;
            goto LABEL_36;
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v57 count:16];
        unint64_t v6 = v19;
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_36:

    id v8 = v32;
  }
  id v22 = [v35 objectForKey:@"setupInfo"];
  id v23 = *(void **)(v6 + 3520);
  id v42 = v8;
  id v24 = [v23 unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:&v42];
  id v25 = v42;

  if (v25 && IMOSLoggingEnabled())
  {
    id v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v55 = 138412290;
      id v56 = v25;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Received error while unarchiving the CKContainerSetupInfo. Error:%@", v55, 0xCu);
    }
  }
  id v27 = objc_alloc(MEMORY[0x1E4F3BDE0]);
  uint64_t v28 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
  __int16 v29 = [MEMORY[0x1E4F1C9C8] date];
  id v30 = (void *)[v27 initWithCollaborationIdentifier:v33 title:v28 defaultShareOptions:v34 creationDate:v29 contentType:v13 initiatorHandle:*(void *)(*((void *)&buf + 1) + 40) initiatorNameComponents:v49[5] containerSetupInfo:v24 sourceProcessData:0];

  [v41 setCollaborationMetadata:v30];
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&buf, 8);

  return v41;
}

void __94__CKUserActivityHandler_createPluginPayloadForCloudKitPlusCollaborationMetadata_shareOptions___block_invoke(uint64_t a1, void *a2)
{
  id v9 = [a2 userIdentity];
  id v3 = [v9 lookupInfo];
  id v4 = [v3 phoneNumber];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [v3 emailAddress];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
  if (!v4) {

  }
  uint64_t v6 = [v9 nameComponents];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

+ (id)createPluginPayloadForPendingCollaboration:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 collaborationMetadata];
  id v5 = [v4 defaultOptions];
  uint64_t v6 = [v3 fileURL];
  uint64_t v7 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v6 data:0];
  id v8 = [v4 initiatorHandle];

  if (!v8)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Initiator handle is nil. Defaulting to send as copy.", (uint8_t *)&v12, 2u);
      }
    }
    [v7 setSendAsCopy:1];
  }
  [v7 setCollaborationMetadata:v4];
  [v7 setPayloadCollaborationType:3];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Creating a pluginPayload with url: %@, metadata: %@, options: %@", (uint8_t *)&v12, 0x20u);
    }
  }

  return v7;
}

+ (id)createPluginPayloadForCloudKitWithLaunchContext:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Calling createPluginPayloadForCloudKitWithLaunchContext: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

+ (void)setChatControllerCompositionForConversation:(id)a3 navigationProvider:(id)a4 composition:(id)a5
{
  if (a3)
  {
    id v6 = a5;
    id v7 = [a4 chatController];
    +[CKUserActivityHandler updateChatController:composition:](CKUserActivityHandler, "updateChatController:composition:");
  }
  else
  {
    id v7 = a5;
    objc_msgSend(a4, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0);
  }
}

+ (void)setupFinalCompositionWithExistingComposition:(id)a3 withPluginPayloadComposition:(id)a4 shareOptions:(id)a5 conversation:(id)a6 animated:(BOOL)a7 navigationProvider:(id)a8
{
  BOOL v9 = a7;
  id v13 = a6;
  id v14 = a8;
  id v15 = +[CKUserActivityHandler finalCompositionFromExistingComposition:a3 pluginPayloadComposition:a4 shareOptions:a5];
  if (v13 && ([v13 isPlaceholder] & 1) == 0)
  {
    +[CKUserActivityHandler showConversation:v13 animated:v9 navigationProvider:v14];
    if (!v15) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = [v13 recipients];
  uint64_t v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  unint64_t v19 = [v13 recipients];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __153__CKUserActivityHandler_setupFinalCompositionWithExistingComposition_withPluginPayloadComposition_shareOptions_conversation_animated_navigationProvider___block_invoke;
  v22[3] = &unk_1E562AEC0;
  id v23 = v18;
  id v20 = v18;
  [v19 enumerateObjectsUsingBlock:v22];

  [v14 showNewMessageCompositionPanelWithRecipients:v20 composition:v15 animated:1];
  if (v15)
  {
LABEL_4:
    uint64_t v21 = [v14 chatController];
    +[CKUserActivityHandler updateChatController:v21 composition:v15];
  }
LABEL_5:
}

void __153__CKUserActivityHandler_setupFinalCompositionWithExistingComposition_withPluginPayloadComposition_shareOptions_conversation_animated_navigationProvider___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 rawAddress];
  [v2 addObject:v3];
}

+ (id)finalCompositionFromExistingComposition:(id)a3 pluginPayloadComposition:(id)a4 shareOptions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3)
  {
    id v9 = [a3 compositionByAppendingComposition:v7];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;
  id v11 = [v9 compositionWithCollaborationShareOptions:v8];

  return v11;
}

+ (void)showConversation:(id)a3 animated:(BOOL)a4 navigationProvider:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [v7 showConversation:a3 animate:v5];
  id v8 = [v7 conversationListController];
  [v8 updateConversationList];

  id v10 = [v7 conversationListController];

  id v9 = [v10 conversationList];
  [v9 updateConversationsWasKnownSender];
}

+ (void)updateChatController:(id)a3 composition:(id)a4
{
  id v5 = a4;
  id v7 = a3;
  id v6 = [v7 conversation];
  [v6 setUnsentComposition:0];

  [v7 setComposition:v5];
}

+ (void)openURL:(id)a3 animate:(BOOL)a4 sourceApplication:(id)a5 originatingProcess:(id)a6 navigationProvider:(id)a7 chatController:(id)a8 completion:(id)a9
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v40 = v15;
      __int16 v41 = 2112;
      id v42 = v16;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Opening url: %@ from source application: %@", buf, 0x16u);
    }
  }
  if ([v15 ckIsUnitTestingURL])
  {
    id v22 = [MEMORY[0x1E4F42738] sharedApplication];
    [v22 _handleUnitTestInvocation:v15];
  }
  else
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    __int16 v29 = __123__CKUserActivityHandler_openURL_animate_sourceApplication_originatingProcess_navigationProvider_chatController_completion___block_invoke;
    id v30 = &unk_1E562AEE8;
    id v23 = v15;
    id v31 = v23;
    id v37 = a1;
    BOOL v38 = a4;
    id v24 = v18;
    id v32 = v24;
    id v33 = v19;
    id v34 = v17;
    id v35 = v16;
    id v36 = v20;
    id v25 = (void (**)(void))_Block_copy(&v27);
    if (objc_msgSend(v23, "ckShouldSendImmediately", v27, v28, v29, v30))
    {
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v40 = v23;
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Not allowing deferral url handle block for url: %@", buf, 0xCu);
        }
      }
      v25[2](v25);
    }
    else
    {
      [v24 setDeferredHandleURLBlock:v25];
    }

    id v22 = v31;
  }
}

uint64_t __123__CKUserActivityHandler_openURL_animate_sourceApplication_originatingProcess_navigationProvider_chatController_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) scheme];
  id v3 = [v2 lowercaseString];
  int v4 = [&unk_1EDF159E0 containsObject:v3];

  if (v4)
  {
    if (([(id)objc_opt_class() isPreferencesURL:*(void *)(a1 + 32)] & 1) == 0) {
      [(id)objc_opt_class() openSMSURL:*(void *)(a1 + 32) animate:*(unsigned __int8 *)(a1 + 88) navigationProvider:*(void *)(a1 + 40) chatController:*(void *)(a1 + 48) originatingProcess:*(void *)(a1 + 56)];
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) scheme];
    id v6 = [v5 lowercaseString];
    int v7 = [&unk_1EDF159F8 containsObject:v6];

    if (v7)
    {
      [*(id *)(a1 + 40) showStoreForURL:*(void *)(a1 + 32) fromSourceApplication:*(void *)(a1 + 64)];
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) scheme];
      id v9 = [v8 lowercaseString];
      int v10 = [v9 isEqualToString:@"sms-surf"];

      if (v10) {
        [(id)objc_opt_class() openSURFURL:*(void *)(a1 + 32) navigationProvider:*(void *)(a1 + 40)];
      }
    }
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    int v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

+ (BOOL)isPreferencesURL:(id)a3
{
  return 0;
}

+ (void)openSMSURL:(id)a3 animate:(BOOL)a4 navigationProvider:(id)a5 chatController:(id)a6 originatingProcess:(id)a7
{
  BOOL v58 = a4;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v60 = a6;
  id v61 = a7;
  unsigned __int8 v68 = 0;
  id v13 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v66 = 0;
  id v67 = 0;
  id v64 = 0;
  id v65 = 0;
  id v14 = [v13 chatForURL:v11 outMessageText:&v67 outRecipientIDs:&v66 outService:0 outMessageGUID:&v65 presentOverlay:&v68 outSIMID:&v64];
  id v15 = v67;
  id v16 = v66;
  id v17 = v65;
  id v62 = v64;

  if (!v14 && IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v70 = v11;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Did not find chat in ChatRegistry using URL %@", buf, 0xCu);
    }
  }
  if ([a1 hasBusinessRecipientWithRecipientIDs:v16])
  {
    if ([MEMORY[0x1E4F6E730] deviceIsLockedDown])
    {
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v70 = v11;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Cannot open new chat in lockdown mode for received biz chat URL: (%@)", buf, 0xCu);
        }
      }
      [v12 showLockdownAlertForBusinessChat];
      goto LABEL_93;
    }
    if (([MEMORY[0x1E4F6E730] supportsBusinessChat] & 1) == 0)
    {
      [v12 showBusinessChatNotSupportedAlert];
      goto LABEL_93;
    }
  }
  if (v17)
  {
    [(id)objc_opt_class() loadConversationWithMessageGUID:v17 withInlineReplyOverlay:v68 navigationProvider:v12];
    goto LABEL_93;
  }
  if (!v14 || ([v14 allowedToShowConversation] & 1) != 0)
  {
    if ([v11 ckAllowRetargeting])
    {
      id v20 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      id v63 = 0;
      uint64_t v21 = [v20 existingChatWithAddresses:v16 allowAlternativeService:1 bestHandles:&v63];
      id v22 = v63;

      if (v21)
      {
        id v23 = v21;

        id v14 = v23;
      }
      uint64_t v24 = [v22 count];
      if (v24 == [v16 count])
      {
        uint64_t v25 = objc_msgSend(v22, "__imArrayByApplyingBlock:", &__block_literal_global_301_1);

        id v16 = (id)v25;
      }
    }
    BOOL v53 = v14 == 0;
    if (v14)
    {
      id v26 = +[CKConversationList sharedConversationList];
      uint64_t v27 = [v26 conversationForExistingChat:v14];

      if (!v27) {
        goto LABEL_41;
      }
LABEL_34:
      id v57 = v27;
      if ([v27 isPlaceholder] && IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v70 = v27;
          _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Conversation appears to be a placeholder to the client, may not have messages even after history query or messages may just be pending history query: %@", buf, 0xCu);
        }
      }
      int v31 = 0;
      BOOL v53 = 0;
      goto LABEL_46;
    }
    if ([v11 ckIsLaunchAppURL])
    {
      __int16 v29 = +[CKConversationList sharedConversationList];
      uint64_t v27 = [v29 topMostConversation];

      if (v27) {
        goto LABEL_34;
      }

      id v16 = 0;
    }
LABEL_41:
    if (IMOSLoggingEnabled())
    {
      id v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v70 = v14;
        _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Did not find conversation for chat %@", buf, 0xCu);
      }
    }
    id v57 = 0;
    int v31 = 1;
LABEL_46:
    if ([a1 hasBusinessRecipientWithRecipientIDs:v16])
    {
      id v33 = [MEMORY[0x1E4F1CA60] dictionary];
      id v34 = [v11 absoluteString];
      id v35 = (id)ExtractURLQueries();

      id v56 = [a1 validIntentDictionaryWithURLParameters:v33];
    }
    else
    {
      id v56 = 0;
    }
    if ([v15 length] || v56)
    {
      if ([v15 length]) {
        id v37 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15];
      }
      else {
        id v37 = 0;
      }
      id v36 = [[CKComposition alloc] initWithText:v37 subject:0 shelfPluginPayload:0 bizIntent:v56];
    }
    else
    {
      id v36 = 0;
    }
    v55 = [v11 ckLaunchURLBalloonPluginBundleID];
    if ([v11 ckAllowRetargeting]
      && [v55 isEqualToString:*MEMORY[0x1E4F6CB28]])
    {
      id v54 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:0 bizIntent:0];

      if (IMOSLoggingEnabled())
      {
        BOOL v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Clearing composition", buf, 2u);
        }
      }
    }
    else
    {
      id v54 = v36;
    }
    if (((v31 | [v57 isPlaceholder]) & 1) != 0
      || ([v11 ckShouldInitiateCollaborationWithSend] & 1) != 0)
    {
      if ([v11 ckShouldShowComposeUI])
      {
        id v39 = [v11 ckLaunchURLBalloonPluginBundleID];
        id v40 = [v11 ckLaunchURLBalloonPluginPayload];
        if (IMOSLoggingEnabled())
        {
          __int16 v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412802;
            id v70 = v16;
            __int16 v71 = 2112;
            __int16 v72 = v54;
            __int16 v73 = 2112;
            uint64_t v74 = v57;
            _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "showNewMessageCompositionPanelWithRecipients: (%@) with composition (%@), conversation: (%@)", buf, 0x20u);
          }
        }
        [v12 showNewMessageCompositionPanelWithRecipients:v16 composition:v54 suggestedReplies:0 animated:0 bizIntent:v56 launchPluginWithBundleID:v39 pluginLaunchPayload:v40 simID:v62 sendMessageHandler:0];
      }
      else if ([v11 ckShouldInitiateCollaborationWithSend])
      {
        LOBYTE(v52) = v58;
        [a1 _sendCollaborationInitationForURL:v11 originatingProcess:v61 chat:v14 conversation:v57 recipientIDs:v16 navigationProvider:v12 animate:v52];
      }
      int v42 = 0;
    }
    else
    {
      if (v56)
      {
        uint64_t v43 = [v57 chat];
        [v43 setBizIntent:v56];
      }
      if (IMOSLoggingEnabled())
      {
        long long v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v70 = v57;
          _os_log_impl(&dword_18EF18000, v44, OS_LOG_TYPE_INFO, "Showing existing conversation %@", buf, 0xCu);
        }
      }
      [v12 showConversation:v57 animate:v58];
      uint64_t v59 = [v12 chatController];
      if (([v55 isEqualToString:*MEMORY[0x1E4F6CC30]] & 1) != 0
        || [v55 isEqualToString:*MEMORY[0x1E4F6CB28]])
      {
        long long v45 = [v11 ckLaunchURLBalloonPluginPayload];
        long long v46 = [v59 inputController];
        [v46 presentPluginWithBundleID:v55 appLaunchPayload:v45];

        int v42 = 1;
      }
      else
      {
        long long v45 = [v59 inputController];
        [v45 dismissAppCardIfNecessaryAnimated:0 completion:0];
        int v42 = 0;
      }

      [(id)objc_opt_class() _setMessageFilterModeBy:v57 navigationProvider:v12];
      uint64_t v47 = [v12 conversationListController];
      [v47 updateConversationList];

      uint64_t v48 = [v12 conversationListController];
      uint64_t v49 = [v48 conversationList];
      [v49 updateConversationsWasKnownSender];

      if (v54 && ([v12 isComposingMessage] & 1) == 0)
      {
        uint64_t v50 = [v12 chatController];
        +[CKUserActivityHandler updateChatController:v50 composition:v54];
      }
    }
    if (!v53)
    {
      __int16 v51 = [v12 chatController];
      if (((v42 | [v51 isFunCamPresented]) & 1) == 0)
      {
        [v51 showKeyboardForReply];
        [v51 setupStateForLaunchURL:v11];
      }
    }
    goto LABEL_93;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v70 = v11;
      _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, " received URL: (%@) to a chat which contained non-allowlisted handles during downtime, so aborting open url request.", buf, 0xCu);
    }
  }
LABEL_93:
}

uint64_t __97__CKUserActivityHandler_openSMSURL_animate_navigationProvider_chatController_originatingProcess___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ID];
}

+ (void)_sendCollaborationInitationForURL:(id)a3 originatingProcess:(id)a4 chat:(id)a5 conversation:(id)a6 recipientIDs:(id)a7 navigationProvider:(id)a8 animate:(BOOL)a9
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = (__CFString *)a4;
  id v16 = a5;
  id v45 = a6;
  id v44 = a7;
  id v17 = a8;
  if ([(__CFString *)v15 hasEntitlement:@"com.apple.private.messages.collaboration-initiate-send"])
  {
    int v42 = v17;
    uint64_t v43 = [v14 ckCollaborationSceneIdentifier];
    if (v43)
    {
      id v18 = [MEMORY[0x1E4FADA90] sharedInstance];
      id v19 = [v18 conversationManager];
      id v20 = (id)[v19 activeConversations];

      if (!v16)
      {
        uint64_t v21 = [MEMORY[0x1E4F6BBD8] sharedInstance];
        id v22 = [v21 activeIMessageAccount];

        id v23 = [MEMORY[0x1E4F1CA48] array];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v24 = v44;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v53 != v26) {
                objc_enumerationMutation(v24);
              }
              uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F6BCD8]) initWithAccount:v22 ID:*(void *)(*((void *)&v52 + 1) + 8 * i) alreadyCanonical:0];
              [v23 addObject:v28];
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v56 count:16];
          }
          while (v25);
        }

        __int16 v29 = [MEMORY[0x1E4F6BC40] sharedRegistry];
        id v16 = [v29 chatWithHandles:v23];

        if (v16)
        {
          id v30 = +[CKConversationList sharedConversationList];
          uint64_t v31 = [v30 conversationForExistingChat:v16];

          id v45 = (id)v31;
        }
      }
      if (v16 && v45)
      {
        [v42 showConversation:v45 animate:a9];
        id v32 = [v42 chatController];
        id v33 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v34 = [v33 beginBackgroundTaskWithExpirationHandler:0];

        id v35 = objc_alloc_init(MEMORY[0x1E4F3BD90]);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke;
        v46[3] = &unk_1E562AF38;
        id v47 = v14;
        uint64_t v51 = v34;
        id v48 = v43;
        id v16 = v16;
        id v49 = v16;
        id v50 = v32;
        id v36 = v32;
        [v35 retrieveShareableContentWithCompletion:v46];
      }
      else
      {
        id v39 = IMLogHandleForCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v40 = @"NO";
          if (v16) {
            __int16 v41 = @"NO";
          }
          else {
            __int16 v41 = @"YES";
          }
          *(_DWORD *)long long buf = 138412802;
          id v58 = v14;
          id v60 = v41;
          __int16 v59 = 2112;
          if (!v45) {
            id v40 = @"YES";
          }
          __int16 v61 = 2112;
          id v62 = v40;
          _os_log_error_impl(&dword_18EF18000, v39, OS_LOG_TYPE_ERROR, "received URL: (%@) to send composition for shareable content but could not construct chat %@ or conversation %@", buf, 0x20u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v58 = v14;
        _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but it did not contain a collaboration scene identifier", buf, 0xCu);
      }
    }
    id v17 = v42;
  }
  else if (IMOSLoggingEnabled())
  {
    id v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v58 = v14;
      __int16 v59 = 2112;
      id v60 = @"com.apple.private.messages.collaboration-initiate-send";
      __int16 v61 = 2112;
      id v62 = v15;
      _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but originating process was not entitled to do so (missing %@): %@", buf, 0x20u);
    }
  }
}

void __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v36 = v8;
        __int16 v37 = 2112;
        id v38 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but did not find any shareable content to send, or an error was hit: %@", buf, 0x16u);
      }
    }
    id v9 = [MEMORY[0x1E4F42738] sharedApplication];
    [v9 endBackgroundTask:*(void *)(a1 + 64)];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
LABEL_11:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        id v15 = [v14 sourceSceneIdentifier];
        if ([v15 isEqualToString:*(void *)(a1 + 40)]) {
          break;
        }

        if (v11 == ++v13)
        {
          uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v11) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      id v16 = v14;

      if (!v16) {
        goto LABEL_20;
      }
      id v17 = [*(id *)(a1 + 32) ckCollaborationShareOptions];
      id v18 = (void *)MEMORY[0x1E4F1C978];
      id v19 = [v16 itemProvider];
      id v20 = [v18 arrayWithObject:v19];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke_307;
      v24[3] = &unk_1E562AF10;
      id v25 = *(id *)(a1 + 32);
      id v26 = v16;
      uint64_t v29 = *(void *)(a1 + 64);
      id v27 = *(id *)(a1 + 48);
      id v28 = *(id *)(a1 + 56);
      id v9 = v16;
      +[CKComposition compositionFromItemProviders:v20 shareOptions:v17 completionHandler:v24];
    }
    else
    {
LABEL_17:

LABEL_20:
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          id v23 = *(void **)(a1 + 40);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v36 = v22;
          __int16 v37 = 2112;
          id v38 = v23;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but could not extract shareable content from app %@", buf, 0x16u);
        }
      }
      id v9 = [MEMORY[0x1E4F42738] sharedApplication];
      [v9 endBackgroundTask:*(void *)(a1 + 64)];
    }
  }
}

void __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5
    && !v6
    && ([v5 shelfPluginPayload], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v17 = 138412546;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "received URL: (%@) and created composition with collaboration: %@, sending...", (uint8_t *)&v17, 0x16u);
      }
    }
    uint64_t v11 = [*(id *)(a1 + 32) ckFaceTimeConversationUUID];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      uint64_t v13 = [v12 existingConversationForFaceTimeConversationUUID:v11];
    }
    else
    {
      uint64_t v13 = 0;
    }
    [v5 setSourceApplicationID:@"com.apple.FaceTime"];
    +[CKFaceTimeCollaborationUtilities startCollaborationWithComposition:v5 faceTimeConversation:v13 imChat:*(void *)(a1 + 48) chatController:*(void *)(a1 + 56) backgroundTaskID:*(void *)(a1 + 64)];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = *(void **)(a1 + 40);
        int v17 = 138412802;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        id v20 = v16;
        __int16 v21 = 2112;
        uint64_t v22 = v7;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but could not create composition from shareable content %@ with error: %@", (uint8_t *)&v17, 0x20u);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F42738] sharedApplication];
    [v11 endBackgroundTask:*(void *)(a1 + 64)];
  }
}

+ (void)openItemProviders:(id)a3 navigationProvider:(id)a4 chatController:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke;
        v14[3] = &unk_1E5622818;
        id v15 = v7;
        +[CKComposition requestCompositionFromItemProviders:v12 completion:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke_2;
  v5[3] = &unk_1E5620AF8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNewMessageCompositionPanelWithRecipients:0 composition:*(void *)(a1 + 40) animated:1];
}

+ (void)_showPeerPaymentUIForPerson:(id)a3 amount:(id)a4 navigationProvider:(id)a5 chatController:(id)a6
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v27 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 handle];
  if ([v12 length])
  {
    v41[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    id v14 = CKMakeHandlesFromRecipients(v13);
    id v15 = [v14 firstObject];

    if (v15)
    {
      long long v16 = +[CKConversationList sharedConversationList];
      long long v17 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      id v26 = [v17 existingChatWithHandle:v15];

      if (v26)
      {
        long long v18 = objc_msgSend(v16, "conversationForExistingChat:");
      }
      else
      {
        id v40 = v15;
        long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        long long v18 = [v16 conversationForHandles:v19 displayName:0 joinedChatsOnly:0 create:1];
      }
      [v10 showConversation:v18 animate:1];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke;
      aBlock[3] = &unk_1E5620AF8;
      id v38 = v11;
      id v39 = v27;
      id v20 = (void (**)(void))_Block_copy(aBlock);
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Waiting for extensions to load before showing SURF extension for intent", buf, 2u);
        }
      }
      if (IMIsRunningInUnitTesting())
      {
        v20[2](v20);
      }
      else
      {
        *(void *)long long buf = 0;
        long long v32 = buf;
        uint64_t v33 = 0x3032000000;
        uint64_t v34 = __Block_byref_object_copy__59;
        id v35 = __Block_byref_object_dispose__59;
        id v36 = 0;
        uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v23 = [MEMORY[0x1E4F28F08] mainQueue];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke_320;
        v28[3] = &unk_1E562A9F8;
        long long v30 = buf;
        uint64_t v29 = v20;
        uint64_t v24 = [v22 addObserverForName:@"CKBrowserSelectionControllerDataSourceChangedNotification" object:0 queue:v23 usingBlock:v28];
        id v25 = (void *)*((void *)v32 + 5);
        *((void *)v32 + 5) = v24;

        _Block_object_dispose(buf, 8);
      }
    }
  }
}

void __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 inputController];
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v14 = @"Currency";
    id v5 = objc_msgSend(v4, "currencyCode", @"CurrencyType");
    v11[1] = @"CurrencyValue";
    v12[0] = v5;
    id v6 = [*(id *)(a1 + 40) amount];
    id v7 = [v6 stringValue];
    v12[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    uint64_t v13 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    v15[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    id v10 = 0;
  }
  [v3 presentPluginWithBundleID:*MEMORY[0x1E4F6CC30] appLaunchPayload:v10];
}

void __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke_320(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Notified of plugin manager plugin changes", buf, 2u);
    }
  }
  id v5 = +[CKBalloonPluginManager sharedInstance];
  id v6 = (id)[v5 allPlugins];

  id v7 = +[CKBalloonPluginManager sharedInstance];
  int v8 = [v7 hasLoadedExtensions];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Extensions loaded, showing SURF for intent", v11, 2u);
      }
    }
  }
}

+ (void)loadConversationWithMessageGUID:(id)a3 withInlineReplyOverlay:(BOOL)a4 navigationProvider:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F6BC30] sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __99__CKUserActivityHandler_loadConversationWithMessageGUID_withInlineReplyOverlay_navigationProvider___block_invoke;
  v12[3] = &unk_1E56213D0;
  id v13 = v8;
  id v14 = v7;
  BOOL v15 = a4;
  id v10 = v7;
  id v11 = v8;
  [v9 loadMessageWithGUID:v10 completionBlock:v12];
}

void __99__CKUserActivityHandler_loadConversationWithMessageGUID_withInlineReplyOverlay_navigationProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 lastObject];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v7 = v4;
    id v6 = [v4 guid];
    [v5 showConversationAndMessageForChatGUID:v6 messageGUID:*(void *)(a1 + 40) withInlineReplyOverlay:*(unsigned __int8 *)(a1 + 48) animate:1];

    id v4 = v7;
  }
}

+ (void)openSURFURL:(id)a3 navigationProvider:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  uint64_t v21 = v5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:0];
  id v6 = [v20 queryItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v7)
  {

    id v8 = 0;
    goto LABEL_17;
  }
  id v8 = 0;
  uint64_t v9 = *(void *)v24;
  double v10 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v13 = [v12 name];
      int v14 = [v13 isEqualToString:@"amount"];

      if (v14)
      {
        BOOL v15 = [v12 value];
        [v15 doubleValue];
        double v10 = v16;
      }
      else
      {
        long long v17 = [v12 name];
        int v18 = [v17 isEqualToString:@"currency"];

        if (!v18) {
          continue;
        }
        [v12 value];
        v8 = BOOL v15 = v8;
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }
  while (v7);

  if (v8 && v10 > 0.0)
  {
    [v22 showSurfAppForCurrentConversationWithAmount:v8 currency:v10];
    goto LABEL_21;
  }
LABEL_17:
  if (IMOSLoggingEnabled())
  {
    long long v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v21;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Recieved Surf URL but queryItems was invalid for URL: %@", buf, 0xCu);
    }
  }
LABEL_21:
}

+ (void)_setMessageFilterModeBy:(id)a3 navigationProvider:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [(id)objc_opt_class() _messageUnknownFilteringEnabled];
  id v8 = [v6 conversationListController];
  uint64_t v9 = [v8 filterMode];

  if (v7)
  {
    double v10 = +[CKConversationList sharedConversationList];
    uint64_t v11 = [v10 primaryFilterModeForConversation:v5];

    if (v9 == 8)
    {
      if ([v5 hasUnreadMessages]) {
        unint64_t v12 = 8;
      }
      else {
        unint64_t v12 = 1;
      }
    }
    else if (v9 == v11)
    {
      unint64_t v12 = v11;
    }
    else
    {
      unint64_t v12 = 1;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (v9 != v12)
  {
    id v13 = [v6 conversationListController];
    [v13 setFilterMode:v12];

    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        BOOL v15 = CKConversationListFilterModeStringValue(v12);
        int v16 = 138412290;
        long long v17 = v15;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "[Filter Mode] updating conversation list filter mode to: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

+ (BOOL)hasBusinessRecipientWithRecipientIDs:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (MEMORY[0x192FBA6A0](*(void *)(*((void *)&v8 + 1) + 8 * i)))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)validIntentDictionaryWithURLParameters:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v11 = [&unk_1EDF15A10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(&unk_1EDF15A10);
              }
              if ([v10 isEqualToString:*(void *)(*((void *)&v20 + 1) + 8 * j)])
              {
                BOOL v15 = [v5 objectForKeyedSubscript:v10];
                [v4 setObject:v15 forKey:v10];

                goto LABEL_16;
              }
            }
            uint64_t v12 = [&unk_1EDF15A10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_16:
        ;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  int v16 = [v4 allKeys];
  uint64_t v17 = [v16 count];

  if (v17) {
    uint64_t v18 = (void *)[v4 copy];
  }
  else {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

void __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_204_cold_1(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = @"NO";
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  if (a2) {
    uint64_t v4 = @"YES";
  }
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  long long v10 = @"YES";
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "received user activity: (%@) to send composition in the background but could not construct chat %@ or conversation %@", (uint8_t *)&v5, 0x20u);
}

@end