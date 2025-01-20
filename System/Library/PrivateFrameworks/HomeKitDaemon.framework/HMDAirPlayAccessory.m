@interface HMDAirPlayAccessory
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (void)initialize;
- (BOOL)supportsDeviceWithCapabilities:(id)a3;
- (BOOL)supportsDisassociation;
- (BOOL)supportsMinimumUserPrivilege;
- (BOOL)supportsUserManagement;
- (HMDAirPlayAccessory)initWithCoder:(id)a3;
- (HMDAirPlayAccessory)initWithTransaction:(id)a3 home:(id)a4;
- (HMFExponentialBackoffTimer)configurationRetryTimer;
- (HMFPairingIdentity)pairingIdentity;
- (NSString)password;
- (id)advertisement;
- (id)backingStoreObjects:(int64_t)a3;
- (id)logIdentifier;
- (id)messageSendPolicy;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (int64_t)minimumUserPriviledge;
- (void)_handleUpdatedName:(id)a3;
- (void)addUser:(id)a3 completionHandler:(id)a4;
- (void)addUserPairingIdentity:(id)a3 isOwner:(BOOL)a4 completionHandler:(id)a5;
- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6;
- (void)disassociatePairingIdentity:(id)a3 completionHandler:(id)a4;
- (void)disassociateWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleUpdatedAdvertisement:(id)a3;
- (void)handleUpdatedMinimumUserPrivilege:(int64_t)a3;
- (void)handleUpdatedPassword:(id)a3;
- (void)pairingsWithCompletionHandler:(id)a3;
- (void)populateModelObject:(id)a3 version:(int64_t)a4;
- (void)removeUser:(id)a3 completionHandler:(id)a4;
- (void)removeUserPairingIdentity:(id)a3 isOwner:(BOOL)a4 completionHandler:(id)a5;
- (void)setAdvertisement:(id)a3;
- (void)setMinimumUserPriviledge:(int64_t)a3;
- (void)setPairingIdentity:(id)a3;
- (void)setPassword:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDAirPlayAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationRetryTimer, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

- (HMFExponentialBackoffTimer)configurationRetryTimer
{
  return self->_configurationRetryTimer;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessory *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  int v6 = objc_msgSend(v4, "hmd_isForLocalStore");
  v11.receiver = self;
  v11.super_class = (Class)HMDAirPlayAccessory;
  [(HMDMediaAccessory *)&v11 encodeWithCoder:v4];
  v7 = [(HMDAirPlayAccessory *)self pairingIdentity];
  v8 = v7;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      [v4 encodeObject:v7 forKey:*MEMORY[0x263F0B440]];
    }
    else if (v7)
    {
      v9 = [v7 publicPairingIdentity];
      [v4 encodeObject:v9 forKey:*MEMORY[0x263F0B440]];
    }
  }
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    v10 = [(HMDAirPlayAccessory *)self password];
    [v4 encodeObject:v10 forKey:@"HM.password"];

    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDAirPlayAccessory minimumUserPriviledge](self, "minimumUserPriviledge"), @"HM.minimumUserPriviledge");
  }
}

- (HMDAirPlayAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAirPlayAccessory;
  char v5 = [(HMDMediaAccessory *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B440]];
    pairingIdentity = v5->_pairingIdentity;
    v5->_pairingIdentity = (HMFPairingIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.password"];
    password = v5->_password;
    v5->_password = (NSString *)v8;

    v5->_minimumUserPriviledge = [v4 decodeIntegerForKey:@"HM.minimumUserPriviledge"];
  }

  return v5;
}

- (void)timerDidFire:(id)a3
{
  id v4 = [(HMDAccessory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HMDAirPlayAccessory_timerDidFire___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __36__HMDAirPlayAccessory_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying configuration", buf, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) advertisement];
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) home];
    if ([v7 hasAnyResident]
      && [v7 isCurrentDevicePrimaryResident])
    {
      __updateAccessoryInformation(*(void **)(a1 + 32), v6);
    }
    uint64_t v8 = [*(id *)(a1 + 32) configurationRetryTimer];
    [v8 suspend];

    v9 = __configurationFromAdvertisement(*(void **)(a1 + 32), v6);
    BOOL v10 = [v9 count] == 0;
    objc_super v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    v13 = HMFGetOSLogHandle();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v25 = v21;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory no longer out of sync", buf, 0xCu);
      }
      __stopConfigurationRetryTimer(*(void **)(a1 + 32));
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v25 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory out of sync, updating configuration", buf, 0xCu);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v16 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __36__HMDAirPlayAccessory_timerDidFire___block_invoke_64;
      v22[3] = &unk_264A2DE60;
      objc_copyWeak(&v23, (id *)buf);
      __updateConfiguration(v16, v9, v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Missing advertisement, continuing configuration retries", buf, 0xCu);
    }
  }
}

