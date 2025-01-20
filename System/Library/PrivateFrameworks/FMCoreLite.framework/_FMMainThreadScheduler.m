@interface _FMMainThreadScheduler
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)performBlock:(id)a3;
@end

@implementation _FMMainThreadScheduler

- (void)performBlock:(id)a3
{
  block = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    block[2]();
  }
  else
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D418], block);
  }
}

- (id)performCancelableBlock:(id)a3
{
  v3 = (void (**)(id, void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3[2](v3, 0);
    v4 = objc_alloc_init(FMCancelationToken);
  }
  else
  {
    v5 = objc_alloc_init(FMCancelationToken);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49___FMMainThreadScheduler_performCancelableBlock___block_invoke;
    v10[3] = &unk_1E6019468;
    v6 = v5;
    v11 = v6;
    v12 = v3;
    v7 = (void *)MEMORY[0x1B3EB3F00](v10);
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E4F1D418], v7);
    v4 = v6;
  }
  return v4;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F1CB00];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50___FMMainThreadScheduler_afterDelay_performBlock___block_invoke;
  v14[3] = &unk_1E6019490;
  id v7 = v5;
  id v15 = v7;
  v8 = [v6 scheduledTimerWithTimeInterval:0 repeats:v14 block:a3];
  v9 = objc_alloc_init(FMCancelationToken);
  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___FMMainThreadScheduler_afterDelay_performBlock___block_invoke_2;
  v11[3] = &unk_1E60194B8;
  objc_copyWeak(&v12, &location);
  [(FMCancelationToken *)v9 addCancelationBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

@end