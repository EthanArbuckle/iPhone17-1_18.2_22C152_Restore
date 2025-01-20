@interface HMDRemoteLoginBase
+ (id)logCategory;
- (HMDAppleMediaAccessory)accessory;
- (HMDRemoteLoginBase)initWithUUID:(id)a3 accessory:(id)a4 remoteLoginHandler:(id)a5;
- (HMDRemoteLoginHandler)remoteLoginHandler;
- (HMFMessageDispatcher)msgDispatcher;
- (NSString)description;
- (NSString)logString;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)setMsgDispatcher:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDRemoteLoginBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logString, 0);
  objc_destroyWeak((id *)&self->_remoteLoginHandler);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)logString
{
  return self->_logString;
}

- (HMDRemoteLoginHandler)remoteLoginHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteLoginHandler);
  return (HMDRemoteLoginHandler *)WeakRetained;
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a4;
  [(HMDRemoteLoginBase *)self setWorkQueue:a3];
  [(HMDRemoteLoginBase *)self setMsgDispatcher:v6];
}

- (NSString)description
{
  v2 = [(HMDRemoteLoginBase *)self uuid];
  v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (HMDRemoteLoginBase)initWithUUID:(id)a3 accessory:(id)a4 remoteLoginHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDRemoteLoginBase;
  v12 = [(HMDRemoteLoginBase *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeWeak((id *)&v13->_accessory, v10);
    objc_storeWeak((id *)&v13->_remoteLoginHandler, v11);
    v14 = NSString;
    v15 = [(HMDRemoteLoginBase *)v13 accessory];
    v16 = [v15 name];
    v17 = [(HMDRemoteLoginBase *)v13 uuid];
    v18 = [v17 UUIDString];
    uint64_t v19 = [v14 stringWithFormat:@"%@/%@", v16, v18];
    logString = v13->_logString;
    v13->_logString = (NSString *)v19;
  }
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_153794 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_153794, &__block_literal_global_153795);
  }
  v2 = (void *)logCategory__hmf_once_v1_153796;
  return v2;
}

void __33__HMDRemoteLoginBase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_153796;
  logCategory__hmf_once_v1_153796 = v0;
}

@end