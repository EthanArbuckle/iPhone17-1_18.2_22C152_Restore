@interface ASCredentialSharingGroupsNotificationManager
- (ASCredentialSharingGroupsNotificationManager)init;
- (id)_notificationBodyStringForGroupMembers:(id)a3 addedToGroup:(id)a4;
- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccount:(id)a3;
- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccounts:(id)a3;
- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromMultipleGroups:(id)a3;
- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:(id)a3;
- (void)_getNumberOfPasswords:(unint64_t *)a3 numberOfPasskeys:(unint64_t *)a4 inSavedAccounts:(id)a5;
- (void)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:(id)a3;
- (void)_notifyUserAboutGroupMembers:(id)a3 addedToGroup:(id)a4;
- (void)_notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3 completionHandler:(id)a4;
- (void)_presentNotificationWithRequestIdentifier:(id)a3 content:(id)a4 completionHandler:(id)a5;
- (void)deleteGroupWithID:(id)a3 completionHandler:(id)a4;
- (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3;
- (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3;
- (void)groupsUpdatedWithInfos:(id)a3;
- (void)groupsUpdatedWithInfos:(id)a3 shouldForceShowingNotifications:(BOOL)a4 completionHandler:(id)a5;
- (void)leaveGroupWithID:(id)a3 completionHandler:(id)a4;
- (void)notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3;
- (void)setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:(BOOL)a3;
@end

@implementation ASCredentialSharingGroupsNotificationManager

- (ASCredentialSharingGroupsNotificationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASCredentialSharingGroupsNotificationManager;
  v2 = [(ASCredentialSharingGroupsNotificationManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:*MEMORY[0x263F664C8]];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_presentNotificationWithRequestIdentifier:(id)a3 content:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_global_queue(17, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke;
  v15[3] = &unk_264395530;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1DF48] requestWithIdentifier:*(void *)(a1 + 32) content:*(void *)(a1 + 40) trigger:0];
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2;
  v4[3] = &unk_264396AA0;
  id v5 = *(id *)(a1 + 56);
  [v3 addNotificationRequest:v2 withCompletionHandler:v4];
}

void __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2_cold_1(v4, v3);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  BOOL v21 = 0;
  uint64_t v5 = [MEMORY[0x263F662C0] sharedManager];
  BOOL v6 = [v5 keyBagLockStatus] != 0;

  BOOL v21 = v6;
  objc_super v7 = [MEMORY[0x263F662C0] sharedManager];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke;
  v19[3] = &unk_2643956C0;
  v19[4] = v20;
  id v8 = [v7 addKeyBagLockStatusChangedObserverWithHandler:v19];

  id v9 = [MEMORY[0x263F663B0] sharedStore];
  [v9 reset];

  id v10 = [MEMORY[0x263F663B0] sharedStore];
  v11 = dispatch_get_global_queue(17, 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2;
  v14[3] = &unk_264396AC8;
  id v12 = v8;
  id v15 = v12;
  id v13 = v4;
  id v17 = v13;
  v18 = v20;
  id v16 = self;
  [v10 performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:v11 task:v14];

  _Block_object_dispose(v20, 8);
}

void __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F662C0] sharedManager];
  uint64_t v3 = [v2 keyBagLockStatus];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F663B0] sharedStore];
  uint64_t v3 = [v2 sharedSavedAccountsInRecentlyDeletedToNotifyUserAbout];

  id v4 = [MEMORY[0x263F662C0] sharedManager];
  [v4 removeKeyBagLockStatusChangedObserver:*(void *)(a1 + 32)];

  if ([v3 count])
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_5;
      v8[3] = &unk_264395B50;
      objc_super v7 = *(void **)(a1 + 40);
      id v9 = *(id *)(a1 + 48);
      [v7 _notifyUserAboutSharedSavedAccountsInRecentlyDeleted:v3 completionHandler:v8];

      goto LABEL_9;
    }
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2_cold_1(v5);
    }
    BOOL v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    BOOL v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
LABEL_9:
}

