@interface HMDPhotoLibraryPersonImporter
+ (id)logCategory;
- (BOOL)isThisDesignatedFMFDevice;
- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver;
- (HMDFMFHandlerProtocol)fmfHandler;
- (HMDPersonDataSource)dataSource;
- (HMDPhotoLibrary)photoLibrary;
- (HMDPhotoLibraryObserver)photoLibraryObserver;
- (HMDPhotoLibraryPersonImporter)initWithUUID:(id)a3;
- (HMDPhotoLibraryPersonImporter)initWithUUID:(id)a3 fmfHandler:(id)a4 photoLibrary:(id)a5 workQueue:(id)a6 cloudPhotosSettingObserver:(id)a7 logEventSubmitter:(id)a8;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (id)_updatePersonsUsingBatchChange:(id)a3;
- (id)logIdentifier;
- (id)photoLibraryObserverFactory;
- (void)_configure;
- (void)_handleFMFDeviceChanged;
- (void)_handleUpdatedCloudPhotosSetting;
- (void)_reconfigure;
- (void)_registerForNotifications;
- (void)_submitLogEventForFaceCrops:(id)a3;
- (void)_submitLogEventsForUpdatedPersonsWithCurrentPersons:(id)a3 previousPersons:(id)a4;
- (void)_unconfigure;
- (void)_updateFaceCropsForAllPersonsUsingCurrentPersons:(id)a3 batchChange:(id)a4;
- (void)_updateFaceCropsForPersons:(id)a3 usingBatchChange:(id)a4;
- (void)_updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons:(id)a3 batchChange:(id)a4;
- (void)_updateFaceCropsWithCurrentPhotoLibraryFaceCrops:(id)a3 forPersonWithUUID:(id)a4 usingBatchChange:(id)a5;
- (void)_updatePersonsAndFaceCrops:(BOOL)a3;
- (void)configureWithDataSource:(id)a3 home:(id)a4;
- (void)handleCloudPhotosEnabledDidChangeNotification:(id)a3;
- (void)handleFMFDeviceChangedNotification:(id)a3;
- (void)observerDidObserveMajorChange:(id)a3;
- (void)observerDidObserveMinorChange:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPhotoLibraryObserver:(id)a3;
- (void)setPhotoLibraryObserverFactory:(id)a3;
@end

@implementation HMDPhotoLibraryPersonImporter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_photoLibraryObserverFactory, 0);
  objc_storeStrong((id *)&self->_photoLibraryObserver, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_cloudPhotosSettingObserver, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_fmfHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setPhotoLibraryObserverFactory:(id)a3
{
}

- (id)photoLibraryObserverFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPhotoLibraryObserver:(id)a3
{
}

- (HMDPhotoLibraryObserver)photoLibraryObserver
{
  return (HMDPhotoLibraryObserver *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPersonDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPersonDataSource *)WeakRetained;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver
{
  return (HMDCloudPhotosSettingObserver *)objc_getProperty(self, a2, 40, 1);
}

- (HMDPhotoLibrary)photoLibrary
{
  return (HMDPhotoLibrary *)objc_getProperty(self, a2, 32, 1);
}

- (HMDFMFHandlerProtocol)fmfHandler
{
  return (HMDFMFHandlerProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDPhotoLibraryPersonImporter *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)observerDidObserveMajorChange:(id)a3
{
  v4 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDPhotoLibraryPersonImporter *)self _updatePersonsAndFaceCrops:1];
}

- (void)observerDidObserveMinorChange:(id)a3
{
  v4 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDPhotoLibraryPersonImporter *)self _updatePersonsAndFaceCrops:0];
}

- (void)handleFMFDeviceChangedNotification:(id)a3
{
  v4 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDPhotoLibraryPersonImporter_handleFMFDeviceChangedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __68__HMDPhotoLibraryPersonImporter_handleFMFDeviceChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFMFDeviceChanged];
}

- (void)handleCloudPhotosEnabledDidChangeNotification:(id)a3
{
  v4 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HMDPhotoLibraryPersonImporter_handleCloudPhotosEnabledDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDPhotoLibraryPersonImporter_handleCloudPhotosEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUpdatedCloudPhotosSetting];
}

