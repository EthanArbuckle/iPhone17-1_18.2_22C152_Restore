@interface HMMTRAttestationStatus
- (HMMTRAccessoryServer)accessoryServer;
- (HMMTRAttestationStatus)initWithQueue:(id)a3 uiDialogPresenter:(id)a4 failSafeExpiryTimeoutSecs:(id)a5;
- (HMMTRUIDialogPresenter)uiDialogPresenter;
- (NSNumber)failSafeExpiryTimeoutSecs;
- (OS_dispatch_queue)clientQueue;
- (id)userAuthorizationDelegate;
- (void)_requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4;
- (void)deviceAttestationCompletedForController:(id)a3 opaqueDeviceHandle:(void *)a4 attestationDeviceInfo:(id)a5 error:(id)a6;
- (void)populateDelegate:(id)a3;
- (void)setAccessoryServer:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setUiDialogPresenter:(id)a3;
- (void)setUserAuthorizationDelegate:(id)a3;
@end

@implementation HMMTRAttestationStatus

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userAuthorizationDelegate, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
  objc_storeStrong((id *)&self->_accessoryServer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_failSafeExpiryTimeoutSecs, 0);
}

- (id)userAuthorizationDelegate
{
  return self->_userAuthorizationDelegate;
}

- (void)setUiDialogPresenter:(id)a3
{
}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (HMMTRAccessoryServer)accessoryServer
{
  return self->_accessoryServer;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)failSafeExpiryTimeoutSecs
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessoryServer:(id)a3
{
}

- (void)populateDelegate:(id)a3
{
  failSafeExpiryTimeoutSecs = self->_failSafeExpiryTimeoutSecs;
  id v5 = a3;
  [v5 setFailSafeExpiryTimeoutSecs:failSafeExpiryTimeoutSecs];
  [v5 setDeviceAttestationDelegate:self];
}

