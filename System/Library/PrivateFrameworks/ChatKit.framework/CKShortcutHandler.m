@interface CKShortcutHandler
+ (void)performActionForShortcutItem:(id)a3 navigationProvider:(id)a4 chatController:(id)a5 completion:(id)a6;
@end

@implementation CKShortcutHandler

+ (void)performActionForShortcutItem:(id)a3 navigationProvider:(id)a4 chatController:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Performing action for shortcut item: %@", buf, 0xCu);
    }
  }
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke;
  v22 = &unk_1E56267D8;
  id v23 = v9;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  id v17 = v9;
  v18 = _Block_copy(&v19);
  objc_msgSend(v16, "setDeferredHandleURLBlock:", v18, v19, v20, v21, v22);
}

void __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) type];
  int v3 = [v2 isEqualToString:@"com.apple.mobilesms.newmessage"];

  if (v3)
  {
    v4 = +[CKDraftManager sharedInstance];
    [v4 setDraftForPendingConversation:0 withRecipients:0];

    v5 = +[CKDraftManager sharedInstance];
    [v5 saveCompositionAndFlushCache:0];

    [*(id *)(a1 + 40) showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:0];
    v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
  else
  {
    v7 = [*(id *)(a1 + 32) type];
    int v8 = [v7 isEqualToString:@"com.apple.mobilesms.conversation"];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) userInfo];
      id v10 = [v9 objectForKey:@"CKSBActionUserInfoKeyChatGUID"];

      if (v10)
      {
        id v11 = (void *)MEMORY[0x1E4F42FF8];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke_2;
        v53[3] = &unk_1E5620AA8;
        id v54 = *(id *)(a1 + 40);
        id v55 = v10;
        id v56 = *(id *)(a1 + 48);
        [v11 _performWithoutDeferringTransitions:v53];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      uint64_t v12 = MEMORY[0x192FBA860](@"_CDInteractionFeedbackLogger", @"CoreDuet");
      uint64_t v13 = MEMORY[0x192FBA860](@"_CDContact", @"CoreDuet");
      if (v12)
      {
        id v14 = (void *)v13;
        if (v13)
        {
          uint64_t v15 = MEMORY[0x192FBA870]("_CDInteractionAdviceSourceAutocomplete", @"CoreDuet");
          uint64_t v16 = MEMORY[0x192FBA870]("_CDInteractionPresentationStyleUIShortcut", @"CoreDuet");
          uint64_t v46 = MEMORY[0x192FBA870]("_CDPersonIdTypeCNContactId", @"CoreDuet");
          id v17 = [MEMORY[0x1E4F1CA48] array];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v18 = [(id)*MEMORY[0x1E4F43630] shortcutItems];
          uint64_t v48 = [v18 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v48)
          {
            uint64_t v38 = v16;
            uint64_t v39 = v15;
            v43 = v14;
            v44 = v17;
            v40 = (void *)v12;
            v41 = 0;
            uint64_t v47 = *(void *)v50;
            v45 = v10;
            id obj = v18;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v50 != v47) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v20 = [*(id *)(*((void *)&v49 + 1) + 8 * i) userInfo];
                v21 = [v20 objectForKey:@"CKSBActionUserInfoKeyChatGUID"];

                v22 = +[CKConversationList sharedConversationList];
                id v23 = [v22 conversationForExistingChatWithGUID:v21];

                if (v23)
                {
                  id v24 = [v23 recipient];
                  id v25 = [v24 defaultIMHandle];
                  id v26 = [v25 ID];
                  int v27 = [v26 _appearsToBePhoneNumber];

                  if (v27) {
                    id v28 = "_CDContactTypePhoneNumber";
                  }
                  else {
                    id v28 = "_CDContactTypeEmailAddress";
                  }
                  uint64_t v29 = MEMORY[0x192FBA870](v28, @"CoreDuet");
                  v30 = [v24 defaultIMHandle];
                  v31 = [v30 ID];
                  v32 = [v24 cnContact];
                  v33 = [v32 identifier];
                  uint64_t v34 = v29;
                  id v17 = v44;
                  v35 = [v43 contactWithIdentifier:v31 type:v34 displayName:0 personId:v33 personIdType:v46];

                  id v10 = v45;
                  [v44 addObject:v35];
                  if (v45 && [v21 isEqualToString:v45])
                  {
                    id v36 = v35;

                    v41 = v36;
                  }
                }
              }
              uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v48);

            v37 = v41;
            if (v41) {
              [v40 logFeedbackItemSelected:v41 adviceSource:v39 presentationStyle:v38 itemsShown:v17 bundleID:@"com.apple.MobileSMS"];
            }
          }
          else
          {

            v37 = 0;
          }
        }
      }
    }
  }
}

uint64_t __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) showConversationAndMessageForChatGUID:*(void *)(a1 + 40) messageGUID:0 animate:0];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      v5 = "+[CKShortcutHandler performActionForShortcutItem:navigationProvider:chatController:completion:]_block_invoke_2";
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", (uint8_t *)&v4, 0xCu);
    }
  }
  [*(id *)(a1 + 48) reloadEntryViewIfNeeded];
  return [*(id *)(a1 + 48) showKeyboardForReply];
}

@end