@interface HMSoftwareUpdateController
+ (id)logCategory;
+ (id)namespace;
- (BOOL)isControllable;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMSoftwareUpdate)availableUpdate;
- (HMSoftwareUpdateController)init;
- (HMSoftwareUpdateController)initWithAccessory:(id)a3;
- (HMSoftwareUpdateControllerDelegate)delegate;
- (NSUUID)messageTargetUUID;
- (NSUUID)uniqueIdentifier;
- (_HMContext)context;
- (id)logIdentifier;
- (id)messageDestination;
- (unint64_t)hash;
- (void)changeUpdateSource:(int64_t)a3 path:(id)a4 documentationPath:(id)a5 userInitiatedStaging:(BOOL)a6 completion:(id)a7;
- (void)configureWithContext:(id)a3 accessory:(id)a4;
- (void)fetchAvailableUpdateWithCompletionHandler:(id)a3;
- (void)removeStagedSoftwareUpdate:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAvailableUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startUpdate:(id)a3 completionHandler:(id)a4;
@end

@implementation HMSoftwareUpdateController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_accessory);

  objc_storeStrong((id *)&self->_availableUpdate, 0);
}

- (_HMContext)context
{
  return self->_context;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setDelegate:(id)a3
{
}

- (HMSoftwareUpdateControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMSoftwareUpdateControllerDelegate *)WeakRetained;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  v4 = [(HMSoftwareUpdateController *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMSoftwareUpdateController *)self accessory];
  id v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (id)logIdentifier
{
  v2 = [(HMSoftwareUpdateController *)self accessory];
  id v3 = [v2 uniqueIdentifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 availableUpdate];
    v8 = [(HMSoftwareUpdateController *)self availableUpdate];
    char v9 = HMFEqualObjects();

    if (v9)
    {
      v10 = [(HMSoftwareUpdateController *)self availableUpdate];
      [v10 mergeFromNewObject:v7];
    }
    else
    {
      v12 = (void *)MEMORY[0x19F3A64A0]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        __int16 v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating available software update: %@", buf, 0x16u);
      }
      [(HMSoftwareUpdateController *)v13 setAvailableUpdate:v7];
      v16 = [(HMSoftwareUpdateController *)v13 delegate];
      if (objc_opt_respondsToSelector())
      {
        v17 = [(HMSoftwareUpdateController *)v13 context];
        v18 = [v17 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E5945650;
        block[4] = v13;
        id v21 = v7;
        id v22 = v16;
        dispatch_async(v18, block);
      }
    }
    char v11 = v9 ^ 1;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

void __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __49__HMSoftwareUpdateController_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    char v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of available software update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) softwareUpdateController:*(void *)(a1 + 32) didUpdateAvailableUpdate:*(void *)(a1 + 40)];
}

- (void)removeStagedSoftwareUpdate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdateController removeStagedSoftwareUpdate:]", @"completion"];
    v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  v5 = (void (**)(void, void))v4;
  uint64_t v6 = [(HMSoftwareUpdateController *)self context];

  if (v6)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__15485;
    uint64_t v27 = __Block_byref_object_dispose__15486;
    id v28 = [(HMSoftwareUpdateController *)self accessory];
    objc_initWeak(&location, self);
    id v7 = [(HMSoftwareUpdateController *)self context];
    int v8 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke;
    block[3] = &unk_1E593FA50;
    objc_copyWeak(&v23, &location);
    id v22 = buf;
    id v21 = v5;
    dispatch_async(v8, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    char v9 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[HMSoftwareUpdateController removeStagedSoftwareUpdate:]";
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v5)[2](v5, v13);
  }
}

void __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = WeakRetained;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@removing staged software update from accessory %@", buf, 0x16u);
  }
  int v8 = (void *)MEMORY[0x1E4F654B0];
  char v9 = [v4 messageDestination];
  __int16 v10 = [v8 messageWithName:@"HMSU.rsu" destination:v9 payload:0];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke_114;
  v16 = &unk_1E5944EF0;
  id v17 = v4;
  id v18 = *(id *)(a1 + 32);
  [v10 setResponseHandler:&v13];
  uint64_t v11 = objc_msgSend(v4, "context", v13, v14, v15, v16, v17);
  uint64_t v12 = [v11 messageDispatcher];
  [v12 sendMessage:v10];
}

