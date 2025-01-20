@interface HMDAccessoryDiagnosticsManager
- (BOOL)_isRequestSupported:(id)a3;
- (BOOL)cloudFetchCompleted;
- (BOOL)cloudFetchInProgress;
- (BOOL)didShutDown;
- (HMDAccessoryDiagnosticsManager)initWithAccessory:(id)a3 service:(id)a4;
- (HMDAccessoryDiagnosticsSettings)diagnosticsSettings;
- (HMDService)diagnosticsService;
- (id)attributeDescriptions;
- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3;
- (void)__fetchCloudDiagnosticsMetadataForAccessory:(id)a3 completion:(id)a4;
- (void)_callCompletionHandler:(id)a3 diagnostics:(id)a4 error:(id)a5;
- (void)_clearCurrentDiagnosticsSession:(id)a3;
- (void)_fetchCloudDiagnosticsMetadata;
- (void)_fetchModelDiagnosticsMetadataForAccessory:(id)a3 withCompletion:(id)a4;
- (void)_handleDiagnosticsTransferRequestWithOptions:(id)a3 completion:(id)a4;
- (void)_handleDiagnosticsTransferWithOptions:(id)a3 completion:(id)a4;
- (void)_invalidateCloudDiagnosticsMetadata;
- (void)_notifyClientsOfDiagnosticsTransferSupportUpdated;
- (void)_readDiagnosticsDataWithCloudKitMetadataRequirement:(BOOL)a3 completion:(id)a4;
- (void)_readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:(id)a3;
- (void)_registerForMessagesAndNotifications;
- (void)_shutDown;
- (void)_start;
- (void)_updateDiagnosticSettings;
- (void)dealloc;
- (void)handleAccessoryConfiguredNotification:(id)a3;
- (void)handleCharacteristicValueUpdatedNotification:(id)a3;
- (void)handleCharacteristicsUpdatedNotification:(id)a3;
- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4;
- (void)setCloudFetchCompleted:(BOOL)a3;
- (void)setCloudFetchInProgress:(BOOL)a3;
- (void)setDiagnosticsSettings:(id)a3;
- (void)setDidShutDown:(BOOL)a3;
- (void)shutDown;
- (void)start;
@end

@implementation HMDAccessoryDiagnosticsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsSettings, 0);
  objc_storeStrong((id *)&self->_diagnosticsService, 0);
}

- (void)setCloudFetchCompleted:(BOOL)a3
{
  self->_cloudFetchCompleted = a3;
}

- (BOOL)cloudFetchCompleted
{
  return self->_cloudFetchCompleted;
}

- (void)setCloudFetchInProgress:(BOOL)a3
{
  self->_cloudFetchInProgress = a3;
}

- (BOOL)cloudFetchInProgress
{
  return self->_cloudFetchInProgress;
}

- (void)setDidShutDown:(BOOL)a3
{
  self->_didShutDown = a3;
}

- (BOOL)didShutDown
{
  return self->_didShutDown;
}

- (void)setDiagnosticsSettings:(id)a3
{
}

- (HMDAccessoryDiagnosticsSettings)diagnosticsSettings
{
  return (HMDAccessoryDiagnosticsSettings *)objc_getProperty(self, a2, 64, 1);
}

- (HMDService)diagnosticsService
{
  return (HMDService *)objc_getProperty(self, a2, 56, 1);
}

- (void)_clearCurrentDiagnosticsSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDAccessoryDiagnosticsManagerInternal *)self currentDiagnosticsSession];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(HMDAccessoryDiagnosticsManagerInternal *)v8 currentDiagnosticsSession];
      int v13 = 138543874;
      v14 = v10;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Clear current session: %@ with error: %@", (uint8_t *)&v13, 0x20u);
    }
    v12 = [(HMDAccessoryDiagnosticsManagerInternal *)v8 currentDiagnosticsSession];
    [v12 shutDown];

    [(HMDAccessoryDiagnosticsManagerInternal *)v8 setCurrentDiagnosticsSession:0];
  }
}

