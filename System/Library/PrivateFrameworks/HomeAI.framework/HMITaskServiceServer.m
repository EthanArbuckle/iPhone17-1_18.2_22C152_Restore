@interface HMITaskServiceServer
- (BOOL)cancelTask:(int)a3;
- (HMITaskServiceServer)init;
- (NSOperationQueue)operationQueue;
- (id)buildEmptyTaskFromOptions:(id)a3 error:(id *)a4;
- (id)buildFaceMisclassificationTaskFromOptions:(id)a3 error:(id *)a4;
- (id)buildHomePersonClusteringTaskFromOptions:(id)a3 error:(id *)a4;
- (id)buildPersonsModelsSummaryTaskFromOptions:(id)a3 error:(id *)a4;
- (id)buildRemovePersonsModelTaskFromOptions:(id)a3 error:(id *)a4;
- (id)buildSubmitFeedbackTaskFromOptions:(id)a3 error:(id *)a4;
- (id)buildUpdatePersonsModelTaskFromOptions:(id)a3 error:(id *)a4;
- (id)buildUpdateTorsoModelTaskFromOptions:(id)a3 error:(id *)a4;
- (int)getNextTaskID;
- (int)nextTaskID;
- (int)submitTask:(id)a3 progressHandler:(id)a4 completionHander:(id)a5;
- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)setNextTaskID:(int)a3;
@end

@implementation HMITaskServiceServer

- (HMITaskServiceServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMITaskServiceServer;
  v2 = [(HMITaskService *)&v6 initPrivate];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_nextTaskID = 1;
  }
  return v2;
}

- (int)getNextTaskID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int v4 = [(HMITaskServiceServer *)self nextTaskID];
  [(HMITaskServiceServer *)self setNextTaskID:(v4 + 1)];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int)submitTaskWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  uint64_t v11 = [v8 objectForKeyedSubscript:@"taskType"];
  if (v11)
  {
    id v12 = (id)v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x22A641C70]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v16;
      _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_DEBUG, "%{public}@options is empty/nil, defaulting to Home persons clustering task with impure person cleanup", buf, 0xCu);
    }
    if (v8) {
      [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
    }
    else {
    v17 = [MEMORY[0x263EFF9A0] dictionary];
    }
    [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"doImpurePersonCleanup"];
    uint64_t v18 = [v17 copy];

    id v12 = (id)HMITaskTypeHomePersonClusteringTask;
    id v8 = (id)v18;
  }
  if ([v12 isEqualToString:HMITaskTypeUpdatePersonsModelTask])
  {
    uint64_t v33 = 0;
    v19 = (id *)&v33;
    uint64_t v20 = [(HMITaskServiceServer *)self buildUpdatePersonsModelTaskFromOptions:v8 error:&v33];
  }
  else if ([v12 isEqualToString:HMITaskTypeRemovePersonsModelTask])
  {
    uint64_t v32 = 0;
    v19 = (id *)&v32;
    uint64_t v20 = [(HMITaskServiceServer *)self buildRemovePersonsModelTaskFromOptions:v8 error:&v32];
  }
  else if ([v12 isEqualToString:HMITaskTypeHomePersonClusteringTask])
  {
    uint64_t v31 = 0;
    v19 = (id *)&v31;
    uint64_t v20 = [(HMITaskServiceServer *)self buildHomePersonClusteringTaskFromOptions:v8 error:&v31];
  }
  else if ([v12 isEqualToString:HMITaskTypeEmptyTask])
  {
    uint64_t v30 = 0;
    v19 = (id *)&v30;
    uint64_t v20 = [(HMITaskServiceServer *)self buildEmptyTaskFromOptions:v8 error:&v30];
  }
  else if ([v12 isEqualToString:HMITaskTypeFaceMisclassificationTask])
  {
    uint64_t v29 = 0;
    v19 = (id *)&v29;
    uint64_t v20 = [(HMITaskServiceServer *)self buildFaceMisclassificationTaskFromOptions:v8 error:&v29];
  }
  else if ([v12 isEqualToString:HMITaskTypePersonsModelsSummaryTask])
  {
    uint64_t v28 = 0;
    v19 = (id *)&v28;
    uint64_t v20 = [(HMITaskServiceServer *)self buildPersonsModelsSummaryTaskFromOptions:v8 error:&v28];
  }
  else if ([v12 isEqualToString:HMITaskTypeFeedbackTask])
  {
    uint64_t v27 = 0;
    v19 = (id *)&v27;
    uint64_t v20 = [(HMITaskServiceServer *)self buildSubmitFeedbackTaskFromOptions:v8 error:&v27];
  }
  else
  {
    if (![v12 isEqualToString:HMITaskTypeUpdateTorsoModelTask])
    {
      v24 = [NSString stringWithFormat:@"Unknown task type: %@", v12];
      id v22 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1042 description:v24];

      goto LABEL_28;
    }
    uint64_t v26 = 0;
    v19 = (id *)&v26;
    uint64_t v20 = [(HMITaskServiceServer *)self buildUpdateTorsoModelTaskFromOptions:v8 error:&v26];
  }
  v21 = (void *)v20;
  id v22 = *v19;
  if (!v21)
  {
LABEL_28:
    v34 = @"resultCode";
    v35 = @"Error";
    v21 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v10[2](v10, v21, v22);
    int v23 = -1;
    goto LABEL_29;
  }
  int v23 = [(HMITaskServiceServer *)self submitTask:v21 progressHandler:v9 completionHander:v10];
