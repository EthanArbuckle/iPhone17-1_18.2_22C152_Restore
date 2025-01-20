@interface LNEmbeddedApplicationConnection
+ (Class)connectionOptionsClass;
+ (NSOperationQueue)sharedOpenApplicationOperationQueue;
+ (id)optionsForAction:(id)a3 interactionMode:(int64_t)a4 source:(unsigned __int16)a5 sourceOverride:(id)a6;
- (BOOL)refreshWithOptions:(id)a3;
- (FBSOpenApplicationService)openApplicationService;
- (LNEmbeddedApplicationConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8;
- (PDCPreflightManager)preflightManager;
- (id)linkConnectionActionWithOpenApplicationIdentifier:(id)a3 connectionAction:(id)a4 connectionOperation:(id)a5;
- (void)connectWithOptions:(id)a3;
- (void)enqueueOpenApplicationOperation:(id)a3;
- (void)openApplicationWithOptions:(id)a3 connectionAction:(id)a4 completionHandler:(id)a5;
- (void)resumeOpenApplicationOperationQueue;
@end

@implementation LNEmbeddedApplicationConnection

+ (Class)connectionOptionsClass
{
  return (Class)objc_opt_class();
}

- (BOOL)refreshWithOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LNEmbeddedApplicationConnection;
  BOOL v5 = [(LNConnection *)&v16 refreshWithOptions:v4];
  if (v5)
  {
    v6 = [(LNConnection *)self queue];
    dispatch_assert_queue_V2(v6);

    id v7 = v4;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v9 = v8;

    v10 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [(LNConnection *)self logPrefix];
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_INFO, "%{public}@ refreshWithOptions: %{public}@", buf, 0x16u);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke;
    v14[3] = &unk_1E5B3A0D8;
    v14[4] = self;
    id v15 = v9;
    id v12 = v9;
    [(LNEmbeddedApplicationConnection *)self enqueueOpenApplicationOperation:v14];
  }
  return v5;
}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v9 = *(void *)(a1 + 40);
      int v18 = 138543874;
      __int16 v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      id v23 = v5;
      v10 = "%{public}@ %{public}@ completed with response: %{public}@";
      v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_7:
      uint32_t v15 = 32;
LABEL_8:
      _os_log_impl(&dword_1A4419000, v11, v12, v10, (uint8_t *)&v18, v15);
    }
  }
  else
  {
    v13 = getLNLogCategoryConnection();
    id v7 = v13;
    if (!v6)
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      v8 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138543618;
      __int16 v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      v10 = "%{public}@ %{public}@ completed with no response and no error";
      v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v15 = 22;
      goto LABEL_8;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v8 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v14 = *(void *)(a1 + 40);
      int v18 = 138543874;
      __int16 v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      id v23 = v6;
      v10 = "%{public}@ %{public}@ completed with error: %{public}@";
      v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }
LABEL_9:

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v16);
  [*(id *)(a1 + 32) resumeOpenApplicationOperationQueue];
}

void __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) state] == 1)
  {
    id v7 = *(void **)(a1 + 32);
    if (v5) {
      [v7 handleConnectionActionResponse:v5];
    }
    else {
      [v7 setDisconnectedWithError:v6];
    }
  }
  else
  {
    v8 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v10 = [*(id *)(a1 + 32) state];
      if ((unint64_t)(v10 - 1) > 2) {
        v11 = @"Not Connected";
      }
      else {
        v11 = off_1E5B3A238[v10 - 1];
      }
      os_log_type_t v12 = v11;
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
    }
  }
}

- (void)connectWithOptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LNEmbeddedApplicationConnection;
  [(LNConnection *)&v13 connectWithOptions:v4];
  id v5 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [(LNConnection *)self logPrefix];
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v10;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_INFO, "%{public}@ connectWithOptions: %{public}@", buf, 0x16u);
  }
  if (![(LNConnection *)self connectUsingProcessIdentifierWithOptions:v6 setupWithAssertions:0])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke;
    v11[3] = &unk_1E5B3A0D8;
    v11[4] = self;
    id v12 = v8;
    [(LNEmbeddedApplicationConnection *)self enqueueOpenApplicationOperation:v11];
  }
}

