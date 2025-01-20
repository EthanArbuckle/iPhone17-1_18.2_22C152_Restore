@interface KSCloudKitManager
@end

@implementation KSCloudKitManager

uint64_t __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_99(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) accountStatus];
  uint64_t v4 = [*(id *)(a1 + 32) supportsDeviceToDeviceEncryption];
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

void __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[_KSCloudKitManager queryAccountStatusWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  >>> checking account status", buf, 0xCu);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_91;
  v4[3] = &unk_264890A48;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _checkAccountStatusWithCompletionHandler:v4 withRetryCount:0];
}

void __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((*(void *)(a1 + 48) | 4) == 4)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = KSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[_KSCloudKitManager queryAccountStatusWithCompletionHandler:]_block_invoke_2";
      _os_log_impl(&dword_22B2BC000, v3, OS_LOG_TYPE_INFO, "%s  >>> account is set up", buf, 0xCu);
    }

    uint64_t v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_92;
    v7[3] = &unk_2648909F8;
    v7[4] = v4;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = v5;
    uint64_t v9 = v6;
    char v10 = *(unsigned char *)(a1 + 56);
    [v4 shouldDetectAccountChangeWithResponse:v7];
  }
}

void __47___KSCloudKitManager_userIdentityWithResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47___KSCloudKitManager_userIdentityWithResponse___block_invoke_2;
  block[3] = &unk_2648908B8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 domain];
  if (![v7 isEqualToString:*MEMORY[0x263EFD498]]
    || [v6 code] != 3 && objc_msgSend(v6, "code") != 4 && objc_msgSend(v6, "code") != 9)
  {

    goto LABEL_9;
  }
  unint64_t v8 = *(void *)(a1 + 48);

  if (v8 > 1)
  {
LABEL_9:
    v17 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_99;
    block[3] = &unk_264890B10;
    id v27 = *(id *)(a1 + 40);
    id v26 = v5;
    dispatch_async(v17, block);

    v18 = v27;
    goto LABEL_14;
  }
  id v9 = [v6 userInfo];
  uint64_t v10 = *MEMORY[0x263EFD4A0];
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFD4A0]];

  if (v11)
  {
    id v12 = [v6 userInfo];
    id v13 = [v12 objectForKeyedSubscript:v10];
    [v13 doubleValue];
    double v15 = v14;

    int64_t v16 = (uint64_t)(v15 * 1000000000.0);
  }
  else
  {
    int64_t v16 = 60000000000;
  }
  dispatch_time_t v19 = dispatch_time(0, v16);
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 8);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_2;
  v28[3] = &unk_264890AE8;
  v28[4] = v20;
  id v22 = *(id *)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 48);
  id v29 = v22;
  uint64_t v30 = v23;
  dispatch_after(v19, v21, v28);
  v24 = KSCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_cold_1();
  }

  v18 = v29;
LABEL_14:
}

void __44___KSCloudKitManager_setupAccountDidChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v13[5] = *MEMORY[0x263EF8340];
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  v12[0] = @"KSCloudKitAccountDidChangeStatusKey";
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v13[0] = v6;
  v12[1] = @"KSCloudKitAccountDidChangeAccountChangedKey";
  v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v13[1] = v7;
  v12[2] = @"KSCloudKitAccountDidChangeUserChangedKey";
  unint64_t v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v13[2] = v8;
  v12[3] = @"KSCloudKitAccountDidChangeDeviceToDeviceKey";
  id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 50)];
  v13[3] = v9;
  v12[4] = @"KSCloudKitAccountDidSuccessfullyCreateZone";
  uint64_t v10 = [NSNumber numberWithBool:a2];
  v13[4] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  [v4 postNotificationName:@"KSCloudKitAccountDidChange" object:v5 userInfo:v11];
}

uint64_t __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_92(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = KSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      v11 = "-[_KSCloudKitManager queryAccountStatusWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v3, OS_LOG_TYPE_INFO, "%s  >>> user logged in has changed", (uint8_t *)&v10, 0xCu);
    }

    id v4 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v5 = +[_KSUtilities userDefaultsSuiteName];
    id v6 = (void *)[v4 initWithSuiteName:v5];

    v7 = [*(id *)(a1 + 32) recordZoneKey];
    [v6 removeObjectForKey:v7];

    unint64_t v8 = [*(id *)(a1 + 32) subscriptionKey];
    [v6 removeObjectForKey:v8];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_91(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_264890A20;
  uint64_t v9 = a2;
  id v6 = *(id *)(a1 + 40);
  char v10 = a3;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  dispatch_async(v5, v7);
}

