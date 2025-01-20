@interface FBWorkspaceConnection
+ (id)currentWorkspaceConnection;
+ (void)currentWorkspaceConnection;
- (BOOL)isOutgoing;
- (BOOL)workspaceLock_isValid;
- (const)_workspaceLock_connection;
- (id)_initWithWorkspace:(id *)a1;
- (id)_workspace;
- (id)_workspaceScene:(uint64_t)a3 acquireAssertionWithState:;
- (id)queue;
- (id)remoteProcess;
- (id)workspaceLock_invalidate;
- (void)_flushConnectBlocksWithProxy:(uint64_t)a1;
- (void)_workspaceLock_setConnection:(void *)a3 withInterface:(void *)a4 activationHandler:(void *)a5 invalidationHandler:;
- (void)_workspaceScene:(void *)a3 enqueueConnectBlock:;
- (void)workspaceLock_enqueueConnectBlock:(uint64_t)a1;
- (void)workspaceLock_invalidate;
@end

@implementation FBWorkspaceConnection

- (void)_flushConnectBlocksWithProxy:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    -[FBWorkspace _lock](*(os_unfair_lock_s **)(a1 + 8));
    id v4 = *(id *)(a1 + 24);
    v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    -[FBWorkspace _unlock](*(os_unfair_lock_s **)(a1 + 8));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) { {
            objc_enumerationMutation(v6);
          }
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_workspaceScene:(void *)a3 enqueueConnectBlock:
{
  id v13 = a2;
  id v5 = a3;
  id v6 = (void (**)(void, void))v5;
  if (!a1)
  {
LABEL_9:

    return;
  }
  if (v5)
  {
    uint64_t v7 = -[FBWorkspace _connectionQueue](*(id **)(a1 + 8));
    BSDispatchQueueAssert();

    -[FBWorkspace _lock](*(os_unfair_lock_s **)(a1 + 8));
    uint64_t v8 = *(void **)(a1 + 24);
    if (v8)
    {
      uint64_t v9 = (void *)[v6 copy];
      uint64_t v10 = (void *)MEMORY[0x1AD0B8C50]();
      [v8 addObject:v10];

      -[FBWorkspace _unlock](*(os_unfair_lock_s **)(a1 + 8));
    }
    else
    {
      if (*(unsigned char *)(a1 + 32))
      {
        long long v11 = [*(id *)(a1 + 16) remoteTarget];
      }
      else
      {
        long long v11 = 0;
      }
      -[FBWorkspace _unlock](*(os_unfair_lock_s **)(a1 + 8));
      ((void (**)(void, void *))v6)[2](v6, v11);
    }
    goto LABEL_9;
  }
  long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspaceConnection _workspaceScene:enqueueConnectBlock:]();
  }
  }
  [v12 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)_workspaceScene:(uint64_t)a3 acquireAssertionWithState:
{
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    id v5 = [a2 identity];
    id v6 = [v5 description];
    uint64_t v7 = -[FBWorkspace _acquireAssertionForReason:withState:](v4, v6, a3);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)currentWorkspaceConnection
{
  uint64_t v0 = [MEMORY[0x1E4F62880] currentContext];
  if (v0)
  {
    v1 = (void *)v0;
    os_unfair_lock_lock((os_unfair_lock_t)&_connectionsLock);
    v2 = [(id)_connectionsLock_connectionByConnection objectForKey:v1];
    os_unfair_lock_unlock((os_unfair_lock_t)&_connectionsLock);
    if (v2)
    {
      id v3 = v2;
    }
    else
    {
      uint64_t v4 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) { {
        +[FBWorkspaceConnection currentWorkspaceConnection];
      }
      }
    }
    return v2;
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"if we're asking for the currentContext and we don't have it then something must have gone seriously wrong"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnection currentWorkspaceConnection]();
    }
    }
    [v6 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __106__FBWorkspaceConnection__workspaceLock_setConnection_withInterface_activationHandler_invalidationHandler___block_invoke(void *a1, void *a2)
{
  id v5 = a2;
  id v3 = -[FBWorkspace _connectionQueue](*(id **)(a1[4] + 8));
  [v5 setTargetQueue:v3];

  uint64_t v4 = [MEMORY[0x1E4F62B38] serviceQuality];
  [v5 setServiceQuality:v4];

  [v5 setInterface:a1[5]];
  [v5 setInterfaceTarget:*(void *)(a1[4] + 8)];
  if (a1[6]) { {
    objc_msgSend(v5, "setActivationHandler:");
  }
  }
  [v5 setInvalidationHandler:a1[7]];
}

- (const)_workspaceLock_connection
{
  if (a1)
  {
    v2 = a1;
    -[FBWorkspace _assertLocked](a1[1]);
    a1 = (id)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)workspaceLock_enqueueConnectBlock:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1)
  {
LABEL_9:

    return;
  }
  if (v3)
  {
    -[FBWorkspace _assertLocked](*(const os_unfair_lock **)(a1 + 8));
    id v5 = *(void **)(a1 + 24);
    if (v5)
    {
      id v6 = (void *)[v4 copy];
      uint64_t v7 = (void *)MEMORY[0x1AD0B8C50]();
      [v5 addObject:v7];
    }
    else
    {
      if (*(unsigned char *)(a1 + 32))
      {
        uint64_t v8 = [*(id *)(a1 + 16) remoteTarget];
      }
      else
      {
        uint64_t v8 = 0;
      }
      uint64_t v9 = -[FBWorkspace _queue](*(id **)(a1 + 8));
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59__FBWorkspaceConnection_workspaceLock_enqueueConnectBlock___block_invoke;
      v12[3] = &unk_1E5C4A7A8;
      id v13 = v8;
      id v14 = v4;
      id v10 = v8;
      [v9 performAsync:v12];
    }
    goto LABEL_9;
  }
  long long v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:]();
  }
  }
  [v11 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)queue
{
  if (a1)
  {
    -[FBWorkspace _queue](a1[1]);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isOutgoing
{
  if (result)
  {
    uint64_t v1 = objc_opt_class();
    return v1 == objc_opt_class();
  }
  return result;
}

- (void)_workspaceLock_setConnection:(void *)a3 withInterface:(void *)a4 activationHandler:(void *)a5 invalidationHandler:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    -[FBWorkspace _assertLocked](*(const os_unfair_lock **)(a1 + 8));
    if (*(void *)(a1 + 24))
    {
      objc_storeStrong((id *)(a1 + 16), a2);
      os_unfair_lock_lock((os_unfair_lock_t)&_connectionsLock);
      id v14 = (void *)_connectionsLock_connectionByConnection;
      if (!_connectionsLock_connectionByConnection)
      {
        uint64_t v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
        uint64_t v16 = (void *)_connectionsLock_connectionByConnection;
        _connectionsLock_connectionByConnection = v15;

        id v14 = (void *)_connectionsLock_connectionByConnection;
      }
      v17 = [v14 objectForKey:v10];

      if (!v17)
      {
        [(id)_connectionsLock_connectionByConnection setObject:a1 forKey:v10];
        os_unfair_lock_unlock((os_unfair_lock_t)&_connectionsLock);
        v18 = *(void **)(a1 + 16);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __106__FBWorkspaceConnection__workspaceLock_setConnection_withInterface_activationHandler_invalidationHandler___block_invoke;
        v20[3] = &unk_1E5C4BA90;
        v20[4] = a1;
        id v21 = v11;
        id v22 = v12;
        id v23 = v13;
        [v18 configureConnection:v20];
        [*(id *)(a1 + 16) activate];

        goto LABEL_7;
      }
      v19 = [NSString stringWithFormat:@"should not be possible to have an existing mapping for connection=%p : existing=%@", v10, _connectionsLock_connectionByConnection];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:]();
      }
      }
    }
    else
    {
      v19 = [NSString stringWithFormat:@"cannot set connection if we've already been invalidated : conn=%@", v10];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceConnection _workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:]();
      }
      }
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632226CLL);
  }
