@interface PHImportBatch
- (NSMutableArray)records;
- (OS_dispatch_semaphore)semaphore;
- (PHImportBatch)init;
- (PHImportTimerCollection)timers;
- (double)duration;
@end

@implementation PHImportBatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (PHImportTimerCollection)timers
{
  return self->_timers;
}

- (NSMutableArray)records
{
  return self->_records;
}

- (double)duration
{
  [(NSDate *)self->_start timeIntervalSinceNow];
  return -v2;
}

- (PHImportBatch)init
{
  v12.receiver = self;
  v12.super_class = (Class)PHImportBatch;
  double v2 = [(PHImportBatch *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    start = v2->_start;
    v2->_start = (NSDate *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
    records = v2->_records;
    v2->_records = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    timers = v2->_timers;
    v2->_timers = (PHImportTimerCollection *)v7;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v9;
  }
  return v2;
}

@end