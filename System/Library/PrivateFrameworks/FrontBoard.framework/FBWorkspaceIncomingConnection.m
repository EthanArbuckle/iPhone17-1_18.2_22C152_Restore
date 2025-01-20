@interface FBWorkspaceIncomingConnection
- (id)initWithWorkspace:(id *)a1;
- (void)workspaceLock_setConnection:(uint64_t)a1;
@end

@implementation FBWorkspaceIncomingConnection

void __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke_56(uint64_t a1)
{
}

- (void)workspaceLock_setConnection:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"incomingConnection"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceIncomingConnection workspaceLock_setConnection:]();
      }
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6312ABCLL);
    }
    v5 = (os_unfair_lock *)*(id *)(a1 + 8);
    -[FBWorkspace _assertLocked](v5);
    v6 = [(os_unfair_lock *)v5 process];
    v7 = -[FBWorkspaceConnection _workspaceLock_connection]((const os_unfair_lock **)a1);

    v8 = FBLogProcessWorkspace();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceIncomingConnection workspaceLock_setConnection:](v6, v9);
      }
      }

      [v4 invalidate];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[FBProcess logProem](v6);
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl(&dword_1A62FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection established.", buf, 0xCu);
      }
      v11 = [MEMORY[0x1E4F62B38] interface];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke;
      v22[3] = &unk_1E5C4A140;
      v12 = v6;
      id v23 = v12;
      -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:](a1, v4, v11, 0, v22);

      v13 = -[FBWorkspaceConnection _workspaceLock_connection]((const os_unfair_lock **)a1);
      v14 = [v13 remoteTarget];

      v15 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = -[FBProcess logProem](v12);
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        __int16 v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_1A62FC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ created proxy of %{public}@", buf, 0x16u);
      }
      v17 = -[FBWorkspace _connectionQueue]((id *)v5);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke_56;
      block[3] = &unk_1E5C497A0;
      block[4] = a1;
      id v21 = v14;
      id v18 = v14;
      dispatch_async(v17, block);
    }
  }
}

- (id)initWithWorkspace:(id *)a1
{
  if (a1) { {
    return -[FBWorkspaceConnection _initWithWorkspace:](a1, a2);
  }
  }
  return a1;
}

uint64_t __61__FBWorkspaceIncomingConnection_workspaceLock_setConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = -[FBProcess logProem](*(void **)(a1 + 32));
    int v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A62FC000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Workspace connection invalidated.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) _notePendingExitForReason:@"workspace client connection invalidated"];
}

- (void)workspaceLock_setConnection:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)workspaceLock_setConnection:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = -[FBProcess logProem](a1);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Unexpectedly attempted to assign a new connection to a workspace server with an existing connection.", (uint8_t *)&v4, 0xCu);
}

@end