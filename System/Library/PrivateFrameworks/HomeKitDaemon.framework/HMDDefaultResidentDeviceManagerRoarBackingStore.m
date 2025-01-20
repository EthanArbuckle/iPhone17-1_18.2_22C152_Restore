@interface HMDDefaultResidentDeviceManagerRoarBackingStore
+ (id)logCategory;
- (BOOL)_addDeviceIdentifiersIfNecessary:(id)a3 fromResidentDevice:(id)a4;
- (BOOL)_shouldUpdateDeviceIdentifiersForResident:(id)a3 fromResidentDevice:(id)a4;
- (BOOL)allowedToWriteResidentSelectionInfo;
- (BOOL)hasAnyResident;
- (BOOL)hasResidentSelectionInfoUpdateInNotification:(id)a3;
- (BOOL)residentModel:(id)a3 isTheSameAs:(id)a4;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDDefaultResidentDeviceManagerRoarBackingStore)initWithHome:(id)a3 appleAccountManager:(id)a4;
- (HMDHome)home;
- (HMDResidentDevice)_residentDeviceFromModel:(void *)a3 currentDevice:;
- (HMDResidentSelectionInfo)residentSelectionInfo;
- (HMDResidentSelectionInfo)residentSelectionInfoToWrite;
- (NSMapTable)residentDeviceByObjectID;
- (NSString)cloudChangeUpdateNotificationName;
- (NSString)logIdentifier;
- (id)_canonicalResidentSelectionModelForHome:(id)a3;
- (id)_deviceFromModel:(id)a3;
- (id)_deviceFromModel:(id)a3 currentDevice:(id)a4;
- (id)_deviceWithIdsDestination:(id)a3 fromAccount:(id)a4;
- (id)_deviceWithIdsIdentifier:(id)a3 fromAccount:(id)a4;
- (id)_residentSelectionModelFromManagedObject:(id)a3;
- (id)findResidents:(id)a3 outHasResidents:(BOOL *)a4;
- (id)handleCloudResidentChange:(id)a3 currentResidents:(id)a4 isCurrentDevicePrimaryResident:(BOOL)a5 currentDevice:(id)a6;
- (id)pruneDuplicateResidentModelsFrom:(id)a3;
- (id)residentSelectionInfoWriteCompletion;
- (id)residentsRequiringReachabilityUpdate:(id)a3;
- (void)_mapResidentsToMKFResidents:(id)a3 operation:(id)a4 finished:(id)a5;
- (void)_updateHasAnyResident;
- (void)_writeResidentSelectionInfoToWorkingStore;
- (void)handleHomeDataReadyAfterBecomingPrimary:(id)a3;
- (void)setAllowedToWriteResidentSelectionInfo:(BOOL)a3;
- (void)setHasAnyResident:(BOOL)a3;
- (void)setResidentSelectionInfoToWrite:(id)a3;
- (void)setResidentSelectionInfoWriteCompletion:(id)a3;
- (void)updateIdentifiersForAvailableResidentDevices:(id)a3;
- (void)updateReachabilityForResidents:(id)a3;
- (void)updateResidentSelectionInfoTo:(id)a3 completion:(id)a4;
@end

@implementation HMDDefaultResidentDeviceManagerRoarBackingStore

- (void).cxx_destruct
{
  objc_storeStrong(&self->_residentSelectionInfoWriteCompletion, 0);
  objc_storeStrong((id *)&self->_residentSelectionInfoToWrite, 0);
  objc_storeStrong((id *)&self->_residentDeviceByObjectID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_appleAccountManager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setResidentSelectionInfoWriteCompletion:(id)a3
{
}

- (id)residentSelectionInfoWriteCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setAllowedToWriteResidentSelectionInfo:(BOOL)a3
{
  self->_allowedToWriteResidentSelectionInfo = a3;
}

- (BOOL)allowedToWriteResidentSelectionInfo
{
  return self->_allowedToWriteResidentSelectionInfo;
}

- (void)setResidentSelectionInfoToWrite:(id)a3
{
}

- (HMDResidentSelectionInfo)residentSelectionInfoToWrite
{
  return (HMDResidentSelectionInfo *)objc_getProperty(self, a2, 64, 1);
}

- (NSMapTable)residentDeviceByObjectID
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAppleAccountManager)appleAccountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appleAccountManager);
  return (HMDAppleAccountManager *)WeakRetained;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)_canonicalResidentSelectionModelForHome:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 residentSelections];
  if ([v5 count])
  {
    id v6 = (id)[v5 sortedArrayUsingComparator:&__block_literal_global_213385];
    v7 = [v5 firstObject];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident Selection model is not present in the backing store.", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

uint64_t __91__HMDDefaultResidentDeviceManagerRoarBackingStore__canonicalResidentSelectionModelForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 selectionTimestamp];
  id v6 = [v4 selectionTimestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)handleHomeDataReadyAfterBecomingPrimary:(id)a3
{
  [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self setAllowedToWriteResidentSelectionInfo:1];
  [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self _writeResidentSelectionInfoToWorkingStore];
}

