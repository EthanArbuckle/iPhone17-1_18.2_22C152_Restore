@interface AMSSystemEngagementTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSEngagementRequest)request;
- (AMSEngagementResult)result;
- (AMSProcessInfo)clientInfo;
- (AMSSystemEngagementTask)initWithRequest:(id)a3;
- (AMSSystemEngagementTask)initWithRequest:(id)a3 bag:(id)a4;
- (BOOL)disablePresentationTarget;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSError)error;
- (NSObject)displayDidBecomeActiveToken;
- (NSObject)displayWillForegroundToken;
- (NSXPCConnection)underlyingRemoteConnection;
- (NSXPCListener)remoteListener;
- (OS_dispatch_group)dispatchGroup;
- (RBSProcessHandle)presentationTargetHandle;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)_processIdentifierForBundleIdentifier:(id)a3;
- (id)_snapshotBagDataPromise;
- (id)_unlockDeviceIfNeeded;
- (id)present;
- (void)_activateIfWithError:(id *)a3;
- (void)_finishTaskWithResult:(id)a3 error:(id)a4;
- (void)_invalidateRemoteAlert;
- (void)_listenForAppForegroundWithHandle:(id)a3 monitorInApp:(BOOL)a4;
- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDisablePresentationTarget:(BOOL)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setDisplayDidBecomeActiveToken:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setDisplayWillForegroundToken:(id)a3;
- (void)setError:(id)a3;
- (void)setPresentationTargetHandle:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setRemoteListener:(id)a3;
- (void)setResult:(id)a3;
- (void)setUnderlyingRemoteConnection:(id)a3;
@end

@implementation AMSSystemEngagementTask

- (AMSSystemEngagementTask)initWithRequest:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSystemEngagementTask;
  v6 = [(AMSTask *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    dispatch_group_t v8 = dispatch_group_create();
    dispatchGroup = v7->_dispatchGroup;
    v7->_dispatchGroup = (OS_dispatch_group *)v8;
  }
  return v7;
}

- (AMSSystemEngagementTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7 = a4;
  dispatch_group_t v8 = [(AMSSystemEngagementTask *)self initWithRequest:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_bag, a4);
  }

  return v9;
}

- (id)present
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__AMSSystemEngagementTask_present__block_invoke;
  v4[3] = &unk_1E55A2C20;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithBlock:v4];
  return v2;
}

