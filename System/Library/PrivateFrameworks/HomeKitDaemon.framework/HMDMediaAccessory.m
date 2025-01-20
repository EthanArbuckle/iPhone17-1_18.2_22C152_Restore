@interface HMDMediaAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3;
- (BOOL)providesHashRouteID;
- (HMDMediaAccessory)init;
- (HMDMediaAccessory)initWithCoder:(id)a3;
- (HMDMediaAccessory)initWithTransaction:(id)a3 home:(id)a4;
- (HMDMediaAccessoryAdvertisement)advertisement;
- (HMDMediaProfile)mediaProfile;
- (NSDictionary)assistantObject;
- (NSNotificationCenter)notificationCenter;
- (NSString)urlString;
- (id)_createMediaProfile;
- (id)dumpSimpleState;
- (id)dumpState;
- (id)name;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (id)transportReports;
- (int64_t)reachableTransports;
- (unint64_t)supportedTransports;
- (void)_registerForMessages;
- (void)addAdvertisement:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleRoomChanged:(id)a3;
- (void)handleRoomNameChanged:(id)a3;
- (void)handleUpdatedAdvertisement:(id)a3;
- (void)notifyConnectivityChangedWithReachabilityState:(BOOL)a3;
- (void)removeAdvertisement:(id)a3;
- (void)setAdvertisement:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setRemotelyReachable:(BOOL)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDMediaAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mediaProfile, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 456, 1);
}

- (HMDMediaProfile)mediaProfile
{
  return (HMDMediaProfile *)objc_getProperty(self, a2, 448, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HMDMediaAccessory;
  [(HMDAccessory *)&v5 encodeWithCoder:v4];
  if (objc_msgSend(v4, "hmd_isForXPCTransport")
    && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    [v4 encodeBool:1 forKey:*MEMORY[0x263F0B780]];
  }
}

- (HMDMediaAccessory)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaAccessory;
  v3 = [(HMDAccessory *)&v9 initWithCoder:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v3->_notificationCenter;
    v3->_notificationCenter = (NSNotificationCenter *)v4;

    uint64_t v6 = [(HMDMediaAccessory *)v3 _createMediaProfile];
    mediaProfile = v3->_mediaProfile;
    v3->_mediaProfile = (HMDMediaProfile *)v6;

    [(NSMutableSet *)v3->super._accessoryProfiles addObject:v3->_mediaProfile];
  }
  return v3;
}

- (id)dumpSimpleState
{
  v10.receiver = self;
  v10.super_class = (Class)HMDMediaAccessory;
  v3 = [(HMDAccessory *)&v10 dumpSimpleState];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x263F41FA8];
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x263F41FA8]);
  v7 = [(HMDAccessory *)self identifier];
  v8 = [v6 stringByAppendingFormat:@", identifier: %@", v7];

  [v4 setObject:v8 forKeyedSubscript:v5];
  return v4;
}

- (id)dumpState
{
  v10.receiver = self;
  v10.super_class = (Class)HMDMediaAccessory;
  v3 = [(HMDAccessory *)&v10 dumpState];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x263F41FA8];
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x263F41FA8]);
  v7 = [(HMDAccessory *)self identifier];
  v8 = [v6 stringByAppendingFormat:@", identifier: %@", v7];

  [v4 setObject:v8 forKeyedSubscript:v5];
  return v4;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v28 = v8;
    v29 = v13;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__92916;
    v38 = __Block_byref_object_dispose__92917;
    id v39 = 0;
    v14 = [v10 responseHandler];
    if (v14)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__HMDMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke;
      aBlock[3] = &unk_264A20F88;
      aBlock[4] = &v34;
      v15 = _Block_copy(aBlock);
      [v10 setResponseHandler:v15];
    }
    v32.receiver = self;
    v32.super_class = (Class)HMDMediaAccessory;
    [(HMDAccessory *)&v32 transactionObjectUpdated:0 newValues:v11 message:v10];
    v30 = self;
    id v16 = v29;
    id v17 = v10;
    v18 = [v17 transactionResult];
    v19 = [v16 roomUUID];

    if (v19)
    {
      id v20 = objc_alloc(MEMORY[0x263F08C38]);
      v21 = [v16 roomUUID];
      v22 = (void *)[v20 initWithUUIDString:v21];

      if (v22 && -[HMDAccessory _updateRoom:source:](v30, "_updateRoom:source:", v22, [v18 source]))
      {
        [v18 markChanged];
        [v18 markSaveToAssistant];
      }
    }
    v23 = [v16 identifier];
    if (v23)
    {
      v24 = [(HMDAccessory *)v30 identifier];
      v25 = [v16 identifier];
      char v26 = [v24 isEqual:v25];

      if ((v26 & 1) == 0)
      {
        v27 = [v16 identifier];
        [(HMDAccessory *)v30 setIdentifier:v27];

        [v18 markChanged];
        [v18 markSaveToAssistant];
      }
    }
    [v17 respondWithPayload:0];

    if (v14) {
      v14[2](v14, v35[5], 0);
    }

    _Block_object_dispose(&v34, 8);
    id v8 = v28;
    id v13 = v29;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)HMDMediaAccessory;
    [(HMDAccessory *)&v31 transactionObjectUpdated:v8 newValues:v11 message:v10];
  }
}