LABEL_29:

  return v23;
}

- (int)submitTask:(id)a3 progressHandler:(id)a4 completionHander:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, v8);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke;
  v21[3] = &unk_26477CBF8;
  id v11 = v9;
  id v22 = v11;
  [v8 setProgressBlock:v21];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke_2;
  uint64_t v18 = &unk_26477BA80;
  objc_copyWeak(&v20, &location);
  id v12 = v10;
  id v19 = v12;
  [v8 setCompletionBlock:&v15];
  v13 = [(HMITaskServiceServer *)self operationQueue];
  [v13 addOperation:v8];

  LODWORD(v13) = [v8 taskID];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
  return (int)v13;
}

uint64_t __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__HMITaskServiceServer_submitTask_progressHandler_completionHander___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [WeakRetained results];
  int v4 = [WeakRetained error];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
}

- (BOOL)cancelTask:(int)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  int v4 = [(HMITaskServiceServer *)self operationQueue];
  v5 = [v4 operations];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__HMITaskServiceServer_cancelTask___block_invoke;
  v8[3] = &unk_26477CC20;
  int v9 = a3;
  v8[4] = &v10;
  [v5 enumerateObjectsUsingBlock:v8];

  uint64_t v6 = v11[5];
  if (v6) {
    [(id)v11[5] cancel];
  }
  _Block_object_dispose(&v10, 8);

  return v6 != 0;
}

