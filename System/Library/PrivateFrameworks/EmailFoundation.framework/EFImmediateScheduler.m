@interface EFImmediateScheduler
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (id)performWithObject:(id)a3;
- (void)performBlock:(id)a3;
- (void)performSyncBarrierBlock:(id)a3;
- (void)performSyncBlock:(id)a3;
- (void)performVoucherPreservingBlock:(id)a3;
@end

@implementation EFImmediateScheduler

- (void)performBlock:(id)a3
{
}

- (void)performSyncBlock:(id)a3
{
}

- (void)performSyncBarrierBlock:(id)a3
{
}

- (void)performVoucherPreservingBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3
{
  return 0;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  v5 = (void (**)(void))a4;
  [MEMORY[0x1E4F29060] sleepForTimeInterval:a3];
  v5[2](v5);

  return 0;
}

- (id)performWithObject:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() onScheduler:self performWithObject:v4];

  return v5;
}

@end