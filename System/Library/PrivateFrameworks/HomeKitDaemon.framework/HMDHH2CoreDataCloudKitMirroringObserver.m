@interface HMDHH2CoreDataCloudKitMirroringObserver
+ (id)logCategory;
- (BOOL)isExportProgressRequestAlreadyInProgress;
- (BOOL)verifyModelsPushedToCloudKitUsingCoreDataExportStream;
- (HMDCoreData)coreData;
- (HMDHH2CoreDataCloudKitMirroringObserver)initWithObjectIds:(id)a3 coreData:(id)a4 storeIdentifier:(id)a5;
- (NSManagedObjectContext)cachedMOC;
- (NSMutableSet)objectIdsToMonitor;
- (NSString)storeIdentifier;
- (id)completionHandler;
- (unint64_t)numberOfIgnoredExportProgressRequest;
- (unint64_t)totalObjectsToMonitor;
- (void)callClientsCompletionHandler:(id)a3;
- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4;
- (void)processExportResult:(id)a3 withError:(id)a4;
- (void)setCachedMOC:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCoreData:(id)a3;
- (void)setIsExportProgressRequestAlreadyInProgress:(BOOL)a3;
- (void)setNumberOfIgnoredExportProgressRequest:(unint64_t)a3;
- (void)setObjectIdsToMonitor:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring;
- (void)verifyModelsPushedToCloudKit;
@end

@implementation HMDHH2CoreDataCloudKitMirroringObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMOC, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_objectIdsToMonitor, 0);
}

- (unint64_t)totalObjectsToMonitor
{
  return self->_totalObjectsToMonitor;
}

- (void)setNumberOfIgnoredExportProgressRequest:(unint64_t)a3
{
  self->_numberOfIgnoredExportProgressRequest = a3;
}

- (unint64_t)numberOfIgnoredExportProgressRequest
{
  return self->_numberOfIgnoredExportProgressRequest;
}

- (void)setIsExportProgressRequestAlreadyInProgress:(BOOL)a3
{
  self->_isExportProgressRequestAlreadyInProgress = a3;
}

- (BOOL)isExportProgressRequestAlreadyInProgress
{
  return self->_isExportProgressRequestAlreadyInProgress;
}

- (void)setCachedMOC:(id)a3
{
}

- (NSManagedObjectContext)cachedMOC
{
  return self->_cachedMOC;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setCoreData:(id)a3
{
}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setObjectIdsToMonitor:(id)a3
{
}

- (NSMutableSet)objectIdsToMonitor
{
  return self->_objectIdsToMonitor;
}

- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received persistent store changed notification for store: %@", buf, 0x16u);
  }
  v12 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v9 storeIdentifier];
  char v13 = HMFEqualObjects();

  if (v13)
  {
    v14 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v9 cachedMOC];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91__HMDHH2CoreDataCloudKitMirroringObserver_coreData_persistentStoreWithIdentifierDidChange___block_invoke;
    v20[3] = &unk_264A2F7F8;
    v20[4] = v9;
    [v14 performBlock:v20];
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v9;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v16 storeIdentifier];
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      __int16 v23 = 2112;
      id v24 = v19;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Wrong store identifier: Expecting %@ got %@", buf, 0x20u);
    }
  }
}

uint64_t __91__HMDHH2CoreDataCloudKitMirroringObserver_coreData_persistentStoreWithIdentifierDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) verifyModelsPushedToCloudKit];
}