void __35__HMITaskServiceServer_cancelTask___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 taskID] == *(_DWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)buildUpdatePersonsModelTaskFromOptions:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"homeUUID"];
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"isExternal"];
    int v9 = v8;
    if (!v8)
    {
      uint64_t v26 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1026 description:@"HMIUpdatePersonsModelTaskIsExternal is nil"];
      uint64_t v27 = v26;
      if (a4) {
        *a4 = v26;
      }
      HMIErrorLog(self, v27);

      v25 = 0;
      goto LABEL_32;
    }
    uint64_t v10 = [v8 BOOLValue];
    id v11 = [v6 objectForKeyedSubscript:@"sourceUUID"];
    if (v11)
    {
      uint64_t v12 = +[HMIPreference sharedInstance];
      v13 = [v12 stringPreferenceForKey:@"personDataSourceDiskStoragePath" defaultValue:&stru_26D98B6C8];
      int v14 = [v13 isEqualToString:&stru_26D98B6C8];

      if (v14)
      {
        id v15 = objc_alloc_init(HMIHomeKitClient);
        uint64_t v16 = v15;
        if (v10)
        {
          context = (void *)MEMORY[0x22A641C70]();
          v17 = self;
          uint64_t v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            id v19 = v46 = v16;
            *(_DWORD *)buf = 138543874;
            v52 = v19;
            __int16 v53 = 2112;
            v54 = v7;
            __int16 v55 = 2112;
            v56 = v11;
            _os_log_impl(&dword_225DC6000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Creating HMPhotosPersonManager for homeUUID:%@ sourceUUID:%@", buf, 0x20u);

            uint64_t v16 = v46;
          }

          uint64_t v20 = [(HMIHomeKitClient *)v16 photosPersonManagerForHomeUUID:v7 sourceUUID:v11];
          if (v20)
          {
            v21 = (void *)v20;
            id v22 = [[HMIExternalPersonDataSourceHomeKit alloc] initWithHMPhotosPersonManager:v20];
            BOOL contexta = 0;
LABEL_24:

            id v30 = 0;
            BOOL v31 = contexta;
            goto LABEL_25;
          }
          v39 = (void *)MEMORY[0x263F087E8];
          v40 = @"Failed to get HMPhotosPersonManager";
        }
        else
        {
          BOOL contexta = [(HMIHomeKitClient *)v15 isCurrentDevicePrimaryResident];
          v45 = (void *)MEMORY[0x22A641C70]();
          uint64_t v32 = self;
          uint64_t v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v34 = v47 = v16;
            *(_DWORD *)buf = 138543618;
            v52 = v34;
            __int16 v53 = 2112;
            v54 = v7;
            _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Creating HMHomePersonManager for homeUUID:%@", buf, 0x16u);

            uint64_t v16 = v47;
          }

          uint64_t v35 = [(HMIHomeKitClient *)v16 homePersonManagerForHomeUUID:v7];
          if (v35)
          {
            v21 = (void *)v35;
            id v22 = [[HMIHomePersonDataSourceHomeKit alloc] initWithHMHomePersonManager:v35];
            goto LABEL_24;
          }
          v39 = (void *)MEMORY[0x263F087E8];
          v40 = @"Failed to get HMHomePersonManager";
        }
        v43 = objc_msgSend(v39, "hmiPrivateErrorWithCode:description:", 1026, v40, v45);
        id v44 = v43;
        if (a4)
        {
          id v44 = v43;
          *a4 = v44;
        }
        HMIErrorLog(self, v44);

LABEL_30:
        v25 = 0;
        goto LABEL_31;
      }
      if (v10)
      {
        id v50 = 0;
        id v22 = [(HMIPersonDataSourceDisk *)[HMIExternalPersonDataSourceDisk alloc] initWithHomeUUID:v7 sourceUUID:v11 error:&v50];
        id v30 = v50;
        if (v22)
        {
          BOOL v31 = 0;
LABEL_25:
          v25 = [[HMIUpdatePersonsModelTask alloc] initWithTaskID:[(HMITaskServiceServer *)self getNextTaskID] homeUUID:v7 sourceUUID:v11 dataSource:v22 externalLibrary:v10 removeExcessFaceCrops:v31];

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        v41 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1026 description:@"Failed to initialize data source" underlyingError:v30];
        v42 = v41;
        if (a4) {
          *a4 = v41;
        }
        HMIErrorLog(self, v42);

        goto LABEL_30;
      }
      uint64_t v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = @"Disk-based Home Person Data Source not supported";
    }
    else
    {
      uint64_t v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = @"HMIPersonsModelTaskSourceUUID is nil";
    }
    v36 = [v28 hmiPrivateErrorWithCode:1026 description:v29];
    v37 = v36;
    if (a4) {
      *a4 = v36;
    }
    HMIErrorLog(self, v37);

    goto LABEL_30;
  }
  int v23 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1026 description:@"HMITaskHomeUUIDKey is nil"];
  v24 = v23;
  if (a4) {
    *a4 = v23;
  }
  HMIErrorLog(self, v24);

  v25 = 0;
