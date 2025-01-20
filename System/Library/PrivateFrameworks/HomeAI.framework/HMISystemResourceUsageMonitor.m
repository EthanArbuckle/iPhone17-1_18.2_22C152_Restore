@interface HMISystemResourceUsageMonitor
- (HMISystemResourceUsageMonitor)init;
- (HMISystemResourceUsageMonitorDelegate)delegate;
- (HMISystemResourceUsageMonitorImpl)systemResourceUsageMonitorImpl;
- (OS_dispatch_queue)workQueue;
- (id)getCurrentSystemResourceUsage;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation HMISystemResourceUsageMonitor

- (HMISystemResourceUsageMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)HMISystemResourceUsageMonitor;
  v2 = [(HMISystemResourceUsageMonitor *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F42620] productInfo];
    uint64_t v4 = [v3 productClass];

    HMIDispatchQueueNameString(v2, 0);
    id v5 = objc_claimAutoreleasedReturnValue();
    v6 = (const char *)[v5 UTF8String];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);

    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;
    v10 = v8;

    v11 = [[HMISystemResourceUsageMonitorImpl alloc] initWithProductClass:v4 workQueue:v10];
    systemResourceUsageMonitorImpl = v2->_systemResourceUsageMonitorImpl;
    v2->_systemResourceUsageMonitorImpl = v11;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMISystemResourceUsageMonitor *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HMISystemResourceUsageMonitor_setDelegate___block_invoke;
  v7[3] = &unk_26477B788;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__HMISystemResourceUsageMonitor_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) systemResourceUsageMonitorImpl];
  [v2 setDelegate:v1];
}

- (HMISystemResourceUsageMonitorDelegate)delegate
{
  v3 = [(HMISystemResourceUsageMonitor *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMISystemResourceUsageMonitor *)self systemResourceUsageMonitorImpl];
  id v5 = [v4 delegate];

  return (HMISystemResourceUsageMonitorDelegate *)v5;
}

- (id)getCurrentSystemResourceUsage
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v3 = [(HMISystemResourceUsageMonitor *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HMISystemResourceUsageMonitor_getCurrentSystemResourceUsage__block_invoke;
  v6[3] = &unk_26477B7B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __62__HMISystemResourceUsageMonitor_getCurrentSystemResourceUsage__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) systemResourceUsageMonitorImpl];
  uint64_t v2 = [v5 getCurrentSystemResourceUsage];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)start
{
  uint64_t v3 = [(HMISystemResourceUsageMonitor *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HMISystemResourceUsageMonitor_start__block_invoke;
  block[3] = &unk_26477B7D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __38__HMISystemResourceUsageMonitor_start__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) systemResourceUsageMonitorImpl];
  [v1 start];
}

- (HMISystemResourceUsageMonitorImpl)systemResourceUsageMonitorImpl
{
  return (HMISystemResourceUsageMonitorImpl *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_systemResourceUsageMonitorImpl, 0);
}

@end