void __60___KSCloudKitManager_shouldDetectAccountChangeWithResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  if ([a3 code] == 9)
  {
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  unint64_t v6 = (unint64_t)v19;
  id v7 = objc_alloc(MEMORY[0x263EFFA40]);
  id v8 = +[_KSUtilities userDefaultsSuiteName];
  uint64_t v9 = (void *)[v7 initWithSuiteName:v8];

  char v10 = [*(id *)(a1 + 32) lastKnownUserKey];
  v11 = [v9 stringForKey:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v9 stringForKey:@"KSLastKnownUserID"];
  }
  unint64_t v14 = (unint64_t)v13;

  if (v6 | v14)
  {
    if (v6 || !v14)
    {
      uint64_t v5 = [(id)v14 isEqualToString:v6] ^ 1;
      if (v6)
      {
        v18 = [*(id *)(a1 + 32) lastKnownUserKey];
        [v9 setObject:v6 forKey:v18];

        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  double v15 = [*(id *)(a1 + 32) lastKnownUserKey];
  [v9 removeObjectForKey:v15];

  [v9 removeObjectForKey:@"KSLastKnownUserID"];
LABEL_12:

LABEL_13:
  int64_t v16 = v19;
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17)
  {
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, v5);
    int64_t v16 = v19;
  }
}

void __47___KSCloudKitManager_userIdentityWithResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) recordName];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

void __44___KSCloudKitManager_setupAccountDidChange___block_invoke_2(uint64_t a1, uint64_t a2, char a3, char a4)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke_3;
  v11[3] = &unk_264890908;
  v11[4] = *(void *)(a1 + 32);
  v11[5] = a2;
  char v12 = *(unsigned char *)(a1 + 40);
  char v13 = a4;
  char v14 = a3;
  id v7 = (void (**)(void, void))MEMORY[0x230F45010](v11);
  if (a2 == 1 && ((a3 & 1) != 0 || ([*(id *)(a1 + 32) needsDeviceToDevice] & 1) == 0))
  {
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke_4;
    v9[3] = &unk_264890930;
    v9[4] = v8;
    char v10 = v7;
    [v8 setupRecordZoneWithCompletionHandler:v9 ignoreDefaults:0];
  }
  else
  {
    v7[2](v7, 0);
  }
}

uint64_t __44___KSCloudKitManager_setupAccountDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke_2;
  v3[3] = &unk_264890958;
  v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 queryAccountStatusWithCompletionHandler:v3];
}

void __40___KSCloudKitManager_isAccountAvailable__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40___KSCloudKitManager_isAccountAvailable__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40___KSCloudKitManager_isAccountAvailable__block_invoke_2;
  v4[3] = &unk_264890A98;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 _checkAccountStatusWithCompletionHandler:v4 withRetryCount:0];
}

uint64_t __44___KSCloudKitManager_setupAccountDidChange___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v3 = KSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      unint64_t v6 = "-[_KSCloudKitManager setupAccountDidChange:]_block_invoke_4";
      _os_log_impl(&dword_22B2BC000, v3, OS_LOG_TYPE_INFO, "%s  Failed to set up record zone", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setupSubscription];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __45___KSCloudKitManager_accountStatusDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = a2;
  [v2 setupAccountDidChange:1];
  v3[2](v3, 0);
}