- (BOOL)isThisDesignatedFMFDevice
{
  v2 = [(HMDPhotoLibraryPersonImporter *)self fmfHandler];
  char v3 = [v2 isThisDesignatedFMFDevice];

  return v3;
}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  id v5 = a3;
  v6 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__HMDPhotoLibraryPersonImporter_configureWithDataSource_home___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __62__HMDPhotoLibraryPersonImporter_configureWithDataSource_home___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _registerForNotifications];
  v2 = [*(id *)(a1 + 32) cloudPhotosSettingObserver];
  char v3 = [v2 isCloudPhotosEnabled];

  if ((v3 & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v8;
      id v9 = "%{public}@Not configuring photo library person importer because cloud photos is disabled";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
    }
LABEL_11:

    return;
  }
  if (([*(id *)(a1 + 32) isThisDesignatedFMFDevice] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v8;
      id v9 = "%{public}@Not configuring photo library person importer because this device is not the designated FMF device";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v4 = *(void **)(a1 + 32);
  [v4 _configure];
}

- (void)_reconfigure
{
  char v3 = [(HMDPhotoLibraryPersonImporter *)self cloudPhotosSettingObserver];
  int v4 = [v3 isCloudPhotosEnabled];

  if (v4 && [(HMDPhotoLibraryPersonImporter *)self isThisDesignatedFMFDevice])
  {
    [(HMDPhotoLibraryPersonImporter *)self _configure];
  }
  else
  {
    [(HMDPhotoLibraryPersonImporter *)self _unconfigure];
  }
}

- (void)_handleFMFDeviceChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    [(HMDPhotoLibraryPersonImporter *)v5 isThisDesignatedFMFDevice];
    v8 = HMFBooleanToString();
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@FMF device changed, isThisDesignatedFMFDevice: %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMDPhotoLibraryPersonImporter *)v5 _reconfigure];
}

- (void)_handleUpdatedCloudPhotosSetting
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(HMDPhotoLibraryPersonImporter *)self cloudPhotosSettingObserver];
  [v4 isCloudPhotosEnabled];

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = HMFBooleanToString();
    int v10 = 138543618;
    __int16 v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Cloud photos enabled changed to %@", (uint8_t *)&v10, 0x16u);
  }
  [(HMDPhotoLibraryPersonImporter *)v6 _reconfigure];
}

- (void)_unconfigure
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring photo library person importer", (uint8_t *)&v9, 0xCu);
  }
  v8 = [(HMDPhotoLibraryPersonImporter *)v5 photoLibraryObserver];
  [v8 invalidate];

  [(HMDPhotoLibraryPersonImporter *)v5 setPhotoLibraryObserver:0];
}

- (void)_configure
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v12 = 138543362;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Configuring photo library person importer", (uint8_t *)&v12, 0xCu);
  }
  v8 = [(HMDPhotoLibraryPersonImporter *)v5 photoLibraryObserverFactory];
  int v9 = v8[2]();
  [(HMDPhotoLibraryPersonImporter *)v5 setPhotoLibraryObserver:v9];

  int v10 = [(HMDPhotoLibraryPersonImporter *)v5 photoLibraryObserver];
  [v10 setDelegate:v5];

  uint64_t v11 = [(HMDPhotoLibraryPersonImporter *)v5 photoLibraryObserver];
  [v11 configure];

  [(HMDPhotoLibraryPersonImporter *)v5 _updatePersonsAndFaceCrops:1];
}

- (void)_registerForNotifications
{
  char v3 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = [(HMDPhotoLibraryPersonImporter *)self cloudPhotosSettingObserver];
  [v4 addObserver:self selector:sel_handleCloudPhotosEnabledDidChangeNotification_ name:@"HMDCloudPhotoSettingChangedNotification" object:v5];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = [(HMDPhotoLibraryPersonImporter *)self fmfHandler];
  [v7 addObserver:self selector:sel_handleFMFDeviceChangedNotification_ name:@"HMDFMFStatusUpdateNotification" object:v6];
}

