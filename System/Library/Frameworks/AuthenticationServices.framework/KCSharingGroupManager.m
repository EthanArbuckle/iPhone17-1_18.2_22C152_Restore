@interface KCSharingGroupManager
@end

@implementation KCSharingGroupManager

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_cold_1(v6, v5);
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = [a2 members];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (([v12 isMe] & 1) == 0)
          {
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
            v13 = [v12 appleID];
            v14 = [MEMORY[0x263F16D18] sharedInstance];
            v16[0] = MEMORY[0x263EF8330];
            v16[1] = 3221225472;
            v16[2] = __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_18;
            v16[3] = &unk_264395D28;
            id v17 = v13;
            id v18 = *(id *)(a1 + 40);
            id v19 = *(id *)(a1 + 32);
            id v15 = v13;
            [v14 checkAvailabilityForHandle:v15 completion:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    id v5 = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_18(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_18_cold_1(v6, v5);
      if (!a2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  if (a2)
  {
LABEL_4:
    v7 = (void *)[objc_alloc(MEMORY[0x263F16D28]) initWithHandle:*(void *)(a1 + 32) permissionLevel:1];
    id v8 = *(id *)(a1 + 40);
    objc_sync_enter(v8);
    [*(id *)(a1 + 40) addObject:v7];
    objc_sync_exit(v8);
  }
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to fetch FAFamilyCircle with error: %{public}@", v7, v8, v9, v10, 2u);
}

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_18_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v5, v6, "Failed to check recipient eligibility for shared account groups with error: %@", v7, v8, v9, v10, 2u);
}

@end