@interface AXAccessQueue
+ (id)backgroundAccessQueue;
+ (id)mainAccessQueue;
- (AXAccessQueue)init;
- (AXAccessQueue)initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4;
- (AXAccessQueue)initWithParentClass:(Class)a3 description:(id)a4 appendUUIDToLabel:(BOOL)a5;
- (BOOL)behavesAsMainQueue;
- (BOOL)behavesWithoutErrorReporting;
- (BOOL)canOnlyReadInCurrentExecutionThread;
- (BOOL)canReadInCurrentExecutionThread;
- (BOOL)canWriteInCurrentExecutionThread;
- (NSString)label;
- (NSString)threadLocalStorageKey;
- (OS_dispatch_queue)concurrentQueue;
- (id)_initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4 specialBehaviors:(unint64_t)a5;
- (id)description;
- (unint64_t)_accessQueueContextInCurrentExecutionThread;
- (unint64_t)specialBehaviors;
- (void)_accessQueueContextInCurrentExecutionThread;
- (void)_performBlock:(id)a3 withDispatchFunction:(void *)a4 synchronously:(BOOL)a5 accessQueueContext:(unint64_t)a6;
- (void)afterDelay:(double)a3 processReadingBlock:(id)a4;
- (void)afterDelay:(double)a3 processWritingBlock:(id)a4;
- (void)performAsynchronousReadingBlock:(id)a3;
- (void)performAsynchronousWritingBlock:(id)a3;
- (void)performSynchronousReadingBlock:(id)a3;
- (void)performSynchronousWritingBlock:(id)a3;
- (void)setConcurrentQueue:(id)a3;
- (void)setSpecialBehaviors:(unint64_t)a3;
- (void)setThreadLocalStorageKey:(id)a3;
@end

@implementation AXAccessQueue

+ (id)mainAccessQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AXAccessQueue_mainAccessQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mainAccessQueue__AXMainAccessQueueOnceToken != -1) {
    dispatch_once(&mainAccessQueue__AXMainAccessQueueOnceToken, block);
  }
  v2 = (void *)mainAccessQueue__AXMainAccessQueue;
  return v2;
}

uint64_t __32__AXAccessQueue_mainAccessQueue__block_invoke(uint64_t a1)
{
  mainAccessQueue__AXMainAccessQueue = [objc_alloc(*(Class *)(a1 + 32)) _initWithLabel:0 appendUUIDToLabel:0 specialBehaviors:1];
  return MEMORY[0x1F41817F8]();
}

+ (id)backgroundAccessQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AXAccessQueue_backgroundAccessQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (backgroundAccessQueue__AXBackgroundAccessQueueOnceToken != -1) {
    dispatch_once(&backgroundAccessQueue__AXBackgroundAccessQueueOnceToken, block);
  }
  v2 = (void *)backgroundAccessQueue__AXBackgroundAccessQueue;
  return v2;
}

uint64_t __38__AXAccessQueue_backgroundAccessQueue__block_invoke(uint64_t a1)
{
  backgroundAccessQueue__AXBackgroundAccessQueue = [objc_alloc(*(Class *)(a1 + 32)) initWithParentClass:*(void *)(a1 + 32) description:@"GlobalBackgroundQueue" appendUUIDToLabel:0];
  return MEMORY[0x1F41817F8]();
}

- (AXAccessQueue)init
{
  return [(AXAccessQueue *)self initWithLabel:0 appendUUIDToLabel:1];
}

- (AXAccessQueue)initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4
{
  return (AXAccessQueue *)[(AXAccessQueue *)self _initWithLabel:a3 appendUUIDToLabel:a4 specialBehaviors:0];
}