id __34__AMSSystemEngagementTask_present__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) request];
  id v5 = [v4 logKey];
  id v6 = AMSSetLogKey(v5);

  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  dispatch_group_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    v10 = [*(id *)(a1 + 32) request];
    objc_super v11 = [v10 logKey];
    v12 = [*(id *)(a1 + 32) request];
    *(_DWORD *)buf = 138543874;
    uint64_t v52 = v9;
    __int16 v53 = 2114;
    v54 = v11;
    __int16 v55 = 2114;
    v56 = v12;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting system engagement request. Request: %{public}@", buf, 0x20u);
  }
  v13 = [MEMORY[0x1E4F29290] anonymousListener];
  [*(id *)(a1 + 32) setRemoteListener:v13];

  v14 = *(void **)(a1 + 32);
  v15 = [v14 remoteListener];
  [v15 setDelegate:v14];

  v16 = [*(id *)(a1 + 32) remoteListener];
  [v16 resume];

  v17 = [*(id *)(a1 + 32) _unlockDeviceIfNeeded];
  id v48 = 0;
  [v17 resultWithError:&v48];
  id v18 = v48;

  if (v18)
  {
    v19 = 0;
    *a2 = v18;
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
    v21 = [*(id *)(a1 + 32) remoteListener];
    v22 = [v21 endpoint];
    v23 = [v22 _endpoint];
    [v20 setXpcEndpoint:v23];

    [v20 setUserInfo:MEMORY[0x1E4F1CC08]];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.AMSEngagementViewService" viewControllerClassName:@"AMSEngagementViewService.RemoteEngagementViewController"];
    v25 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v24 configurationContext:v20];
    [*(id *)(a1 + 32) setRemoteAlertHandle:v25];

    v26 = [*(id *)(a1 + 32) remoteAlertHandle];
    [v26 registerObserver:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) _activateIfWithError:a2];
    v27 = [*(id *)(a1 + 32) dispatchGroup];
    dispatch_group_enter(v27);

    v28 = [*(id *)(a1 + 32) dispatchGroup];
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

    v29 = +[AMSLogConfig sharedConfig];
    if (!v29)
    {
      v29 = +[AMSLogConfig sharedConfig];
    }
    v30 = [v29 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v47 = v24;
      id v31 = v20;
      v32 = a2;
      uint64_t v33 = objc_opt_class();
      v46 = [*(id *)(a1 + 32) request];
      v34 = [v46 logKey];
      v35 = [*(id *)(a1 + 32) result];
      v36 = [*(id *)(a1 + 32) error];
      *(_DWORD *)buf = 138544130;
      uint64_t v52 = v33;
      a2 = v32;
      id v20 = v31;
      v24 = v47;
      __int16 v53 = 2114;
      v54 = v34;
      __int16 v55 = 2114;
      v56 = v35;
      __int16 v57 = 2114;
      v58 = v36;
      _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Engagement task finished. Result: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    [*(id *)(a1 + 32) _invalidateRemoteAlert];
    [*(id *)(a1 + 32) setDispatchGroup:0];
    v37 = [*(id *)(a1 + 32) error];

    if (v37)
    {
      v38 = [*(id *)(a1 + 32) error];
      v49 = @"AMSEngagementPresented";
      uint64_t v50 = MEMORY[0x1E4F1CC38];
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v40 = objc_msgSend(v38, "ams_errorByAddingUserInfo:", v39);
      [*(id *)(a1 + 32) setError:v40];
    }
    *a2 = [*(id *)(a1 + 32) error];
    v41 = [AMSMetrics alloc];
    v42 = [*(id *)(a1 + 32) bag];
    v43 = [(AMSMetrics *)v41 initWithContainerID:@"com.apple.AppleMediaServices" bag:v42];

    id v44 = [(AMSMetrics *)v43 flush];
    v19 = [*(id *)(a1 + 32) result];
  }
  return v19;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(AMSSystemEngagementTask *)self request];
    dispatch_group_t v8 = [v7 logKey];
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Remote alert did activate", (uint8_t *)&v9, 0x16u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [(AMSSystemEngagementTask *)self request];
    dispatch_group_t v8 = [v7 logKey];
    int v16 = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Remote alert did deactivate", (uint8_t *)&v16, 0x16u);
  }
  int v9 = [(AMSSystemEngagementTask *)self presentationTargetHandle];

  if (!v9)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    __int16 v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = [(AMSSystemEngagementTask *)self request];
      v14 = [v13 logKey];
      int v16 = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resolving due to missing presentation target", (uint8_t *)&v16, 0x16u);
    }
    v15 = AMSError(6, 0, 0, 0);
    [(AMSSystemEngagementTask *)self _finishTaskWithResult:0 error:v15];
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    int v9 = [(AMSSystemEngagementTask *)self request];
    uint64_t v10 = [v9 logKey];
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Remote alert did invalidate. Error: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  __int16 v11 = AMSError(6, 0, 0, 0);
  [(AMSSystemEngagementTask *)self _finishTaskWithResult:0 error:v11];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    int v9 = [(AMSSystemEngagementTask *)self request];
    uint64_t v10 = [v9 logKey];
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received connection from view service", (uint8_t *)&v14, 0x16u);
  }
  __int16 v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD38438];
  [v5 setExportedInterface:v11];

  int v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD51788];
  [v5 setRemoteObjectInterface:v12];

  [v5 setExportedObject:self];
  [v5 resume];
  [(AMSSystemEngagementTask *)self setUnderlyingRemoteConnection:v5];

  return 1;
}

- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  __int16 v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    __int16 v11 = +[AMSLogConfig sharedConfig];
  }
  int v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    int v14 = [(AMSSystemEngagementTask *)self request];
    uint64_t v15 = [v14 logKey];
    int v16 = 138544130;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    v19 = v15;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task finished. (result: %{public}@, error: %{public}@)", (uint8_t *)&v16, 0x2Au);
  }
  v10[2](v10);

  [(AMSSystemEngagementTask *)self _finishTaskWithResult:v8 error:v9];
}

