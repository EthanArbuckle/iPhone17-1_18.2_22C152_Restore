@interface FBSSerialQueue
+ (FBSSerialQueue)queueWithDispatchQueue:(id)a3;
+ (FBSSerialQueue)queueWithMainRunLoopModes:(id)a3;
+ (id)_queueWithSerialDispatchQueue:(id)a3;
+ (id)mainDispatchQueue;
- (FBSSerialQueue)init;
- (id)backingQueueIfExists;
- (void)assertBarrierOnQueue;
- (void)performAfter:(double)a3 withBlock:(id)a4;
- (void)performAsync:(id)a3;
- (void)performAsync:(id)a3 withHandoff:(id)a4;
@end

@implementation FBSSerialQueue

+ (FBSSerialQueue)queueWithMainRunLoopModes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[modes count] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSerialQueue queueWithMainRunLoopModes:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v3 count]];
  objc_opt_class();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = [NSString stringWithFormat:@"mode (%@) is not a string", v10];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            +[FBSSerialQueue queueWithMainRunLoopModes:]();
          }
          [v14 UTF8String];
          _bs_set_crash_log_message();
        }
        v11 = (void *)[v10 copy];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v12 = -[FBSMainRunLoopSerialQueue _initWithModes:]([FBSMainRunLoopSerialQueue alloc], v5);

  return (FBSSerialQueue *)v12;
}

+ (id)_queueWithSerialDispatchQueue:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"serialQueue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSerialQueue _queueWithSerialDispatchQueue:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  v4 = v3;
  id v5 = -[FBSDispatchSerialQueue _initWithQueue:]((id *)[FBSDispatchSerialQueue alloc], v3);

  return v5;
}

- (FBSSerialQueue)init
{
  +[FBSDispatchSerialQueue _mainQueue]();
  id v3 = (FBSSerialQueue *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mainDispatchQueue
{
  return +[FBSDispatchSerialQueue _mainQueue]();
}

+ (FBSSerialQueue)queueWithDispatchQueue:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSerialQueue queueWithDispatchQueue:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14428])
  {
    uint64_t v6 = +[FBSDispatchSerialQueue _mainQueue]();
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__FBSSerialQueue_queueWithDispatchQueue___block_invoke;
    block[3] = &unk_1E58F4B00;
    id v5 = v3;
    v10 = v5;
    dispatch_async(v5, block);
    uint64_t v6 = -[FBSDispatchSerialQueue _initWithQueue:]((id *)[FBSDispatchSerialQueue alloc], v5);
  }

  return (FBSSerialQueue *)v6;
}

void __41__FBSSerialQueue_queueWithDispatchQueue___block_invoke(uint64_t a1)
{
}

- (void)performAsync:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int v9 = 138413314;
    v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2112;
    long long v16 = @"FBSSerialQueue.m";
    __int16 v17 = 1024;
    int v18 = 83;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v9, 0x30u);
  }
  __break(0);
}

- (void)performAfter:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v10 = 138413314;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = @"FBSSerialQueue.m";
    __int16 v18 = 1024;
    int v19 = 87;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v10, 0x30u);
  }
  __break(0);
}

- (void)assertBarrierOnQueue
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = NSStringFromSelector(a2);
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = 138413314;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    int v10 = v6;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = @"FBSSerialQueue.m";
    __int16 v15 = 1024;
    int v16 = 93;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v7, 0x30u);
  }
  __break(0);
}

- (id)backingQueueIfExists
{
  return 0;
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = NSStringFromSelector(a2);
    int v10 = (objc_class *)objc_opt_class();
    __int16 v11 = NSStringFromClass(v10);
    int v12 = 138413314;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v11;
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2112;
    int v19 = @"FBSSerialQueue.m";
    __int16 v20 = 1024;
    int v21 = 101;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v12, 0x30u);
  }
  __break(0);
}

+ (void)_queueWithSerialDispatchQueue:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)queueWithDispatchQueue:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)queueWithMainRunLoopModes:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)queueWithMainRunLoopModes:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end