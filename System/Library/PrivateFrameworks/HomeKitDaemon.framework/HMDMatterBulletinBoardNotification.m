@interface HMDMatterBulletinBoardNotification
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (HMDMatterAccessoryProtocol)accessory;
- (HMDMatterBulletinBoardNotification)initWithAccessory:(id)a3 endpointID:(id)a4 enabled:(BOOL)a5 condition:(id)a6;
- (HMDMatterBulletinBoardNotification)initWithCoder:(id)a3;
- (HMFMessageDispatcher)msgDispatcher;
- (NSNumber)endpointID;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (id)dumpState;
- (id)home;
- (id)logIdentifier;
- (id)messageTargetUUID;
- (void)_handleBulletinBoardNotificationCommitRequest:(id)a3;
- (void)_updateAccessoryBulletinNotificationManagerWithEnabled:(BOOL)a3 condition:(id)a4 completion:(id)a5;
- (void)_updateLocalSettingsWithEnabled:(BOOL)a3 condition:(id)a4 forMessage:(id)a5;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)registerNotificationHandlers;
- (void)setAccessory:(id)a3;
- (void)setEndpointID:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateRegistrations;
@end

@implementation HMDMatterBulletinBoardNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEndpointID:(id)a3
{
}

- (NSNumber)endpointID
{
  return self->_endpointID;
}

- (void)setAccessory:(id)a3
{
}

- (HMDMatterAccessoryProtocol)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDMatterAccessoryProtocol *)WeakRetained;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMatterBulletinBoardNotification *)self accessory];
  [v4 encodeConditionalObject:v5 forKey:@"accessory"];

  v6 = [(HMDMatterBulletinBoardNotification *)self endpointID];
  [v4 encodeObject:v6 forKey:@"serviceMatterEndpointID"];

  BOOL v7 = [(HMDBulletinBoardNotification *)self isEnabled];
  [v4 encodeBool:v7 forKey:*MEMORY[0x263F0E9A8]];
  id v8 = [(HMDBulletinBoardNotification *)self condition];
  [v4 encodeObject:v8 forKey:*MEMORY[0x263F0E9A0]];
}

- (HMDMatterBulletinBoardNotification)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDBulletinBoardNotification *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    id v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"accessory"];

    objc_storeWeak((id *)&v5->_accessory, v9);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceMatterEndpointID"];
    endpointID = v5->_endpointID;
    v5->_endpointID = v10;
    v12 = v10;

    uint64_t v13 = *MEMORY[0x263F0E9A8];
    if ([v4 containsValueForKey:*MEMORY[0x263F0E9A8]]) {
      uint64_t v14 = [v4 decodeBoolForKey:v13];
    }
    else {
      uint64_t v14 = 0;
    }
    [(HMDBulletinBoardNotification *)v5 setEnabled:v14];
    v15 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    v17 = [v15 setWithArray:v16];

    v18 = [v4 decodeObjectOfClasses:v17 forKey:*MEMORY[0x263F0E9A0]];
    [(HMDBulletinBoardNotification *)v5 setCondition:v18];
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
  BOOL v7 = [(HMDBulletinBoardNotification *)self condition];
  id v8 = [v7 predicateFormat];
  v9 = (void *)[v6 initWithName:@"Condition" value:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

- (id)messageTargetUUID
{
  v18[3] = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  messageTargetUUID = self->_messageTargetUUID;
  if (!messageTargetUUID)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
    id v6 = self->_endpointID;
    BOOL v7 = [WeakRetained uuid];
    id v8 = [v7 UUIDString];
    v9 = [(NSNumber *)v6 stringValue];
    v18[1] = v9;
    v18[2] = @"HM.BulletinBoardNotification";
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];

    v11 = (void *)MEMORY[0x263F08C38];
    v12 = [WeakRetained uuid];
    uint64_t v13 = objc_msgSend(v11, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v12, 0, v10);
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
  id v4 = [(HMDMatterBulletinBoardNotification *)self accessory];
  v5 = [v4 name];
  id v6 = [(HMDMatterBulletinBoardNotification *)self endpointID];
  BOOL v7 = [(HMDMatterBulletinBoardNotification *)self messageTargetUUID];
  id v8 = [v7 UUIDString];
  v9 = [v3 stringWithFormat:@"%@/%@ : %@", v5, v6, v8];

  return v9;
}

