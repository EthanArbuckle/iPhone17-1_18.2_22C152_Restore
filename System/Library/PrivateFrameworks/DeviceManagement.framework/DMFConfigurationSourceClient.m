@interface DMFConfigurationSourceClient
+ (id)activeRestrictionsURL;
+ (id)setOfActiveRestrictionUUIDs;
+ (void)setOfActiveRestrictionUUIDs;
- (BOOL)isInvalid;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CATOperationQueue)operationQueue;
- (DMFConfigurationSourceClient)init;
- (DMFConfigurationSourceClient)initWithConnection:(id)a3 organizationIdentifier:(id)a4 displayName:(id)a5 localMachServiceName:(id)a6;
- (DMFConfigurationSourceClientDelegate)delegate;
- (DMFConnection)connection;
- (DMFReportingRequirements)reportingRequirements;
- (NSObject)reportingRequirementsLock;
- (NSString)configurationSourceName;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)machServiceName;
- (NSString)organizationIdentifier;
- (NSXPCConnection)incomingConnection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)registerConfigurationSource;
- (id)stateDescription;
- (unint64_t)state;
- (void)assetResolutionOperationDidFinish:(id)a3 completion:(id)a4;
- (void)configurationEngineRequestedAsset:(id)a3 completion:(id)a4;
- (void)configurationEventsDidChange:(id)a3 completion:(id)a4;
- (void)configurationStatusDidChange:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)enqueueOperationToReportEvents:(id)a3 completion:(id)a4;
- (void)enqueueOperationToReportStatusChange:(id)a3 completion:(id)a4;
- (void)enqueueOperationToResolveAsset:(id)a3 completion:(id)a4;
- (void)eventsReportingOperationDidFinish:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)probe:(id)a3;
- (void)registerConfigurationSourceIfNeeded;
- (void)registrationOperationDidFinish:(id)a3;
- (void)resume;
- (void)setConfigurationSourceName:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncomingConnection:(id)a3;
- (void)setListener:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setRegisterConfigurationSource:(id)a3;
- (void)setReportingRequirements:(id)a3;
- (void)setReportingRequirementsLock:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)statusReportingOperationDidFinish:(id)a3 completion:(id)a4;
@end

@implementation DMFConfigurationSourceClient

- (DMFConfigurationSourceClient)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"DMFConfigurationSourceClient.m", 60, @"%@ cannot call %@", self, v5 object file lineNumber description];

  return [(DMFConfigurationSourceClient *)self initWithConnection:0 organizationIdentifier:0 displayName:0 localMachServiceName:0];
}

- (DMFConfigurationSourceClient)initWithConnection:(id)a3 organizationIdentifier:(id)a4 displayName:(id)a5 localMachServiceName:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"DMFConfigurationSourceClient.m", 68, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  if (![v13 length])
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"DMFConfigurationSourceClient.m", 69, @"Invalid parameter not satisfying: %@", @"organizationIdentifier.length > 0" object file lineNumber description];
  }
  if (![v14 length])
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"DMFConfigurationSourceClient.m", 70, @"Invalid parameter not satisfying: %@", @"displayName.length > 0" object file lineNumber description];
  }
  v45.receiver = self;
  v45.super_class = (Class)DMFConfigurationSourceClient;
  v16 = [(DMFConfigurationSourceClient *)&v45 init];
  v17 = v16;
  if (v16)
  {
    id v18 = [(DMFConfigurationSourceClient *)v16 description];
    dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 UTF8String], 0);
    serialQueue = v17->_serialQueue;
    v17->_serialQueue = (OS_dispatch_queue *)v19;

    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)v17->_serialQueue);
    registerConfigurationSource = v17->_registerConfigurationSource;
    v17->_registerConfigurationSource = (OS_dispatch_source *)v21;

    objc_initWeak(&location, v17);
    v23 = v17->_registerConfigurationSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __107__DMFConfigurationSourceClient_initWithConnection_organizationIdentifier_displayName_localMachServiceName___block_invoke;
    handler[3] = &unk_1E63723C8;
    objc_copyWeak(&v43, &location);
    dispatch_source_set_event_handler(v23, handler);
    v24 = [(DMFConfigurationSourceClient *)v17 registerConfigurationSource];
    dispatch_resume(v24);

    objc_storeStrong((id *)&v17->_connection, a3);
    if (v15)
    {
      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v15];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F29290] anonymousListener];
    }
    listener = v17->_listener;
    v17->_listener = (NSXPCListener *)v25;

    [(NSXPCListener *)v17->_listener setDelegate:v17];
    [(NSXPCListener *)v17->_listener _setQueue:v17->_serialQueue];
    uint64_t v27 = objc_opt_new();
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = (CATOperationQueue *)v27;

    v29 = [(DMFConfigurationSourceClient *)v17 description];
    [(CATOperationQueue *)v17->_operationQueue setName:v29];

    [(CATOperationQueue *)v17->_operationQueue setUnderlyingQueue:v17->_serialQueue];
    uint64_t v30 = [v14 copy];
    configurationSourceName = v17->_configurationSourceName;
    v17->_configurationSourceName = (NSString *)v30;

    uint64_t v32 = [v13 copy];
    organizationIdentifier = v17->_organizationIdentifier;
    v17->_organizationIdentifier = (NSString *)v32;

    uint64_t v34 = [v15 copy];
    machServiceName = v17->_machServiceName;
    v17->_machServiceName = (NSString *)v34;

    uint64_t v36 = objc_opt_new();
    reportingRequirementsLock = v17->_reportingRequirementsLock;
    v17->_reportingRequirementsLock = v36;

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __107__DMFConfigurationSourceClient_initWithConnection_organizationIdentifier_displayName_localMachServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained registerConfigurationSourceIfNeeded];
}

