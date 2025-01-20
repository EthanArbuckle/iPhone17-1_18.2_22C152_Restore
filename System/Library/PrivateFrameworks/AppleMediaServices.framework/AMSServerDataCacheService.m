@interface AMSServerDataCacheService
+ (BOOL)_serverDataCacheFeatureEnabled;
- (AMSServerDataCacheService)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_makeRemoteConnectionInterface;
- (id)_newRemoteConnection;
- (id)dataForAccountDSID:(id)a3 cacheTypeID:(id)a4 networkPolicy:(int64_t)a5;
- (id)granularNotificationSettingsForAccountDSID:(id)a3 bundleID:(id)a4 networkPolicy:(int64_t)a5;
- (id)proxyWithErrorHandler:(id)a3;
- (id)reminderEventsForAccount:(id)a3 service:(id)a4 eventType:(id)a5 networkPolicy:(int64_t)a6;
- (id)setUpCacheForAccount:(id)a3;
- (id)setUpCacheForAccountDSID:(id)a3;
- (id)tearDownCacheForAccountDSID:(id)a3;
- (id)updateCacheForAccountDSID:(id)a3 withCachePayload:(id)a4;
- (id)updateCacheForAccountDSID:(id)a3 withCacheTypeIDs:(id)a4;
- (void)_removeRemoteConnection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AMSServerDataCacheService

