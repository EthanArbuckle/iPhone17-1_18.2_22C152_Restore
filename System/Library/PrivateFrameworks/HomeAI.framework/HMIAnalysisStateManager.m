@interface HMIAnalysisStateManager
- (HMIAnalysisStateManager)initWithHomeUUID:(id)a3;
- (HMIAnalysisStateManagerDelegate)delegate;
- (NSUUID)homeUUID;
- (id)stateUpdateFromFaceEvents:(id)a3;
- (void)handleRemoteStateUpdate:(id)a3;
- (void)handleRemoteStateUpdate:(id)a3 completionHandler:(id)a4;
- (void)publishLocalState:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMIAnalysisStateManager

- (HMIAnalysisStateManager)initWithHomeUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIAnalysisStateManager;
  v5 = [(HMIAnalysisStateManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v6;
  }
  return v5;
}

- (void)publishLocalState:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A641C70]();
  uint64_t v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Publishing local state", (uint8_t *)&v10, 0xCu);
  }
  objc_super v9 = [(HMIAnalysisStateManager *)v6 delegate];
  [v9 stateManager:v6 didReceiveLocalUpdate:v4];
}

- (void)handleRemoteStateUpdate:(id)a3
{
}

- (void)handleRemoteStateUpdate:(id)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMIPreference sharedInstance];
  char v9 = [v8 shouldEnableTorsoRecognition];

  if (v9)
  {
    int v10 = [v6 torsoAnnotations];
    v11 = objc_msgSend(v10, "na_filter:", &__block_literal_global_40);

    uint64_t v12 = [v6 torsoAnnotations];
    uint64_t v13 = [v12 count];
    uint64_t v14 = [v11 count];

    if (v13 == v14) {
      goto LABEL_10;
    }
    v15 = (void *)MEMORY[0x22A641C70]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      v34 = [v6 torsoAnnotations];
      uint64_t v19 = [v34 count];
      uint64_t v20 = v19 - [v11 count];
      v21 = [v6 torsoAnnotations];
      *(_DWORD *)buf = 138543874;
      v40 = v18;
      __int16 v41 = 2048;
      uint64_t v42 = v20;
      __int16 v43 = 2048;
      uint64_t v44 = [v21 count];
      _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropped %lu incompatible torsoprint annotations out of %lu total", buf, 0x20u);
    }
    if (!objc_msgSend(v11, "hmf_isEmpty"))
    {
LABEL_10:
      v26 = +[HMITaskService taskServiceClient];
      v38[0] = HMITaskTypeUpdateTorsoModelTask;
      v37[0] = @"taskType";
      v37[1] = @"homeUUID";
      v27 = [(HMIAnalysisStateManager *)self homeUUID];
      v37[2] = @"torsoAnnotations";
      v38[1] = v27;
      v38[2] = v11;
      v28 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __69__HMIAnalysisStateManager_handleRemoteStateUpdate_completionHandler___block_invoke_44;
      v35[3] = &unk_26477D550;
      v35[4] = self;
      id v36 = v7;
      int v29 = [v26 submitTaskWithOptions:v28 progressHandler:0 completionHandler:v35];
      v30 = (void *)MEMORY[0x22A641C70]();
      v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        __int16 v41 = 1024;
        LODWORD(v42) = v29;
        _os_log_impl(&dword_225DC6000, v32, OS_LOG_TYPE_INFO, "%{public}@Submitted torso model update task, taskID:%u", buf, 0x12u);
      }
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x22A641C70]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v40 = v25;
      _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Dropping remote analysis torso update since torso rec is not enabled on this device", buf, 0xCu);
    }
  }
}

uint64_t __69__HMIAnalysisStateManager_handleRemoteStateUpdate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 torsoModelVersion];
  v3 = +[HMITorsoprinter currentModelUUID];
  uint64_t v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

void __69__HMIAnalysisStateManager_handleRemoteStateUpdate_completionHandler___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:@"resultCode"];
  v8 = HMITaskResultCodeAsString(0);
  int v9 = [v7 isEqualToString:v8];

  int v10 = (void *)MEMORY[0x22A641C70]();
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v14;
      v15 = "%{public}@Successfully update torso model";
      v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
      uint32_t v18 = 12;
LABEL_6:
      _os_log_impl(&dword_225DC6000, v16, v17, v15, (uint8_t *)&v21, v18);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v14;
    __int16 v23 = 2112;
    id v24 = v6;
    v15 = "%{public}@Error in update torso model, error:%@";
    v16 = v13;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    uint32_t v18 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, v19, v20);
}

- (id)stateUpdateFromFaceEvents:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_msgSend(a3, "na_map:", &__block_literal_global_48);
  id v5 = [v3 setWithArray:v4];

  if (v5 && (objc_msgSend(v5, "hmf_isEmpty") & 1) == 0) {
    id v6 = [[HMIAnalysisStateUpdate alloc] initWithTorsoAnnotations:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

uint64_t __53__HMIAnalysisStateManager_stateUpdateFromFaceEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 torsoAnnotation];
}

- (HMIAnalysisStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIAnalysisStateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end