@interface HMDBulletinBoardNotification
+ (BOOL)supportsBulletinNotificationGroup:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEnabled;
- (HMDBulletinBoardNotification)init;
- (HMDBulletinBoardNotification)initWithCoder:(id)a3;
- (HMDBulletinBoardNotification)initWithService:(id)a3;
- (HMDBulletinBoardNotification)initWithService:(id)a3 enabled:(BOOL)a4 condition:(id)a5;
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
- (void)_updateAccessoryBulletinNotificationManagerWithEnabled:(BOOL)a3 condition:(id)a4 completion:(id)a5;
- (void)_updateLocalSettingsWithEnabled:(BOOL)a3 condition:(id)a4 forMessage:(id)a5;
- (void)configureBulletinNotification;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)registerNotificationHandlers;
- (void)setCondition:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setNotificationServiceGroup:(id)a3;
- (void)setService:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateRegistrations;
@end

@implementation HMDBulletinBoardNotification

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

- (HMDService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (HMDService *)WeakRetained;
}

- (void)setCondition:(id)a3
{
}

- (NSPredicate)condition
{
  return self->_condition;
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
  [v8 encodeBool:v6 forKey:*MEMORY[0x263F0E9A8]];
  v7 = [(HMDBulletinBoardNotification *)self condition];
  [v8 encodeObject:v7 forKey:*MEMORY[0x263F0E9A0]];
}

- (HMDBulletinBoardNotification)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
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
    uint64_t v11 = *MEMORY[0x263F0E9A8];
    if ([v4 containsValueForKey:*MEMORY[0x263F0E9A8]])
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
    v15 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:*MEMORY[0x263F0E9A0]];
    condition = v5->_condition;
    v5->_condition = (NSPredicate *)v18;
  }
  return v5;
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDBulletinBoardNotification isEnabled](self, "isEnabled"));
  v5 = (void *)[v3 initWithName:@"Enabled" value:v4];
  v12[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDBulletinBoardNotification *)self condition];
  BOOL v8 = [v7 predicateFormat];
  uint64_t v9 = (void *)[v6 initWithName:@"Condition" value:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

- (NSUUID)messageTargetUUID
{
  v18[2] = *MEMORY[0x263EF8340];
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
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

    v10 = (void *)MEMORY[0x263F08C38];
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

- (void)_updateAccessoryBulletinNotificationManagerWithEnabled:(BOOL)a3 condition:(id)a4 completion:(id)a5
{
  BOOL v48 = a3;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(HMDBulletinBoardNotification *)self home];
  v10 = [v9 accessoryBulletinNotificationManager];

  if (v10)
  {
    v42 = v10;
    v43 = v8;
    v44 = v7;
    v41 = [(HMDBulletinBoardNotification *)self service];
    uint64_t v11 = +[HMDBulletinBoard bulletinSupportedCharacteristicsForService:](HMDBulletinBoard, "bulletinSupportedCharacteristicsForService:");
    v46 = [MEMORY[0x263EFF9C0] set];
    v45 = [MEMORY[0x263EFF9C0] set];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v63;
      uint64_t v51 = *MEMORY[0x263F356D0];
      uint64_t v47 = *MEMORY[0x263F35768];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v63 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v17 = [v16 service];
          uint64_t v18 = [(HMDBulletinBoardNotification *)self notificationServiceGroup];
          v19 = [v18 cameraProfileUUIDs];
          if (![v19 count])
          {

LABEL_15:
            if (v48) {
              v30 = v45;
            }
            else {
              v30 = v46;
            }
            [v30 addObject:v16];
            goto LABEL_19;
          }
          v20 = [v17 type];
          if ([v20 isEqualToString:v51])
          {
          }
          else
          {
            [v17 type];
            uint64_t v21 = v13;
            uint64_t v22 = v14;
            v24 = v23 = self;
            int v50 = [v24 isEqualToString:v47];

            self = v23;
            uint64_t v14 = v22;
            uint64_t v13 = v21;

            if (!v50) {
              goto LABEL_15;
            }
          }
          v25 = (void *)MEMORY[0x230FBD990]();
          v26 = self;
          v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = v28 = v17;
            *(_DWORD *)buf = 138543618;
            v67 = v29;
            __int16 v68 = 2112;
            v69 = v16;
            _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping characteristic: %@ because the accessory has associated camera profile", buf, 0x16u);

            v17 = v28;
          }

LABEL_19:
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v13);
    }

    v10 = v42;
    id v7 = v44;
    v31 = [v42 conditionsFromPredicate:v44];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke;
    aBlock[3] = &unk_264A2B510;
    BOOL v61 = v48;
    aBlock[4] = self;
    id v56 = v44;
    id v8 = v43;
    id v32 = v43;
    id v60 = v32;
    id v33 = v42;
    id v57 = v33;
    id v34 = v41;
    id v58 = v34;
    id v35 = v31;
    id v59 = v35;
    v36 = (void (**)(void))_Block_copy(aBlock);
    if ([v45 count] || objc_msgSend(v46, "count"))
    {
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke_2;
      v52[3] = &unk_264A2CFF8;
      id v53 = v32;
      v54 = v36;
      [v33 updateRegistrationsWithEnabledCharacteristics:v45 disabledCharacteristics:v46 conditions:v35 completion:v52];
    }
    else
    {
      v36[2](v36);
    }
  }
  else
  {
    v37 = (void *)MEMORY[0x230FBD990]();
    v38 = self;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v67 = v40;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Accessory Bulletin Notification Manager is nil", buf, 0xCu);
    }
    id v34 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, id))v8 + 2))(v8, v34);
  }
}