- (void)enqueueOpenApplicationOperation:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"LNEmbeddedApplicationConnection.m", 415, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
  }
  id v6 = [(id)objc_opt_class() sharedOpenApplicationOperationQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__LNEmbeddedApplicationConnection_enqueueOpenApplicationOperation___block_invoke;
  v9[3] = &unk_1E5B395F8;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v9];
  [v6 setSuspended:1];
}

- (void)resumeOpenApplicationOperationQueue
{
  id v2 = [(id)objc_opt_class() sharedOpenApplicationOperationQueue];
  [v2 setSuspended:0];
}

+ (NSOperationQueue)sharedOpenApplicationOperationQueue
{
  if (sharedOpenApplicationOperationQueue_onceToken != -1) {
    dispatch_once(&sharedOpenApplicationOperationQueue_onceToken, &__block_literal_global_3880);
  }
  id v2 = (void *)sharedOpenApplicationOperationQueue_operationQueue;
  return (NSOperationQueue *)v2;
}

uint64_t __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = (void *)[v3 newConnectionAction];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke_2;
  v5[3] = &unk_1E5B38CD8;
  v5[4] = *(void *)(a1 + 32);
  [v2 openApplicationWithOptions:v3 connectionAction:v4 completionHandler:v5];
}

- (void)openApplicationWithOptions:(id)a3 connectionAction:(id)a4 completionHandler:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v70 = a4;
  id v10 = a5;
  if (!v10)
  {
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, self, @"LNEmbeddedApplicationConnection.m", 228, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v11 = [(LNConnection *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = NSString;
  objc_super v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = [v12 stringWithFormat:@"Open App Request ID: %@", v13];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5B38D28;
  aBlock[4] = self;
  __int16 v15 = v14;
  v86 = v15;
  id v16 = v10;
  id v87 = v16;
  id v17 = (void (**)(void *, void, id))_Block_copy(aBlock);
  id v73 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v9 sceneless])
  {
    id v18 = objc_alloc(MEMORY[0x1E4F223C8]);
    __int16 v19 = [(LNConnection *)self bundleIdentifier];
    id v84 = 0;
    __int16 v20 = (void *)[v18 initWithBundleIdentifier:v19 allowPlaceholder:0 error:&v84];
    id v21 = v84;

    if (v21)
    {
      v17[2](v17, 0, v21);
LABEL_11:

      v27 = v70;
      goto LABEL_44;
    }
    uint64_t v24 = [(LNEmbeddedApplicationConnection *)self preflightManager];
    int v25 = [v24 requiresPreflightForApplicationRecord:v20];

    if (v25)
    {
      v26 = LNConnectionErrorWithCode(1700);
      v17[2](v17, 0, v26);

      goto LABEL_11;
    }
    v45 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v20, "supportsMultiwindow"));
    [v73 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4FA7120]];

    goto LABEL_29;
  }
  int v22 = [v9 actionSource];
  if (v22 == 7)
  {
    id v23 = (void *)MEMORY[0x1E4FA7090];
  }
  else
  {
    if (v22 != 6) {
      goto LABEL_14;
    }
    id v23 = (void *)MEMORY[0x1E4FA7078];
  }
  [v73 setObject:*v23 forKeyedSubscript:*MEMORY[0x1E4F62658]];
