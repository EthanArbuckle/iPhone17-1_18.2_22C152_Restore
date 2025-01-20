@interface CNCardGameCenterManager
- (BOOL)hasCheckedAuthenticatedLocalPlayer;
- (BOOL)hasSentInvite;
- (BOOL)shouldActionDisplayDropdownMenu;
- (CNCancelable)relationshipResultsCancelable;
- (CNCardGameCenterManager)init;
- (CNContact)contact;
- (CNScheduler)workQueue;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreRecentsManager)recentsManager;
- (GKServiceProxy)gameCenterProxy;
- (id)defaultFriendResultFromFriendResults:(id)a3 forContact:(id)a4;
- (id)handles;
- (id)handlesForContact:(id)a3;
- (void)getGameCenterRelationshipsForContact:(id)a3 completionHandler:(id)a4;
- (void)handleResults:(id)a3 forContact:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)refreshGameCenterRelationshipsForContact:(id)a3 completionHandler:(id)a4;
- (void)setContact:(id)a3;
- (void)setGameCenterProxy:(id)a3;
- (void)setHasCheckedAuthenticatedLocalPlayer:(BOOL)a3;
- (void)setHasSentInvite:(BOOL)a3;
- (void)setRecentsManager:(id)a3;
- (void)setRelationshipResultsCancelable:(id)a3;
@end

@implementation CNCardGameCenterManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameCenterProxy, 0);
  objc_storeStrong((id *)&self->_relationshipResultsCancelable, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setHasCheckedAuthenticatedLocalPlayer:(BOOL)a3
{
  self->_hasCheckedAuthenticatedLocalPlayer = a3;
}

- (BOOL)hasCheckedAuthenticatedLocalPlayer
{
  return self->_hasCheckedAuthenticatedLocalPlayer;
}

- (void)setGameCenterProxy:(id)a3
{
}

- (void)setRelationshipResultsCancelable:(id)a3
{
}

- (CNCancelable)relationshipResultsCancelable
{
  return self->_relationshipResultsCancelable;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setHasSentInvite:(BOOL)a3
{
  self->_hasSentInvite = a3;
}

- (BOOL)hasSentInvite
{
  return self->_hasSentInvite;
}

- (void)setRecentsManager:(id)a3
{
}

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (id)handlesForContact:(id)a3
{
  id v3 = a3;
  v4 = [v3 phoneNumbers];
  v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_15_41610);

  v6 = [v3 emailAddresses];

  v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_17);

  v8 = [v5 arrayByAddingObjectsFromArray:v7];

  return v8;
}

uint64_t __45__CNCardGameCenterManager_handlesForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

id __45__CNCardGameCenterManager_handlesForContact___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  id v3 = [v2 stringValue];

  return v3;
}

- (id)defaultFriendResultFromFriendResults:(id)a3 forContact:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CNCardGameCenterManager *)self handlesForContact:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __75__CNCardGameCenterManager_defaultFriendResultFromFriendResults_forContact___block_invoke;
        v16[3] = &unk_1E5499990;
        v16[4] = v12;
        uint64_t v13 = objc_msgSend(v6, "_cn_firstObjectPassingTest:", v16);
        if (v13)
        {
          v14 = (void *)v13;

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v14 = [v6 firstObject];
LABEL_11:

  return v14;
}

uint64_t __75__CNCardGameCenterManager_defaultFriendResultFromFriendResults_forContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 handle];
  objc_msgSend(v4, "_cn_rangeOfCommonPrefixWithString:", @"tel:");
  uint64_t v6 = v5;

  if (!v6)
  {
    id v7 = [v3 handle];
    objc_msgSend(v7, "_cn_rangeOfCommonPrefixWithString:", @"mailto:");
    uint64_t v6 = v8;
  }
  uint64_t v9 = [v3 handle];
  uint64_t v10 = objc_msgSend(v9, "_cn_skip:", v6);
  uint64_t v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

  return v11;
}

- (void)handleResults:(id)a3 forContact:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, id, id))a6;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    v14 = CNUILogContactCard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v12;
      _os_log_error_impl(&dword_18B625000, v14, OS_LOG_TYPE_ERROR, "Failed to get Game Center relationships: %@", buf, 0xCu);
    }
  }
  v15 = objc_msgSend(v10, "_cn_filter:", &__block_literal_global_41620);
  if ((unint64_t)[v15 count] < 2)
  {
    v13[2](v13, v10, v11);
  }
  else
  {
    v16 = [(CNCardGameCenterManager *)self recentsManager];
    long long v17 = (void *)[v11 mutableCopy];
    long long v18 = [v16 sortedRecentHandlesMatchingAllPropertiesOfContact:v17];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_2;
    v26[3] = &unk_1E54999B8;
    id v19 = v15;
    id v27 = v19;
    long long v20 = v13;
    v30 = v20;
    id v21 = v11;
    id v28 = v21;
    v29 = self;
    [v18 addSuccessBlock:v26];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_4;
    v22[3] = &unk_1E54999E0;
    v25 = v20;
    v22[4] = self;
    id v23 = v19;
    id v24 = v21;
    [v18 addFailureBlock:v22];
  }
}

