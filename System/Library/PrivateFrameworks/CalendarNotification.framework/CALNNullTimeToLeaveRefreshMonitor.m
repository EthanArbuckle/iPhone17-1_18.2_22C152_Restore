@interface CALNNullTimeToLeaveRefreshMonitor
+ (CALNNullTimeToLeaveRefreshMonitor)sharedInstance;
- (CALNTimeToLeaveRefreshMonitorDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation CALNNullTimeToLeaveRefreshMonitor

+ (CALNNullTimeToLeaveRefreshMonitor)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CALNNullTimeToLeaveRefreshMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_17 != -1) {
    dispatch_once(&sharedInstance_onceToken_17, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_14;
  return (CALNNullTimeToLeaveRefreshMonitor *)v2;
}

uint64_t __51__CALNNullTimeToLeaveRefreshMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_14 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CALNTimeToLeaveRefreshMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNTimeToLeaveRefreshMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end