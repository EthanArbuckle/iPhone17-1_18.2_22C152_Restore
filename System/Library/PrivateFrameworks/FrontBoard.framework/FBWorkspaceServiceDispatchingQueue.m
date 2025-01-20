@interface FBWorkspaceServiceDispatchingQueue
- (id)_initWithTargetQueue:(id)a3;
- (id)backingQueueIfExists;
- (void)performAsync:(id)a3;
- (void)performAsync:(id)a3 withHandoff:(id)a4;
@end

@implementation FBWorkspaceServiceDispatchingQueue

- (id)_initWithTargetQueue:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)FBWorkspaceServiceDispatchingQueue;
    v7 = [(FBWorkspaceServiceDispatchingQueue *)&v11 init];
    v8 = v7;
    if (v7) { {
      objc_storeStrong((id *)&v7->_targetQueue, a3);
    }
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"targetQueue != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceServiceDispatchingQueue _initWithTargetQueue:]();
    }
    }
    [v10 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)backingQueueIfExists
{
  return 0;
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__FBWorkspaceServiceDispatchingQueue_performAsync___block_invoke;
  block[3] = &unk_1E5C498D8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, block);
}

void __51__FBWorkspaceServiceDispatchingQueue_performAsync___block_invoke(uint64_t a1)
{
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  xpc_dictionary_handoff_reply();
}

void __63__FBWorkspaceServiceDispatchingQueue_performAsync_withHandoff___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
}

- (void)_initWithTargetQueue:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end