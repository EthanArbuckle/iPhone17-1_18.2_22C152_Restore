@interface PMSeparationSource
- (PMSeparationSource)init;
- (id)_participantIdentityWithHandle:(id)a3;
- (id)_passwordsGroupWithGroup:(id)a3;
- (id)_passwordsParticipantWithParticipant:(id)a3;
- (id)name;
- (void)_fetchGroupsExcludingInvitationsWithCompletionHandler:(id)a3;
- (void)_groupsAndParticipantsMatchingHandle:(id)a3 completionHandler:(id)a4;
- (void)_leaveGroup:(id)a3 completionHandler:(id)a4;
- (void)_removeAllOtherParticipantsFromGroup:(id)a3 completionHandler:(id)a4;
- (void)_removeParticipant:(id)a3 fromGroup:(id)a4 completionHandler:(id)a5;
- (void)_stopSharingWithGroup:(id)a3 completionHandler:(id)a4;
- (void)_stopSharingWithGroups:(id)a3 completionHandler:(id)a4;
- (void)_stopSharingWithParticipant:(id)a3 inGroup:(id)a4 completionHandler:(id)a5;
- (void)_stopSharingWithParticipantsMatchingHandle:(id)a3 completionHandler:(id)a4;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation PMSeparationSource

- (id)name
{
  v0 = (void **)sub_2427A6D14();
  if (!v0) {
    sub_2427AA0C4();
  }
  v1 = *v0;

  return v1;
}

- (PMSeparationSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)PMSeparationSource;
  v2 = [(PMSeparationSource *)&v7 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = v2;
  }

  return v2;
}

- (id)_passwordsGroupWithGroup:(id)a3
{
  id v4 = a3;
  v5 = [v4 participants];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2427A756C;
  v9[3] = &unk_26516DBE8;
  v9[4] = self;
  v6 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v9);

  objc_super v7 = [[PMSeparationGroup alloc] initWithGroup:v4 participants:v6];

  return v7;
}

- (id)_passwordsParticipantWithParticipant:(id)a3
{
  id v4 = a3;
  v5 = [v4 handle];
  v6 = [(PMSeparationSource *)self _participantIdentityWithHandle:v5];

  objc_super v7 = [[PMSeparationParticipant alloc] initWithParticipant:v4 identity:v6];

  return v7;
}

- (id)_participantIdentityWithHandle:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFE9F8];
  v16[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  objc_super v7 = [v5 predicateForContactsMatchingHandleStrings:v6];

  v8 = [(CNContactStore *)self->_contactStore unifiedContactsMatchingPredicate:v7 keysToFetch:MEMORY[0x263EFFA68] error:0];
  v9 = [v8 firstObject];

  if (v9)
  {
    v10 = [PMSeparationParticipantIdentity alloc];
    v11 = [v9 identifier];
    v12 = [(PMSeparationParticipantIdentity *)v10 initWithContactIdentifier:v11];
  }
  else
  {
    if ([MEMORY[0x263F33620] isStringPhoneNumber:v4])
    {
      v13 = [[PMSeparationParticipantIdentity alloc] initWithPhoneNumber:v4];
    }
    else
    {
      if (([MEMORY[0x263F335C0] isStringEmailAddress:v4] & 1) == 0)
      {
        v14 = sub_2427A701C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_2427AA13C();
        }
      }
      v13 = [[PMSeparationParticipantIdentity alloc] initWithEmailAddress:v4];
    }
    v12 = v13;
  }

  return v12;
}

- (void)_stopSharingWithGroup:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  objc_super v7 = [v9 currentUserParticipant];
  uint64_t v8 = [v7 permissionLevel];

  if (v8 == 2) {
    [(PMSeparationSource *)self _removeAllOtherParticipantsFromGroup:v9 completionHandler:v6];
  }
  else {
    [(PMSeparationSource *)self _leaveGroup:v9 completionHandler:v6];
  }
}

- (void)_removeAllOtherParticipantsFromGroup:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  objc_super v7 = (void *)[v5 copy];
  uint64_t v8 = [v7 participants];
  if ([v8 count] == 1)
  {
    v6[2](v6, 0);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (([v14 isCurrentUser] & 1) == 0) {
            [v7 removeParticipant:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v15 = (void *)[objc_alloc(MEMORY[0x263F16D20]) initWithUpdatedGroup:v7];
    v16 = [MEMORY[0x263F16D18] sharedInstance];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2427A7A68;
    v17[3] = &unk_26516DC38;
    id v18 = v5;
    v19 = v6;
    [v16 updateGroupWithRequest:v15 completion:v17];
  }
}

- (void)_removeParticipant:(id)a3 fromGroup:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)[v8 copy];
  [v10 removeParticipant:v7];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F16D20]) initWithUpdatedGroup:v10];
  uint64_t v12 = [MEMORY[0x263F16D18] sharedInstance];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = sub_2427A7CDC;
  v16[3] = &unk_26516DC88;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  [v12 updateGroupWithRequest:v11 completion:v16];
}

- (void)_stopSharingWithGroups:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2810000000;
  v23[3] = &unk_2427AB743;
  int v24 = 0;
  id v9 = [MEMORY[0x263EFF980] array];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2427A7FF8;
  v18[3] = &unk_26516DCD8;
  uint64_t v10 = v8;
  id v19 = v10;
  long long v20 = self;
  long long v22 = v23;
  id v11 = v9;
  id v21 = v11;
  [v6 enumerateObjectsUsingBlock:v18];
  uint64_t v12 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2427A8140;
  block[3] = &unk_26516DD00;
  id v16 = v11;
  id v17 = v7;
  id v13 = v7;
  id v14 = v11;
  dispatch_group_notify(v10, v12, block);

  _Block_object_dispose(v23, 8);
}

