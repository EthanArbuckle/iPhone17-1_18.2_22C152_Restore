@interface _CNMainThreadScheduler
- (CNScheduler)inlineScheduler;
- (CNScheduler)jumpToMainScheduler;
- (_CNMainThreadScheduler)init;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (id)schedulerForImmediateExecution;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNMainThreadScheduler

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(_CNMainThreadScheduler *)self schedulerForImmediateExecution];
  v8 = [v7 performCancelableBlock:v6 qualityOfService:a4];

  return v8;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNMainThreadScheduler *)self schedulerForImmediateExecution];
  [v5 performBlock:v4];
}

- (id)schedulerForImmediateExecution
{
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [(_CNMainThreadScheduler *)self inlineScheduler];
  }
  else {
  v3 = [(_CNMainThreadScheduler *)self jumpToMainScheduler];
  }

  return v3;
}

- (CNScheduler)inlineScheduler
{
  return self->_inlineScheduler;
}

- (CNScheduler)jumpToMainScheduler
{
  return self->_jumpToMainScheduler;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  v7 = [(_CNMainThreadScheduler *)self schedulerForDelayedExecution];
  v8 = [v7 afterDelay:v6 performBlock:a3];

  return v8;
}

- (_CNMainThreadScheduler)init
{
  v11.receiver = self;
  v11.super_class = (Class)_CNMainThreadScheduler;
  v2 = [(_CNMainThreadScheduler *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(_CNInlineScheduler);
    inlineScheduler = v2->_inlineScheduler;
    v2->_inlineScheduler = (CNScheduler *)v3;

    BOOL v5 = +[_CNJumpToMainRunLoopScheduler isAvailable];
    id v6 = off_1E569EF88;
    if (v5) {
      id v6 = off_1E569EF90;
    }
    v7 = (CNScheduler *)objc_alloc_init(*v6);
    jumpToMainScheduler = v2->_jumpToMainScheduler;
    v2->_jumpToMainScheduler = v7;

    v9 = v2;
  }

  return v2;
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(_CNMainThreadScheduler *)self schedulerForImmediateExecution];
  [v7 performBlock:v6 qualityOfService:a4];
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNMainThreadScheduler *)self schedulerForImmediateExecution];
  id v6 = [v5 performCancelableBlock:v4];

  return v6;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  v9 = [(_CNMainThreadScheduler *)self schedulerForDelayedExecution];
  v10 = [v9 afterDelay:v8 performBlock:a5 qualityOfService:a3];

  return v10;
}

- (double)timestamp
{
  v2 = [(_CNMainThreadScheduler *)self schedulerForImmediateExecution];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jumpToMainScheduler, 0);

  objc_storeStrong((id *)&self->_inlineScheduler, 0);
}

@end