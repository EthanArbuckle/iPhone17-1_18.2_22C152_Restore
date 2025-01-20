@interface HMDBulletinBoardNotification
+ (BOOL)supportsBulletinNotificationGroup:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEnabled;
- (HMDBulletinBoardNotification)init;
- (HMDBulletinBoardNotification)initWithCoder:(id)a3;
- (HMDBulletinBoardNotification)initWithService:(id)a3;
- (HMDBulletinBoardNotificationServiceGroup)notificationServiceGroup;
- (HMDHome)home;
- (HMDService)service;
- (HMFMessageDispatcher)msgDispatcher;
- (NSPredicate)condition;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (id)dumpState;
- (id)logIdentifier;
- (void)_handleBulletinBoardNotificationCommitRequest:(id)a3;
- (void)_updateLocalSettingsWithEnabled:(BOOL)a3 condition:(id)a4 forMessage:(id)a5;
- (void)configureBulletinNotification;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)registerForCharacteristicNotifications;
- (void)registerNotificationHandlers;
- (void)setCondition:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setNotificationServiceGroup:(id)a3;
- (void)setService:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDBulletinBoardNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(HMDBulletinBoardNotification *)self service];
  [v8 encodeConditionalObject:v4 forKey:@"service"];

  if (objc_msgSend(v8, "hmd_isForLocalStore"))
  {
    v5 = [(HMDBulletinBoardNotification *)self notificationServiceGroup];
    [v8 encodeObject:v5 forKey:@"HM.BulletinBoardNotificationServiceGroup"];
  }
  BOOL v6 = [(HMDBulletinBoardNotification *)self isEnabled];
  [v8 encodeBool:v6 forKey:*MEMORY[0x1E4F2EC98]];
  v7 = [(HMDBulletinBoardNotification *)self condition];
  [v8 encodeObject:v7 forKey:*MEMORY[0x1E4F2EC90]];
}

- (HMDService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (HMDService *)WeakRetained;
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (BOOL)isEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_notificationServiceGroup, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setService:(id)a3
{
}

- (void)setCondition:(id)a3
{
}

- (HMDBulletinBoardNotification)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDBulletinBoardNotification *)self init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
    objc_storeWeak((id *)&v5->_service, v6);
    v7 = [v6 type];
    BOOL v8 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:v7];

    if (v8)
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.BulletinBoardNotificationServiceGroup"];
      notificationServiceGroup = v5->_notificationServiceGroup;
      v5->_notificationServiceGroup = (HMDBulletinBoardNotificationServiceGroup *)v9;
    }
    uint64_t v11 = *MEMORY[0x1E4F2EC98];
    if ([v4 containsValueForKey:*MEMORY[0x1E4F2EC98]])
    {
      v5->_enabled = [v4 decodeBoolForKey:v11];
    }
    else
    {
      v12 = [v6 type];
      BOOL v13 = +[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:0 serviceType:v12];

      if (v13)
      {
        v14 = [v6 type];
        v5->_enabled = +[HMDBulletinBoard isCriticalNonSecureServiceType:v14];
      }
    }
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:*MEMORY[0x1E4F2EC90]];
    condition = v5->_condition;
    v5->_condition = (NSPredicate *)v18;
  }
  return v5;
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDBulletinBoardNotification isEnabled](self, "isEnabled"));
  v5 = (void *)[v3 initWithName:@"Enabled" value:v4];
  v12[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDBulletinBoardNotification *)self condition];
  BOOL v8 = [v7 predicateFormat];
  uint64_t v9 = (void *)[v6 initWithName:@"Condition" value:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (NSUUID)messageTargetUUID
{
  v18[2] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  messageTargetUUID = self->_messageTargetUUID;
  if (!messageTargetUUID)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    id v6 = NSString;
    v7 = [WeakRetained instanceID];
    BOOL v8 = [v6 stringWithFormat:@"%@", v7];
    v18[0] = v8;
    v18[1] = @"HM.BulletinBoardNotification";
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

    v10 = (void *)MEMORY[0x1E4F29128];
    uint64_t v11 = [WeakRetained accessory];
    v12 = [v11 uuid];
    uint64_t v13 = objc_msgSend(v10, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v12, 0, v9);
    p_messageTargetUUID = &self->_messageTargetUUID;
    v15 = *p_messageTargetUUID;
    *p_messageTargetUUID = (NSUUID *)v13;

    messageTargetUUID = *p_messageTargetUUID;
  }
  v16 = messageTargetUUID;
  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (id)logIdentifier
{
  id v3 = NSString;
  id v4 = [(HMDBulletinBoardNotification *)self service];
  v5 = [v4 name];
  id v6 = [(HMDBulletinBoardNotification *)self messageTargetUUID];
  v7 = [v6 UUIDString];
  BOOL v8 = [v3 stringWithFormat:@"%@ : %@", v5, v7];

  return v8;
}

- (void)registerForCharacteristicNotifications
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v41 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering for bulletin characteristic notification", buf, 0xCu);
  }
  v7 = [(HMDBulletinBoardNotification *)v4 service];
  v28 = [v7 accessory];
  v29 = v7;
  BOOL v8 = +[HMDBulletinBoard bulletinSupportedCharacteristicsForService:v7];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  v31 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v34 = *MEMORY[0x1E4F5BA78];
    uint64_t v35 = *(void *)v37;
    uint64_t v30 = *MEMORY[0x1E4F5BB10];
    v33 = v9;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v14 = [v13 service];
        v15 = [(HMDBulletinBoardNotification *)v4 notificationServiceGroup];
        v16 = [v15 cameraProfileUUIDs];
        if (![v16 count])
        {

LABEL_16:
          if ([(HMDBulletinBoardNotification *)v4 isEnabled]) {
            v24 = v31;
          }
          else {
            v24 = v9;
          }
          goto LABEL_19;
        }
        v17 = [v14 type];
        if ([v17 isEqualToString:v34])
        {
        }
        else
        {
          uint64_t v18 = [v14 type];
          int v19 = [v18 isEqualToString:v30];

          uint64_t v9 = v33;
          if (!v19) {
            goto LABEL_16;
          }
        }
        v20 = (void *)MEMORY[0x1D9452090]();
        v21 = v4;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v41 = v23;
          __int16 v42 = 2112;
          v43 = v13;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic: %@ because the accessory has associated camera profile", buf, 0x16u);

          uint64_t v9 = v33;
        }

        v24 = v9;