void __57__HMSoftwareUpdateController_removeStagedSoftwareUpdate___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v5;
    uint64_t v12 = "%{public}@Failed to remove staged software update with error: %@";
    uint64_t v13 = v9;
    uint32_t v14 = 22;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v11;
    uint64_t v12 = "%{public}@Successfully removed staged software update";
    uint64_t v13 = v9;
    uint32_t v14 = 12;
  }
  _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, v14);

LABEL_7:
  if (*(void *)(a1 + 40))
  {
    v15 = [*(id *)(a1 + 32) context];
    v16 = [v15 delegateCaller];
    [v16 callCompletion:*(void *)(a1 + 40) error:v5];
  }
}

- (void)changeUpdateSource:(int64_t)a3 path:(id)a4 documentationPath:(id)a5 userInitiatedStaging:(BOOL)a6 completion:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a3 == 2 && ![v12 length])
  {
    uint64_t v29 = (void *)MEMORY[0x19F3A64A0]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      HMSoftwareUpdateAssetSourceAsString(2);
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v32;
      __int16 v47 = 2112;
      v48 = v33;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Path is a required parameter for source %@", buf, 0x16u);
    }
    v34 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v35 = *MEMORY[0x1E4F1C3C8];
    v36 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:20];
    id v37 = [v34 exceptionWithName:v35 reason:v36 userInfo:0];

    objc_exception_throw(v37);
  }
  v15 = [(HMSoftwareUpdateController *)self context];
  if (!v14)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdateController changeUpdateSource:path:documentationPath:userInitiatedStaging:completion:]", @"completion"];
    v24 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v46 = v27;
      __int16 v47 = 2112;
      v48 = (const char *)v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  v16 = v15;
  if (v15)
  {
    int v17 = [v15 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke;
    block[3] = &unk_1E593FA28;
    void block[4] = self;
    int64_t v43 = a3;
    id v39 = v12;
    id v40 = v13;
    BOOL v44 = a6;
    id v42 = v14;
    id v41 = v16;
    dispatch_async(v17, block);
  }
  else
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v46 = v21;
      __int16 v47 = 2080;
      v48 = "-[HMSoftwareUpdateController changeUpdateSource:path:documentationPath:userInitiatedStaging:completion:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v14 + 2))(v14, v22);
  }
}

void __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HMSoftwareUpdateAssetSourceAsString(*(void *)(a1 + 72));
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    __int16 v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Change update source to %@", buf, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  [v7 setObject:v8 forKeyedSubscript:@"source"];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:@"path"];
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    [v7 setObject:v10 forKeyedSubscript:@"docpath"];
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v11 = [NSNumber numberWithBool:1];
    [v7 setObject:v11 forKeyedSubscript:@"userInitiated"];
  }
  id v12 = (void *)MEMORY[0x1E4F654B0];
  id v13 = [*(id *)(a1 + 32) messageDestination];
  id v14 = (void *)[v7 copy];
  v15 = [v12 messageWithName:@"HMSU.cus" destination:v13 payload:v14];

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  __int16 v19 = __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke_113;
  id v20 = &unk_1E5944188;
  objc_copyWeak(&v22, (id *)buf);
  id v21 = *(id *)(a1 + 64);
  [v15 setResponseHandler:&v17];
  v16 = objc_msgSend(*(id *)(a1 + 56), "messageDispatcher", v17, v18, v19, v20);
  [v16 sendMessage:v15 completionHandler:0];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __104__HMSoftwareUpdateController_changeUpdateSource_path_documentationPath_userInitiatedStaging_completion___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v11) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v18 = 138543618;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v5;
    id v13 = "%{public}@Failed to change update source with error: %@";
    id v14 = v10;
    uint32_t v15 = 22;
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v18 = 138543362;
    __int16 v19 = v12;
    id v13 = "%{public}@Successfully changed update source";
    id v14 = v10;
    uint32_t v15 = 12;
  }
  _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, v15);

LABEL_7:
  if (*(void *)(a1 + 32))
  {
    v16 = [v9 context];
    uint64_t v17 = [v16 delegateCaller];
    [v17 callCompletion:*(void *)(a1 + 32) error:v5];
  }
}

