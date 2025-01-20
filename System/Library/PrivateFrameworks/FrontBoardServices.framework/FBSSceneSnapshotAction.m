@interface FBSSceneSnapshotAction
- (BOOL)_remainsActionable;
- (BOOL)isExpired;
- (BOOL)snapshotRequest:(id)a3 performWithContext:(id)a4;
- (BSSettings)clientExtendedData;
- (Class)fallbackXPCEncodableClass;
- (FBSSceneSnapshotAction)initWithRequests:(id)a3 expirationInterval:(double)a4 responseHandler:(id)a5;
- (FBSSceneSnapshotAction)initWithXPCDictionary:(id)a3;
- (double)expirationInterval;
- (id)completionHandler;
- (id)requestHandler;
- (void)_executeNextRequest;
- (void)_finishAllRequests;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)executeRequestsWithHandler:(id)a3 completionHandler:(id)a4 expirationHandler:(id)a5;
- (void)invalidate;
- (void)setClientExtendedData:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setNullificationHandler:(id)a3;
- (void)setRequestHandler:(id)a3;
@end

@implementation FBSSceneSnapshotAction

- (FBSSceneSnapshotAction)initWithRequests:(id)a3 expirationInterval:(double)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = v9;
    id v11 = objc_alloc_init((Class)off_1E58F4540);
    [off_1E58F44B8 responderWithHandler:v10];
    objc_claimAutoreleasedReturnValue();
    BSFloatGreaterThanFloat();
  }
  v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSSceneSnapshotAction initWithRequests:expirationInterval:responseHandler:](a2, (uint64_t)self, (uint64_t)v12);
  }
  [v12 UTF8String];
  _bs_set_crash_log_message();
}

- (BOOL)isExpired
{
}

- (void)setExpired:(BOOL)a3
{
}

- (void)executeRequestsWithHandler:(id)a3 completionHandler:(id)a4 expirationHandler:(id)a5
{
  id v8 = a5;
  callOutQueue = self->super._callOutQueue;
  id v10 = a4;
  id v11 = a3;
  [(FBSSerialQueue *)callOutQueue assertOnQueue];
  [(FBSSceneSnapshotAction *)self setRequestHandler:v11];

  [(FBSSceneSnapshotAction *)self setCompletionHandler:v10];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __89__FBSSceneSnapshotAction_executeRequestsWithHandler_completionHandler_expirationHandler___block_invoke;
  v16 = &unk_1E58F57B0;
  v17 = self;
  id v18 = v8;
  id v12 = v8;
  BSDispatchBlockCreateWithCurrentQualityOfService();
}

uint64_t __89__FBSSceneSnapshotAction_executeRequestsWithHandler_completionHandler_expirationHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setExpired:1];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 72) cancelRequest];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = 0;

  objc_sync_exit(v2);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (double)expirationInterval
{
  id v2 = [(FBSSceneSnapshotAction *)self info];
  uint64_t v3 = [v2 objectForSetting:1];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setInvalidationHandler:(id)a3
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"you can't use the invalidation handler on this class"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    id v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2114;
    v17 = @"FBSSceneSnapshotAction.m";
    __int16 v18 = 1024;
    int v19 = 101;
    __int16 v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

- (void)setNullificationHandler:(id)a3
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"you can't use the nullification handler on this class"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    id v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2114;
    v17 = @"FBSSceneSnapshotAction.m";
    __int16 v18 = 1024;
    int v19 = 105;
    __int16 v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

- (void)invalidate
{
  if (self->_responder)
  {
    responder = self->_responder;
    [(BSActionResponder *)responder annul];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)FBSSceneSnapshotAction;
    [(FBSSceneSnapshotAction *)&v3 invalidate];
  }
}

- (BOOL)_remainsActionable
{
  if ([(FBSSceneSnapshotAction *)self isExpired]) {
    return 0;
  }

  return [(FBSSceneSnapshotAction *)self isValid];
}