LABEL_14:
  if (([v9 activateSuspended] & 1) == 0)
  {
    id v68 = v16;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v28 = [(LNConnection *)self executors];
    v29 = [v28 keyEnumerator];
    __int16 v20 = [v29 allObjects];

    uint64_t v30 = [v20 countByEnumeratingWithState:&v80 objects:v95 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      v69 = v17;
      v32 = self;
      v67 = v15;
      uint64_t v33 = *(void *)v81;
      uint64_t v72 = *MEMORY[0x1E4FA7098];
      uint64_t v71 = *MEMORY[0x1E4F62658];
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v81 != v33) {
            objc_enumerationMutation(v20);
          }
          uint64_t v35 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          v36 = [(LNConnection *)v32 executors];
          v37 = [v36 objectForKey:v35];

          v38 = [v37 delegate];
          char v39 = objc_opt_respondsToSelector();

          if (v39)
          {
            v40 = [v37 delegate];
            int v41 = [v40 progressIsPersistentInSystemApertureForExecutor:v37];

            if (v41) {
              [v73 setObject:v72 forKeyedSubscript:v71];
            }
          }
          v42 = [v37 delegate];
          char v43 = objc_opt_respondsToSelector();

          if (v43)
          {
            v44 = [v37 delegate];
            [v44 executorWillLaunchApplicationInForeground:v37];
          }
        }
        uint64_t v31 = [v20 countByEnumeratingWithState:&v80 objects:v95 count:16];
      }
      while (v31);
      __int16 v15 = v67;
      id v16 = v68;
      id v17 = v69;
      self = v32;
    }
LABEL_29:
  }
  uint64_t v46 = MEMORY[0x1E4F1CC38];
  [v73 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FA70E8]];
  v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v9, "activateSuspended"));
  [v73 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F625F8]];

  [v73 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F626A0]];
  [v73 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F62688]];
  if ([v9 sceneless]) {
    v48 = &unk_1EF7F4130;
  }
  else {
    v48 = &unk_1EF7F4148;
  }
  [v73 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F62650]];
  if ([v9 isCameraCaptureAction]) {
    [v73 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"__LaunchCameraCapture"];
  }
  v49 = [LNOpenApplicationConnectionOperation alloc];
  uint64_t v50 = [v9 openApplicationPriority];
  v51 = [(LNConnection *)self queue];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_49;
  v78[3] = &unk_1E5B38D50;
  v78[4] = self;
  v79 = v17;
  v52 = [(LNOpenApplicationConnectionOperation *)v49 initWithPriority:v50 queue:v51 completionHandler:v78];

  if (v70)
  {
    v53 = [(LNEmbeddedApplicationConnection *)self linkConnectionActionWithOpenApplicationIdentifier:v15 connectionAction:v70 connectionOperation:v52];
    v94 = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
    [v73 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F625E0]];
  }
  v55 = [v9 actionSourceOverride];

  if (v55)
  {
    v56 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = [(LNConnection *)self logPrefix];
      v58 = [v9 actionSourceOverride];
      *(_DWORD *)buf = 138543874;
      v89 = v57;
      __int16 v90 = 2114;
      v91 = self;
      __int16 v92 = 2114;
      id v93 = v58;
      _os_log_impl(&dword_1A4419000, v56, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Overriding launch origin: %{public}@", buf, 0x20u);
    }
    v59 = [v9 actionSourceOverride];
    [v73 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F62658]];
  }
  v60 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v73];
  v61 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    v62 = [(LNConnection *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    v89 = v62;
    __int16 v90 = 2114;
    v91 = v15;
    __int16 v92 = 2114;
    id v93 = v73;
    _os_log_impl(&dword_1A4419000, v61, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Opening app using FBSOpenApplicationService with options: %{public}@", buf, 0x20u);
  }
  v63 = [(LNEmbeddedApplicationConnection *)self openApplicationService];
  v64 = [(LNConnection *)self bundleIdentifier];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_52;
  v74[3] = &unk_1E5B38DA0;
  v74[4] = self;
  v75 = v15;
  v76 = v52;
  v27 = v70;
  id v77 = v70;
  v65 = v52;
  [v63 openApplication:v64 withOptions:v60 completion:v74];

LABEL_44:
}

- (PDCPreflightManager)preflightManager
{
  return self->_preflightManager;
}

- (FBSOpenApplicationService)openApplicationService
{
  return self->_openApplicationService;
}

- (id)linkConnectionActionWithOpenApplicationIdentifier:(id)a3 connectionAction:(id)a4 connectionOperation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v11 = (void *)getUILinkConnectionActionClass_softClass;
  uint64_t v30 = getUILinkConnectionActionClass_softClass;
  if (!getUILinkConnectionActionClass_softClass)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __getUILinkConnectionActionClass_block_invoke;
    v26[3] = &unk_1E5B39E50;
    v26[4] = &v27;
    __getUILinkConnectionActionClass_block_invoke((uint64_t)v26);
    v11 = (void *)v28[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v27, 8);
  int v13 = [v12 instancesRespondToSelector:sel_initWithAction_responseQueue_responseHandler_];
  id v14 = objc_alloc((Class)v12);
  if (v13)
  {
    id v15 = [(LNConnection *)self queue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke;
    v23[3] = &unk_1E5B38DC8;
    v23[4] = self;
    id v24 = v8;
    id v25 = v10;
    id v16 = v10;
    id v17 = v8;
    id v18 = (void *)[v14 initWithAction:v9 responseQueue:v15 responseHandler:v23];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_59;
    v20[3] = &unk_1E5B38DC8;
    v20[4] = self;
    id v21 = v8;
    id v22 = v10;
    id v17 = v10;
    id v15 = v8;
    id v18 = (void *)[v14 initWithAction:v9 responseHandler:v20];
  }
  return v18;
}

void __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v4, &v8);

  id v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) logPrefix];
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Received UILinkConnectionActionResponse callback on the response queue with action response: %{public}@", buf, 0x20u);
  }
  [*(id *)(a1 + 48) finishWithActionResponse:v3 error:0];
  os_activity_scope_leave(&v8);
}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2;
  block[3] = &unk_1E5B3A318;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __67__LNEmbeddedApplicationConnection_enqueueOpenApplicationOperation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
}