void __36__HMDAirPlayAccessory_timerDidFire___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  uint64_t v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      BOOL v10 = "%{public}@Failed to update accessory configuration with error: %@";
      objc_super v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v9;
    BOOL v10 = "%{public}@Successfully updated accessory configuration";
    objc_super v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 12;
    goto LABEL_6;
  }
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  return [a3 supportsWholeHouseAudio];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    os_log_type_t v12 = v11;
  }
  else {
    os_log_type_t v12 = 0;
  }
  id v13 = v12;

  v37 = v8;
  if (v13)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__130844;
    v45 = __Block_byref_object_dispose__130845;
    id v46 = 0;
    int v14 = [v10 responseHandler];
    if (v14)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HMDAirPlayAccessory_transactionObjectUpdated_newValues_message___block_invoke;
      aBlock[3] = &unk_264A20F88;
      aBlock[4] = &v41;
      v15 = _Block_copy(aBlock);
      [v10 setResponseHandler:v15];
    }
    v39.receiver = self;
    v39.super_class = (Class)HMDAirPlayAccessory;
    [(HMDMediaAccessory *)&v39 transactionObjectUpdated:0 newValues:v11 message:v10];
    __int16 v16 = self;
    id v17 = v13;
    id v18 = v10;
    v36 = [v18 transactionResult];
    v19 = [v17 pairingIdentity];

    if (v19)
    {
      v20 = [v17 pairingIdentity];
      v21 = [(HMDAirPlayAccessory *)v16 pairingIdentity];
      char v22 = [v20 isEqual:v21];

      if ((v22 & 1) == 0)
      {
        context = (void *)MEMORY[0x230FBD990]();
        id v23 = v16;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v34 = HMFGetLogIdentifier();
          uint64_t v25 = [v17 pairingIdentity];
          *(_DWORD *)buf = 138543618;
          v48 = v34;
          __int16 v49 = 2112;
          uint64_t v50 = v25;
          v33 = (void *)v25;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Updated pairing identity: %@", buf, 0x16u);
        }
        uint64_t v26 = [v17 pairingIdentity];
        [(HMDAirPlayAccessory *)v23 setPairingIdentity:v26];

        [v36 markChanged];
      }
    }
    if (objc_msgSend(v17, "propertyWasSet:", @"password", v33))
    {
      v27 = [v17 password];
      v28 = [(HMDAirPlayAccessory *)v16 password];
      char v29 = HMFEqualObjects();

      if ((v29 & 1) == 0)
      {
        v30 = [v17 password];
        [(HMDAirPlayAccessory *)v16 setPassword:v30];

        [v36 markChanged];
      }
    }
    if ([v17 propertyWasSet:@"minimumUserPriviledge"])
    {
      v31 = [v17 minimumUserPriviledge];
      uint64_t v32 = [v31 integerValue];

      if ([(HMDAirPlayAccessory *)v16 minimumUserPriviledge] != v32)
      {
        [(HMDAirPlayAccessory *)v16 setMinimumUserPriviledge:v32];
        [v36 markChanged];
      }
    }
    [v18 respondWithPayload:0];

    if (v14) {
      v14[2](v14, v42[5], 0);
    }

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)HMDAirPlayAccessory;
    [(HMDMediaAccessory *)&v38 transactionObjectUpdated:v8 newValues:v11 message:v10];
  }
}