- (void)_submitLogEventForFaceCrops:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v9 = [(HMDPhotoLibraryPersonImporter *)self logEventSubmitter];
  id v6 = [HMDPhotoLibraryImportingFaceCropsImportedLogEvent alloc];
  id v7 = [v4 allKeys];

  v8 = -[HMDPhotoLibraryImportingFaceCropsImportedLogEvent initWithNumberOfImportedFaceCrops:](v6, "initWithNumberOfImportedFaceCrops:", [v7 count]);
  [v9 submitLogEvent:v8];
}

- (void)_submitLogEventsForUpdatedPersonsWithCurrentPersons:(id)a3 previousPersons:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_msgSend(v6, "na_map:", &__block_literal_global_121);
  uint64_t v10 = [v9 count];

  uint64_t v11 = [(HMDPhotoLibraryPersonImporter *)self logEventSubmitter];
  int v12 = -[HMDPhotoLibraryImportingPersonsImportedLogEvent initWithTotalNumberOfImportedPersons:numberOfNamedImportedPersons:]([HMDPhotoLibraryImportingPersonsImportedLogEvent alloc], "initWithTotalNumberOfImportedPersons:numberOfNamedImportedPersons:", [v6 count], v10);
  [v11 submitLogEvent:v12];

  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v20 = [v19 UUID];
        [v13 setObject:v19 forKeyedSubscript:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __101__HMDPhotoLibraryPersonImporter__submitLogEventsForUpdatedPersonsWithCurrentPersons_previousPersons___block_invoke_2;
  v26[3] = &unk_1E6A0E7C8;
  id v27 = v13;
  id v21 = v13;
  v22 = objc_msgSend(v6, "na_filter:", v26);
  uint64_t v23 = [v22 count];

  v24 = [(HMDPhotoLibraryPersonImporter *)self logEventSubmitter];
  v25 = [[HMDPhotoLibraryImportingPhotoLibraryRenamedPersonsLogEvent alloc] initWithNumberOfRenamedPersons:v23];
  [v24 submitLogEvent:v25];
}

uint64_t __101__HMDPhotoLibraryPersonImporter__submitLogEventsForUpdatedPersonsWithCurrentPersons_previousPersons___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 UUID];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v6 name];
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    id v9 = [v3 UUID];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    uint64_t v11 = [v10 name];
    int v12 = [v3 name];
    uint64_t v13 = [v11 isEqualToString:v12] ^ 1;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __101__HMDPhotoLibraryPersonImporter__submitLogEventsForUpdatedPersonsWithCurrentPersons_previousPersons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (void)_updateFaceCropsWithCurrentPhotoLibraryFaceCrops:(id)a3 forPersonWithUUID:(id)a4 usingBatchChange:(id)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v63 = a5;
  uint64_t v10 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v62 = v8;
  uint64_t v11 = (void *)MEMORY[0x1D9452090]([(HMDPhotoLibraryPersonImporter *)self _submitLogEventForFaceCrops:v8]);
  int v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v76 = v14;
    __int16 v77 = 2112;
    id v78 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for person with uuid: %@", buf, 0x16u);
  }
  uint64_t v15 = [(HMDPhotoLibraryPersonImporter *)v12 dataSource];
  uint64_t v16 = [v15 faceCropUUIDsForPersonWithUUID:v9];

  uint64_t v17 = (void *)MEMORY[0x1D9452090]();
  v18 = v12;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v62 count];
    uint64_t v22 = [v16 count];
    *(_DWORD *)buf = 138544130;
    v76 = v20;
    __int16 v77 = 2112;
    id v78 = v9;
    __int16 v79 = 2048;
    uint64_t v80 = v21;
    __int16 v81 = 2048;
    uint64_t v82 = v22;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Person with uuid: %@ has %lu current photos face crops, and %lu previous face crops in homekit", buf, 0x2Au);
  }
  v64 = v9;

  uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
  v24 = [v62 allKeys];
  v25 = [v23 setWithArray:v24];

  v26 = objc_msgSend(v25, "na_setByRemovingObjectsFromSet:", v16);
  v57 = v25;
  v58 = v16;
  v56 = objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v25);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v26;
  uint64_t v27 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    id v60 = *(id *)v70;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(id *)v70 != v60) {
          objc_enumerationMutation(obj);
        }
        long long v30 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        long long v31 = (void *)MEMORY[0x1D9452090]();
        v32 = [(HMDPhotoLibraryPersonImporter *)v18 photoLibrary];
        uint64_t v33 = [v62 objectForKeyedSubscript:v30];
        v34 = [v32 faceCropFromFaceCropData:v33];

        if (v34)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F2E990]);
          v36 = [v34 dataRepresentation];
          v37 = [MEMORY[0x1E4F1C9C8] date];
          [v34 faceBoundingBox];
          v38 = objc_msgSend(v35, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v30, v36, v37, v64);

          v39 = (void *)MEMORY[0x1D9452090]([v38 setSource:1]);
          v40 = v18;
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v76 = v42;
            __int16 v77 = 2112;
            id v78 = v64;
            __int16 v79 = 2112;
            uint64_t v80 = (uint64_t)v38;
            _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Adding new face crop for person with uuid %@: %@", buf, 0x20u);
          }
          [v63 addOrUpdateFaceCrop:v38];
        }
        else
        {
          v43 = (void *)MEMORY[0x1D9452090]();
          v44 = v18;
          v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v76 = v46;
            __int16 v77 = 2112;
            id v78 = v30;
            __int16 v79 = 2112;
            uint64_t v80 = (uint64_t)v64;
            _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Did not receive a valid face crop from HomeAI for photos face crop with uuid: %@ for person with uuid: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v28);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v61 = v56;
  uint64_t v47 = [v61 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v66 != v49) {
          objc_enumerationMutation(v61);
        }
        v51 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        v52 = (void *)MEMORY[0x1D9452090]();
        v53 = v18;
        v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v76 = v55;
          __int16 v77 = 2112;
          id v78 = v64;
          __int16 v79 = 2112;
          uint64_t v80 = (uint64_t)v51;
          _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@Removing old face crop for person with uuid %@: %@", buf, 0x20u);
        }
        [v63 removeFaceCropWithUUID:v51];
      }
      uint64_t v48 = [v61 countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v48);
  }
}

