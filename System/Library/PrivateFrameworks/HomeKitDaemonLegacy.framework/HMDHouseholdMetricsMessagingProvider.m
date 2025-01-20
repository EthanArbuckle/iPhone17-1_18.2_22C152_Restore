@interface HMDHouseholdMetricsMessagingProvider
+ (id)logCategory;
- (HMDHouseholdMetricsMessagingProvider)initWithReceiver:(id)a3;
- (HMDHouseholdMetricsMessagingProvider)initWithReceiver:(id)a3 messageDispatcher:(id)a4;
- (HMDMessageDispatcher)messageDispatcher;
- (HMFMessageReceiver)receiver;
- (void)deregisterForMessage:(id)a3;
- (void)registerForMessage:(id)a3 selector:(SEL)a4;
- (void)sendMessage:(id)a3 toDevice:(id)a4 withPayload:(id)a5 responseHandler:(id)a6;
@end

@implementation HMDHouseholdMetricsMessagingProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (HMFMessageReceiver)receiver
{
  return self->_receiver;
}

- (void)deregisterForMessage:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDHouseholdMetricsMessagingProvider *)self messageDispatcher];
  v5 = [(HMDHouseholdMetricsMessagingProvider *)self receiver];
  [v6 deregisterForMessage:v4 receiver:v5];
}

- (void)registerForMessage:(id)a3 selector:(SEL)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HMDHouseholdMetricsMessagingProvider *)self messageDispatcher];
  v8 = [(HMDHouseholdMetricsMessagingProvider *)self receiver];
  v9 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v11[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v7 registerForMessage:v6 receiver:v8 policies:v10 selector:a4];
}

- (void)sendMessage:(id)a3 toDevice:(id)a4 withPayload:(id)a5 responseHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [HMDRemoteDeviceMessageDestination alloc];
  v15 = [(HMDHouseholdMetricsMessagingProvider *)self receiver];
  v16 = [v15 messageTargetUUID];
  v19 = [(HMDRemoteDeviceMessageDestination *)v14 initWithTarget:v16 device:v12];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:v13 destination:v19 payload:v11];
  [v17 setTimeout:0.0];
  [v17 setSecureRemote:1];
  [v17 setResponseHandler:v10];

  v18 = [(HMDHouseholdMetricsMessagingProvider *)self messageDispatcher];
  [v18 sendMessage:v17 completionHandler:0];
}

- (HMDHouseholdMetricsMessagingProvider)initWithReceiver:(id)a3 messageDispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHouseholdMetricsMessagingProvider;
  v9 = [(HMDHouseholdMetricsMessagingProvider *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_receiver, a3);
    objc_storeStrong((id *)&v10->_messageDispatcher, a4);
  }

  return v10;
}

- (HMDHouseholdMetricsMessagingProvider)initWithReceiver:(id)a3
{
  id v4 = a3;
  v5 = +[HMDMessageDispatcher defaultDispatcher];
  id v6 = [(HMDHouseholdMetricsMessagingProvider *)self initWithReceiver:v4 messageDispatcher:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_189488 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_189488, &__block_literal_global_189489);
  }
  v2 = (void *)logCategory__hmf_once_v1_189490;
  return v2;
}

uint64_t __51__HMDHouseholdMetricsMessagingProvider_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_189490;
  logCategory__hmf_once_v1_189490 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end