void __66__HMDAirPlayAccessory_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)pairingsWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    char v29 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting pairings", buf, 0xCu);
  }
  id v9 = [(HMDAccessory *)v6 home];
  char v10 = [v9 isOwnerUser];

  if (v10)
  {
    id v11 = [(HMDAirPlayAccessory *)v6 advertisement];
    os_log_type_t v12 = [v11 outputDevice];
    id v13 = objc_msgSend(v12, "av_OutputDevice");

    if (v13)
    {
      objc_initWeak((id *)buf, v6);
      int v14 = __outputDeviceConfigurationOptions();
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __53__HMDAirPlayAccessory_pairingsWithCompletionHandler___block_invoke_2;
      v24[3] = &unk_264A207C8;
      id v25 = v11;
      objc_copyWeak(&v27, (id *)buf);
      id v26 = v4;
      [v13 configureUsingBlock:&__block_literal_global_130851 options:v14 completionHandler:v24];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      v20 = v6;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        char v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        char v29 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Missing output device", buf, 0xCu);
      }
      id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v23);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = v6;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v29 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Only owner can remove users", buf, 0xCu);
    }
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
}

void __53__HMDAirPlayAccessory_pairingsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8)
  {
    id v32 = v9;
    os_log_type_t v12 = (void *)MEMORY[0x263EFF980];
    id v13 = [v8 peersInHomeGroup];
    int v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v15 = [v8 peersInHomeGroup];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v19), "hmd_pairingIdentity");
          [v14 addObject:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v17);
    }

    v21 = (void *)[v14 copy];
    char v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = WeakRetained;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      objc_super v39 = v25;
      __int16 v40 = 2112;
      id v41 = v21;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Successfully requested pairing identities: %@", buf, 0x16u);
    }

    id v26 = 0;
    id v9 = v32;
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = WeakRetained;
    char v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      objc_super v39 = v30;
      __int16 v40 = 2112;
      id v41 = v10;
      __int16 v42 = 2112;
      id v43 = v9;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get peers with error: %@, cancellationReason: %@", buf, 0x20u);
    }
    id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:54 description:@"Communication failure" reason:@"Failed to get configuration." suggestion:0 underlyingError:v10];
    v21 = 0;
  }
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    (*(void (**)(uint64_t, void *, void *))(v31 + 16))(v31, v21, v26);
  }
}

- (void)removeUserPairingIdentity:(id)a3 isOwner:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    os_log_type_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v33 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@User is the owner, disassociating from device", buf, 0xCu);
    }
    [(HMDAirPlayAccessory *)v11 disassociatePairingIdentity:v8 completionHandler:v9];
  }
  else
  {
    int v14 = [(HMDAirPlayAccessory *)self advertisement];
    v15 = [v14 outputDevice];
    uint64_t v16 = objc_msgSend(v15, "av_OutputDevice");

    if (v16)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke;
      aBlock[3] = &unk_264A207A0;
      id v17 = v8;
      id v31 = v17;
      uint64_t v18 = _Block_copy(aBlock);
      objc_initWeak((id *)buf, self);
      uint64_t v19 = __outputDeviceConfigurationOptions();
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke_2;
      v25[3] = &unk_264A207F0;
      id v26 = v14;
      objc_copyWeak(&v29, (id *)buf);
      id v27 = v17;
      id v28 = v9;
      [v16 configureUsingBlock:v18 options:v19 completionHandler:v25];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

      v20 = v31;
    }
    else
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      char v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v33 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Missing output device", buf, 0xCu);
      }
      v20 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      (*((void (**)(id, void *))v9 + 2))(v9, v20);
    }
  }
}

void __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  [v3 removePeerWithIDFromHomeGroup:v4];
}

void __75__HMDAirPlayAccessory_removeUserPairingIdentity_isOwner_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v8)
  {
    id v34 = v9;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    os_log_type_t v12 = [v8 peersInHomeGroup];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v35 + 1) + 8 * v16) peerID];
          uint64_t v18 = [*(id *)(a1 + 40) identifier];

          if (v17 == v18)
          {
            v24 = (void *)MEMORY[0x230FBD990]();
            id v25 = WeakRetained;
            id v26 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              id v27 = HMFGetLogIdentifier();
              id v28 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              id v41 = v27;
              __int16 v42 = 2112;
              id v43 = v28;
              _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove user pairing identity: %@", buf, 0x16u);
            }
            id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:41];

            goto LABEL_16;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = WeakRetained;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      char v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v41 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully removed peer", buf, 0xCu);
    }
    id v23 = 0;
