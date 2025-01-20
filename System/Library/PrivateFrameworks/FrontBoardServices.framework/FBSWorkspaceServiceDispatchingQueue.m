@interface FBSWorkspaceServiceDispatchingQueue
- (id)_initWithTargetQueue:(void *)a3 callOutQueue:;
- (id)backingQueueIfExists;
- (void)assertBarrierOnQueue;
- (void)performAsync:(id)a3;
- (void)performAsync:(id)a3 withHandoff:(id)a4;
@end

@implementation FBSWorkspaceServiceDispatchingQueue

- (id)_initWithTargetQueue:(void *)a3 callOutQueue:
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (a1)
  {
    if (!v6)
    {
      v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"targetQueue != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceServiceDispatchingQueue _initWithTargetQueue:callOutQueue:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
    }
    id v9 = v7;
    NSClassFromString(&cfstr_Fbsserialqueue.isa);
    if (!v9)
    {
      v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceServiceDispatchingQueue _initWithTargetQueue:callOutQueue:]();
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSerialQueueClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceServiceDispatchingQueue _initWithTargetQueue:callOutQueue:]();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
    }

    v15.receiver = a1;
    v15.super_class = (Class)FBSWorkspaceServiceDispatchingQueue;
    v10 = (id *)[super init];
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (void)assertBarrierOnQueue
{
}

- (id)backingQueueIfExists
{
  return [(FBSSerialQueue *)self->_callOutQueue backingQueueIfExists];
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  targetQueue = self->_targetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FBSWorkspaceServiceDispatchingQueue_performAsync___block_invoke;
  v7[3] = &unk_1E58F57B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(targetQueue, v7);
}

uint64_t __52__FBSWorkspaceServiceDispatchingQueue_performAsync___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) performAsync:*(void *)(a1 + 40)];
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v9 = v5;
  id v6 = v8;
  id v7 = v5;
  xpc_dictionary_handoff_reply();
}

uint64_t __64__FBSWorkspaceServiceDispatchingQueue_performAsync_withHandoff___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) performAsync:a1[6] withHandoff:a1[5]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);

  objc_storeStrong((id *)&self->_targetQueue, 0);
}

- (void)_initWithTargetQueue:callOutQueue:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithTargetQueue:callOutQueue:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end