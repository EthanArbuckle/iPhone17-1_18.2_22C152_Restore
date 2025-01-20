@interface AVRunLoopCondition
+ (void)initialize;
- (AVRunLoopCondition)init;
- (BOOL)_waitInMode:(id)a3 untilDate:(id)a4;
- (BOOL)waitUntilDate:(id)a3;
- (BOOL)waitUntilDate:(id)a3 inMode:(id)a4;
- (void)_signalRunLoopWithState:(id)a3;
- (void)broadcast;
- (void)dealloc;
- (void)signal;
- (void)wait;
- (void)waitInMode:(id)a3;
@end

@implementation AVRunLoopCondition

- (void)signal
{
  if ([(NSMutableArray *)self->_runLoopStateList count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_runLoopStateList objectAtIndex:0];
    [(AVRunLoopCondition *)self _signalRunLoopWithState:v3];
  }
}

- (BOOL)waitUntilDate:(id)a3 inMode:(id)a4
{
  return [(AVRunLoopCondition *)self _waitInMode:a4 untilDate:a3];
}

- (void)_signalRunLoopWithState:(id)a3
{
  CFRunLoopSourceSignal((CFRunLoopSourceRef)[a3 signalSource]);
  v4 = (__CFRunLoop *)[a3 runLoop];
  CFRunLoopWakeUp(v4);
}

- (BOOL)_waitInMode:(id)a3 untilDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x199715AE0](self, a2);
  if (!a3) {
    a3 = @"AVRunLoopConditionSignalRunLoopMode";
  }
  Current = CFRunLoopGetCurrent();
  v9 = +[AVRunLoopConditionRunLoopState runLoopStateWithRunLoop:Current];
  context.version = 0;
  context.info = v9;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
  memset(&context.copyDescription, 0, 40);
  context.perform = (void (__cdecl *)(void *))AVRunLoopConditionSignal;
  CFRunLoopSourceRef v10 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &context);
  v11 = v10;
  [(NSMutableArray *)self->_runLoopStateList addObject:v9];
  CFRunLoopAddSource(Current, v10, (CFRunLoopMode)a3);
  [(AVRunLoopConditionRunLoopState *)v9 setSignalSource:v10];
  [(NSCondition *)self unlock];
  if (![(AVRunLoopConditionRunLoopState *)v9 signaled])
  {
    do
    {
      v12 = (void *)MEMORY[0x199715AE0]();
      CFTimeInterval v13 = 1000000000.0;
      if (a4)
      {
        if (objc_msgSend(a4, "compare:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date", 1000000000.0)) != 1)
        {
          if (dword_1EB2D3900)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          break;
        }
        [a4 timeIntervalSinceNow];
      }
      CFRunLoopRunInMode((CFRunLoopMode)a3, v13, 1u);
    }
    while (![(AVRunLoopConditionRunLoopState *)v9 signaled]);
  }
  [(NSCondition *)self lock];
  [(AVRunLoopConditionRunLoopState *)v9 setSignalSource:0];
  CFRunLoopRemoveSource(Current, v10, (CFRunLoopMode)a3);
  [(NSMutableArray *)self->_runLoopStateList removeObject:v9];
  BOOL v14 = [(AVRunLoopConditionRunLoopState *)v9 signaled];
  return v14;
}

- (AVRunLoopCondition)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVRunLoopCondition;
  v2 = [(NSCondition *)&v4 init];
  if (v2) {
    v2->_runLoopStateList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVRunLoopCondition;
  [(NSCondition *)&v3 dealloc];
}

- (void)wait
{
}

- (BOOL)waitUntilDate:(id)a3
{
  return [(AVRunLoopCondition *)self waitUntilDate:a3 inMode:0];
}

- (void)waitInMode:(id)a3
{
}

- (void)broadcast
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  runLoopStateList = self->_runLoopStateList;
  uint64_t v4 = [(NSMutableArray *)runLoopStateList countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(runLoopStateList);
        }
        [(AVRunLoopCondition *)self _signalRunLoopWithState:*(void *)(*((void *)&v8 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSMutableArray *)runLoopStateList countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end