LABEL_16:
    id v9 = v34;
  }
  else
  {
    id v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = WeakRetained;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v41 = v32;
      __int16 v42 = 2112;
      id v43 = v10;
      __int16 v44 = 2112;
      id v45 = v9;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove peer with error: %@, cancellationReason: %@", buf, 0x20u);
    }
    id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:54 description:@"Communication failure" reason:@"Failed to set configuration." suggestion:0 underlyingError:v10];
  }
  uint64_t v33 = *(void *)(a1 + 48);
  if (v33) {
    (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v23);
  }
}

- (void)removeUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    int v18 = 138543618;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Removing user: %@", (uint8_t *)&v18, 0x16u);
  }
  os_log_type_t v12 = [v6 pairingIdentity];
  if (v12)
  {
    -[HMDAirPlayAccessory removeUserPairingIdentity:isOwner:completionHandler:](v9, "removeUserPairingIdentity:isOwner:completionHandler:", v12, [v6 isOwner], v7);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v9;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to get pairing identity for user: %@", (uint8_t *)&v18, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v7[2](v7, v17);
  }
}

- (void)addUserPairingIdentity:(id)a3 isOwner:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDAccessory *)self home];
  char v11 = [v10 isOwnerUser];

  if (v11)
  {
    os_log_type_t v12 = [(HMDAirPlayAccessory *)self advertisement];
    uint64_t v13 = [v12 outputDevice];
    uint64_t v14 = objc_msgSend(v13, "av_OutputDevice");

    if (v14)
    {
      uint64_t v15 = +[HMDUser av_authorizedPeerForPairingIdentity:v8 isOwner:v6];
      uint64_t v16 = v15;
      if (v15)
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke;
        aBlock[3] = &unk_264A207A0;
        id v17 = v15;
        id v40 = v17;
        int v18 = _Block_copy(aBlock);
        objc_initWeak((id *)location, self);
        uint64_t v19 = __outputDeviceConfigurationOptions();
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke_2;
        v34[3] = &unk_264A207F0;
        id v35 = v12;
        objc_copyWeak(&v38, (id *)location);
        id v36 = v17;
        id v37 = v9;
        [v14 configureUsingBlock:v18 options:v19 completionHandler:v34];

        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)location);

        __int16 v20 = v40;
      }
      else
      {
        id v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = self;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          id v32 = HMFGetLogIdentifier();
          uint64_t v33 = [NSNumber numberWithBool:v6];
          *(_DWORD *)location = 138543874;
          *(void *)&location[4] = v32;
          __int16 v42 = 2112;
          id v43 = v8;
          __int16 v44 = 2112;
          id v45 = v33;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Failed to create authorized peer for pairing identity: %@ isOwner: %@", location, 0x20u);
        }
        __int16 v20 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        (*((void (**)(id, void *))v9 + 2))(v9, v20);
      }
    }
    else
    {
      id v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)location = 138543362;
        *(void *)&location[4] = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Missing output device", location, 0xCu);
      }
      uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
      (*((void (**)(id, void *))v9 + 2))(v9, v16);
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543362;
      *(void *)&location[4] = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Only owner can add users identities", location, 0xCu);
    }
    os_log_type_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }
}

uint64_t __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addPeerToHomeGroup:*(void *)(a1 + 32)];
}

void __72__HMDAirPlayAccessory_addUserPairingIdentity_isOwner_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v8)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = WeakRetained;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = HMFGetLogIdentifier();
      int v29 = 138543874;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v10;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add peer with error: %@, cancellationReason: %@", (uint8_t *)&v29, 0x20u);
    }
    uint64_t v25 = [MEMORY[0x263F087E8] hmErrorWithCode:54 description:@"Communication failure" reason:@"Failed to set configuration." suggestion:0 underlyingError:v10];
    goto LABEL_12;
  }
  os_log_type_t v12 = [v8 peersInHomeGroup];
  char v13 = [v12 containsObject:*(void *)(a1 + 40)];

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = WeakRetained;
  uint64_t v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) == 0)
  {
    if (v17)
    {
      id v26 = HMFGetLogIdentifier();
      id v27 = *(void **)(a1 + 40);
      int v29 = 138543618;
      id v30 = v26;
      __int16 v31 = 2112;
      id v32 = v27;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to add peer: %@", (uint8_t *)&v29, 0x16u);
    }
    uint64_t v25 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
LABEL_12:
    __int16 v20 = (void *)v25;
    goto LABEL_13;
  }
  if (v17)
  {
    int v18 = HMFGetLogIdentifier();
    uint64_t v19 = *(void **)(a1 + 40);
    int v29 = 138543618;
    id v30 = v18;
    __int16 v31 = 2112;
    id v32 = v19;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added peer: %@", (uint8_t *)&v29, 0x16u);
  }
  __int16 v20 = 0;
