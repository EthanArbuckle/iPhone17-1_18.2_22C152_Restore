@interface CRXUDispatchQueue
+ (CRXUDispatchQueue)dispatchQueueWithQueue:(id)a3;
+ (CRXUDispatchQueue)main;
+ (id)concurrentQueueWithName:(id)a3;
+ (id)serialQueueWithName:(id)a3;
- (BOOL)tracingEnabled;
- (CRXUDispatchQueue)initWithQueue:(id)a3 name:(id)a4;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)debugDescription;
- (void)afterDelay:(double)a3 dispatchAsync:(id)a4;
- (void)assert;
- (void)dispatchAsync:(id)a3;
- (void)dispatchBarrierAsync:(id)a3;
- (void)dispatchBarrierSync:(id)a3;
- (void)dispatchSync:(id)a3;
- (void)setTracingEnabled:(BOOL)a3;
@end

@implementation CRXUDispatchQueue

- (CRXUDispatchQueue)initWithQueue:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRXUDispatchQueue;
  v9 = [(CRXUDispatchQueue *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    if (v8)
    {
      uint64_t v11 = [v8 copy];
      name = v10->_name;
      v10->_name = (NSString *)v11;
    }
    os_log_t v13 = os_log_create(CRXULoggingSubsystem, CRXULoggingCategory);
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;
  }
  return v10;
}

+ (CRXUDispatchQueue)dispatchQueueWithQueue:(id)a3
{
  v4 = a3;
  label = dispatch_queue_get_label(v4);
  if (label)
  {
    v6 = [NSString stringWithCString:label encoding:1];
  }
  else
  {
    v6 = 0;
  }
  id v7 = (void *)[objc_alloc((Class)a1) initWithQueue:v4 name:v6];

  return (CRXUDispatchQueue *)v7;
}

- (void)dispatchSync:(id)a3
{
  id v4 = a3;
  v5 = v4;
  queue = self->_queue;
  if (self->_tracingEnabled)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__CRXUDispatchQueue_dispatchSync___block_invoke;
    v7[3] = &unk_2652E1F10;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)self->_queue, v4);
  }
}

void __34__CRXUDispatchQueue_dispatchSync___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    v5 = [v3 name];
    int v10 = 136315650;
    uint64_t v11 = "-[CRXUDispatchQueue dispatchSync:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 80;
    __int16 v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_24C484000, v4, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> sync enter", (uint8_t *)&v10, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    v9 = [v7 name];
    int v10 = 136315650;
    uint64_t v11 = "-[CRXUDispatchQueue dispatchSync:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 82;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_24C484000, v8, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> sync leave", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)dispatchAsync:(id)a3
{
  id v4 = a3;
  v5 = v4;
  queue = self->_queue;
  if (self->_tracingEnabled)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__CRXUDispatchQueue_dispatchAsync___block_invoke;
    v7[3] = &unk_2652E1F10;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_queue, v4);
  }
}

void __35__CRXUDispatchQueue_dispatchAsync___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    v5 = [v3 name];
    int v10 = 136315650;
    uint64_t v11 = "-[CRXUDispatchQueue dispatchAsync:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 92;
    __int16 v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_24C484000, v4, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async enter", (uint8_t *)&v10, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    v9 = [v7 name];
    int v10 = 136315650;
    uint64_t v11 = "-[CRXUDispatchQueue dispatchAsync:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 94;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_24C484000, v8, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async leave", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)afterDelay:(double)a3 dispatchAsync:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_time_t v8 = v7;
  queue = self->_queue;
  if (self->_tracingEnabled)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46__CRXUDispatchQueue_afterDelay_dispatchAsync___block_invoke;
    v10[3] = &unk_2652E1F10;
    v10[4] = self;
    id v11 = v6;
    dispatch_after(v8, queue, v10);
  }
  else
  {
    dispatch_after(v7, (dispatch_queue_t)self->_queue, v6);
  }
}

void __46__CRXUDispatchQueue_afterDelay_dispatchAsync___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    v5 = [v3 name];
    int v10 = 136315650;
    id v11 = "-[CRXUDispatchQueue afterDelay:dispatchAsync:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 105;
    __int16 v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_24C484000, v4, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async enter", (uint8_t *)&v10, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    dispatch_time_t v7 = *(void **)(a1 + 32);
    dispatch_time_t v8 = v6;
    v9 = [v7 name];
    int v10 = 136315650;
    id v11 = "-[CRXUDispatchQueue afterDelay:dispatchAsync:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 107;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_24C484000, v8, OS_LOG_TYPE_INFO, "%s @%d: <%{public}@> async leave", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)dispatchBarrierSync:(id)a3
{
}

- (void)dispatchBarrierAsync:(id)a3
{
}

- (void)assert
{
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRXUDispatchQueue *)self name];
  id v6 = [v3 stringWithFormat:@"%@<%p> %@", v4, self, v5];

  return v6;
}

+ (id)serialQueueWithName:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 UTF8String];
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create(v5, v6);

  dispatch_time_t v8 = (void *)[objc_alloc((Class)a1) initWithQueue:v7 name:v4];
  return v8;
}

+ (id)concurrentQueueWithName:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 UTF8String];
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create(v5, v6);

  dispatch_time_t v8 = (void *)[objc_alloc((Class)a1) initWithQueue:v7 name:v4];
  return v8;
}

+ (CRXUDispatchQueue)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__CRXUDispatchQueue_main__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (main_onceToken != -1) {
    dispatch_once(&main_onceToken, block);
  }
  v2 = (void *)main_mainQueue;
  return (CRXUDispatchQueue *)v2;
}

uint64_t __25__CRXUDispatchQueue_main__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  main_mainQueue = [v1 initWithQueue:MEMORY[0x263EF83A0] name:@"<main>"];
  return MEMORY[0x270F9A758]();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)tracingEnabled
{
  return self->_tracingEnabled;
}

- (void)setTracingEnabled:(BOOL)a3
{
  self->_tracingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end