- (void)_writeResidentSelectionInfoToWorkingStore
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
  if ([v3 isCurrentDevicePrimaryResident]
    && [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self allowedToWriteResidentSelectionInfo]&& ([(HMDDefaultResidentDeviceManagerRoarBackingStore *)self residentSelectionInfoToWrite], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self residentSelectionInfoToWrite];
    id v6 = [v3 backingStore];
    uint64_t v7 = [v6 context];

    v8 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self residentSelectionInfoWriteCompletion];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __92__HMDDefaultResidentDeviceManagerRoarBackingStore__writeResidentSelectionInfoToWorkingStore__block_invoke;
    v18[3] = &unk_264A2DDC0;
    v18[4] = self;
    id v19 = v5;
    id v20 = v3;
    id v21 = v7;
    id v22 = v8;
    id v9 = v8;
    id v10 = v7;
    id v11 = v5;
    [v10 performBlock:v18];
    [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self setResidentSelectionInfoToWrite:0];
    [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self setResidentSelectionInfoWriteCompletion:0];
  }
  else
  {
    v12 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self residentSelectionInfoToWrite];

    if (v12)
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        v17 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v14 residentSelectionInfoToWrite];
        *(_DWORD *)buf = 138543874;
        v24 = v16;
        __int16 v25 = 2112;
        v26 = v17;
        __int16 v27 = 1024;
        BOOL v28 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v14 allowedToWriteResidentSelectionInfo];
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Not writing resident selection info:%@ to working store yet. Allowed to write: %d", buf, 0x1Cu);
      }
    }
  }
}

void __92__HMDDefaultResidentDeviceManagerRoarBackingStore__writeResidentSelectionInfoToWorkingStore__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v29 = 138543618;
    v30 = v5;
    __int16 v31 = 2112;
    uint64_t v32 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Writing resident selection info: %@ to working store.", (uint8_t *)&v29, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 48) uuid];
  v8 = +[HMCContext findHomeWithModelID:v7];

  id v9 = [*(id *)(a1 + 32) _canonicalResidentSelectionModelForHome:v8];
  if (!v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      int v29 = 138543618;
      v30 = v13;
      __int16 v31 = 2112;
      uint64_t v32 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating new resident selection model with info: %@", (uint8_t *)&v29, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 materializeOrCreateResidentSelectionsRelationWithModelID:v15 createdNew:0];
  }
  v16 = [v8 residentSelectionVersion];
  uint64_t v17 = [v16 unsignedLongValue];

  if (v17 != 3)
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating home model to indicate support for resident selection", (uint8_t *)&v29, 0xCu);
    }
    id v22 = (void *)[objc_alloc(NSNumber) initWithLong:3];
    [v8 setResidentSelectionVersion:v22];
  }
  v23 = [*(id *)(a1 + 40) preferredResidentIDSIdentifier];

  if (v23)
  {
    v24 = (void *)MEMORY[0x263EFF8C0];
    __int16 v25 = [*(id *)(a1 + 40) preferredResidentIDSIdentifier];
    v23 = [v24 arrayWithObject:v25];
  }
  [v9 setPreferredResidentIDSIdentifiers:v23];
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "currentModeType"));
  [v9 setMode:v26];

  __int16 v27 = [*(id *)(a1 + 40) selectionTimestamp];
  [v9 setSelectionTimestamp:v27];

  [*(id *)(a1 + 56) save];
  uint64_t v28 = *(void *)(a1 + 64);
  if (v28) {
    (*(void (**)(uint64_t, void))(v28 + 16))(v28, 0);
  }
}

- (void)updateResidentSelectionInfoTo:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    int v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received updated resident selection info to write to working store: %@.", (uint8_t *)&v12, 0x16u);
  }
  [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v9 setResidentSelectionInfoToWrite:v6];
  [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v9 setResidentSelectionInfoWriteCompletion:v7];
  [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v9 _writeResidentSelectionInfoToWorkingStore];
}

- (BOOL)hasResidentSelectionInfoUpdateInNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_setForKey:", *MEMORY[0x263EFF018]);

  id v7 = [v4 userInfo];
  v8 = objc_msgSend(v7, "hmf_setForKey:", *MEMORY[0x263EFF180]);

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__213397;
  v18[4] = __Block_byref_object_dispose__213398;
  id v19 = 0;
  id v9 = [v8 setByAddingObjectsFromSet:v6];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke;
  v17[3] = &unk_264A276D0;
  v17[4] = self;
  v17[5] = v18;
  v17[6] = &v20;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

  id v10 = [v4 userInfo];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263EFEFE8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke_55;
  v16[3] = &unk_264A276D0;
  v16[4] = self;
  v16[5] = v18;
  v16[6] = &v20;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);
  char v14 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v14;
}

void __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) _residentSelectionModelFromManagedObject:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      char v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident selection info has updated in the working store.", (uint8_t *)&v13, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke_55(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 castIfResidentSelection];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v11)
  {
    int v12 = [v11 modelID];

    if (v12)
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident selection info got deleted from the working store.", (uint8_t *)&v17, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (id)_residentSelectionModelFromManagedObject:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 castIfResidentSelection];

  if (v7)
  {
    uint64_t v8 = [v7 home];
    uint64_t v9 = [v8 modelID];
    id v10 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
    id v11 = [v10 uuid];
    char v12 = [v9 isEqual:v11];

    if (v12)
    {
      id v13 = v7;
    }
    else
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      uint64_t v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = HMFGetLogIdentifier();
        int v19 = 138543618;
        uint64_t v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v7;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring resident selection model for another home: %@", (uint8_t *)&v19, 0x16u);
      }
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (HMDResidentSelectionInfo)residentSelectionInfo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self residentSelectionInfoToWrite];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v5 residentSelectionInfoToWrite];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Getting resident selection info from cache: %@.", buf, 0x16u);
    }
    id v9 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v5 residentSelectionInfoToWrite];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__213397;
    int v17 = __Block_byref_object_dispose__213398;
    id v18 = 0;
    id v10 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
    id v11 = [v10 backingStore];

    char v12 = [v11 context];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __72__HMDDefaultResidentDeviceManagerRoarBackingStore_residentSelectionInfo__block_invoke;
    v14[3] = &unk_264A2F0A0;
    v14[4] = self;
    v14[5] = buf;
    [v12 unsafeSynchronousBlock:v14];

    id v9 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  return (HMDResidentSelectionInfo *)v9;
}

