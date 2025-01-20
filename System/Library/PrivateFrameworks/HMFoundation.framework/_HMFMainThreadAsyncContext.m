@interface _HMFMainThreadAsyncContext
- (id)description;
- (void)assertIsExecuting;
- (void)performBlock:(id)a3;
@end

@implementation _HMFMainThreadAsyncContext

- (void)assertIsExecuting
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _HMFPreconditionFailure(@"[NSThread isMainThread]");
  }
}

- (void)performBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v4[2]();
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v3 performBlock:v4];
  }
}

- (id)description
{
  return @"HMFMainThreadAsyncContext";
}

@end