@interface CNVirtualScheduler
+ (id)providerWithScheduler:(id)a3;
+ (unint64_t)timeWithDelay:(double)a3 fromClock:(unint64_t)a4;
- (BOOL)_performJobs;
- (BOOL)hasJobsScheduled;
- (BOOL)isPerforming;
- (BOOL)isStarted;
- (CNQueue)queue;
- (CNVirtualScheduler)init;
- (NSString)description;
- (double)timestamp;
- (id)_scheduleBlock:(id)a3 atTime:(unint64_t)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (unint64_t)_nextSchedulableTick;
- (unint64_t)clock;
- (unint64_t)nextSchedulableTick;
- (unint64_t)stopTime;
- (void)advanceBy:(unint64_t)a3;
- (void)advanceTo:(unint64_t)a3;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)start;
- (void)stop;
@end

@implementation CNVirtualScheduler

+ (id)providerWithScheduler:(id)a3
{
  id v3 = a3;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __44__CNVirtualScheduler_providerWithScheduler___block_invoke;
  v12 = &unk_1E569FD10;
  id v13 = v3;
  id v4 = v3;
  v5 = _Block_copy(&aBlock);
  v6 = [CNSchedulerProvider alloc];
  v7 = -[CNSchedulerProvider initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:](v6, "initWithBackgroundScheduler:mainThreadScheduler:inlineScheduler:immediateScheduler:serialSchedulerProvider:synchronousSerialSchedulerProvider:readerWriterSchedulerProvider:", v4, v4, v4, v4, v5, &__block_literal_global_11, &__block_literal_global_3, aBlock, v10, v11, v12);

  return v7;
}

id __44__CNVirtualScheduler_providerWithScheduler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

CNScheduler *__44__CNVirtualScheduler_providerWithScheduler___block_invoke_2()
{
  return +[CNScheduler immediateScheduler];
}

CNVirtualReaderWriterScheduler *__44__CNVirtualScheduler_providerWithScheduler___block_invoke_3()
{
  v0 = [CNVirtualReaderWriterScheduler alloc];
  v1 = +[CNScheduler immediateScheduler];
  v2 = [(CNVirtualReaderWriterScheduler *)v0 initWithScheduler:v1];

  return v2;
}

- (CNVirtualScheduler)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNVirtualScheduler;
  v2 = [(CNVirtualScheduler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[CNQueue priorityQueueWithComparator:CNVirtualSchedulerJobTimeComparator];
    queue = v2->_queue;
    v2->_queue = (CNQueue *)v3;

    v2->_isStarted = 0;
    v5 = v2;
  }

  return v2;
}

- (NSString)description
{
  if ([(CNQueue *)self->_queue count])
  {
    uint64_t v3 = [(CNQueue *)self->_queue allObjects];
    id v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_10_0);
    v5 = [v4 sortedArrayUsingSelector:sel_compare_];
    v6 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_16);

    objc_super v7 = NSString;
    uint64_t v8 = [v6 count];
    if ([v6 count] == 1) {
      v9 = @"job";
    }
    else {
      v9 = @"jobs";
    }
    uint64_t v10 = [v6 componentsJoinedByString:@", "];
    [v7 stringWithFormat:@"%lu %@ scheduled for t=%@", v8, v9, v10];
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = @"no jobs scheduled";
  }
  v12 = NSString;
  id v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = [v12 stringWithFormat:@"<%@: %p clock=%lu, %@>", v14, self, self->_clock, v11];

  return (NSString *)v15;
}

uint64_t __33__CNVirtualScheduler_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 time];

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __33__CNVirtualScheduler_description__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (void)performBlock:(id)a3
{
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  id v5 = [(CNVirtualScheduler *)self _scheduleBlock:v6 atTime:[(CNVirtualScheduler *)self _nextSchedulableTick]];
  if (self->_isStarted && !self->_isPerforming) {
    [(CNVirtualScheduler *)self _performJobs];
  }
}

