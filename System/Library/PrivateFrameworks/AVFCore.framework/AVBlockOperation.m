@interface AVBlockOperation
- (AVBlockOperation)init;
- (AVBlockOperation)initWithBlock:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)start;
@end

@implementation AVBlockOperation

- (AVBlockOperation)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithBlock_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVBlockOperation)initWithBlock:(id)a3
{
  if (!a3)
  {
    uint64_t v8 = self;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"block != nil"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVBlockOperation;
  v4 = [(AVOperation *)&v15 init];
  if (v4) {
    v4->_block = (id)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVBlockOperation;
  [(AVOperation *)&v3 dealloc];
}

- (void)start
{
  if ([(AVOperation *)self evaluateDependenciesAndMarkAsExecuting])
  {
    uint64_t v3 = (*((uint64_t (**)(void))self->_block + 2))();
    if (v3 == 4)
    {
      [(AVOperation *)self markAsFailedWithError:0];
    }
    else if (v3 == 2)
    {
      [(AVOperation *)self markAsCompleted];
    }
    else
    {
      [(AVOperation *)self markAsCancelled];
    }
  }
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)AVBlockOperation;
  [(AVBlockOperation *)&v2 cancel];
}

@end