- (void)_stopSharingWithParticipantsMatchingHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2427A8338;
  v8[3] = &unk_26516DD50;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PMSeparationSource *)self _groupsAndParticipantsMatchingHandle:a3 completionHandler:v8];
}

- (void)_groupsAndParticipantsMatchingHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2427A88C0;
  v10[3] = &unk_26516DD50;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(PMSeparationSource *)self _fetchGroupsExcludingInvitationsWithCompletionHandler:v10];
}

- (void)_stopSharingWithParticipant:(id)a3 inGroup:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v9 currentUserParticipant];
  uint64_t v11 = [v10 permissionLevel];

  if (v11 == 2) {
    [(PMSeparationSource *)self _removeParticipant:v12 fromGroup:v9 completionHandler:v8];
  }
  else {
    [(PMSeparationSource *)self _leaveGroup:v9 completionHandler:v8];
  }
}

- (void)_leaveGroup:(id)a3 completionHandler:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 groupID];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F16D10]) initWithGroupID:v7];
  id v9 = [MEMORY[0x263F663B0] sharedStore];
  char v10 = [v9 _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:v7 isForAlreadyExitedGroup:0];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F16D18] sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = sub_2427A8E28;
    v16[3] = &unk_26516DDF0;
    id v17 = v5;
    id v19 = v6;
    id v18 = v7;
    [v11 leaveGroupWithRequest:v8 completion:v16];

    id v12 = v17;
  }
  else
  {
    id v13 = sub_2427A701C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_2427AA3E8();
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = @"Failed to copy contributed items back to My Passwords from group.";
    id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v15 = [v14 errorWithDomain:@"com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain" code:2 userInfo:v12];
    (*((void (**)(id, void *))v6 + 2))(v6, v15);
  }
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_2427A701C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2427A5000, v5, OS_LOG_TYPE_INFO, "Fetch shared groups", buf, 2u);
  }
  if (_os_feature_enabled_impl())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2427A910C;
    v7[3] = &unk_26516DD50;
    v7[4] = self;
    id v8 = v4;
    [(PMSeparationSource *)self _fetchGroupsExcludingInvitationsWithCompletionHandler:v7];
  }
  else
  {
    id v6 = sub_2427A701C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2427A5000, v6, OS_LOG_TYPE_INFO, "Ignoring fetch groups request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x263EFFA68], 0);
  }
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_2427A701C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_2427A5000, v8, OS_LOG_TYPE_INFO, "Stop sharing with group: %@", buf, 0xCu);
  }
  if (_os_feature_enabled_impl())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v6;
      char v10 = [v9 group];
      uint64_t v11 = [v10 groupID];

      id v12 = [MEMORY[0x263F16D18] sharedInstance];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = sub_2427A9508;
      v20[3] = &unk_26516DE90;
      id v21 = v11;
      long long v22 = self;
      id v23 = v7;
      id v13 = v11;
      [v12 getGroupByGroupID:v13 completion:v20];
    }
    else
    {
      id v15 = sub_2427A701C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_2427AA510();
      }
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08320];
      id v17 = [NSString stringWithFormat:@"Invalid resource: %@", v6];
      uint64_t v25 = v17;
      id v18 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v19 = [v16 errorWithDomain:@"com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain" code:1 userInfo:v18];
      (*((void (**)(id, void *))v7 + 2))(v7, v19);
    }
  }
  else
  {
    id v14 = sub_2427A701C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2427A5000, v14, OS_LOG_TYPE_INFO, "Ignoring stop sharing request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_2427A701C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_2427A5000, v8, OS_LOG_TYPE_INFO, "Stop sharing with participant: %@", buf, 0xCu);
  }
  if (_os_feature_enabled_impl())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v6;
      char v10 = [v9 participant];
      uint64_t v11 = [v10 handle];

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = sub_2427A9A20;
      v19[3] = &unk_26516DE40;
      id v20 = v11;
      id v21 = v7;
      id v12 = v11;
      [(PMSeparationSource *)self _stopSharingWithParticipantsMatchingHandle:v12 completionHandler:v19];
    }
    else
    {
      id v14 = sub_2427A701C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_2427AA6C0();
      }
      id v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      id v16 = [NSString stringWithFormat:@"Invalid participant: %@", v6];
      id v23 = v16;
      id v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v18 = [v15 errorWithDomain:@"com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain" code:1 userInfo:v17];
      (*((void (**)(id, void *))v7 + 2))(v7, v18);
    }
  }
  else
  {
    id v13 = sub_2427A701C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2427A5000, v13, OS_LOG_TYPE_INFO, "Ignoring stop sharing request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_2427A701C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2427A5000, v5, OS_LOG_TYPE_INFO, "Stop all sharing", buf, 2u);
  }
  if (_os_feature_enabled_impl())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2427A9BD8;
    v7[3] = &unk_26516DD50;
    v7[4] = self;
    id v8 = v4;
    [(PMSeparationSource *)self _fetchGroupsExcludingInvitationsWithCompletionHandler:v7];
  }
  else
  {
    id v6 = sub_2427A701C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2427A5000, v6, OS_LOG_TYPE_INFO, "Ignoring stop sharing request: ongoing sharing feature is disabled", buf, 2u);
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_fetchGroupsExcludingInvitationsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F16D18] sharedInstance];
  id v5 = [MEMORY[0x263F16D08] all];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2427A9E18;
  v7[3] = &unk_26516DF28;
  id v8 = v3;
  id v6 = v3;
  [v4 getGroupsWithRequest:v5 completion:v7];
}

- (void).cxx_destruct
{
}

@end