LABEL_19:
        [v24 addObject:v13];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v11);
  }

  if ([v9 count])
  {
    v25 = (void *)[v9 copy];
    [v28 setNotificationsEnabled:0 forCharacteristics:v25 clientIdentifier:@"com.apple.HomeKitDaemon.bulletinBoard"];
  }
  if ([v31 count])
  {
    v26 = (void *)[v31 copy];
    [v28 setNotificationsEnabled:1 forCharacteristics:v26 clientIdentifier:@"com.apple.HomeKitDaemon.bulletinBoard"];
  }
  v27 = [(HMDBulletinBoardNotification *)v4 home];
  [v27 evaluateShouldRelaunchAndSetRelaunch];
}

- (id)dumpState
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = NSString;
  v5 = [(HMDBulletinBoardNotification *)self messageTargetUUID];
  id v6 = [v5 UUIDString];
  [(HMDBulletinBoardNotification *)self isEnabled];
  v7 = HMFBooleanToString();
  BOOL v8 = [v4 stringWithFormat:@"uuid: %@, enabled: %@", v6, v7];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F64EA0]];

  uint64_t v9 = [(HMDBulletinBoardNotification *)self notificationServiceGroup];
  uint64_t v10 = [v9 dumpState];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F64DA0]];

  return v3;
}

- (void)_updateLocalSettingsWithEnabled:(BOOL)a3 condition:(id)a4 forMessage:(id)a5
{
  BOOL v6 = a3;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v24[0] = *MEMORY[0x1E4F2EC98];
  uint64_t v9 = NSNumber;
  id v10 = a4;
  uint64_t v11 = [v9 numberWithBool:v6];
  v25[0] = v11;
  v24[1] = *MEMORY[0x1E4F2EC90];
  v12 = encodeRootObject();

  v25[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  id v14 = objc_alloc(MEMORY[0x1E4F65488]);
  v15 = [(HMDBulletinBoardNotification *)self messageTargetUUID];
  v16 = (void *)[v14 initWithTarget:v15];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F65480]) initWithName:@"kBulletinBoardNotificationUpdateNotificationKey" destination:v16 payload:v13];
  uint64_t v18 = (void *)[v17 mutableCopy];
  int v19 = [v8 identifier];
  [v18 setIdentifier:v19];

  v20 = [(HMDBulletinBoardNotification *)self msgDispatcher];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__HMDBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke;
  v22[3] = &unk_1E6A197F0;
  id v23 = v8;
  id v21 = v8;
  [v20 sendMessage:v18 completionHandler:v22];
}

uint64_t __85__HMDBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithPayload:0];
}

