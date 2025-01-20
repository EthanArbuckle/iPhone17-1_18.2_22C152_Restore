@interface CPLEngineSchedulerBlocker
- (CPLEngineScheduler)scheduler;
- (CPLEngineSchedulerBlocker)initWithReason:(id)a3 scheduler:(id)a4;
- (NSString)reason;
- (void)dealloc;
- (void)unblock;
@end

@implementation CPLEngineSchedulerBlocker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (CPLEngineScheduler)scheduler
{
  return self->_scheduler;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)unblock
{
  v3 = [(CPLEngineScheduler *)self->_scheduler engineLibrary];
  v4 = [v3 syncManager];
  [v4 unblockSyncSessionWithReason:self->_reason];

  [(CPLEngineScheduler *)self->_scheduler enableSynchronizationWithReason:self->_reason];
  self->_blocking = 0;
}

- (void)dealloc
{
  if (self->_blocking) {
    [(CPLEngineScheduler *)self->_scheduler enableSynchronizationWithReason:self->_reason];
  }
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineSchedulerBlocker;
  [(CPLEngineSchedulerBlocker *)&v3 dealloc];
}

- (CPLEngineSchedulerBlocker)initWithReason:(id)a3 scheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLEngineSchedulerBlocker;
  v8 = [(CPLEngineSchedulerBlocker *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeStrong((id *)&v8->_scheduler, a4);
  }

  return v8;
}

@end