@interface CKFaceTimeCollaborationUtilities
+ (BOOL)shouldAddCollaboration:(id)a3 toFaceTimeConversation:(id)a4 forIMChat:(id)a5;
+ (void)startCollaborationWithComposition:(id)a3 faceTimeConversation:(id)a4 imChat:(id)a5 chatController:(id)a6 backgroundTaskID:(unint64_t)a7;
@end

@implementation CKFaceTimeCollaborationUtilities

+ (void)startCollaborationWithComposition:(id)a3 faceTimeConversation:(id)a4 imChat:(id)a5 chatController:(id)a6 backgroundTaskID:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 shelfPluginPayload];
  v16 = [NSString stringGUID];
  [v15 setMessageGUID:v16];

  [v15 setPluginBundleID:*MEMORY[0x1E4F6CC10]];
  id v17 = objc_alloc_init(MEMORY[0x1E4F3BD80]);
  v18 = [v15 url];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke;
  aBlock[3] = &unk_1E562CB68;
  id v29 = v12;
  id v30 = v13;
  id v31 = v17;
  id v32 = v11;
  id v33 = v14;
  unint64_t v34 = a7;
  id v19 = v14;
  id v20 = v11;
  id v21 = v17;
  id v22 = v13;
  id v23 = v12;
  v24 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_3;
  v26[3] = &unk_1E562CB90;
  id v27 = v24;
  id v25 = v24;
  [v21 getCollaborationHighlightForURL:v18 completionHandler:v26];
}

void __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[CKFaceTimeCollaborationUtilities shouldAddCollaboration:v3 toFaceTimeConversation:*(void *)(a1 + 32) forIMChat:*(void *)(a1 + 40)];
  int v5 = _IMWillLog();
  if (v4)
  {
    if (v5)
    {
      uint64_t v27 = *(void *)(a1 + 32);
      _IMAlwaysLog();
    }
    v6 = objc_msgSend(*(id *)(a1 + 48), "fetchAttributionsForHighlight:", v3, v27);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;

      id v3 = v7;
    }
    v8 = [MEMORY[0x1E4FADA90] sharedInstance];
    v9 = [v8 conversationManager];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [MEMORY[0x1E4FADA90] sharedInstance];
      id v12 = [v11 conversationManager];
      [v12 addCollaboration:v3 forConversation:*(void *)(a1 + 32)];
    }
    id v13 = [MEMORY[0x1E4F42738] sharedApplication];
    [v13 endBackgroundTask:*(void *)(a1 + 72)];
  }
  else
  {
    if (v5) {
      _IMAlwaysLog();
    }
    v6 = [*(id *)(a1 + 56) shelfPluginPayload];
    id v13 = [MEMORY[0x1E4F6BC18] sharedInstance];
    id v14 = [v6 pluginBundleID];
    v15 = [v13 balloonPluginForBundleID:v14];

    v16 = (objc_class *)[v15 dataSourceClass];
    if (!v16) {
      v16 = (objc_class *)objc_opt_class();
    }
    id v17 = (void *)[[v16 alloc] initWithPluginPayload:v6];
    [v6 setDatasource:v17];
    [v17 setPayloadInShelf:1];
    [v17 payloadWillEnterShelf];
    v18 = [MEMORY[0x1E4F6BC18] sharedInstance];
    id v19 = [v6 associatedMessageGUID];
    id v20 = [v6 pluginBundleID];
    id v21 = [v18 existingDataSourceForMessageGUID:v19 bundleID:v20];

    [v21 beginShowingLastConsumedBreadcrumbForOutgoingPayload:v6];
    uint64_t v23 = *(void *)(a1 + 56);
    id v22 = *(void **)(a1 + 64);
    uint64_t v24 = [v6 payloadCollaborationType];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_2;
    v28[3] = &unk_1E5624A88;
    uint64_t v25 = *(void *)(a1 + 72);
    id v29 = v17;
    uint64_t v30 = v25;
    id v26 = v17;
    [v22 sendCompositionForCollaboration:v23 collaborationType:v24 completion:v28];
  }
}

void __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) pluginPayload];
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  [v3 endBackgroundTask:*(void *)(a1 + 40)];
}

void __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = _IMWillLog();
  if (v5)
  {
    if (v6) {
      _IMAlwaysLog();
    }
  }
  else if (v6)
  {
    _IMAlwaysLog();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

+ (BOOL)shouldAddCollaboration:(id)a3 toFaceTimeConversation:(id)a4 forIMChat:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 state];
  if (v7 && v10 == 3)
  {
    id v24 = v8;
    id v25 = v7;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [v7 attributions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v26 + 1) + 8 * i) uniqueIdentifier];
          if (v16)
          {
            id v17 = (void *)v16;
            v18 = (void *)IMDMessageRecordChatForMessageGUID();
            id v19 = [v18 groupID];
            id v20 = [v9 groupID];
            int v21 = [v19 isEqualToString:v20];

            if (v21)
            {
              id v8 = v24;
              id v7 = v25;
              if (_IMWillLog()) {
                _IMAlwaysLog();
              }

              BOOL v22 = 1;
              goto LABEL_20;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v8 = v24;
    id v7 = v25;
  }
  if (_IMWillLog())
  {
    id v11 = [v7 collaborationIdentifier];
    _IMAlwaysLog();
    BOOL v22 = 0;
LABEL_20:
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

@end