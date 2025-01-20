@interface _DKSyncRapportContextStorage
+ (id)sharedInstance;
- (_DKSyncRemoteContextStorageDelegate)delegate;
- (void)fetchContextValuesFromPeer:(id)a3 forKeyPaths:(id)a4 highPriority:(BOOL)a5 completion:(id)a6;
- (void)handleFetchContextValuesWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleFetchContextValuesWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:;
- (void)handleSendContextValuesWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleSendContextValuesWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:;
- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleSubscribeToContextValueChangeNotificationsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:;
- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleUnsubscribeToContextValueChangeNotificationsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:;
- (void)registerRequestIDsWithClient:(id)a3;
- (void)sendContextValuesToPeer:(id)a3 registrationIdentifier:(id)a4 archivedObjects:(id)a5 highPriority:(BOOL)a6 completion:(id)a7;
- (void)setDelegate:(id)a3;
- (void)subscribeToContextValueChangeNotificationsFromPeer:(id)a3 registrationIdentifier:(id)a4 predicate:(id)a5 highPriority:(BOOL)a6 completion:(id)a7;
- (void)unsubscribeFromContextValueChangeNotificationsFromPeer:(id)a3 registrationIdentifier:(id)a4 predicate:(id)a5 highPriority:(BOOL)a6 completion:(id)a7;
@end

@implementation _DKSyncRapportContextStorage

+ (id)sharedInstance
{
  if (sharedInstance_initialized_363 != -1) {
    dispatch_once(&sharedInstance_initialized_363, &__block_literal_global_366);
  }
  v2 = (void *)sharedInstance_sharedInstance_364;
  return v2;
}

- (void)registerRequestIDsWithClient:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke;
  v8[3] = &unk_1E5610D18;
  v8[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.coreduet.fetch-context-values" options:0 handler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_2;
  v7[3] = &unk_1E5610D18;
  v7[4] = self;
  [v4 registerRequestID:@"com.apple.coreduet.send-context-values" options:0 handler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_3;
  v6[3] = &unk_1E5610D18;
  v6[4] = self;
  [v4 registerRequestID:@"com.apple.coreduet.subscribe-to-context-value-changes" options:0 handler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61___DKSyncRapportContextStorage_registerRequestIDsWithClient___block_invoke_4;
  v5[3] = &unk_1E5610D18;
  v5[4] = self;
  [v4 registerRequestID:@"com.apple.coreduet.unsubscribe-to-context-value-changes" options:0 handler:v5];
}

- (void)handleFetchContextValuesWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  v30[15] = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v26 = a3;
  v7 = a4;
  if (a1)
  {
    v8 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v8);

    v28 = [MEMORY[0x1E4F1C9C8] date];
    v9 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:].cold.5();
    }

    v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:].cold.4();
    }

    v11 = [v27 objectForKeyedSubscript:@"keyPaths"];
    v12 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      _CDPrettyPrintCollection(v11, 0, 0, 0);
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:]();
    }

    v13 = (void *)a1[2];
    BOOL v25 = v13 == 0;
    if (v13)
    {
      v14 = [v13 remoteContextStorage:a1 archivedObjectsForKeyPaths:v11];
      v15 = 0;
    }
    else
    {
      v16 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:]();
      }

      v15 = +[_DKSyncErrors internalFailure];
      v14 = 0;
    }
    uint64_t v17 = [a1 myDeviceID];
    v18 = (void *)v17;
    v19 = &stru_1EDDE58B8;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    v20 = v19;

    v29[0] = @"server";
    v29[1] = @"results";
    v21 = (void *)MEMORY[0x1E4F1CC08];
    if (v14) {
      v21 = v14;
    }
    v30[0] = v20;
    v30[1] = v21;
    v29[2] = @"version";
    v30[2] = @"3.0";
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
    v23 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:]();
    }

    v7[2](v7, v22, 0, v15);
    if (v28)
    {
      v24 = [MEMORY[0x1E4F1C9C8] date];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v28, v24, v25);
    }
  }
}