uint64_t __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkAccountStatusWithCompletionHandler:*(void *)(a1 + 40) withRetryCount:*(void *)(a1 + 48) + 1];
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = v5;
  if (a2)
  {
    if (!v5)
    {
      uint64_t v7 = [a2 zoneID];
      id v8 = [v7 zoneName];
      uint64_t v9 = [*(id *)(a1 + 32) recordZone];
      char v10 = [v9 zoneID];
      v11 = [v10 zoneName];
      int v12 = [v8 isEqualToString:v11];

      if (v12)
      {
        char v13 = *(void **)(a1 + 40);
        char v14 = [*(id *)(a1 + 32) recordZoneKey];
        [v13 setBool:1 forKey:v14];
      }
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  int64_t v16 = *(NSObject **)(v15 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2;
  block[3] = &unk_264890B60;
  void block[4] = v15;
  id v17 = *(id *)(a1 + 48);
  id v20 = v6;
  id v21 = v17;
  id v18 = v6;
  dispatch_async(v16, block);
}

uint64_t __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setRecordZoneOperationInProgress:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) recordZoneOperationInProgress] & 1) == 0)
  {
    [*(id *)(a1 + 32) setRecordZoneOperationInProgress:1];
    id v2 = KSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[_KSCloudKitManager setupRecordZoneWithCompletionHandler:ignoreDefaults:]_block_invoke_3";
      _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  >>> creating record zone", buf, 0xCu);
    }

    long long v3 = *(void **)(a1 + 32);
    char v4 = [v3 recordZone];
    id v5 = [v4 zoneID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_102;
    v7[3] = &unk_264890BD8;
    unint64_t v6 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    id v9 = *(id *)(a1 + 48);
    [v3 _ckFetchRecordZoneWithID:v5 completionHandler:v7];
  }
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x263EFD498]];

  if (v8)
  {
    uint64_t v9 = [v6 code];
    switch(v9)
    {
      case 26:
        goto LABEL_5;
      case 112:
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(NSObject **)(v14 + 8);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_104;
        v16[3] = &unk_264890A70;
        v16[4] = v14;
        id v17 = *(id *)(a1 + 48);
        dispatch_async(v15, v16);
        char v13 = v17;
        goto LABEL_8;
      case 28:
LABEL_5:
        char v10 = *(void **)(a1 + 32);
        v11 = [v10 recordZone];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_103;
        v18[3] = &unk_264890BB0;
        uint64_t v12 = *(void **)(a1 + 40);
        v18[4] = *(void *)(a1 + 32);
        id v19 = v12;
        [v10 _ckSaveRecordZone:v11 completionHandler:v18];

        char v13 = v19;
LABEL_8:

        goto LABEL_9;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_9:
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_103(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = KSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_103_cold_1(a1, v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_104(uint64_t a1)
{
  [*(id *)(a1 + 32) setRecordZoneOperationInProgress:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 resetZoneWithDelete:2 withCompletionHandler:v3];
}

void __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) recordZoneOperationInProgress]) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 2)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    char v4 = [*(id *)(a1 + 32) recordZoneKey];
    id v5 = v7;
    uint64_t v6 = 1;
  }
  else
  {
    if (v2) {
      goto LABEL_7;
    }
    uint64_t v3 = *(void **)(a1 + 40);
    char v4 = [*(id *)(a1 + 32) recordZoneKey];
    id v5 = v3;
    uint64_t v6 = 0;
  }
  [v5 setBool:v6 forKey:v4];

LABEL_7:
  int v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) recordZoneKey];
  LODWORD(v8) = [v8 BOOLForKey:v9];

  char v10 = *(void **)(a1 + 32);
  if (v8)
  {
    [v10 setRecordZoneOperationInProgress:1];
    v11 = KSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = "-[_KSCloudKitManager resetZoneWithDelete:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v11, OS_LOG_TYPE_INFO, "%s  >>> deleting record zone", buf, 0xCu);
    }

    uint64_t v12 = *(void **)(a1 + 32);
    char v13 = [v12 recordZone];
    uint64_t v14 = [v13 zoneID];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke_105;
    v18[3] = &unk_264890C28;
    int64_t v16 = *(void **)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    v18[4] = *(void *)(a1 + 32);
    uint64_t v21 = v15;
    id v20 = v16;
    id v19 = *(id *)(a1 + 40);
    [v12 _ckDeleteRecordZoneWithID:v14 completionHandler:v18];
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 48);
    [v10 setupRecordZoneWithCompletionHandler:v17 ignoreDefaults:0];
  }
}

void __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke_105(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  [*(id *)(a1 + 32) setRecordZoneOperationInProgress:0];
  if (!v10)
  {
LABEL_6:
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) recordZoneKey];
    [v6 setBool:0 forKey:v7];

    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    [v8 setupRecordZoneWithCompletionHandler:v9 ignoreDefaults:0];
    return;
  }
  if (*(void *)(a1 + 56) == 2)
  {
    char v4 = [v10 domain];
    if ([v4 isEqualToString:*MEMORY[0x263EFD498]])
    {
      uint64_t v5 = [v10 code];

      if (v5 == 26)
      {

        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 encryptedValuesByKey];
  [v7 setObject:v5 forKey:v6];
}

uint64_t __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 encryptedValuesByKey];
  [v7 setObject:v5 forKey:v6];
}