- (void)dealloc
{
  if ([(DMFConfigurationSourceClient *)self state] && [(DMFConfigurationSourceClient *)self state] != 4)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"DMFConfigurationSourceClient.m", 105, @"%@ must be invalidated before it's deallocated", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)DMFConfigurationSourceClient;
  [(DMFConfigurationSourceClient *)&v5 dealloc];
}

- (DMFReportingRequirements)reportingRequirements
{
  v3 = self->_reportingRequirementsLock;
  objc_sync_enter(v3);
  v4 = self->_reportingRequirements;
  objc_sync_exit(v3);

  return v4;
}

- (void)setReportingRequirements:(id)a3
{
  v4 = (DMFReportingRequirements *)[a3 copy];
  objc_super v5 = self->_reportingRequirementsLock;
  objc_sync_enter(v5);
  reportingRequirements = self->_reportingRequirements;
  self->_reportingRequirements = v4;
  v7 = v4;

  objc_sync_exit(v5);
  v8 = [(DMFConfigurationSourceClient *)self registerConfigurationSource];
  dispatch_source_merge_data(v8, 1uLL);
}

- (void)resume
{
  v4 = [(DMFConfigurationSourceClient *)self serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__DMFConfigurationSourceClient_resume__block_invoke;
  v5[3] = &unk_1E63723F0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __38__DMFConfigurationSourceClient_resume__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state])
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  [*(id *)(a1 + 32) setState:1];
  v2 = [*(id *)(a1 + 32) listener];
  [v2 resume];

  v4 = [*(id *)(a1 + 32) registerConfigurationSource];
  dispatch_source_merge_data(v4, 1uLL);
}

- (void)invalidate
{
  v3 = [(DMFConfigurationSourceClient *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke;
  block[3] = &unk_1E63722B0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) state] || (objc_msgSend(*(id *)(a1 + 32), "isInvalid") & 1) == 0)
  {
    v2 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v3;
      _os_log_impl(&dword_1BE0E2000, v2, OS_LOG_TYPE_INFO, "Invalidating configuration source %{public}@...", buf, 0xCu);
    }

    v4 = dispatch_group_create();
    objc_super v5 = [*(id *)(a1 + 32) listener];
    [v5 invalidate];

    v6 = [*(id *)(a1 + 32) incomingConnection];

    if (v6)
    {
      dispatch_group_enter(v4);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_28;
      v25[3] = &unk_1E63722B0;
      v26 = v4;
      v7 = [*(id *)(a1 + 32) incomingConnection];
      [v7 setInvalidationHandler:v25];

      v8 = [*(id *)(a1 + 32) incomingConnection];
      [v8 invalidate];
    }
    v9 = [*(id *)(a1 + 32) operationQueue];
    [v9 cancelAllOperations];

    dispatch_group_enter(v4);
    v10 = (void *)MEMORY[0x1E4F28B48];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_2;
    v23[3] = &unk_1E63722B0;
    v11 = v4;
    v24 = v11;
    id v12 = [v10 blockOperationWithBlock:v23];
    id v13 = [*(id *)(a1 + 32) operationQueue];
    id v14 = [v13 operations];
    objc_msgSend(v12, "cat_addDependencies:", v14);

    id v15 = [*(id *)(a1 + 32) operationQueue];
    [v15 addOperation:v12];

    dispatch_group_enter(v11);
    v16 = [*(id *)(a1 + 32) serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_3;
    block[3] = &unk_1E63722B0;
    v22 = v11;
    v17 = v11;
    dispatch_async(v16, block);

    id v18 = [*(id *)(a1 + 32) registerConfigurationSource];
    dispatch_suspend(v18);

    dispatch_queue_t v19 = [*(id *)(a1 + 32) serialQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__DMFConfigurationSourceClient_invalidate__block_invoke_4;
    v20[3] = &unk_1E63722B0;
    v20[4] = *(void *)(a1 + 32);
    dispatch_group_notify(v17, v19, v20);
  }
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_28(uint64_t a1)
{
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_2(uint64_t a1)
{
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_3(uint64_t a1)
{
}

void __42__DMFConfigurationSourceClient_invalidate__block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setState:4];
  v2 = [*(id *)(a1 + 32) registerConfigurationSource];
  dispatch_source_cancel(v2);

  uint64_t v3 = [*(id *)(a1 + 32) registerConfigurationSource];
  dispatch_resume(v3);

  [*(id *)(a1 + 32) setRegisterConfigurationSource:0];
  v4 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1BE0E2000, v4, OS_LOG_TYPE_INFO, "Did invalidate configuration source: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)stateDescription
{
  unint64_t v2 = [(DMFConfigurationSourceClient *)self state];
  if (v2 - 1 > 3) {
    return @"notStarted";
  }
  else {
    return off_1E6372410[v2 - 1];
  }
}

- (NSString)debugDescription
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"stateDescription";
  v6[1] = @"name";
  v6[2] = @"machService";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return (NSString *)v4;
}

- (NSString)description
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"name";
  v6[1] = @"machService";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return (NSString *)v4;
}