- (void)handleSendContextValuesWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  v43[12] = *MEMORY[0x1E4F143B8];
  id v36 = a2;
  id v34 = a3;
  v35 = a4;
  if (!a1) {
    goto LABEL_34;
  }
  v7 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v7);

  v37 = [MEMORY[0x1E4F1C9C8] date];
  v8 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.7();
  }

  v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.6();
  }

  if (!a1[2])
  {
    v19 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:]();
    }

    v18 = +[_DKSyncErrors internalFailure];
    BOOL v20 = 1;
    goto LABEL_27;
  }
  v10 = [v36 objectForKeyedSubscript:@"client"];
  v33 = [v36 objectForKeyedSubscript:@"id"];
  v11 = [v36 objectForKeyedSubscript:@"objects"];
  v12 = +[_DKSyncPeerStatusTracker sharedInstance];
  v13 = [v12 existingPeerWithSourceDeviceID:v10];
  v14 = [v34 objectForKeyedSubscript:@"senderIDS"];
  if (v13)
  {
    v15 = [v13 idsDeviceIdentifier];
    char v16 = [v15 isEqualToString:v14];

    if (v16)
    {
      uint64_t v17 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v30 = [(id)objc_opt_class() description];
        v32 = [v11 allKeys];
        v31 = _CDPrettyPrintCollection(v32, 0, 0, 0);
        *(_DWORD *)buf = 138543618;
        v39 = v30;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Received sent context values with key paths '%@'", buf, 0x16u);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = 0;
        [a1[2] remoteContextStorage:a1 registrationIdentifier:v33 setArchivedObjects:v11 peer:v13];
      }
      else
      {
        v22 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          [(id)objc_opt_class() description];
          objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.4();
        }

        v18 = +[_DKSyncErrors invalidRequest];
      }
      BOOL v20 = objc_msgSend(v11, "count", v32) == 0;

      goto LABEL_26;
    }
    v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.5();
    }
  }
  else
  {
    v13 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:]();
    }
  }

  +[_DKSyncErrors invalidRequest];
  v18 = BOOL v20 = 1;
LABEL_26:

LABEL_27:
  uint64_t v23 = [a1 myDeviceID];
  v24 = (void *)v23;
  BOOL v25 = &stru_1EDDE58B8;
  if (v23) {
    BOOL v25 = (__CFString *)v23;
  }
  id v26 = v25;

  v42[0] = @"server";
  v42[1] = @"version";
  v43[0] = v26;
  v43[1] = @"3.0";
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  v28 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:]();
  }

  v35[2](v35, v27, 0, v18);
  if (v37)
  {
    v29 = [MEMORY[0x1E4F1C9C8] date];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v37, v29, v20);
  }
LABEL_34:
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v43 = a3;
  v44 = a4;
  if (!a1) {
    goto LABEL_31;
  }
  v8 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v8);

  v45 = [MEMORY[0x1E4F1C9C8] date];
  v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.7();
  }

  v10 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.6();
  }

  if (!a1[2])
  {
    v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]();
    }

    BOOL v20 = +[_DKSyncErrors internalFailure];
    int v19 = 1;
    goto LABEL_24;
  }
  v11 = [v7 objectForKeyedSubscript:@"client"];
  v12 = [v7 objectForKeyedSubscript:@"id"];
  v42 = [v7 objectForKeyedSubscript:@"predicate"];
  v13 = +[_DKSyncPeerStatusTracker sharedInstance];
  v14 = [v13 existingPeerWithSourceDeviceID:v11];
  v15 = [v43 objectForKeyedSubscript:@"senderIDS"];
  if (!v14)
  {
    v14 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]();
    }
    goto LABEL_21;
  }
  char v16 = [v14 idsDeviceIdentifier];
  char v17 = [v16 isEqualToString:v15];

  if ((v17 & 1) == 0)
  {
    v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.5();
    }

LABEL_21:
    BOOL v20 = +[_DKSyncErrors invalidRequest];
    v14 = 0;
    goto LABEL_22;
  }
  if ([v12 length] && v42)
  {
    v18 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      __int16 v40 = [(id)objc_opt_class() description];
      int v31 = [v14 me];
      v32 = @"pseudo ";
      if (!v31) {
        v32 = &stru_1EDDE58B8;
      }
      v38 = v32;
      v39 = [v14 identifier];
      v41 = [v14 model];
      if (v41)
      {
        id v36 = NSString;
        uint64_t v34 = [v14 model];
        v33 = [v36 stringWithFormat:@" (%@)", v34];
        v35 = (void *)v34;
      }
      else
      {
        v33 = &stru_1EDDE58B8;
      }
      v37 = v33;
      *(_DWORD *)buf = 138544386;
      v49 = v40;
      __int16 v50 = 2112;
      v51 = v12;
      __int16 v52 = 2114;
      v53 = v38;
      __int16 v54 = 2114;
      v55 = v39;
      __int16 v56 = 2114;
      v57 = v33;
      _os_log_debug_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: Received subscribe to context value changes request for '%@' from %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v41)
      {
      }
    }

    [a1[2] remoteContextStorage:a1 subscribeToChangesWithPeer:v14 registrationIdentifier:v12 predicate:v42];
    int v19 = 0;
    BOOL v20 = 0;
    goto LABEL_23;
  }
  v30 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.4();
  }

  BOOL v20 = +[_DKSyncErrors invalidRequest];