void __64__HMDMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  id v5 = [HMDMediaAccessoryModel alloc];
  uint64_t v6 = [(HMDAccessory *)self uuid];
  v7 = [(HMDAccessory *)self home];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (int64_t)reachableTransports
{
  v7.receiver = self;
  v7.super_class = (Class)HMDMediaAccessory;
  int64_t v3 = [(HMDAccessory *)&v7 reachableTransports];
  if ([(HMDAccessory *)self isReachable]) {
    v3 |= 0x10uLL;
  }
  id v4 = [(HMDAccessory *)self home];
  int v5 = [v4 isResidentSupported];

  if (v5 && [(HMDAccessory *)self isRemotelyReachable]) {
    return v3 | 8;
  }
  return v3;
}

- (void)setRemotelyReachable:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->super._remotelyReachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    int v5 = self->super._remotelyReachable || self->super._reachable;
    self->super._remotelyReachable = v3;
    int v6 = self->super._reachable || v3;
    os_unfair_recursive_lock_unlock();
    if (v5 != v6)
    {
      [(HMDMediaAccessory *)self notifyConnectivityChangedWithReachabilityState:v6 != 0];
    }
  }
}

- (void)notifyConnectivityChangedWithReachabilityState:(BOOL)a3
{
  int v5 = [(HMDAccessory *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__HMDMediaAccessory_notifyConnectivityChangedWithReachabilityState___block_invoke;
  v6[3] = &unk_264A2B870;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __68__HMDMediaAccessory_notifyConnectivityChangedWithReachabilityState___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) home];
  char v3 = [v2 isResidentSupported];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = HMFBooleanToString();
      int v11 = 138543618;
      v12 = v8;
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying clients of updated media accessory reachability: %@", (uint8_t *)&v11, 0x16u);
    }
    [v2 notifyClientsOfReachabilityUpdateForAccessory:*(void *)(a1 + 32)];
  }
  else
  {
    if (v7)
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring non-remote reachability change while remote access is enabled", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)handleUpdatedAdvertisement:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updated with advertisement: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)setAdvertisement:(id)a3
{
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_advertisement, a3);
    os_unfair_recursive_lock_unlock();
    [(HMDMediaAccessory *)self handleUpdatedAdvertisement:v5];
  }
}

- (HMDMediaAccessoryAdvertisement)advertisement
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = self->_advertisement;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)handleRoomChanged:(id)a3
{
  id v15 = a3;
  id v4 = [v15 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    BOOL v7 = [v6 uuid];
    id v8 = [(HMDAccessory *)self uuid];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      id v10 = [(HMDAccessory *)self getConfiguredName];

      if (!v10)
      {
        __int16 v11 = [v15 userInfo];
        id v12 = objc_msgSend(v11, "hmf_stringForKey:", @"kRoomOldNameKey");

        uint64_t v13 = [(HMDMediaAccessory *)self name];
        char v14 = HMFEqualObjects();

        if ((v14 & 1) == 0) {
          [(HMDAccessory *)self notifyAccessoryNameChanged:1];
        }
      }
    }
  }
}

- (void)handleRoomNameChanged:(id)a3
{
  id v14 = a3;
  id v4 = [v14 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    BOOL v7 = [(HMDAccessory *)self room];
    int v8 = HMFEqualObjects();

    if (v8)
    {
      int v9 = [(HMDAccessory *)self getConfiguredName];

      if (!v9)
      {
        id v10 = [v14 userInfo];
        __int16 v11 = objc_msgSend(v10, "hmf_stringForKey:", @"kRoomOldNameKey");

        id v12 = [(HMDMediaAccessory *)self name];
        char v13 = HMFEqualObjects();

        if ((v13 & 1) == 0) {
          [(HMDAccessory *)self notifyAccessoryNameChanged:1];
        }
      }
    }
  }
}

- (id)transportReports
{
  return 0;
}

- (id)name
{
  char v3 = [(HMDAccessory *)self configuredName];
  id v4 = [(HMDAccessory *)self room];
  id v5 = v4;
  if (!v3)
  {
    uint64_t v6 = [v4 name];
    if (v6) {
      char v3 = (__CFString *)v6;
    }
    else {
      char v3 = @"Media Accessory";
    }
  }

  return v3;
}