- (void)_readDiagnosticsDataWithCloudKitMetadataRequirement:(BOOL)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self currentDiagnosticsSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Read diagnostics data for session: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke;
  v16[3] = &unk_1E6A117D0;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v6;
  id v17 = v15;
  BOOL v19 = a3;
  [v10 readDataWithCompletion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v11);

  if (v7)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = WeakRetained;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v15;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics data read failed with error: %@", buf, 0x16u);
    }
    [v13 _clearCurrentDiagnosticsSession:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    v16 = [WeakRetained accessory];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke_37;
    v26[3] = &unk_1E6A117A8;
    objc_copyWeak(&v30, (id *)(a1 + 40));
    id v29 = *(id *)(a1 + 32);
    id v27 = v8;
    id v28 = v9;
    [WeakRetained _fetchModelDiagnosticsMetadataForAccessory:v16 withCompletion:v26];

    objc_destroyWeak(&v30);
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = WeakRetained;
    BOOL v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [v18 currentDiagnosticsSession];
      *(_DWORD *)buf = 138543618;
      v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Diagnostics metadata not required for session:%@", buf, 0x16u);
    }
    id v22 = objc_alloc(MEMORY[0x1E4F2E570]);
    id v23 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F2C9F1A8];
    uint64_t v24 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F2C9F1A8];
    v25 = (void *)[v22 initWithSnapshotPath:v8 urlParameters:v9 privacyPolicyURL:v23 uploadDestination:v24 consentVersion:&unk_1F2DC8DD0 uploadType:&unk_1F2DC8DD0];

    [v18 _clearCurrentDiagnosticsSession:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = WeakRetained;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching cloud metadata from model failed with error: %@", buf, 0x16u);
    }
    [v10 _clearCurrentDiagnosticsSession:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v25 = objc_alloc(MEMORY[0x1E4F2E570]);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = [v5 privacyPolicyURL];
    v16 = [v5 uploadDestination];
    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "consentVersion"));
    id v26 = v5;
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "uploadType"));
    BOOL v19 = (void *)[v25 initWithSnapshotPath:v13 urlParameters:v14 privacyPolicyURL:v15 uploadDestination:v16 consentVersion:v17 uploadType:v18];

    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = WeakRetained;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v21 currentDiagnosticsSession];
      *(_DWORD *)buf = 138543874;
      id v28 = v23;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Diagnostics data read completed for session:%@ metadata:%@", buf, 0x20u);
    }
    [v21 _clearCurrentDiagnosticsSession:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    id v5 = v26;
  }
}

- (void)_handleDiagnosticsTransferRequestWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v53 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Attempting to start diagnostics transfer", buf, 0xCu);
  }
  if ([(HMDAccessoryDiagnosticsManager *)v10 _isRequestSupported:v6])
  {
    uint64_t v13 = [(HMDAccessoryDiagnosticsManager *)v10 diagnosticsSettings];
    uint64_t v14 = [v13 transport];
    BOOL v15 = v14 == @"DataStream";

    if (v15)
    {
      id v27 = [(HMDAccessoryDiagnosticsManagerInternal *)v10 currentDiagnosticsSession];

      if (v27)
      {
        id v28 = (void *)MEMORY[0x1D9452090]();
        __int16 v29 = v10;
        id v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v53 = v31;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@A session is already opened", buf, 0xCu);
        }
        v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
        v7[2](v7, v32, 0);
      }
      else if ([(HMDAccessoryDiagnosticsManager *)v10 cloudFetchCompleted])
      {
        uint64_t v33 = [HMDAccessoryDiagnosticsSession alloc];
        id v34 = [(HMDAccessoryDiagnosticsManagerInternal *)v10 accessory];
        uint64_t v35 = [(HMDAccessoryDiagnosticsManager *)v10 diagnosticsSettings];
        v36 = [(HMDAccessoryDiagnosticsSession *)v33 initWithAccessory:v34 settings:v35];
        [(HMDAccessoryDiagnosticsManagerInternal *)v10 setCurrentDiagnosticsSession:v36];

        v37 = (void *)MEMORY[0x1D9452090]();
        v38 = v10;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v40 = HMFGetLogIdentifier();
          v41 = [(HMDAccessoryDiagnosticsManagerInternal *)v38 currentDiagnosticsSession];
          *(_DWORD *)buf = 138543618;
          v53 = v40;
          __int16 v54 = 2112;
          v55 = v41;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Setting up a diagnostics transfer session: %@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, v38);
        v42 = [(HMDAccessoryDiagnosticsManagerInternal *)v38 currentDiagnosticsSession];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __90__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferRequestWithOptions_completion___block_invoke;
        v48[3] = &unk_1E6A159F8;
        objc_copyWeak(&v51, (id *)buf);
        v50 = v7;
        id v49 = v6;
        [v42 setUpWithOptions:v49 completion:v48];

        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v43 = (void *)MEMORY[0x1D9452090]();
        v44 = v10;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v53 = v46;
          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Diagnostic cloud metadata not available", buf, 0xCu);
        }
        if (![(HMDAccessoryDiagnosticsManager *)v44 cloudFetchInProgress]) {
          [(HMDAccessoryDiagnosticsManager *)v44 _fetchCloudDiagnosticsMetadata];
        }
        v47 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        v7[2](v7, v47, 0);
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = v10;
      BOOL v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v53 = v20;
        __int16 v54 = 2112;
        v55 = v16;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Transport is not data stream, error: %@", buf, 0x16u);
      }
      id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      v7[2](v7, v21, 0);
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = v10;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics transfer failed as the request is not supported.", buf, 0xCu);
    }
    id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    v7[2](v7, v26, 0);
  }
}