void __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 firstObject];
  v4 = *(void **)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_3;
  v14 = &unk_1E5499990;
  id v5 = v3;
  id v15 = v5;
  uint64_t v6 = objc_msgSend(v4, "_cn_firstObjectPassingTest:", &v11);
  id v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 56);
  if (v6)
  {
    v17[0] = v6;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1, v11, v12, v13, v14);
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 48), "defaultFriendResultFromFriendResults:forContact:", *(void *)(a1 + 32), *(void *)(a1 + 40), v11, v12, v13, v14);
    v16 = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v10, *(void *)(a1 + 40));
  }
}

void __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = CNUILogContactCard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_error_impl(&dword_18B625000, v4, OS_LOG_TYPE_ERROR, "Failed to query recents: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 32) defaultFriendResultFromFriendResults:*(void *)(a1 + 40) forContact:*(void *)(a1 + 48)];
  uint64_t v8 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v7, *(void *)(a1 + 48));
}

uint64_t __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 handle];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

BOOL __76__CNCardGameCenterManager_handleResults_forContact_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 relationship] == 2;
}

- (void)refreshGameCenterRelationshipsForContact:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNCardGameCenterManager *)self relationshipResultsCancelable];
  [v8 cancel];

  uint64_t v9 = [(CNCardGameCenterManager *)self schedulerProvider];
  id v10 = [v9 backgroundScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke;
  v14[3] = &unk_1E5499948;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = [v10 performCancelableBlock:v14];
  [(CNCardGameCenterManager *)self setRelationshipResultsCancelable:v13];
}

void __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) gameCenterProxy];
  id v3 = [v2 profileServicePrivate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5499920;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 getGameCenterRelationshipsForContact:v6 shouldRefresh:1 completionHandler:v5];
}

uint64_t __86__CNCardGameCenterManager_refreshGameCenterRelationshipsForContact_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleResults:a2 forContact:*(void *)(a1 + 40) error:a3 completionHandler:*(void *)(a1 + 48)];
}

- (void)getGameCenterRelationshipsForContact:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNCardGameCenterManager *)self relationshipResultsCancelable];
  [v8 cancel];

  uint64_t v9 = [(CNCardGameCenterManager *)self schedulerProvider];
  id v10 = [v9 backgroundScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke;
  v14[3] = &unk_1E5499948;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = [v10 performCancelableBlock:v14];
  [(CNCardGameCenterManager *)self setRelationshipResultsCancelable:v13];
}

void __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) gameCenterProxy];
  id v3 = [v2 profileServicePrivate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5499920;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 getGameCenterRelationshipsForContact:v6 shouldRefresh:0 completionHandler:v5];
}

uint64_t __82__CNCardGameCenterManager_getGameCenterRelationshipsForContact_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleResults:a2 forContact:*(void *)(a1 + 40) error:a3 completionHandler:*(void *)(a1 + 48)];
}

- (GKServiceProxy)gameCenterProxy
{
  gameCenterProxy = self->_gameCenterProxy;
  if (!gameCenterProxy)
  {
    Class GKDaemonProxyClass_41628 = getGKDaemonProxyClass_41628();
    uint64_t v5 = [(objc_class *)getGKLocalPlayerClass_41629() currentLocalPlayer];
    id v6 = [(objc_class *)GKDaemonProxyClass_41628 proxyForPlayer:v5];
    id v7 = self->_gameCenterProxy;
    self->_gameCenterProxy = v6;

    gameCenterProxy = self->_gameCenterProxy;
  }
  uint64_t v8 = gameCenterProxy;

  return v8;
}

- (BOOL)shouldActionDisplayDropdownMenu
{
  if ([(CNCardGameCenterManager *)self hasSentInvite]) {
    return 0;
  }
  uint64_t v4 = [(CNCardGameCenterManager *)self handles];
  BOOL v3 = (unint64_t)[v4 count] > 1;

  return v3;
}

- (id)handles
{
  BOOL v3 = [(CNCardGameCenterManager *)self contact];
  uint64_t v4 = [(CNCardGameCenterManager *)self handlesForContact:v3];

  return v4;
}

- (CNCardGameCenterManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)CNCardGameCenterManager;
  v2 = [(CNCardGameCenterManager *)&v12 init];
  if (v2)
  {
    BOOL v3 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v4 = [v3 defaultSchedulerProvider];
    schedulerProvider = v2->_schedulerProvider;
    v2->_schedulerProvider = (CNSchedulerProvider *)v4;

    id v6 = +[CNUIContactsEnvironment currentEnvironment];
    id v7 = [v6 defaultSchedulerProvider];
    uint64_t v8 = [v7 newSerialSchedulerWithName:@"com.apple.Contacts.CNCardGameCenterManager.workQueue"];
    workQueue = v2->_workQueue;
    v2->_workQueue = (CNScheduler *)v8;

    id v10 = v2;
  }

  return v2;
}

@end