- (LNEmbeddedApplicationConnection)initWithEffectiveBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5 appIntentsEnabledOnly:(BOOL)a6 userIdentity:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)LNEmbeddedApplicationConnection;
  id v18 = [(LNApplicationConnection *)&v30 initWithEffectiveBundleIdentifier:v14 appBundleIdentifier:v15 processInstanceIdentifier:v16 appIntentsEnabledOnly:v10 userIdentity:v17 error:a8];
  if (v18)
  {
    uint64_t v19 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
    openApplicationService = v18->_openApplicationService;
    v18->_openApplicationService = (FBSOpenApplicationService *)v19;

    if (!v18->_openApplicationService)
    {
      id v21 = getLNLogCategoryConnection();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = [(LNConnection *)v18 logPrefix];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_1A4419000, v21, OS_LOG_TYPE_ERROR, "%{public}@ openApplicationService failed to initialize", (uint8_t *)&buf, 0xCu);
      }
    }
    id v23 = dispatch_get_global_queue(17, 0);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    id v24 = (void *)getPDCPreflightManagerClass_softClass;
    uint64_t v34 = getPDCPreflightManagerClass_softClass;
    if (!getPDCPreflightManagerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v36 = __getPDCPreflightManagerClass_block_invoke;
      v37 = &unk_1E5B39E50;
      v38 = &v31;
      __getPDCPreflightManagerClass_block_invoke((uint64_t)&buf);
      id v24 = (void *)v32[3];
    }
    id v25 = v24;
    _Block_object_dispose(&v31, 8);
    uint64_t v26 = [[v25 alloc] initWithTargetQueue:v23];
    preflightManager = v18->_preflightManager;
    v18->_preflightManager = (PDCPreflightManager *)v26;

    v28 = v18;
  }

  return v18;
}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_52(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v7 = [a1[4] activity];
  os_activity_scope_enter(v7, &state);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2_53;
  v15[3] = &unk_1E5B38D78;
  v15[4] = a1[4];
  id v8 = v6;
  id v16 = v8;
  id v9 = v5;
  id v17 = v9;
  id v18 = a1[5];
  id v19 = a1[6];
  id v20 = a1[7];
  BOOL v10 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))_Block_copy(v15);
  v10[2](v10, v11, v12, v13, v14);

  os_activity_scope_leave(&state);
}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2_53(id *a1)
{
  id v2 = [a1[4] queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5B38D78;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  id v9 = a1[7];
  id v10 = a1[8];
  id v11 = a1[9];
  dispatch_async(v2, v5);
}

uint64_t __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    id v2 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 48) logPrefix];
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543874;
      v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v4;
      __int16 v40 = 2114;
      uint64_t v41 = v5;
      _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Failed to open app with error: %{public}@", buf, 0x20u);
    }
    id v6 = *(void **)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 32);
    return [v6 finishWithActionResponse:0 error:v7];
  }
  id v9 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [*(id *)(a1 + 48) logPrefix];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543874;
    v37 = v10;
    __int16 v38 = 2114;
    uint64_t v39 = v11;
    __int16 v40 = 2114;
    uint64_t v41 = v12;
    _os_log_impl(&dword_1A4419000, v9, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Successfully opened app with process handle %{public}@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [*(id *)(a1 + 48) logPrefix];
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      *(_DWORD *)long long buf = 138543874;
      v37 = v14;
      __int16 v38 = 2114;
      uint64_t v39 = v15;
      __int16 v40 = 2114;
      uint64_t v41 = v16;
      id v17 = "%{public}@ [%{public}@]: OneShot actions don't need to wait for a response, finishing %{public}@";
      id v18 = v13;
      uint32_t v19 = 32;
LABEL_20:
      _os_log_impl(&dword_1A4419000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  uint64_t v20 = *(void *)(a1 + 72);
  uint64_t v13 = getLNLogCategoryConnection();
  BOOL v21 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v20)
  {
    if (v21)
    {
      uint64_t v14 = [*(id *)(a1 + 48) logPrefix];
      uint64_t v27 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138543618;
      v37 = v14;
      __int16 v38 = 2114;
      uint64_t v39 = v27;
      id v17 = "%{public}@ [%{public}@]: Completing with nil response because connection action wasn't provided";
      id v18 = v13;
      uint32_t v19 = 22;
      goto LABEL_20;
    }
LABEL_21:

    id v6 = *(void **)(a1 + 64);
    uint64_t v7 = 0;
    return [v6 finishWithActionResponse:0 error:v7];
  }
  if (v21)
  {
    id v22 = [*(id *)(a1 + 48) logPrefix];
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = *(void *)(a1 + 72);
    *(_DWORD *)long long buf = 138543874;
    v37 = v22;
    __int16 v38 = 2114;
    uint64_t v39 = v23;
    __int16 v40 = 2114;
    uint64_t v41 = v24;
    _os_log_impl(&dword_1A4419000, v13, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Completion will be handled by UILinkConnectionActionResponse to UILinkConnectionAction(%{public}@)", buf, 0x20u);
  }
  id v25 = [*(id *)(a1 + 40) auditToken];
  uint64_t v26 = v25;
  if (v25)
  {
    [v25 realToken];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  v28 = *(void **)(a1 + 48);
  v33[0] = v34;
  v33[1] = v35;
  [v28 setAuditToken:v33];

  uint64_t v29 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    objc_super v30 = [*(id *)(a1 + 48) logPrefix];
    uint64_t v31 = *(void *)(a1 + 56);
    uint64_t v32 = *(void *)(a1 + 64);
    *(_DWORD *)long long buf = 138543874;
    v37 = v30;
    __int16 v38 = 2114;
    uint64_t v39 = v31;
    __int16 v40 = 2114;
    uint64_t v41 = v32;
    _os_log_impl(&dword_1A4419000, v29, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Enqueuing %{public}@ in order to acquire an assertion", buf, 0x20u);
  }
  return [*(id *)(a1 + 48) enqueueConnectionOperation:*(void *)(a1 + 64)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_openApplicationService, 0);
}

void __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v4 = [*(id *)(a1 + 32) activity];
  os_activity_scope_enter(v4, &state);

  uint64_t v5 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) logPrefix];
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543874;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    id v19 = v3;
    _os_log_impl(&dword_1A4419000, v5, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Received UILinkConnectionActionResponse callback with action response: %{public}@", buf, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_60;
  v10[3] = &unk_1E5B3A0D8;
  id v11 = *(id *)(a1 + 48);
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v8, v10);

  os_activity_scope_leave(&state);
}