LABEL_22:
  int v19 = 1;
LABEL_23:

LABEL_24:
  uint64_t v23 = [a1 myDeviceID];
  v24 = (void *)v23;
  BOOL v25 = &stru_1EDDE58B8;
  if (v23) {
    BOOL v25 = (__CFString *)v23;
  }
  id v26 = v25;

  v46[0] = @"server";
  v46[1] = @"version";
  v47[0] = v26;
  v47[1] = @"3.0";
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v28 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]();
  }

  v44[2](v44, v27, 0, v20);
  if (v45)
  {
    v29 = [MEMORY[0x1E4F1C9C8] date];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v45, v29, v19 != 0);
  }
LABEL_31:
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v43 = a3;
  v44 = a4;
  if (!a1) {
    goto LABEL_31;
  }
  v8 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v8);

  v45 = [MEMORY[0x1E4F1C9C8] date];
  v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.7();
  }

  v10 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.6();
  }

  if (!a1[2])
  {
    v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]();
    }

    BOOL v20 = +[_DKSyncErrors internalFailure];
    int v19 = 1;
    goto LABEL_24;
  }
  v11 = [v7 objectForKeyedSubscript:@"client"];
  v12 = [v7 objectForKeyedSubscript:@"id"];
  v42 = [v7 objectForKeyedSubscript:@"predicate"];
  v13 = +[_DKSyncPeerStatusTracker sharedInstance];
  v14 = [v13 existingPeerWithSourceDeviceID:v11];
  v15 = [v43 objectForKeyedSubscript:@"senderIDS"];
  if (!v14)
  {
    v14 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]();
    }
    goto LABEL_21;
  }
  char v16 = [v14 idsDeviceIdentifier];
  char v17 = [v16 isEqualToString:v15];

  if ((v17 & 1) == 0)
  {
    v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:].cold.5();
    }

LABEL_21:
    BOOL v20 = +[_DKSyncErrors invalidRequest];
    v14 = 0;
    goto LABEL_22;
  }
  if ([v12 length] && v42)
  {
    v18 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      __int16 v40 = [(id)objc_opt_class() description];
      int v31 = [v14 me];
      v32 = @"pseudo ";
      if (!v31) {
        v32 = &stru_1EDDE58B8;
      }
      v38 = v32;
      v39 = [v14 identifier];
      v41 = [v14 model];
      if (v41)
      {
        id v36 = NSString;
        uint64_t v34 = [v14 model];
        v33 = [v36 stringWithFormat:@" (%@)", v34];
        v35 = (void *)v34;
      }
      else
      {
        v33 = &stru_1EDDE58B8;
      }
      v37 = v33;
      *(_DWORD *)buf = 138544386;
      v49 = v40;
      __int16 v50 = 2112;
      v51 = v12;
      __int16 v52 = 2114;
      v53 = v38;
      __int16 v54 = 2114;
      v55 = v39;
      __int16 v56 = 2114;
      v57 = v33;
      _os_log_debug_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: Received unsubscribe to context value changes request for '%@' from %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v41)
      {
      }
    }

    [a1[2] remoteContextStorage:a1 unsubscribeFromChangesWithPeer:v14 registrationIdentifier:v12 predicate:v42];
    int v19 = 0;
    BOOL v20 = 0;
    goto LABEL_23;
  }
  v30 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:].cold.4();
  }

  BOOL v20 = +[_DKSyncErrors invalidRequest];
LABEL_22:
  int v19 = 1;
LABEL_23:

LABEL_24:
  uint64_t v23 = [a1 myDeviceID];
  v24 = (void *)v23;
  BOOL v25 = &stru_1EDDE58B8;
  if (v23) {
    BOOL v25 = (__CFString *)v23;
  }
  id v26 = v25;

  v46[0] = @"server";
  v46[1] = @"version";
  v47[0] = v26;
  v47[1] = @"3.0";
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v28 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]();
  }

  v44[2](v44, v27, 0, v20);
  if (v45)
  {
    v29 = [MEMORY[0x1E4F1C9C8] date];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v45, v29, v19 != 0);
  }
LABEL_31:
}