uint64_t __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3 completionHandler:(id)a4
{
  BOOL v6 = (objc_class *)MEMORY[0x263F1DEF0];
  id v7 = a4;
  id v8 = a3;
  id v16 = objc_alloc_init(v6);
  id v9 = _WBSLocalizedString();
  [v16 setTitle:v9];

  id v10 = [(ASCredentialSharingGroupsNotificationManager *)self _notificationBodyStringForSharedRecentlyDeletedSavedAccounts:v8];

  [v16 setBody:v10];
  if ([MEMORY[0x263F662A0] isPasswordsAppInstalled])
  {
    v11 = [MEMORY[0x263F662F8] passwordManagerURLForRecentlyDeleted];
  }
  else
  {
    id v12 = NSURL;
    id v13 = [MEMORY[0x263F662F8] resourceSpecifierEncodedKey:*MEMORY[0x263F66450] value:*MEMORY[0x263F664B0]];
    id v14 = [@"prefs:root=PASSWORDS&" stringByAppendingString:v13];
    v11 = [v12 URLWithString:v14];
  }
  [v16 setDefaultActionURL:v11];

  if ([MEMORY[0x263F662A0] isPasswordsAppInstalled]) {
    id v15 = (__CFString *)(id)*MEMORY[0x263F664E0];
  }
  else {
    id v15 = @"com.apple.AuthenticationServices.CredentialSharingGroups.RecentlyDeleted";
  }
  [(ASCredentialSharingGroupsNotificationManager *)self _presentNotificationWithRequestIdentifier:v15 content:v16 completionHandler:v7];
}

- (void)setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:v3 forKey:@"DebugIgnoreLastNotificationDateAndFiveDayGracePeriodForRecentlyDeletedNotifications"];
}

- (void)leaveGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F662D8] sharedProvider];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke;
  v10[3] = &unk_264396AF0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v7 performTaskEnsuringGroupsAreLoadedOnQueue:MEMORY[0x263EF83A0] task:v10];
}

void __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = [MEMORY[0x263F662D8] sharedProvider];
    id v5 = [v4 cachedGroupWithID:*(void *)(a1 + 32)];

    if (v5)
    {
      id v6 = [MEMORY[0x263F663B0] sharedStore];
      char v7 = [v6 _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:*(void *)(a1 + 32) isForAlreadyExitedGroup:0];

      if (v7)
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x263F16D10]) initWithGroupID:*(void *)(a1 + 32)];
        id v9 = [MEMORY[0x263F16D18] sharedInstance];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke_2;
        v15[3] = &unk_264396AF0;
        id v17 = *(id *)(a1 + 40);
        id v16 = *(id *)(a1 + 32);
        [v9 leaveGroupWithRequest:v8 completion:v15];

LABEL_11:
        return;
      }
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F663F8];
      id v13 = @"Failed to move credentials back to personal keychain.";
      uint64_t v14 = 2;
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F663F8];
      id v13 = @"Failed to find group with provided group ID.";
      uint64_t v14 = 1;
    }
    id v8 = objc_msgSend(v11, "safari_errorWithDomain:code:privacyPreservingDescription:", v12, v14, v13);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
    goto LABEL_11;
  }
  BOOL v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v3();
}

void __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    BOOL v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [MEMORY[0x263F663B0] sharedStore];
    [v4 _recordGroupIdentifierForExitCleanup:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)deleteGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x263F662D8] sharedProvider];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke;
  v10[3] = &unk_264396AF0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v7 performTaskEnsuringGroupsAreLoadedOnQueue:MEMORY[0x263EF83A0] task:v10];
}

void __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = [MEMORY[0x263F662D8] sharedProvider];
    id v5 = [v4 cachedGroupWithID:*(void *)(a1 + 32)];

    if (v5)
    {
      id v6 = [MEMORY[0x263F663B0] sharedStore];
      char v7 = [v6 _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:*(void *)(a1 + 32) isForAlreadyExitedGroup:0];

      if (v7)
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x263F16D00]) initWithGroupID:*(void *)(a1 + 32)];
        id v9 = [MEMORY[0x263F16D18] sharedInstance];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke_2;
        v15[3] = &unk_264396AF0;
        id v17 = *(id *)(a1 + 40);
        id v16 = *(id *)(a1 + 32);
        [v9 deleteGroupWithRequest:v8 completion:v15];

LABEL_11:
        return;
      }
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F663F8];
      id v13 = @"Failed to move credentials back to personal keychain.";
      uint64_t v14 = 2;
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F663F8];
      id v13 = @"Failed to find group with provided group ID.";
      uint64_t v14 = 1;
    }
    id v8 = objc_msgSend(v11, "safari_errorWithDomain:code:privacyPreservingDescription:", v12, v14, v13);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
    goto LABEL_11;
  }
  BOOL v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v3();
}