- (BOOL)providesHashRouteID
{
  return 1;
}

- (void)removeAdvertisement:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDMediaAccessory;
  [(HMDAccessory *)&v13 removeAdvertisement:v4];
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [(HMDMediaAccessory *)self setAdvertisement:0];
    int v8 = [(HMDMediaAccessory *)self mediaProfile];
    [v8 setMediaSession:0];

    [(HMDAccessory *)self setReachable:0];
  }
  else
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid removed advertisement: %@", buf, 0x16u);
    }
  }
}

- (void)addAdvertisement:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaAccessory;
  [(HMDAccessory *)&v12 addAdvertisement:v4];
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [(HMDMediaAccessory *)self setAdvertisement:v7];
    [(HMDAccessory *)self setReachable:1];
  }
  else
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid added advertisement: %@", buf, 0x16u);
    }
  }
}

- (id)_createMediaProfile
{
  v2 = [[HMDMediaProfile alloc] initWithAccessory:self];
  return v2;
}

- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDMediaAccessory;
    BOOL v5 = [(HMDAccessory *)&v7 _shouldFilterAccessoryProfileForUnentitledClients:v4];
  }

  return v5;
}

- (void)_registerForMessages
{
  v5.receiver = self;
  v5.super_class = (Class)HMDMediaAccessory;
  [(HMDAccessory *)&v5 _registerForMessages];
  char v3 = [(HMDMediaAccessory *)self notificationCenter];
  [v3 addObserver:self selector:sel_handleRoomChanged_ name:@"HMDNotificationAccessoryChangedRoom" object:self];

  id v4 = [(HMDMediaAccessory *)self notificationCenter];
  [v4 addObserver:self selector:sel_handleRoomNameChanged_ name:@"HMDRoomNameUpdatedNotification" object:0];
}

- (unint64_t)supportedTransports
{
  return 16;
}

- (HMDMediaAccessory)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDMediaAccessory;
  v2 = [(HMDAccessory *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    accessoryProfiles = v2->super._accessoryProfiles;
    v2->super._accessoryProfiles = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v5;
  }
  return v2;
}

- (HMDMediaAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  if (!v10)
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v26 = v21;
      v22 = "%{public}@Cannot initialize a media accessory without an media model.";
LABEL_13:
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    }
LABEL_14:

    uint64_t v18 = 0;
    goto LABEL_15;
  }
  __int16 v11 = [v10 identifier];

  if (!v11)
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v26 = v21;
      v22 = "%{public}@The media identifier is required";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaAccessory;
  objc_super v12 = [(HMDAccessory *)&v24 initWithTransaction:v8 home:v7];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v12->_notificationCenter;
    v12->_notificationCenter = (NSNotificationCenter *)v13;

    uint64_t v15 = [(HMDMediaAccessory *)v12 _createMediaProfile];
    mediaProfile = v12->_mediaProfile;
    v12->_mediaProfile = (HMDMediaProfile *)v15;

    [(NSMutableSet *)v12->super._accessoryProfiles addObject:v12->_mediaProfile];
  }
  uint64_t v17 = v12;
  uint64_t v18 = v17;
LABEL_15:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)assistantObject
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaAccessory;
  uint64_t v3 = [(HMDAccessory *)&v21 assistantObject];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(HMDAccessory *)self category];
  id v6 = [v5 categoryType];
  char v7 = [v6 isEqual:*MEMORY[0x263F0B010]];

  if (v7)
  {
    id v8 = (id *)MEMORY[0x263F656D0];
    goto LABEL_5;
  }
  int v9 = [v5 categoryType];
  char v10 = [v9 isEqual:*MEMORY[0x263F0B130]];

  if (v10)
  {
    id v8 = (id *)MEMORY[0x263F657C8];
LABEL_5:
    id v11 = *v8;
    id v12 = (id)*MEMORY[0x263F65638];
    uint64_t v13 = v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      v22[0] = @"objectServiceType";
      v22[1] = @"objectServiceSubType";
      v23[0] = v11;
      v23[1] = v12;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      [v4 addEntriesFromDictionary:v15];
    }
    goto LABEL_15;
  }
  if ([(HMDMediaAccessory *)self isMemberOfClass:objc_opt_class()])
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Media accessory with invalid accessory category: %@", buf, 0x16u);
    }
  }
  id v11 = 0;
  uint64_t v13 = 0;
LABEL_15:
  v19 = (void *)[v4 copy];

  return (NSDictionary *)v19;
}

- (NSString)urlString
{
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaAccessory;
  v2 = [(HMDAccessory *)&v4 urlString];
  return (NSString *)v2;
}

@end