- (id)_initWithLabel:(id)a3 appendUUIDToLabel:(BOOL)a4 specialBehaviors:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AXAccessQueue;
  v9 = [(AXAccessQueue *)&v25 init];
  v10 = v9;
  if (v9)
  {
    if ((a5 & 1) == 0)
    {
      v11 = [MEMORY[0x1E4F29128] UUID];
      v12 = [v11 UUIDString];

      if (v8)
      {
        if (v6) {
          id v13 = (id)[[NSString alloc] initWithFormat:@"%@-%@", v8, v12];
        }
        else {
          id v13 = (id)[v8 copy];
        }
      }
      else
      {
        id v13 = v12;
      }
      id v14 = v13;
      v15 = (const char *)[v14 UTF8String];
      dispatch_queue_t v16 = dispatch_queue_create(v15, MEMORY[0x1E4F14430]);
      if (v16)
      {
        id v17 = [NSString alloc];
        v18 = (objc_class *)objc_opt_class();
        uint64_t v19 = NSStringFromClass(v18);
        v20 = (void *)v19;
        if (!v8 || v6) {
          uint64_t v21 = [v17 initWithFormat:@"%@-%@", v19, v14, v24];
        }
        else {
          uint64_t v21 = [v17 initWithFormat:@"%@-%@-%@", v19, v14, v12];
        }
        v22 = (void *)v21;

        if (v22 && v12)
        {
          [(AXAccessQueue *)v10 setThreadLocalStorageKey:v22];
          [(AXAccessQueue *)v10 setConcurrentQueue:v16];
          [(AXAccessQueue *)v10 setSpecialBehaviors:a5];
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {
        v22 = v10;
      }
      v10 = 0;
      goto LABEL_20;
    }
    [(AXAccessQueue *)v9 setSpecialBehaviors:a5];
  }
LABEL_21:

  return v10;
}

- (AXAccessQueue)initWithParentClass:(Class)a3 description:(id)a4 appendUUIDToLabel:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (a3)
  {
    v9 = NSStringFromClass(a3);
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:a3];
    v11 = [v10 bundleIdentifier];

    if (v11) {
      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
  }
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = [v12 bundleIdentifier];

LABEL_6:
  id v13 = [NSString alloc];
  if (v8) {
    uint64_t v14 = [v13 initWithFormat:@"%@.%@.%@", v11, v9, v8];
  }
  else {
    uint64_t v14 = [v13 initWithFormat:@"%@.%@", v11, v9, v18];
  }
  v15 = (void *)v14;
  dispatch_queue_t v16 = [(AXAccessQueue *)self initWithLabel:v14 appendUUIDToLabel:v5];

  return v16;
}

- (NSString)label
{
  if ([(AXAccessQueue *)self behavesAsMainQueue])
  {
    v3 = @"Main access queue";
  }
  else
  {
    v4 = [(AXAccessQueue *)self concurrentQueue];
    label = dispatch_queue_get_label(v4);

    if (label)
    {
      v3 = [NSString stringWithUTF8String:label];
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (BOOL)behavesAsMainQueue
{
  return [(AXAccessQueue *)self specialBehaviors] & 1;
}

- (BOOL)behavesWithoutErrorReporting
{
  return ([(AXAccessQueue *)self specialBehaviors] >> 1) & 1;
}

- (void)performSynchronousReadingBlock:(id)a3
{
  id v4 = a3;
  if ([(AXAccessQueue *)self behavesAsMainQueue]) {
    AXPerformBlockSynchronouslyOnMainThread(v4);
  }
  else {
    [(AXAccessQueue *)self _performBlock:v4 withDispatchFunction:MEMORY[0x1E4F147E8] synchronously:1 accessQueueContext:1];
  }
}

- (void)performSynchronousWritingBlock:(id)a3
{
  id v4 = a3;
  if ([(AXAccessQueue *)self behavesAsMainQueue]) {
    AXPerformBlockSynchronouslyOnMainThread(v4);
  }
  else {
    [(AXAccessQueue *)self _performBlock:v4 withDispatchFunction:MEMORY[0x1E4F14788] synchronously:1 accessQueueContext:2];
  }
}

- (void)performAsynchronousReadingBlock:(id)a3
{
  id block = a3;
  if ([(AXAccessQueue *)self behavesAsMainQueue]) {
    AXPerformBlockAsynchronouslyOnMainThread(block);
  }
  else {
    [(AXAccessQueue *)self _performBlock:block withDispatchFunction:MEMORY[0x1E4F14768] synchronously:0 accessQueueContext:1];
  }
}

- (void)performAsynchronousWritingBlock:(id)a3
{
  id block = a3;
  if ([(AXAccessQueue *)self behavesAsMainQueue]) {
    AXPerformBlockAsynchronouslyOnMainThread(block);
  }
  else {
    [(AXAccessQueue *)self _performBlock:block withDispatchFunction:MEMORY[0x1E4F14780] synchronously:0 accessQueueContext:2];
  }
}

- (void)afterDelay:(double)a3 processReadingBlock:(id)a4
{
  id v6 = a4;
  if ([(AXAccessQueue *)self behavesAsMainQueue])
  {
    AXPerformBlockOnMainThreadAfterDelay(v6, a3);
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    id v8 = [(AXAccessQueue *)self concurrentQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__AXAccessQueue_afterDelay_processReadingBlock___block_invoke;
    v9[3] = &unk_1E5672EA8;
    v9[4] = self;
    id v10 = v6;
    dispatch_after(v7, v8, v9);
  }
}

uint64_t __48__AXAccessQueue_afterDelay_processReadingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performBlock:*(void *)(a1 + 40) withDispatchFunction:_AXAccessQueuePerformBlockNoQueueingOrLocking synchronously:1 accessQueueContext:1];
}

- (void)afterDelay:(double)a3 processWritingBlock:(id)a4
{
  id v6 = a4;
  if ([(AXAccessQueue *)self behavesAsMainQueue])
  {
    AXPerformBlockOnMainThreadAfterDelay(v6, a3);
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__AXAccessQueue_afterDelay_processWritingBlock___block_invoke;
    v9[3] = &unk_1E5672EA8;
    v9[4] = self;
    id v10 = v6;
    dispatch_after(v7, v8, v9);
  }
}

uint64_t __48__AXAccessQueue_afterDelay_processWritingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAsynchronousWritingBlock:*(void *)(a1 + 40)];
}