- (void)fetchContextValuesFromPeer:(id)a3 forKeyPaths:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v51[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v13);

  v14 = [(_DKSyncRapportStorage *)self myDeviceID];
  if ([(_DKSyncRapportStorage *)self isAvailable]
    && ([v10 idsDeviceIdentifier], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0)
    && (char v16 = (void *)v15,
        BOOL v17 = [(_DKSyncRapportStorage *)self isTransportActiveForPeer:v10],
        v16,
        v17))
  {
    v18 = [MEMORY[0x1E4F1C9C8] date];
    int v19 = &stru_1EDDE58B8;
    if (v14) {
      BOOL v20 = v14;
    }
    else {
      BOOL v20 = &stru_1EDDE58B8;
    }
    v50[0] = @"client";
    v50[1] = @"keyPaths";
    id v21 = (id)MEMORY[0x1E4F1CBF0];
    if (v11) {
      id v21 = v11;
    }
    v51[0] = v20;
    v51[1] = v21;
    v50[2] = @"version";
    v51[2] = @"3.0";
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
    uint64_t v23 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v33 = [(id)objc_opt_class() description];
      int v26 = [v10 me];
      id v27 = @"pseudo ";
      if (!v26) {
        id v27 = &stru_1EDDE58B8;
      }
      v30 = v27;
      v32 = [v10 identifier];
      int v31 = [v10 model];
      if (v31)
      {
        v28 = NSString;
        v29 = [v10 model];
        int v19 = [v28 stringWithFormat:@" (%@)", v29];
      }
      *(_DWORD *)buf = 138544386;
      v41 = v33;
      __int16 v42 = 2114;
      id v43 = v30;
      __int16 v44 = 2114;
      v45 = v32;
      __int16 v46 = 2114;
      v47 = v19;
      __int16 v48 = 2112;
      id v49 = v22;
      _os_log_debug_impl(&dword_18ECEB000, v23, OS_LOG_TYPE_DEBUG, "%{public}@: Sending fetch context values request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v31)
      {
      }
    }

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke;
    v36[3] = &unk_1E5610D90;
    v36[4] = self;
    id v37 = v10;
    id v38 = v18;
    id v39 = v12;
    id v24 = v12;
    id v25 = v18;
    [(_DKSyncRapportStorage *)self sendRequestID:@"com.apple.coreduet.fetch-context-values" request:v22 peer:v37 highPriority:v7 options:0 responseHandler:v36];
  }
  else
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __95___DKSyncRapportContextStorage_fetchContextValuesFromPeer_forKeyPaths_highPriority_completion___block_invoke_2;
    v34[3] = &unk_1E560D640;
    id v35 = v12;
    id v22 = v12;
    [(_DKSyncRapportStorage *)self handleAvailabilityFailureWithPeer:v10 completion:v34];
    id v25 = v35;
  }
}

- (void)handleFetchContextValuesWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v35 = a3;
  id v14 = a4;
  id v36 = a5;
  id v15 = a6;
  char v16 = a7;
  if (!a1) {
    goto LABEL_22;
  }
  BOOL v17 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v17);

  v18 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    [(id)objc_opt_class() description];
    objc_claimAutoreleasedReturnValue();
    -[_DKSyncRapportContextStorage handleFetchContextValuesWithResponse:options:error:peer:plStartDate:completion:]();
  }

  if (v14)
  {
    if ([v14 code] == -6714
      && ([v14 domain],
          int v19 = objc_claimAutoreleasedReturnValue(),
          int v20 = [v19 isEqualToString:*MEMORY[0x1E4F94770]],
          v19,
          v20))
    {
      id v21 = +[_DKSyncPeerStatusTracker sharedInstance];
      objc_msgSend(v21, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v36);

      id v22 = 0;
      BOOL v23 = 1;
      if (!v15) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v24 = [a1 transformResponseError:v14];

      id v22 = 0;
      BOOL v23 = 1;
      id v14 = (id)v24;
      if (!v15) {
        goto LABEL_17;
      }
    }
    goto LABEL_16;
  }
  id v25 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = [(id)objc_opt_class() description];
    if ([v36 me]) {
      v29 = @"pseudo ";
    }
    else {
      v29 = &stru_1EDDE58B8;
    }
    v33 = [v36 identifier];
    v30 = [v36 model];
    if (v30)
    {
      v32 = NSString;
      BOOL v17 = [v36 model];
      int v31 = [v32 stringWithFormat:@" (%@)", v17];
    }
    else
    {
      int v31 = &stru_1EDDE58B8;
    }
    *(_DWORD *)buf = 138544386;
    id v38 = v34;
    __int16 v39 = 2114;
    __int16 v40 = v29;
    __int16 v41 = 2114;
    __int16 v42 = v33;
    __int16 v43 = 2114;
    __int16 v44 = v31;
    __int16 v45 = 2112;
    id v46 = v13;
    _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch context values response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
    if (v30)
    {
    }
  }

  int v26 = [v13 objectForKeyedSubscript:@"results"];
  id v22 = v26;
  if (v26)
  {
    id v14 = 0;
    BOOL v23 = [v26 count] == 0;
    if (!v15) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  +[_DKSyncErrors invalidResponse];
  BOOL v23 = 1;
  id v22 = 0;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
LABEL_16:
    id v27 = [MEMORY[0x1E4F1C9C8] date];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v15, v27, v23);
  }
