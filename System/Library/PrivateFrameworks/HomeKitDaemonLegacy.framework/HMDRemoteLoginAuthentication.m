@interface HMDRemoteLoginAuthentication
+ (id)logCategory;
- (HMDDevice)remoteDevice;
- (HMDRemoteLoginAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6;
- (HMDRemoteLoginMessageSender)remoteMessageSender;
- (NSString)sessionID;
- (OS_dispatch_queue)workQueue;
- (void)authenticate;
@end

@implementation HMDRemoteLoginAuthentication

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)authenticate
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDRemoteLoginAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDRemoteLoginAuthentication;
  v15 = [(HMDRemoteLoginAuthentication *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_remoteDevice, a4);
    objc_storeStrong((id *)&v16->_workQueue, a5);
    objc_storeStrong((id *)&v16->_remoteMessageSender, a6);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_80938 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_80938, &__block_literal_global_80939);
  }
  v2 = (void *)logCategory__hmf_once_v1_80940;
  return v2;
}

uint64_t __43__HMDRemoteLoginAuthentication_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_80940;
  logCategory__hmf_once_v1_80940 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end