- (AMSServerDataCacheService)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSServerDataCacheService;
  v2 = [(AMSServerDataCacheService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.AppleMediaServices.serverDataCacheService", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__61;
  v16 = __Block_byref_object_dispose__61;
  id v17 = 0;
  v5 = [(AMSServerDataCacheService *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E55A63B8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  if (!v2)
  {
    v2 = (void *)[*(id *)(a1 + 32) _newRemoteConnection];
    [*(id *)(a1 + 32) setConnection:v2];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke_2;
  v7[3] = &unk_1E55A6390;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v4 = [v2 remoteObjectProxyWithErrorHandler:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedServerDataCacheConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote object. %{public}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  [(AMSServerDataCacheService *)self _removeRemoteConnection];
  v3.receiver = self;
  v3.super_class = (Class)AMSServerDataCacheService;
  [(AMSServerDataCacheService *)&v3 dealloc];
}

- (id)_makeRemoteConnectionInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51728];
  [v2 setClass:objc_opt_class() forSelector:sel_setUpCacheForAccount_completion_ argumentIndex:0 ofReply:0];
  return v2;
}

- (id)_newRemoteConnection
{
  objc_super v3 = [(AMSServerDataCacheService *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.xpc.amsserverdatacacheservice" options:0];
  uint64_t v5 = [(AMSServerDataCacheService *)self queue];
  [v4 _setQueue:v5];

  uint64_t v6 = [(AMSServerDataCacheService *)self _makeRemoteConnectionInterface];
  [v4 setRemoteObjectInterface:v6];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__AMSServerDataCacheService__newRemoteConnection__block_invoke;
  v10[3] = &unk_1E559F890;
  objc_copyWeak(&v11, &location);
  [v4 setInvalidationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__AMSServerDataCacheService__newRemoteConnection__block_invoke_2;
  v8[3] = &unk_1E559F890;
  objc_copyWeak(&v9, &location);
  [v4 setInterruptionHandler:v8];
  [v4 resume];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v4;
}

void __49__AMSServerDataCacheService__newRemoteConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeRemoteConnection];
}

void __49__AMSServerDataCacheService__newRemoteConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeRemoteConnection];
}

- (void)_removeRemoteConnection
{
  objc_super v3 = [(AMSServerDataCacheService *)self connection];
  [v3 invalidate];

  [(AMSServerDataCacheService *)self setConnection:0];
}

- (id)reminderEventsForAccount:(id)a3 service:(id)a4 eventType:(id)a5 networkPolicy:(int64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = objc_msgSend(a3, "ams_DSID");
  id v13 = objc_opt_new();
  if (([(id)objc_opt_class() _serverDataCacheFeatureEnabled] & 1) == 0)
  {
    v22 = @"Feature disabled";
    v23 = @"ServerDataCache is not enabled";
    uint64_t v24 = 11;
LABEL_10:
    v25 = AMSError(v24, v22, v23, 0);
    [v13 finishWithError:v25];

    id v26 = v13;
    goto LABEL_11;
  }
  if (!v12)
  {
    v22 = @"No dsid for account";
    v23 = @"Account is missing dsid";
    uint64_t v24 = 12;
    goto LABEL_10;
  }
  uint64_t v14 = +[AMSLogConfig sharedServerDataCacheConfig];
  if (!v14)
  {
    uint64_t v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    id v17 = AMSLogKey();
    *(_DWORD *)buf = 138544386;
    uint64_t v31 = v16;
    __int16 v32 = 2114;
    v33 = v17;
    __int16 v34 = 2114;
    id v35 = v11;
    __int16 v36 = 2114;
    id v37 = v10;
    __int16 v38 = 2114;
    v39 = v12;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving %{public}@ events for %{public}@ %{public}@.", buf, 0x34u);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__AMSServerDataCacheService_reminderEventsForAccount_service_eventType_networkPolicy___block_invoke;
  v28[3] = &unk_1E559F028;
  id v18 = v13;
  id v29 = v18;
  v19 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v28];
  v20 = [v18 completionHandlerAdapter];
  [v19 reminderEventsForAccountDSID:v12 service:v10 eventType:v11 networkPolicy:a6 completion:v20];

  id v21 = v18;
LABEL_11:

  return v13;
}

uint64_t __86__AMSServerDataCacheService_reminderEventsForAccount_service_eventType_networkPolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)granularNotificationSettingsForAccountDSID:(id)a3 bundleID:(id)a4 networkPolicy:(int64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  if ([(id)objc_opt_class() _serverDataCacheFeatureEnabled])
  {
    id v11 = +[AMSLogConfig sharedServerDataCacheConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    __int16 v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = v13;
      __int16 v24 = 2114;
      v25 = v14;
      __int16 v26 = 2114;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving granular notification settings for %{public}@ %{public}@.", buf, 0x2Au);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__AMSServerDataCacheService_granularNotificationSettingsForAccountDSID_bundleID_networkPolicy___block_invoke;
    v20[3] = &unk_1E559F028;
    id v15 = v10;
    id v21 = v15;
    uint64_t v16 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v20];
    id v17 = [v15 completionHandlerAdapter];
    [v16 granularNotificationSettingsForAccountDSID:v8 bundleID:v9 networkPolicy:a5 completion:v17];

    id v18 = v15;
  }
  else
  {
    AMSError(11, @"Feature disabled", @"ServerDataCache is not enabled", 0);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    [v10 finishWithError:v18];
  }

  return v10;
}

uint64_t __95__AMSServerDataCacheService_granularNotificationSettingsForAccountDSID_bundleID_networkPolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)dataForAccountDSID:(id)a3 cacheTypeID:(id)a4 networkPolicy:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  if ([(id)objc_opt_class() _serverDataCacheFeatureEnabled])
  {
    id v11 = +[AMSLogConfig sharedServerDataCacheConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    __int16 v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      *(_DWORD *)buf = 138544386;
      uint64_t v23 = v13;
      __int16 v24 = 2114;
      v25 = v14;
      __int16 v26 = 2114;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v9;
      __int16 v30 = 2048;
      int64_t v31 = a5;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving data for %{public}@ cacheTypeId: %{public}@, networkPolicy: %ld.", buf, 0x34u);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__AMSServerDataCacheService_dataForAccountDSID_cacheTypeID_networkPolicy___block_invoke;
    v20[3] = &unk_1E559F028;
    id v15 = v10;
    id v21 = v15;
    uint64_t v16 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v20];
    id v17 = [v15 completionHandlerAdapter];
    [v16 dataForAccountDSID:v8 cacheTypeID:v9 networkPolicy:a5 completion:v17];

    id v18 = v15;
  }
  else
  {
    AMSError(11, @"Feature disabled", @"ServerDataCache is not enabled", 0);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    [v10 finishWithError:v18];
  }

  return v10;
}

uint64_t __74__AMSServerDataCacheService_dataForAccountDSID_cacheTypeID_networkPolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)setUpCacheForAccount:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if ([(id)objc_opt_class() _serverDataCacheFeatureEnabled])
  {
    uint64_t v6 = +[AMSLogConfig sharedServerDataCacheConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = AMSLogKey();
      id v10 = objc_msgSend(v4, "ams_DSID");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting up cache for dsid %{public}@.", buf, 0x20u);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__AMSServerDataCacheService_setUpCacheForAccount___block_invoke;
    v17[3] = &unk_1E559F028;
    id v11 = v5;
    id v18 = v11;
    __int16 v12 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v17];
    uint64_t v13 = [v11 completionHandlerAdapter];
    [v12 setUpCacheForAccount:v4 completion:v13];

    id v14 = v11;
  }
  else
  {
    id v15 = AMSError(11, @"Feature disabled", @"ServerDataCache is not enabled", 0);
    [v5 finishWithError:v15];
  }
  return v5;
}

