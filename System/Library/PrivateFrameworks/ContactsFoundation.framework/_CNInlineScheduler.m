@interface _CNInlineScheduler
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNInlineScheduler

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  v5 = (void (**)(void))a3;
  v4 = (void *)MEMORY[0x192FD0880]();
  v5[2]();
}

- (void)performBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3
{
  return [(_CNInlineScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  v4 = (void (**)(id, CNInlineSchedulerCancelationToken *))a3;
  v5 = objc_alloc_init(CNInlineSchedulerCancelationToken);
  v6 = (void *)MEMORY[0x192FD0880]();
  v4[2](v4, v5);

  return v5;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(_CNInlineScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  aBlock[3] = &unk_1E56A2130;
  id v7 = v6;
  id v19 = v7;
  v8 = _Block_copy(aBlock);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v10 = CFRunLoopTimerCreateWithHandler(0, Current + a3, 0.0, 0, 0, v8);
  v11 = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(v11, v10, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  v12 = v10;
  v13 = objc_alloc_init(CNInlineSchedulerCancelationToken);
  objc_initWeak(&location, v12);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2;
  v15[3] = &unk_1E56A05E8;
  objc_copyWeak(&v16, &location);
  [(CNCancelationToken *)v13 addCancelationBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v13;
}

- (double)timestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

@end