LABEL_7:
}

- (id)_initWithWorkspace:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FBWorkspaceConnection;
    id v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      uint64_t v6 = objc_opt_new();
      id v7 = a1[3];
      a1[3] = (id)v6;

      *((unsigned char *)a1 + 32) = 1;
    }
  }

  return a1;
}

- (BOOL)workspaceLock_isValid
{
  if (result)
  {
    uint64_t v1 = result;
    -[FBWorkspace _assertLocked](*(const os_unfair_lock **)(result + 8));
    return *(unsigned char *)(v1 + 32) != 0;
  }
  return result;
}

- (id)_workspace
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)remoteProcess
{
  if (a1)
  {
    a1 = [a1[1] process];
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __59__FBWorkspaceConnection_workspaceLock_enqueueConnectBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)workspaceLock_invalidate
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    -[FBWorkspace _assertLocked](a1[1]);
    id v2 = v1[3];
    id v3 = v1[3];
    v1[3] = 0;

    os_unfair_lock_lock((os_unfair_lock_t)&_connectionsLock);
    uint64_t v4 = [(id)_connectionsLock_connectionByConnection objectForKey:v1[2]];
    id v5 = (void *)v4;
    if (v4) { {
      BOOL v6 = v4 == (void)v1;
    }
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      objc_super v9 = [NSString stringWithFormat:@"should not be possible to map to something other than connection=%p for connection=%@ : existing=%@", v1, v1[2], v4];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceConnection workspaceLock_invalidate]();
      }
      }
      [v9 UTF8String];
      id result = (id *)_bs_set_crash_log_message();
      __break(0);
      return result;
    }
    [(id)_connectionsLock_connectionByConnection removeObjectForKey:v1[2]];
    os_unfair_lock_unlock((os_unfair_lock_t)&_connectionsLock);
    [v1[2] invalidate];
    *((unsigned char *)v1 + 32) = 0;
    if ([v2 count]) { {
      id v7 = v2;
    }
    }
    else {
      id v7 = 0;
    }
    uint64_t v1 = v7;
  }

  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)_workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceLock_setConnection:withInterface:activationHandler:invalidationHandler:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceScene:enqueueConnectBlock:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)currentWorkspaceConnection
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "Could not find workspaceConnection for currentConnection=%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)workspaceLock_enqueueConnectBlock:.cold.1()
{
  int v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)workspaceLock_invalidate
{
  int v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end