uint64_t __50__AMSServerDataCacheService_setUpCacheForAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)setUpCacheForAccountDSID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if ([(id)objc_opt_class() _serverDataCacheFeatureEnabled])
  {
    uint64_t v6 = +[AMSLogConfig sharedServerDataCacheConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      __int16 v21 = v9;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting up cache for dsid %{public}@.", buf, 0x20u);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__AMSServerDataCacheService_setUpCacheForAccountDSID___block_invoke;
    v16[3] = &unk_1E559F028;
    id v10 = v5;
    id v17 = v10;
    id v11 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v16];
    __int16 v12 = [v10 completionHandlerAdapter];
    [v11 setUpCacheForAccountDSID:v4 completion:v12];

    id v13 = v10;
  }
  else
  {
    id v14 = AMSError(11, @"Feature disabled", @"ServerDataCache is not enabled", 0);
    [v5 finishWithError:v14];
  }
  return v5;
}

uint64_t __54__AMSServerDataCacheService_setUpCacheForAccountDSID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)tearDownCacheForAccountDSID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if ([(id)objc_opt_class() _serverDataCacheFeatureEnabled])
  {
    uint64_t v6 = +[AMSLogConfig sharedServerDataCacheConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      __int16 v21 = v9;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Tearing down cache for dsid %{public}@.", buf, 0x20u);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__AMSServerDataCacheService_tearDownCacheForAccountDSID___block_invoke;
    v16[3] = &unk_1E559F028;
    id v10 = v5;
    id v17 = v10;
    id v11 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v16];
    __int16 v12 = [v10 completionHandlerAdapter];
    [v11 tearDownCacheForAccountDSID:v4 completion:v12];

    id v13 = v10;
  }
  else
  {
    id v14 = AMSError(11, @"Feature disabled", @"ServerDataCache is not enabled", 0);
    [v5 finishWithError:v14];
  }
  return v5;
}

uint64_t __57__AMSServerDataCacheService_tearDownCacheForAccountDSID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)updateCacheForAccountDSID:(id)a3 withCachePayload:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if ([(id)objc_opt_class() _serverDataCacheFeatureEnabled])
  {
    id v9 = +[AMSLogConfig sharedServerDataCacheConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      __int16 v12 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating cache for %{public}@ with payload", buf, 0x20u);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCachePayload___block_invoke;
    v19[3] = &unk_1E559F028;
    id v13 = v8;
    id v20 = v13;
    id v14 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v19];
    id v15 = [v13 completionHandlerAdapter];
    [v14 updateCacheForAccountDSID:v6 withCachePayload:v7 completion:v15];

    id v16 = v13;
  }
  else
  {
    id v17 = AMSError(11, @"Feature disabled", @"ServerDataCache is not enabled", 0);
    [v8 finishWithError:v17];
  }
  return v8;
}

uint64_t __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCachePayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)updateCacheForAccountDSID:(id)a3 withCacheTypeIDs:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if ([(id)objc_opt_class() _serverDataCacheFeatureEnabled])
  {
    id v9 = +[AMSLogConfig sharedServerDataCacheConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      __int16 v12 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 2114;
      id v28 = v7;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating data for %{public}@ cacheTypeIds: %{public}@", buf, 0x2Au);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCacheTypeIDs___block_invoke;
    v19[3] = &unk_1E559F028;
    id v13 = v8;
    id v20 = v13;
    id v14 = [(AMSServerDataCacheService *)self proxyWithErrorHandler:v19];
    id v15 = [v13 completionHandlerAdapter];
    [v14 updateCacheForAccountDSID:v6 withCacheTypeIDs:v7 completion:v15];

    id v16 = v13;
  }
  else
  {
    id v17 = AMSError(11, @"Feature disabled", @"ServerDataCache is not enabled", 0);
    [v8 finishWithError:v17];
  }
  return v8;
}

uint64_t __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCacheTypeIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

+ (BOOL)_serverDataCacheFeatureEnabled
{
  return _os_feature_enabled_impl();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end