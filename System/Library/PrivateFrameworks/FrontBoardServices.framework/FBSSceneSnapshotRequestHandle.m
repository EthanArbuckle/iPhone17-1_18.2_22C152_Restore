@interface FBSSceneSnapshotRequestHandle
+ (id)handleForRequestType:(unint64_t)a3 context:(id)a4;
- (FBSSceneSnapshotRequestHandle)initWithRequestType:(unint64_t)a3 context:(id)a4;
- (void)_clearAction;
- (void)cancelRequest;
- (void)performRequestForScene:(id)a3;
@end

@implementation FBSSceneSnapshotRequestHandle

+ (id)handleForRequestType:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithRequestType:a3 context:v6];

  return v7;
}

- (FBSSceneSnapshotRequestHandle)initWithRequestType:(unint64_t)a3 context:(id)a4
{
  id v7 = a4;
  v8 = [(FBSSceneSnapshotRequestHandle *)self init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v9;
}

- (void)performRequestForScene:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneSnapshotRequestHandle performRequestForScene:](a2);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  id v6 = v5;
  id v7 = [v5 identifier];
  v8 = [(FBSSceneSnapshotContext *)self->_context sceneID];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[scene identifier] isEqualToString:[_context sceneID]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneSnapshotRequestHandle performRequestForScene:](a2);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  if (self->_responder)
  {
    v18 = [NSString stringWithFormat:@"cannot perform this twice"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneSnapshotRequestHandle performRequestForScene:](a2);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  v10 = self;
  objc_sync_enter(v10);
  if (!v10->_canceled)
  {
    v11 = FBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t type = v10->_type;
      *(_DWORD *)buf = 134218240;
      v21 = v10;
      __int16 v22 = 2048;
      unint64_t v23 = type;
      _os_log_impl(&dword_19C680000, v11, OS_LOG_TYPE_DEFAULT, "Performing snapshot request %p (type %lu)", buf, 0x16u);
    }

    if (v10->_type == 1) {
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    }
    else {
      dispatch_semaphore_t v13 = 0;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke;
    v19[3] = &unk_1E58F70F8;
    v19[4] = v10;
    v19[5] = v13;
    v14 = [off_1E58F44B8 responderWithHandler:v19];
    responder = self->_responder;
    self->_responder = v14;

    BSDispatchQueueCreateSerialWithQoS();
  }
  objc_sync_exit(v10);
}

void __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t *)(a1 + 32);
  v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 _clearAction];
  id v6 = [v5 error];

  id v7 = FBLogCommon();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke_cold_1(v4, v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *v4;
    int v11 = 134217984;
    uint64_t v12 = v9;
    _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "Snapshot request %p complete", (uint8_t *)&v11, 0xCu);
  }

  v10 = *(NSObject **)(a1 + 40);
  if (v10) {
    dispatch_semaphore_signal(v10);
  }
}

- (void)cancelRequest
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_canceled)
  {
    v3 = FBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      id v5 = v2;
      _os_log_impl(&dword_19C680000, v3, OS_LOG_TYPE_DEFAULT, "Snapshot request %p canceled", (uint8_t *)&v4, 0xCu);
    }

    v2->_canceled = 1;
    [(BSActionResponder *)v2->_responder annul];
    [(FBSSceneSnapshotRequestHandle *)v2 _clearAction];
  }
  objc_sync_exit(v2);
}

- (void)_clearAction
{
  obj = self;
  objc_sync_enter(obj);
  responder = obj->_responder;
  obj->_responder = 0;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)performRequestForScene:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)performRequestForScene:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)performRequestForScene:(const char *)a1 .cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __56__FBSSceneSnapshotRequestHandle_performRequestForScene___block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  uint64_t v5 = [a2 descriptionWithMultilinePrefix:0];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl(&dword_19C680000, a3, OS_LOG_TYPE_ERROR, "Snapshot request %p complete with error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end