void __72__HMDDefaultResidentDeviceManagerRoarBackingStore_residentSelectionInfo__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 uuid];
  id v14 = +[HMCContext findHomeWithModelID:v3];

  id v4 = [*(id *)(a1 + 32) _canonicalResidentSelectionModelForHome:v14];
  id v5 = [HMDResidentSelectionInfo alloc];
  id v6 = [v4 preferredResidentIDSIdentifiers];
  id v7 = [v6 firstObject];
  uint64_t v8 = [v4 mode];
  uint64_t v9 = [v8 unsignedIntegerValue];
  id v10 = [v4 selectionTimestamp];
  uint64_t v11 = [(HMDResidentSelectionInfo *)v5 initWithPreferredResidentIDSIdentifier:v7 currentResidentSelectionModeType:v9 selectionTimestamp:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (id)residentsRequiringReachabilityUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v16 = 0;
    id v5 = [MEMORY[0x263F42538] futureWithPromise:&v16];
    id v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke;
    v14[3] = &unk_264A276A8;
    id v15 = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke_2;
    v11[3] = &unk_264A2F820;
    id v12 = v16;
    id v13 = v15;
    id v7 = v15;
    [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self _mapResidentsToMKFResidents:v4 operation:v14 finished:v11];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F42538];
    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    id v5 = [v8 futureWithValue:v9];
  }
  return v5;
}

void __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    int v6 = [v9 isReachable];
    id v7 = [v5 reachable];
    int v8 = [v7 BOOLValue];

    if (v6 != v8) {
      [*(id *)(a1 + 32) addObject:v9];
    }
  }
}

void __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 fulfillWithValue:v2];
}

- (void)updateReachabilityForResidents:(id)a3
{
  id v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke;
  v6[3] = &unk_264A27680;
  v6[4] = self;
  v6[5] = v7;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke_52;
  v5[3] = &unk_264A2C2A8;
  v5[4] = v7;
  [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self _mapResidentsToMKFResidents:v4 operation:v6 finished:v5];
  _Block_object_dispose(v7, 8);
}

void __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 reachable];
  int v8 = [v7 BOOLValue];

  if ((v5 != 0) != v8)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v6 name];
      id v14 = [v5 identifier];
      id v15 = HMFBooleanToString();
      int v17 = 138544130;
      id v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating resident %@ %@ with reachability: %@", (uint8_t *)&v17, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v16 = [NSNumber numberWithBool:v5 != 0];
    [v6 setReachable:v16];
  }
}

void __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke_52(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v1 = +[HMCContext currentContext];
    [v1 save];
  }
}

- (void)_mapResidentsToMKFResidents:(id)a3 operation:(id)a4 finished:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263EFF9A0];
  id v11 = a3;
  id v12 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke;
  v24[3] = &unk_264A2A788;
  id v13 = v12;
  id v25 = v13;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);

  id v14 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
  id v15 = [v14 backingStore];
  id v16 = [v15 context];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_2;
  v20[3] = &unk_264A27658;
  v20[4] = self;
  id v21 = v13;
  id v22 = v8;
  id v23 = v9;
  id v17 = v9;
  id v18 = v8;
  id v19 = v13;
  [v16 performBlock:v20];
}

void __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 device];
  id v4 = [v3 idsIdentifier];

  if (v4) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
}

void __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 uuid];
  id v4 = +[HMCContext findHomeWithModelID:v3];

  id v5 = [v4 residents];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_3;
  v11[3] = &unk_264A27630;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v6, v7, v8, v9);
  }
}

void __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 idsIdentifier];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v7 idsIdentifier];
    uint64_t v6 = [v4 objectForKeyedSubscript:v5];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateIdentifiersForAvailableResidentDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
  uint64_t v6 = [v5 backingStore];
  id v7 = [v6 context];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__HMDDefaultResidentDeviceManagerRoarBackingStore_updateIdentifiersForAvailableResidentDevices___block_invoke;
  v10[3] = &unk_264A2F2F8;
  v10[4] = self;
  id v11 = v4;
  id v12 = v7;
  id v8 = v7;
  id v9 = v4;
  [v8 performBlock:v10];
}