void __39___KSCloudKitManager_setupSubscription__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) subscriptionOperationInProgress] & 1) == 0)
  {
    [*(id *)(a1 + 32) setSubscriptionOperationInProgress:1];
    uint64_t v2 = KSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[_KSCloudKitManager setupSubscription]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  Creating subscription", buf, 0xCu);
    }

    id v3 = objc_alloc(MEMORY[0x263EFD818]);
    char v4 = [*(id *)(a1 + 32) recordZone];
    id v5 = [v4 zoneID];
    id v6 = (void *)[v3 initWithZoneID:v5 subscriptionID:*(void *)(a1 + 40)];

    id v7 = objc_opt_new();
    [v7 setShouldBadge:0];
    [v6 setNotificationInfo:v7];
    id v8 = objc_alloc(MEMORY[0x263EFD750]);
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObject:v6];
    id v10 = (void *)[v8 initWithSubscriptionsToSave:v9 subscriptionIDsToDelete:0];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __39___KSCloudKitManager_setupSubscription__block_invoke_118;
    v14[3] = &unk_264890CA0;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    char v13 = *(void **)(a1 + 40);
    id v15 = v11;
    uint64_t v16 = v12;
    id v17 = v13;
    [v10 setModifySubscriptionsCompletionBlock:v14];
    [*(id *)(a1 + 32) addOperation:v10];
  }
}

void __39___KSCloudKitManager_setupSubscription__block_invoke_118(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [a4 userInfo];
    NSLog(&cfstr_ErrorFailedToC.isa, v5, v6);
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) subscriptionKey];
    [v7 setBool:1 forKey:v6];
  }

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39___KSCloudKitManager_setupSubscription__block_invoke_2;
  block[3] = &unk_2648906A8;
  void block[4] = v8;
  dispatch_async(v9, block);
}

uint64_t __39___KSCloudKitManager_setupSubscription__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSubscriptionOperationInProgress:0];
}

