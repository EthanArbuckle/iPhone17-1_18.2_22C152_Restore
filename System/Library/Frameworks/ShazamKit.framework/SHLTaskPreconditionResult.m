@interface SHLTaskPreconditionResult
+ (id)failedResult;
+ (id)fulfilledResult;
+ (id)resultWithError:(id)a3;
- (BOOL)isSatisfied;
- (NSError)error;
- (SHLTaskPreconditionResult)initWithResult:(BOOL)a3 error:(id)a4;
@end

@implementation SHLTaskPreconditionResult

+ (id)fulfilledResult
{
  v2 = [[SHLTaskPreconditionResult alloc] initWithResult:1 error:0];

  return v2;
}

+ (id)failedResult
{
  v2 = [[SHLTaskPreconditionResult alloc] initWithResult:0 error:0];

  return v2;
}

+ (id)resultWithError:(id)a3
{
  id v3 = a3;
  v4 = [[SHLTaskPreconditionResult alloc] initWithResult:0 error:v3];

  return v4;
}

- (SHLTaskPreconditionResult)initWithResult:(BOOL)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SHLTaskPreconditionResult;
  v8 = [(SHLTaskPreconditionResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_satisfied = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (BOOL)isSatisfied
{
  return self->_satisfied;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end