LABEL_13:
  uint64_t v28 = *(void *)(a1 + 48);
  if (v28) {
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v20);
  }
}

- (void)addUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = HMFGetLogIdentifier();
    int v25 = 138543618;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Adding user: %@", (uint8_t *)&v25, 0x16u);
  }
  os_log_type_t v12 = [(HMDAccessory *)v9 home];
  char v13 = [v12 isOwnerUser];

  if (v13)
  {
    uint64_t v14 = [v6 pairingIdentity];
    if (v14)
    {
      id v15 = (void *)v14;
      -[HMDAirPlayAccessory addUserPairingIdentity:isOwner:completionHandler:](v9, "addUserPairingIdentity:isOwner:completionHandler:", v14, [v6 isOwner], v7);
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = v9;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        id v26 = v23;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Failed to get pairing identity for user: %@", (uint8_t *)&v25, 0x16u);
      }
      v24 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      v7[2](v7, v24);

      id v15 = 0;
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    BOOL v17 = v9;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v25 = 138543362;
      id v26 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Only owner can add users", (uint8_t *)&v25, 0xCu);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    v7[2](v7, v15);
  }
}

- (BOOL)supportsUserManagement
{
  return 1;
}

- (void)disassociatePairingIdentity:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting disassociation", buf, 0xCu);
  }
  os_log_type_t v12 = [(HMDAirPlayAccessory *)v9 advertisement];
  char v13 = [v12 outputDevice];
  uint64_t v14 = objc_msgSend(v13, "av_OutputDevice");

  if (v14)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke;
    aBlock[3] = &unk_264A207A0;
    id v27 = v6;
    id v15 = _Block_copy(aBlock);
    objc_initWeak((id *)buf, v9);
    uint64_t v16 = __outputDeviceConfigurationOptions();
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke_2;
    v22[3] = &unk_264A207C8;
    id v23 = v12;
    objc_copyWeak(&v25, (id *)buf);
    id v24 = v7;
    [v14 configureUsingBlock:v15 options:v16 completionHandler:v22];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

    BOOL v17 = v27;
  }
  else
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = v9;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Missing output device", buf, 0xCu);
    }
    BOOL v17 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }
}

void __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDevicePassword:&stru_26E2EB898];
  [v3 stopAutomaticallyAllowingConnectionsFromPeersInHomeGroup];
  id v4 = [*(id *)(a1 + 32) identifier];
  [v3 removePeerWithIDFromHomeGroup:v4];
}

void __69__HMDAirPlayAccessory_disassociatePairingIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v8)
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = WeakRetained;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = HMFGetLogIdentifier();
      int v30 = 138543874;
      __int16 v31 = v22;
      __int16 v32 = 2112;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to disassociate with error: %@, cancellationReason: %@", (uint8_t *)&v30, 0x20u);
    }
    uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:54 description:@"Communication failure" reason:@"Failed to set configuration." suggestion:0 underlyingError:v10];
    goto LABEL_14;
  }
  os_log_type_t v12 = [v8 devicePassword];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = WeakRetained;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = HMFGetLogIdentifier();
      int v30 = 138543362;
      __int16 v31 = v17;
      int v18 = "%{public}@Failed to reset device password";
LABEL_12:
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v30, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (([v8 automaticallyAllowsConnectionsFromPeersInHomeGroup] & 1) != 0
    || [v8 onlyAllowsConnectionsFromPeersInHomeGroup])
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = WeakRetained;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = HMFGetLogIdentifier();
      int v30 = 138543362;
      __int16 v31 = v17;
      int v18 = "%{public}@Failed to disable home peers";
      goto LABEL_12;
    }