- (void)startUpdate:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0](v7);
    int v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Update is a required parameter", buf, 0xCu);
    }
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    uint64_t v23 = [MEMORY[0x1E4F28C58] hmStringFromErrorCode:20];
    id v24 = [v21 exceptionWithName:v22 reason:v23 userInfo:0];

    objc_exception_throw(v24);
  }
  id v8 = (void (**)(void, void))v7;
  id v9 = [(HMSoftwareUpdateController *)self context];
  if (!v8)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdateController startUpdate:completionHandler:]", @"completionHandler"];
    v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v29;
      __int16 v37 = 2112;
      v38 = (const char *)v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    void block[4] = self;
    id v32 = v6;
    v34 = v8;
    id v33 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v15;
      __int16 v37 = 2080;
      v38 = "-[HMSoftwareUpdateController startUpdate:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v8)[2](v8, v16);
  }
}

void __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting update: %@", buf, 0x16u);
  }
  __int16 v19 = @"update";
  id v7 = encodeRootObject(a1[5]);
  __int16 v20 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  id v9 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v10 = [a1[4] messageDestination];
  BOOL v11 = [v9 messageWithName:@"HMSU.su" destination:v10 payload:v8];

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint32_t v15 = __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke_107;
  v16 = &unk_1E5944188;
  objc_copyWeak(&v18, (id *)buf);
  id v17 = a1[7];
  [v11 setResponseHandler:&v13];
  id v12 = objc_msgSend(a1[6], "messageDispatcher", v13, v14, v15, v16);
  [v12 sendMessage:v11 completionHandler:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __60__HMSoftwareUpdateController_startUpdate_completionHandler___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v11) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v18 = 138543618;
    __int16 v19 = v12;
    __int16 v20 = 2114;
    id v21 = v5;
    uint64_t v13 = "%{public}@Failed to start updates with error: %{public}@";
    uint64_t v14 = v10;
    uint32_t v15 = 22;
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v18 = 138543362;
    __int16 v19 = v12;
    uint64_t v13 = "%{public}@Successfully started update";
    uint64_t v14 = v10;
    uint32_t v15 = 12;
  }
  _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, v15);

LABEL_7:
  if (*(void *)(a1 + 32))
  {
    v16 = [v9 context];
    id v17 = [v16 delegateCaller];
    [v17 callCompletion:*(void *)(a1 + 32) error:v5];
  }
}

- (void)fetchAvailableUpdateWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSoftwareUpdateController *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdateController fetchAvailableUpdateWithCompletionHandler:]", @"completionHandler"];
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    uint32_t v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    void block[4] = self;
    id v21 = v4;
    id v20 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v11;
      __int16 v24 = 2080;
      uint64_t v25 = "-[HMSoftwareUpdateController fetchAvailableUpdateWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

void __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v17 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching available updates", buf, 0xCu);
  }
  id v6 = (void *)MEMORY[0x1E4F654B0];
  id v7 = [a1[4] messageDestination];
  id v8 = [v6 messageWithName:@"HMSU.fu" destination:v7 payload:0];

  objc_initWeak((id *)buf, a1[4]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_99;
  uint64_t v13 = &unk_1E5944188;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = a1[6];
  [v8 setResponseHandler:&v10];
  id v9 = objc_msgSend(a1[5], "messageDispatcher", v10, v11, v12, v13);
  [v9 sendMessage:v8 completionHandler:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = WeakRetained;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v11;
      __int16 v51 = 2112;
      id v52 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to fetched available updates with error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v12 = objc_msgSend(v6, "hmf_dataForKey:", @"update");
    if (v12)
    {
      id v48 = 0;
      uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v48];
      id v14 = v48;
      id v15 = v14;
      if (!v13)
      {
        id v42 = v14;
        v16 = (void *)MEMORY[0x19F3A64A0]();
        id v17 = WeakRetained;
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v19 = context = v16;
          *(_DWORD *)buf = 138543618;
          v50 = v19;
          __int16 v51 = 2112;
          id v52 = v42;
          _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from software update data: %@", buf, 0x16u);

          v16 = context;
        }

        id v15 = v42;
      }
      id v20 = objc_msgSend(WeakRetained, "availableUpdate", context);
      char v21 = HMFEqualObjects();

      if ((v21 & 1) == 0)
      {
        contexta = (void *)MEMORY[0x19F3A64A0]();
        id v22 = WeakRetained;
        __int16 v23 = HMFGetOSLogHandle();
        int64_t v43 = v15;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v50 = v24;
          __int16 v51 = 2112;
          id v52 = v13;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Updating available software update: %@", buf, 0x16u);

          id v15 = v43;
        }

        [v22 setAvailableUpdate:v13];
        uint64_t v25 = [v22 delegate];
        if (objc_opt_respondsToSelector())
        {
          id v26 = objc_loadWeakRetained((id *)(a1 + 40));
          uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
          id v28 = v26;
          uint64_t v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v30 = contextb = v27;
            *(_DWORD *)buf = 138543618;
            v50 = v30;
            __int16 v51 = 2112;
            id v52 = v13;
            _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_INFO, "%{public}@Notifying client of available software update: %@", buf, 0x16u);

            uint64_t v27 = contextb;
          }

          v31 = [v28 context];
          id v32 = [v31 delegateCaller];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_104;
          v44[3] = &unk_1E5945650;
          id v45 = v25;
          id v46 = v28;
          id v47 = v13;
          [v32 invokeBlock:v44];

          id v15 = v43;
        }
      }
    }
    else
    {
      uint64_t v13 = 0;
    }

    id v33 = (void *)MEMORY[0x19F3A64A0]();
    id v34 = WeakRetained;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v36;
      __int16 v51 = 2112;
      id v52 = v13;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully fetched available update: %@", buf, 0x16u);
    }
  }
  if (*(void *)(a1 + 32))
  {
    __int16 v37 = [WeakRetained context];
    v38 = [v37 delegateCaller];
    [v38 callCompletion:*(void *)(a1 + 32) error:v5];
  }
}

