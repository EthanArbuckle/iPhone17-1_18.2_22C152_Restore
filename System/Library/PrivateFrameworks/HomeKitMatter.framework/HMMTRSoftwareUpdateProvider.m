@interface HMMTRSoftwareUpdateProvider
+ (id)logCategory;
- (BOOL)canEstablishConnectionForNodeID:(id)a3;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTRSoftwareUpdateProvider)initWithQueue:(id)a3;
- (HMMTRSoftwareUpdateProvider)initWithQueue:(id)a3 browser:(id)a4;
- (HMMTRSoftwareUpdateProviderDelegate)delegate;
- (OS_dispatch_queue)clientQueue;
- (void)notifyDelegateCheckFirmwareUpdateSessionWithPairing:(id)a3 completionHandler:(id)a4;
- (void)notifyDelegateOfApplyUpdateWithPairing:(id)a3 requestParams:(id)a4 completionHandler:(id)a5;
- (void)notifyDelegateOfNotifyUpdateWithPairing:(id)a3 params:(id)a4 completionHandler:(id)a5;
- (void)notifyDelegateOfQueryImageWithPairing:(id)a3 requestParams:(id)a4 completionHandler:(id)a5;
- (void)notifyUpdateRequestedForNodeID:(id)a3 isUserTriggered:(BOOL)a4;
- (void)setBrowser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateOTAProviderStateForNodeID:(id)a3 otaProviderState:(int64_t)a4;
@end

@implementation HMMTRSoftwareUpdateProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBrowser:(id)a3
{
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMMTRSoftwareUpdateProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMMTRSoftwareUpdateProviderDelegate *)WeakRetained;
}

- (BOOL)canEstablishConnectionForNodeID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    v8 = (void *)MEMORY[0x2533B64D0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v4;
      v12 = "%{public}@Unable to get browser ref for canEstablishConnectionForNodeID:%@";
      v13 = v10;
      uint32_t v14 = 22;
LABEL_8:
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, v14);
    }
LABEL_9:

    char v7 = 0;
    goto LABEL_10;
  }
  if (([WeakRetained isCurrentDeviceAllowedAccessoryControlDespiteReachableResident] & 1) == 0)
  {
    v8 = (void *)MEMORY[0x2533B64D0]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@OTA request should be coming through resident";
      v13 = v10;
      uint32_t v14 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  char v7 = [v6 canEstablishConnectionForNodeID:v4];
LABEL_10:

  return v7;
}

- (void)updateOTAProviderStateForNodeID:(id)a3 otaProviderState:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = (void *)MEMORY[0x2533B64D0]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = HAPOTAProviderStateAsString();
    int v29 = 138543874;
    v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@HK informed to update OTA provider state to:%@, for nodeID: %@", (uint8_t *)&v29, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_browser);
  if (WeakRetained)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      v13 = [WeakRetained accessoryServerWithNodeID:v6];
      uint32_t v14 = v13;
      if (v13)
      {
        v15 = [v13 matterFirmwareUpdateStatus];
        if (v15)
        {
          int v16 = [v14 matterFirmwareUpdateStatus];
          [v16 updateFirmwareUpdateStatus:a4];
        }
        else
        {
          v25 = (void *)MEMORY[0x2533B64D0]();
          v26 = v8;
          v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = HMFGetLogIdentifier();
            int v29 = 138543618;
            v30 = v28;
            __int16 v31 = 2112;
            id v32 = v6;
            _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@MatterFirmwareUpdateStatus instance not found for nodeID:%@", (uint8_t *)&v29, 0x16u);
          }
        }
      }
      else
      {
        v21 = (void *)MEMORY[0x2533B64D0]();
        v22 = v8;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = HMFGetLogIdentifier();
          int v29 = 138543618;
          v30 = v24;
          __int16 v31 = 2112;
          id v32 = v6;
          _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for updateOTAProviderStateForNodeID:%@", (uint8_t *)&v29, 0x16u);
        }
      }
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x2533B64D0]();
    __int16 v18 = v8;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v29 = 138543618;
      v30 = v20;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref for notifyUpdateRequestedForNodeID:%@", (uint8_t *)&v29, 0x16u);
    }
  }
}

- (void)notifyUpdateRequestedForNodeID:(id)a3 isUserTriggered:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint32_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      __int16 v28 = 2112;
      id v29 = v6;
      v15 = "%{public}@Unable to get browser ref for notifyUpdateRequestedForNodeID:%@";
      int v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 22;
LABEL_9:
      _os_log_impl(&dword_252495000, v16, v17, v15, buf, v18);
    }