- (BOOL)canReadInCurrentExecutionThread
{
  if (![(AXAccessQueue *)self behavesAsMainQueue]) {
    return [(AXAccessQueue *)self _accessQueueContextInCurrentExecutionThread]- 1 < 2;
  }
  v3 = (void *)MEMORY[0x1E4F29060];
  return [v3 isMainThread];
}

- (BOOL)canWriteInCurrentExecutionThread
{
  if (![(AXAccessQueue *)self behavesAsMainQueue]) {
    return [(AXAccessQueue *)self _accessQueueContextInCurrentExecutionThread] == 2;
  }
  v3 = (void *)MEMORY[0x1E4F29060];
  return [v3 isMainThread];
}

- (BOOL)canOnlyReadInCurrentExecutionThread
{
  return ![(AXAccessQueue *)self behavesAsMainQueue]
      && [(AXAccessQueue *)self _accessQueueContextInCurrentExecutionThread] == 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(AXAccessQueue *)self label];
  dispatch_time_t v7 = [v3 stringWithFormat:@"<%@: %p label = \"%@\">", v5, self, v6];;

  return v7;
}

- (unint64_t)_accessQueueContextInCurrentExecutionThread
{
  if (![(AXAccessQueue *)self behavesWithoutErrorReporting]
    && [(AXAccessQueue *)self behavesAsMainQueue])
  {
    id v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[AXAccessQueue _accessQueueContextInCurrentExecutionThread](a2);
    }
  }
  BOOL v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];
  dispatch_time_t v7 = [(AXAccessQueue *)self threadLocalStorageKey];
  id v8 = [v6 objectForKey:v7];
  unint64_t v9 = [v8 unsignedIntegerValue];

  return v9;
}

- (void)_performBlock:(id)a3 withDispatchFunction:(void *)a4 synchronously:(BOOL)a5 accessQueueContext:(unint64_t)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  v12 = v11;
  if (!v11)
  {
    id v13 = AXLogUI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[AXAccessQueue _performBlock:withDispatchFunction:synchronously:accessQueueContext:](v13);
    }

    id v11 = &__block_literal_global_24;
  }
  uint64_t v14 = (void (**)(void))_Block_copy(v11);

  if (![(AXAccessQueue *)self behavesWithoutErrorReporting]
    && [(AXAccessQueue *)self behavesAsMainQueue])
  {
    v15 = AXLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[AXAccessQueue _accessQueueContextInCurrentExecutionThread](a2);
    }
  }
  if (!v7) {
    goto LABEL_15;
  }
  unint64_t v16 = [(AXAccessQueue *)self _accessQueueContextInCurrentExecutionThread];
  if (v16 != 2)
  {
    if (v16 == 1)
    {
      if (a6 != 1)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Trying to synchronously execute a writing block from within a reading block. This is illegal."];
        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_15:
    id v17 = [(AXAccessQueue *)self concurrentQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__AXAccessQueue__performBlock_withDispatchFunction_synchronously_accessQueueContext___block_invoke_27;
    v18[3] = &unk_1E56734A8;
    v18[4] = self;
    unint64_t v20 = a6;
    uint64_t v19 = v14;
    ((void (*)(void *, void *))a4)(v17, v18);

    goto LABEL_16;
  }
LABEL_14:
  v14[2](v14);
LABEL_16:
}

void __85__AXAccessQueue__performBlock_withDispatchFunction_synchronously_accessQueueContext___block_invoke_27(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F29060] currentThread];
  v2 = [v5 threadDictionary];
  v3 = [*(id *)(a1 + 32) threadLocalStorageKey];
  id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKey:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v2 removeObjectForKey:v3];
}

- (NSString)threadLocalStorageKey
{
  return self->_threadLocalStorageKey;
}

- (void)setThreadLocalStorageKey:(id)a3
{
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
}

- (unint64_t)specialBehaviors
{
  return self->_specialBehaviors;
}

- (void)setSpecialBehaviors:(unint64_t)a3
{
  self->_specialBehaviors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_threadLocalStorageKey, 0);
}

- (void)_accessQueueContextInCurrentExecutionThread
{
  sel_getName(a1);
  OUTLINED_FUNCTION_0_1(&dword_18FC6C000, v1, v2, "%s makes no sense with the main access queue.", v3, v4, v5, v6, 2u);
}

- (void)_performBlock:(os_log_t)log withDispatchFunction:synchronously:accessQueueContext:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_18FC6C000, log, OS_LOG_TYPE_FAULT, "block must not be nil.", v1, 2u);
}

@end