LABEL_13:

    uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
LABEL_14:
    id v24 = (void *)v23;
    goto LABEL_15;
  }
  id v26 = (void *)MEMORY[0x230FBD990]();
  id v27 = WeakRetained;
  id v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = HMFGetLogIdentifier();
    int v30 = 138543362;
    __int16 v31 = v29;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully disassociated", (uint8_t *)&v30, 0xCu);
  }
  id v24 = 0;
LABEL_15:
  uint64_t v25 = *(void *)(a1 + 40);
  if (v25) {
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v24);
  }
}

- (void)disassociateWithCompletionHandler:(id)a3
{
  id v3 = (void *)MEMORY[0x263F087E8];
  id v4 = (void (**)(id, id))a3;
  id v5 = [v3 hmErrorWithCode:48];
  v4[2](v4, v5);
}

- (BOOL)supportsDisassociation
{
  return 0;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  id v5 = [HMDAirPlayAccessoryModel alloc];
  id v6 = [(HMDAccessory *)self uuid];
  id v7 = [(HMDAccessory *)self home];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  v12.receiver = self;
  v12.super_class = (Class)HMDAirPlayAccessory;
  [(HMDAccessory *)&v12 populateModelObject:v8 version:a4];
  id v9 = [(HMDAirPlayAccessory *)self pairingIdentity];
  [v8 setPairingIdentity:v9];

  id v10 = [(HMDAirPlayAccessory *)self password];
  [v8 setPassword:v10];

  char v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAirPlayAccessory minimumUserPriviledge](self, "minimumUserPriviledge"));
  [v8 setMinimumUserPriviledge:v11];
}

- (id)backingStoreObjects:(int64_t)a3
{
  id v5 = [HMDAirPlayAccessoryModel alloc];
  id v6 = [(HMDAccessory *)self uuid];
  id v7 = [(HMDAccessory *)self home];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v8];

  [(HMDAirPlayAccessory *)self populateModelObject:v9 version:a3];
  id v10 = [MEMORY[0x263EFF980] arrayWithObject:v9];
  v13.receiver = self;
  v13.super_class = (Class)HMDAirPlayAccessory;
  char v11 = [(HMDAccessory *)&v13 backingStoreObjects:a3];
  [v10 addObjectsFromArray:v11];

  return v10;
}

- (void)setMinimumUserPriviledge:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_minimumUserPriviledge = a3;
  os_unfair_recursive_lock_unlock();
}

- (int64_t)minimumUserPriviledge
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t minimumUserPriviledge = self->_minimumUserPriviledge;
  os_unfair_recursive_lock_unlock();
  return minimumUserPriviledge;
}

- (void)setPassword:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  password = self->_password;
  self->_password = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSString)password
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_password;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setPairingIdentity:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (HMFPairingIdentity *)[v6 copy];
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMFPairingIdentity)pairingIdentity
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_pairingIdentity;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)handleUpdatedPassword:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAirPlayAccessory;
  [(HMDMediaAccessory *)&v10 handleUpdatedPassword:v4];
  id v5 = [(HMDAirPlayAccessory *)self password];
  char v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    id v7 = [(HMDAccessory *)self workQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__HMDAirPlayAccessory_handleUpdatedPassword___block_invoke;
    v8[3] = &unk_264A2F820;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __45__HMDAirPlayAccessory_handleUpdatedPassword___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = v2;
    char v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Updating password to: %@", buf, 0x16u);
    }
    if (v3)
    {
      uint64_t v14 = @"password";
      v15[0] = v3;
    }
    else
    {
      uint64_t v14 = @"password";
      v15[0] = &stru_26E2EB898;
    }
    id v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v9 = [v5 configurationRetryTimer];
    [v9 reset];

    objc_initWeak(&location, v5);
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____updatePassword_block_invoke;
    objc_super v12 = &unk_264A2DE60;
    objc_copyWeak(&v13, &location);
    __updateConfiguration(v5, v8, buf);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)handleUpdatedMinimumUserPrivilege:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDAirPlayAccessory;
  -[HMDMediaAccessory handleUpdatedMinimumUserPrivilege:](&v7, sel_handleUpdatedMinimumUserPrivilege_);
  if ([(HMDAirPlayAccessory *)self minimumUserPriviledge] != a3)
  {
    id v5 = [(HMDAccessory *)self workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__HMDAirPlayAccessory_handleUpdatedMinimumUserPrivilege___block_invoke;
    v6[3] = &unk_264A2C6A0;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(v5, v6);
  }
}