- (void)_activateIfWithError:(id *)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = [(AMSSystemEngagementTask *)self remoteAlertHandle];
  char v6 = [v5 isValid];

  if ((v6 & 1) == 0)
  {
    AMSError(12, @"Remote Handle Not Valid", 0, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return;
  }
  id v7 = [(AMSSystemEngagementTask *)self remoteAlertHandle];
  int v8 = [v7 isActive];

  if (v8)
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      int v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping re-activation: handle already active", buf, 0x16u);
    }
    goto LABEL_38;
  }
  id v9 = [(AMSSystemEngagementTask *)self clientInfo];

  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F28DB0];
  int v14 = [(AMSSystemEngagementTask *)self clientInfo];
  id v77 = 0;
  id v9 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v77];
  id v15 = v77;

  if (!v15)
  {
LABEL_11:
    int v16 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v17 = [(AMSSystemEngagementTask *)self request];
    id v76 = 0;
    __int16 v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v76];
    uint64_t v10 = v76;

    if (v10)
    {
      *a3 = v10;
LABEL_37:

      goto LABEL_38;
    }
    v19 = [(AMSSystemEngagementTask *)self _snapshotBagDataPromise];
    id v75 = 0;
    uint64_t v20 = [v19 resultWithError:&v75];
    id v21 = v75;

    v71 = v21;
    if (v21)
    {
      __int16 v22 = +[AMSLogConfig sharedConfig];
      if (!v22)
      {
        __int16 v22 = +[AMSLogConfig sharedConfig];
      }
      id v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = v18;
        uint64_t v25 = objc_opt_class();
        v26 = [(AMSSystemEngagementTask *)self request];
        v27 = [v26 logKey];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v25;
        __int16 v18 = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v71;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to snapshot bag. Error: %{public}@", buf, 0x20u);
      }
    }
    v70 = (void *)v20;
    if ([(AMSSystemEngagementTask *)self disablePresentationTarget])
    {
LABEL_20:
      uint64_t v28 = 0;
      v29 = 0;
LABEL_28:
      id v42 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v78 = @"engagementRequestData";
      v79 = v18;
      v43 = v18;
      id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      v45 = (void *)[v42 initWithDictionary:v44];

      if (v70) {
        [v45 setObject:v70 forKeyedSubscript:@"bagData"];
      }
      if (v9) {
        [v45 setObject:v9 forKeyedSubscript:@"clientInfoData"];
      }
      if (v29) {
        [v45 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"attachedToApp"];
      }
      id v46 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
      [v46 setUserInfo:v45];
      if (v29)
      {
        v47 = (void *)[objc_alloc(MEMORY[0x1E4FA6BE0]) initWithTargetProcess:v29];
        [v46 setPresentationTarget:v47];

        [(AMSSystemEngagementTask *)self _listenForAppForegroundWithHandle:v29 monitorInApp:v28];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__AMSSystemEngagementTask__activateIfWithError___block_invoke;
      block[3] = &unk_1E559F1E0;
      block[4] = self;
      id v73 = v46;
      id v48 = v46;
      dispatch_async(MEMORY[0x1E4F14428], block);

      __int16 v18 = v43;
      goto LABEL_37;
    }
    v30 = +[AMSLogConfig sharedConfig];
    if (!v30)
    {
      v30 = +[AMSLogConfig sharedConfig];
    }
    id v31 = [v30 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = AMSLogKey();
      v66 = [(AMSSystemEngagementTask *)self clientInfo];
      v34 = [v66 bundleIdentifier];
      v35 = [(AMSSystemEngagementTask *)self clientInfo];
      [v35 auditTokenData];
      v36 = v68 = v18;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v34;
      __int16 v81 = 2112;
      v82 = v36;
      _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] looking for handle for bundle: %@ audit: %@", buf, 0x2Au);

      __int16 v18 = v68;
    }

    v37 = [(AMSSystemEngagementTask *)self clientInfo];
    v38 = [v37 auditTokenData];

    if (v38)
    {
      memset(buf, 0, sizeof(buf));
      v39 = [(AMSSystemEngagementTask *)self clientInfo];
      v40 = [v39 auditTokenData];
      [v40 getBytes:buf length:32];

      v74[0] = *(_OWORD *)buf;
      v74[1] = *(_OWORD *)&buf[16];
      v41 = [MEMORY[0x1E4F4F6A8] tokenFromAuditToken:v74];
      v29 = [MEMORY[0x1E4F4F7F8] processHandleForAuditToken:v41];

LABEL_27:
      uint64_t v28 = 0;
      goto LABEL_28;
    }
    v49 = [(AMSSystemEngagementTask *)self clientInfo];
    uint64_t v50 = [v49 bundleIdentifier];
    if (v50)
    {
      v51 = (void *)v50;
      uint64_t v52 = +[AMSProcessInfo currentProcess];
      __int16 v53 = [v52 bundleIdentifier];
      v54 = [(AMSSystemEngagementTask *)self clientInfo];
      [v54 bundleIdentifier];
      __int16 v55 = v69 = v18;
      char v56 = [v53 isEqualToString:v55];

      __int16 v18 = v69;
      if ((v56 & 1) == 0)
      {
        __int16 v57 = [(AMSSystemEngagementTask *)self clientInfo];
        v58 = [v57 bundleIdentifier];
        uint64_t v59 = [(AMSSystemEngagementTask *)self _processIdentifierForBundleIdentifier:v58];

        if (v59)
        {
          v29 = objc_msgSend(MEMORY[0x1E4F4F7F8], "processHandleForPID:", objc_msgSend(v59, "intValue"));
          v60 = +[AMSLogConfig sharedConfig];
          if (!v60)
          {
            v60 = +[AMSLogConfig sharedConfig];
          }
          v61 = [v60 OSLogObject];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v67 = objc_opt_class();
            v62 = AMSLogKey();
            v63 = [(AMSSystemEngagementTask *)self clientInfo];
            v64 = [v63 bundleIdentifier];
            *(_DWORD *)buf = 138544386;
            *(void *)&uint8_t buf[4] = v67;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v62;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v59;
            __int16 v81 = 2112;
            v82 = v64;
            __int16 v83 = 2112;
            v84 = v29;
            _os_log_impl(&dword_18D554000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found pid: %@ for bundle: %@ <%@>", buf, 0x34u);
          }
          __int16 v18 = v69;
        }
        else
        {
          v29 = 0;
        }

        goto LABEL_27;
      }
    }
    else
    {
    }
    v65 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];

    if (v65)
    {
      v29 = [MEMORY[0x1E4F4F7F8] processHandle];
      uint64_t v28 = 1;
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  uint64_t v10 = v15;
  *a3 = v10;
LABEL_38:
}