void __96__HMDDefaultResidentDeviceManagerRoarBackingStore_updateIdentifiersForAvailableResidentDevices___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 uuid];
  id v4 = +[HMCContext findHomeWithModelID:v3];

  id v5 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(v1 + 40)];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v6 = [v4 residents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v7)
  {

    goto LABEL_24;
  }
  uint64_t v8 = v7;
  __int16 v31 = v4;
  uint64_t v32 = v6;
  int v33 = 0;
  uint64_t v9 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      uint64_t v12 = [v11 device];
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = [v11 idsIdentifier];
        if (v14)
        {
          id v15 = (void *)v14;
          id v16 = [v11 idsDestination];

          if (v16) {
            continue;
          }
        }
        else
        {
        }
        id v17 = _findResidentMatching(v5, v11);
        id v18 = v17;
        if (v17)
        {
          uint64_t v19 = [v17 device];
          if (v19)
          {
            uint64_t v20 = (void *)v19;
            id v21 = v5;
            id v22 = *(void **)(v1 + 32);
            [v18 device];
            v24 = uint64_t v23 = v1;
            LODWORD(v22) = [v22 _shouldUpdateDeviceIdentifiersForResident:v11 fromResidentDevice:v24];

            if (v22)
            {
              id v25 = *(void **)(v23 + 32);
              v26 = [v18 device];
              v33 |= [v25 _addDeviceIdentifiersIfNecessary:v11 fromResidentDevice:v26];
            }
            uint64_t v1 = v23;
            id v5 = v21;
            uint64_t v6 = v32;
          }
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  }
  while (v8);

  id v4 = v31;
  if (v33)
  {
    __int16 v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = *(id *)(v1 + 32);
    int v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Saving on adding identifiers to resident", buf, 0xCu);
    }
    [*(id *)(v1 + 48) save];
  }
LABEL_24:
}