void __57__HMDAirPlayAccessory_handleUpdatedMinimumUserPrivilege___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = v2;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = HMFGetLogIdentifier();
      objc_super v7 = HMUserPrivilegeToString();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Updating minimum user privilege to: %@", buf, 0x16u);
    }
    id v15 = @"privilege";
    id v8 = [NSNumber numberWithInteger:v1];
    v16[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

    objc_super v10 = [v4 configurationRetryTimer];
    [v10 reset];

    objc_initWeak(&location, v4);
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____updateMinimumUserPrivilege_block_invoke;
    id v13 = &unk_264A2DE60;
    objc_copyWeak(&v14, &location);
    __updateConfiguration(v4, v9, buf);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (BOOL)supportsMinimumUserPrivilege
{
  return 1;
}

- (id)messageSendPolicy
{
  id v2 = [[HMDHomeManagerXPCMessageSendPolicy alloc] initWithEntitlements:1 options:257];
  return v2;
}

- (void)_handleUpdatedName:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDAirPlayAccessory;
  [(HMDAccessory *)&v18 _handleUpdatedName:v4];
  id v5 = [(HMDAccessory *)self room];
  char v6 = [v5 name];

  objc_super v7 = [(HMDAccessory *)self getConfiguredName];

  if (v7)
  {
    uint64_t v8 = [(HMDAccessory *)self getConfiguredName];

    char v6 = (void *)v8;
  }
  id v9 = self;
  id v10 = v6;
  char v11 = v10;
  if (v9 && v10)
  {
    objc_super v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = v9;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating name to: %@", buf, 0x16u);
    }
    uint64_t v23 = @"name";
    v24[0] = v11;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    BOOL v17 = [(HMDAirPlayAccessory *)v13 configurationRetryTimer];
    [v17 reset];

    objc_initWeak(&location, v13);
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____updateName_block_invoke;
    id v21 = &unk_264A2DE60;
    objc_copyWeak(&v22, &location);
    __updateConfiguration(v13, v16, buf);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)handleUpdatedAdvertisement:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessory *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v20.receiver = self;
  v20.super_class = (Class)HMDAirPlayAccessory;
  [(HMDMediaAccessory *)&v20 handleUpdatedAdvertisement:v4];
  if (v4)
  {
    char v6 = [(HMDAccessory *)self home];
    if ([v6 hasAnyResident]
      && ([v6 primaryResident],
          objc_super v7 = objc_claimAutoreleasedReturnValue(),
          BOOL v8 = v7 == 0,
          v7,
          v8))
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        BOOL v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v22 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Deferring configuration because there currently is not a primary resident", buf, 0xCu);
      }
      __startConfigurationRetryTimer(v15);
    }
    else
    {
      __updateAccessoryInformation(self, v4);
      id v9 = __configurationFromAdvertisement(self, v4);
      if ([v9 count])
      {
        id v10 = (void *)MEMORY[0x230FBD990]();
        char v11 = self;
        objc_super v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v22 = v13;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory out of sync, updating configuration", buf, 0xCu);
        }
        objc_initWeak((id *)buf, v11);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __50__HMDAirPlayAccessory_handleUpdatedAdvertisement___block_invoke;
        v18[3] = &unk_264A2DE60;
        objc_copyWeak(&v19, (id *)buf);
        __updateConfiguration(v11, v9, v18);
        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        __stopConfigurationRetryTimer(self);
      }
    }
  }
  else
  {
    __stopConfigurationRetryTimer(self);
  }
}

void __50__HMDAirPlayAccessory_handleUpdatedAdvertisement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  objc_super v7 = HMFGetOSLogHandle();
  BOOL v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      id v10 = "%{public}@Failed to update accessory configuration with error: %@";
      char v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    id v15 = v9;
    id v10 = "%{public}@Successfully updated accessory configuration";
    char v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 12;
    goto LABEL_6;
  }
}