- (void)_updateAccessoryBulletinNotificationManagerWithEnabled:(BOOL)a3 condition:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HMDMatterBulletinBoardNotification *)self home];
  v11 = [v10 accessoryBulletinNotificationManager];

  if (v11)
  {
    v12 = [(HMDMatterBulletinBoardNotification *)self accessory];
    uint64_t v13 = [(HMDMatterBulletinBoardNotification *)self endpointID];
    uint64_t v14 = +[HMDBulletinBoard bulletinSupportedMatterPathsForAccessory:v12 endpointID:v13];
    v15 = [v11 conditionsFromPredicate:v8];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__HMDMatterBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke;
    aBlock[3] = &unk_264A2A6E8;
    BOOL v44 = v6;
    aBlock[4] = self;
    id v38 = v8;
    id v33 = v9;
    id v16 = v9;
    id v43 = v16;
    id v17 = v11;
    id v39 = v17;
    id v18 = v12;
    id v40 = v18;
    id v19 = v13;
    id v41 = v19;
    id v20 = v15;
    id v42 = v20;
    v21 = (void (**)(void))_Block_copy(aBlock);
    if ([v14 count])
    {
      BOOL v22 = !v6;
      if (v6) {
        v23 = v14;
      }
      else {
        v23 = 0;
      }
      v32 = v11;
      id v24 = v19;
      id v25 = v8;
      if (v22) {
        v26 = v14;
      }
      else {
        v26 = 0;
      }
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __114__HMDMatterBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke_2;
      v34[3] = &unk_264A2CFF8;
      id v35 = v16;
      v36 = v21;
      v27 = v26;
      id v8 = v25;
      id v19 = v24;
      v11 = v32;
      [v17 updateRegistrationsWithEnabledMatterPaths:v23 disabledMatterPaths:v27 conditions:v20 completion:v34];
    }
    else
    {
      v21[2](v21);
    }

    id v9 = v33;
  }
  else
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Accessory Bulletin Notification Manager is nil", buf, 0xCu);
    }
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, id))v9 + 2))(v9, v18);
  }
}

uint64_t __114__HMDMatterBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 88);
  if (v2 == [*(id *)(a1 + 32) isEnabled]
    && (id v3 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) condition],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3 == v4))
  {
    v12 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
    return v12();
  }
  else
  {
    v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    if (*(unsigned char *)(a1 + 88))
    {
      uint64_t v8 = *(void *)(a1 + 72);
      uint64_t v9 = *(void *)(a1 + 80);
      return [v5 enableBulletinForAccessory:v6 endpointID:v7 conditions:v8 completion:v9];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 80);
      return [v5 disableBulletinForAccessory:v6 endpointID:v7 completion:v11];
    }
  }
}

uint64_t __114__HMDMatterBulletinBoardNotification__updateAccessoryBulletinNotificationManagerWithEnabled_condition_completion___block_invoke_2(uint64_t a1, uint64_t a2)
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
  v5[2] = __57__HMDMatterBulletinBoardNotification_updateRegistrations__block_invoke;
  v5[3] = &unk_264A2F3E8;
  v5[4] = self;
  [(HMDMatterBulletinBoardNotification *)self _updateAccessoryBulletinNotificationManagerWithEnabled:v3 condition:v4 completion:v5];
}

void __57__HMDMatterBulletinBoardNotification_updateRegistrations__block_invoke(uint64_t a1, void *a2)
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
  id v5 = [(HMDMatterBulletinBoardNotification *)self messageTargetUUID];
  uint64_t v6 = [v5 UUIDString];
  [(HMDBulletinBoardNotification *)self isEnabled];
  uint64_t v7 = HMFBooleanToString();
  int v8 = [v4 stringWithFormat:@"uuid: %@, enabled: %@", v6, v7];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F41FA8]];

  return v3;
}

- (void)_updateLocalSettingsWithEnabled:(BOOL)a3 condition:(id)a4 forMessage:(id)a5
{
  BOOL v6 = a3;
  v24[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v23[0] = *MEMORY[0x263F0E9A8];
  uint64_t v9 = NSNumber;
  id v10 = a4;
  id v11 = [v9 numberWithBool:v6];
  v24[0] = v11;
  v23[1] = *MEMORY[0x263F0E9A0];
  uint64_t v12 = encodeRootObject();

  v24[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  id v14 = objc_alloc(MEMORY[0x263F42570]);
  v15 = [(HMDMatterBulletinBoardNotification *)self messageTargetUUID];
  id v16 = (void *)[v14 initWithTarget:v15];

  id v17 = (void *)[objc_alloc(MEMORY[0x263F42590]) initWithName:@"kBulletinBoardNotificationUpdateNotificationKey" destination:v16 payload:v13];
  id v18 = [v8 identifier];
  [v17 setIdentifier:v18];

  id v19 = [(HMDMatterBulletinBoardNotification *)self msgDispatcher];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __91__HMDMatterBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke;
  void v21[3] = &unk_264A2F3E8;
  id v22 = v8;
  id v20 = v8;
  [v19 sendMessage:v17 completionHandler:v21];
}

uint64_t __91__HMDMatterBulletinBoardNotification__updateLocalSettingsWithEnabled_condition_forMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithPayload:0];
}