void __90__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferRequestWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [WeakRetained currentDiagnosticsSession];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = WeakRetained;
    v12 = HMFGetOSLogHandle();
    uint64_t v13 = v12;
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v23 = 138543618;
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        id v26 = v5;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup data transfer session with error: %@", (uint8_t *)&v23, 0x16u);
      }
      [v11 _clearCurrentDiagnosticsSession:v5];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v23 = 138543362;
        uint64_t v24 = v20;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Diagnostics transfer session was setup successfully", (uint8_t *)&v23, 0xCu);
      }
      id v21 = *(void **)(a1 + 32);
      if (v21) {
        uint64_t v22 = [v21 metadataRequired];
      }
      else {
        uint64_t v22 = 1;
      }
      [v11 _readDiagnosticsDataWithCloudKitMetadataRequirement:v22 completion:*(void *)(a1 + 40)];
    }
  }
  else
  {
    BOOL v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = WeakRetained;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup data transfer session, current diagnostics session is nil", (uint8_t *)&v23, 0xCu);
    }
    BOOL v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:-1 userInfo:0];
    [v16 _clearCurrentDiagnosticsSession:v19];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryDiagnosticsManager *)self diagnosticsService];
  id v7 = [v6 findCharacteristicWithType:*MEMORY[0x1E4F2CFC8]];

  if (v7)
  {
    id v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
    id v9 = [v7 value];

    if (v9)
    {
      [(HMDAccessoryDiagnosticsManager *)self _updateDiagnosticSettings];
    }
    else if ([v8 isReachable])
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        BOOL v15 = [v8 identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Attempting to read and update the diagnostic settings for %@", buf, 0x16u);
      }
      id v16 = +[HMDCharacteristicRequest requestWithCharacteristic:v7];
      objc_initWeak((id *)buf, v12);
      uint64_t v22 = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      id v18 = [(HMDAccessoryDiagnosticsManagerInternal *)v12 workQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __95__HMDAccessoryDiagnosticsManager__readRequiredDiagnosticCharacteristicsIfNeededWithCompletion___block_invoke;
      v19[3] = &unk_1E6A18FF8;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v4;
      [v8 readCharacteristicValues:v17 source:7 queue:v18 completionHandler:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);

      goto LABEL_10;
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_10:

    goto LABEL_11;
  }
  id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*((void (**)(id, void *))v4 + 2))(v4, v10);

LABEL_11:
}

void __95__HMDAccessoryDiagnosticsManager__readRequiredDiagnosticCharacteristicsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v5);

    id v6 = [v11 firstObject];
    id v7 = [v6 error];

    if (!v7) {
      [v4 _updateDiagnosticSettings];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v6 error];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
  }
}