- (void)_finishAllRequests
{
  id requestHandler = self->_requestHandler;
  self->_id requestHandler = 0;

  completionHandler = (void (**)(void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2]();
    id v5 = self->_completionHandler;
    self->_completionHandler = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)FBSSceneSnapshotAction;
  [(FBSSceneSnapshotAction *)&v7 setNullificationHandler:0];
  v6 = FBSSceneSnapshotActionResponseForErrorCode(0);
  [(FBSSceneSnapshotAction *)self sendResponse:v6];
}

- (void)_executeNextRequest
{
  [(FBSSerialQueue *)self->super._callOutQueue assertOnQueue];
  if ([(FBSSceneSnapshotAction *)self _remainsActionable])
  {
    id v6 = [(NSMutableArray *)self->_requests firstObject];
    if (v6)
    {
      [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
      objc_super v3 = [(FBSScene *)self->super._scene identifier];
      [v6 setSceneID:v3];

      double v4 = (void *)MEMORY[0x19F398F90]([v6 setDelegate:self]);
      id requestHandler = (void (**)(id, id))self->_requestHandler;
      if (requestHandler) {
        requestHandler[2](requestHandler, v6);
      }
      [v6 setDelegate:0];
      [(FBSSceneSnapshotAction *)self _executeNextRequest];
    }
    else
    {
      [(FBSSceneSnapshotAction *)self _finishAllRequests];
    }
  }
  else
  {
    [(FBSSceneSnapshotAction *)self _finishAllRequests];
  }
}

- (BOOL)snapshotRequest:(id)a3 performWithContext:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(FBSSceneSnapshotAction *)self _remainsActionable];
  if (v9)
  {
    [(FBSSerialQueue *)self->super._callOutQueue assertOnQueue];
    int v10 = self;
    objc_sync_enter(v10);
    if (v10->_outgoingRequestHandle)
    {
      __int16 v16 = [NSString stringWithFormat:@"cannot have existing request handle"];
      v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        int v22 = 138544642;
        id v23 = v19;
        __int16 v24 = 2114;
        v25 = v21;
        __int16 v26 = 2048;
        v27 = v10;
        __int16 v28 = 2114;
        v29 = @"FBSSceneSnapshotAction.m";
        __int16 v30 = 1024;
        int v31 = 181;
        __int16 v32 = 2114;
        v33 = v16;
        _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v22, 0x3Au);
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
    }
    id v11 = [[FBSSceneSnapshotRequestHandle alloc] initWithRequestType:1 context:v8];
    outgoingRequestHandle = v10->_outgoingRequestHandle;
    v10->_outgoingRequestHandle = v11;

    objc_sync_exit(v10);
    [(FBSSceneSnapshotRequestHandle *)v10->_outgoingRequestHandle performRequestForScene:v10->super._scene];
    uint64_t v13 = v10;
    objc_sync_enter(v13);
    __int16 v14 = v10->_outgoingRequestHandle;
    v10->_outgoingRequestHandle = 0;

    objc_sync_exit(v13);
  }

  return v9;
}

- (FBSSceneSnapshotAction)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FBSSceneSnapshotAction;
  if ([(FBSSceneSnapshotAction *)&v6 initWithXPCDictionary:v4]) {
    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  }

  return 0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBSSceneSnapshotAction;
  [(FBSSceneSnapshotAction *)&v3 encodeWithXPCDictionary:a3];
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

- (id)requestHandler
{
  return self->_requestHandler;
}

- (void)setRequestHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BSSettings)clientExtendedData
{
  return self->_clientExtendedData;
}

- (void)setClientExtendedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientExtendedData, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_outgoingRequestHandle, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)initWithRequests:(const char *)a1 expirationInterval:(uint64_t)a2 responseHandler:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  objc_super v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  BOOL v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSSceneSnapshotAction.m";
  __int16 v16 = 1024;
  int v17 = 40;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end