LABEL_17:
  if (v16)
  {
    v28 = (void (*)(void *, void *, id))v16[2];
    if (v14) {
      v28(v16, 0, v14);
    }
    else {
      v28(v16, v22, 0);
    }
  }

LABEL_22:
}

- (void)sendContextValuesToPeer:(id)a3 registrationIdentifier:(id)a4 archivedObjects:(id)a5 highPriority:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  v54[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  char v16 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v16);

  BOOL v17 = [(_DKSyncRapportStorage *)self myDeviceID];
  if (v13
    && [v14 count]
    && [(_DKSyncRapportStorage *)self isAvailable]
    && ([v12 idsDeviceIdentifier], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0)
    && (int v19 = (void *)v18,
        BOOL v20 = [(_DKSyncRapportStorage *)self isTransportActiveForPeer:v12],
        v19,
        v20))
  {
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    id v22 = &stru_1EDDE58B8;
    if (v17) {
      id v22 = v17;
    }
    v53[0] = @"client";
    v53[1] = @"id";
    v54[0] = v22;
    v54[1] = v13;
    v53[2] = @"objects";
    v53[3] = @"version";
    v54[2] = v14;
    v54[3] = @"3.0";
    BOOL v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];
    uint64_t v24 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v33 = v21;
      uint64_t v34 = v23;
      id v36 = [(id)objc_opt_class() description];
      int v26 = [v12 me];
      id v27 = @"pseudo ";
      v28 = &stru_1EDDE58B8;
      if (!v26) {
        id v27 = &stru_1EDDE58B8;
      }
      v32 = v27;
      id v35 = [v12 identifier];
      v29 = [v12 model];
      if (v29)
      {
        v30 = NSString;
        int v31 = [v12 model];
        v28 = [v30 stringWithFormat:@" (%@)", v31];
      }
      *(_DWORD *)buf = 138544386;
      __int16 v44 = v36;
      __int16 v45 = 2114;
      id v46 = v32;
      __int16 v47 = 2114;
      __int16 v48 = v35;
      __int16 v49 = 2114;
      __int16 v50 = v28;
      __int16 v51 = 2112;
      __int16 v52 = v34;
      _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Sending send context values to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v29)
      {
      }
      id v21 = v33;
      BOOL v23 = v34;
    }

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke;
    v39[3] = &unk_1E5610D90;
    v39[4] = self;
    id v40 = v12;
    id v41 = v21;
    id v42 = v15;
    id v25 = v21;
    [(_DKSyncRapportStorage *)self sendRequestID:@"com.apple.coreduet.send-context-values" request:v23 peer:v40 highPriority:v8 options:0 responseHandler:v39];
  }
  else if ([v14 count])
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __119___DKSyncRapportContextStorage_sendContextValuesToPeer_registrationIdentifier_archivedObjects_highPriority_completion___block_invoke_2;
    v37[3] = &unk_1E560D640;
    id v38 = v15;
    [(_DKSyncRapportStorage *)self handleAvailabilityFailureWithPeer:v12 completion:v37];
  }
  else
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

