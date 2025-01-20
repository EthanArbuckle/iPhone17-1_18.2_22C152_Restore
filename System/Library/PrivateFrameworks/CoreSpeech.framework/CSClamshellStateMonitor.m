@interface CSClamshellStateMonitor
+ (id)sharedInstance;
- (BOOL)isClamshellClosed;
- (CSClamshellStateMonitor)init;
- (void)_didReceiveClamshellStateChangeNotification:(BOOL)a3;
- (void)_notifyObserver:(id)a3 withClamshellState:(BOOL)a4;
@end

@implementation CSClamshellStateMonitor

- (void)_notifyObserver:(id)a3 withClamshellState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CSEventMonitor *)self notifyObserver:v6];
  if (objc_opt_respondsToSelector()) {
    [v6 CSClamshellStateMonitor:self didReceiveClamshellStateChange:v4];
  }
}

- (void)_didReceiveClamshellStateChangeNotification:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__CSClamshellStateMonitor__didReceiveClamshellStateChangeNotification___block_invoke;
  v3[3] = &unk_1E658C2E0;
  v3[4] = self;
  BOOL v4 = a3;
  [(CSEventMonitor *)self enumerateObserversInQueue:v3];
}

uint64_t __71__CSClamshellStateMonitor__didReceiveClamshellStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notifyObserver:a2 withClamshellState:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isClamshellClosed
{
  return 0;
}

- (CSClamshellStateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSClamshellStateMonitor;
  return [(CSEventMonitor *)&v3 init];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6820 != -1) {
    dispatch_once(&sharedInstance_onceToken_6820, &__block_literal_global_6821);
  }
  v2 = (void *)sharedInstance__sharedInstance_6822;
  return v2;
}

void __41__CSClamshellStateMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CSClamshellStateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_6822;
  sharedInstance__sharedInstance_6822 = (uint64_t)v0;
}

@end