void __48__AMSSystemEngagementTask__activateIfWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteAlertHandle];
  [v2 activateWithContext:*(void *)(a1 + 40)];
}

- (void)_finishTaskWithResult:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (![(AMSTask *)self isFinished])
  {
    id v7 = [(AMSSystemEngagementTask *)self underlyingRemoteConnection];
    [v7 invalidate];

    [(AMSSystemEngagementTask *)self setUnderlyingRemoteConnection:0];
    [(AMSSystemEngagementTask *)self setError:v6];
    [(AMSSystemEngagementTask *)self setResult:v10];
    int v8 = [(AMSSystemEngagementTask *)self dispatchGroup];

    if (v8)
    {
      id v9 = [(AMSSystemEngagementTask *)self dispatchGroup];
      dispatch_group_leave(v9);
    }
  }
}

- (void)_invalidateRemoteAlert
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AMSSystemEngagementTask__invalidateRemoteAlert__block_invoke;
  block[3] = &unk_1E559EA90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__AMSSystemEngagementTask__invalidateRemoteAlert__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteAlertHandle];
  [v2 unregisterObserver:*(void *)(a1 + 32)];

  v3 = [*(id *)(a1 + 32) remoteAlertHandle];
  [v3 invalidate];

  [*(id *)(a1 + 32) setPresentationTargetHandle:0];
  v4 = [*(id *)(a1 + 32) displayWillForegroundToken];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v6 = [*(id *)(a1 + 32) displayWillForegroundToken];
    [v5 removeObserver:v6];

    [*(id *)(a1 + 32) setDisplayWillForegroundToken:0];
  }
  id v7 = [*(id *)(a1 + 32) displayDidBecomeActiveToken];

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = [*(id *)(a1 + 32) displayDidBecomeActiveToken];
    [v8 removeObserver:v9];

    [*(id *)(a1 + 32) setDisplayDidBecomeActiveToken:0];
  }
  id v10 = [*(id *)(a1 + 32) displayLayoutMonitor];
  [v10 invalidate];

  uint64_t v11 = *(void **)(a1 + 32);
  return [v11 setDisplayLayoutMonitor:0];
}