uint64_t __83___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecords:*(void *)(a1 + 40) deleteRecordIDs:*(void *)(a1 + 48) withPriority:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56) retryCount:0];
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x263EFD498]];

    if (v9)
    {
      if ([v7 code] == 14)
      {
        id v10 = [v7 userInfo];
        uint64_t v11 = *MEMORY[0x263EFD4E8];
        v24[0] = *MEMORY[0x263EFD4F8];
        v24[1] = v11;
        v24[2] = *MEMORY[0x263EFD4F0];
        uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
        char v13 = [v10 dictionaryWithValuesForKeys:v12];

        [*(id *)(a1 + 32) addObject:v13];
      }
      else if ([v7 code] == 3 {
             || [v7 code] == 4
      }
             || [v7 code] == 6
             || [v7 code] == 23
             || [v7 code] == 6)
      {
        [*(id *)(a1 + 40) addObject:v5];
      }
      else
      {
        uint64_t v14 = KSCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = [v5 recordID];
          uint64_t v16 = [v15 recordName];
          id v17 = [v7 localizedDescription];
          int v18 = 136315650;
          id v19 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]_block_invoke";
          __int16 v20 = 2112;
          uint64_t v21 = v16;
          __int16 v22 = 2112;
          uint64_t v23 = v17;
          _os_log_impl(&dword_22B2BC000, v14, OS_LOG_TYPE_INFO, "%s  >>> Could not save recordName=%@; error=%@",
            (uint8_t *)&v18,
            0x20u);
        }
      }
    }
  }
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_127(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = KSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
    id v10 = [v7 localizedDescription];
    *(_DWORD *)buf = 136315650;
    v83 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]_block_invoke";
    __int16 v84 = 2112;
    v85 = v9;
    __int16 v86 = 2112;
    v87 = v10;
    _os_log_impl(&dword_22B2BC000, v8, OS_LOG_TYPE_INFO, "%s  >>> modify operation completed with rrorCode: %@ description: %@", buf, 0x20u);
  }
  if ([v7 code] == 2)
  {
    uint64_t v11 = KSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v7 userInfo];
      char v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];
      *(_DWORD *)buf = 136315394;
      v83 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]_block_invoke";
      __int16 v84 = 2112;
      v85 = v13;
      _os_log_impl(&dword_22B2BC000, v11, OS_LOG_TYPE_INFO, "%s  >>> partial failure : %@", buf, 0x16u);
    }
  }
  if ([v7 code] == 28)
  {
    uint64_t v14 = *(void **)(a1 + 32);
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_128;
    v81[3] = &unk_264890D40;
    v81[4] = v14;
    [v14 resetZoneWithDelete:0 withCompletionHandler:v81];
  }
  id v15 = [v7 domain];
  uint64_t v16 = *MEMORY[0x263EFD498];
  if ([v15 isEqualToString:*MEMORY[0x263EFD498]])
  {
    if ([v7 code] == 3 || objc_msgSend(v7, "code") == 6 || objc_msgSend(v7, "code") == 23)
    {

LABEL_14:
      id v17 = KSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_127_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
      }

      v25 = [v7 userInfo];
      uint64_t v26 = *MEMORY[0x263EFD4A0];
      id v27 = [v25 objectForKeyedSubscript:*MEMORY[0x263EFD4A0]];

      if (v27)
      {
        v28 = [v7 userInfo];
        id v29 = [v28 objectForKeyedSubscript:v26];
        [v29 doubleValue];
        double v31 = v30;

        int64_t v32 = (uint64_t)(v31 * 1000000000.0);
      }
      else
      {
        int64_t v32 = 60000000000;
      }
      dispatch_time_t v53 = dispatch_time(0, v32);
      uint64_t v54 = *(void *)(a1 + 32);
      v55 = *(NSObject **)(v54 + 8);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_129;
      block[3] = &unk_264890D68;
      void block[4] = v54;
      id v76 = *(id *)(a1 + 40);
      id v56 = v6;
      v58 = *(void **)(a1 + 64);
      uint64_t v57 = *(void *)(a1 + 72);
      id v77 = v56;
      uint64_t v79 = v57;
      id v59 = v58;
      uint64_t v60 = *(void *)(a1 + 80);
      id v78 = v59;
      uint64_t v80 = v60;
      dispatch_after(v53, v55, block);

      v49 = v76;
      goto LABEL_31;
    }
    uint64_t v62 = [v7 code];

    if (v62 == 7) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v33 = [v7 domain];
  if ([v33 isEqualToString:v16])
  {
    uint64_t v34 = [v7 code];

    if (v34 == 26)
    {
      v35 = KSCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_127_cold_2(v35, v36, v37, v38, v39, v40, v41, v42);
      }

      v43 = *(void **)(a1 + 32);
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_130;
      v67[3] = &unk_264890D90;
      v67[4] = v43;
      id v68 = *(id *)(a1 + 40);
      id v44 = v6;
      v46 = *(void **)(a1 + 64);
      uint64_t v45 = *(void *)(a1 + 72);
      id v69 = v44;
      uint64_t v73 = v45;
      id v47 = v46;
      uint64_t v48 = *(void *)(a1 + 80);
      id v72 = v47;
      uint64_t v74 = v48;
      id v70 = *(id *)(a1 + 48);
      id v71 = v7;
      [v43 setupRecordZoneWithCompletionHandler:v67 ignoreDefaults:1];

      v49 = v68;
      goto LABEL_31;
    }
  }
  else
  {
  }
  uint64_t v50 = [*(id *)(a1 + 56) count];
  v51 = *(void **)(a1 + 32);
  if (!v50)
  {
    v61 = v51[1];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_3;
    v63[3] = &unk_2648908B8;
    id v66 = *(id *)(a1 + 64);
    id v64 = *(id *)(a1 + 48);
    id v65 = v7;
    dispatch_async(v61, v63);

    v49 = v66;
LABEL_31:

    goto LABEL_34;
  }
  v52 = [v51 resolveConflicts:*(void *)(a1 + 56)];
  if ([v52 count]) {
    [*(id *)(a1 + 32) updateRecords:v52 deleteRecordIDs:0 withPriority:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }

LABEL_34:
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_128(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) recordZone];
  id v3 = [v2 zoneID];
  char v4 = [v3 zoneName];
  [v5 userDidDeleteRecordZone:v4];
}

uint64_t __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_129(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecords:*(void *)(a1 + 40) deleteRecordIDs:*(void *)(a1 + 48) withPriority:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56) retryCount:*(void *)(a1 + 72) + 1];
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_130(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (v3
    && ([v3 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:*MEMORY[0x263EFD498]],
        v5,
        (v6 & 1) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 8);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_2;
    v14[3] = &unk_264890D68;
    void v14[4] = v7;
    id v15 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    uint64_t v11 = *(void **)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 80);
    id v16 = v9;
    uint64_t v18 = v10;
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 88);
    id v17 = v12;
    uint64_t v19 = v13;
    dispatch_async(v8, v14);
  }
}

