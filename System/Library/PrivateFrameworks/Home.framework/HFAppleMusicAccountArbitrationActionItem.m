@interface HFAppleMusicAccountArbitrationActionItem
@end

@implementation HFAppleMusicAccountArbitrationActionItem

BOOL __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 remoteLoginHandler];
  v3 = [v2 loggedInAccount];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 remoteLoginHandler];
  BOOL v4 = [v3 loggedInAccount];
  v5 = [v4 username];
  v6 = [*(id *)(a1 + 32) username];
  uint64_t v7 = [v5 isEqual:v6] ^ 1;

  return v7;
}

BOOL __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 remoteLoginHandler];
  v3 = [v2 loggedInAccount];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 finishWithNoResult];
}

void __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v6 = +[HFAppleMusicAccountOperations logoutAccessories:v2];
  BOOL v4 = [v3 completionHandlerAdapter];

  id v5 = (id)[v6 addCompletionBlock:v4];
}

void __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  id v7 = a2;
  v8 = v6(v3, v4, v5);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_2;
  v17 = &unk_26409B0D8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v18 = v9;
  uint64_t v19 = v10;
  v11 = [v8 flatMap:&v14];
  v12 = objc_msgSend(v7, "completionHandlerAdapter", v14, v15, v16, v17);

  id v13 = (id)[v11 addCompletionBlock:v12];
}

id __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 uniqueIdentifier];
  objc_msgSend(v2, "na_safeSetObject:forKey:", v4, v5);

  id v6 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v6;
}

uint64_t __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 finishWithNoResult];
}

void __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_4(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  if (a1[4])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = a1[5];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = +[HFAppleMusicAccountOperations executeCompanionLoginForAccessory:*(void *)(*((void *)&v20 + 1) + 8 * v9) account:a1[4]];
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  v11 = [MEMORY[0x263F58190] chainFutures:v4];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_5;
  v14[3] = &unk_264096968;
  id v15 = a1[5];
  id v16 = a1[4];
  id v17 = v3;
  id v18 = a1[6];
  id v19 = a1[7];
  id v12 = v3;
  id v13 = (id)[v11 addCompletionBlock:v14];
}

void __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_5(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_6;
  v13[3] = &unk_26408D968;
  uint64_t v2 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "na_filter:", v13);
  id v4 = [v3 allObjects];

  if ([v4 count])
  {
    id v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Accessoring needing Proxy  = %@", buf, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x263F58190] chainFutures:*(void *)(a1 + 56)];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_88;
    v8[3] = &unk_26408F198;
    id v9 = *(id *)(a1 + 48);
    id v10 = v4;
    id v11 = *(id *)(a1 + 64);
    id v12 = *(id *)(a1 + 32);
    id v7 = (id)[v6 addCompletionBlock:v8];
  }
  else
  {
    [*(id *)(a1 + 48) finishWithNoResult];
  }
}

uint64_t __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteLoginHandler];
  id v4 = [v3 loggedInAccount];
  id v5 = [v4 username];
  uint64_t v6 = [*(id *)(a1 + 32) username];
  uint64_t v7 = [v5 isEqual:v6] ^ 1;

  return v7;
}

void __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "contextFetchError  = [%@]", buf, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v4];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F58190];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_89;
    v14[3] = &unk_26408E2E8;
    uint64_t v7 = *(void **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    uint64_t v8 = objc_msgSend(v7, "na_map:", v14);
    id v9 = [v6 chainFutures:v8];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_94;
    v11[3] = &unk_26408F238;
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 32);
    id v10 = (id)[v9 addCompletionBlock:v11];
  }
}

id __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 uniqueIdentifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = +[HFAppleMusicAccountOperations executeProxyLoginForAccessory:v3 context:v6];
  }
  else
  {
    uint64_t v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "AKAppleIDAuthenticationContext is invalid for accessory [%@] returning", (uint8_t *)&v11, 0xCu);
    }

    id v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 16, @"Fetch AKAppleIDAuthenticationContexts", 0);
    uint64_t v7 = [MEMORY[0x263F58190] futureWithError:v9];
  }
  return v7;
}

void __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[HFUtilities itemIdentifierForAccessories:*(void *)(a1 + 32)];
  uint64_t v8 = HFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Completed all HFAppleMusicAccountOperations with result %@, error %@. Now calling HFAppleMusicAccountEndManualLoginNotification with identifier %@", buf, 0x20u);
  }

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  int v11 = @"symptomItemIdentifier";
  id v12 = v7;
  id v10 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v9 postNotificationName:@"HFAppleMusicAccountEndManualLoginNotification" object:0 userInfo:v10];

  [*(id *)(a1 + 40) finishWithResult:v5 error:v6];
}

@end