LABEL_33:

  return v25;
}

- (id)buildRemovePersonsModelTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"homeUUID"];
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"sourceUUID"];
    if (v8)
    {
      int v9 = [[HMIRemovePersonsModelTask alloc] initWithTaskID:[(HMITaskServiceServer *)self getNextTaskID] homeUUID:v7 sourceUUID:v8];
      goto LABEL_11;
    }
    id v11 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1027 description:@"HMIPersonsModelTaskSourceUUID is nil"];
    uint64_t v12 = v11;
    if (a4) {
      *a4 = v11;
    }
    HMIErrorLog(self, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1027 description:@"HMITaskHomeUUIDKey is nil"];
    id v8 = v10;
    if (a4) {
      *a4 = v10;
    }
    HMIErrorLog(self, v8);
  }
  int v9 = 0;
LABEL_11:

  return v9;
}

- (id)buildFaceMisclassificationTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"homeUUID"];
  if (v7)
  {
    id v8 = objc_alloc_init(HMIHomeKitClient);
    int v9 = [(HMIHomeKitClient *)v8 homePersonManagerForHomeUUID:v7];
    if (v9)
    {
      uint64_t v10 = [[HMIHomePersonDataSourceHomeKit alloc] initWithHMHomePersonManager:v9];
      id v11 = [v6 objectForKeyedSubscript:@"faceCrop"];
      uint64_t v12 = [[HMIFaceMisclassificationTask alloc] initWithTaskID:[(HMITaskServiceServer *)self getNextTaskID] dataSource:v10 faceCrop:v11];
    }
    else
    {
      int v14 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1029 description:@"Failed to get HMHomePersonManager"];
      uint64_t v10 = v14;
      if (a4) {
        *a4 = v14;
      }
      HMIErrorLog(self, v10);
      uint64_t v12 = 0;
    }
  }
  else
  {
    v13 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1029 description:@"HMITaskHomeUUIDKey is nil"];
    id v8 = v13;
    if (a4) {
      *a4 = v13;
    }
    HMIErrorLog(self, v8);
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)buildHomePersonClusteringTaskFromOptions:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (HMIIsResidentDevice())
  {
    id v7 = objc_alloc_init(HMIHomeKitClient);
    if ([(HMIHomeKitClient *)v7 isCurrentDevicePrimaryResident])
    {
      id v8 = [(HMIHomeKitClient *)v7 homePersonManagersForCurrentDevice];
      if ([v8 count])
      {
        unint64_t v9 = arc4random();
        unint64_t v10 = v9 % [v8 count];
        id v11 = [v8 allObjects];
        uint64_t v12 = [v11 objectAtIndexedSubscript:v10];

        v13 = [v12 UUID];
        int v14 = [(HMIHomeKitClient *)v7 homeForHMPersonManagerUUID:v13];
        id v15 = [v14 uuid];

        if (v15)
        {
          uint64_t v16 = [[HMIHomePersonDataSourceHomeKit alloc] initWithHMHomePersonManager:v12];
          v17 = [v6 objectForKeyedSubscript:@"doImpurePersonCleanup"];

          if (v17)
          {
            uint64_t v18 = [v6 objectForKeyedSubscript:@"doImpurePersonCleanup"];
            unsigned int v33 = [v18 BOOLValue];

            v34 = v15;
            id v19 = [HMIHomePersonClusteringTask alloc];
            uint64_t v20 = [(HMITaskServiceServer *)self getNextTaskID];
            v21 = [v12 UUID];
            id v22 = +[HMIPersonsModelManager sharedInstance];
            int v23 = v19;
            id v15 = v34;
            v24 = [(HMIHomePersonClusteringTask *)v23 initWithTaskID:v20 homeUUID:v34 dataSource:v16 sourceUUID:v21 personsModelManager:v22 doImpurePersonCleanup:v33 error:a4];
          }
          else
          {
            BOOL v31 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1028 description:@"cleanup key is missing"];
            v21 = v31;
            if (a4) {
              *a4 = v31;
            }
            HMIErrorLog(self, v21);
            v24 = 0;
          }
        }
        else
        {
          id v30 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1028 description:@"HomeUUID is nil"];
          uint64_t v16 = v30;
          if (a4) {
            *a4 = v30;
          }
          HMIErrorLog(self, v16);
          v24 = 0;
        }
      }
      else
      {
        uint64_t v29 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1028 description:@"Failed to get HMHomePersonManager"];
        uint64_t v12 = v29;
        if (a4) {
          *a4 = v29;
        }
        HMIErrorLog(self, v12);
        v24 = 0;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x22A641C70]();
      uint64_t v26 = self;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v28;
        _os_log_impl(&dword_225DC6000, v27, OS_LOG_TYPE_INFO, "%{public}@Current device is not primary resident, skipping clustering", buf, 0xCu);
      }
      v24 = [(HMITask *)[HMIEmptyTask alloc] initWithTaskID:[(HMITaskServiceServer *)v26 getNextTaskID]];
    }
  }
  else
  {
    v24 = [(HMITask *)[HMIEmptyTask alloc] initWithTaskID:[(HMITaskServiceServer *)self getNextTaskID]];
  }

  return v24;
}

- (id)buildPersonsModelsSummaryTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"homeUUID"];
  if (v6)
  {
    id v7 = [[HMIPersonsModelsSummaryTask alloc] initWithTaskID:[(HMITaskServiceServer *)self getNextTaskID] homeUUID:v6];
  }
  else
  {
    id v8 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1030 description:@"HMITaskHomeUUIDKey is nil"];
    unint64_t v9 = v8;
    if (a4) {
      *a4 = v8;
    }
    HMIErrorLog(self, v9);

    id v7 = 0;
  }

  return v7;
}

- (id)buildSubmitFeedbackTaskFromOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"cameraProfileUUID"];
  id v7 = [v5 objectForKeyedSubscript:@"clipUUID"];

  id v8 = [[HMIFeedbackTask alloc] initWithTaskID:[(HMITaskServiceServer *)self getNextTaskID] cameraProfileUUID:v6 clipUUID:v7];
  return v8;
}

- (id)buildUpdateTorsoModelTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"homeUUID"];
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"torsoAnnotations"];
    if (v8)
    {
      unint64_t v9 = [[HMIUpdateTorsoModelTask alloc] initWithTaskID:[(HMITaskServiceServer *)self getNextTaskID] homeUUID:v7 torsoAnnotations:v8];
      goto LABEL_11;
    }
    id v11 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1039 description:@"HMIUpdateTorsoModelTaskAnnotationsKey is nil"];
    uint64_t v12 = v11;
    if (a4) {
      *a4 = v11;
    }
    HMIErrorLog(self, v12);
  }
  else
  {
    unint64_t v10 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1039 description:@"HMITaskHomeUUIDKey is nil"];
    id v8 = v10;
    if (a4) {
      *a4 = v10;
    }
    HMIErrorLog(self, v8);
  }
  unint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)buildEmptyTaskFromOptions:(id)a3 error:(id *)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"duration"];
  if (v6)
  {
    id v7 = [HMIEmptyTask alloc];
    uint64_t v8 = [(HMITaskServiceServer *)self getNextTaskID];
    [v6 doubleValue];
    unint64_t v9 = -[HMIEmptyTask initWithTaskID:duration:](v7, "initWithTaskID:duration:", v8);
  }
  else
  {
    unint64_t v10 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1039 description:@"HMIEmptyTaskDurationKey is nil"];
    id v11 = v10;
    if (a4) {
      *a4 = v10;
    }
    HMIErrorLog(self, v11);

    unint64_t v9 = 0;
  }

  return v9;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (int)nextTaskID
{
  return self->_nextTaskID;
}

- (void)setNextTaskID:(int)a3
{
  self->_nextTaskID = a3;
}

- (void).cxx_destruct
{
}

@end