@interface CNContactDataSourceLIFOScheduler
- (CNContactDataSourceLIFOScheduler)init;
- (NSMutableArray)stack;
- (OS_dispatch_queue)queue;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)dealloc;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation CNContactDataSourceLIFOScheduler

- (CNContactDataSourceLIFOScheduler)init
{
  v10.receiver = self;
  v10.super_class = (Class)CNContactDataSourceLIFOScheduler;
  v2 = [(CNContactDataSourceLIFOScheduler *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.contacts.contactlist", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stack = v2->_stack;
    v2->_stack = v6;

    v8 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dealloc
{
  v3 = self->_stack;
  objc_sync_enter(v3);
  [(NSMutableArray *)self->_stack removeAllObjects];
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)CNContactDataSourceLIFOScheduler;
  [(CNContactDataSourceLIFOScheduler *)&v4 dealloc];
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timestamp
{
  v2 = self;
  CNUnimplementedMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6 = a4;
  v7 = self;
  CNUnimplementedMethodException();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v5 = a4;
  id v6 = self;
  CNUnimplementedMethodException();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  CNUnimplementedMethodException();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CNUnimplementedMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  CNUnimplementedMethodException();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactDataSourceLIFOScheduler *)self stack];
  objc_sync_enter(v5);
  id v6 = _Block_copy(v4);
  [v5 addObject:v6];

  objc_sync_exit(v5);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CNContactDataSourceLIFOScheduler_performBlock___block_invoke;
  block[3] = &unk_1E549B488;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, block);
}

void __49__CNContactDataSourceLIFOScheduler_performBlock___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v4 = [*(id *)(a1 + 32) lastObject];
  [*(id *)(a1 + 32) removeLastObject];
  objc_sync_exit(v2);

  id v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    id v3 = (void *)v4;
  }
}

@end