- (void)setAdvertisement:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  objc_super v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    id v9 = [(HMDAccessory *)v6 identifier];
    int v10 = 138543618;
    char v11 = v8;
    __int16 v12 = 2112;
    uint32_t v13 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Ignoring setting the advertisement data for AirPlay accessory %@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)advertisement
{
  id v3 = [HMDMediaAccessoryBrowseOperation alloc];
  id v4 = [(HMDAccessory *)self identifier];
  id v5 = [(HMDMediaAccessoryBrowseOperation *)v3 initWithAccessoryIdentifier:v4];

  [(HMDMediaAccessoryBrowseOperation *)v5 setEndpointFeatures:1];
  [(HMFOperation *)v5 start];
  [(HMDMediaAccessoryBrowseOperation *)v5 waitUntilFinished];
  id v6 = [(HMFOperation *)v5 error];

  if (v6)
  {
    objc_super v7 = 0;
  }
  else
  {
    BOOL v8 = [(HMDMediaAccessoryBrowseOperation *)v5 outputDevices];
    id v9 = [v8 firstObject];

    objc_super v7 = [[HMDMediaAccessoryAdvertisement alloc] initWithOutputDevice:v9];
  }

  return v7;
}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  __int16 v12 = a5;
  uint32_t v13 = v12;
  if (v12) {
    dispatch_group_enter(v12);
  }
  v20.receiver = self;
  v20.super_class = (Class)HMDAirPlayAccessory;
  [(HMDAccessory *)&v20 configureWithHome:v10 msgDispatcher:v11 configurationTracker:v13 initialConfiguration:v6];
  uint64_t v14 = [(HMDAccessory *)self home];
  id v15 = [v14 residentDeviceManager];
  [v15 addDataSource:self];

  __int16 v16 = [(HMDAccessory *)self workQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97__HMDAirPlayAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
  v18[3] = &unk_264A2F820;
  void v18[4] = self;
  id v19 = v13;
  id v17 = v13;
  dispatch_async(v16, v18);
}

void __97__HMDAirPlayAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) advertisement];
  id v3 = *(void **)(a1 + 32);
  id v7 = (id)v2;
  if (v2)
  {
    id v4 = [v3 advertisement];
    [v3 handleUpdatedAdvertisement:v4];
  }
  else
  {
    id v5 = [v3 configurationRetryTimer];
    [v5 reset];

    __startConfigurationRetryTimer(*(void **)(a1 + 32));
  }
  BOOL v6 = *(NSObject **)(a1 + 40);
  if (v6) {
    dispatch_group_leave(v6);
  }
}

- (HMDAirPlayAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v22.receiver = self;
    v22.super_class = (Class)HMDAirPlayAccessory;
    id v11 = [(HMDMediaAccessory *)&v22 initWithTransaction:v8 home:v7];
    if (v11)
    {
      uint64_t v12 = [v10 pairingIdentity];
      pairingIdentity = v11->_pairingIdentity;
      v11->_pairingIdentity = (HMFPairingIdentity *)v12;

      uint64_t v14 = [v10 password];
      password = v11->_password;
      v11->_password = (NSString *)v14;
    }
    __int16 v16 = v11;
    id v17 = v16;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_super v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v24 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize an AirPlay accessory without an AirPlay model.", buf, 0xCu);
    }
    id v17 = 0;
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t82 != -1) {
    dispatch_once(&logCategory__hmf_once_t82, &__block_literal_global_78_130913);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v83;
  return v2;
}

void __34__HMDAirPlayAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v83;
  logCategory__hmf_once_v83 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  [MEMORY[0x263F42608] setDefaultValue:&unk_26E4746E8 forPreferenceKey:@"airPlayConfigurationRetryMinimum"];
  [MEMORY[0x263F42608] setDefaultValue:&unk_26E4746F8 forPreferenceKey:@"airPlayConfigurationRetryMaximum"];
  uint64_t v2 = (void *)MEMORY[0x263F42608];
  [v2 setDefaultValue:&unk_26E471B78 forPreferenceKey:@"airPlayConfigurationRetryFactor"];
}

@end