- (BOOL)isInvalid
{
  return [(DMFConfigurationSourceClient *)self state] - 3 < 0xFFFFFFFFFFFFFFFELL;
}

- (void)registerConfigurationSourceIfNeeded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v4);

  if (![(DMFConfigurationSourceClient *)self isInvalid])
  {
    uint64_t v5 = objc_opt_new();
    int v6 = [(DMFConfigurationSourceClient *)self configurationSourceName];
    [v5 setConfigurationSourceName:v6];

    uint64_t v7 = [(DMFConfigurationSourceClient *)self organizationIdentifier];
    [v5 setOrganizationIdentifier:v7];

    uint64_t v8 = [(DMFConfigurationSourceClient *)self machServiceName];
    [v5 setMachServiceName:v8];

    v9 = [(DMFConfigurationSourceClient *)self listener];
    v10 = [v9 endpoint];
    [v5 setListenerEndpoint:v10];

    v11 = [(DMFConfigurationSourceClient *)self reportingRequirements];
    [v5 setReportingRequirements:v11];

    id v12 = [(DMFConfigurationSourceClient *)self connection];
    id v13 = [v12 prepareOperationForRequest:v5];

    if (!v13)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      dispatch_queue_t v19 = [(DMFConfigurationSourceClient *)self connection];
      [v18 handleFailureInMethod:a2, self, @"DMFConfigurationSourceClient.m", 271, @"connection %@ did not return an operation for request: %@", v19, v5 object file lineNumber description];
    }
    id v14 = [(DMFConfigurationSourceClient *)self serialQueue];
    [v13 addTarget:self selector:sel_registrationOperationDidFinish_ forOperationEvents:6 delegateQueue:v14];

    id v15 = [(DMFConfigurationSourceClient *)self operationQueue];
    [v15 addOperation:v13];

    v16 = [(DMFConfigurationSourceClient *)self registerConfigurationSource];
    dispatch_suspend(v16);

    v17 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      dispatch_source_t v21 = v5;
      __int16 v22 = 2114;
      v23 = self;
      _os_log_impl(&dword_1BE0E2000, v17, OS_LOG_TYPE_INFO, "Performing registration request %{public}@ for %{public}@", buf, 0x16u);
    }
  }
}