- (BOOL)_isRequestSupported:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryDiagnosticsManager *)self diagnosticsSettings];
  id v6 = [v5 currentSnapshot];

  if (v6)
  {
    if (v4)
    {
      id v7 = [(HMDAccessoryDiagnosticsManager *)self diagnosticsSettings];
      uint64_t v8 = [v7 currentSnapshot];

      uint64_t v9 = [v4 logSize];
      if (!v9
        || (uint64_t v10 = (void *)v9,
            [v8 options],
            id v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 value],
            v11,
            v10,
            (v12 & 2) != 0))
      {
        uint64_t v23 = [v4 delay];
        if (!v23
          || (uint64_t v24 = (void *)v23,
              [v8 options],
              __int16 v25 = objc_claimAutoreleasedReturnValue(),
              char v26 = [v25 value],
              v25,
              v24,
              (v26 & 1) != 0))
        {
          if (![v4 recordAudio]
            || ([v8 audioDiagnostics],
                v32 = objc_claimAutoreleasedReturnValue(),
                char v33 = [v32 value],
                v32,
                (v33 & 1) != 0))
          {
            if (![v4 enableAudioClips]
              || ([v8 audioDiagnostics],
                  uint64_t v35 = objc_claimAutoreleasedReturnValue(),
                  char v36 = [v35 value],
                  v35,
                  (v36 & 2) != 0))
            {
              if ([v4 snapshotType] != 1
                || ([v8 type],
                    v38 = objc_claimAutoreleasedReturnValue(),
                    char v39 = [v38 value],
                    v38,
                    (v39 & 1) != 0))
              {
                if ([v4 snapshotType] != 2
                  || ([v8 type],
                      v41 = objc_claimAutoreleasedReturnValue(),
                      char v42 = [v41 value],
                      v41,
                      (v42 & 2) != 0))
                {
                  BOOL v22 = 1;
                  goto LABEL_35;
                }
                uint64_t v13 = (void *)MEMORY[0x1D9452090]();
                v43 = self;
                BOOL v15 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  id v16 = HMFGetLogIdentifier();
                  int v45 = 138543362;
                  v46 = v16;
                  id v17 = "%{public}@ADK snapshot requested, but not supported on the accessory.";
                  goto LABEL_33;
                }
              }
              else
              {
                uint64_t v13 = (void *)MEMORY[0x1D9452090]();
                v40 = self;
                BOOL v15 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  id v16 = HMFGetLogIdentifier();
                  int v45 = 138543362;
                  v46 = v16;
                  id v17 = "%{public}@Manufacturer snapshot requested, but not supported on the accessory.";
                  goto LABEL_33;
                }
              }
            }
            else
            {
              uint64_t v13 = (void *)MEMORY[0x1D9452090]();
              v37 = self;
              BOOL v15 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                id v16 = HMFGetLogIdentifier();
                int v45 = 138543362;
                v46 = v16;
                id v17 = "%{public}@Audio clips requested, but not supported on the accessory.";
                goto LABEL_33;
              }
            }
          }
          else
          {
            uint64_t v13 = (void *)MEMORY[0x1D9452090]();
            id v34 = self;
            BOOL v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = HMFGetLogIdentifier();
              int v45 = 138543362;
              v46 = v16;
              id v17 = "%{public}@Audio recording requested, but not supported on the accessory.";
              goto LABEL_33;
            }
          }
        }
        else
        {
          uint64_t v13 = (void *)MEMORY[0x1D9452090]();
          uint64_t v27 = self;
          BOOL v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = HMFGetLogIdentifier();
            int v45 = 138543362;
            v46 = v16;
            id v17 = "%{public}@Delay requested, but not supported on the accessory.";
            goto LABEL_33;
          }
        }
      }
      else
      {
        uint64_t v13 = (void *)MEMORY[0x1D9452090]();
        uint64_t v14 = self;
        BOOL v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = HMFGetLogIdentifier();
          int v45 = 138543362;
          v46 = v16;
          id v17 = "%{public}@Custom max log size requested, but not supported on the accessory.";
LABEL_33:
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v45, 0xCu);
        }
      }

      BOOL v22 = 0;
LABEL_35:

      goto LABEL_36;
    }
    id v28 = (void *)MEMORY[0x1D9452090]();
    __int16 v29 = self;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      __int16 v31 = HMFGetLogIdentifier();
      int v45 = 138543362;
      v46 = v31;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@No options selected, default request will be issued.", (uint8_t *)&v45, 0xCu);
    }
    BOOL v22 = 1;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    BOOL v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = HMFGetLogIdentifier();
      int v45 = 138543362;
      v46 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Diagnostic settings not configured yet", (uint8_t *)&v45, 0xCu);
    }
    BOOL v22 = 0;
  }
LABEL_36:

  return v22;
}

- (void)_notifyClientsOfDiagnosticsTransferSupportUpdated
{
  v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  id v4 = [(HMDAccessoryDiagnosticsManager *)self diagnosticsSettings];
  id v5 = [v4 currentSnapshot];
  BOOL v6 = v5 != 0;

  id v7 = [v8 supportedDiagnostics];
  [(HMDAccessoryDiagnosticsManagerInternal *)self notifyClientsOfDiagnosticsTransferSupport:v6 supportDiagnosticsTransfer:v7];
}