- (void)_updateFaceCropsForPersons:(id)a3 usingBatchChange:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  id v7 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v11;
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for persons: %@", buf, 0x16u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      uint64_t v27 = v13;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
        uint64_t v17 = (void *)MEMORY[0x1D9452090]();
        v18 = [(HMDPhotoLibraryPersonImporter *)v9 photoLibrary];
        v19 = [v16 externalPersonUUID];
        v20 = [v18 fetchFaceCropDataByUUIDForPersonUUID:v19];

        if (v20)
        {
          uint64_t v21 = [v16 UUID];
          [(HMDPhotoLibraryPersonImporter *)v9 _updateFaceCropsWithCurrentPhotoLibraryFaceCrops:v20 forPersonWithUUID:v21 usingBatchChange:v29];
        }
        else
        {
          uint64_t v22 = v14;
          uint64_t v23 = (void *)MEMORY[0x1D9452090]();
          v24 = v9;
          v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v36 = v26;
            __int16 v37 = 2112;
            id v38 = v16;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Photo library query returned nil when querying face crops for person %@, so not modifying their face crops.", buf, 0x16u);
          }
          uint64_t v14 = v22;
          uint64_t v13 = v27;
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }
}

- (void)_updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons:(id)a3 batchChange:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for persons with updated Photos face crops", buf, 0xCu);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__HMDPhotoLibraryPersonImporter__updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons_batchChange___block_invoke;
  v14[3] = &unk_1E6A0E780;
  v14[4] = v10;
  uint64_t v13 = objc_msgSend(v6, "na_filter:", v14);
  [(HMDPhotoLibraryPersonImporter *)v10 _updateFaceCropsForPersons:v13 usingBatchChange:v7];
}

BOOL __117__HMDPhotoLibraryPersonImporter__updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons_batchChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v3 UUID];
  id v6 = [v4 faceCropUUIDsForPersonWithUUID:v5];
  unint64_t v7 = [v6 count];

  id v8 = [*(id *)(a1 + 32) photoLibrary];
  id v9 = [v3 externalPersonUUID];
  uint64_t v10 = [v8 numberOfFaceCropsForPersonWithUUID:v9];

  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v18 = 138544130;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v3;
    __int16 v22 = 2048;
    unint64_t v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v10;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Person: %@ has %lu face crops in homekit, and there are %lu face crops in photos", (uint8_t *)&v18, 0x2Au);
  }
  BOOL v16 = v7 < 0x14 && v7 != v10;

  return v16;
}

