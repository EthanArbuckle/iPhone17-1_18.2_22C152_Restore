@interface HMDDuetPredictionSubscriber
- (HMDDuetPredictionSubscriber)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (HMDDuetPredictionSubscriber)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 darwinNotificationProvider:(id)a5;
- (HMDDuetPredictionSubscriberDataSource)dataSource;
- (HMDarwinNotificationProvider)darwinNotificationProvider;
- (HMFMessageDispatcher)messageDispatcher;
- (OS_dispatch_queue)workQueue;
- (int)duetPredictionsChangedNotificationToken;
- (void)configure;
- (void)dealloc;
- (void)setDataSource:(id)a3;
- (void)setDuetPredictionsChangedNotificationToken:(int)a3;
@end

@implementation HMDDuetPredictionSubscriber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setDuetPredictionsChangedNotificationToken:(int)a3
{
  self->_duetPredictionsChangedNotificationToken = a3;
}

- (int)duetPredictionsChangedNotificationToken
{
  return self->_duetPredictionsChangedNotificationToken;
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDDuetPredictionSubscriberDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDDuetPredictionSubscriberDataSource *)WeakRetained;
}

- (void)configure
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(HMDDuetPredictionSubscriber *)self duetPredictionsChangedNotificationToken] == -1)
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering for duet prediction change notifications", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v4);
    v7 = [(HMDDuetPredictionSubscriber *)v4 darwinNotificationProvider];
    uint64_t v8 = [@"com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery" UTF8String];
    v9 = [(HMDDuetPredictionSubscriber *)v4 workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__HMDDuetPredictionSubscriber_configure__block_invoke;
    v10[3] = &unk_1E6A13E10;
    objc_copyWeak(&v11, (id *)buf);
    [v7 notifyRegisterDispatch:v8 outToken:&v4->_duetPredictionsChangedNotificationToken queue:v9 handler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __40__HMDDuetPredictionSubscriber_configure__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained dataSource];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = WeakRetained;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Received notification duet predictions changed", (uint8_t *)&v12, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v8 = [v2 updateMessageTargetForDuetPredictionSubscriber:v4];
    v9 = (void *)[v7 initWithTarget:v8];

    v10 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2E228] messagePayload:0];
    [v10 setDestination:v9];
    id v11 = [v4 messageDispatcher];
    [v11 sendMessage:v10];
  }
}

- (void)dealloc
{
  if (self->_duetPredictionsChangedNotificationToken != -1) {
    -[HMDarwinNotificationProvider notifyCancel:](self->_darwinNotificationProvider, "notifyCancel:");
  }
  v3.receiver = self;
  v3.super_class = (Class)HMDDuetPredictionSubscriber;
  [(HMDDuetPredictionSubscriber *)&v3 dealloc];
}

- (HMDDuetPredictionSubscriber)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 darwinNotificationProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDDuetPredictionSubscriber;
  int v12 = [(HMDDuetPredictionSubscriber *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_messageDispatcher, a4);
    objc_storeStrong((id *)&v13->_darwinNotificationProvider, a5);
    v13->_duetPredictionsChangedNotificationToken = -1;
  }

  return v13;
}

- (HMDDuetPredictionSubscriber)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F2E788];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [(HMDDuetPredictionSubscriber *)self initWithWorkQueue:v8 messageDispatcher:v7 darwinNotificationProvider:v9];

  return v10;
}

@end