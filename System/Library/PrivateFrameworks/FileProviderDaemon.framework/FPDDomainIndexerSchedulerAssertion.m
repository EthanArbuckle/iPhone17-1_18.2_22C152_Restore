@interface FPDDomainIndexerSchedulerAssertion
- (FPDDomainIndexerSchedulerAssertion)initWithPID:(int)a3 forceForeground:(BOOL)a4;
- (void)dealloc;
- (void)processMonitor:(id)a3 didBecomeForeground:(BOOL)a4;
- (void)start;
- (void)stop;
@end

@implementation FPDDomainIndexerSchedulerAssertion

- (void)processMonitor:(id)a3 didBecomeForeground:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  v6 = self;
  objc_sync_enter(v6);
  unregisterForceRunning = (void (**)(void))v6->_unregisterForceRunning;
  if (v4)
  {
    if (unregisterForceRunning) {
      goto LABEL_7;
    }
    v8 = indexingScheduler();
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"request from pid: %d", v6->_pid);
    uint64_t v10 = [v8 forceRunningWithReason:v9];
    id v11 = v6->_unregisterForceRunning;
    v6->_unregisterForceRunning = (id)v10;
  }
  else
  {
    if (!unregisterForceRunning) {
      goto LABEL_7;
    }
    unregisterForceRunning[2]();
    v8 = v6->_unregisterForceRunning;
    v6->_unregisterForceRunning = 0;
  }

LABEL_7:
  objc_sync_exit(v6);
}

- (void)start
{
  if (self->_forceForeground)
  {
    [(FPDDomainIndexerSchedulerAssertion *)self processMonitor:0 didBecomeForeground:1];
  }
  else if (!self->_monitor)
  {
    v3 = [FPDProcessMonitor alloc];
    BOOL v4 = [(FPDProcessMonitor *)v3 initWithExcludedBundleIDs:MEMORY[0x1E4F1CBF0]];
    monitor = self->_monitor;
    self->_monitor = v4;

    [(FPDProcessMonitor *)self->_monitor setDelegate:self];
    v6 = self->_monitor;
    uint64_t pid = self->_pid;
    [(FPDProcessMonitor *)v6 addPIDToObserve:pid];
  }
}

- (FPDDomainIndexerSchedulerAssertion)initWithPID:(int)a3 forceForeground:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FPDDomainIndexerSchedulerAssertion;
  result = [(FPDDomainIndexerSchedulerAssertion *)&v7 init];
  if (result)
  {
    result->_uint64_t pid = a3;
    result->_forceForeground = a4;
  }
  return result;
}

- (void)stop
{
  v2 = self;
  objc_sync_enter(v2);
  unregisterForceRunning = (void (**)(void))v2->_unregisterForceRunning;
  if (unregisterForceRunning)
  {
    unregisterForceRunning[2]();
    id v4 = v2->_unregisterForceRunning;
    v2->_unregisterForceRunning = 0;
  }
  [(FPDProcessMonitor *)v2->_monitor setDelegate:0];
  monitor = v2->_monitor;
  v2->_monitor = 0;
  v6 = monitor;

  objc_sync_exit(v2);
  [(FPDProcessMonitor *)v6 invalidate];
}

- (void)dealloc
{
  [(FPDDomainIndexerSchedulerAssertion *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)FPDDomainIndexerSchedulerAssertion;
  [(FPDDomainIndexerSchedulerAssertion *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterForceRunning, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end