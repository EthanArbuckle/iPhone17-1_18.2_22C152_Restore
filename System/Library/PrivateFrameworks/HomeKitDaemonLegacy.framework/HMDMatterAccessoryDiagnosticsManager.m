@interface HMDMatterAccessoryDiagnosticsManager
- (BOOL)isStarted;
- (HMDFileManager)fileManager;
- (HMDMatterAccessoryDiagnosticsManager)initWithAccessory:(id)a3;
- (HMSupportedAccessoryDiagnostics)supportedDiagnostics;
- (MTRDevice)matterDevice;
- (id)_diagnosticsMetadataFromFile:(id)a3 outError:(id *)a4;
- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4;
- (void)setFileManager:(id)a3;
- (void)setMatterDevice:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSupportedDiagnostics:(id)a3;
- (void)shutDown;
- (void)start;
@end

@implementation HMDMatterAccessoryDiagnosticsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_destroyWeak((id *)&self->_matterDevice);
  objc_storeStrong((id *)&self->_supportedDiagnostics, 0);
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setFileManager:(id)a3
{
}

- (HMDFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setMatterDevice:(id)a3
{
}

- (MTRDevice)matterDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matterDevice);
  return (MTRDevice *)WeakRetained;
}

- (void)setSupportedDiagnostics:(id)a3
{
}

- (HMSupportedAccessoryDiagnostics)supportedDiagnostics
{
  return self->_supportedDiagnostics;
}

- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) matterDevice];
  if (v2)
  {
    v3 = [*(id *)(a1 + 48) matterLogType];
    if (!v3)
    {
      v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v29 = v7;
        __int16 v30 = 2112;
        v31 = &unk_1F2DC71B0;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Invalid matter log type. Using type %@", buf, 0x16u);
      }
      v3 = &unk_1F2DC71B0;
    }
    v8 = [*(id *)(a1 + 48) delay];
    if (v8)
    {
      id v9 = [*(id *)(a1 + 48) delay];
      [v9 doubleValue];
      double v11 = v10;
    }
    else
    {
      double v11 = 300.0;
    }

    v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 32);
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [*(id *)(a1 + 48) matterLogType];
      v22 = [NSNumber numberWithDouble:v11];
      *(_DWORD *)buf = 138543874;
      v29 = v20;
      __int16 v30 = 2112;
      v31 = v21;
      __int16 v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Downloading matter log type: %@ for %@s", buf, 0x20u);
    }
    uint64_t v23 = [v3 integerValue];
    v24 = [*(id *)(a1 + 32) workQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_25;
    v26[3] = &unk_1E6A05D90;
    v25 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 32);
    id v27 = v25;
    [v2 downloadLogOfType:v23 timeout:v24 queue:v26 completion:v11];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Lost reference to the matter device", buf, 0xCu);
    }
    v16 = *(void **)(a1 + 40);
    v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    [v16 respondWithError:v3];
  }
}

void __85__HMDMatterAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Did download to URL: %@. Error: %@", buf, 0x20u);
  }
  if (v5)
  {
    double v11 = *(void **)(a1 + 32);
    id v16 = v6;
    id v12 = [v11 _diagnosticsMetadataFromFile:v5 outError:&v16];
    id v13 = v16;

    if (v12)
    {
      uint64_t v17 = *MEMORY[0x1E4F2C320];
      v14 = encodeRootObject();
      id v18 = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
    id v13 = v6;
  }
  [*(id *)(a1 + 40) respondWithPayload:v15 error:v13];
}

- (id)_diagnosticsMetadataFromFile:(id)a3 outError:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = HMDCreateHomeKitDaemonCacheDirectory();
  uint64_t v9 = [v7 fileURLWithPath:v8];

  double v10 = [(id)v9 URLByAppendingPathComponent:@"MatterDiagnostics"];

  double v11 = [(HMDMatterAccessoryDiagnosticsManager *)self fileManager];
  id v33 = 0;
  LOBYTE(v9) = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v33];
  id v12 = v33;
  if (v9)
  {
    id v13 = [v6 lastPathComponent];
    v14 = [v10 URLByAppendingPathComponent:v13];

    id v32 = v12;
    char v15 = [v11 copyItemAtURL:v6 toURL:v14 error:&v32];
    id v16 = v32;

    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = self;
    v19 = HMFGetOSLogHandle();
    v20 = v19;
    if (v15)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = HMFGetLogIdentifier();
        id v22 = [v14 path];
        *(_DWORD *)buf = 138543618;
        v35 = v21;
        __int16 v36 = 2112;
        v37 = v22;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating diagnostic metadata from path: %@", buf, 0x16u);
      }
      id v23 = objc_alloc(MEMORY[0x1E4F2E570]);
      id v24 = [v14 path];
      uint64_t v25 = (void *)[v23 initWithSnapshotPath:v24 urlParameters:0 privacyPolicyURL:0 uploadDestination:0 consentVersion:0 uploadType:0];
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v35 = v30;
        __int16 v36 = 2112;
        v37 = v14;
        __int16 v38 = 2112;
        id v39 = v16;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy file to path: %@ error: %@", buf, 0x20u);
      }
      uint64_t v25 = 0;
      if (a4) {
        *a4 = v16;
      }
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v35 = v29;
      __int16 v36 = 2112;
      v37 = v10;
      __int16 v38 = 2112;
      id v39 = v12;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at path: %@ error: %@", buf, 0x20u);
    }
    if (a4)
    {
      id v16 = v12;
      uint64_t v25 = 0;
      *a4 = v16;
    }
    else
    {
      uint64_t v25 = 0;
      id v16 = v12;
    }
  }

  return v25;
}

- (void)shutDown
{
  v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDMatterAccessoryDiagnosticsManager_shutDown__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __48__HMDMatterAccessoryDiagnosticsManager_shutDown__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isStarted];
  if (result)
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setStarted:0];
    return [*(id *)(a1 + 32) notifyClientsOfDiagnosticsTransferSupport:0 supportDiagnosticsTransfer:0];
  }
  return result;
}

- (void)start
{
  v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMDMatterAccessoryDiagnosticsManager_start__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __45__HMDMatterAccessoryDiagnosticsManager_start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isStarted] & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 32) setStarted:1];
    id v6 = *(void **)(a1 + 32);
    int v7 = [v6 supportedDiagnostics];
    [v6 notifyClientsOfDiagnosticsTransferSupport:1 supportDiagnosticsTransfer:v7];
  }
}

- (HMDMatterAccessoryDiagnosticsManager)initWithAccessory:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDMatterAccessoryDiagnosticsManager;
  id v3 = [(HMDAccessoryDiagnosticsManagerInternal *)&v9 initWithAccessory:a3];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F2EB60]) initWithSupportedTypes:1 format:2 audio:0 options:0];
    supportedDiagnostics = v3->_supportedDiagnostics;
    v3->_supportedDiagnostics = (HMSupportedAccessoryDiagnostics *)v4;

    id v6 = objc_alloc_init(HMDFileManager);
    fileManager = v3->_fileManager;
    v3->_fileManager = v6;
  }
  return v3;
}

@end