- (void)_updateDiagnosticSettings
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryDiagnosticsManager *)self diagnosticsService];
  id v5 = [v4 findCharacteristicWithType:*MEMORY[0x1E4F2CFC8]];

  BOOL v6 = [v5 value];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F5BE38];
    id v8 = [v5 value];
    id v52 = 0;
    uint64_t v9 = [v7 parsedFromData:v8 error:&v52];
    id v10 = v52;

    id v11 = [v9 format];
    if (v11
      || ([v9 type], (id v11 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v9 options], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      uint64_t v35 = [v9 audioDiagnostics];

      if (!v35)
      {
        char v36 = (void *)MEMORY[0x1D9452090]();
        v37 = self;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = id v51 = v10;
          [(HMDAccessoryDiagnosticsManagerInternal *)v37 accessory];
          v40 = id v49 = v36;
          v41 = [v40 name];
          char v42 = [(HMDAccessoryDiagnosticsManagerInternal *)v37 accessory];
          v43 = [v42 uuid];
          v44 = [v43 UUIDString];
          *(_DWORD *)buf = 138544130;
          __int16 v54 = v39;
          __int16 v55 = 2112;
          uint64_t v56 = v41;
          __int16 v57 = 2112;
          uint64_t v58 = (uint64_t)v44;
          __int16 v59 = 2112;
          v60 = v51;
          _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse accessory supported diagnostics snapshot (%@/%@) with error: %@", buf, 0x2Au);

          char v36 = v49;
          id v10 = v51;
        }

        goto LABEL_10;
      }
    }
    char v12 = [(HMDAccessoryDiagnosticsManager *)self diagnosticsSettings];
    uint64_t v13 = [v12 currentSnapshot];
    char v14 = [v13 isEqual:v9];

    if ((v14 & 1) == 0)
    {
      BOOL v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v45 = HMFGetLogIdentifier();
        uint64_t v47 = [(HMDAccessoryDiagnosticsManagerInternal *)v16 accessory];
        id v18 = [v47 name];
        [(HMDAccessoryDiagnosticsManagerInternal *)v16 accessory];
        v46 = v48 = v15;
        BOOL v19 = [v46 uuid];
        uint64_t v20 = [v19 UUIDString];
        [(HMDAccessoryDiagnosticsManager *)v16 diagnosticsSettings];
        id v21 = v50 = v10;
        BOOL v22 = [v21 currentSnapshot];
        *(_DWORD *)buf = 138544386;
        __int16 v54 = v45;
        __int16 v55 = 2112;
        uint64_t v56 = v18;
        __int16 v57 = 2112;
        uint64_t v58 = v20;
        uint64_t v23 = (void *)v20;
        __int16 v59 = 2112;
        v60 = v22;
        __int16 v61 = 2112;
        v62 = v9;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating accessory diagnostics snapshot for %@/%@: %@ -> %@", buf, 0x34u);

        id v10 = v50;
        BOOL v15 = v48;
      }
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
      [(HMDAccessoryDiagnosticsManager *)v16 _clearCurrentDiagnosticsSession:v24];

      __int16 v25 = [(HMDAccessoryDiagnosticsManager *)v16 diagnosticsSettings];
      [v25 setCurrentSnapshot:v9];

      [(HMDAccessoryDiagnosticsManager *)v16 _notifyClientsOfDiagnosticsTransferSupportUpdated];
    }
LABEL_10:

    goto LABEL_14;
  }
  char v26 = (void *)MEMORY[0x1D9452090]();
  uint64_t v27 = self;
  id v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    __int16 v29 = HMFGetLogIdentifier();
    id v30 = [(HMDAccessoryDiagnosticsManagerInternal *)v27 accessory];
    __int16 v31 = [v30 name];
    v32 = [(HMDAccessoryDiagnosticsManagerInternal *)v27 accessory];
    char v33 = [v32 uuid];
    id v34 = [v33 UUIDString];
    *(_DWORD *)buf = 138543874;
    __int16 v54 = v29;
    __int16 v55 = 2112;
    uint64_t v56 = v31;
    __int16 v57 = 2112;
    uint64_t v58 = (uint64_t)v34;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@No diagnostics supported configuration (%@/%@)", buf, 0x20u);
  }
LABEL_14:
}

