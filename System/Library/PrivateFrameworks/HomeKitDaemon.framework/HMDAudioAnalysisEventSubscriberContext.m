@interface HMDAudioAnalysisEventSubscriberContext
+ (id)logCategory;
- (BOOL)dropInEnabled;
- (BOOL)isAudioAnalysisEventNotificationEnabled;
- (BOOL)isCurrentAccessory;
- (HMDAppleMediaAccessory)accessory;
- (HMDAudioAnalysisEventSubscriberContext)initWithAccessory:(id)a3 queue:(id)a4;
- (HMDBulletinBoard)bulletinBoard;
- (HMDDevice)device;
- (HMDHome)home;
- (HMEEventForwarder)eventForwarder;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMFMessageDispatcher)dispatcher;
- (NSPredicate)audioAnalysisEventNotificationCondition;
- (NSString)name;
- (NSString)roomName;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5;
- (void)submitLogEvent:(id)a3;
- (void)submitLogEvent:(id)a3 error:(id)a4;
@end

@implementation HMDAudioAnalysisEventSubscriberContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(HMDAudioAnalysisEventSubscriberContext *)self eventForwarder];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__HMDAudioAnalysisEventSubscriberContext_forwardEvent_topic_completion___block_invoke;
  v13[3] = &unk_264A2E288;
  id v14 = v8;
  id v12 = v8;
  [v11 forwardEvent:v10 topic:v9 completion:v13];
}

uint64_t __72__HMDAudioAnalysisEventSubscriberContext_forwardEvent_topic_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v7 submitLogEvent:v6 error:v5];
}

- (void)submitLogEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v4 submitLogEvent:v3];
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)+[HMDBulletinBoard sharedBulletinBoard];
}

- (id)logIdentifier
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (HMDHome)home
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  id v3 = [v2 home];

  return (HMDHome *)v3;
}

- (NSString)roomName
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  id v3 = [v2 room];
  id v4 = [v3 name];

  return (NSString *)v4;
}

- (BOOL)isCurrentAccessory
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 isCurrentAccessory];

  return v3;
}

- (NSUUID)spiClientIdentifier
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 spiClientIdentifier];

  return (NSUUID *)v3;
}

- (NSUUID)uuid
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (NSString)name
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 name];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 home];
  id v4 = [v3 homeManager];
  id v5 = [v4 eventStoreReadHandle];

  return (HMELastEventStoreReadHandle *)v5;
}

- (HMDAudioAnalysisEventSubscriberContext)initWithAccessory:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAudioAnalysisEventSubscriberContext;
  id v8 = [(HMDAudioAnalysisEventSubscriberContext *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (BOOL)dropInEnabled
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self home];
  char v3 = [v2 currentUser];
  BOOL v4 = [v3 audioAnalysisUserDropInAccessLevel] == 2;

  return v4;
}

- (HMFMessageDispatcher)dispatcher
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 msgDispatcher];

  return (HMFMessageDispatcher *)v3;
}

- (HMEEventForwarder)eventForwarder
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 home];
  BOOL v4 = [v3 homeManager];
  id v5 = [v4 eventForwarder];

  return (HMEEventForwarder *)v5;
}

- (HMDDevice)device
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 device];

  return (HMDDevice *)v3;
}

- (NSPredicate)audioAnalysisEventNotificationCondition
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 audioAnalysisEventNotificationCondition];

  return (NSPredicate *)v3;
}

- (BOOL)isAudioAnalysisEventNotificationEnabled
{
  v2 = [(HMDAudioAnalysisEventSubscriberContext *)self accessory];
  char v3 = [v2 isAudioAnalysisEventNotificationEnabled];

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_52293 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_52293, &__block_literal_global_52294);
  }
  v2 = (void *)logCategory__hmf_once_v1_52295;
  return v2;
}

void __53__HMDAudioAnalysisEventSubscriberContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_52295;
  logCategory__hmf_once_v1_52295 = v0;
}

@end