- (void)_handleBulletinBoardNotificationCommitRequest:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDBulletinBoardNotification *)self home];

  if (v5)
  {
    BOOL v6 = [(HMDBulletinBoardNotification *)self home];
    char v7 = [v6 bulletinNotificationsSupported];

    if (v7)
    {
      uint64_t v8 = [v4 BOOLForKey:*MEMORY[0x1E4F2EC98]];
      uint64_t v9 = [v4 predicateForKey:*MEMORY[0x1E4F2EC90]];
      int v10 = v8 ^ [(HMDBulletinBoardNotification *)self isEnabled];
      if (v10 == 1)
      {
        uint64_t v11 = (void *)MEMORY[0x1D9452090]();
        v12 = self;
        uint64_t v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = long long v36 = v11;
          [(HMDBulletinBoardNotification *)v12 isEnabled];
          v15 = HMFBooleanToString();
          v16 = HMFBooleanToString();
          *(_DWORD *)buf = 138543874;
          long long v38 = v14;
          __int16 v39 = 2112;
          v40 = v15;
          __int16 v41 = 2112;
          __int16 v42 = v16;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification enabled from %@ to %@", buf, 0x20u);

          uint64_t v11 = v36;
        }

        [(HMDBulletinBoardNotification *)v12 setEnabled:v8];
        [(HMDBulletinBoardNotification *)v12 registerForCharacteristicNotifications];
      }
      v17 = [(HMDBulletinBoardNotification *)self condition];
      char v18 = HMFEqualObjects();

      if (v18)
      {
        if (!v10) {
          goto LABEL_20;
        }
      }
      else
      {
        v28 = (void *)MEMORY[0x1D9452090]();
        v29 = self;
        uint64_t v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = HMFGetLogIdentifier();
          v32 = [(HMDBulletinBoardNotification *)v29 condition];
          *(_DWORD *)buf = 138543874;
          long long v38 = v31;
          __int16 v39 = 2112;
          v40 = v32;
          __int16 v41 = 2112;
          __int16 v42 = v9;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification condition from %@ to %@", buf, 0x20u);
        }
        [(HMDBulletinBoardNotification *)v29 setCondition:v9];
      }
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v33 postNotificationName:@"HMDBulletinBoardNotificationDidUpdateNotification" object:self userInfo:0];

      uint64_t v34 = [(HMDBulletinBoardNotification *)self home];
      uint64_t v35 = [v4 name];
      [v34 saveToCurrentAccountWithReason:v35];

LABEL_20:
      [(HMDBulletinBoardNotification *)self _updateLocalSettingsWithEnabled:v8 condition:v9 forMessage:v4];

      goto LABEL_21;
    }
    id v23 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v38 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", buf, 0xCu);
    }
    v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v27];
  }
  else
  {
    int v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v38 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Ignoring message to disconnected object", buf, 0xCu);
    }
  }
LABEL_21:
}

- (void)configureBulletinNotification
{
  id v2 = [(HMDBulletinBoardNotification *)self notificationServiceGroup];
  [v2 configureBulletinNotification];
}

- (HMDHome)home
{
  id v2 = [(HMDBulletinBoardNotification *)self service];
  id v3 = [v2 accessory];
  id v4 = [v3 home];

  return (HMDHome *)v4;
}

- (void)setNotificationServiceGroup:(id)a3
{
  id v4 = (HMDBulletinBoardNotificationServiceGroup *)a3;
  os_unfair_lock_lock_with_options();
  notificationServiceGroup = self->_notificationServiceGroup;
  self->_notificationServiceGroup = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDBulletinBoardNotificationServiceGroup)notificationServiceGroup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_notificationServiceGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)registerNotificationHandlers
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDBulletinBoardNotification *)self msgDispatcher];
  uint64_t v4 = *MEMORY[0x1E4F2EC88];
  v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v7[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 registerForMessage:v4 receiver:self policies:v6 selector:sel__handleBulletinBoardNotificationCommitRequest_];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v6)
  {
LABEL_7:
    uint64_t v8 = (HMDBulletinBoardNotification *)_HMFPreconditionFailure();
    [(HMDBulletinBoardNotification *)v8 dealloc];
    return;
  }
  [(HMDBulletinBoardNotification *)self setWorkQueue:v10];
  [(HMDBulletinBoardNotification *)self setMsgDispatcher:v6];
  char v7 = [(HMDBulletinBoardNotification *)self notificationServiceGroup];
  [v7 configureWithWorkQueue:v10];

  [(HMDBulletinBoardNotification *)self registerNotificationHandlers];
  [(HMDBulletinBoardNotification *)self registerForCharacteristicNotifications];
}

- (void)dealloc
{
  id v3 = [(HMDBulletinBoardNotification *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDBulletinBoardNotification;
  [(HMDBulletinBoardNotification *)&v4 dealloc];
}

- (HMDBulletinBoardNotification)initWithService:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBulletinBoardNotification *)self init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_service, v4);
    char v7 = [v4 type];
    BOOL v8 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:v7];

    if (v8)
    {
      SEL v9 = [[HMDBulletinBoardNotificationServiceGroup alloc] initWithBulletinBoardNotification:v6];
      notificationServiceGroup = v6->_notificationServiceGroup;
      v6->_notificationServiceGroup = v9;
    }
    uint64_t v11 = [v4 type];
    if (+[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:0 serviceType:v11])
    {
      v12 = [v4 type];
      BOOL v13 = +[HMDBulletinBoard isCriticalNonSecureServiceType:v12];

      if (!v13) {
        v6->_enabled = 0;
      }
    }
    else
    {
    }
  }

  return v6;
}

- (HMDBulletinBoardNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDBulletinBoardNotification;
  result = [(HMDBulletinBoardNotification *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_24975 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_24975, &__block_literal_global_24976);
  }
  id v2 = (void *)logCategory__hmf_once_v11_24977;
  return v2;
}

uint64_t __43__HMDBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11_24977;
  logCategory__hmf_once_v11_24977 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsBulletinNotificationGroup:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[HMDDeviceCapabilities supportsBulletinBoard])
  {
    uint64_t v4 = *MEMORY[0x1E4F5BB10];
    v8[0] = *MEMORY[0x1E4F5BA78];
    v8[1] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    char v6 = [v5 containsObject:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end