void __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    BOOL v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [MEMORY[0x263F663B0] sharedStore];
    [v4 _recordGroupIdentifierForExitCleanup:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)groupsUpdatedWithInfos:(id)a3 shouldForceShowingNotifications:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v34 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v33 = (void (**)(void))a5;
  char v7 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21918F000, v7, OS_LOG_TYPE_INFO, "Authentication Services Agent received group updates.", buf, 2u);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    uint64_t v12 = "Authentication Services Agent received updates via groupsUpdatedWithInfos.";
    id v35 = v8;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
        id v15 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21918F000, v15, OS_LOG_TYPE_INFO, v12, buf, 2u);
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = [v14 updateType];
          if (v16 != 1)
          {
            if (v16) {
              goto LABEL_26;
            }
            id v17 = v12;
            v18 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              id v19 = v18;
              v20 = [v14 updatedGroup];
              BOOL v21 = [v20 groupID];
              *(_DWORD *)buf = 138412290;
              v44 = v21;
              _os_log_impl(&dword_21918F000, v19, OS_LOG_TYPE_INFO, "Authentication Services Agent received group member addition update for group with ID: %@.", buf, 0xCu);
            }
            v22 = [v14 updatedGroup];
            v23 = [v14 addedParticipants];
            if ([v23 count])
            {
              v24 = [v22 currentUserParticipant];
              v25 = [v22 ownerParticipant];
              if (v24 != v25)
              {

                goto LABEL_24;
              }

              if (!v34)
              {
LABEL_25:

                uint64_t v12 = v17;
                id v8 = v35;
                goto LABEL_26;
              }
            }
            else
            {

              if (!v34) {
                goto LABEL_25;
              }
            }
LABEL_24:
            v31 = [v14 addedParticipants];
            [(ASCredentialSharingGroupsNotificationManager *)self _notifyUserAboutGroupMembers:v31 addedToGroup:v22];

            goto LABEL_25;
          }
          v27 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = v27;
            v29 = [v14 departedGroupID];
            *(_DWORD *)buf = 138412290;
            v44 = v29;
            _os_log_impl(&dword_21918F000, v28, OS_LOG_TYPE_INFO, "Authentication Services Agent received group departure update for group with ID: %@.", buf, 0xCu);
          }
          v30 = [v14 departedGroupID];
          [(ASCredentialSharingGroupsNotificationManager *)self _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:v30];
        }
        else
        {
          v26 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[ASCredentialSharingGroupsNotificationManager groupsUpdatedWithInfos:shouldForceShowingNotifications:completionHandler:](&v37, v38, v26);
          }
        }
LABEL_26:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v32 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
      uint64_t v10 = v32;
    }
    while (v32);
  }

  v33[2](v33);
}

- (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
}

- (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F663B0] sharedStore];
  id v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __107__ASCredentialSharingGroupsNotificationManager_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke;
  v7[3] = &unk_264395B50;
  id v8 = v3;
  id v6 = v3;
  [v4 performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:v5 task:v7];
}

void __107__ASCredentialSharingGroupsNotificationManager_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = NSNumber;
  id v5 = [MEMORY[0x263F663B0] sharedStore];
  id v3 = [v5 savedAccounts];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  (*(void (**)(uint64_t, void *, void))(v1 + 16))(v1, v4, 0);
}

- (void)groupsUpdatedWithInfos:(id)a3
{
}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccounts:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    id v6 = [(ASCredentialSharingGroupsNotificationManager *)self _notificationBodyStringForSharedRecentlyDeletedSavedAccount:v5];
  }
  else
  {
    char v7 = objc_msgSend(v4, "safari_setByApplyingBlock:", &__block_literal_global_32);
    unint64_t v8 = [v7 count];

    if (v8 < 2) {
      [(ASCredentialSharingGroupsNotificationManager *)self _notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:v4];
    }
    else {
    id v6 = [(ASCredentialSharingGroupsNotificationManager *)self _notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromMultipleGroups:v4];
    }
  }

  return v6;
}