- (BOOL)_addDeviceIdentifiersIfNecessary:(id)a3 fromResidentDevice:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(HMDDefaultResidentDeviceManagerRoarBackingStore *)self _shouldUpdateDeviceIdentifiersForResident:v6 fromResidentDevice:v7])
  {
    uint64_t v8 = [v7 idsIdentifier];
    uint64_t v9 = [v7 remoteDestinationString];
    uint64_t v10 = (void *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v12 = !v11;
    if (!v11)
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = HMFGetLogIdentifier();
        int v18 = 138543618;
        uint64_t v19 = v16;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Setting resident: %@ with device address identifiers", (uint8_t *)&v18, 0x16u);
      }
      [v6 setIdsDestination:v10];
      [v6 setIdsIdentifier:v8];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldUpdateDeviceIdentifiersForResident:(id)a3 fromResidentDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 idsIdentifier];
  uint64_t v8 = [v6 remoteDestinationString];

  if (!v7)
  {
    if (!v8)
    {
      LOBYTE(v9) = 0;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  id v6 = [v5 idsIdentifier];
  if (([v6 isEqual:v7] & 1) == 0)
  {
    LOBYTE(v9) = 1;
    goto LABEL_9;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = [v5 idsDestination];
    int v9 = [v10 isEqual:v8] ^ 1;

    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  LOBYTE(v9) = 0;
LABEL_9:

LABEL_10:
  return v9;
}

- (id)handleCloudResidentChange:(id)a3 currentResidents:(id)a4 isCurrentDevicePrimaryResident:(BOOL)a5 currentDevice:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  id v16 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
  id v17 = v15;
  id v18 = v16;
  if (self
    && (+[HMDCoreData sharedInstance],
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 isRelatedContext:v17],
        v19,
        v18)
    && (v20 & 1) != 0)
  {
    v57 = v12;
    id v21 = [v17 name];
    uint64_t v22 = [v18 uuid];
    uint64_t v23 = HMDWorkingContextNameForHomeUUID(v22);
    int v24 = [v21 isEqualToString:v23];

    if (v24)
    {
      id v25 = (void *)[v11 mutableCopy];
      v52 = [MEMORY[0x263EFF9C0] set];
      v55 = [MEMORY[0x263EFF9C0] set];
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x2020000000;
      char v76 = 0;
      v26 = [v10 userInfo];
      __int16 v27 = [v26 objectForKeyedSubscript:*MEMORY[0x263EFF018]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v28 = v27;
      }
      else {
        id v28 = 0;
      }
      id v54 = v28;

      int v29 = [v10 userInfo];
      v30 = [v29 objectForKeyedSubscript:*MEMORY[0x263EFF180]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v31 = v30;
      }
      else {
        __int16 v31 = 0;
      }
      id v32 = v31;

      v51 = v32;
      int v33 = [v32 setByAddingObjectsFromSet:v54];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke;
      v65[3] = &unk_264A275B8;
      v65[4] = self;
      id v34 = v18;
      id v66 = v34;
      v71 = &v73;
      id v35 = v25;
      id v67 = v35;
      BOOL v72 = a5;
      id v56 = v55;
      id v68 = v56;
      id v53 = v52;
      id v69 = v53;
      id v70 = v57;
      objc_msgSend(v33, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v65);

      long long v36 = [v10 userInfo];
      long long v37 = [v36 objectForKeyedSubscript:*MEMORY[0x263EFEFE8]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
      id v39 = v38;

      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_43;
      v62[3] = &unk_264A275E0;
      v64 = &v73;
      v62[4] = self;
      id v40 = v35;
      id v63 = v40;
      v50 = v39;
      objc_msgSend(v39, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v62);
      id v12 = v57;
      if ([v56 count])
      {
        uint64_t v41 = [v34 backingStore];
        v42 = [v41 context];
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_44;
        v59[3] = &unk_264A2F820;
        id v60 = v56;
        v61 = self;
        [v42 performBlock:v59];
      }
      if (*((unsigned char *)v74 + 24))
      {
        v43 = [v34 backingStore];
        v44 = [v43 context];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_47;
        v58[3] = &unk_264A2F7F8;
        v58[4] = self;
        [v44 performBlock:v58];
      }
      v45 = [HMDBackingStoreResidentUpdateResult alloc];
      v46 = objc_msgSend(v11, "hmf_addedObjectsFromSet:", v40);
      v47 = objc_msgSend(v11, "hmf_removedObjectsFromSet:", v40);
      v48 = [(HMDBackingStoreResidentUpdateResult *)v45 initWithAddedResidentDevices:v46 deletedResidentDevices:v47 reachabilityUpdates:v53];

      _Block_object_dispose(&v73, 8);
    }
    else
    {
      v48 = 0;
      id v12 = v57;
    }
  }
  else
  {

    v48 = 0;
  }

  return v48;
}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v6 = v3;
  id v7 = v4;
  if (v5)
  {
    id v8 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 castIfResident];

    if (v11)
    {
      id v12 = [v11 home];
      id v13 = [v12 modelID];
      uint64_t v14 = [v7 uuid];
      char v15 = [v13 isEqual:v14];

      if (v15)
      {
        id v16 = v11;
      }
      else
      {
        id v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = v5;
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          char v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v81 = v20;
          __int16 v82 = 2112;
          v83 = v11;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Ignoring resident model with invalid home: %@", buf, 0x16u);
        }
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  if (v16)
  {
    id v21 = [v16 modelID];

    if (!v21)
    {
      id v66 = (void *)MEMORY[0x230FBD990]();
      id v67 = *(id *)(a1 + 32);
      id v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
      {
        id v69 = HMFGetLogIdentifier();
        id v70 = [v16 debugDescription];
        *(_DWORD *)buf = 138543618;
        v81 = v69;
        __int16 v82 = 2112;
        v83 = v70;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Model ID is nil for %@", buf, 0x16u);
      }
      v71 = [HMDAssertionLogEvent alloc];
      BOOL v72 = [v16 debugDescription];
      uint64_t v73 = [(HMDAssertionLogEvent *)v71 initWithReason:@"Model ID is nil for %@", v72];

      v74 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v74 submitLogEvent:v73];
    }
    uint64_t v22 = [v16 modelID];
    BOOL v23 = v22 == 0;

    if (!v23)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      int v24 = _findResidentMatching(*(void **)(a1 + 48), v16);
      if (v24)
      {
        id v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = *(id *)(a1 + 32);
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v28 = HMFGetLogIdentifier();
          int v29 = [v16 debugDescription];
          *(_DWORD *)buf = 138543874;
          v81 = v28;
          __int16 v82 = 2112;
          v83 = v29;
          __int16 v84 = 2112;
          v85 = v24;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Found existing resident device for model %@: %@", buf, 0x20u);
        }
        v30 = [v16 reachable];
        int v31 = [v30 BOOLValue];
        int v32 = [v24 isReachable];

        if (v31 != v32)
        {
          if (*(unsigned char *)(a1 + 88))
          {
            int v33 = *(void **)(a1 + 56);
            id v34 = [v16 databaseID];
            [v33 addObject:v34];
          }
          else
          {
            [*(id *)(a1 + 64) addObject:v24];
          }
        }
        v43 = [v16 residentCapabilities];

        if (v43)
        {
          v44 = [v16 residentCapabilities];
          [v24 _updateRawCapabilities:v44];
        }
        v45 = [v16 idsIdentifier];
        if (v45)
        {
          v46 = [v16 idsDestination];
          BOOL v47 = v46 == 0;

          if (!v47)
          {
            v48 = [HMDDeviceAddress alloc];
            v49 = [v16 idsIdentifier];
            v50 = [v16 idsDestination];
            v51 = [(HMDDeviceAddress *)v48 initWithIDSIdentifier:v49 idsDestination:v50];

            [v24 _updateMessageAddress:v51];
          }
        }
        v52 = [v16 deviceIRKData];

        if (v52)
        {
          id v53 = [v16 deviceIRKData];
          [v24 updateDeviceIRKData:v53];
        }
      }
      else
      {
        int v24 = -[HMDDefaultResidentDeviceManagerRoarBackingStore _residentDeviceFromModel:currentDevice:](*(void **)(a1 + 32), v16, *(void **)(a1 + 72));
        id v35 = (void *)MEMORY[0x230FBD990]();
        id v36 = *(id *)(a1 + 32);
        long long v37 = HMFGetOSLogHandle();
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v38)
          {
            id v39 = HMFGetLogIdentifier();
            id v40 = [v16 debugDescription];
            *(_DWORD *)buf = 138543874;
            v81 = v39;
            __int16 v82 = 2112;
            v83 = v40;
            __int16 v84 = 2112;
            v85 = v24;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Created new resident device for model %@: %@", buf, 0x20u);
          }
          [*(id *)(a1 + 48) addObject:v24];
        }
        else
        {
          if (v38)
          {
            uint64_t v41 = HMFGetLogIdentifier();
            v42 = [v16 debugDescription];
            *(_DWORD *)buf = 138543618;
            v81 = v41;
            __int16 v82 = 2112;
            v83 = v42;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@No resident device is created for model: %@", buf, 0x16u);
          }
          int v24 = 0;
        }
      }
      if (*(unsigned char *)(a1 + 88))
      {
        id v54 = *(void **)(a1 + 32);
        v55 = [v24 device];
        LODWORD(v54) = [v54 _shouldUpdateDeviceIdentifiersForResident:v16 fromResidentDevice:v55];

        if (v54)
        {
          id v56 = [*(id *)(a1 + 32) home];
          v57 = [v56 backingStore];
          v58 = [v57 context];

          v59 = [v16 databaseID];
          v75[0] = MEMORY[0x263EF8330];
          v75[1] = 3221225472;
          v75[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_41;
          v75[3] = &unk_264A2E610;
          uint64_t v60 = *(void *)(a1 + 32);
          id v76 = v59;
          uint64_t v77 = v60;
          id v78 = v24;
          id v79 = v58;
          id v61 = v58;
          id v62 = v59;
          [v61 performBlock:v75];
        }
      }
      id v63 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
      os_unfair_lock_lock_with_options();
      v64 = [*(id *)(a1 + 32) residentDeviceByObjectID];
      v65 = [v16 modelID];
      [v64 setObject:v24 forKey:v65];

      os_unfair_lock_unlock(v63);
    }
  }
}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 castIfResident];

  if (v6)
  {
    id v7 = [v6 modelID];

    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      id v8 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
      os_unfair_lock_lock_with_options();
      int v9 = [*(id *)(a1 + 32) residentDeviceByObjectID];
      id v10 = [v6 modelID];
      id v11 = [v9 objectForKey:v10];

      id v12 = [*(id *)(a1 + 32) residentDeviceByObjectID];
      id v13 = [v6 modelID];
      [v12 removeObjectForKey:v13];

      os_unfair_lock_unlock(v8);
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        id v18 = [v6 modelID];
        int v23 = 138543874;
        int v24 = v17;
        __int16 v25 = 2112;
        id v26 = v18;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Matched resident removal for modelID: %@ to pending removal for device: %@", (uint8_t *)&v23, 0x20u);
      }
      if (v11)
      {
        [*(id *)(a1 + 40) removeObject:v11];
      }
      else
      {
        uint64_t v19 = (void *)MEMORY[0x230FBD990]();
        id v20 = *(id *)(a1 + 32);
        id v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = HMFGetLogIdentifier();
          int v23 = 138543618;
          int v24 = v22;
          __int16 v25 = 2112;
          id v26 = v6;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Notified of deleted resident with no matching HMDResidentDevice: %@", (uint8_t *)&v23, 0x16u);
        }
      }
    }
  }
}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_44(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_2;
  v3[3] = &unk_264A27608;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  objc_msgSend(v1, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  id v2 = +[HMCContext currentContext];
  [v2 save];
}

uint64_t __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_47(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHasAnyResident];
}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[HMCContext findResidentWithDatabaseID:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = NSNumber;
    id v7 = [v4 reachable];
    id v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "BOOLValue") ^ 1);
    [v5 setReachable:v8];

    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v5 reachable];
      int v14 = 138543874;
      id v15 = v12;
      __int16 v16 = 1024;
      int v17 = [v13 intValue];
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating reachability to '%d' for HMDResidentDevice: %@", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (HMDResidentDevice)_residentDeviceFromModel:(void *)a3 currentDevice:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 _deviceFromModel:v5 currentDevice:v6];
    if (v7)
    {
      id v8 = [v5 appleMediaAccessory];

      int v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = a1;
      id v11 = HMFGetOSLogHandle();
      id v12 = v11;
      if (v8)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v13 = HMFGetLogIdentifier();
          int v29 = 138543618;
          v30 = v13;
          __int16 v31 = 2112;
          id v32 = v7;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Create resident device using %@", (uint8_t *)&v29, 0x16u);
        }
        int v14 = [HMDResidentDevice alloc];
        id v15 = [v10 home];
        __int16 v16 = [v5 name];
        int v17 = [v5 residentCapabilities];
        __int16 v18 = [v7 deviceAddress];
        uint64_t v19 = [v5 deviceIRKData];
        uint64_t v20 = [(HMDResidentDevice *)v14 initWithDevice:v7 home:v15 name:v16 rawCapabilities:v17 messageAddress:v18 deviceIRKData:v19];

        id v21 = [v5 reachable];
        -[HMDResidentDevice setReachable:](v20, "setReachable:", [v21 BOOLValue]);

        goto LABEL_14;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = HMFGetLogIdentifier();
        int v29 = 138543618;
        v30 = v27;
        __int16 v31 = 2112;
        id v32 = v5;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Skip creating resident. Model does not have a valid accessory: %@", (uint8_t *)&v29, 0x16u);
      }
      id v26 = v9;
    }
    else
    {
      uint64_t v22 = MEMORY[0x230FBD990]();
      id v23 = a1;
      int v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        __int16 v25 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@No device found for this model", (uint8_t *)&v29, 0xCu);
      }
      id v26 = (void *)v22;
    }
    uint64_t v20 = 0;
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v20 = 0;
LABEL_15:

  return v20;
}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_41(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = +[HMCContext findResidentWithDatabaseID:*(void *)(a1 + 32)];
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) device];
    LODWORD(v3) = [v3 _addDeviceIdentifiersIfNecessary:v2 fromResidentDevice:v4];

    if (v3)
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 40);
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = HMFGetLogIdentifier();
        int v9 = [v2 modelID];
        int v15 = 138543618;
        __int16 v16 = v8;
        __int16 v17 = 2112;
        __int16 v18 = v9;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Saving resident: %@ with added device address identifiers", (uint8_t *)&v15, 0x16u);
      }
      [*(id *)(a1 + 56) save];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = *(void **)(a1 + 32);
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      __int16 v18 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not find resident %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (BOOL)residentModel:(id)a3 isTheSameAs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 modelID];
  id v8 = [v6 modelID];
  if ([v7 isEqual:v8])
  {
    char v9 = 1;
  }
  else
  {
    id v10 = [v5 idsIdentifier];
    id v11 = [v6 idsIdentifier];
    char v9 = [v10 isEqual:v11];
  }
  return v9;
}

- (id)pruneDuplicateResidentModelsFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] arrayWithArray:v4];
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [MEMORY[0x263EFF980] array];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke;
  v22[3] = &unk_264A27568;
  v22[4] = self;
  [v5 sortUsingComparator:v22];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__213397;
  v20[4] = __Block_byref_object_dispose__213398;
  id v21 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke_31;
  v16[3] = &unk_264A27590;
  v16[4] = self;
  uint64_t v19 = v20;
  id v8 = v7;
  id v17 = v8;
  id v9 = v6;
  id v18 = v9;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);
  if ([v8 count])
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    HMFGetOSLogHandle();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v24 = v13;
      __int16 v25 = 2114;
      id v26 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Duplicate MKFResident models are present in the working store: %{public}@.", buf, 0x16u);
    }
  }
  int v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];

  _Block_object_dispose(v20, 8);
  return v14;
}

uint64_t __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) residentModel:v5 isTheSameAs:v6])
  {
    uint64_t v7 = [v5 appleMediaAccessory];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [v6 appleMediaAccessory];

      if (!v9)
      {
        uint64_t v14 = -1;
        goto LABEL_9;
      }
    }
    id v10 = [v5 appleMediaAccessory];
    if (v10)
    {
    }
    else
    {
      __int16 v16 = [v6 appleMediaAccessory];

      if (v16)
      {
        uint64_t v14 = 1;
        goto LABEL_9;
      }
    }
    id v11 = [v5 modelID];
    uint64_t v12 = [v6 modelID];
  }
  else
  {
    id v11 = [v5 idsIdentifier];
    uint64_t v12 = [v6 idsIdentifier];
  }
  id v13 = (void *)v12;
  uint64_t v14 = [v11 compare:v12];

