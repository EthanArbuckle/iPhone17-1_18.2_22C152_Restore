@interface HMDCoreDataCloudMirroringExportStatusMonitor
+ (id)logCategory;
- (BOOL)isComplete;
- (HMDCoreDataCloudMirroringExportStatusMonitor)initWithCoreData:(id)a3 managedObjectContext:(id)a4;
- (HMDCoreDataCloudMirroringExportStatusMonitorDelegate)delegate;
- (NSManagedObjectContext)managedObjectContext;
- (void)_verifyModelsExportComplete;
- (void)configureWithExpectedObjectIDToExportedToken:(id)a3;
- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4;
- (void)setDelegate:(id)a3;
- (void)verifyModelsExportStatus;
@end

@implementation HMDCoreDataCloudMirroringExportStatusMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDToExportedToken, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCoreDataCloudMirroringExportStatusMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCoreDataCloudMirroringExportStatusMonitorDelegate *)WeakRetained;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4
{
  if (self) {
    coreData = self->_coreData;
  }
  else {
    coreData = 0;
  }
  id v6 = a4;
  v7 = [(HMDCoreData *)coreData cloudPrivateStore];
  v8 = [v7 identifier];
  int v9 = HMFEqualObjects();

  if (v9)
  {
    v10 = [(HMDCoreDataCloudMirroringExportStatusMonitor *)self managedObjectContext];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __96__HMDCoreDataCloudMirroringExportStatusMonitor_coreData_persistentStoreWithIdentifierDidChange___block_invoke;
    v11[3] = &unk_264A2F7F8;
    v11[4] = self;
    [v10 performBlock:v11];
  }
}

void __96__HMDCoreDataCloudMirroringExportStatusMonitor_coreData_persistentStoreWithIdentifierDidChange___block_invoke(uint64_t a1)
{
}

- (void)_verifyModelsExportComplete
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8) && [*(id *)(a1 + 40) count])
    {
      v2 = (void *)MEMORY[0x230FBD990]();
      v3 = (id)a1;
      v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Request to verify export while another is still in progress", (uint8_t *)&buf, 0xCu);
      }
      v3[9] = 1;
    }
    else if ([*(id *)(a1 + 40) count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__168870;
      v42 = __Block_byref_object_dispose__168871;
      id v43 = 0;
      id v6 = objc_alloc_init(MEMORY[0x263EFF210]);
      id v7 = objc_alloc(MEMORY[0x263EFF1F8]);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke;
      v29[3] = &unk_264A23938;
      v29[4] = a1;
      v29[5] = &buf;
      v8 = (void *)[v7 initWithOptions:v6 completionBlock:v29];
      uint64_t v9 = [v8 requestIdentifier];
      v10 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v9;

      v11 = (void *)MEMORY[0x263EFFA08];
      id v12 = *(id *)(a1 + 40);
      v13 = [v12 allKeys];
      v14 = [v11 setWithArray:v13];
      [v8 setObjectIDsToFetch:v14];

      id v15 = *(id *)(a1 + 32);
      v16 = [v15 cloudPrivateStore];
      v38 = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
      [v8 setAffectedStores:v17];

      v18 = [(id)a1 managedObjectContext];
      id v28 = 0;
      v19 = [v18 executeRequest:v8 error:&v28];
      id v20 = v28;

      if (!v19 || v20)
      {
        v21 = (void *)MEMORY[0x230FBD990]();
        id v26 = (id)a1;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)v30 = 138543618;
          v31 = v27;
          __int16 v32 = 2114;
          id v33 = v20;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Got error while submitting export progress request: %{public}@", v30, 0x16u);
        }
      }
      else
      {
        *(unsigned char *)(a1 + 8) = 1;
        v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = (id)a1;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          v25 = *(void **)(*((void *)&buf + 1) + 40);
          *(_DWORD *)v30 = 138544130;
          v31 = v24;
          __int16 v32 = 2114;
          id v33 = v25;
          __int16 v34 = 2114;
          v35 = v19;
          __int16 v36 = 2114;
          uint64_t v37 = 0;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully submitted NSCloudKitMirroringExportProgressRequest [%{public}@] to CD. Result: %{public}@, error: %{public}@", v30, 0x2Au);
        }
      }

      _Block_object_dispose(&buf, 8);
    }
  }
}

void __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    v24 = v4;
    v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v3 success];
    uint64_t v9 = HMFBooleanToString();
    [v3 madeChanges];
    v10 = HMFBooleanToString();
    uint64_t v11 = objc_opt_class();
    id v12 = [v3 error];
    *(_DWORD *)long long buf = 138544642;
    v29 = v7;
    __int16 v30 = 2114;
    v31 = v8;
    v4 = v24;
    __int16 v32 = 2114;
    id v33 = v9;
    __int16 v34 = 2114;
    v35 = v10;
    __int16 v36 = 2114;
    uint64_t v37 = v11;
    __int16 v38 = 2114;
    v39 = v12;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Export progress result completion handler block is called with : Success : %{public}@, madeChanges: %{public}@, result Class : %{public}@, error: %{public}@", buf, 0x3Eu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _HMFPreconditionFailure();
  }
  if ([v3 success])
  {
    v13 = [v3 objectIDToLastExportedToken];
    v14 = (void *)[v13 copy];
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [v3 error];
      *(_DWORD *)long long buf = 138543618;
      v29 = v18;
      __int16 v30 = 2114;
      v31 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected export progress result error: %{public}@", buf, 0x16u);
    }
    v14 = [NSDictionary dictionary];
  }
  id v20 = [*(id *)(a1 + 32) managedObjectContext];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke_5;
  v25[3] = &unk_264A2F698;
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void *)(a1 + 40);
  id v26 = v14;
  uint64_t v27 = v22;
  v25[4] = v21;
  id v23 = v14;
  [v20 performBlock:v25];
}