uint64_t __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecords:*(void *)(a1 + 40) deleteRecordIDs:*(void *)(a1 + 48) withPriority:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56) retryCount:*(void *)(a1 + 72) + 1];
}

uint64_t __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

uint64_t __88___KSCloudKitManager_fetchRecordsWithPriority_changeToken_completionHandler_retryCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitFetchRecordsOperation:*(void *)(a1 + 40) withPriority:*(void *)(a1 + 64) changeToken:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56) retryCount:*(void *)(a1 + 72)];
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 recordName];
  [v2 addObject:v3];
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [a2 zoneName];
  uint64_t v7 = [*(id *)(a1 + 32) recordZone];
  uint64_t v8 = [v7 zoneID];
  id v9 = [v8 zoneName];
  int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v14 = KSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        int64_t v32 = "-[_KSCloudKitManager _submitFetchRecordsOperation:withPriority:changeToken:completionHandler:retryCount:]_block_invoke_3";
        __int16 v33 = 2112;
        uint64_t v34 = v15;
        _os_log_impl(&dword_22B2BC000, v14, OS_LOG_TYPE_INFO, "%s  server change token updated: %@", buf, 0x16u);
      }

      id v16 = (void *)[*(id *)(a1 + 40) copy];
      id v17 = (void *)[*(id *)(a1 + 48) copy];
      uint64_t v18 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      v25 = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_137;
      uint64_t v26 = &unk_264890E30;
      id v19 = *(id *)(a1 + 56);
      id v27 = v16;
      id v28 = v17;
      uint64_t v20 = *(void *)(a1 + 64);
      id v29 = v19;
      uint64_t v30 = v20;
      id v21 = v17;
      id v22 = v16;
      dispatch_async(v18, &v23);
      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects", v23, v24, v25, v26);
      [*(id *)(a1 + 48) removeAllObjects];
    }
  }
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_137(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], *(void *)(*(void *)(a1[7] + 8) + 40), 0, 1, 1);
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5, void *a6)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a2 zoneName];
  uint64_t v13 = [*(id *)(a1 + 32) recordZone];
  uint64_t v14 = [v13 zoneID];
  uint64_t v15 = [v14 zoneName];
  int v16 = [v12 isEqualToString:v15];

  if (v16)
  {
    uint64_t v17 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    if (v11)
    {
      uint64_t v20 = [v11 domain];
      if (v20 == (void *)*MEMORY[0x263EFD498])
      {
        unint64_t v21 = *(void *)(a1 + 72);

        if (v21 <= 1)
        {
          if ([v11 code] == 28)
          {
            id v22 = *(void **)(a1 + 32);
            v102[0] = MEMORY[0x263EF8330];
            v102[1] = 3221225472;
            v102[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_140;
            v102[3] = &unk_264890D40;
            v102[4] = v22;
            [v22 resetZoneWithDelete:0 withCompletionHandler:v102];
          }
          uint64_t v23 = KSCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139_cold_3(v11);
          }

          if ([v11 code] == 9)
          {
            uint64_t v24 = [v11 userInfo];
            v25 = [v24 objectForKeyedSubscript:*MEMORY[0x263EFD4A0]];
            [v25 doubleValue];
            double v27 = fmin(v26, 60.0);

            dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
            uint64_t v29 = *(void *)(a1 + 32);
            uint64_t v30 = *(NSObject **)(v29 + 8);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_141;
            block[3] = &unk_264890EA8;
            uint64_t v31 = *(void *)(a1 + 80);
            void block[4] = v29;
            uint64_t v100 = v31;
            long long v66 = *(_OWORD *)(a1 + 56);
            id v32 = (id)v66;
            long long v99 = v66;
            uint64_t v101 = *(void *)(a1 + 72);
            dispatch_after(v28, v30, block);
            __int16 v33 = (void *)v99;
          }
          else if ([v11 code] == 3 {
                 || [v11 code] == 6
          }
                 || [v11 code] == 23
                 || [v11 code] == 7)
          {
            uint64_t v37 = [v11 userInfo];
            uint64_t v38 = [v37 objectForKeyedSubscript:*MEMORY[0x263EFD4A0]];
            [v38 doubleValue];
            double v40 = v39;

            dispatch_time_t v41 = dispatch_time(0, (uint64_t)(v40 * 1000000000.0));
            uint64_t v42 = *(void *)(a1 + 32);
            v43 = *(NSObject **)(v42 + 8);
            v94[0] = MEMORY[0x263EF8330];
            v94[1] = 3221225472;
            v94[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_143;
            v94[3] = &unk_264890EA8;
            uint64_t v44 = *(void *)(a1 + 80);
            v94[4] = v42;
            uint64_t v96 = v44;
            long long v67 = *(_OWORD *)(a1 + 56);
            id v45 = (id)v67;
            long long v95 = v67;
            uint64_t v97 = *(void *)(a1 + 72);
            dispatch_after(v41, v43, v94);
            __int16 v33 = (void *)v95;
          }
          else if ([v11 code] == 21)
          {
            v46 = KSCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v104 = "-[_KSCloudKitManager _submitFetchRecordsOperation:withPriority:changeToken:completionHandler:retryC"
                     "ount:]_block_invoke_4";
              _os_log_impl(&dword_22B2BC000, v46, OS_LOG_TYPE_INFO, "%s  CloudKit said our change token has expired!", buf, 0xCu);
            }

            id v47 = *(NSObject **)(*(void *)(a1 + 32) + 8);
            v87[0] = MEMORY[0x263EF8330];
            v87[1] = 3221225472;
            v87[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_145;
            v87[3] = &unk_264890ED0;
            id v91 = *(id *)(a1 + 56);
            id v88 = *(id *)(a1 + 40);
            id v48 = *(id *)(a1 + 48);
            char v93 = a5;
            uint64_t v49 = *(void *)(a1 + 32);
            id v89 = v48;
            uint64_t v90 = v49;
            int8x16_t v92 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
            dispatch_async(v47, v87);

            __int16 v33 = v91;
          }
          else
          {
            uint64_t v50 = [v11 code];
            v51 = KSCategory();
            BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
            if (v50 == 26)
            {
              if (v52) {
                __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139_cold_1(v51, v53, v54, v55, v56, v57, v58, v59);
              }

              uint64_t v60 = *(void **)(a1 + 32);
              v81[0] = MEMORY[0x263EF8330];
              v81[1] = 3221225472;
              v81[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_146;
              v81[3] = &unk_264890EF8;
              id v84 = *(id *)(a1 + 56);
              id v82 = *(id *)(a1 + 40);
              id v61 = *(id *)(a1 + 48);
              uint64_t v62 = *(void *)(a1 + 64);
              id v83 = v61;
              uint64_t v85 = v62;
              char v86 = a5;
              [v60 setupRecordZoneWithCompletionHandler:v81 ignoreDefaults:1];

              __int16 v33 = v84;
            }
            else
            {
              if (v52) {
                __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139_cold_2(v11);
              }

              v63 = *(NSObject **)(*(void *)(a1 + 32) + 8);
              v75[0] = MEMORY[0x263EF8330];
              v75[1] = 3221225472;
              v75[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_147;
              v75[3] = &unk_264890F20;
              id v78 = *(id *)(a1 + 56);
              id v76 = *(id *)(a1 + 40);
              id v64 = *(id *)(a1 + 48);
              uint64_t v65 = *(void *)(a1 + 64);
              id v77 = v64;
              uint64_t v79 = v65;
              char v80 = a5;
              dispatch_async(v63, v75);

              __int16 v33 = v78;
            }
          }
          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    uint64_t v34 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_148;
    v68[3] = &unk_264890F48;
    id v69 = *(id *)(a1 + 40);
    id v70 = *(id *)(a1 + 48);
    id v35 = *(id *)(a1 + 56);
    uint64_t v36 = *(void *)(a1 + 64);
    id v71 = v35;
    uint64_t v72 = v36;
    char v73 = a5;
    BOOL v74 = v11 == 0;
    dispatch_async(v34, v68);

    __int16 v33 = v69;
LABEL_13:
  }
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_140(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) recordZone];
  id v3 = [v2 zoneID];
  char v4 = [v3 zoneName];
  [v5 userDidDeleteRecordZone:v4];
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_141(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_142;
  v6[3] = &unk_264890E80;
  uint64_t v3 = *(void *)(a1 + 56);
  v6[4] = v2;
  uint64_t v8 = v3;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  uint64_t v9 = *(void *)(a1 + 64);
  [v2 queryAccountStatusWithCompletionHandler:v6];
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_142(uint64_t result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) fetchRecordsWithPriority:*(void *)(result + 56) changeToken:*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40) completionHandler:*(void *)(result + 40) retryCount:*(void *)(result + 64) + 1];
  }
  return result;
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_143(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecordsWithPriority:*(void *)(a1 + 56) changeToken:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) completionHandler:*(void *)(a1 + 40) retryCount:*(void *)(a1 + 64) + 1];
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_145(void *a1)
{
  (*(void (**)(void))(a1[7] + 16))();
  uint64_t v2 = (void *)a1[6];
  uint64_t v3 = a1[7];
  uint64_t v4 = a1[8];
  uint64_t v5 = a1[9] + 1;
  return [v2 fetchRecordsWithPriority:v4 changeToken:0 completionHandler:v3 retryCount:v5];
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_146(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 64), 0, 0);
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 64), 0, 0);
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_148(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
    int v6 = 136315650;
    long long v7 = "-[_KSCloudKitManager _submitFetchRecordsOperation:withPriority:changeToken:completionHandler:retryCount:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  Completed fetching # records : %@, deleted records: %@", (uint8_t *)&v6, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:*(void *)(*((void *)&v14 + 1) + 8 * v7)];

        uint64_t v4 = (void *)v8;
        [v2 addObject:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFD6D8]) initWithRecordIDs:v2];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_151;
  v12[3] = &unk_264890F98;
  uint64_t v11 = *(void *)(a1 + 40);
  __int16 v10 = (id *)(a1 + 40);
  v12[4] = v11;
  id v13 = v10[1];
  [v9 setFetchRecordsCompletionBlock:v12];
  [*v10 addOperation:v9];
}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_2;
  block[3] = &unk_2648908B8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) allValues];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

