@interface HMDMessageHandlerQueuedMessage
+ (id)logCategory;
- (HMDMessageHandlerQueuedMessage)initWithMessage:(id)a3;
- (HMDMessageHandlerQueuedMessage)initWithMessage:(id)a3 timeInterval:(double)a4;
- (HMDMessageHandlerQueuedMessageDelegate)delegate;
- (HMFMessage)message;
- (HMFTimer)timer;
- (NSString)name;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)resumeTimer;
- (void)setDelegate:(id)a3;
- (void)suspendTimer;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDMessageHandlerQueuedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMessageHandlerQueuedMessageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMessageHandlerQueuedMessageDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMessageHandlerQueuedMessage *)self message];
  v3 = [v2 identifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDMessageHandlerQueuedMessage *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDMessageHandlerQueuedMessage *)self name];
  v8 = (void *)[v6 initWithName:@"name" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDMessageHandlerQueuedMessage *)self delegate];
  id v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v9;
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did trigger message handler queued message with delegate: %@", (uint8_t *)&v10, 0x16u);
  }
  [v5 didTriggerMessageHandlerQueuedMessage:v7];
}

- (NSString)name
{
  v2 = [(HMDMessageHandlerQueuedMessage *)self message];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (NSUUID)identifier
{
  v2 = [(HMDMessageHandlerQueuedMessage *)self message];
  id v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (void)suspendTimer
{
  id v2 = [(HMDMessageHandlerQueuedMessage *)self timer];
  [v2 suspend];
}

- (void)resumeTimer
{
  id v2 = [(HMDMessageHandlerQueuedMessage *)self timer];
  [v2 resume];
}

- (HMDMessageHandlerQueuedMessage)initWithMessage:(id)a3 timeInterval:(double)a4
{
  id v7 = a3;
  v8 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:2 options:a4];
  v12.receiver = self;
  v12.super_class = (Class)HMDMessageHandlerQueuedMessage;
  v9 = [(HMDMessageHandlerQueuedMessage *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_timer, v8);
    [(HMFTimer *)v10->_timer setDelegate:v10];
  }

  return v10;
}

- (HMDMessageHandlerQueuedMessage)initWithMessage:(id)a3
{
  return [(HMDMessageHandlerQueuedMessage *)self initWithMessage:a3 timeInterval:60.0];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_134378 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_134378, &__block_literal_global_134379);
  }
  id v2 = (void *)logCategory__hmf_once_v2_134380;
  return v2;
}

void __45__HMDMessageHandlerQueuedMessage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_134380;
  logCategory__hmf_once_v2_134380 = v0;
}

@end