void __75__HMDCoreDataCloudMirroringExportStatusMonitor__verifyModelsExportComplete__block_invoke_5(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Processing export results", buf, 0x16u);
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    v10 = v7;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Process export result: %{public}@", buf, 0x16u);
    }
    v13 = [MEMORY[0x263EFF9C0] set];
    id v14 = v10[5];
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __69__HMDCoreDataCloudMirroringExportStatusMonitor__processExportResult___block_invoke;
    __int16 v36 = &unk_264A230B8;
    id v37 = v8;
    __int16 v38 = v10;
    id v15 = v13;
    id v39 = v15;
    [v14 enumerateKeysAndObjectsUsingBlock:buf];
    id v16 = v10[5];
    v17 = [v15 allObjects];
    [v16 removeObjectsForKeys:v17];

    uint64_t v18 = [v10[5] count];
    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v10;
    uint64_t v21 = HMFGetOSLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v22)
      {
        id v23 = HMFGetLogIdentifier();
        v24 = NSNumber;
        id v25 = v20[5];
        id v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        int v31 = 138543618;
        __int16 v32 = v23;
        __int16 v33 = 2114;
        __int16 v34 = v26;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@CD to CK export progress : %{public}@ remaining", (uint8_t *)&v31, 0x16u);
      }
    }
    else
    {
      if (v22)
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v31 = 138543362;
        __int16 v32 = v27;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully exported all the CD objects to CloudKit.", (uint8_t *)&v31, 0xCu);
      }
      [v20[4] removeNotificationListener:v20];
      id v28 = [v20 delegate];
      [v28 monitorDidObserveExportComplete:v20];
    }
  }

  uint64_t v29 = *(void *)(a1 + 32);
  if (v29)
  {
    *(unsigned char *)(v29 + 8) = 0;
    uint64_t v30 = *(void *)(a1 + 32);
    if (v30)
    {
      if (*(unsigned char *)(v30 + 9))
      {
        *(unsigned char *)(v30 + 9) = 0;
        -[HMDCoreDataCloudMirroringExportStatusMonitor _verifyModelsExportComplete](*(void *)(a1 + 32));
      }
    }
  }
}

void __69__HMDCoreDataCloudMirroringExportStatusMonitor__processExportResult___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] objectForKey:v5];
  id v8 = v7;
  if (v7)
  {
    id v21 = 0;
    uint64_t v9 = [v7 compareToken:v6 error:&v21];
    id v10 = v21;
    if ((unint64_t)(v9 - 3) > 1)
    {
      if (!v9)
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = a1[5];
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          id v23 = v18;
          __int16 v24 = 2112;
          id v25 = v10;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cloud Mirror Export Token Comparison Failed %@", buf, 0x16u);
        }
        v19 = [[HMDAssertionLogEvent alloc] initWithReason:@"Cloud Mirror Export Token Comparison Failed %@", v10];
        id v20 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v20 submitLogEvent:v19];
      }
    }
    else
    {
      [a1[6] addObject:v5];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1[5];
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v23 = v14;
      __int16 v24 = 2114;
      id v25 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Cannot compare a nil result token for key %{public}@", buf, 0x16u);
    }
    id v10 = 0;
  }
}

- (void)verifyModelsExportStatus
{
  id v3 = [(HMDCoreDataCloudMirroringExportStatusMonitor *)self managedObjectContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__HMDCoreDataCloudMirroringExportStatusMonitor_verifyModelsExportStatus__block_invoke;
  v4[3] = &unk_264A2F7F8;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __72__HMDCoreDataCloudMirroringExportStatusMonitor_verifyModelsExportStatus__block_invoke(uint64_t a1)
{
}

- (void)configureWithExpectedObjectIDToExportedToken:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCoreDataCloudMirroringExportStatusMonitor *)self managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__HMDCoreDataCloudMirroringExportStatusMonitor_configureWithExpectedObjectIDToExportedToken___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __93__HMDCoreDataCloudMirroringExportStatusMonitor_configureWithExpectedObjectIDToExportedToken___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    objc_storeStrong((id *)(v3 + 40), v2);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 32);
  }
  else {
    id v5 = 0;
  }
  objc_msgSend(v5, "addNotificationListener:");
  uint64_t v6 = *(void *)(a1 + 32);
  -[HMDCoreDataCloudMirroringExportStatusMonitor _verifyModelsExportComplete](v6);
}

- (BOOL)isComplete
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HMDCoreDataCloudMirroringExportStatusMonitor *)self managedObjectContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__HMDCoreDataCloudMirroringExportStatusMonitor_isComplete__block_invoke;
  v5[3] = &unk_264A2F0A0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __58__HMDCoreDataCloudMirroringExportStatusMonitor_isComplete__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    result = [*(id *)(v2 + 40) count];
    LOBYTE(v2) = result == 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = v2;
  return result;
}

- (HMDCoreDataCloudMirroringExportStatusMonitor)initWithCoreData:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCoreDataCloudMirroringExportStatusMonitor;
  char v9 = [(HMDCoreDataCloudMirroringExportStatusMonitor *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coreData, a3);
    objc_storeStrong((id *)&v10->_managedObjectContext, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_168907 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_168907, &__block_literal_global_168908);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v12_168909;
  return v2;
}

void __59__HMDCoreDataCloudMirroringExportStatusMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v12_168909;
  logCategory__hmf_once_v12_168909 = v0;
}

@end