- (void)_listenForAppForegroundWithHandle:(id)a3 monitorInApp:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(AMSTask *)self isFinished];
  if (v6 && !v7)
  {
    int v8 = [v6 bundleIdentifier];
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      int v12 = [(AMSSystemEngagementTask *)self request];
      uint64_t v13 = [v12 logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v63 = v11;
      __int16 v64 = 2114;
      v65 = v13;
      __int16 v66 = 2112;
      uint64_t v67 = v8;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Listening for app foreground: %@", buf, 0x20u);
    }
    int v14 = [(AMSSystemEngagementTask *)self presentationTargetHandle];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      id v61 = 0;
      int v16 = [MEMORY[0x1E4F963E8] handleForLegacyHandle:v6 error:&v61];
      id v17 = v61;
      objc_initWeak((id *)buf, self);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke;
      v59[3] = &unk_1E55A6E60;
      objc_copyWeak(&v60, (id *)buf);
      [v16 monitorForDeath:v59];
      [(AMSSystemEngagementTask *)self setPresentationTargetHandle:v16];
      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)buf);
    }
    uint64_t v18 = +[AMSLogConfig sharedConfig];
    v19 = (void *)v18;
    if (v4)
    {
      if (!v18)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = objc_opt_class();
        __int16 v22 = [(AMSSystemEngagementTask *)self request];
        id v23 = [v22 logKey];
        *(_DWORD *)buf = 138543618;
        uint64_t v63 = v21;
        __int16 v64 = 2114;
        v65 = v23;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Monitoring for in app notifications", buf, 0x16u);
      }
      uint64_t v24 = [(AMSSystemEngagementTask *)self displayDidBecomeActiveToken];
      BOOL v25 = v24 == 0;

      if (v25)
      {
        v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_101;
        v58[3] = &unk_1E55A6E88;
        v58[4] = self;
        v27 = [v26 addObserverForName:@"UIApplicationDidBecomeActiveNotification" object:0 queue:0 usingBlock:v58];
        [(AMSSystemEngagementTask *)self setDisplayDidBecomeActiveToken:v27];
      }
      uint64_t v28 = [(AMSSystemEngagementTask *)self displayWillForegroundToken];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_106;
        v57[3] = &unk_1E55A6E88;
        v57[4] = self;
        id v31 = [v30 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:v57];
        [(AMSSystemEngagementTask *)self setDisplayWillForegroundToken:v31];
      }
    }
    else
    {
      if (!v18)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v32 = [v19 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = objc_opt_class();
        v34 = [(AMSSystemEngagementTask *)self request];
        v35 = [v34 logKey];
        v36 = [(AMSSystemEngagementTask *)self displayLayoutMonitor];
        *(_DWORD *)buf = 138543874;
        uint64_t v63 = v33;
        __int16 v64 = 2114;
        v65 = v35;
        __int16 v66 = 2112;
        uint64_t v67 = v36;
        _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Monitoring for app forgrond: %@", buf, 0x20u);
      }
      v37 = [(AMSSystemEngagementTask *)self displayLayoutMonitor];
      BOOL v38 = v37 == 0;

      if (v38)
      {
        objc_initWeak(&location, self);
        v39 = +[AMSLogConfig sharedConfig];
        if (!v39)
        {
          v39 = +[AMSLogConfig sharedConfig];
        }
        v40 = [v39 OSLogObject];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = objc_opt_class();
          id v42 = [(AMSSystemEngagementTask *)self request];
          v43 = [v42 logKey];
          id v44 = [(AMSSystemEngagementTask *)self displayLayoutMonitor];
          *(_DWORD *)buf = 138543874;
          uint64_t v63 = v41;
          __int16 v64 = 2114;
          v65 = v43;
          __int16 v66 = 2112;
          uint64_t v67 = v44;
          _os_log_impl(&dword_18D554000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] (2) Monitoring for app forgrond: %@", buf, 0x20u);
        }
        v45 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_108;
        v53[3] = &unk_1E55A6EB0;
        objc_copyWeak(&v55, &location);
        id v54 = v8;
        [v45 setTransitionHandler:v53];
        [v45 setNeedsUserInteractivePriority:1];
        id v46 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v45];
        [(AMSSystemEngagementTask *)self setDisplayLayoutMonitor:v46];

        v47 = +[AMSLogConfig sharedConfig];
        if (!v47)
        {
          v47 = +[AMSLogConfig sharedConfig];
        }
        id v48 = [v47 OSLogObject];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v49 = objc_opt_class();
          uint64_t v50 = [(AMSSystemEngagementTask *)self request];
          v51 = [v50 logKey];
          uint64_t v52 = [(AMSSystemEngagementTask *)self displayLayoutMonitor];
          *(_DWORD *)buf = 138543874;
          uint64_t v63 = v49;
          __int16 v64 = 2114;
          v65 = v51;
          __int16 v66 = 2112;
          uint64_t v67 = v52;
          _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] (3) Monitoring for app forgrond: %@", buf, 0x20u);
        }
        objc_destroyWeak(&v55);

        objc_destroyWeak(&location);
      }
    }
  }
}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [WeakRetained request];
    id v6 = [v5 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    int v14 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App has died", buf, 0x16u);
  }
  id v9 = @"AMSEngagementPresented";
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  int v8 = AMSCustomError(@"AMSErrorDomain", 12, @"System Engagement Task Failed", @"App terminated", v7, 0);

  [WeakRetained _finishTaskWithResult:0 error:v8];
}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_101(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 32) request];
    id v6 = [v5 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    __int16 v13 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App foregrounded (did become active)", buf, 0x16u);
  }
  BOOL v7 = *(void **)(a1 + 32);
  id v9 = 0;
  [v7 _activateIfWithError:&v9];
  id v8 = v9;
  if (v8) {
    [*(id *)(a1 + 32) _finishTaskWithResult:0 error:v8];
  }
}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_106(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 32) request];
    id v6 = [v5 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    __int16 v13 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App foregrounded (will become active)", buf, 0x16u);
  }
  BOOL v7 = *(void **)(a1 + 32);
  id v9 = 0;
  [v7 _activateIfWithError:&v9];
  id v8 = v9;
  if (v8) {
    [*(id *)(a1 + 32) _finishTaskWithResult:0 error:v8];
  }
}

