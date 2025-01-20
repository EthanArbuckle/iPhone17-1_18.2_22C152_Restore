@interface ASAccountManagerTipManager
@end

@implementation ASAccountManagerTipManager

void __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_2;
  v5[3] = &unk_2643958C8;
  v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _checkEligibilityForiCloudKeychainTipWithCompletionHandler:v5];
}

void __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if ([MEMORY[0x263F662A0] isOngoingCredentialSharingEnabled])
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_3;
      v7[3] = &unk_2643958C8;
      uint64_t v4 = *(void **)(a1 + 40);
      id v5 = *(id *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v8 = v5;
      uint64_t v9 = v6;
      [v4 _checkEligibilityForFamilySharingTipWithCompletionHandler:v7];

      return;
    }
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }

  v3();
}

void __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_4;
    v4[3] = &unk_2643958A0;
    id v3 = *(void **)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    [v3 _checkEligibilityForGeneralSharingTipWithCompletionHandler:v4];
  }
}

uint64_t __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 members];
  unint64_t v8 = [v7 count];

  if (v8 > 1)
  {
    v11 = [MEMORY[0x263F662C8] sharedMonitor];
    char v12 = [v11 isKeychainSyncEnabled];

    if (v12)
    {
      v13 = [MEMORY[0x263F16D18] sharedInstance];
      v14 = [MEMORY[0x263F16D08] all];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_34;
      v17[3] = &unk_264395930;
      id v19 = *(id *)(a1 + 32);
      id v18 = v5;
      [v13 getGroupsWithRequest:v14 completion:v17];
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = [MEMORY[0x263F087E8] errorWithDomain:@"_ASAccountManagerTipManagerErrorDomain" code:1 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_cold_1(v9);
      }
      v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v10();
  }
}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_34_cold_1(v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v24 = a1;
    unint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = [*(id *)(a1 + 32) members];
    v10 = objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_1);
    v11 = [v8 setWithArray:v10];

    [MEMORY[0x263EFF980] array];
    v26 = id v25 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v18 = (void *)MEMORY[0x263EFFA08];
          id v19 = [v17 participants];
          v20 = objc_msgSend(v19, "safari_mapObjectsUsingBlock:", &__block_literal_global_41);
          v21 = [v18 setWithArray:v20];

          if ([v11 intersectsSet:v21]) {
            [v26 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);
    }

    uint64_t v22 = *(void *)(v24 + 40);
    v23 = (void *)[v26 copy];
    (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);

    id v6 = 0;
    id v5 = v25;
  }
}

id __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_36(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isMe])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 appleID];
  }

  return v3;
}

uint64_t __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handle];
}

void __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 members];
  unint64_t v8 = [v7 count];

  if (v8 > 1)
  {
    v10 = [v5 members];
    v11 = objc_msgSend(v10, "safari_firstObjectPassingTest:", &__block_literal_global_51);

    if ([v11 isChildAccount])
    {
      [*(id *)(a1 + 40) _acknowledgeTip:2];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v12 = [MEMORY[0x263F16D18] sharedInstance];
      uint64_t v13 = [MEMORY[0x263F16D08] all];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_2;
      v16[3] = &unk_2643959C8;
      id v18 = *(id *)(a1 + 32);
      id v14 = v5;
      uint64_t v15 = *(void *)(a1 + 40);
      id v17 = v14;
      uint64_t v19 = v15;
      [v12 getGroupsWithRequest:v13 completion:v16];
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_cold_1(v9);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_48(uint64_t a1, void *a2)
{
  return [a2 isMe];
}

void __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_34_cold_1(v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v25 = a1;
    unint64_t v8 = [MEMORY[0x263EFF9C0] set];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v26 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v15 = [v14 participants];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                if (([v20 isCurrentUser] & 1) == 0)
                {
                  v21 = [v20 handle];
                  [v8 addObject:v21];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v17);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v11);
    }

    uint64_t v22 = [*(id *)(v25 + 32) members];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_53;
    v27[3] = &unk_2643959A0;
    id v28 = v8;
    id v23 = v8;
    int v24 = objc_msgSend(v22, "safari_containsObjectPassingTest:", v27);

    if (v24) {
      [*(id *)(v25 + 48) _acknowledgeTip:2];
    }
    (*(void (**)(void))(*(void *)(v25 + 40) + 16))();
    id v6 = 0;
    id v5 = v26;
  }
}

uint64_t __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 appleID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Failed to get FamilyCircle with error: %@", v6, v7, v8, v9, v10);
}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_34_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21918F000, v4, v5, "Failed to fetch groups with error: %@", v6, v7, v8, v9, v10);
}

@end