- (void)registrationOperationDidFinish:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(DMFConfigurationSourceClient *)self registerConfigurationSource];
  dispatch_resume(v6);

  if (![(DMFConfigurationSourceClient *)self isInvalid])
  {
    if ([(DMFConfigurationSourceClient *)self state] == 1)
    {
      [(DMFConfigurationSourceClient *)self setState:2];
      uint64_t v7 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v14 = 138543362;
        id v15 = self;
        _os_log_impl(&dword_1BE0E2000, v7, OS_LOG_TYPE_INFO, "Configuration source resumed %{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
    uint64_t v8 = [v4 error];

    v9 = DMFConfigurationEngineLog();
    v10 = v9;
    if (!v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v14 = 138543362;
        id v15 = self;
        _os_log_impl(&dword_1BE0E2000, v10, OS_LOG_TYPE_INFO, "Registered as a configuration source: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(DMFConfigurationSourceClient *)(uint64_t)self registrationOperationDidFinish:v10];
    }

    v11 = [(DMFConfigurationSourceClient *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v10 = [(DMFConfigurationSourceClient *)self delegate];
      id v13 = [v4 error];
      [v10 configurationSourceDidFailToRegister:self withError:v13];

LABEL_13:
    }
  }
}

- (void)enqueueOperationToReportStatusChange:(id)a3 completion:(id)a4
{
  id v15 = a3;
  int v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(DMFConfigurationSourceClient *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && ([(DMFConfigurationSourceClient *)self delegate],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 operationToSendStatusUpdate:v15],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    if (v6)
    {
      char v12 = (void *)MEMORY[0x1C188B2F0](v6);
      id v13 = [(DMFConfigurationSourceClient *)self serialQueue];
      [v11 addTarget:self selector:sel_statusReportingOperationDidFinish_completion_ forOperationEvents:6 userInfo:v12 delegateQueue:v13];
    }
    int v14 = [(DMFConfigurationSourceClient *)self operationQueue];
    [v14 addOperation:v11];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TODO" code:1010 userInfo:0];
    v6[2](v6, v11);
  }
}

- (void)statusReportingOperationDidFinish:(id)a3 completion:(id)a4
{
  int v6 = (void (**)(id, id))a4;
  id v7 = a3;
  uint64_t v8 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 error];

  v6[2](v6, v9);
}

- (void)enqueueOperationToReportEvents:(id)a3 completion:(id)a4
{
  id v15 = a3;
  int v6 = (void (**)(id, void *))a4;
  id v7 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(DMFConfigurationSourceClient *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && ([(DMFConfigurationSourceClient *)self delegate],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 operationToSendEvents:v15],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    if (v6)
    {
      char v12 = (void *)MEMORY[0x1C188B2F0](v6);
      id v13 = [(DMFConfigurationSourceClient *)self serialQueue];
      [v11 addTarget:self selector:sel_eventsReportingOperationDidFinish_completion_ forOperationEvents:6 userInfo:v12 delegateQueue:v13];
    }
    int v14 = [(DMFConfigurationSourceClient *)self operationQueue];
    [v14 addOperation:v11];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TODO" code:1010 userInfo:0];
    v6[2](v6, v11);
  }
}

- (void)eventsReportingOperationDidFinish:(id)a3 completion:(id)a4
{
  int v6 = (void (**)(id, id))a4;
  id v7 = a3;
  uint64_t v8 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 error];

  v6[2](v6, v9);
}

- (void)enqueueOperationToResolveAsset:(id)a3 completion:(id)a4
{
  id v15 = a3;
  int v6 = (void (**)(id, void, void *))a4;
  id v7 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(DMFConfigurationSourceClient *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && ([(DMFConfigurationSourceClient *)self delegate],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 operationToResolveAsset:v15],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    char v12 = (void *)MEMORY[0x1C188B2F0](v6);
    id v13 = [(DMFConfigurationSourceClient *)self serialQueue];
    [v11 addTarget:self selector:sel_assetResolutionOperationDidFinish_completion_ forOperationEvents:6 userInfo:v12 delegateQueue:v13];

    int v14 = [(DMFConfigurationSourceClient *)self operationQueue];
    [v14 addOperation:v11];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TODO" code:1010 userInfo:0];
    v6[2](v6, 0, v11);
  }
}

- (void)assetResolutionOperationDidFinish:(id)a3 completion:(id)a4
{
  int v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  uint64_t v8 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v10 = [v7 resultObject];
  char v9 = [v7 error];

  v6[2](v6, v10, v9);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v5 valueForEntitlement:@"application-identifier"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v7 isEqualToString:@"com.apple.dmd"] & 1) == 0)
  {
    char v9 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DMFConfigurationSourceClient listener:shouldAcceptNewConnection:]();
    }
    BOOL v8 = 0;
    goto LABEL_8;
  }
  if (![(DMFConfigurationSourceClient *)self isInvalid])
  {
    v11 = [(DMFConfigurationSourceClient *)self incomingConnection];
    [v11 invalidate];

    [(DMFConfigurationSourceClient *)self setIncomingConnection:v5];
    char v12 = [(DMFConfigurationSourceClient *)self serialQueue];
    [v5 _setQueue:v12];

    id v13 = DMFConfigurationSourceClientXPCInterface();
    [v5 setExportedInterface:v13];

    [v5 setExportedObject:self];
    [v5 resume];
    char v9 = DMFConfigurationEngineLog();
    BOOL v8 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      id v15 = v5;
      _os_log_impl(&dword_1BE0E2000, v9, OS_LOG_TYPE_INFO, "new connection %{public}@", (uint8_t *)&v14, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (void)probe:(id)a3
{
}

- (void)configurationStatusDidChange:(id)a3 completion:(id)a4
{
  id v9 = a3;
  int v6 = (void (**)(id, void *))a4;
  id v7 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  if ([(DMFConfigurationSourceClient *)self isInvalid])
  {
    BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    v6[2](v6, v8);
  }
  else
  {
    [(DMFConfigurationSourceClient *)self enqueueOperationToReportStatusChange:v9 completion:v6];
  }
}

- (void)configurationEventsDidChange:(id)a3 completion:(id)a4
{
  id v9 = a3;
  int v6 = (void (**)(id, void *))a4;
  id v7 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  if ([(DMFConfigurationSourceClient *)self isInvalid])
  {
    BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    v6[2](v6, v8);
  }
  else
  {
    [(DMFConfigurationSourceClient *)self enqueueOperationToReportEvents:v9 completion:v6];
  }
}

- (void)configurationEngineRequestedAsset:(id)a3 completion:(id)a4
{
  id v9 = a3;
  int v6 = (void (**)(id, void, void *))a4;
  id v7 = [(DMFConfigurationSourceClient *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  if ([(DMFConfigurationSourceClient *)self isInvalid])
  {
    BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    v6[2](v6, 0, v8);
  }
  else
  {
    [(DMFConfigurationSourceClient *)self enqueueOperationToResolveAsset:v9 completion:v6];
  }
}

+ (id)activeRestrictionsURL
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    v8[0] = v2;
    v8[1] = @"Library";
    v8[2] = @"dmd";
    v8[3] = @"ConfigurationEngine";
    v8[4] = @"ActiveRestrictions.plist";
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
    int v6 = [v4 fileURLWithPathComponents:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

+ (id)setOfActiveRestrictionUUIDs
{
  uint64_t v2 = [a1 activeRestrictionsURL];
  if (v2)
  {
    id v15 = 0;
    uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:0 error:&v15];
    id v4 = v15;
    if (!v3)
    {
      id v5 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs](v4);
      }
      BOOL v8 = 0;
      int v6 = v4;
      goto LABEL_24;
    }
    id v14 = 0;
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v14];
    int v6 = v14;

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
LABEL_17:
        BOOL v8 = (void *)v7;
LABEL_24:

        goto LABEL_25;
      }
      char v12 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs].cold.5();
      }
    }
    else
    {
      id v9 = [v6 domain];
      if ([v9 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v10 = [v6 code];

        if (v10 == 4)
        {
          v11 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs](v11);
          }

          uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
          goto LABEL_17;
        }
      }
      else
      {
      }
      char v12 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs].cold.4(v6);
      }
    }

    BOOL v8 = 0;
    goto LABEL_24;
  }
  int v6 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[DMFConfigurationSourceClient setOfActiveRestrictionUUIDs](v6);
  }
  BOOL v8 = 0;