void __74__AMSSystemEngagementTask__listenForAppForegroundWithHandle_monitorInApp___block_invoke_108(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  id v7 = a3;
  id v39 = a4;
  uint64_t v44 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v40 = v7;
  obuint64_t j = [v7 elements];
  uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
  if (!v9)
  {
    uint64_t v24 = v7;
    goto LABEL_37;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v53;
  uint64_t v46 = -1;
  uint64_t v42 = *(void *)v53;
  id v43 = WeakRetained;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v53 != v11) {
        objc_enumerationMutation(obj);
      }
      __int16 v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [v13 bundleIdentifier];
        int v15 = [v14 isEqualToString:*(void *)(v44 + 32)];

        if (v15) {
          uint64_t v46 = [v13 level];
        }
      }
      int v16 = +[AMSLogConfig sharedConfig];
      if (!v16)
      {
        int v16 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_opt_class();
        v19 = [WeakRetained request];
        uint64_t v20 = [v19 logKey];
        uint64_t v21 = v10;
        uint64_t v22 = [v13 level];
        id v23 = [v13 bundleIdentifier];
        *(_DWORD *)buf = 138544386;
        uint64_t v58 = v18;
        __int16 v59 = 2114;
        id v60 = v20;
        __int16 v61 = 2048;
        uint64_t v62 = v22;
        uint64_t v10 = v21;
        __int16 v63 = 2112;
        __int16 v64 = v23;
        __int16 v65 = 1024;
        int v66 = v46;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Level: %ld Bundle: %@ appLevel: %d", buf, 0x30u);

        uint64_t v11 = v42;
        id WeakRetained = v43;
      }
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
  }
  while (v10);

  uint64_t v24 = v40;
  if ((v46 & 0x8000000000000000) == 0)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    BOOL v25 = [v40 elements];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = WeakRetained;
      uint64_t v29 = *(void *)v49;
      char v30 = 1;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v49 != v29) {
            objc_enumerationMutation(v25);
          }
          uint64_t v32 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          if ([v32 level] == v46)
          {
            uint64_t v33 = [v32 bundleIdentifier];

            if (!v33) {
              char v30 = 0;
            }
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v27);

      id WeakRetained = v28;
      if ((v30 & 1) == 0) {
        goto LABEL_38;
      }
    }
    else
    {
    }
    v34 = +[AMSLogConfig sharedConfig];
    if (!v34)
    {
      v34 = +[AMSLogConfig sharedConfig];
    }
    v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = objc_opt_class();
      v37 = [WeakRetained request];
      BOOL v38 = [v37 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v58 = v36;
      __int16 v59 = 2114;
      id v60 = v38;
      _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App foregrounded", buf, 0x16u);
    }
    id v47 = 0;
    [WeakRetained _activateIfWithError:&v47];
    obuint64_t j = v47;
    if (obj) {
      [WeakRetained _finishTaskWithResult:0 error:obj];
    }
    else {
      obuint64_t j = 0;
    }
