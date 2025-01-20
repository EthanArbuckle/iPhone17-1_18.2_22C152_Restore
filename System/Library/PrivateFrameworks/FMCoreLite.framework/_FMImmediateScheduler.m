@interface _FMImmediateScheduler
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
@end

@implementation _FMImmediateScheduler

- (void)performBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3
{
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  v3 = objc_alloc_init(FMCancelationToken);
  return v3;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F29060];
  v6 = (void (**)(void))a4;
  [v5 sleepForTimeInterval:a3];
  v6[2](v6);

  v7 = objc_alloc_init(FMCancelationToken);
  return v7;
}

@end