- (void)handleSendContextValuesWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  char v16 = a4;
  id v17 = a5;
  id v18 = a6;
  int v19 = a7;
  if (a1)
  {
    BOOL v20 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v20);

    id v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSendContextValuesWithResponse:options:error:peer:plStartDate:completion:]();
    }

    if (v16)
    {
      if ([v16 code] == -6714
        && ([v16 domain],
            id v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = [v22 isEqualToString:*MEMORY[0x1E4F94770]],
            v22,
            v23))
      {
        uint64_t v24 = +[_DKSyncPeerStatusTracker sharedInstance];
        -[NSObject removeActiveTransports:fromPeer:](v24, "removeActiveTransports:fromPeer:", [a1 transportType], v17);
      }
      else
      {
        [a1 transformResponseError:v16];
        char v16 = v24 = v16;
      }
    }
    else
    {
      uint64_t v24 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v33 = [(id)objc_opt_class() description];
        int v27 = [v17 me];
        v28 = &stru_1EDDE58B8;
        if (v27) {
          v28 = @"pseudo ";
        }
        int v31 = v28;
        v32 = [v17 identifier];
        uint64_t v34 = [v17 model];
        if (v34)
        {
          v30 = NSString;
          BOOL v7 = [v17 model];
          v29 = [v30 stringWithFormat:@" (%@)", v7];
        }
        else
        {
          v29 = &stru_1EDDE58B8;
        }
        *(_DWORD *)buf = 138544386;
        id v36 = v33;
        __int16 v37 = 2114;
        id v38 = v31;
        __int16 v39 = 2114;
        id v40 = v32;
        __int16 v41 = 2114;
        id v42 = v29;
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received sent context values response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v34)
        {
        }
      }
      char v16 = 0;
    }

    if (v18)
    {
      id v25 = [MEMORY[0x1E4F1C9C8] date];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v18, v25, 1);
    }
    if (v19)
    {
      int v26 = (void (*)(void *, NSObject *))v19[2];
      if (v16)
      {
        v26(v19, v16);
      }
      else
      {
        v26(v19, 0);
        char v16 = 0;
      }
    }
  }
}

- (void)subscribeToContextValueChangeNotificationsFromPeer:(id)a3 registrationIdentifier:(id)a4 predicate:(id)a5 highPriority:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  v56[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  char v16 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v16);

  id v17 = [(_DKSyncRapportStorage *)self myDeviceID];
  uint64_t v18 = [v13 length];
  if (v14
    && v18
    && [(_DKSyncRapportStorage *)self isAvailable]
    && ([v12 idsDeviceIdentifier], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL v20 = (void *)v19,
        BOOL v21 = [(_DKSyncRapportStorage *)self isTransportActiveForPeer:v12],
        v20,
        v21))
  {
    id v22 = [MEMORY[0x1E4F1C9C8] date];
    int v23 = &stru_1EDDE58B8;
    if (v17) {
      int v23 = v17;
    }
    v55[0] = @"client";
    v55[1] = @"id";
    v56[0] = v23;
    v56[1] = v13;
    v55[2] = @"predicate";
    v55[3] = @"version";
    v56[2] = v14;
    v56[3] = @"3.0";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
    id v25 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v35 = v22;
      id v36 = v24;
      id v38 = [(id)objc_opt_class() description];
      int v28 = [v12 me];
      v29 = @"pseudo ";
      v30 = &stru_1EDDE58B8;
      if (!v28) {
        v29 = &stru_1EDDE58B8;
      }
      uint64_t v34 = v29;
      __int16 v37 = [v12 identifier];
      int v31 = [v12 model];
      if (v31)
      {
        v32 = NSString;
        v33 = [v12 model];
        v30 = [v32 stringWithFormat:@" (%@)", v33];
      }
      *(_DWORD *)buf = 138544386;
      id v46 = v38;
      __int16 v47 = 2114;
      __int16 v48 = v34;
      __int16 v49 = 2114;
      __int16 v50 = v37;
      __int16 v51 = 2114;
      __int16 v52 = v30;
      __int16 v53 = 2112;
      __int16 v54 = v36;
      _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Sending subscribe to context value changes request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v31)
      {
      }
      id v22 = v35;
      uint64_t v24 = v36;
    }

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke;
    v41[3] = &unk_1E5610D90;
    v41[4] = self;
    id v42 = v12;
    id v43 = v22;
    id v44 = v15;
    id v26 = v22;
    [(_DKSyncRapportStorage *)self sendRequestID:@"com.apple.coreduet.subscribe-to-context-value-changes" request:v24 peer:v42 highPriority:v8 options:0 responseHandler:v41];
  }
  else if ([v13 length])
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __140___DKSyncRapportContextStorage_subscribeToContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2;
    v39[3] = &unk_1E560D640;
    id v40 = v15;
    [(_DKSyncRapportStorage *)self handleAvailabilityFailureWithPeer:v12 completion:v39];
  }
  else
  {
    int v27 = +[_DKSyncErrors internalFailure];
    (*((void (**)(id, void *))v15 + 2))(v15, v27);
  }
}