LABEL_10:

    goto LABEL_15;
  }
  if (!a4)
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint32_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      v15 = "%{public}@Ignoring announcement request for automatic software updates";
      int v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
      uint32_t v18 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v9 = [WeakRetained accessoryServerWithNodeID:v6];
  if (v9)
  {
    v10 = [v8 threadSoftwareUpdateController];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __78__HMMTRSoftwareUpdateProvider_notifyUpdateRequestedForNodeID_isUserTriggered___block_invoke;
    v23[3] = &unk_265376898;
    v23[4] = self;
    id v24 = v6;
    id v25 = v8;
    [v10 handleUpdateRequestedForAccessoryServer:v9 completion:v23];
  }
  else
  {
    id v19 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for notifyUpdateRequestedForNodeID:%@", buf, 0x16u);
    }
  }

LABEL_15:
}

void __78__HMMTRSoftwareUpdateProvider_notifyUpdateRequestedForNodeID_isUserTriggered___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to send update available announcement to the accessory with nodeID:%@ %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 48) announceOtaProviderForNodeID:*(void *)(a1 + 40)];
  }
}

- (void)notifyDelegateCheckFirmwareUpdateSessionWithPairing:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMMTRSoftwareUpdateProvider *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__HMMTRSoftwareUpdateProvider_notifyDelegateCheckFirmwareUpdateSessionWithPairing_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __101__HMMTRSoftwareUpdateProvider_notifyDelegateCheckFirmwareUpdateSessionWithPairing_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];

  if (!v2)
  {
    id v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v9;
      id v10 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v18, 0xCu);
    }
LABEL_10:

    uint64_t v11 = *(void *)(a1 + 48);
    id v3 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v3);
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 40))
  {
    id v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v9;
      id v10 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) clientQueue];
    [v3 notifyCheckFirmwareUpdateSessionWithPairing:v4 queue:v5 completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v16 = *(void *)(a1 + 48);
    os_log_type_t v17 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
LABEL_14:
}

- (void)notifyDelegateOfNotifyUpdateWithPairing:(id)a3 params:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMMTRSoftwareUpdateProvider *)self clientQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__HMMTRSoftwareUpdateProvider_notifyDelegateOfNotifyUpdateWithPairing_params_completionHandler___block_invoke;
  v15[3] = &unk_2653775F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __96__HMMTRSoftwareUpdateProvider_notifyDelegateOfNotifyUpdateWithPairing_params_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];

  if (!v2)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v10;
      uint64_t v11 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v19, 0xCu);
    }
LABEL_10:

    uint64_t v12 = *(void *)(a1 + 56);
    id v3 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v3);
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 40))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v10;
      uint64_t v11 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) clientQueue];
    [v3 notifyUpdateWithPairing:v5 params:v4 queue:v6 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v16;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
LABEL_14:
}

- (void)notifyDelegateOfApplyUpdateWithPairing:(id)a3 requestParams:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMMTRSoftwareUpdateProvider *)self clientQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__HMMTRSoftwareUpdateProvider_notifyDelegateOfApplyUpdateWithPairing_requestParams_completionHandler___block_invoke;
  v15[3] = &unk_2653775F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __102__HMMTRSoftwareUpdateProvider_notifyDelegateOfApplyUpdateWithPairing_requestParams_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];

  if (!v2)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v10;
      uint64_t v11 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v19, 0xCu);
    }
LABEL_10:

    uint64_t v12 = *(void *)(a1 + 56);
    id v3 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v3);
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 40))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v10;
      uint64_t v11 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) clientQueue];
    [v3 applyUpdateWithPairing:v5 requestParams:v4 queue:v6 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v16;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
  }
LABEL_14:
}

- (void)notifyDelegateOfQueryImageWithPairing:(id)a3 requestParams:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMMTRSoftwareUpdateProvider *)self clientQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101__HMMTRSoftwareUpdateProvider_notifyDelegateOfQueryImageWithPairing_requestParams_completionHandler___block_invoke;
  v15[3] = &unk_2653775F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __101__HMMTRSoftwareUpdateProvider_notifyDelegateOfQueryImageWithPairing_requestParams_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];

  if (!v2)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v10;
      uint64_t v11 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v19, 0xCu);
    }
LABEL_10:

    uint64_t v12 = *(void *)(a1 + 56);
    id v3 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v3);
    goto LABEL_14;
  }
  if (!*(void *)(a1 + 40))
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v10;
      uint64_t v11 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) clientQueue];
    [v3 queryImageWithPairing:v5 requestParams:v4 queue:v6 completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v16;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
  }
LABEL_14:
}

- (HMMTRSoftwareUpdateProvider)initWithQueue:(id)a3
{
  return [(HMMTRSoftwareUpdateProvider *)self initWithQueue:a3 browser:0];
}

- (HMMTRSoftwareUpdateProvider)initWithQueue:(id)a3 browser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRSoftwareUpdateProvider;
  id v9 = [(HMMTRSoftwareUpdateProvider *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_storeWeak((id *)&v10->_browser, v8);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1) {
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_7077);
  }
  v2 = (void *)logCategory__hmf_once_v23;
  return v2;
}

uint64_t __42__HMMTRSoftwareUpdateProvider_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v23;
  logCategory__hmf_once_v23 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end