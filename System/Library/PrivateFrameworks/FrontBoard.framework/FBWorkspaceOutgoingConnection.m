@interface FBWorkspaceOutgoingConnection
- (BOOL)queue_isVerified;
- (id)initWithWorkspace:(id *)result;
- (void)workspaceLock_setEndpoint:(uint64_t)a1;
@end

@implementation FBWorkspaceOutgoingConnection

- (id)initWithWorkspace:(id *)result
{
  if (result)
  {
    result = -[FBWorkspaceConnection _initWithWorkspace:](result, a2);
    if (result) { {
      *((unsigned char *)result + 33) = 0;
    }
    }
  }
  return result;
}

- (void)workspaceLock_setEndpoint:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:]();
      }
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A636601CLL);
    }
    v5 = [v3 service];
    v6 = [MEMORY[0x1E4F62B38] identifier];
    char v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      v24 = [NSString stringWithFormat:@"outgoing endpoint is for the wrong service : %@", v4];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:]();
      }
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6366078);
    }
    v8 = (os_unfair_lock *)*(id *)(a1 + 8);
    -[FBWorkspace _assertLocked](v8);
    v9 = [(os_unfair_lock *)v8 process];
    v10 = -[FBWorkspaceConnection _workspaceLock_connection]((const os_unfair_lock **)a1);

    v11 = FBLogProcessWorkspace();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v13 = -[FBProcess logProem](v9);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v32 = v13;
        __int16 v33 = 2114;
        v34 = v4;
        __int16 v35 = 2114;
        uint64_t v36 = v14;
        _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring outgoing endpoint due to already established connection : endpoint=%{public}@ existing=%{public}@", buf, 0x20u);
      }
      if (([v4 isEqualToServiceEndpoint:*(void *)(a1 + 40)] & 1) == 0)
      {
        v15 = NSString;
        v16 = -[FBProcess logProem](v9);
        v17 = [v15 stringWithFormat:@"%@ already have an outgoing connection but the endpoint doesn't match existing : new=%@ existing=%@", v16, v4, *(void *)(a1 + 40)];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:]();
        }
        }
        [v17 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6365DF8);
      }
    }
    else
    {
      if (v12)
      {
        v18 = -[FBProcess logProem](v9);
        *(_DWORD *)buf = 138543618;
        v32 = v18;
        __int16 v33 = 2114;
        v34 = v4;
        _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating outgoing connection to %{public}@.", buf, 0x16u);
      }
      v19 = [MEMORY[0x1E4F62880] connectionWithEndpoint:v4 clientContextBuilder:&__block_literal_global_27];
      id v20 = (id)a1;
      v21 = [MEMORY[0x1E4F62B38] invertedInterface];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2;
      v28[3] = &unk_1E5C4BAD8;
      v29 = v9;
      id v30 = v20;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_75;
      v25[3] = &unk_1E5C4BAD8;
      id v26 = v30;
      v27 = v29;
      id v22 = v30;
      -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:]((uint64_t)v22, v19, v21, v28, v25);
    }
  }
}

uint64_t __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke(uint64_t a1, void *a2)
{
  return [a2 encodeBool:1 forKey:@"targetsClientEndpoint"];
}

void __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 remoteToken];
  uint64_t v5 = [v4 versionedPID];
  if (v5 == -1 || v5 != [*(id *)(a1 + 32) versionedPID])
  {
    v8 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
      __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2_cold_1(a1, (uint64_t)v4, v8);
    }
    }

    char v7 = -[FBWorkspaceConnection _workspace](*(id **)(a1 + 40));
    v9 = *(void **)(a1 + 40);
    v10 = FBSceneErrorCreate(3uLL, @"FBWorkspaceOutgoingConnection failed process verification.", 0);
    -[FBWorkspace _queue_unverifiedOutgoingConnection:didError:]((uint64_t)v7, v9, v10);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 33) = 1;
    uint64_t v6 = *(void *)(a1 + 40);
    char v7 = [v3 remoteTarget];
    -[FBWorkspaceConnection _flushConnectBlocksWithProxy:](v6, v7);
  }
}

void __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_75(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 33);
  id v3 = FBLogProcessWorkspace();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = -[FBProcess logProem](*(void **)(a1 + 40));
      int v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1A62FC000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Verified outgoing workspace connection invalidated.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) _notePendingExitForReason:@"verified outgoing workspace client connection invalidated"];
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = -[FBProcess logProem](*(void **)(a1 + 40));
      int v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1A62FC000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unverified outgoing workspace connection invalidated.", (uint8_t *)&v10, 0xCu);
    }
    char v7 = -[FBWorkspaceConnection _workspace](*(id **)(a1 + 32));
    v8 = *(void **)(a1 + 32);
    v9 = FBSceneErrorCreate(4uLL, @"FBWorkspaceOutgoingConnection invalidated before process verification.", 0);
    -[FBWorkspace _queue_unverifiedOutgoingConnection:didError:]((uint64_t)v7, v8, v9);
  }
}

- (BOOL)queue_isVerified
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = -[FBWorkspace _connectionQueue](*(id **)(result + 8));
    BSDispatchQueueAssert();

    return *(unsigned char *)(v1 + 33) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)workspaceLock_setEndpoint:.cold.1()
{
  int v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)workspaceLock_setEndpoint:.cold.2()
{
  int v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)workspaceLock_setEndpoint:.cold.3()
{
  int v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __59__FBWorkspaceOutgoingConnection_workspaceLock_setEndpoint___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = -[FBProcess logProem](*(void **)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = 138543874;
  uint8_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Outgoing workspace connection does not match expected process. remoteToken=%{public}@ process=%{public}@", (uint8_t *)&v8, 0x20u);
}

@end