- (BOOL)verifyModelsPushedToCloudKitUsingCoreDataExportStream
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if ([(HMDHH2CoreDataCloudKitMirroringObserver *)self isExportProgressRequestAlreadyInProgress])
  {
    v3 = (void *)MEMORY[0x230FBD990]([(HMDHH2CoreDataCloudKitMirroringObserver *)self setNumberOfIgnoredExportProgressRequest:[(HMDHH2CoreDataCloudKitMirroringObserver *)self numberOfIgnoredExportProgressRequest]+ 1]);
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2CoreDataCloudKitMirroringObserver numberOfIgnoredExportProgressRequest](v4, "numberOfIgnoredExportProgressRequest"));
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@There is an export request already in progress. Will not create another one. : %@", buf, 0x16u);
    }
    return 1;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF210]);
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      char v13 = HMFGetLogIdentifier();
      v14 = NSNumber;
      v15 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v11 objectIdsToMonitor];
      v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Waiting for [%@] migrated models to be pushed to the cloud", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v51 = __Block_byref_object_copy__176630;
    v52 = __Block_byref_object_dispose__176631;
    id v53 = 0;
    id v17 = objc_alloc(MEMORY[0x263EFF1F8]);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke;
    v40[3] = &unk_264A23938;
    v40[4] = v11;
    v40[5] = buf;
    v18 = (void *)[v17 initWithOptions:v9 completionBlock:v40];
    uint64_t v19 = [v18 requestIdentifier];
    v20 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v19;

    v21 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v11 objectIdsToMonitor];
    v22 = (void *)[v21 copy];
    [v18 setObjectIDsToFetch:v22];

    __int16 v23 = +[HMDCoreData sharedInstance];
    id v24 = [v23 cloudPrivateStore];
    v49 = v24;
    __int16 v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    [v18 setAffectedStores:v25];

    id v26 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v11 cachedMOC];
    id v39 = 0;
    uint64_t v27 = [v26 executeRequest:v18 error:&v39];
    id v28 = v39;

    if (v27) {
      BOOL v29 = v28 == 0;
    }
    else {
      BOOL v29 = 0;
    }
    BOOL v8 = v29;
    if (v29)
    {
      v33 = (void *)MEMORY[0x230FBD990]([(HMDHH2CoreDataCloudKitMirroringObserver *)v11 setIsExportProgressRequestAlreadyInProgress:1]);
      v30 = v11;
      HMFGetOSLogHandle();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        v32 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v41 = 138544130;
        v42 = v31;
        __int16 v43 = 2112;
        id v44 = v32;
        __int16 v45 = 2112;
        v46 = v27;
        __int16 v47 = 2112;
        uint64_t v48 = 0;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Successfully submitted NSCloudKitMirroringExportProgressRequest [%@] to CD. Result: %@, error: %@", v41, 0x2Au);
      }
    }
    else
    {
      v33 = (void *)MEMORY[0x230FBD990]();
      v34 = v11;
      HMFGetOSLogHandle();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)v41 = 138543618;
        v42 = v37;
        __int16 v43 = 2112;
        id v44 = v28;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Got error while submitting export progress request: %@", v41, 0x16u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  return v8;
}

void __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v19 = v4;
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v3 success];
    id v9 = HMFBooleanToString();
    [v3 madeChanges];
    v10 = HMFBooleanToString();
    uint64_t v11 = objc_opt_class();
    v12 = [v3 error];
    *(_DWORD *)buf = 138544642;
    __int16 v25 = v7;
    __int16 v26 = 2112;
    uint64_t v27 = v8;
    v4 = v19;
    __int16 v28 = 2112;
    BOOL v29 = v9;
    __int16 v30 = 2112;
    v31 = v10;
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    __int16 v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] export progress result completion handler block is called with : Success : %@, madeChanges: %@, result Class : %@, error: %@", buf, 0x3Eu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _HMFPreconditionFailure();
  }
  if ([v3 success])
  {
    char v13 = [v3 objectIDToLastExportedToken];
    v14 = (void *)[v13 copy];
  }
  else
  {
    v14 = 0;
  }
  v15 = [*(id *)(a1 + 32) cachedMOC];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke_24;
  v20[3] = &unk_264A2F000;
  uint64_t v16 = *(void *)(a1 + 40);
  v20[4] = *(void *)(a1 + 32);
  id v21 = v14;
  id v22 = v3;
  uint64_t v23 = v16;
  id v17 = v3;
  id v18 = v14;
  [v15 performBlock:v20];
}

void __96__HMDHH2CoreDataCloudKitMirroringObserver_verifyModelsPushedToCloudKitUsingCoreDataExportStream__block_invoke_24(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] processing export results", (uint8_t *)&v10, 0x16u);
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 48) error];
  [v7 processExportResult:v8 withError:v9];
}