- (void)deviceAttestationCompletedForController:(id)a3 opaqueDeviceHandle:(void *)a4 attestationDeviceInfo:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [(HMMTRAttestationStatus *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke;
  block[3] = &unk_2653783E8;
  block[4] = self;
  id v18 = v12;
  id v20 = v11;
  v21 = a4;
  id v19 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(v13, block);
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v40 = v5;
    __int16 v41 = 2112;
    v42 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Device attestation completed for device under commissioning. Error: %@", buf, 0x16u);
  }
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_9;
  v36[3] = &unk_265378320;
  v36[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  id v37 = v7;
  uint64_t v38 = v8;
  v9 = (void *)MEMORY[0x2533B66E0](v36);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_10;
  v32[3] = &unk_265378370;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v33 = v10;
  uint64_t v34 = v11;
  id v12 = v9;
  id v35 = v12;
  v13 = (void *)MEMORY[0x2533B66E0](v32);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_14;
  v30[3] = &unk_265378578;
  v30[4] = *(void *)(a1 + 32);
  id v14 = v13;
  id v31 = v14;
  id v15 = (void *)MEMORY[0x2533B66E0](v30);
  id v16 = [*(id *)(a1 + 32) accessoryServer];

  if (v16)
  {
    v17 = [*(id *)(a1 + 32) accessoryServer];
    [v17 updateVidPidWithAttestationDeviceInfo:*(void *)(a1 + 56)];

    id v18 = (void *)MEMORY[0x2533B64D0]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [*(id *)(a1 + 32) accessoryServer];
      *(_DWORD *)buf = 138543618;
      v40 = v21;
      __int16 v41 = 2112;
      v42 = v22;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Validating device attestation through accessory server: %@", buf, 0x16u);
    }
    v23 = [*(id *)(a1 + 32) accessoryServer];
    uint64_t v24 = *(void *)(a1 + 56);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_17;
    v26[3] = &unk_2653783C0;
    v25 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 32);
    id v27 = v25;
    id v28 = v15;
    id v29 = v14;
    [v23 validateAttestationDeviceInfo:v24 error:v27 completion:v26];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 1, 0);
  }
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = (void *)v9;
    uint64_t v11 = "NO";
    if (a2) {
      uint64_t v11 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v9;
    __int16 v23 = 2080;
    uint64_t v24 = v11;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Continuing commissioning with ignore attestation failure: %s", buf, 0x16u);
  }
  id v12 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v20 = 0;
  [v12 continueCommissioningDevice:v13 ignoreAttestationFailure:a2 error:&v20];
  id v14 = (char *)v20;
  if (v14)
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = (uint64_t)v18;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Continue commissioning device failed: %@", buf, 0x16u);
    }
  }
  id v19 = [*(id *)(a1 + 32) accessoryServer];
  [v19 setupThreadPairing];
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_10(uint64_t a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = *(void *)(a1 + 32) == 0;
  id v7 = [*(id *)(a1 + 40) accessoryServer];
  [v7 setCertified:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (!v5 || v8 || (a2 & 1) != 0)
  {
    if ((!v8 || a2)
      && ([*(id *)(a1 + 40) accessoryServer],
          id v15 = objc_claimAutoreleasedReturnValue(),
          [v15 category],
          id v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 isEqual:&unk_2702B5F10],
          v16,
          v15,
          v17))
    {
      id v18 = *(void **)(a1 + 40);
      id v19 = [v18 accessoryServer];
      id v20 = [v19 name];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_13;
      v26[3] = &unk_265378348;
      v21 = *(void **)(a1 + 48);
      v26[4] = *(void *)(a1 + 40);
      id v28 = v21;
      char v29 = a2;
      id v27 = v5;
      [v18 _requestUserPermissionForBridgeAccessory:v20 completionHandler:v26];
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
      id v23 = *(id *)(a1 + 40);
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v25;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, "%{public}@Continue commissioning.", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v31 = v12;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Device attestation was rejected. Aborting.", buf, 0xCu);
    }
    uint64_t v13 = +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:6 error:v5];
    id v14 = [*(id *)(a1 + 40) accessoryServer];
    [v14 abortStagingWithError:v5 context:v13];
  }
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) accessoryServer];
  int v5 = [v4 hasPriorSuccessfulPairing];

  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory server has prior successful pairing, skipping user permission dialog for unauthorized accessory", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) uiDialogPresenter];
    uint64_t v11 = [*(id *)(a1 + 32) accessoryServer];
    id v12 = [v11 name];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_15;
    v14[3] = &unk_265378370;
    uint64_t v13 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v16 = v13;
    id v15 = v3;
    [v10 requestUserPermissionForUnauthenticatedAccessory:v12 completionHandler:v14];
  }
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_2;
  block[3] = &unk_265378398;
  int v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory server validated attestation device info with error: %@", (uint8_t *)&v8, 0x16u);
  }
  if (*(_OWORD *)(a1 + 40) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_15(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  int v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = (uint64_t)v10;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, got an error response for user permission for unauthorized accessory. Fail pairing.", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = (void *)v11;
    uint64_t v13 = "NO";
    if (a2) {
      uint64_t v13 = "YES";
    }
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2080;
    int v17 = v13;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@User selection for unauthorized accessory. Should cancel : %s", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_13(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Device commissioning was rejected.", (uint8_t *)&v12, 0xCu);
    }
    if (!v5)
    {
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:12 userInfo:0];
    }
    __int16 v10 = +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:6 error:v5];
    uint64_t v11 = [*(id *)(a1 + 32) accessoryServer];
    [v11 abortStagingWithError:v5 context:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v11;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@HMMTRAttestationStatus: _requestUserPermissionForBridgeAccessory", buf, 0xCu);
  }
  int v12 = [(HMMTRAttestationStatus *)v9 userAuthorizationDelegate];

  uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v14 = v9;
  uint64_t v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (v16)
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v17;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@HMMTRAttestationStatus: _requestUserPermissionForBridgeAccessory - delegate set", buf, 0xCu);
    }
    uint64_t v18 = [(HMMTRAttestationStatus *)v14 userAuthorizationDelegate];
    char v19 = objc_opt_respondsToSelector();
    id v20 = (void *)MEMORY[0x2533B64D0]();
    v21 = v14;
    uint64_t v22 = HMFGetOSLogHandle();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v23)
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v24;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, "%{public}@HMMTRAttestationStatus: _requestUserPermissionForBridgeAccessory - calling delegate", buf, 0xCu);
      }
      uint64_t v25 = [(HMMTRAttestationStatus *)v21 accessoryServer];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __85__HMMTRAttestationStatus__requestUserPermissionForBridgeAccessory_completionHandler___block_invoke;
      v29[3] = &unk_2653782F8;
      v29[4] = v21;
      id v30 = v7;
      [v18 requestUserPermissionForBridgeAccessory:v25 completionHandler:v29];
    }
    else
    {
      if (v23)
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v27;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", buf, 0xCu);
      }
      id v28 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 1, v28);
    }
  }
  else
  {
    if (v16)
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v26;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@User Authorization delegate is not set", buf, 0xCu);
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __85__HMMTRAttestationStatus__requestUserPermissionForBridgeAccessory_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  int v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = (uint64_t)v10;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, got an error response for user permission for bridge accessory. Fail pairing.", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = (void *)v11;
    uint64_t v13 = "NO";
    if (a2) {
      uint64_t v13 = "YES";
    }
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2080;
    int v17 = v13;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@User selection for bridge accessory. Should cancel : %s", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setUserAuthorizationDelegate:(id)a3
{
}

- (HMMTRAttestationStatus)initWithQueue:(id)a3 uiDialogPresenter:(id)a4 failSafeExpiryTimeoutSecs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRAttestationStatus;
  int v12 = [(HMMTRAttestationStatus *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_failSafeExpiryTimeoutSecs, a5);
    objc_storeStrong((id *)&v13->_clientQueue, a3);
    objc_storeStrong((id *)&v13->_uiDialogPresenter, a4);
  }

  return v13;
}

@end