@interface FBSMainRunLoopSerialQueue
- (BOOL)_targetQueue_performNextIfPossible;
- (BOOL)isEqual:(id)a3;
- (id)_initWithModes:(id)a1;
- (id)description;
- (unint64_t)hash;
- (void)_performNextFromRunLoopSource;
- (void)_queue_performAsync:(uint64_t)a1;
- (void)assertBarrierOnQueue;
- (void)dealloc;
- (void)performAfter:(double)a3 withBlock:(id)a4;
- (void)performAsync:(id)a3;
@end

@implementation FBSMainRunLoopSerialQueue

void __42__FBSMainRunLoopSerialQueue_performAsync___block_invoke(uint64_t a1)
{
}

- (void)assertBarrierOnQueue
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

uint64_t __63__FBSMainRunLoopSerialQueue__targetQueue_performNextIfPossible__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (result)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndex:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v6 removeObjectAtIndex:0];
  }
  return result;
}

- (void)_queue_performAsync:(uint64_t)a1
{
  if (a1 && a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = (void *)MEMORY[0x19F3991F0](a2);
    [v3 addObject:v4];

    CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 24));
    Main = CFRunLoopGetMain();
    CFRunLoopWakeUp(Main);
  }
}

- (void)_performNextFromRunLoopSource
{
  if (a1 && -[FBSMainRunLoopSerialQueue _targetQueue_performNextIfPossible](a1))
  {
    v2 = *(__CFRunLoopSource **)(a1 + 24);
    CFRunLoopSourceSignal(v2);
  }
}

- (BOOL)_targetQueue_performNextIfPossible
{
  if (!a1 || *(unsigned char *)(a1 + 40)) {
    return 0;
  }
  *(unsigned char *)(a1 + 40) = 1;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  id v12 = 0;
  uint64_t v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__FBSMainRunLoopSerialQueue__targetQueue_performNextIfPossible__block_invoke;
  v6[3] = &unk_1E58F5230;
  v6[4] = a1;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);
  uint64_t v4 = (void *)v8[5];
  BOOL v2 = v4 != 0;
  if (v4) {
    __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__(v4);
  }
  *(unsigned char *)(a1 + 40) = 0;
  _Block_object_dispose(&v7, 8);

  return v2;
}

- (id)_initWithModes:(id)a1
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v5.receiver = a1;
    v5.super_class = (Class)FBSSerialQueue;
    a1 = [super init];
    if (a1)
    {
      [off_1E58F44F8 serial];
      [(id)objc_claimAutoreleasedReturnValue() serviceClass:33];
      objc_claimAutoreleasedReturnValue();
      BSDispatchQueueCreate();
    }
  }

  return a1;
}

- (void)performAsync:(id)a3
{
  if (a3)
  {
    dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a3);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__FBSMainRunLoopSerialQueue_performAsync___block_invoke;
    v7[3] = &unk_1E58F57B0;
    v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    dispatch_async_and_wait(queue, v7);
  }
}

- (void)dealloc
{
  CFRunLoopSourceInvalidate(self->_source);
  CFRelease(self->_source);
  v3.receiver = self;
  v3.super_class = (Class)FBSMainRunLoopSerialQueue;
  [(FBSMainRunLoopSerialQueue *)&v3 dealloc];
}

- (void)performAfter:(double)a3 withBlock:(id)a4
{
  if (a4)
  {
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, a4);
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__FBSMainRunLoopSerialQueue_performAfter_withBlock___block_invoke;
    v10[3] = &unk_1E58F57B0;
    v10[4] = self;
    id v11 = v6;
    id v9 = v6;
    dispatch_after(v7, queue, v10);
  }
}

void __52__FBSMainRunLoopSerialQueue_performAfter_withBlock___block_invoke(uint64_t a1)
{
}

- (unint64_t)hash
{
  return [(NSArray *)self->_modes hash];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)description
{
  objc_super v3 = [off_1E58F44F0 builderWithObject:self];
  [v3 appendArraySection:self->_modes withName:@"modes" skipIfEmpty:0];
  id v4 = (id)[v3 appendPointer:self->_source withName:@"source"];
  id v5 = (id)[v3 appendBool:self->_main_callingOut withName:@"callingOut"];
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __40__FBSMainRunLoopSerialQueue_description__block_invoke;
  v13 = &unk_1E58F4AB0;
  id v14 = v3;
  v15 = self;
  id v7 = v3;
  dispatch_async_and_wait(queue, &v10);
  id v8 = [v7 build:v10, v11, v12, v13];

  return v8;
}

uint64_t __40__FBSMainRunLoopSerialQueue_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 32) withName:@"enqueued" skipIfEmpty:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_blocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_modes, 0);
}

- (void)_initWithModes:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  BOOL v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end