- (void)processExportResult:(id)a3 withError:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v46 = v11;
    __int16 v47 = 2112;
    id v48 = v6;
    __int16 v49 = 2112;
    id v50 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@process export result: %@, %@", buf, 0x20u);
  }
  uint64_t v12 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v9 setIsExportProgressRequestAlreadyInProgress:0];
  if (v7)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990](v12);
    uint64_t v14 = v9;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v46 = v16;
      __int16 v47 = 2112;
      id v48 = v7;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Core Data export stream indicated error while exporting models to CloudKit : %@", buf, 0x16u);
    }
    id v17 = v14;
    id v18 = v7;
LABEL_7:
    [(HMDHH2CoreDataCloudKitMirroringObserver *)v17 callClientsCompletionHandler:v18];
    goto LABEL_8;
  }
  uint64_t v19 = [v6 allKeys];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke;
  v44[3] = &unk_264A23910;
  v44[4] = v9;
  [v19 enumerateObjectsUsingBlock:v44];

  v20 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v9 objectIdsToMonitor];
  uint64_t v21 = [v20 count];

  id v22 = (void *)MEMORY[0x230FBD990]();
  uint64_t v23 = v9;
  id v24 = HMFGetOSLogHandle();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
  if (!v21)
  {
    if (v25)
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v42;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Successfully exported all the CD objects to CloudKit.", buf, 0xCu);
    }
    id v17 = v23;
    id v18 = 0;
    goto LABEL_7;
  }
  if (v25)
  {
    __int16 v26 = HMFGetLogIdentifier();
    uint64_t v27 = NSNumber;
    uint64_t v28 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v23 totalObjectsToMonitor];
    BOOL v29 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v23 objectIdsToMonitor];
    __int16 v30 = objc_msgSend(v27, "numberWithUnsignedLongLong:", v28 - objc_msgSend(v29, "count"));
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDHH2CoreDataCloudKitMirroringObserver totalObjectsToMonitor](v23, "totalObjectsToMonitor"));
    *(_DWORD *)buf = 138543874;
    v46 = v26;
    __int16 v47 = 2112;
    id v48 = v30;
    __int16 v49 = 2112;
    id v50 = v31;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@CD to CK export progress : %@ out of %@ exported", buf, 0x20u);
  }
  __int16 v32 = (void *)MEMORY[0x230FBD990]();
  uint64_t v33 = v23;
  __int16 v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = HMFGetLogIdentifier();
    uint64_t v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2CoreDataCloudKitMirroringObserver numberOfIgnoredExportProgressRequest](v33, "numberOfIgnoredExportProgressRequest"));
    *(_DWORD *)buf = 138543618;
    v46 = v35;
    __int16 v47 = 2112;
    id v48 = v36;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Number of ignored export progress request:%@", buf, 0x16u);
  }
  if ([(HMDHH2CoreDataCloudKitMirroringObserver *)v33 numberOfIgnoredExportProgressRequest])
  {
    v37 = (void *)MEMORY[0x230FBD990]([(HMDHH2CoreDataCloudKitMirroringObserver *)v33 setNumberOfIgnoredExportProgressRequest:0]);
    v38 = v33;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v40;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Requesting to verify the models pushed to CK as we ignored few export progress request earlier", buf, 0xCu);
    }
    v41 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v38 cachedMOC];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke_17;
    v43[3] = &unk_264A2F7F8;
    v43[4] = v38;
    [v41 performBlock:v43];
  }
LABEL_8:
}

void __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 objectIdsToMonitor];
  [v4 removeObject:v3];
}

uint64_t __73__HMDHH2CoreDataCloudKitMirroringObserver_processExportResult_withError___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) verifyModelsPushedToCloudKit];
}

- (void)verifyModelsPushedToCloudKit
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v18 = 138543362;
    uint64_t v19 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Going to verify models pushed to cloudKit using export stream", (uint8_t *)&v18, 0xCu);
  }
  id v7 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v4 objectIdsToMonitor];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    if (![(HMDHH2CoreDataCloudKitMirroringObserver *)v4 verifyModelsPushedToCloudKitUsingCoreDataExportStream])
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      int v10 = v4;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while pushing the CD models to CloudKit.", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [(HMDHH2CoreDataCloudKitMirroringObserver *)v10 callClientsCompletionHandler:v13];
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v4;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Looks like we are not monitoring any object changes. Not doing anything.", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)callClientsCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHH2CoreDataCloudKitMirroringObserver *)self completionHandler];
  [(HMDHH2CoreDataCloudKitMirroringObserver *)self stopMonitoring];
  if (v5) {
    v5[2](v5, v4);
  }
}

