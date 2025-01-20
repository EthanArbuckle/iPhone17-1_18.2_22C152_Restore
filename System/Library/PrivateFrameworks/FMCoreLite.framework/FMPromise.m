@interface FMPromise
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithNoResult;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (FMFuture)future;
- (FMPromise)init;
- (FMPromise)initWithFuture:(id)a3;
- (NSString)descriptor;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (void)setDescriptor:(id)a3;
@end

@implementation FMPromise

- (FMPromise)init
{
  v3 = objc_alloc_init(FMFuture);
  v4 = [(FMPromise *)self initWithFuture:v3];

  return v4;
}

- (FMPromise)initWithFuture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMPromise;
  v6 = [(FMPromise *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_future, a3);
  }

  return v7;
}

- (NSString)descriptor
{
  return [(FMFuture *)self->_future descriptor];
}

- (void)setDescriptor:(id)a3
{
}

- (BOOL)finishWithResult:(id)a3
{
  return [(FMFuture *)self->_future finishWithResult:a3];
}

- (BOOL)finishWithError:(id)a3
{
  return [(FMFuture *)self->_future finishWithError:a3];
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return [(FMFuture *)self->_future finishWithResult:a3 error:a4];
}

- (BOOL)finishWithNoResult
{
  return [(FMFuture *)self->_future finishWithNoResult];
}

- (id)completionHandlerAdapter
{
  return [(FMFuture *)self->_future completionHandlerAdapter];
}

- (id)errorOnlyCompletionHandlerAdapter
{
  return [(FMFuture *)self->_future errorOnlyCompletionHandlerAdapter];
}

- (FMFuture)future
{
  return (FMFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end