uint64_t __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  if (v2 == [*(id *)(a1 + 32) isEnabled]
    && (id v3 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) condition],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3 == v4))
  {
    uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v11();
  }
  else
  {
    v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = *(void *)(a1 + 72);
      return [v5 enableBulletinForService:v6 conditions:v7 completion:v8];
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 72);
      return [v5 disableBulletinForService:v6 completion:v10];
    }
  }
}

uint64_t __108__HMDBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateRegistrations
{
  BOOL v3 = [(HMDBulletinBoardNotification *)self isEnabled];
  id v4 = [(HMDBulletinBoardNotification *)self condition];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__HMDBulletinBoardNotification_updateRegistrations__block_invoke;
  v5[3] = &unk_264A2F3E8;
  v5[4] = self;
  [(HMDBulletinBoardNotification *)self _updateAccessoryBulletinNotificationManagerWithEnabled:v3 condition:v4 completion:v5];
}

void __51__HMDBulletinBoardNotification_updateRegistrations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin notification manager from updateRegistrations finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)dumpState
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = NSString;
  id v5 = [(HMDBulletinBoardNotification *)self messageTargetUUID];
  uint64_t v6 = [v5 UUIDString];
  [(HMDBulletinBoardNotification *)self isEnabled];
  uint64_t v7 = HMFBooleanToString();
  int v8 = [v4 stringWithFormat:@"uuid: %@, enabled: %@", v6, v7];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F41FA8]];

  uint64_t v9 = [(HMDBulletinBoardNotification *)self notificationServiceGroup];
  __int16 v10 = [v9 dumpState];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x263F41EB8]];

  return v3;
}

- (void)_updateLocalSettingsWithEnabled:(BOOL)a3 condition:(id)a4 forMessage:(id)a5
{
  BOOL v6 = a3;
  v25[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v24[0] = *MEMORY[0x263F0E9A8];
  uint64_t v9 = NSNumber;
  id v10 = a4;
  id v11 = [v9 numberWithBool:v6];
  v25[0] = v11;
  v24[1] = *MEMORY[0x263F0E9A0];
  uint64_t v12 = encodeRootObject();

  v25[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  id v14 = objc_alloc(MEMORY[0x263F42570]);
  v15 = [(HMDBulletinBoardNotification *)self messageTargetUUID];
  v16 = (void *)[v14 initWithTarget:v15];

  v17 = (void *)[objc_alloc(MEMORY[0x263F42568]) initWithName:@"kBulletinBoardNotificationUpdateNotificationKey" destination:v16 payload:v13];
  uint64_t v18 = (void *)[v17 mutableCopy];
  v19 = [v8 identifier];
  [v18 setIdentifier:v19];

  v20 = [(HMDBulletinBoardNotification *)self msgDispatcher];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __85__HMDBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke;
  v22[3] = &unk_264A2F3E8;
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
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDBulletinBoardNotification *)self home];

  if (v5)
  {
    BOOL v6 = [(HMDBulletinBoardNotification *)self home];
    char v7 = [v6 bulletinNotificationsSupported];

    if ((v7 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x230FBD990]();
      v28 = self;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v42 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", buf, 0xCu);
      }
      uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      [v4 respondWithError:v9];
      goto LABEL_22;
    }
    uint64_t v8 = [v4 BOOLForKey:*MEMORY[0x263F0E9A8]];
    uint64_t v9 = [v4 predicateForKey:*MEMORY[0x263F0E9A0]];
    int v10 = v8 ^ [(HMDBulletinBoardNotification *)self isEnabled];
    if (v10 == 1)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v14 = v36 = v11;
        [(HMDBulletinBoardNotification *)v12 isEnabled];
        v15 = HMFBooleanToString();
        v16 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v42 = v14;
        __int16 v43 = 2112;
        v44 = v15;
        __int16 v45 = 2112;
        v46 = v16;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification enabled from %@ to %@", buf, 0x20u);

        id v11 = v36;
      }
    }
    v17 = [(HMDBulletinBoardNotification *)self condition];
    char v18 = HMFEqualObjects();

    if (v18)
    {
      if ((v10 & 1) == 0)
      {
        v19 = (void *)MEMORY[0x230FBD990]();
        v20 = self;
        id v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v42 = v22;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating local bulletin board notification settings with existing values", buf, 0xCu);
        }
        [(HMDBulletinBoardNotification *)v20 _updateLocalSettingsWithEnabled:v8 condition:v9 forMessage:v4];
        goto LABEL_22;
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x230FBD990]();
      id v32 = self;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = HMFGetLogIdentifier();
        id v35 = [(HMDBulletinBoardNotification *)v32 condition];
        *(_DWORD *)buf = 138543874;
        v42 = v34;
        __int16 v43 = 2112;
        v44 = v35;
        __int16 v45 = 2112;
        v46 = v9;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification condition from %@ to %@", buf, 0x20u);
      }
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __78__HMDBulletinBoardNotification__handleBulletinBoardNotificationCommitRequest___block_invoke;
    v37[3] = &unk_264A2A6C0;
    v37[4] = self;
    id v38 = v4;
    char v40 = v8;
    id v39 = v9;
    [(HMDBulletinBoardNotification *)self _updateAccessoryBulletinNotificationManagerWithEnabled:v8 condition:v39 completion:v37];