- (void)_updateFaceCropsForAllPersonsUsingCurrentPersons:(id)a3 batchChange:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating face crops for all photos persons", (uint8_t *)&v13, 0xCu);
  }
  [(HMDPhotoLibraryPersonImporter *)v10 _updateFaceCropsForPersons:v6 usingBatchChange:v7];
}

- (id)_updatePersonsUsingBatchChange:(id)a3
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v4 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v103 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating persons from photos", buf, 0xCu);
  }
  id v9 = [(HMDPhotoLibraryPersonImporter *)v6 photoLibrary];
  [v9 fetchPersons];

  uint64_t v10 = [(HMDPhotoLibraryPersonImporter *)v6 photoLibrary];
  uint64_t v11 = [v10 persons];

  id v12 = (void *)MEMORY[0x1D9452090]();
  int v13 = v6;
  uint64_t v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      BOOL v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v103 = v16;
      __int16 v104 = 2112;
      v105 = v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Current Photo Library persons: %@", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    int v18 = [MEMORY[0x1E4F1CA80] set];
    v19 = [MEMORY[0x1E4F1CA80] set];
    __int16 v20 = [(HMDPhotoLibraryPersonImporter *)v13 dataSource];
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __64__HMDPhotoLibraryPersonImporter__updatePersonsUsingBatchChange___block_invoke;
    v94[3] = &unk_1E6A0E738;
    id v21 = v19;
    id v95 = v21;
    id v22 = v17;
    id v96 = v22;
    v97 = v13;
    id v72 = v18;
    id v98 = v72;
    [v20 enumeratePersonsUsingBlock:v94];

    unint64_t v23 = (void *)MEMORY[0x1D9452090]();
    __int16 v24 = v13;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      uint64_t v27 = [v22 allValues];
      *(_DWORD *)buf = 138543618;
      v103 = v26;
      __int16 v104 = 2112;
      v105 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Previous HomeKit persons: %@", buf, 0x16u);
    }
    uint64_t v80 = v24;
    [(HMDPhotoLibraryPersonImporter *)v24 _submitLogEventsForUpdatedPersonsWithCurrentPersons:v11 previousPersons:v21];
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count"));
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v74 = v11;
    obuint64_t j = v11;
    uint64_t v29 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
    v75 = v22;
    __int16 v77 = v28;
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v91 != v31) {
            objc_enumerationMutation(obj);
          }
          long long v33 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          v34 = [v33 UUID];
          id v35 = [v22 objectForKeyedSubscript:v34];

          if ([v21 containsObject:v33])
          {
            v36 = (void *)[v35 mutableCopy];
            __int16 v37 = [v33 UUID];
            [v36 setExternalPersonUUID:v37];

            [v28 addObject:v36];
            goto LABEL_22;
          }
          if (v35)
          {
            v36 = (void *)[v35 mutableCopy];
            [v33 updateHMPerson:v36];
            id v38 = (void *)MEMORY[0x1D9452090]([v28 addObject:v36]);
            uint64_t v39 = v80;
            v40 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v41 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v103 = v41;
              __int16 v104 = 2112;
              v105 = v36;
              v42 = v40;
              v43 = "%{public}@Updating person: %@";
LABEL_20:
              _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, v43, buf, 0x16u);

              id v22 = v75;
            }
          }
          else
          {
            v36 = [v33 createHMPerson];
            id v38 = (void *)MEMORY[0x1D9452090]([v28 addObject:v36]);
            uint64_t v39 = v80;
            v40 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v41 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v103 = v41;
              __int16 v104 = 2112;
              v105 = v36;
              v42 = v40;
              v43 = "%{public}@Adding person: %@";
              goto LABEL_20;
            }
          }

          [v81 addOrUpdatePerson:v36];
          uint64_t v28 = v77;