- (void)_handleBulletinBoardNotificationCommitRequest:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMatterBulletinBoardNotification *)self home];

  if (!v5)
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v44 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Ignoring message to disconnected object", buf, 0xCu);
    }
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 12;
    goto LABEL_18;
  }
  BOOL v6 = [(HMDMatterBulletinBoardNotification *)self home];
  char v7 = [v6 bulletinNotificationsSupported];

  if ((v7 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v44 = v32;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", buf, 0xCu);
    }
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 48;
LABEL_18:
    id v9 = [v27 hmErrorWithCode:v28];
    [v4 respondWithError:v9];
    goto LABEL_23;
  }
  uint64_t v8 = [v4 BOOLForKey:*MEMORY[0x263F0E9A8]];
  id v9 = [v4 predicateForKey:*MEMORY[0x263F0E9A0]];
  int v10 = v8 ^ [(HMDBulletinBoardNotification *)self isEnabled];
  if (v10 == 1)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v14 = v38 = v11;
      [(HMDBulletinBoardNotification *)v12 isEnabled];
      v15 = HMFBooleanToString();
      id v16 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      BOOL v44 = v14;
      __int16 v45 = 2112;
      v46 = v15;
      __int16 v47 = 2112;
      id v48 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification enabled from %@ to %@", buf, 0x20u);

      id v11 = v38;
    }
  }
  id v17 = [(HMDBulletinBoardNotification *)self condition];
  char v18 = HMFEqualObjects();

  if ((v18 & 1) == 0)
  {
    id v33 = (void *)MEMORY[0x230FBD990]();
    v34 = self;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = HMFGetLogIdentifier();
      v37 = [(HMDBulletinBoardNotification *)v34 condition];
      *(_DWORD *)buf = 138543874;
      BOOL v44 = v36;
      __int16 v45 = 2112;
      v46 = v37;
      __int16 v47 = 2112;
      id v48 = v9;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin board notification condition from %@ to %@", buf, 0x20u);
    }
    goto LABEL_22;
  }
  if (v10)
  {
LABEL_22:
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __84__HMDMatterBulletinBoardNotification__handleBulletinBoardNotificationCommitRequest___block_invoke;
    v39[3] = &unk_264A2A6C0;
    v39[4] = self;
    id v40 = v4;
    char v42 = v8;
    id v9 = v9;
    id v41 = v9;
    [(HMDMatterBulletinBoardNotification *)self _updateAccessoryBulletinNotificationManagerWithEnabled:v8 condition:v9 completion:v39];

    goto LABEL_23;
  }
  id v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    BOOL v44 = v22;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating local bulletin board notification settings with existing values", buf, 0xCu);
  }
  [(HMDMatterBulletinBoardNotification *)v20 _updateLocalSettingsWithEnabled:v8 condition:v9 forMessage:v4];
LABEL_23:
}

void __84__HMDMatterBulletinBoardNotification__handleBulletinBoardNotificationCommitRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
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
      int v14 = 138543874;
      v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error updating bulletin notification manager for message %@ : %@", (uint8_t *)&v14, 0x20u);
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
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated bulletin notification manager for message %@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 32) setCondition:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateLocalSettingsWithEnabled:*(unsigned __int8 *)(a1 + 56) condition:*(void *)(a1 + 48) forMessage:*(void *)(a1 + 40)];
  }
}

- (id)home
{
  int v2 = [(HMDMatterBulletinBoardNotification *)self accessory];
  id v3 = [v2 home];

  return v3;
}

- (void)registerNotificationHandlers
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = [(HMDMatterBulletinBoardNotification *)self msgDispatcher];
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
      [(HMDMatterBulletinBoardNotification *)self setWorkQueue:v6];
      [(HMDMatterBulletinBoardNotification *)self setMsgDispatcher:v8];
      [(HMDMatterBulletinBoardNotification *)self registerNotificationHandlers];
      BOOL v9 = [(HMDBulletinBoardNotification *)self isEnabled];
      int v10 = [(HMDBulletinBoardNotification *)self condition];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __79__HMDMatterBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke;
      v13[3] = &unk_264A2F3E8;
      v13[4] = self;
      [(HMDMatterBulletinBoardNotification *)self _updateAccessoryBulletinNotificationManagerWithEnabled:v9 condition:v10 completion:v13];

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  uint64_t v11 = _HMFPreconditionFailure();
  __79__HMDMatterBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke(v11, v12);
}

void __79__HMDMatterBulletinBoardNotification_configureWithWorkQueue_messageDispatcher___block_invoke(uint64_t a1, void *a2)
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
    BOOL v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating bulletin notification manager during configure finished with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)dealloc
{
  id v3 = [(HMDMatterBulletinBoardNotification *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDMatterBulletinBoardNotification;
  [(HMDBulletinBoardNotification *)&v4 dealloc];
}

- (HMDMatterBulletinBoardNotification)initWithAccessory:(id)a3 endpointID:(id)a4 enabled:(BOOL)a5 condition:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDMatterBulletinBoardNotification;
  uint64_t v13 = [(HMDBulletinBoardNotification *)&v16 init];
  int v14 = v13;
  if (v13)
  {
    [(HMDBulletinBoardNotification *)v13 setEnabled:v7];
    [(HMDBulletinBoardNotification *)v14 setCondition:v12];
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeStrong((id *)&v14->_endpointID, a4);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_238317 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_238317, &__block_literal_global_238318);
  }
  int v2 = (void *)logCategory__hmf_once_v11_238319;
  return v2;
}

void __49__HMDMatterBulletinBoardNotification_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v11_238319;
  logCategory__hmf_once_v11_238319 = v0;
}

@end