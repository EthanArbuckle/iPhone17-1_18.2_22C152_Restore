@interface DKSyncRapportCommonStorage
@end

@implementation DKSyncRapportCommonStorage

uint64_t __45___DKSyncRapportCommonStorage_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
    uint64_t v1 = [v0 stringForKey:@"ForcedRapportConnectionType"];
    v2 = v1;
    if (!v1)
    {
LABEL_17:

      return;
    }
    if ([v1 isEqualToString:@"Cloud"])
    {
      uint64_t v3 = 0x10000000;
    }
    else if ([v2 isEqualToString:@"BLE"])
    {
      uint64_t v3 = 0x8000;
    }
    else if ([v2 isEqualToString:@"AWDL"])
    {
      uint64_t v3 = 0x20000;
    }
    else if ([v2 isEqualToString:@"USB"])
    {
      uint64_t v3 = 0x40000;
    }
    else
    {
      if (([v2 isEqualToString:@"L2CAP"] & 1) == 0)
      {
        v6 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke_cold_1();
        }

        if (!_additionalFlagsForInternal_flag) {
          goto LABEL_17;
        }
        goto LABEL_14;
      }
      uint64_t v3 = 256;
    }
    _additionalFlagsForInternal_flag = v3;
LABEL_14:
    v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = [(id)objc_opt_class() description];
      int v7 = 138543618;
      v8 = v5;
      __int16 v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "%{public}@: Forcing rapport connections through %@", (uint8_t *)&v7, 0x16u);
    }
    goto LABEL_17;
  }
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke(uint64_t a1)
{
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_2(uint64_t a1, void *a2)
{
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_3(uint64_t a1, void *a2, int a3)
{
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_4(uint64_t a1, void *a2)
{
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_5(uint64_t a1, void *a2)
{
}

void __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void __49___DKSyncRapportCommonStorage_handleInvalidation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_DKSyncRapportCommonStorage startRapport]();
}

void __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_2;
  v4[3] = &unk_1E5610D40;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  [v2 fetchSourceDeviceIDFromPeer:v3 highPriority:1 completion:v4];
}

void __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1C9C8] date];
  +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [*(id *)(a1 + 32) transportType], *(void *)(a1 + 40), v10, v7 == 0);
  if (v7)
  {
    uint64_t v11 = [v7 UUIDString];
    if (v8)
    {
      v12 = [*(id *)(a1 + 48) version];
      char v13 = [v8 isEqualToString:v12];

      if ((v13 & 1) == 0)
      {
        v14 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v38 = [(id)objc_opt_class() description];
          v36 = [*(id *)(a1 + 48) version];
          int v15 = [*(id *)(a1 + 48) me];
          v16 = &stru_1EDDE58B8;
          v17 = @"pseudo ";
          if (!v15) {
            v17 = &stru_1EDDE58B8;
          }
          v33 = v17;
          v35 = [*(id *)(a1 + 48) identifier];
          v18 = [*(id *)(a1 + 48) model];
          if (v18)
          {
            v19 = NSString;
            v32 = [*(id *)(a1 + 48) model];
            v16 = [v19 stringWithFormat:@" (%@)", v32];
          }
          *(_DWORD *)buf = 138544642;
          v41 = v38;
          __int16 v42 = 2114;
          v43 = v36;
          __int16 v44 = 2114;
          id v45 = v8;
          __int16 v46 = 2114;
          v47 = v33;
          __int16 v48 = 2114;
          v49 = v35;
          __int16 v50 = 2114;
          uint64_t v51 = (uint64_t)v16;
          _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "%{public}@: Will change version from %{public}@ to %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
          if (v18)
          {
          }
        }
      }
    }
    [*(id *)(a1 + 56) setSourceDeviceID:v11 version:v8 peer:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 56), "addActiveTransports:toPeer:", objc_msgSend(*(id *)(a1 + 32), "transportType"), *(void *)(a1 + 48));
    v23 = *(void **)(a1 + 56);
    v24 = [MEMORY[0x1E4F1C9C8] date];
    [v23 setLastSeenDate:v24 onPeer:*(void *)(a1 + 48)];

    [*(id *)(*(void *)(a1 + 32) + 80) addObject:v11];
  }
  else
  {
    v20 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v39 = [(id)objc_opt_class() description];
      int v25 = [*(id *)(a1 + 48) me];
      v26 = &stru_1EDDE58B8;
      v27 = @"pseudo ";
      if (!v25) {
        v27 = &stru_1EDDE58B8;
      }
      v37 = v27;
      v28 = [*(id *)(a1 + 48) identifier];
      v29 = [*(id *)(a1 + 48) model];
      if (v29)
      {
        v30 = NSString;
        v34 = [*(id *)(a1 + 48) model];
        v26 = [v30 stringWithFormat:@" (%@)", v34];
      }
      v31 = [v9 domain];
      *(_DWORD *)buf = 138544898;
      v41 = v39;
      __int16 v42 = 2114;
      v43 = v37;
      __int16 v44 = 2114;
      id v45 = v28;
      __int16 v46 = 2114;
      v47 = v26;
      __int16 v48 = 2114;
      v49 = v31;
      __int16 v50 = 2048;
      uint64_t v51 = [v9 code];
      __int16 v52 = 2112;
      id v53 = v9;
      _os_log_error_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch source device id from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

      if (v29)
      {
      }
    }

    if ([v9 code] == -6714)
    {
      v21 = [v9 domain];
      int v22 = [v21 isEqualToString:*MEMORY[0x1E4F94770]];

      if (v22) {
        objc_msgSend(*(id *)(a1 + 56), "removeActiveTransports:fromPeer:", objc_msgSend(*(id *)(a1 + 32), "transportType"), *(void *)(a1 + 48));
      }
    }
  }
}