id __109__ASCredentialSharingGroupsNotificationManager__notificationBodyStringForSharedRecentlyDeletedSavedAccounts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isSavedInSharedGroup])
  {
    id v3 = [v2 sharedGroupID];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccount:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = [v3 lastModifiedDate];
  id v6 = [v4 dateByAddingUnit:16 value:30 toDate:v5 options:0];

  char v7 = [MEMORY[0x263EFF910] now];
  uint64_t v8 = objc_msgSend(v7, "safari_numberOfDaysUntilDate:", v6) + 1;

  uint64_t v9 = [MEMORY[0x263F662D8] sharedProvider];
  uint64_t v10 = [v3 sharedGroupID];
  uint64_t v11 = [v9 cachedGroupWithID:v10];

  if (!v11)
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccount:](v12, v3);
    }
  }
  uint64_t v13 = [v3 credentialTypes];
  if (v13 == 3)
  {
    uint64_t v14 = NSString;
    if (v11) {
      goto LABEL_11;
    }
  }
  else if (v13 == 2)
  {
    uint64_t v14 = NSString;
    if (v11) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v14 = NSString;
    if (v11)
    {
LABEL_11:
      id v15 = _WBSLocalizedString();
      uint64_t v16 = [v3 highLevelDomain];
      id v17 = [v11 displayName];
      v18 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16, v17, v8);

      goto LABEL_13;
    }
  }
  id v15 = _WBSLocalizedString();
  uint64_t v16 = [v3 highLevelDomain];
  v18 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16, v8);
LABEL_13:

  return v18;
}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  id v5 = [v4 firstObject];
  id v6 = [v5 sharedGroupID];

  char v7 = [MEMORY[0x263F662D8] sharedProvider];
  uint64_t v8 = [v7 cachedGroupWithID:v6];

  if (!v8)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:]();
    }
  }
  [(ASCredentialSharingGroupsNotificationManager *)self _getNumberOfPasswords:&v22 numberOfPasskeys:&v21 inSavedAccounts:v4];
  uint64_t v10 = NSString;
  if (!v22 || !v21)
  {
    if (v22)
    {
      if (v8)
      {
        uint64_t v11 = _WBSLocalizedString();
        uint64_t v15 = v22;
LABEL_14:
        uint64_t v14 = [v8 displayName];
        objc_msgSend(v10, "localizedStringWithFormat:", v11, v15, v14, v20);
        goto LABEL_15;
      }
      uint64_t v11 = _WBSLocalizedString();
      uint64_t v17 = v22;
    }
    else
    {
      if (v8)
      {
        uint64_t v11 = _WBSLocalizedString();
        uint64_t v15 = v21;
        goto LABEL_14;
      }
      uint64_t v11 = _WBSLocalizedString();
      uint64_t v17 = v21;
    }
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v17, v19);
    goto LABEL_19;
  }
  if (v8)
  {
    uint64_t v11 = _WBSLocalizedString();
    uint64_t v13 = v21;
    uint64_t v12 = v22;
    uint64_t v14 = [v8 displayName];
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v12, v13, v14);
    uint64_t v16 = LABEL_15:;

    goto LABEL_20;
  }
  uint64_t v11 = _WBSLocalizedString();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v22, v21);
  uint64_t v16 = LABEL_19:;
LABEL_20:

  return v16;
}

- (void)_getNumberOfPasswords:(unint64_t *)a3 numberOfPasskeys:(unint64_t *)a4 inSavedAccounts:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 += [v14 credentialTypes] & 1;
        v10 += ((unint64_t)[v14 credentialTypes] >> 1) & 1;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
    unint64_t v11 = 0;
  }
  *a3 = v11;
  *a4 = v10;
}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromMultipleGroups:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  [(ASCredentialSharingGroupsNotificationManager *)self _getNumberOfPasswords:&v11 numberOfPasskeys:&v10 inSavedAccounts:a3];
  id v3 = NSString;
  if (v11) {
    BOOL v4 = v10 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (v11)
    {
      id v6 = _WBSLocalizedString();
      uint64_t v5 = v11;
    }
    else
    {
      id v6 = _WBSLocalizedString();
      uint64_t v5 = v10;
    }
    objc_msgSend(v3, "localizedStringWithFormat:", v6, v5, v9);
  }
  else
  {
    id v6 = _WBSLocalizedString();
    objc_msgSend(v3, "localizedStringWithFormat:", v6, v11, v10);
  id v7 = };

  return v7;
}