LABEL_25:

  return v8;
}

- (DMFConfigurationSourceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMFConfigurationSourceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (DMFConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)incomingConnection
{
  return self->_incomingConnection;
}

- (void)setIncomingConnection:(id)a3
{
}

- (NSObject)reportingRequirementsLock
{
  return self->_reportingRequirementsLock;
}

- (void)setReportingRequirementsLock:(id)a3
{
}

- (NSString)configurationSourceName
{
  return self->_configurationSourceName;
}

- (void)setConfigurationSourceName:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_source)registerConfigurationSource
{
  return self->_registerConfigurationSource;
}

- (void)setRegisterConfigurationSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerConfigurationSource, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationSourceName, 0);
  objc_storeStrong((id *)&self->_reportingRequirementsLock, 0);
  objc_storeStrong((id *)&self->_incomingConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
}

- (void)registrationOperationDidFinish:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 error];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1BE0E2000, a3, OS_LOG_TYPE_ERROR, "Failed to register configuration source \"%{public}@\": %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BE0E2000, v0, OS_LOG_TYPE_ERROR, "rejecting incoming connection from %{public}@", v1, 0xCu);
}

+ (void)setOfActiveRestrictionUUIDs
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BE0E2000, v2, v3, "Couldn't read active restrictions with unexpected type: %{public}@", v4, v5, v6, v7, v8);
}

@end