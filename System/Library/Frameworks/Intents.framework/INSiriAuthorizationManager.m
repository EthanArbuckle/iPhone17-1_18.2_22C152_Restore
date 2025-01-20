@interface INSiriAuthorizationManager
@end

@implementation INSiriAuthorizationManager

void __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_12(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__54910;
  v24 = __Block_byref_object_dispose__54911;
  id v25 = [(id)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary objectForKeyedSubscript:a1[4]];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_13;
  v16[3] = &unk_1E5519A28;
  uint64_t v19 = a1[6];
  long long v15 = *((_OWORD *)a1 + 2);
  id v2 = (id)v15;
  long long v17 = v15;
  v18 = &v20;
  v3 = (void (**)(void))MEMORY[0x192F984C0](v16);
  v4 = (void *)v21[5];
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"_INSiriAuthorizationManagerLastAuthorizationCheckDateKey"];
    v6 = [(id)v21[5] objectForKeyedSubscript:@"_INSiriAuthorizationManagerAuthorizationStatusKey"];
    uint64_t v7 = [v6 integerValue];

    [v5 timeIntervalSinceNow];
    double v9 = v8;
    v10 = (id)INSiriLogContextIntents;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[4];
      v12 = [NSNumber numberWithDouble:v9];
      *(_DWORD *)buf = 136315650;
      v27 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_INFO, "%s Found cached authorization status for appID: %@, last authorization check time interval since now: %@", buf, 0x20u);
    }
    if (v7 == 3 && v9 >= -180.0)
    {
      v13 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = a1[4];
        *(_DWORD *)buf = 136315394;
        v27 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_INFO, "%s Returning cached authorization status for appID: %@", buf, 0x16u);
      }
      *(void *)(*(void *)(a1[5] + 8) + 24) = 3;
    }
    else
    {
      v3[2](v3);
    }
  }
  else
  {
    v3[2](v3);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_13(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
    _os_log_impl(&dword_18CB2F000, v2, OS_LOG_TYPE_INFO, "%s Getting raw authorization status", buf, 0xCu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 56) _rawSiriAuthorizationStatusForAppID:*(void *)(a1 + 32)];
  v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", @"_INSiriAuthorizationManagerLastAuthorizationCheckDateKey");
  v9[1] = @"_INSiriAuthorizationManagerAuthorizationStatusKey";
  v10[0] = v3;
  v4 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return [(id)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

void __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary;
  _siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary = v0;

  dispatch_queue_t v2 = dispatch_queue_create("_INSiriAuthorizationManagerTCCQueue", 0);
  v3 = (void *)_siriAuthorizationStatusForAppID_intentSlot__queue;
  _siriAuthorizationStatusForAppID_intentSlot__queue = (uint64_t)v2;

  uint64_t v4 = notify_register_dispatch("com.apple.tcc.access.changed", (int *)&_siriAuthorizationStatusForAppID_intentSlot__registrationToken, (dispatch_queue_t)_siriAuthorizationStatusForAppID_intentSlot__queue, &__block_literal_global_10_54925);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSNumber;
      double v8 = v6;
      double v9 = [v7 numberWithUnsignedInt:v5];
      int v10 = 136315394;
      uint64_t v11 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s Error registering for TCC notification: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

uint64_t __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_2()
{
  return [(id)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary removeAllObjects];
}

void __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4FA99C8];
  v10[0] = MEMORY[0x1E4F1CC38];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v2;
  char v3 = TCCAccessCheckAuditToken();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke_2;
  v4[3] = &unk_1E55199B8;
  id v5 = *(id *)(a1 + 32);
  char v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 3;
  }
  else {
    uint64_t v1 = 2;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v1);
}

@end