- (id)performCancelableBlock:(id)a3
{
  return [(CNVirtualScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(CNCancelationToken);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v16[3] = &unk_1E569FA00;
  objc_super v7 = v6;
  v17 = v7;
  id v8 = v5;
  id v18 = v8;
  v9 = (void *)[v16 copy];
  uint64_t v10 = [(CNVirtualScheduler *)self _scheduleBlock:v9 atTime:[(CNVirtualScheduler *)self _nextSchedulableTick]];
  objc_initWeak(&location, v10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke_2;
  v13[3] = &unk_1E569FDB8;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  [(CNCancelationToken *)v7 addCancelationBlock:v13];
  if (self->_isStarted && !self->_isPerforming) {
    [(CNVirtualScheduler *)self _performJobs];
  }
  v11 = v7;
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

uint64_t __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __62__CNVirtualScheduler_performCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) queue];
  [v2 dequeueObject:WeakRetained];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(CNVirtualScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v7 = a4;
  id v8 = -[CNVirtualScheduler _scheduleBlock:atTime:](self, "_scheduleBlock:atTime:", v7, [(id)objc_opt_class() timeWithDelay:self->_clock fromClock:a3]);
  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CNVirtualScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E569FDB8;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  v9 = +[CNCancelationToken tokenWithCancelationBlock:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

void __63__CNVirtualScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) queue];
  [v2 dequeueObject:WeakRetained];
}

- (double)timestamp
{
  return (double)[(CNVirtualScheduler *)self clock] / 10000.0;
}

+ (unint64_t)timeWithDelay:(double)a3 fromClock:(unint64_t)a4
{
  unint64_t v4 = vcvtad_u64_f64(a3 * 10000.0) + a4;
  if ((double)(~a4 / 0x2710) <= a3) {
    return -1;
  }
  else {
    return v4;
  }
}

- (id)_scheduleBlock:(id)a3 atTime:(unint64_t)a4
{
  id v5 = +[CNVirtualSchedulerJob jobWithTime:a4 block:a3];
  [(CNQueue *)self->_queue enqueue:v5];

  return v5;
}

- (unint64_t)_nextSchedulableTick
{
  unint64_t v2 = self->_nextSchedulableTick + 1;
  self->_nextSchedulableTick = v2;
  return v2;
}

- (void)start
{
  self->_isStarted = 1;
  [(CNVirtualScheduler *)self _performJobs];
}

- (void)advanceBy:(unint64_t)a3
{
}

- (void)advanceTo:(unint64_t)a3
{
  self->_stopTime = a3;
  if ([(CNVirtualScheduler *)self _performJobs])
  {
    self->_clock = a3;
    self->_nextSchedulableTick = a3;
  }
}

- (BOOL)_performJobs
{
  uint64_t v3 = [(CNQueue *)self->_queue peek];
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    do
    {
      if (!self->_isStarted && [v4 time] > self->_stopTime) {
        break;
      }
      unint64_t v5 = [v4 time];
      self->_clock = v5;
      self->_nextSchedulableTick = v5;
      self->_isPerforming = 1;
      id v6 = [v4 block];
      v6[2]();

      self->_isPerforming = 0;
      [(CNQueue *)self->_queue dequeueObject:v4];
      uint64_t v7 = [(CNQueue *)self->_queue peek];

      unint64_t v4 = (void *)v7;
    }
    while (v7);
  }
  id v8 = [(CNQueue *)self->_queue allObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__CNVirtualScheduler__performJobs__block_invoke;
  v11[3] = &unk_1E569FDE0;
  v11[4] = self;
  int v9 = objc_msgSend(v8, "_cn_any:", v11) ^ 1;

  return v9;
}

BOOL __34__CNVirtualScheduler__performJobs__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 time];
  return v3 <= [*(id *)(a1 + 32) stopTime];
}

- (void)stop
{
  self->_isStarted = 0;
}

- (BOOL)hasJobsScheduled
{
  return [(CNQueue *)self->_queue count] != 0;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (unint64_t)nextSchedulableTick
{
  return self->_nextSchedulableTick;
}

- (unint64_t)stopTime
{
  return self->_stopTime;
}

- (CNQueue)queue
{
  return self->_queue;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (BOOL)isPerforming
{
  return self->_isPerforming;
}

- (void).cxx_destruct
{
}

@end