- (void)_registerForMessagesAndNotifications
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_handleCharacteristicsUpdatedNotification_ name:@"kHMDNotificationCharacteristicsUpdated" object:v3];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_handleCharacteristicValueUpdatedNotification_ name:@"HMDNotificationCharacteristicValueUpdated" object:v3];

  BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_handleAccessoryConfiguredNotification_ name:@"HMDAccessoryConnectedNotification" object:v3];

  uint64_t v7 = [v3 findCharacteristicType:*MEMORY[0x1E4F2CFC8] forServiceType:*MEMORY[0x1E4F2DE10]];
  id v8 = (void *)v7;
  if (v7)
  {
    v24[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v10 = [(HMDAccessoryDiagnosticsManagerInternal *)self clientIdentifier];
    [v3 setNotificationsEnabled:1 forCharacteristics:v9 clientIdentifier:v10];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    char v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v14 = HMFGetLogIdentifier();
      BOOL v15 = [v3 name];
      id v16 = [v3 uuid];
      id v17 = [v16 UUIDString];
      int v18 = 138543874;
      BOOL v19 = v14;
      __int16 v20 = 2112;
      id v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Expected diagnostics characteristic not present for accessory(%@/%@)", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)_shutDown
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDAccessoryDiagnosticsManager *)self didShutDown]) {
    _HMFPreconditionFailure();
  }
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Shutting down", (uint8_t *)&v8, 0xCu);
  }
  [(HMDAccessoryDiagnosticsManager *)v5 _clearCurrentDiagnosticsSession:0];
  [(HMDAccessoryDiagnosticsManager *)v5 setDiagnosticsSettings:0];
  [(HMDAccessoryDiagnosticsManager *)v5 setDidShutDown:1];
  [(HMDAccessoryDiagnosticsManager *)v5 _notifyClientsOfDiagnosticsTransferSupportUpdated];
  [(HMDAccessoryDiagnosticsManager *)v5 _invalidateCloudDiagnosticsMetadata];
}

- (void)_start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDAccessoryDiagnosticsManager *)self didShutDown]) {
    _HMFPreconditionFailure();
  }
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v11 = 138543362;
    char v12 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v11, 0xCu);
  }
  [(HMDAccessoryDiagnosticsManager *)v5 _registerForMessagesAndNotifications];
  int v8 = [HMDAccessoryDiagnosticsSettings alloc];
  uint64_t v9 = [(HMDAccessoryDiagnosticsManager *)v5 diagnosticsService];
  uint64_t v10 = [(HMDAccessoryDiagnosticsSettings *)v8 initWithService:v9];
  [(HMDAccessoryDiagnosticsManager *)v5 setDiagnosticsSettings:v10];

  [(HMDAccessoryDiagnosticsManager *)v5 _updateDiagnosticSettings];
  [(HMDAccessoryDiagnosticsManager *)v5 _fetchCloudDiagnosticsMetadata];
}

- (void)_handleDiagnosticsTransferWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferWithOptions_completion___block_invoke;
  v11[3] = &unk_1E6A18500;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [(HMDAccessoryDiagnosticsManager *)self _readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __83__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v5;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to read the required diagnostic characteristics. Error: %@", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [WeakRetained _handleDiagnosticsTransferRequestWithOptions:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_2;
  v3[3] = &unk_1E6A11780;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _handleDiagnosticsTransferWithOptions:v2 completion:v3];
}

void __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543874;
      id v17 = v10;
      __int16 v18 = 2112;
      BOOL v19 = v11;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics transfer request failed for message: %@. Error: %@.", buf, 0x20u);
    }
  }
  if (v6)
  {
    uint64_t v14 = *MEMORY[0x1E4F2C320];
    id v12 = encodeRootObject();
    BOOL v15 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  }
  else
  {
    id v13 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:error:", v13, v5, v14);
}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) diagnosticsService];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [v4 supportedDiagnostics];

      if (!v7)
      {
        id v8 = *(void **)(a1 + 40);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke_2;
        v9[3] = &unk_1E6A197F0;
        v9[4] = v8;
        [v8 _readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:v9];
      }
    }
  }
}

void __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to read the required diagnostic characteristics with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)handleCharacteristicValueUpdatedNotification:(id)a3
{
  id v4 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HMDAccessoryDiagnosticsManager_handleCharacteristicValueUpdatedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDAccessoryDiagnosticsManager_handleCharacteristicValueUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDiagnosticSettings];
}