- (void)_notifyUserAboutGroupMembers:(id)a3 addedToGroup:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F1DEF0];
  id v7 = a4;
  id v8 = a3;
  id v17 = objc_alloc_init(v6);
  uint64_t v9 = _WBSLocalizedString();
  [v17 setTitle:v9];

  uint64_t v10 = [(ASCredentialSharingGroupsNotificationManager *)self _notificationBodyStringForGroupMembers:v8 addedToGroup:v7];

  [v17 setBody:v10];
  uint64_t v11 = [v7 groupID];

  if ([MEMORY[0x263F662A0] isPasswordsAppInstalled])
  {
    uint64_t v12 = [MEMORY[0x263F662F8] passwordManagerURLForGroupWithID:v11];
  }
  else
  {
    uint64_t v13 = NSURL;
    uint64_t v14 = [MEMORY[0x263F662F8] resourceSpecifierEncodedKey:*MEMORY[0x263F664A0] value:v11];
    long long v15 = [@"prefs:root=PASSWORDS&" stringByAppendingString:v14];
    uint64_t v12 = [v13 URLWithString:v15];
  }
  [v17 setDefaultActionURL:v12];

  if ([MEMORY[0x263F662A0] isPasswordsAppInstalled]) {
    long long v16 = (__CFString *)(id)*MEMORY[0x263F664D0];
  }
  else {
    long long v16 = @"com.apple.AuthenticationServices.CredentialSharingGroups.GroupUpdate";
  }
  [(ASCredentialSharingGroupsNotificationManager *)self _presentNotificationWithRequestIdentifier:v16 content:v17 completionHandler:0];
}

- (id)_notificationBodyStringForGroupMembers:(id)a3 addedToGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_ASAccountSharingGroupMemberDataManager sharedManager];
  id v8 = [v7 groupMemberDataForGroupParticipants:v6];

  uint64_t v9 = [v8 count];
  if (v9 == 3)
  {
    v28 = NSString;
    uint64_t v11 = _WBSLocalizedString();
    uint64_t v12 = [v8 firstObject];
    uint64_t v13 = [v12 displayName];
    uint64_t v14 = [v8 objectAtIndexedSubscript:1];
    v27 = [v14 displayName];
    long long v16 = [v8 objectAtIndexedSubscript:2];
    [v16 displayName];
    v18 = id v17 = v5;
    uint64_t v19 = [v17 displayName];
    long long v15 = objc_msgSend(v28, "localizedStringWithFormat:", v11, v13, v27, v18, v19);

    id v5 = v17;
  }
  else
  {
    if (v9 == 2)
    {
      uint64_t v20 = NSString;
      uint64_t v11 = _WBSLocalizedString();
      uint64_t v12 = [v8 firstObject];
      uint64_t v13 = [v12 displayName];
      uint64_t v14 = [v8 lastObject];
      uint64_t v21 = [v14 displayName];
      uint64_t v22 = [v5 displayName];
      objc_msgSend(v20, "localizedStringWithFormat:", v11, v13, v21, v22, v26);
    }
    else
    {
      if (v9 == 1)
      {
        uint64_t v10 = NSString;
        uint64_t v11 = _WBSLocalizedString();
        uint64_t v12 = [v8 firstObject];
        uint64_t v13 = [v12 displayName];
        uint64_t v14 = [v5 displayName];
        long long v15 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v13, v14);
        goto LABEL_9;
      }
      v23 = NSString;
      uint64_t v11 = _WBSLocalizedString();
      uint64_t v12 = [v8 firstObject];
      uint64_t v13 = [v12 displayName];
      uint64_t v14 = [v8 objectAtIndexedSubscript:1];
      uint64_t v21 = [v14 displayName];
      uint64_t v24 = [v8 count] - 2;
      uint64_t v22 = [v5 displayName];
      objc_msgSend(v23, "localizedStringWithFormat:", v11, v13, v21, v24, v22);
    long long v15 = };
  }
LABEL_9:

  return v15;
}

- (void)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263F663B0] sharedStore];
  char v5 = [v4 _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:v3 isForAlreadyExitedGroup:1];

  if ((v5 & 1) == 0)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ASCredentialSharingGroupsNotificationManager _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:]();
    }
  }
}

- (void).cxx_destruct
{
}

void __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to present notification with error: %@", v7, v8, v9, v10, v11);
}

void __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Skipping Recently Deleted shared accounts notification because the key bag was locked.", v1, 2u);
}

- (void)groupsUpdatedWithInfos:(uint8_t *)buf shouldForceShowingNotifications:(unsigned char *)a2 completionHandler:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "updateType SPI not available on group update info.", buf, 2u);
}

- (void)_notificationBodyStringForSharedRecentlyDeletedSavedAccount:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v4 = [a2 sharedGroupID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to get group display name for group ID for sharing notification: %{private}@", v7, v8, v9, v10, v11);
}

- (void)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21918F000, v0, OS_LOG_TYPE_ERROR, "Failed to get group display name for group ID for sharing notification: %{private}@", v1, 0xCu);
}

- (void)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21918F000, v0, OS_LOG_TYPE_ERROR, "Failed to move contributed credentials back from group ID: %@", v1, 0xCu);
}

@end