uint64_t __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_60(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithActionResponse:*(void *)(a1 + 40) error:0];
}

uint64_t __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_2;
  v4[3] = &unk_1E5B38CD8;
  v4[4] = v2;
  return [v2 openApplicationWithOptions:v1 connectionAction:0 completionHandler:v4];
}

void __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) state] == 2)
  {
    if (v6)
    {
      [*(id *)(a1 + 32) setDisconnectedWithError:v6];
    }
    else
    {
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      id v11 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_14;
      v13[3] = &unk_1E5B38D00;
      objc_copyWeak(&v15, (id *)location);
      id v14 = 0;
      [v11 setUpConnectionContextWithAssertions:0 completionHandler:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    uint64_t v7 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) logPrefix];
      uint64_t v9 = [*(id *)(a1 + 32) state];
      if ((unint64_t)(v9 - 1) > 2) {
        id v10 = @"Not Connected";
      }
      else {
        id v10 = off_1E5B3A238[v9 - 1];
      }
      id v12 = v10;
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v8;
      __int16 v17 = 2114;
      __int16 v18 = v12;
    }
  }
}

void __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = getLNLogCategoryConnection();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_ERROR, "Failed to set connection context: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v7 = [v5 xpcConnection];
    [v7 invalidate];

    [v5 setDisconnectedWithError:*(void *)(a1 + 32)];
  }
  else
  {
    [WeakRetained setConnected];
  }
}