void __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_156(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [(id)objc_opt_class() description];
    v4 = &stru_1EDDE58B8;
    if ([a1[5] me]) {
      id v5 = @"pseudo ";
    }
    else {
      id v5 = &stru_1EDDE58B8;
    }
    id v6 = [a1[5] identifier];
    id v7 = [a1[5] model];
    if (v7)
    {
      id v8 = NSString;
      a1 = [a1[5] model];
      v4 = [v8 stringWithFormat:@" (%@)", a1];
    }
    *(_DWORD *)buf = 138544130;
    v10 = v3;
    __int16 v11 = 2114;
    v12 = v5;
    __int16 v13 = 2114;
    v14 = v6;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "%{public}@: Throttled fetchSourceDeviceIDFromPeer for %{public}@peer %{public}@%{public}@", buf, 0x2Au);
    if (v7)
    {
    }
  }
}

void __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_2();
    }

    id v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_1(a1, v5);
    }
  }
}

void __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
}

uint64_t __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __95___DKSyncRapportCommonStorage_sendRequestID_request_peer_highPriority_options_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  -[_DKSyncRapportCommonStorage handleActivateCompanionLinkClient:forPeer:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), v6);
  if (v6)
  {
    [*(id *)(a1 + 40) invalidate];
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3) {
      (*(void (**)(uint64_t, void, void, id))(v3 + 16))(v3, 0, 0, v6);
    }
  }
  else
  {
    id v4 = *(id *)(a1 + 56);
    if (*(unsigned char *)(a1 + 88))
    {
      if ([*(id *)(a1 + 56) count])
      {
        id v5 = (id)[*(id *)(a1 + 56) mutableCopy];
        [v5 addEntriesFromDictionary:*(void *)(*(void *)(a1 + 32) + 16)];
      }
      else
      {
        id v5 = *(id *)(*(void *)(a1 + 32) + 16);
      }

      id v4 = v5;
    }
    -[_DKSyncRapportCommonStorage sendRequestID:request:peer:client:options:responseHandler:](*(void *)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 72), *(void **)(a1 + 48), *(void **)(a1 + 40), v4, *(void **)(a1 + 80));
  }
}

void __89___DKSyncRapportCommonStorage_sendRequestID_request_peer_client_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v9);

  if (v8 && [v8 code] == -71156)
  {
    v10 = [v8 domain];
    unsigned int v11 = [v10 isEqualToString:*MEMORY[0x1E4F94770]];
  }
  else
  {
    unsigned int v11 = 0;
  }
  -[_DKEventTypeResultStatsCounter incrementCountWithTypeValue:success:](*(void *)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40), v11);
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v13, v7, v8);
  }
  --*(void *)(*(void *)(a1 + 32) + 56);
  [*(id *)(a1 + 48) invalidate];
  usleep(0x186A0u);
}

void __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring unexpected value for ForcedRapportConnectionType: %@", v3, 0x16u);
}

void __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "%{public}@: Rapport will not function correctly", v5);
}

void __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10() domain];
  [v1 code];
  OUTLINED_FUNCTION_25_0();
  __int16 v6 = 2048;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v1;
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Failed to register sync with Rapport: %{public}@:%lld (%@)", v5, 0x2Au);
}

@end