LABEL_22:
    goto LABEL_23;
  }
  id v23 = (void *)MEMORY[0x230FBD990]();
  v24 = self;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v42 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Ignoring message to disconnected object", buf, 0xCu);
  }
LABEL_23:
}

void __78__HMDBulletinBoardNotification__handleBulletinBoardNotificationCommitRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error updating bulletin notification manager for message %@ : %@", (uint8_t *)&v15, 0x20u);
    }
    int v10 = *(void **)(a1 + 40);
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v10 respondWithError:v11];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated bulletin notification manager for message %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 32) setCondition:*(void *)(a1 + 48)];
    id v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotificationName:@"HMDBulletinBoardNotificationDidUpdateNotification" object:*(void *)(a1 + 32) userInfo:0];

    [*(id *)(a1 + 32) _updateLocalSettingsWithEnabled:*(unsigned __int8 *)(a1 + 56) condition:*(void *)(a1 + 48) forMessage:*(void *)(a1 + 40)];
  }
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

- (BOOL)isEnabled
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)registerNotificationHandlers
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDBulletinBoardNotification *)self msgDispatcher];
  uint64_t v4 = *MEMORY[0x263F0E998];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v7[0] = v5;
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v3 registerForMessage:v4 receiver:self policies:v6 selector:sel__handleBulletinBoardNotificationCommitRequest_];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      [(HMDBulletinBoardNotification *)self setWorkQueue:v6];
      [(HMDBulletinBoardNotification *)self setMsgDispatcher:v8];
      uint64_t v9 = [(HMDBulletinBoardNotification *)self notificationServiceGroup];
      [v9 configureWithWorkQueue:v6];

      [(HMDBulletinBoardNotification *)self registerNotificationHandlers];
      BOOL v10 = [(HMDBulletinBoardNotification *)self isEnabled];
      id v11 = [(HMDBulletinBoardNotification *)self condition];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __73__HMDBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke;
      v14[3] = &unk_264A2F3E8;
      v14[4] = self;
      [(HMDBulletinBoardNotification *)self _updateAccessoryBulletinNotificationManagerWithEnabled:v10 condition:v11 completion:v14];

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  uint64_t v12 = _HMFPreconditionFailure();
  __73__HMDBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke(v12, v13);
}

void __73__HMDBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin notification manager during configure finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)dealloc
{
  id v3 = [(HMDBulletinBoardNotification *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDBulletinBoardNotification;
  [(HMDBulletinBoardNotification *)&v4 dealloc];
}

- (HMDBulletinBoardNotification)initWithService:(id)a3 enabled:(BOOL)a4 condition:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDBulletinBoardNotification;
  __int16 v10 = [(HMDBulletinBoardNotification *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    v10->_enabled = a4;
    objc_storeStrong((id *)&v10->_condition, a5);
    objc_storeWeak((id *)&v11->_service, v8);
  }

  return v11;
}

- (HMDBulletinBoardNotification)initWithService:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBulletinBoardNotification *)self init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_service, v4);
    id v7 = [v4 type];
    BOOL v8 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:v7];

    if (v8)
    {
      id v9 = [[HMDBulletinBoardNotificationServiceGroup alloc] initWithBulletinBoardNotification:v6];
      notificationServiceGroup = v6->_notificationServiceGroup;
      v6->_notificationServiceGroup = v9;
    }
    id v11 = [v4 type];
    if (+[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:0 serviceType:v11])
    {
      uint64_t v12 = [v4 type];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1) {
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_33671);
  }
  id v2 = (void *)logCategory__hmf_once_v16;
  return v2;
}

void __43__HMDBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v16;
  logCategory__hmf_once_v16 = v0;
}

+ (BOOL)supportsBulletinNotificationGroup:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (+[HMDDeviceCapabilities supportsBulletinBoard])
  {
    uint64_t v4 = *MEMORY[0x263F35768];
    v8[0] = *MEMORY[0x263F356D0];
    v8[1] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    char v6 = [v5 containsObject:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end