uint64_t __70__LNEmbeddedApplicationConnection_sharedOpenApplicationOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v1 = (void *)sharedOpenApplicationOperationQueue_operationQueue;
  sharedOpenApplicationOperationQueue_operationQueue = (uint64_t)v0;

  id v2 = (void *)sharedOpenApplicationOperationQueue_operationQueue;
  return [v2 setMaxConcurrentOperationCount:1];
}

+ (id)optionsForAction:(id)a3 interactionMode:(int64_t)a4 source:(unsigned __int16)a5 sourceOverride:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___LNEmbeddedApplicationConnection;
  id v11 = a6;
  id v12 = objc_msgSendSuper2(&v21, sel_optionsForAction_interactionMode_source_sourceOverride_, v10, a4, v7, v11);
  uint64_t v13 = objc_msgSend(v10, "presentationStyle", v21.receiver, v21.super_class);
  if ((unint64_t)(v13 - 1) >= 2)
  {
    if (!v13)
    {
      [v12 setOpenApplicationPriority:1];
      [v12 setSceneless:1];
      id v14 = [v10 systemProtocols];
      id v15 = [MEMORY[0x1E4F72710] pushToTalkTransmissionProtocol];
      int v16 = [v14 containsObject:v15];

      if (v16) {
        [v12 setOpenApplicationPriority:3];
      }
    }
  }
  else
  {
    [v12 setOpenApplicationPriority:2];
    [v12 setSceneless:0];
  }
  if (v7 == 3) {
    [v12 setAllowsForegroundAppLaunchWhileInCarPlay:0];
  }
  __int16 v17 = [v10 systemProtocols];
  __int16 v18 = [MEMORY[0x1E4F72710] cameraCaptureProtocol];
  int v19 = [v17 containsObject:v18];

  if (v19) {
    [v12 setIsCameraCaptureAction:1];
  }
  [v12 setActionSource:v7];
  [v12 setActionSourceOverride:v11];

  return v12;
}

@end