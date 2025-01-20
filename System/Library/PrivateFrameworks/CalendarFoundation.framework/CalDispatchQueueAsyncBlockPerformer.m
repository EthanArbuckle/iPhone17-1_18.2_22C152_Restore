@interface CalDispatchQueueAsyncBlockPerformer
- (CalDispatchQueueAsyncBlockPerformer)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)performAfterDelay:(double)a3 block:(id)a4;
- (id)performAsync:(id)a3;
@end

@implementation CalDispatchQueueAsyncBlockPerformer

- (CalDispatchQueueAsyncBlockPerformer)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CalDispatchQueueAsyncBlockPerformer.m", 23, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CalDispatchQueueAsyncBlockPerformer;
  v7 = [(CalDispatchQueueAsyncBlockPerformer *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v8;
}

- (id)performAsync:(id)a3
{
  id v4 = a3;
  v5 = [CalCancelableDispatchBlock alloc];
  id v6 = [(CalDispatchQueueAsyncBlockPerformer *)self queue];
  v7 = [(CalCancelableDispatchBlock *)v5 initWithBlock:v4 inQueue:v6];

  [(CalCancelableDispatchBlock *)v7 performAsync];

  return v7;
}

- (id)performAfterDelay:(double)a3 block:(id)a4
{
  id v6 = a4;
  v7 = [CalCancelableDispatchBlock alloc];
  v8 = [(CalDispatchQueueAsyncBlockPerformer *)self queue];
  v9 = [(CalCancelableDispatchBlock *)v7 initWithBlock:v6 inQueue:v8];

  [(CalCancelableDispatchBlock *)v9 performAfterDelay:a3];

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end