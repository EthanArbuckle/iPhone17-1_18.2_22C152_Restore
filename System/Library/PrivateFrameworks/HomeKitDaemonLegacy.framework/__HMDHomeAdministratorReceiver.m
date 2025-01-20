@interface __HMDHomeAdministratorReceiver
+ (id)logCategory;
- (HMDHomeAdministratorHandler)handler;
- (HMFMessageReceiver)receiver;
- (NSUUID)messageTargetUUID;
- (__HMDHomeAdministratorReceiver)initWithReceiver:(id)a3 handler:(id)a4;
- (id)logIdentifier;
- (id)shortDescription;
- (void)__handleXPCMessage:(id)a3;
- (void)dealloc;
- (void)registerForMessage:(id)a3 policies:(id)a4;
@end

@implementation __HMDHomeAdministratorReceiver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
  objc_destroyWeak((id *)&self->_receiver);
}

- (HMDHomeAdministratorHandler)handler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  return (HMDHomeAdministratorHandler *)WeakRetained;
}

- (HMFMessageReceiver)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  return (HMFMessageReceiver *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(__HMDHomeAdministratorReceiver *)self receiver];
  v3 = [v2 messageTargetUUID];
  v4 = [v3 UUIDString];

  return v4;
}

- (NSUUID)messageTargetUUID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  v3 = [WeakRetained messageTargetUUID];

  return (NSUUID *)v3;
}

- (void)__handleXPCMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(__HMDHomeAdministratorReceiver *)self receiver];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [v4 shortDescription];
      int v12 = 138543618;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Locally dispatching message: %@", (uint8_t *)&v12, 0x16u);
    }
    v11 = [(__HMDHomeAdministratorReceiver *)v7 handler];
    [v11 dispatchMessage:v4];
  }
}

- (void)registerForMessage:(id)a3 policies:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a3;
    objc_msgSend(a4, "hmf_objectsPassingTest:", &__block_literal_global_125_166993);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [(__HMDHomeAdministratorReceiver *)self handler];
    v8 = [v7 dispatcher];
    [v8 registerForMessage:v6 receiver:self policies:v9 selector:sel___handleXPCMessage_];
  }
}

- (id)shortDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  id v6 = [v3 stringWithFormat:@"%@(%@)", v4, objc_opt_class()];

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  id v4 = objc_loadWeakRetained((id *)&self->_receiver);
  [WeakRetained deregisterReceiver:v4];

  v5 = [WeakRetained dispatcher];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)__HMDHomeAdministratorReceiver;
  [(__HMDHomeAdministratorReceiver *)&v6 dealloc];
}

- (__HMDHomeAdministratorReceiver)initWithReceiver:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)__HMDHomeAdministratorReceiver;
  v8 = [(__HMDHomeAdministratorReceiver *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_receiver, v6);
    objc_storeWeak((id *)&v9->_handler, v7);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_167008 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_167008, &__block_literal_global_130);
  }
  v2 = (void *)logCategory__hmf_once_v14_167009;
  return v2;
}

@end