void __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke(id *a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263EFD6D0]);
  v12[0] = a1[4];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v6 = (void *)[v4 initWithRecordZoneIDs:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke_2;
  v8[3] = &unk_264890FE8;
  id v10 = a1[6];
  id v9 = a1[4];
  id v11 = v3;
  id v7 = v3;
  [v6 setFetchRecordZonesCompletionBlock:v8];
  [a1[5] _inconvenientOperation:v6];
}

void __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[5];
  if (v5)
  {
    uint64_t v7 = a1[4];
    id v8 = a3;
    id v9 = [a2 objectForKeyedSubscript:v7];
    id v10 = [MEMORY[0x263EFD7A0] itemErrorFromError:v8 forID:a1[4]];

    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v9, v10);
  }
  uint64_t v11 = a1[6];
  [NSNumber numberWithInt:a3 == 0];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
}

void __58___KSCloudKitManager__ckSaveRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v7 = a4;
    id v11 = [a2 firstObject];
    id v8 = (void *)MEMORY[0x263EFD7A0];
    id v9 = [*(id *)(a1 + 32) zoneID];
    id v10 = [v8 itemErrorFromError:v7 forID:v9];

    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v11, v10);
  }
}

void __66___KSCloudKitManager__ckDeleteRecordZoneWithID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v7 = a4;
    id v9 = [a3 firstObject];
    id v8 = [MEMORY[0x263EFD7A0] itemErrorFromError:v7 forID:*(void *)(a1 + 32)];

    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v9, v8);
  }
}