- (void)handleCharacteristicsUpdatedNotification:(id)a3
{
  id v4 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__HMDAccessoryDiagnosticsManager_handleCharacteristicsUpdatedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __75__HMDAccessoryDiagnosticsManager_handleCharacteristicsUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDiagnosticSettings];
}

- (void)shutDown
{
  id v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HMDAccessoryDiagnosticsManager_shutDown__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __42__HMDAccessoryDiagnosticsManager_shutDown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutDown];
}

- (void)start
{
  id v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HMDAccessoryDiagnosticsManager_start__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__HMDAccessoryDiagnosticsManager_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)dealloc
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  uint64_t v4 = [v3 findCharacteristicType:*MEMORY[0x1E4F2CFC8] forServiceType:*MEMORY[0x1E4F2DE10]];
  id v5 = (void *)v4;
  if (v4)
  {
    v21[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v7 = [(HMDAccessoryDiagnosticsManagerInternal *)self clientIdentifier];
    [v3 setNotificationsEnabled:0 forCharacteristics:v6 clientIdentifier:v7];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Not disabling notification since diagnostics snapshot characteristic is not present", buf, 0xCu);
    }
  }
  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v15;
    __int16 v19 = 2048;
    __int16 v20 = v13;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory diagnostics manager: %p destroyed", buf, 0x16u);
  }

  v16.receiver = v13;
  v16.super_class = (Class)HMDAccessoryDiagnosticsManager;
  [(HMDAccessoryDiagnosticsManager *)&v16 dealloc];
}

- (id)attributeDescriptions
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryDiagnosticsManager;
  id v3 = [(HMDAccessoryDiagnosticsManagerInternal *)&v16 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v5 = [(HMDAccessoryDiagnosticsManager *)self diagnosticsSettings];
  id v6 = (void *)[v4 initWithName:@"Diagnostics Settings" value:v5];
  v17[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self currentDiagnosticsSession];
  id v9 = (void *)[v7 initWithName:@"Diagnostics Session" value:v8];
  v17[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAccessoryDiagnosticsManager *)self didShutDown];
  id v11 = HMFBooleanToString();
  uint64_t v12 = (void *)[v10 initWithName:@"didShutDown" value:v11];
  v17[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  uint64_t v14 = [v3 arrayByAddingObjectsFromArray:v13];

  return v14;
}

- (HMDAccessoryDiagnosticsManager)initWithAccessory:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v8 && (isKindOfClass & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDAccessoryDiagnosticsManager;
    id v10 = [(HMDAccessoryDiagnosticsManagerInternal *)&v15 initWithAccessory:v8];
    id v11 = v10;
    if (v10) {
      objc_storeStrong((id *)&v10->_diagnosticsService, a4);
    }

    return v11;
  }
  else
  {
    id v13 = (HMDThreadNetworkMetadataStore *)_HMFPreconditionFailure();
    [(HMDThreadNetworkMetadataStore *)v13 .cxx_destruct];
  }
  return result;
}

- (void)_invalidateCloudDiagnosticsMetadata
{
  id v3 = +[HMDNetworkRouterFirewallRuleManager sharedInstance];
  [v3 shutdownForClient:self];
}

- (void)_callCompletionHandler:(id)a3 diagnostics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HMDAccessoryDiagnosticsManager_Cloud___callCompletionHandler_diagnostics_error___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v17 = v10;
  id v18 = v8;
  id v16 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

uint64_t __82__HMDAccessoryDiagnosticsManager_Cloud___callCompletionHandler_diagnostics_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_fetchModelDiagnosticsMetadataForAccessory:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = +[HMDNetworkRouterFirewallRuleManager sharedInstance];
  id v10 = [v6 metadataIdentifier];
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_super v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      char v26 = v10;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Fetching diagnostics parameters locally for accessory with identifier %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v12);
    id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__HMDAccessoryDiagnosticsManager_Cloud___fetchModelDiagnosticsMetadataForAccessory_withCompletion___block_invoke;
    v19[3] = &unk_1E6A15720;
    objc_copyWeak(&v22, (id *)buf);
    id v20 = v10;
    id v21 = v7;
    [v9 fetchPairedMetadataVersionConfigurationsForAccessories:v16 completion:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v17;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to get cloud diagnostics parameters due to failure to derive identifier for accessory", buf, 0xCu);
    }
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v18);
  }
}

