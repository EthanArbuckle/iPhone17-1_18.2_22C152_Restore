@interface _CNFailedFutureImpl
- (BOOL)cancel;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (_CNFailedFutureImpl)initWithError:(id)a3;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (void)addFailureBlock:(id)a3;
- (void)updateDescriptionWithBuilder:(id)a3;
@end

@implementation _CNFailedFutureImpl

- (void)addFailureBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (_CNFailedFutureImpl)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNFailedFutureImpl;
  v6 = [(_CNFailedFutureImpl *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = v7;
  }

  return v7;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = self->_error;
  }
  return 0;
}

- (BOOL)isFinished
{
  return 1;
}

- (BOOL)isCancelled
{
  return +[CNFoundationError isCanceledError:self->_error];
}

- (BOOL)cancel
{
  return 0;
}

- (void)updateDescriptionWithBuilder:(id)a3
{
  id v3 = (id)[a3 appendName:@"error" object:self->_error];
}

@end