void __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_22B2BC000, v0, OS_LOG_TYPE_ERROR, "%s  Error in getting account status: %@", (uint8_t *)v1, 0x16u);
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_103_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) recordZone];
  id v6 = [v5 zoneID];
  id v7 = [v6 zoneName];
  id v8 = [a2 localizedDescription];
  int v9 = 136315650;
  id v10 = "-[_KSCloudKitManager setupRecordZoneWithCompletionHandler:ignoreDefaults:]_block_invoke_2";
  __int16 v11 = 2112;
  id v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_error_impl(&dword_22B2BC000, a3, OS_LOG_TYPE_ERROR, "%s  !!!ERROR: Could not save Record Zone %@: %@", (uint8_t *)&v9, 0x20u);
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_127_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_127_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139_cold_2(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22B2BC000, v2, v3, "%s  Could not fetch record changes: %@", v4, v5, v6, v7, 2u);
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_139_cold_3(void *a1)
{
  v1 = [a1 userInfo];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22B2BC000, v2, v3, "%s  >>> ERROR for fetch records operation: %@", v4, v5, v6, v7, 2u);
}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[_KSCloudKitManager fetchPublicRecordsWithNames:completionHandler:]_block_invoke";
  _os_log_error_impl(&dword_22B2BC000, log, OS_LOG_TYPE_ERROR, "%s  Couldn't create recordID", buf, 0xCu);
}

@end