LABEL_9:
  return v14;
}

void __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v7 = a2;
  int v5 = [v3 residentModel:v7 isTheSameAs:v4];
  uint64_t v6 = 48;
  if (v5) {
    uint64_t v6 = 40;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

- (id)findResidents:(id)a3 outHasResidents:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
  id v9 = [v8 backingStore];

  id v10 = [v9 context];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke;
  id v18 = &unk_264A2AA20;
  uint64_t v19 = self;
  id v20 = v6;
  id v21 = v7;
  uint64_t v22 = a4;
  id v11 = v7;
  id v12 = v6;
  [v10 unsafeSynchronousBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18, v19);
  return v13;
}

void __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 uuid];
  uint64_t v4 = +[HMCContext findHomeWithModelID:v3];

  int v5 = *(void **)(a1 + 32);
  id v6 = [v4 residents];
  id v7 = [v5 pruneDuplicateResidentModelsFrom:v6];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke_2;
  v15[3] = &unk_264A27540;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 56);
  v15[4] = v8;
  id v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v10 = (void *)MEMORY[0x230FBD990](objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15));
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    id v20 = v13;
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    __int16 v23 = 2114;
    int v24 = v7;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Created resident devices: %{public}@ from models: %{public}@.", buf, 0x20u);
  }
}

void __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned char **)(a1 + 56);
  if (v4) {
    *uint64_t v4 = 1;
  }
  id v12 = v3;
  int v5 = -[HMDDefaultResidentDeviceManagerRoarBackingStore _residentDeviceFromModel:currentDevice:](*(void **)(a1 + 32), v3, *(void **)(a1 + 40));
  if (v5)
  {
    [*(id *)(a1 + 48) addObject:v5];
    id v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    id v7 = [*(id *)(a1 + 32) residentDeviceByObjectID];
    uint64_t v8 = [v12 modelID];
    id v9 = [v7 objectForKey:v8];

    if (!v9)
    {
      id v10 = [*(id *)(a1 + 32) residentDeviceByObjectID];
      id v11 = [v12 modelID];
      [v10 setObject:v5 forKey:v11];
    }
    os_unfair_lock_unlock(v6);
  }
}

- (void)_updateHasAnyResident
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self home];
  uint64_t v4 = [v3 uuid];

  if (v4)
  {
    int v5 = +[HMCContext findHomeWithModelID:v4];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = objc_msgSend(v5, "residents", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v13 = [v12 appleMediaAccessory];
          if (v13)
          {
            uint64_t v14 = [v12 idsIdentifier];
            BOOL v15 = v14 != 0;
          }
          else
          {
            BOOL v15 = 0;
          }

          v9 |= v15;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
    }

    if ((v9 & 1) != [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self hasAnyResident])
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        id v20 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        id v26 = v19;
        __int16 v27 = 2112;
        id v28 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating hasAnyResident to %@", buf, 0x16u);
      }
      [(HMDDefaultResidentDeviceManagerRoarBackingStore *)v17 setHasAnyResident:v9 & 1];
    }
  }
}

