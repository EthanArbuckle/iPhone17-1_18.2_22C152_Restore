@interface _CNConstantFutureImpl
- (BOOL)cancel;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (_CNConstantFutureImpl)initWithResult:(id)a3;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (void)addSuccessBlock:(id)a3;
- (void)updateDescriptionWithBuilder:(id)a3;
@end

@implementation _CNConstantFutureImpl

- (void).cxx_destruct
{
}

- (void)addSuccessBlock:(id)a3
{
}

- (_CNConstantFutureImpl)initWithResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNConstantFutureImpl;
  v6 = [(_CNConstantFutureImpl *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_result, a3);
    v8 = v7;
  }

  return v7;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  return self->_result;
}

- (BOOL)isFinished
{
  return 1;
}

- (BOOL)isCancelled
{
  return 0;
}

- (BOOL)cancel
{
  return 0;
}

- (void)updateDescriptionWithBuilder:(id)a3
{
  id v3 = (id)[a3 appendName:@"result" object:self->_result];
}

@end