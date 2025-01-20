@interface _FMQueueScheduler
- (OS_dispatch_queue)queue;
- (_FMQueueScheduler)initWithQueue:(id)a3;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
@end

@implementation _FMQueueScheduler

- (_FMQueueScheduler)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_FMQueueScheduler;
  v6 = [(_FMQueueScheduler *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(_FMQueueScheduler *)self queue];
  dispatch_async(v5, v4);
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(FMCancelationToken);
  v6 = [(_FMQueueScheduler *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44___FMQueueScheduler_performCancelableBlock___block_invoke;
  v12[3] = &unk_1E6019468;
  v7 = v5;
  v13 = v7;
  id v14 = v4;
  id v8 = v4;
  dispatch_async(v6, v12);

  v9 = v14;
  objc_super v10 = v7;

  return v10;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  v7 = [(_FMQueueScheduler *)self queue];
  id v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);

  if (a3 <= 1.84467441e10) {
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  else {
    dispatch_time_t v9 = -1;
  }
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __45___FMQueueScheduler_afterDelay_performBlock___block_invoke;
  handler[3] = &unk_1E60198C0;
  id v19 = v6;
  objc_super v10 = v8;
  v18 = v10;
  id v11 = v6;
  dispatch_source_set_event_handler(v10, handler);
  v12 = objc_alloc_init(FMCancelationToken);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45___FMQueueScheduler_afterDelay_performBlock___block_invoke_2;
  v15[3] = &unk_1E60193F0;
  v16 = v10;
  v13 = v10;
  [(FMCancelationToken *)v12 addCancelationBlock:v15];
  dispatch_resume(v13);

  return v12;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end