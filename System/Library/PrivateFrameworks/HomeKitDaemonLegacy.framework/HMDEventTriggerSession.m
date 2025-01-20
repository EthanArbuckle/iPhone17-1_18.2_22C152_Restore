@interface HMDEventTriggerSession
+ (id)logCategory;
- (BOOL)sendMessage:(id)a3 payload:(id)a4 device:(id)a5 responseHandler:(id)a6;
- (BOOL)sendMessage:(id)a3 payload:(id)a4 device:(id)a5 target:(id)a6 responseHandler:(id)a7;
- (BOOL)sendResidentMessage:(id)a3 payload:(id)a4 responseHandler:(id)a5;
- (HMDDevice)currentDevice;
- (HMDEventTrigger)eventTrigger;
- (HMDEventTriggerSession)initWithSessionID:(id)a3 eventTrigger:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6;
- (HMFMessageDispatcher)msgDispatcher;
- (NSString)description;
- (NSString)logString;
- (NSUUID)eventTriggerUUID;
- (NSUUID)sessionID;
- (OS_dispatch_queue)workQueue;
- (id)dumpState;
- (void)dealloc;
- (void)setEventTrigger:(id)a3;
@end

@implementation HMDEventTriggerSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_eventTriggerUUID, 0);
  objc_destroyWeak((id *)&self->_eventTrigger);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_logString, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDDevice)currentDevice
{
  return self->_currentDevice;
}

- (NSUUID)eventTriggerUUID
{
  return self->_eventTriggerUUID;
}

- (void)setEventTrigger:(id)a3
{
}

- (HMDEventTrigger)eventTrigger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventTrigger);
  return (HMDEventTrigger *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (NSString)logString
{
  return self->_logString;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (BOOL)sendMessage:(id)a3 payload:(id)a4 device:(id)a5 target:(id)a6 responseHandler:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(HMDEventTriggerSession *)self eventTrigger];
  v18 = [v17 home];
  v19 = [v18 homeManager];
  v20 = [v19 messageDispatcher];

  v21 = [[HMDRemoteDeviceMessageDestination alloc] initWithTarget:v15 device:v14];
  if (v21) {
    BOOL v22 = v20 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  BOOL v23 = !v22;
  if (!v22)
  {
    id v31 = v13;
    v24 = +[HMDRemoteMessage secureMessageWithName:v12 qualityOfService:25 destination:v21 messagePayload:v13];
    v32 = [v24 identifier];
    context = (void *)MEMORY[0x1D9452090]([v24 setResponseHandler:v16]);
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = BOOL v29 = v23;
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      __int16 v35 = 2112;
      id v36 = v12;
      __int16 v37 = 2112;
      v38 = v32;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ with identifier %@", buf, 0x20u);

      BOOL v23 = v29;
    }

    [v20 sendMessage:v24 completionHandler:0];

    id v13 = v31;
  }

  return v23;
}

- (BOOL)sendMessage:(id)a3 payload:(id)a4 device:(id)a5 responseHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(HMDEventTriggerSession *)self sessionID];
  LOBYTE(self) = [(HMDEventTriggerSession *)self sendMessage:v13 payload:v12 device:v11 target:v14 responseHandler:v10];

  return (char)self;
}

- (BOOL)sendResidentMessage:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDEventTriggerSession *)self eventTrigger];
  id v12 = [v11 home];
  id v13 = [v12 primaryResident];

  id v14 = [v13 device];
  if ([v13 supportsSharedEventTriggerActivation]) {
    BOOL v15 = [(HMDEventTriggerSession *)self sendMessage:v8 payload:v9 device:v14 responseHandler:v10];
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDEventTriggerSession *)self logString];
  v5 = [(HMDEventTriggerSession *)self sessionID];
  v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"[Event Trigger Session: %@/%@]", v4, v6];

  return (NSString *)v7;
}

- (id)dumpState
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDEventTriggerSession *)self sessionID];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"uuid"];

  v6 = (void *)[v3 copy];
  return v6;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543618;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating the %@ session", buf, 0x16u);
  }
  id v9 = +[HMDBulletinBoard sharedBulletinBoard];
  id v10 = [(HMDEventTriggerSession *)v4 eventTriggerUUID];
  id v11 = [v10 UUIDString];
  [v9 removeBulletinsForTrigger:v11];

  v12.receiver = v4;
  v12.super_class = (Class)HMDEventTriggerSession;
  [(HMDEventTriggerSession *)&v12 dealloc];
}

- (HMDEventTriggerSession)initWithSessionID:(id)a3 eventTrigger:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)HMDEventTriggerSession;
  __int16 v15 = [(HMDEventTriggerSession *)&v31 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeWeak((id *)&v16->_eventTrigger, v12);
    uint64_t v17 = [v12 uuid];
    eventTriggerUUID = v16->_eventTriggerUUID;
    v16->_eventTriggerUUID = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_workQueue, a5);
    objc_storeStrong((id *)&v16->_msgDispatcher, a6);
    v30 = NSString;
    v19 = [v12 name];
    v20 = [v12 uuid];
    v21 = [v20 UUIDString];
    BOOL v22 = [(HMDEventTriggerSession *)v16 sessionID];
    [v22 UUIDString];
    id v23 = v14;
    id v24 = v13;
    v26 = id v25 = v11;
    uint64_t v27 = [v30 stringWithFormat:@"%@/%@/%@", v19, v21, v26];
    logString = v16->_logString;
    v16->_logString = (NSString *)v27;

    id v11 = v25;
    id v13 = v24;
    id v14 = v23;

    [(HMDEventTriggerSession *)v16 _registerForMessages];
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_68092 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_68092, &__block_literal_global_68093);
  }
  v2 = (void *)logCategory__hmf_once_v2_68094;
  return v2;
}

uint64_t __37__HMDEventTriggerSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_68094;
  logCategory__hmf_once_v2_68094 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end