- (void)handleSubscribeToContextValueChangeNotificationsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  char v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = a7;
  if (a1)
  {
    BOOL v20 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v20);

    BOOL v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:]();
    }

    if (v16)
    {
      if ([v16 code] == -6714
        && ([v16 domain],
            id v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = [v22 isEqualToString:*MEMORY[0x1E4F94770]],
            v22,
            v23))
      {
        uint64_t v24 = +[_DKSyncPeerStatusTracker sharedInstance];
        -[NSObject removeActiveTransports:fromPeer:](v24, "removeActiveTransports:fromPeer:", [a1 transportType], v17);
      }
      else
      {
        [a1 transformResponseError:v16];
        char v16 = v24 = v16;
      }
    }
    else
    {
      uint64_t v24 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v33 = [(id)objc_opt_class() description];
        int v27 = [v17 me];
        int v28 = &stru_1EDDE58B8;
        if (v27) {
          int v28 = @"pseudo ";
        }
        int v31 = v28;
        v32 = [v17 identifier];
        uint64_t v34 = [v17 model];
        if (v34)
        {
          v30 = NSString;
          BOOL v7 = [v17 model];
          v29 = [v30 stringWithFormat:@" (%@)", v7];
        }
        else
        {
          v29 = &stru_1EDDE58B8;
        }
        *(_DWORD *)buf = 138544386;
        id v36 = v33;
        __int16 v37 = 2114;
        id v38 = v31;
        __int16 v39 = 2114;
        id v40 = v32;
        __int16 v41 = 2114;
        id v42 = v29;
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received subscribe to context value changes response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v34)
        {
        }
      }
      char v16 = 0;
    }

    if (v18)
    {
      id v25 = [MEMORY[0x1E4F1C9C8] date];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v18, v25, 1);
    }
    if (v19)
    {
      id v26 = (void (*)(void *, NSObject *))v19[2];
      if (v16)
      {
        v26(v19, v16);
      }
      else
      {
        v26(v19, 0);
        char v16 = 0;
      }
    }
  }
}

- (void)unsubscribeFromContextValueChangeNotificationsFromPeer:(id)a3 registrationIdentifier:(id)a4 predicate:(id)a5 highPriority:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  v56[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  char v16 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v16);

  id v17 = [(_DKSyncRapportStorage *)self myDeviceID];
  uint64_t v18 = [v13 length];
  if (v14
    && v18
    && [(_DKSyncRapportStorage *)self isAvailable]
    && ([v12 idsDeviceIdentifier], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL v20 = (void *)v19,
        BOOL v21 = [(_DKSyncRapportStorage *)self isTransportActiveForPeer:v12],
        v20,
        v21))
  {
    id v22 = [MEMORY[0x1E4F1C9C8] date];
    int v23 = &stru_1EDDE58B8;
    if (v17) {
      int v23 = v17;
    }
    v55[0] = @"client";
    v55[1] = @"id";
    v56[0] = v23;
    v56[1] = v13;
    v55[2] = @"predicate";
    v55[3] = @"version";
    v56[2] = v14;
    v56[3] = @"3.0";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
    id v25 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v35 = v22;
      id v36 = v24;
      id v38 = [(id)objc_opt_class() description];
      int v28 = [v12 me];
      v29 = @"pseudo ";
      v30 = &stru_1EDDE58B8;
      if (!v28) {
        v29 = &stru_1EDDE58B8;
      }
      uint64_t v34 = v29;
      __int16 v37 = [v12 identifier];
      int v31 = [v12 model];
      if (v31)
      {
        v32 = NSString;
        v33 = [v12 model];
        v30 = [v32 stringWithFormat:@" (%@)", v33];
      }
      *(_DWORD *)buf = 138544386;
      id v46 = v38;
      __int16 v47 = 2114;
      __int16 v48 = v34;
      __int16 v49 = 2114;
      __int16 v50 = v37;
      __int16 v51 = 2114;
      __int16 v52 = v30;
      __int16 v53 = 2112;
      __int16 v54 = v36;
      _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Sending unsubscribe to context value changes request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v31)
      {
      }
      id v22 = v35;
      uint64_t v24 = v36;
    }

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke;
    v41[3] = &unk_1E5610D90;
    v41[4] = self;
    id v42 = v12;
    id v43 = v22;
    id v44 = v15;
    id v26 = v22;
    [(_DKSyncRapportStorage *)self sendRequestID:@"com.apple.coreduet.unsubscribe-to-context-value-changes" request:v24 peer:v42 highPriority:v8 options:0 responseHandler:v41];
  }
  else if ([v13 length])
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __144___DKSyncRapportContextStorage_unsubscribeFromContextValueChangeNotificationsFromPeer_registrationIdentifier_predicate_highPriority_completion___block_invoke_2;
    v39[3] = &unk_1E560D640;
    id v40 = v15;
    [(_DKSyncRapportStorage *)self handleAvailabilityFailureWithPeer:v12 completion:v39];
  }
  else
  {
    int v27 = +[_DKSyncErrors internalFailure];
    (*((void (**)(id, void *))v15 + 2))(v15, v27);
  }
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  char v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = a7;
  if (a1)
  {
    BOOL v20 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v20);

    BOOL v21 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:]();
    }

    if (v16)
    {
      if ([v16 code] == -6714
        && ([v16 domain],
            id v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = [v22 isEqualToString:*MEMORY[0x1E4F94770]],
            v22,
            v23))
      {
        uint64_t v24 = +[_DKSyncPeerStatusTracker sharedInstance];
        -[NSObject removeActiveTransports:fromPeer:](v24, "removeActiveTransports:fromPeer:", [a1 transportType], v17);
      }
      else
      {
        [a1 transformResponseError:v16];
        char v16 = v24 = v16;
      }
    }
    else
    {
      uint64_t v24 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v33 = [(id)objc_opt_class() description];
        int v27 = [v17 me];
        int v28 = &stru_1EDDE58B8;
        if (v27) {
          int v28 = @"pseudo ";
        }
        int v31 = v28;
        v32 = [v17 identifier];
        uint64_t v34 = [v17 model];
        if (v34)
        {
          v30 = NSString;
          BOOL v7 = [v17 model];
          v29 = [v30 stringWithFormat:@" (%@)", v7];
        }
        else
        {
          v29 = &stru_1EDDE58B8;
        }
        *(_DWORD *)buf = 138544386;
        id v36 = v33;
        __int16 v37 = 2114;
        id v38 = v31;
        __int16 v39 = 2114;
        id v40 = v32;
        __int16 v41 = 2114;
        id v42 = v29;
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received unsubscribe to context value changes response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v34)
        {
        }
      }
      char v16 = 0;
    }

    if (v18)
    {
      id v25 = [MEMORY[0x1E4F1C9C8] date];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v18, v25, 1);
    }
    if (v19)
    {
      id v26 = (void (*)(void *, NSObject *))v19[2];
      if (v16)
      {
        v26(v19, v16);
      }
      else
      {
        v26(v19, 0);
        char v16 = 0;
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = (_DKSyncRemoteContextStorageDelegate *)a3;
  v5 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v5);

  delegate = self->_delegate;
  self->_delegate = v4;
  BOOL v7 = v4;

  BOOL v8 = [(_DKSyncRemoteContextStorageDelegate *)self->_delegate deviceUUID];

  id v9 = [v8 UUIDString];

  [(_DKSyncRapportStorage *)self setDeviceID:v9];
}

- (_DKSyncRemoteContextStorageDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with fetch context values response: %@", v4, v5);
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to fetch context values, missing delegate", v5);
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.3()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_15(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received fetch context values request for key paths '%@'", v5, v6);
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.4()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received fetch context values request: %@", v4, v5);
}

- (void)handleFetchContextValuesWithRequest:options:responseHandler:.cold.5()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch context values request", v5);
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with sent context values response: %@", v4, v5);
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to receive sent context values, missing delegate", v5);
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.3()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_40(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18ECEB000, "%{public}@: Failed to receive sent context values, unknown peer source device id: %{public}@", v4, v5);
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.4()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_40(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18ECEB000, "%{public}@: Failed to receive sent context values, invalid object class: %{public}@", v4, v5);
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.5()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_40(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18ECEB000, "%{public}@: Invalid request, client attempting to masquerade as client %{public}@", v4, v5);
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.6()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received sent context values: %@", v4, v5);
}

- (void)handleSendContextValuesWithRequest:options:responseHandler:.cold.7()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling sent context values", v5);
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with subscribe to context value changes response: %@", v4, v5);
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to subscribe to context value changes, missing delegate", v5);
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.3()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_40(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18ECEB000, "%{public}@: Failed to subscribe to context value changes, unknown peer source device id: %{public}@", v4, v5);
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.4()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to subscribe to context value changes, missing registration identifier", v5);
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.6()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received subscribe to context value changes request: %@", v4, v5);
}

- (void)handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.7()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling subscribe to context value changes request", v5);
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with unsubscribe to context value changes response: %@", v4, v5);
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to unsubscribe to context value changes, missing delegate", v5);
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.6()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received unsubscribe to context value changes request: %@", v4, v5);
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:.cold.7()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling unsubscribe to context value changes request", v5);
}

- (void)handleFetchContextValuesWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch context values response", v5);
}

- (void)handleSendContextValuesWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling sent context values response", v5);
}

- (void)handleSubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling subscribe to context value changes response", v5);
}

- (void)handleUnsubscribeToContextValueChangeNotificationsWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling unsubscribe to context value changes response", v5);
}

@end