- (void)setHasAnyResident:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAnyResident = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasAnyResident
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAnyResident;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_deviceFromModel:(id)a3 currentDevice:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7 && _isMKFResidentCurrentDevice(v6))
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    char v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Using current device: %@", (uint8_t *)&v19, 0x16u);
    }
    logger = v9->_logger;
    if (os_signpost_enabled(logger))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH2CurrentDeviceResidentDeviceCreated", "", (uint8_t *)&v19, 2u);
    }
    id v13 = v7;
  }
  else
  {
    id v13 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self _deviceFromModel:v6];
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    BOOL v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543874;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Using device: %@ from account for model: %@", (uint8_t *)&v19, 0x20u);
    }
  }

  return v13;
}

- (id)_deviceFromModel:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self appleAccountManager];
  id v6 = [v4 idsIdentifier];
  id v7 = [v4 idsDestination];
  uint64_t v8 = +[HMDDeviceAddress addressWithIDSIdentifier:v6 idsDestination:v7];

  if (v8
    && ([v5 accountRegistry],
        char v9 = objc_claimAutoreleasedReturnValue(),
        [v9 deviceForAddress:v8],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    id v11 = v10;
  }
  else
  {
    id v12 = [v5 account];
    id v13 = [v4 idsIdentifier];

    if (v13)
    {
      uint64_t v14 = [v4 idsIdentifier];
      BOOL v15 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self _deviceWithIdsIdentifier:v14 fromAccount:v12];

      if (v15) {
        goto LABEL_8;
      }
    }
    id v16 = [v4 idsDestination];

    if (!v16) {
      goto LABEL_9;
    }
    id v17 = [v4 idsDestination];
    BOOL v15 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)self _deviceWithIdsDestination:v17 fromAccount:v12];

    if (v15)
    {
LABEL_8:
      id v11 = v15;
    }
    else
    {
LABEL_9:
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      int v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = HMFGetLogIdentifier();
        int v23 = 138543874;
        id v24 = v21;
        __int16 v25 = 2112;
        id v26 = v4;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the device for model: %@ from account: %@", (uint8_t *)&v23, 0x20u);
      }
      id v11 = 0;
    }
  }
  return v11;
}

- (id)_deviceWithIdsDestination:(id)a3 fromAccount:(id)a4
{
  id v5 = a4;
  id v6 = +[HMDDeviceHandle deviceHandleForDestination:a3];
  if (v6)
  {
    id v7 = [v5 deviceForHandle:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_deviceWithIdsIdentifier:(id)a3 fromAccount:(id)a4
{
  id v5 = a4;
  id v6 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:a3];
  if (v6)
  {
    id v7 = [v5 deviceForHandle:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)cloudChangeUpdateNotificationName
{
  return (NSString *)(id)*MEMORY[0x263EFF040];
}

- (HMDDefaultResidentDeviceManagerRoarBackingStore)initWithHome:(id)a3 appleAccountManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMDDefaultResidentDeviceManagerRoarBackingStore;
  uint64_t v8 = [(HMDDefaultResidentDeviceManagerRoarBackingStore *)&v24 init];
  if (v8)
  {
    uint64_t v9 = HMFGetOSLogHandle();
    logger = v8->_logger;
    v8->_logger = (OS_os_log *)v9;

    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeWeak((id *)&v8->_appleAccountManager, v7);
    uint64_t v11 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    residentDeviceByObjectID = v8->_residentDeviceByObjectID;
    v8->_residentDeviceByObjectID = (NSMapTable *)v11;

    id v13 = [v6 uuid];
    uint64_t v14 = [v13 UUIDString];
    logIdentifier = v8->_logIdentifier;
    v8->_logIdentifier = (NSString *)v14;

    id v16 = [v6 backingStore];
    id v17 = [v16 context];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __84__HMDDefaultResidentDeviceManagerRoarBackingStore_initWithHome_appleAccountManager___block_invoke;
    v22[3] = &unk_264A2F7F8;
    uint64_t v18 = v8;
    int v23 = v18;
    [v17 unsafeSynchronousBlock:v22];

    residentSelectionInfoToWrite = v18->_residentSelectionInfoToWrite;
    v18->_residentSelectionInfoToWrite = 0;

    v18->_allowedToWriteResidentSelectionInfo = 0;
    id residentSelectionInfoWriteCompletion = v18->_residentSelectionInfoWriteCompletion;
    v18->_id residentSelectionInfoWriteCompletion = 0;
  }
  return v8;
}

uint64_t __84__HMDDefaultResidentDeviceManagerRoarBackingStore_initWithHome_appleAccountManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHasAnyResident];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t49_213455 != -1) {
    dispatch_once(&logCategory__hmf_once_t49_213455, &__block_literal_global_59_213456);
  }
  id v2 = (void *)logCategory__hmf_once_v50_213457;
  return v2;
}

void __62__HMDDefaultResidentDeviceManagerRoarBackingStore_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v50_213457;
  logCategory__hmf_once_v50_213457 = v0;
}

@end