void __99__HMDAccessoryDiagnosticsManager_Cloud___fetchModelDiagnosticsMetadataForAccessory_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 32);
      int v39 = 138543874;
      v40 = v11;
      __int16 v41 = 2112;
      char v42 = v12;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetched accessory metadata for %@ failed with error %@", (uint8_t *)&v39, 0x20u);
    }
    [v9 _callCompletionHandler:*(void *)(a1 + 40) diagnostics:0 error:v6];
  }
  else if (v5)
  {
    id v13 = [v5 allObjects];
    id v14 = [v13 firstObject];

    objc_super v15 = [v14 diagnostics];

    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = WeakRetained;
    id v18 = HMFGetOSLogHandle();
    __int16 v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        id v21 = [v14 diagnostics];
        id v22 = *(void **)(a1 + 32);
        int v39 = 138543874;
        v40 = v20;
        __int16 v41 = 2112;
        char v42 = v21;
        __int16 v43 = 2112;
        id v44 = v22;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetched diagnostics metadata %@ from model for accessory with identifier %@", (uint8_t *)&v39, 0x20u);
      }
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v24 = [v14 diagnostics];
      __int16 v25 = v17;
      uint64_t v26 = v23;
      uint64_t v27 = v24;
      id v28 = 0;
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        char v36 = HMFGetLogIdentifier();
        v37 = *(void **)(a1 + 32);
        int v39 = 138543618;
        v40 = v36;
        __int16 v41 = 2112;
        char v42 = v37;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics metadata not present in version configuration for accessory %@", (uint8_t *)&v39, 0x16u);
      }
      uint64_t v38 = *(void *)(a1 + 40);
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      __int16 v25 = v17;
      uint64_t v26 = v38;
      uint64_t v27 = 0;
      id v28 = v24;
    }
    [v25 _callCompletionHandler:v26 diagnostics:v27 error:v28];
  }
  else
  {
    __int16 v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = WeakRetained;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      char v33 = *(void **)(a1 + 32);
      int v39 = 138543618;
      v40 = v32;
      __int16 v41 = 2112;
      char v42 = v33;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Fetched accessory metadata for %@ failed due to nil metadata", (uint8_t *)&v39, 0x16u);
    }
    uint64_t v34 = *(void *)(a1 + 40);
    uint64_t v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v30 _callCompletionHandler:v34 diagnostics:0 error:v35];
  }
}

- (void)__fetchCloudDiagnosticsMetadataForAccessory:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[HMDNetworkRouterFirewallRuleManager sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke;
  v9[3] = &unk_1E6A18F68;
  id v10 = v6;
  id v11 = v5;
  v9[4] = self;
  id v7 = v6;
  id v8 = v5;
  [v7 startupForClient:self completion:v9];
}

void __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up firewall rule manager: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke_4;
    v9[3] = &unk_1E6A121F0;
    id v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    [v8 fetchCloudChangesWithCompletion:v9];
  }
}

void __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch changes from firewall rule manager: %@", (uint8_t *)&v12, 0x16u);
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
}

- (void)_fetchCloudDiagnosticsMetadata
{
  [(HMDAccessoryDiagnosticsManager *)self setCloudFetchInProgress:1];
  objc_initWeak(&location, self);
  id v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke;
  v4[3] = &unk_1E6A18528;
  objc_copyWeak(&v5, &location);
  [(HMDAccessoryDiagnosticsManager *)self __fetchCloudDiagnosticsMetadataForAccessory:v3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = v5;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v14 = v9;
        __int16 v15 = 2112;
        id v16 = v3;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud diagnostics metadata with error: %@", buf, 0x16u);
      }
      [v7 setCloudFetchInProgress:0];
    }
    else
    {
      id v10 = [WeakRetained workQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke_1;
      v11[3] = &unk_1E6A197C8;
      void v11[4] = v5;
      id v12 = 0;
      dispatch_async(v10, v11);
    }
  }
}

uint64_t __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke_1(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) accessory];
    id v7 = [v6 name];
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138543874;
    id v11 = v5;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@fetching diagnostics cloud metadata for accessory %@ completed with error: %@", (uint8_t *)&v10, 0x20u);
  }
  return [*(id *)(a1 + 32) setCloudFetchCompleted:1];
}

- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3
{
  id v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  id v4 = [v3 metadataIdentifier];

  if (v4) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  }
  else {
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

@end