uint64_t __72__HMSoftwareUpdateController_fetchAvailableUpdateWithCompletionHandler___block_invoke_104(uint64_t a1)
{
  return [*(id *)(a1 + 32) softwareUpdateController:*(void *)(a1 + 40) didUpdateAvailableUpdate:*(void *)(a1 + 48)];
}

- (void)setAvailableUpdate:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_availableUpdate, a3);
  id v5 = [(HMSoftwareUpdateController *)self context];
  [v6 configureWithContext:v5];

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSoftwareUpdate)availableUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_availableUpdate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isControllable
{
  v2 = [(HMSoftwareUpdateController *)self accessory];
  char v3 = [v2 isControllable];

  return v3;
}

- (void)setAccessory:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_accessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMAccessory)accessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  os_unfair_lock_unlock(p_lock);

  return (HMAccessory *)WeakRetained;
}

- (void)configureWithContext:(id)a3 accessory:(id)a4
{
  objc_storeStrong((id *)&self->_context, a3);
  id v7 = a3;
  id v8 = a4;
  objc_storeWeak((id *)&self->_accessory, v8);

  id v9 = [(HMSoftwareUpdateController *)self availableUpdate];
  [v9 configureWithContext:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMSoftwareUpdateController *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
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
      id v7 = [(HMSoftwareUpdateController *)self accessory];
      id v8 = [(HMSoftwareUpdateController *)v6 accessory];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMSoftwareUpdateController *)self accessory];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMSoftwareUpdateController)initWithAccessory:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMSoftwareUpdateController;
  id v5 = [(HMSoftwareUpdateController *)&v15 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
    id v8 = [v4 uniqueIdentifier];
    id v9 = v7;
    objc_msgSend(v8, "getUUIDBytes:", objc_msgSend(v9, "mutableBytes"));

    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v11 = +[HMSoftwareUpdateController namespace];
    uint64_t v12 = [v10 initWithNamespace:v11 data:v9];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSUUID *)v12;
  }
  return v6;
}

- (HMSoftwareUpdateController)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34 != -1) {
    dispatch_once(&logCategory__hmf_once_t34, &__block_literal_global_116);
  }
  v2 = (void *)logCategory__hmf_once_v35;

  return v2;
}

uint64_t __41__HMSoftwareUpdateController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v35;
  logCategory__hmf_once_uint64_t v35 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)namespace
{
  if (namespace_onceToken != -1) {
    dispatch_once(&namespace_onceToken, &__block_literal_global_15568);
  }
  v2 = (void *)namespace_namespace;

  return v2;
}

uint64_t __39__HMSoftwareUpdateController_namespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"514B3134-D00C-4B59-9FF6-7CA047DE7824"];
  uint64_t v1 = namespace_namespace;
  namespace_namespace = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end