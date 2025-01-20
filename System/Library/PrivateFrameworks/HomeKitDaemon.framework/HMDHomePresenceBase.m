@interface HMDHomePresenceBase
+ (id)logCategory;
+ (id)messageTargetUUIDFromHomeUUID:(id)a3;
- (HMDHome)home;
- (HMDNotificationRegistration)notificationRegistration;
- (HMFMessageDispatcher)msgDispatcher;
- (NSString)logString;
- (NSUUID)presenceMonitorMessageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (void)_initialize:(id)a3;
- (void)_registerForMessages;
- (void)configure:(id)a3 messageDispatcher:(id)a4;
- (void)setHome:(id)a3;
- (void)setLogString:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setPresenceMonitorMessageTargetUUID:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDHomePresenceBase

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_147690 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_147690, &__block_literal_global_147691);
  }
  v2 = (void *)logCategory__hmf_once_v1_147692;
  return v2;
}

void __34__HMDHomePresenceBase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_147692;
  logCategory__hmf_once_v1_147692 = v0;
}

+ (id)messageTargetUUIDFromHomeUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08C38];
  v9 = @"kPresenceMonitorIdentifierSalt";
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];
  v7 = objc_msgSend(v3, "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v6, v9, v10);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_presenceMonitorMessageTargetUUID, 0);
  objc_storeStrong((id *)&self->_logString, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDNotificationRegistration)notificationRegistration
{
  return self->_notificationRegistration;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setPresenceMonitorMessageTargetUUID:(id)a3
{
}

- (NSUUID)presenceMonitorMessageTargetUUID
{
  return self->_presenceMonitorMessageTargetUUID;
}

- (void)setLogString:(id)a3
{
}

- (NSString)logString
{
  return self->_logString;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)_registerForMessages
{
  id v2 = [(HMDHomePresenceBase *)self notificationRegistration];
  [v2 addObserver:sel_handleHomeDataLoadedNotification_ name:@"HMDHomeManagerHomeDataLoadedNotification" object:0];
}

- (void)configure:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a4;
  [(HMDHomePresenceBase *)self _initialize:a3];
  [(HMDHomePresenceBase *)self setMsgDispatcher:v6];

  [(HMDHomePresenceBase *)self _registerForMessages];
}

- (void)_initialize:(id)a3
{
  p_home = &self->_home;
  id v5 = a3;
  objc_storeWeak((id *)p_home, v5);
  id v6 = objc_opt_class();
  v7 = [v5 uuid];
  v8 = [v6 messageTargetUUIDFromHomeUUID:v7];
  presenceMonitorMessageTargetUUID = self->_presenceMonitorMessageTargetUUID;
  self->_presenceMonitorMessageTargetUUID = v8;

  uint64_t v10 = [v5 workQueue];
  workQueue = self->_workQueue;
  self->_workQueue = v10;

  v12 = NSString;
  v13 = [v5 name];
  if ([v5 isOwnerUser]) {
    v14 = @"owner";
  }
  else {
    v14 = @"shared";
  }
  v15 = [v5 uuid];

  v16 = [v15 UUIDString];
  v17 = [v12 stringWithFormat:@"%@/%@/%@", v13, v14, v16];
  logString = self->_logString;
  self->_logString = v17;

  v19 = [[HMDNotificationRegistration alloc] initWithRegisterer:self];
  notificationRegistration = self->_notificationRegistration;
  self->_notificationRegistration = v19;
}

@end