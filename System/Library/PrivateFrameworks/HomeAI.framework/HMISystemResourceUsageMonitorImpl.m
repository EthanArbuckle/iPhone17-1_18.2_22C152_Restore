@interface HMISystemResourceUsageMonitorImpl
- (HMISystemResourceUsageMonitorDelegate)delegate;
- (HMISystemResourceUsageMonitorImpl)initWithProductClass:(int64_t)a3 workQueue:(id)a4;
- (HMISystemResourceUsageMonitorProtocol)resourceUsageMonitor;
- (OS_dispatch_queue)workQueue;
- (id)getCurrentSystemResourceUsage;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation HMISystemResourceUsageMonitorImpl

- (HMISystemResourceUsageMonitorImpl)initWithProductClass:(int64_t)a3 workQueue:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMISystemResourceUsageMonitorImpl;
  v8 = [(HMISystemResourceUsageMonitorImpl *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    if (a3 == 3)
    {
      v10 = [[HMISystemResourceUsageMonitoriPad alloc] initWithWorkQueue:v7];
      resourceUsageMonitor = v9->_resourceUsageMonitor;
      v9->_resourceUsageMonitor = (HMISystemResourceUsageMonitorProtocol *)v10;
    }
    if (!v9->_resourceUsageMonitor)
    {
      v12 = (void *)MEMORY[0x22A641C70]();
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        v15 = HMFProductClassToString();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Unsupported product class:%@ for system resource usage monitoring", buf, 0x16u);
      }
    }
    v16 = v9;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HMISystemResourceUsageMonitorImpl *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMISystemResourceUsageMonitorImpl *)self resourceUsageMonitor];
  [v6 setDelegate:v4];
}

- (HMISystemResourceUsageMonitorDelegate)delegate
{
  v3 = [(HMISystemResourceUsageMonitorImpl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMISystemResourceUsageMonitorImpl *)self resourceUsageMonitor];
  v5 = [v4 delegate];

  return (HMISystemResourceUsageMonitorDelegate *)v5;
}

- (void)start
{
  v3 = [(HMISystemResourceUsageMonitorImpl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMISystemResourceUsageMonitorImpl *)self resourceUsageMonitor];
  [v4 start];
}

- (id)getCurrentSystemResourceUsage
{
  v3 = [(HMISystemResourceUsageMonitorImpl *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMISystemResourceUsageMonitorImpl *)self resourceUsageMonitor];
  v5 = [v4 getCurrentSystemResourceUsage];

  return v5;
}

- (HMISystemResourceUsageMonitorProtocol)resourceUsageMonitor
{
  return (HMISystemResourceUsageMonitorProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_resourceUsageMonitor, 0);
}

@end