LABEL_22:
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
      }
      while (v30);
    }
    v73 = v21;

    v44 = objc_msgSend(obj, "na_map:", &__block_literal_global_94495);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obja = [v22 allValues];
    uint64_t v45 = [obja countByEnumeratingWithState:&v86 objects:v100 count:16];
    v76 = v44;
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v87 != v47) {
            objc_enumerationMutation(obja);
          }
          uint64_t v49 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          v50 = [[HMDPhotoLibraryPerson alloc] initWithHMPerson:v49];
          v51 = [(HMDPhotoLibraryPerson *)v50 UUID];
          char v52 = [v44 containsObject:v51];

          if ((v52 & 1) == 0)
          {
            v53 = (void *)MEMORY[0x1D9452090]();
            v54 = v80;
            v55 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              v56 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v103 = v56;
              __int16 v104 = 2112;
              v105 = v49;
              _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Removing person: %@", buf, 0x16u);
            }
            v57 = [v49 UUID];
            [v81 removePersonWithUUID:v57];

            v44 = v76;
          }
        }
        uint64_t v46 = [obja countByEnumeratingWithState:&v86 objects:v100 count:16];
      }
      while (v46);
    }

    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v58 = v72;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v82 objects:v99 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v83;
      do
      {
        for (uint64_t k = 0; k != v60; ++k)
        {
          if (*(void *)v83 != v61) {
            objc_enumerationMutation(v58);
          }
          id v63 = *(void **)(*((void *)&v82 + 1) + 8 * k);
          v64 = (void *)MEMORY[0x1D9452090]();
          long long v65 = v80;
          long long v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            long long v67 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v103 = v67;
            __int16 v104 = 2112;
            v105 = v63;
            _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_INFO, "%{public}@Removing duplicate person: %@", buf, 0x16u);
          }
          long long v68 = [v63 UUID];
          [v81 removePersonWithUUID:v68];
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v82 objects:v99 count:16];
      }
      while (v60);
    }

    long long v69 = (void *)[v77 copy];
    uint64_t v11 = v74;
  }
  else
  {
    if (v15)
    {
      long long v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v103 = v70;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Photo library query returned nil when querying current photo library persons, so aborting import process", buf, 0xCu);
    }
    long long v69 = 0;
  }

  return v69;
}

void __64__HMDPhotoLibraryPersonImporter__updatePersonsUsingBatchChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[HMDPhotoLibraryPerson alloc] initWithHMPerson:v3];
  [*(id *)(a1 + 32) addObject:v4];
  id v5 = *(void **)(a1 + 40);
  id v6 = [(HMDPhotoLibraryPerson *)v4 UUID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v7 UUID];
    id v9 = [v3 UUID];
    uint64_t v10 = [v8 compare:v9];

    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 48);
    int v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v10 == 1)
    {
      if (v14)
      {
        BOOL v15 = HMFGetLogIdentifier();
        int v23 = 138543618;
        __int16 v24 = v15;
        __int16 v25 = 2112;
        id v26 = v3;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring person with duplicate external person UUID: %@", (uint8_t *)&v23, 0x16u);
      }
      BOOL v16 = *(void **)(a1 + 56);
      id v17 = v3;
    }
    else
    {
      if (v14)
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v23 = 138543618;
        __int16 v24 = v20;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring person with duplicate external person UUID: %@", (uint8_t *)&v23, 0x16u);
      }
      id v21 = *(void **)(a1 + 40);
      id v22 = [(HMDPhotoLibraryPerson *)v4 UUID];
      [v21 setObject:v3 forKeyedSubscript:v22];

      BOOL v16 = *(void **)(a1 + 56);
      id v17 = v7;
    }
    [v16 addObject:v17];
  }
  else
  {
    int v18 = *(void **)(a1 + 40);
    v19 = [(HMDPhotoLibraryPerson *)v4 UUID];
    [v18 setObject:v3 forKeyedSubscript:v19];
  }
}