LABEL_37:
  }
LABEL_38:
}

- (id)_processIdentifierForBundleIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:a3];
  id v17 = 0;
  uint64_t v4 = [MEMORY[0x1E4F963E8] handleForPredicate:v3 error:&v17];
  id v5 = v17;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    __int16 v22 = 2114;
    id v23 = v5;
    uint64_t v10 = "%{public}@: [%{public}@] Failed to fetch handle: %{public}@";
    uint64_t v11 = v7;
    uint32_t v12 = 32;
LABEL_11:
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);

LABEL_12:
    int v15 = 0;
    goto LABEL_13;
  }
  uint64_t v13 = [v4 pid];
  if ((v13 + 1) <= 1)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v14 = objc_opt_class();
    uint64_t v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v14;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    uint64_t v10 = "%{public}@: [%{public}@] Failed to fetch handle. -1 or 0";
    uint64_t v11 = v7;
    uint32_t v12 = 22;
    goto LABEL_11;
  }
  int v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v13];
LABEL_13:

  return v15;
}

- (id)_snapshotBagDataPromise
{
  v3 = [(AMSSystemEngagementTask *)self bag];

  if (v3)
  {
    uint64_t v4 = objc_alloc_init(AMSPromise);
    id v5 = [(AMSSystemEngagementTask *)self bag];
    id v6 = [(AMSPromise *)v4 completionHandlerAdapter];
    [v5 createSnapshotWithCompletion:v6];

    [(AMSPromise *)v4 thenWithBlock:&__block_literal_global_126];
  }
  else
  {
    AMSError(12, @"Snapshot failed", @"Bag was not provided", 0);
    uint64_t v4 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:v4];
  id v7 = };

  return v7;
}

uint64_t __50__AMSSystemEngagementTask__snapshotBagDataPromise__block_invoke(uint64_t a1, void *a2)
{
  return [a2 compile];
}

- (id)_unlockDeviceIfNeeded
{
  id v2 = objc_alloc_init(AMSMutableBinaryPromise);
  SBSGetScreenLockStatus();
  [(AMSMutableBinaryPromise *)v2 finishWithSuccess];
  return v2;
}

void __48__AMSSystemEngagementTask__unlockDeviceIfNeeded__block_invoke(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 finishWithSuccess];
  }
  else
  {
    AMSError(11, @"Failed to unlock", 0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v4];
  }
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSUIDynamic";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (BOOL)disablePresentationTarget
{
  return self->_disablePresentationTarget;
}

- (void)setDisablePresentationTarget:(BOOL)a3
{
  self->_disablePresentationTarget = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (NSObject)displayDidBecomeActiveToken
{
  return self->_displayDidBecomeActiveToken;
}

- (void)setDisplayDidBecomeActiveToken:(id)a3
{
}

- (NSObject)displayWillForegroundToken
{
  return self->_displayWillForegroundToken;
}

- (void)setDisplayWillForegroundToken:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (RBSProcessHandle)presentationTargetHandle
{
  return self->_presentationTargetHandle;
}

- (void)setPresentationTargetHandle:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (AMSEngagementResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSXPCConnection)underlyingRemoteConnection
{
  return self->_underlyingRemoteConnection;
}

- (void)setUnderlyingRemoteConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRemoteConnection, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_presentationTargetHandle, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_displayWillForegroundToken, 0);
  objc_storeStrong((id *)&self->_displayDidBecomeActiveToken, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end