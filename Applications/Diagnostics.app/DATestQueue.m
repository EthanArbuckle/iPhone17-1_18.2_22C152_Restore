@interface DATestQueue
+ (id)testQueueWithDelegate:(id)a3;
- (BOOL)suspended;
- (DATestQueue)initWithDelegate:(id)a3;
- (DATestQueueDelegate)delegate;
- (NSMutableArray)testQueue;
- (id)_dequeueTest;
- (void)_enqueueTestWithQueueEntry:(id)a3;
- (void)_tickleTestQueue;
- (void)enqueueTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTestQueue:(id)a3;
@end

@implementation DATestQueue

+ (id)testQueueWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDelegate:v4];

  return v5;
}

- (void)enqueueTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v6 = +[DATestQueueEntry queueEntryWithAttributes:a3 parameters:a4 completion:a5];
  [(DATestQueue *)self _enqueueTestWithQueueEntry:v6];
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    if (!a3) {
      [(DATestQueue *)self _tickleTestQueue];
    }
  }
}

- (DATestQueue)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DATestQueue;
  id v5 = [(DATestQueue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableArray arrayWithCapacity:1];
    testQueue = v5->_testQueue;
    v5->_testQueue = (NSMutableArray *)v6;

    v5->_suspended = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)_tickleTestQueue
{
  if (![(DATestQueue *)self suspended])
  {
    id v7 = [(DATestQueue *)self _dequeueTest];
    if (v7)
    {
      v3 = [(DATestQueue *)self delegate];
      id v4 = [v7 attributes];
      id v5 = [v7 parameters];
      uint64_t v6 = [v7 completion];
      [v3 executeTestWithTestAttributes:v4 parameters:v5 completion:v6];
    }
  }
}

- (void)_enqueueTestWithQueueEntry:(id)a3
{
  id v6 = a3;
  id v4 = [(DATestQueue *)self testQueue];
  objc_sync_enter(v4);
  id v5 = [(DATestQueue *)self testQueue];
  [v5 addObject:v6];

  objc_sync_exit(v4);
  [(DATestQueue *)self _tickleTestQueue];
}

- (id)_dequeueTest
{
  v3 = [(DATestQueue *)self testQueue];
  objc_sync_enter(v3);
  id v4 = [(DATestQueue *)self testQueue];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(DATestQueue *)self testQueue];
    id v7 = [v6 objectAtIndexedSubscript:0];

    v8 = [(DATestQueue *)self testQueue];
    [v8 removeObjectAtIndex:0];
  }
  else
  {
    id v7 = 0;
  }
  objc_sync_exit(v3);

  return v7;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (NSMutableArray)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (DATestQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DATestQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_testQueue, 0);
}

@end