uint64_t __64__HMDPhotoLibraryPersonImporter__updatePersonsUsingBatchChange___block_invoke_113(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)_updatePersonsAndFaceCrops:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDPhotoLibraryPersonImporter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDPhotoLibraryPersonImporter *)self dataSource];
  id v7 = [v6 createBatchChange];

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = HMFBooleanToString();
      int v21 = 138543874;
      id v22 = v12;
      __int16 v23 = 2112;
      __int16 v24 = v13;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating persons and face crops from Photos using shouldUpdateAllFaceCrops: %@ batchChange: %@", (uint8_t *)&v21, 0x20u);
    }
    BOOL v14 = [(HMDPhotoLibraryPersonImporter *)v9 _updatePersonsUsingBatchChange:v7];
    if (v14)
    {
      if (v3) {
        uint64_t v15 = [(HMDPhotoLibraryPersonImporter *)v9 _updateFaceCropsForAllPersonsUsingCurrentPersons:v14 batchChange:v7];
      }
      else {
        uint64_t v15 = [(HMDPhotoLibraryPersonImporter *)v9 _updateFaceCropsForPersonsWithUpdatedPhotosFaceCropsUsingCurrentPersons:v14 batchChange:v7];
      }
      id v17 = (void *)MEMORY[0x1D9452090](v15);
      int v18 = v9;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        id v22 = v20;
        __int16 v23 = 2112;
        __int16 v24 = v7;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Committing batch change: %@", (uint8_t *)&v21, 0x16u);
      }
      [v7 commit];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = HMFGetLogIdentifier();
      int v21 = 138543362;
      id v22 = v16;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create batch data operation for person and face crop update", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (HMDPhotoLibraryPersonImporter)initWithUUID:(id)a3 fmfHandler:(id)a4 photoLibrary:(id)a5 workQueue:(id)a6 cloudPhotosSettingObserver:(id)a7 logEventSubmitter:(id)a8
{
  id v15 = a3;
  id v25 = a4;
  id v16 = a5;
  id v17 = a6;
  id v24 = a7;
  id v23 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HMDPhotoLibraryPersonImporter;
  int v18 = [(HMDPhotoLibraryPersonImporter *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_UUID, a3);
    objc_storeStrong((id *)&v19->_workQueue, a6);
    objc_storeStrong((id *)&v19->_fmfHandler, a4);
    objc_storeStrong((id *)&v19->_photoLibrary, a5);
    objc_storeStrong((id *)&v19->_cloudPhotosSettingObserver, a7);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a8);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __125__HMDPhotoLibraryPersonImporter_initWithUUID_fmfHandler_photoLibrary_workQueue_cloudPhotosSettingObserver_logEventSubmitter___block_invoke;
    aBlock[3] = &unk_1E6A0E710;
    id v27 = v15;
    id v28 = v17;
    id v29 = v16;
    __int16 v20 = _Block_copy(aBlock);
    id photoLibraryObserverFactory = v19->_photoLibraryObserverFactory;
    v19->_id photoLibraryObserverFactory = v20;
  }
  return v19;
}

HMDPhotoLibraryObserver *__125__HMDPhotoLibraryPersonImporter_initWithUUID_fmfHandler_photoLibrary_workQueue_cloudPhotosSettingObserver_logEventSubmitter___block_invoke(void *a1)
{
  v1 = [[HMDPhotoLibraryObserver alloc] initWithUUID:a1[4] workQueue:a1[5] photoLibrary:a1[6]];
  return v1;
}

- (HMDPhotoLibraryPersonImporter)initWithUUID:(id)a3
{
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.homed.photos.person.importer", v5);

  id v8 = [[HMDPhotoLibrary alloc] initWithWorkQueue:v7];
  id v9 = +[HMDFMFHandler sharedHandler];
  uint64_t v10 = +[HMDCloudPhotosSettingObserver sharedInstance];
  uint64_t v11 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v12 = [(HMDPhotoLibraryPersonImporter *)self initWithUUID:v6 fmfHandler:v9 photoLibrary:v8 workQueue:v7 cloudPhotosSettingObserver:v10 logEventSubmitter:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29 != -1) {
    dispatch_once(&logCategory__hmf_once_t29, &__block_literal_global_133);
  }
  v2 = (void *)logCategory__hmf_once_v30;
  return v2;
}

uint64_t __44__HMDPhotoLibraryPersonImporter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v30;
  logCategory__hmf_once_objc_super v30 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end