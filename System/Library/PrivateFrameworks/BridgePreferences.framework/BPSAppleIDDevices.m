@interface BPSAppleIDDevices
+ (BOOL)isNetworkError:(id)a3;
+ (void)fetchFamilyMemberForAltDSID:(id)a3 username:(id)a4 withCompletion:(id)a5;
+ (void)fetchFamilyMemberForDevice:(id)a3 withCompletion:(id)a4;
@end

@implementation BPSAppleIDDevices

+ (void)fetchFamilyMemberForDevice:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x263F57768];
  id v7 = a3;
  uint64_t v8 = [v7 valueForProperty:v6];
  uint64_t v9 = [v7 valueForProperty:*MEMORY[0x263F57770]];

  if (v8 | v9)
  {
    v11 = objc_opt_class();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__BPSAppleIDDevices_fetchFamilyMemberForDevice_withCompletion___block_invoke;
    v12[3] = &unk_264408C80;
    id v13 = v5;
    [v11 fetchFamilyMemberForAltDSID:v8 username:v9 withCompletion:v12];
  }
  else
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"BPSAppleIDDevicesErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
  }
}

void __63__BPSAppleIDDevices_fetchFamilyMemberForDevice_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v8)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"BPSAppleIDDevicesErrorDomain" code:1 userInfo:0];
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

+ (void)fetchFamilyMemberForAltDSID:(id)a3 username:(id)a4 withCompletion:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263F3BF48]);
  if (v7)
  {
    v22[0] = v7;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    [v10 setExpectedAltDSIDs:v11];
  }
  else
  {
    v12 = pbb_accountsignin_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v12, OS_LOG_TYPE_DEFAULT, "Missing altDSID. Forcing a network fetch", buf, 2u);
    }

    [v10 setCachePolicy:2];
  }
  id v13 = pbb_accountsignin_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v13, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest fetch start", buf, 2u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__BPSAppleIDDevices_fetchFamilyMemberForAltDSID_username_withCompletion___block_invoke;
  v17[3] = &unk_264408CA8;
  id v19 = v8;
  id v20 = v9;
  id v18 = v7;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  [v10 startRequestWithCompletionHandler:v17];
}

void __73__BPSAppleIDDevices_fetchFamilyMemberForAltDSID_username_withCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pbb_accountsignin_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest fetch complete, error: %@", buf, 0xCu);
  }
  if (v6)
  {
    uint64_t v9 = a1[6];
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08608];
    id v30 = v6;
    v11 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v12 = [v10 errorWithDomain:@"BPSAppleIDDevicesErrorDomain" code:2 userInfo:v11];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
  }
  else if (a1[4])
  {
    uint64_t v13 = a1[6];
    id v14 = objc_msgSend(v5, "memberForAltDSID:");
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
LABEL_19:
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = objc_msgSend(v5, "members", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v20 = [v19 appleID];
          uint64_t v21 = [v20 caseInsensitiveCompare:a1[5]];

          if (!v21)
          {
            (*(void (**)(void, void *, void))(a1[6] + 16))(a1[6], v19, 0);
            goto LABEL_19;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    v22 = pbb_accountsignin_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)a1[5];
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_21C513000, v22, OS_LOG_TYPE_DEFAULT, "could not find family-member for account: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:@"BPSAppleIDDevicesErrorDomain"]) {
    BOOL v5 = [v3 code] == 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end