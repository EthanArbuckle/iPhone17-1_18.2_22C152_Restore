@interface PBFPPTBlockOperation
+ (PBFPPTBlockOperation)operationWithBlock:(id)a3;
+ (PBFPPTBlockOperation)operationWithName:(id)a3 block:(id)a4;
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (PBFPPTBlockOperation)init;
- (PBFPPTBlockOperation)initWithBlock:(id)a3;
- (PBFPPTBlockOperation)initWithName:(id)a3 block:(id)a4;
- (double)timeoutInterval;
- (id)block;
- (id)description;
- (id)timeoutBlock;
- (unint64_t)state;
- (void)cancel;
- (void)cancelAndFailTestWithReason:(id)a3;
- (void)finish;
- (void)main;
- (void)setState:(unint64_t)a3;
- (void)setTimeoutBlock:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)start;
@end

@implementation PBFPPTBlockOperation

+ (PBFPPTBlockOperation)operationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithBlock:v4];

  return (PBFPPTBlockOperation *)v5;
}

+ (PBFPPTBlockOperation)operationWithName:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithName:v7 block:v6];

  return (PBFPPTBlockOperation *)v8;
}

- (PBFPPTBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBFPPTBlockOperation;
  id v5 = [(PBFPPTOperation *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_timeoutInterval = 15.0;
    v5->_state = 0;
    id v7 = [v4 copy];
    id block = v6->_block;
    v6->_id block = v7;
  }
  return v6;
}

- (PBFPPTBlockOperation)initWithName:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = [(PBFPPTBlockOperation *)self initWithBlock:a4];
  id v8 = v7;
  if (v7) {
    [(PBFPPTOperation *)v7 setOperationName:v6];
  }

  return v8;
}

- (PBFPPTBlockOperation)init
{
  return [(PBFPPTBlockOperation *)self initWithName:@"(anonymous PBFPPTBlockOperation)" block:&stru_10000C928];
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  unint64_t v4 = [(PBFPPTBlockOperation *)self state];
  CFStringRef v5 = @"Pending";
  if (v4 == 2) {
    CFStringRef v5 = @"Finished";
  }
  if (v4 == 1) {
    CFStringRef v6 = @"Executing";
  }
  else {
    CFStringRef v6 = v5;
  }
  [v3 appendString:v6 withName:@"state"];
  id v7 = [v3 appendFloat:@"timeoutInterval" withName:self->_timeoutInterval];
  id v8 = [(PBFPPTOperation *)self operationName];
  [v3 appendString:v8 withName:@"operationName"];

  v9 = [v3 build];

  return v9;
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return +[NSSet setWithObjects:@"state", 0];
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return +[NSSet setWithObjects:@"state", 0];
}

- (void)finish
{
  dispatch_block_t block = [(PBFPPTBlockOperation *)self timeoutBlock];
  if (block)
  {
    dispatch_block_cancel(block);
    [(PBFPPTBlockOperation *)self setTimeoutBlock:0];
  }
  [(PBFPPTBlockOperation *)self setState:2];
  [(PBFPPTOperation *)self operationDidFinish];
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)PBFPPTBlockOperation;
  [(PBFPPTBlockOperation *)&v3 cancel];
  self->_cancelled = 1;
  [(PBFPPTBlockOperation *)self finish];
}

- (void)cancelAndFailTestWithReason:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [UIApp runningPPTTestName];
  [UIApp failedTest:v5 withFailure:v4];
  v9.receiver = self;
  v9.super_class = (Class)PBFPPTBlockOperation;
  [(PBFPPTBlockOperation *)&v9 cancel];
  self->_cancelled = 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PBFPPTOperation *)self operationName];
    id v7 = (void *)v6;
    if (v6) {
      id v8 = (PBFPPTBlockOperation *)v6;
    }
    else {
      id v8 = self;
    }
    *(_DWORD *)buf = 138412546;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' cancelled for reason: %@", buf, 0x16u);
  }
  [(PBFPPTBlockOperation *)self finish];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return (id)[(PBFPPTBlockOperation *)self state] == (id)1;
}

- (BOOL)isFinished
{
  return (id)[(PBFPPTBlockOperation *)self state] == (id)2;
}

- (void)start
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(PBFPPTBlockOperation *)self dependencies];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) isCancelled])
        {
          [(PBFPPTBlockOperation *)self cancel];

          return;
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (([(PBFPPTBlockOperation *)self isCancelled] & 1) == 0)
  {
    if ([(PBFPPTBlockOperation *)self isExecuting])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100007B40(self);
      }
    }
    else if ([(PBFPPTBlockOperation *)self isFinished])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100007BD8(self);
      }
    }
    else
    {
      [(PBFPPTBlockOperation *)self setState:1];
      [(PBFPPTBlockOperation *)self main];
    }
  }
}

- (void)main
{
  [(PBFPPTBlockOperation *)self timeoutInterval];
  double v4 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000782C;
  v8[3] = &unk_10000C978;
  v8[4] = self;
  *(double *)&v8[5] = v3;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  [(PBFPPTBlockOperation *)self setTimeoutBlock:v5];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v5);
  [(PBFPPTOperation *)self operationWillStart];
  id v7 = [(PBFPPTBlockOperation *)self block];
  ((void (**)(void, PBFPPTBlockOperation *))v7)[2](v7, self);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (id)timeoutBlock
{
  id WeakRetained = objc_loadWeakRetained(&self->_timeoutBlock);

  return WeakRetained;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_destroyWeak(&self->_timeoutBlock);
}

@end