- (void)stopMonitoring
{
  id v3 = [(HMDHH2CoreDataCloudKitMirroringObserver *)self cachedMOC];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__HMDHH2CoreDataCloudKitMirroringObserver_stopMonitoring__block_invoke;
  v4[3] = &unk_264A2F7F8;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __57__HMDHH2CoreDataCloudKitMirroringObserver_stopMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@stopMonitoring", (uint8_t *)&v13, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) completionHandler];

  if (v6)
  {
    [*(id *)(a1 + 32) setCompletionHandler:0];
    [*(id *)(a1 + 32) setNumberOfIgnoredExportProgressRequest:0];
    id v7 = [*(id *)(a1 + 32) objectIdsToMonitor];
    [v7 removeAllObjects];

    uint64_t v8 = [*(id *)(a1 + 32) coreData];
    [v8 removeNotificationListener:*(void *)(a1 + 32)];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@already stopped monitoring. Not doing anything.", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)startMonitoring:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHH2CoreDataCloudKitMirroringObserver *)self cachedMOC];

  if (v5)
  {
    id v6 = [(HMDHH2CoreDataCloudKitMirroringObserver *)self cachedMOC];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__HMDHH2CoreDataCloudKitMirroringObserver_startMonitoring___block_invoke;
    v9[3] = &unk_264A2F870;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    [v6 performBlock:v9];
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    __59__HMDHH2CoreDataCloudKitMirroringObserver_startMonitoring___block_invoke(v8);
  }
}

uint64_t __59__HMDHH2CoreDataCloudKitMirroringObserver_startMonitoring___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@startMonitoring", (uint8_t *)&v9, 0xCu);
  }
  if (!*(void *)(a1 + 40))
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  id v6 = [*(id *)(a1 + 32) completionHandler];

  if (v6) {
    goto LABEL_7;
  }
  [*(id *)(a1 + 32) setCompletionHandler:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) coreData];
  [v7 addNotificationListener:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 32) verifyModelsPushedToCloudKit];
}

- (HMDHH2CoreDataCloudKitMirroringObserver)initWithObjectIds:(id)a3 coreData:(id)a4 storeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMDHH2CoreDataCloudKitMirroringObserver;
  uint64_t v11 = [(HMDHH2CoreDataCloudKitMirroringObserver *)&v20 init];
  if (!v11) {
    goto LABEL_5;
  }
  if (v10)
  {
    if (v9)
    {
      uint64_t v12 = [MEMORY[0x263EFF9C0] setWithSet:v8];
      objectIdsToMonitor = v11->_objectIdsToMonitor;
      v11->_objectIdsToMonitor = (NSMutableSet *)v12;

      v11->_totalObjectsToMonitor = [v8 count];
      objc_storeStrong((id *)&v11->_coreData, a4);
      objc_storeStrong((id *)&v11->_storeIdentifier, a5);
      v11->_isExportProgressRequestAlreadyInProgress = 0;
      v11->_numberOfIgnoredExportProgressRequest = 0;
      uint64_t v14 = [(HMDHH2CoreDataCloudKitMirroringObserver *)v11 coreData];
      uint64_t v15 = [v14 newManagedObjectContext];
      cachedMOC = v11->_cachedMOC;
      v11->_cachedMOC = (NSManagedObjectContext *)v15;

LABEL_5:
      return v11;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  int v18 = (void *)_HMFPreconditionFailure();
  return (HMDHH2CoreDataCloudKitMirroringObserver *)+[HMDHH2CoreDataCloudKitMirroringObserver logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_176680 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_176680, &__block_literal_global_176681);
  }
  v2 = (void *)logCategory__hmf_once_v21_176682;
  return v2;
}

void __54__HMDHH2CoreDataCloudKitMirroringObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v21_176682;
  logCategory__hmf_once_v21_176682 = v0;
}

@end