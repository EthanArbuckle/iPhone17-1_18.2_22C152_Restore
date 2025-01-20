@interface HMMTROTAProviderDelegate
+ (id)logCategory;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTROTAProviderDelegate)initWithQueue:(id)a3 browser:(id)a4;
- (OS_dispatch_queue)clientQueue;
- (id)generateUpdateToken;
- (void)_refreshHAPFirmwareRevisionForAccessoryServer:(id)a3 completionHandler:(id)a4;
- (void)_refreshHAPFirmwareRevisionForAccessoryServer:(id)a3 retryCount:(int64_t)a4 completionHandler:(id)a5;
- (void)_refreshThreadCapabilitiesForAccessoryServer:(id)a3 completion:(id)a4;
- (void)applyUpdateRequestTimerExpiredForAccessoryServer:(id)a3;
- (void)applyUpdateTimerExpiredForAccessoryServer:(id)a3 softwareVersion:(id)a4 didTimeout:(id)a5;
- (void)handleApplyUpdateRequestForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6;
- (void)handleBDXQueryForNodeID:(id)a3 controller:(id)a4 blockSize:(id)a5 blockIndex:(id)a6 bytesToSkip:(id)a7 completion:(id)a8;
- (void)handleBDXTransferSessionBeginForNodeID:(id)a3 controller:(id)a4 fileDesignator:(id)a5 offset:(id)a6 completion:(id)a7;
- (void)handleBDXTransferSessionEndForNodeID:(id)a3 controller:(id)a4 error:(id)a5;
- (void)handleNotifyUpdateAppliedForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6;
- (void)handleQueryImageForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6;
- (void)setBrowser:(id)a3;
- (void)setClientQueue:(id)a3;
@end

@implementation HMMTROTAProviderDelegate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (void)setBrowser:(id)a3
{
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)_refreshThreadCapabilitiesForAccessoryServer:(id)a3 completion:(id)a4
{
}

- (void)_refreshHAPFirmwareRevisionForAccessoryServer:(id)a3 retryCount:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v31 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v33 = v7;
  v9 = [v7 primaryAccessory];
  v10 = [v9 services];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v16 = [v15 type];
        int v17 = [v16 isEqualToString:@"0000003E-0000-1000-8000-0026BB765291"];

        if (v17)
        {
          int64_t v30 = a4;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          v18 = [v15 characteristics];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v39;
            while (2)
            {
              v22 = v8;
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v39 != v21) {
                  objc_enumerationMutation(v18);
                }
                v24 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                v25 = [v24 type];
                int v26 = [v25 isEqualToString:@"00000052-0000-1000-8000-0026BB765291"];

                if (v26)
                {
                  id v8 = v22;
                  [v22 addObject:v24];
                  goto LABEL_20;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
              id v8 = v22;
              if (v20) {
                continue;
              }
              break;
            }
          }
LABEL_20:

          a4 = v30;
          goto LABEL_21;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  v27 = [(HMMTROTAProviderDelegate *)self clientQueue];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __103__HMMTROTAProviderDelegate__refreshHAPFirmwareRevisionForAccessoryServer_retryCount_completionHandler___block_invoke;
  v34[3] = &unk_265375C40;
  v34[4] = self;
  int64_t v37 = a4;
  id v35 = v33;
  id v36 = v31;
  id v28 = v31;
  id v29 = v33;
  [v29 fetchAndNotifyCharacteristics:v8 timeout:v27 completionQueue:v34 completionHandler:60.0];
}

void __103__HMMTROTAProviderDelegate__refreshHAPFirmwareRevisionForAccessoryServer_retryCount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v28 = a1;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7 > 4)
    {
      if (v11)
      {
        v25 = HMFGetLogIdentifier();
        int v26 = *(void **)(v28 + 56);
        *(_DWORD *)buf = 138543874;
        id v36 = v25;
        __int16 v37 = 2112;
        id v38 = v6;
        __int16 v39 = 2048;
        long long v40 = v26;
        _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Max retries reached to refresh FirmwareRevision: error: %@, retryCount:%ld", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(v28 + 48) + 16))();
    }
    else
    {
      if (v11)
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = *(void **)(v28 + 56);
        *(_DWORD *)buf = 138543874;
        id v36 = v12;
        __int16 v37 = 2112;
        id v38 = v6;
        __int16 v39 = 2048;
        long long v40 = v13;
        _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to refresh FirmwareRevision: error: %@, retryCount:%ld", buf, 0x20u);
      }
      [*(id *)(v28 + 32) _refreshHAPFirmwareRevisionForAccessoryServer:*(void *)(v28 + 40) retryCount:*(void *)(v28 + 56) + 1 completionHandler:*(void *)(v28 + 48)];
    }
  }
  else
  {
    id v27 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v5;
    uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x2533B64D0]();
          id v20 = *(id *)(a1 + 32);
          uint64_t v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v22 = HMFGetLogIdentifier();
            v23 = [v18 value];
            v24 = [v18 error];
            *(_DWORD *)buf = 138543874;
            id v36 = v22;
            __int16 v37 = 2112;
            id v38 = v23;
            __int16 v39 = 2112;
            long long v40 = v24;
            _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Read completion contains tuple with value:%@ error: %@", buf, 0x20u);

            a1 = v28;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v6 = 0;
    id v5 = v27;
  }
}

- (void)_refreshHAPFirmwareRevisionForAccessoryServer:(id)a3 completionHandler:(id)a4
{
}

- (void)applyUpdateRequestTimerExpiredForAccessoryServer:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    BOOL v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@applyUpdateRequestTimerExpiredForAccessoryServer for accessory %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [v4 matterFirmwareUpdateStatus];
  [v9 updateFirmwareUpdateStatus:0];

  [v4 setOtaApplyUpdateRequestTimer:0];
}

- (void)applyUpdateTimerExpiredForAccessoryServer:(id)a3 softwareVersion:(id)a4 didTimeout:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 softwareVersionNumber];
  [v8 setOtaUpdateToken:0];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke;
  v36[3] = &unk_2653765A8;
  id v12 = v8;
  id v37 = v12;
  id v13 = v9;
  id v38 = v13;
  id v14 = v11;
  id v39 = v14;
  id v15 = v10;
  id v40 = v15;
  uint64_t v41 = self;
  uint64_t v16 = (void (**)(void, void))MEMORY[0x2533B66E0](v36);
  int v17 = [v15 isEqualToNumber:&unk_2702B54A8];
  v18 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v19 = self;
  id v20 = HMFGetOSLogHandle();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v17)
  {
    if (v21)
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v43 = v22;
      __int16 v44 = 2112;
      id v45 = v13;
      __int16 v46 = 2112;
      id v47 = v12;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Timed out applying update version %@ for Accessory %@", buf, 0x20u);
    }
    v23 = [v12 matterFirmwareUpdateStatus];
    [v23 updateFirmwareUpdateStatus:0];

    [v12 setOtaApplyUpdateRequestTimer:0];
    v16[2](v16, 0);
  }
  else
  {
    if (v21)
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v43 = v24;
      __int16 v44 = 2112;
      id v45 = v13;
      __int16 v46 = 2112;
      id v47 = v12;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Successfully updated to version %@ without sending NotifyUpdateApplied command for accessory %@", buf, 0x20u);
    }
    [v12 updateSoftwareVersion:v13];
    v25 = dispatch_group_create();
    dispatch_group_enter(v25);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_44;
    v34[3] = &unk_265376E00;
    int v26 = v25;
    id v35 = v26;
    [(HMMTROTAProviderDelegate *)v19 _refreshHAPFirmwareRevisionForAccessoryServer:v12 completionHandler:v34];
    dispatch_group_enter(v26);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2_45;
    v32[3] = &unk_265376E00;
    long long v33 = v26;
    id v27 = v26;
    [(HMMTROTAProviderDelegate *)v19 _refreshThreadCapabilitiesForAccessoryServer:v12 completion:v32];
    uint64_t v28 = [(HMMTROTAProviderDelegate *)v19 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_3;
    block[3] = &unk_2653770F0;
    id v30 = v12;
    long long v31 = v16;
    dispatch_group_notify(v27, v28, block);
  }
}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke(uint64_t a1)
{
  v2 = [HMMTRSoftwareUpdateProviderNotifyUpdateParams alloc];
  v3 = [*(id *)(a1 + 32) otaUpdateToken];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "linkLayerType"));
  id v6 = [(HMMTRSoftwareUpdateProviderNotifyUpdateParams *)v2 initWithUpdateToken:v3 softwareVersion:v4 linkTypeForMetrics:v5 previousSoftwareVersionNumberForMetrics:*(void *)(a1 + 48) didTimeout:*(void *)(a1 + 56)];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 16));
  id v8 = [WeakRetained softwareUpdateProvider];
  id v9 = [*(id *)(a1 + 32) currentPairing];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2;
  v10[3] = &unk_265378660;
  v10[4] = *(void *)(a1 + 64);
  id v11 = *(id *)(a1 + 32);
  [v8 notifyDelegateOfNotifyUpdateWithPairing:v9 params:v6 completionHandler:v10];
}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_44(uint64_t a1)
{
}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2_45(uint64_t a1)
{
}

uint64_t __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) matterFirmwareUpdateStatus];
  [v2 updateFirmwareUpdateStatus:6];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __97__HMMTROTAProviderDelegate_applyUpdateTimerExpiredForAccessoryServer_softwareVersion_didTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfNotifyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (id)generateUpdateToken
{
  v2 = [MEMORY[0x263EFF990] dataWithCapacity:32];
  int v3 = 8;
  do
  {
    uint32_t v6 = 0;
    uint32_t v6 = arc4random();
    [v2 appendBytes:&v6 length:4];
    --v3;
  }
  while (v3);
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithData:v2];

  return v4;
}

- (void)handleBDXQueryForNodeID:(id)a3 controller:(id)a4 blockSize:(id)a5 blockIndex:(id)a6 bytesToSkip:(id)a7 completion:(id)a8
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v37 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [v16 integerValue];
  if (v19 < 10 || !(v19 % 0x64uLL))
  {
    id v20 = (void *)MEMORY[0x2533B64D0]();
    BOOL v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v51 = v23;
      __int16 v52 = 2112;
      id v53 = v14;
      __int16 v54 = 2112;
      id v55 = v15;
      __int16 v56 = 2112;
      id v57 = v16;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Processing handleBDXQueryForNodeID command {nodeID = %@, blockSize: %@, blockIndex: %@}", buf, 0x2Au);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  v25 = [WeakRetained accessoryServerWithNodeID:v14];

  if (v25)
  {
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
    {
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke;
      v43[3] = &unk_265378818;
      id v44 = v25;
      id v45 = v17;
      id v46 = v15;
      id v47 = v16;
      uint64_t v48 = self;
      id v26 = v18;
      id v27 = v16;
      id v28 = v18;
      id v29 = v15;
      id v30 = v17;
      id v31 = v26;
      id v49 = v26;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke_39;
      v38[3] = &unk_2653765F8;
      v38[4] = self;
      id v39 = v14;
      id v40 = v46;
      id v41 = v47;
      id v32 = v31;
      id v17 = v30;
      id v15 = v29;
      id v18 = v28;
      id v16 = v27;
      id v42 = v32;
      [v44 queueAccessoryOperation:v43 highPriority:1 completion:v38];
    }
  }
  else
  {
    long long v33 = (void *)MEMORY[0x2533B64D0]();
    v34 = self;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v51 = v36;
      __int16 v52 = 2112;
      id v53 = v14;
      __int16 v54 = 2112;
      id v55 = 0;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory found for nodeID %@ for accessory %@", buf, 0x20u);
    }
    (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
  }
}

void __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) otaFileOffset];
  uint64_t v3 = [v2 unsignedLongValue];
  uint64_t v4 = [*(id *)(a1 + 40) unsignedLongLongValue] + v3;
  uint64_t v5 = [*(id *)(a1 + 48) unsignedLongValue];
  uint64_t v6 = v4 + [*(id *)(a1 + 56) unsignedLongValue] * v5;

  uint64_t v7 = [*(id *)(a1 + 32) otaFileHandle];
  id v20 = 0;
  [v7 seekToOffset:v6 error:&v20];
  id v8 = v20;

  if (v8)
  {
    int v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = *(id *)(a1 + 64);
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      __int16 v13 = [NSNumber numberWithUnsignedLongLong:v6];
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v22 = v12;
      __int16 v23 = 2112;
      v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error seeking to offset %@ for accessory %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v15 = [*(id *)(a1 + 32) otaFileHandle];
    id v16 = objc_msgSend(v15, "readDataOfLength:", objc_msgSend(*(id *)(a1 + 48), "unsignedLongValue"));

    uint64_t v17 = *(void *)(a1 + 72);
    id v18 = [*(id *)(a1 + 32) otaFileHandle];
    uint64_t v19 = [v18 availableData];
    (*(void (**)(uint64_t, void *, BOOL))(v17 + 16))(v17, v16, [v19 length] == 0);
  }
}

void __107__HMMTROTAProviderDelegate_handleBDXQueryForNodeID_controller_blockSize_blockIndex_bytesToSkip_completion___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      int v11 = 138544386;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@handleBDXQueryForNodeID command {nodeID = %@, blockSize: %@, blockIndex: %@}. Error: %@", (uint8_t *)&v11, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)handleBDXTransferSessionEndForNodeID:(id)a3 controller:(id)a4 error:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v32 = 138543874;
    long long v33 = v14;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Processing handleBDXTransferSessionEndForNodeID command {nodeID = %@, error = %@}", (uint8_t *)&v32, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v12->_browser);
  uint64_t v16 = [WeakRetained accessoryServerWithNodeID:v8];

  if (!v16)
  {
    __int16 v23 = (void *)MEMORY[0x2533B64D0]();
    v24 = v12;
    __int16 v25 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      goto LABEL_14;
    }
    uint64_t v26 = HMFGetLogIdentifier();
    int v32 = 138543618;
    long long v33 = v26;
    __int16 v34 = 2112;
    id v35 = v8;
    uint64_t v27 = "%{public}@No paired accessory found for nodeID %@";
    id v28 = v25;
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_252495000, v28, v29, v27, (uint8_t *)&v32, 0x16u);

    goto LABEL_11;
  }
  [v16 setOtaFileHandle:0];
  uint64_t v17 = [v16 setOtaFileOffset:0];
  if (!v10)
  {
    id v30 = [v16 otaApplyUpdateRequestTimer];

    if (v30)
    {
      id v31 = [v16 otaApplyUpdateRequestTimer];
      [v31 start];

      goto LABEL_14;
    }
    __int16 v23 = (void *)MEMORY[0x2533B64D0]();
    v24 = v12;
    __int16 v25 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    uint64_t v26 = HMFGetLogIdentifier();
    int v32 = 138543618;
    long long v33 = v26;
    __int16 v34 = 2112;
    id v35 = v16;
    uint64_t v27 = "%{public}@Received ApplyUpdateRequest before BDXTransferSessionEnd for accessory %@";
    id v28 = v25;
    os_log_type_t v29 = OS_LOG_TYPE_INFO;
    goto LABEL_10;
  }
  uint64_t v18 = (void *)MEMORY[0x2533B64D0](v17);
  __int16 v19 = v12;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    int v32 = 138543874;
    long long v33 = v21;
    __int16 v34 = 2112;
    id v35 = v16;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@BDX transfer failed for accessory %@, error = %@}", (uint8_t *)&v32, 0x20u);
  }
  v22 = [v16 matterFirmwareUpdateStatus];
  [v22 updateFirmwareUpdateStatus:0];

  [v16 setOtaApplyUpdateRequestTimer:0];
LABEL_14:
}

- (void)handleBDXTransferSessionBeginForNodeID:(id)a3 controller:(id)a4 fileDesignator:(id)a5 offset:(id)a6 completion:(id)a7
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *))a7;
  uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v18 = self;
  __int16 v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v60 = v20;
    __int16 v61 = 2112;
    id v62 = v12;
    __int16 v63 = 2112;
    id v64 = v14;
    __int16 v65 = 2112;
    id v66 = v15;
    _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Processing handleBDXTransferSessionBeginForNodeID command {nodeID = %@, path = %@, offset = %@}", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v18->_browser);
  v22 = [WeakRetained accessoryServerWithNodeID:v12];

  if (v22)
  {
    __int16 v23 = [MEMORY[0x263F08840] fileHandleForReadingAtPath:v14];
    if (v23)
    {
      id v58 = 0;
      objc_msgSend(v23, "seekToOffset:error:", objc_msgSend(v15, "unsignedLongValue"), &v58);
      id v24 = v58;
      if (v24)
      {
        __int16 v25 = v24;
        id v55 = v13;
        uint64_t v26 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v27 = v18;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v54 = v26;
          id v29 = v14;
          v31 = id v30 = v15;
          *(_DWORD *)buf = 138544130;
          v60 = v31;
          __int16 v61 = 2112;
          id v62 = v29;
          __int16 v63 = 2112;
          id v64 = v30;
          __int16 v65 = 2112;
          id v66 = v22;
          _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error seeking file (%@) to offset %@ for accessory %@", buf, 0x2Au);

          id v15 = v30;
          id v14 = v29;
          uint64_t v26 = v54;
        }

        int v32 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
        v16[2](v16, v32);

        id v13 = v55;
      }
      else
      {
        id v42 = [v22 otaApplyUpdateRequestTimer];

        if (v42)
        {
          long long v43 = (void *)MEMORY[0x2533B64D0]();
          id v44 = v18;
          id v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v57 = v14;
            v47 = id v46 = v15;
            *(_DWORD *)buf = 138543618;
            v60 = v47;
            __int16 v61 = 2112;
            id v62 = v22;
            _os_log_impl(&dword_252495000, v45, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected BDXTransferSessionBegin when we were waiting for ApplyUpdateRequest after a BDX transfer was previously completed for accessory %@", buf, 0x16u);

            id v15 = v46;
            id v14 = v57;
          }

          uint64_t v48 = [v22 otaApplyUpdateRequestTimer];
          [v48 stop];
        }
        else
        {
          id v49 = v14;
          id v50 = v15;
          v51 = [HMMTROTAApplyUpdateRequestTimer alloc];
          uint64_t v48 = [(HMMTROTAProviderDelegate *)v18 clientQueue];
          __int16 v52 = [(HMMTROTAApplyUpdateRequestTimer *)v51 initWithServer:v22 otaProvider:v18 queue:v48];
          [v22 setOtaApplyUpdateRequestTimer:v52];

          id v15 = v50;
          id v14 = v49;
        }

        id v53 = [v22 matterFirmwareUpdateStatus];
        [v53 updateFirmwareUpdateStatus:4];

        [v22 setOtaFileHandle:v23];
        [v22 setOtaFileOffset:v15];
        v16[2](v16, 0);
        __int16 v25 = 0;
      }
    }
    else
    {
      id v37 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v38 = v18;
      id v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v56 = v15;
        v41 = id v40 = v13;
        *(_DWORD *)buf = 138543874;
        v60 = v41;
        __int16 v61 = 2112;
        id v62 = v14;
        __int16 v63 = 2112;
        id v64 = v22;
        _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to open file using path '%@' for accessory %@", buf, 0x20u);

        id v13 = v40;
        id v15 = v56;
      }

      __int16 v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
      v16[2](v16, v25);
    }
  }
  else
  {
    long long v33 = (void *)MEMORY[0x2533B64D0]();
    __int16 v34 = v18;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v60 = v36;
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory found for nodeID %@", buf, 0x16u);
    }
    __int16 v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
    v16[2](v16, v23);
  }
}

- (void)handleNotifyUpdateAppliedForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v48 = a4;
  id v11 = a5;
  id v49 = a6;
  id v12 = (void *)MEMORY[0x2533B64D0]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    objc_msgSend(v11, "updateToken", v48);
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v11 softwareVersion];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    __int16 v63 = v16;
    LOWORD(v64) = 2112;
    *(void *)((char *)&v64 + 2) = v17;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Processing handleNotifyUpdateAppliedForNodeID command {nodeID = %@, updateToken = %@, newVersion = %@}", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_browser);
  __int16 v19 = [WeakRetained accessoryServerWithNodeID:v10];

  if (v19)
  {
    id v20 = [v19 otaUpdateToken];
    uint64_t v21 = [v11 updateToken];
    char v22 = [v20 isEqualToData:v21];

    if ((v22 & 1) == 0)
    {
      __int16 v23 = (void *)MEMORY[0x2533B64D0]();
      id v24 = v13;
      __int16 v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [v19 otaUpdateToken];
        id v28 = [v11 updateToken];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v27;
        *(_WORD *)&buf[22] = 2112;
        __int16 v63 = v28;
        LOWORD(v64) = 2112;
        *(void *)((char *)&v64 + 2) = v19;
        _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Provided token %@ doesn't match assigned token %@ for accessory %@, accepting anyways", buf, 0x2Au);
      }
    }
    objc_msgSend(v19, "setOtaUpdateToken:", 0, v48);
    id v29 = [v19 otaUpdateTimer];

    if (v29)
    {
      id v30 = [v19 otaUpdateTimer];
      [v30 stop];
    }
    id v31 = [v19 otaApplyUpdateRequestTimer];

    if (v31)
    {
      int v32 = (void *)MEMORY[0x2533B64D0]();
      long long v33 = v13;
      __int16 v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected NotifyUpdateApplied when we were still waiting for ApplyUpdateRequest after BDX transfer completed for accessory %@", buf, 0x16u);
      }
      __int16 v36 = [v19 otaApplyUpdateRequestTimer];
      [v36 stop];

      [v19 setOtaApplyUpdateRequestTimer:0];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v63 = __Block_byref_object_copy__2810;
    *(void *)&long long v64 = __Block_byref_object_dispose__2811;
    *((void *)&v64 + 1) = [v19 softwareVersionNumber];
    id v37 = [v11 softwareVersion];
    [v19 updateSoftwareVersion:v37];

    uint64_t v38 = dispatch_group_create();
    dispatch_group_enter(v38);
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke;
    v58[3] = &unk_265377458;
    v58[4] = v13;
    id v39 = v19;
    id v59 = v39;
    id v40 = v49;
    id v61 = v40;
    id v41 = v38;
    v60 = v41;
    [(HMMTROTAProviderDelegate *)v13 _refreshHAPFirmwareRevisionForAccessoryServer:v39 completionHandler:v58];
    dispatch_group_enter(v41);
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_33;
    v56[3] = &unk_265376E00;
    id v42 = v41;
    id v57 = v42;
    [(HMMTROTAProviderDelegate *)v13 _refreshThreadCapabilitiesForAccessoryServer:v39 completion:v56];
    long long v43 = [(HMMTROTAProviderDelegate *)v13 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_2;
    block[3] = &unk_265377140;
    id v51 = v39;
    id v55 = buf;
    id v52 = v11;
    id v53 = v13;
    id v54 = v40;
    dispatch_group_notify(v42, v43, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v44 = (void *)MEMORY[0x2533B64D0]();
    id v45 = v13;
    id v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      id v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_252495000, v46, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory found for nodeID %@ - ignore notification", buf, 0x16u);
    }
    (*((void (**)(id, void))v49 + 2))(v49, 0);
  }
}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v11 = 138543874;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfNotifyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v11, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_33(uint64_t a1)
{
}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_2(uint64_t a1)
{
  v2 = [HMMTRSoftwareUpdateProviderNotifyUpdateParams alloc];
  id v3 = [*(id *)(a1 + 32) otaUpdateToken];
  uint64_t v4 = [*(id *)(a1 + 40) softwareVersion];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "linkLayerType"));
  uint64_t v6 = [(HMMTRSoftwareUpdateProviderNotifyUpdateParams *)v2 initWithUpdateToken:v3 softwareVersion:v4 linkTypeForMetrics:v5 previousSoftwareVersionNumberForMetrics:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) didTimeout:&unk_2702B5460];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 16));
  uint64_t v8 = [WeakRetained softwareUpdateProvider];
  uint64_t v9 = [*(id *)(a1 + 32) currentPairing];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_3;
  v10[3] = &unk_265377368;
  v10[4] = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  [v8 notifyDelegateOfNotifyUpdateWithPairing:v9 params:v6 completionHandler:v10];
}

void __92__HMMTROTAProviderDelegate_handleNotifyUpdateAppliedForNodeID_controller_params_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v12 = 138543874;
      __int16 v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfNotifyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) matterFirmwareUpdateStatus];
    [v11 updateFirmwareUpdateStatus:6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)handleApplyUpdateRequestForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    uint64_t v18 = [v12 updateToken];
    __int16 v19 = [v12 getNewVersion];
    *(_DWORD *)buf = 138544130;
    id v61 = v17;
    __int16 v62 = 2112;
    id v63 = v10;
    __int16 v64 = 2112;
    uint64_t v65 = v18;
    __int16 v66 = 2112;
    uint64_t v67 = v19;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Processing handleApplyUpdateRequestForNodeID command {nodeID = %@, updateToken = %@, newVersion = %@}", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v15->_browser);
  uint64_t v21 = [WeakRetained accessoryServerWithNodeID:v10];

  id v22 = objc_alloc_init(MEMORY[0x263F10EF8]);
  if (v21)
  {
    id v53 = v11;
    id v54 = v10;
    __int16 v23 = [v21 otaUpdateToken];
    id v24 = [v12 updateToken];
    char v25 = [v23 isEqualToData:v24];

    if (v25)
    {
      uint64_t v26 = [v21 otaApplyUpdateRequestTimer];

      if (v26)
      {
        uint64_t v27 = [v21 otaApplyUpdateRequestTimer];
        [v27 stop];

        [v21 setOtaApplyUpdateRequestTimer:0];
      }
      id v28 = [HMMTRSoftwareUpdateProviderApplyUpdateRequestParams alloc];
      id v29 = [v21 otaUpdateToken];
      id v30 = [v12 getNewVersion];
      id v31 = [(HMMTRSoftwareUpdateProviderApplyUpdateRequestParams *)v28 initWithUpdateToken:v29 softwareVersion:v30];

      id v32 = objc_loadWeakRetained((id *)&v15->_browser);
      long long v33 = [v32 softwareUpdateProvider];
      __int16 v34 = [v21 currentPairing];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __91__HMMTROTAProviderDelegate_handleApplyUpdateRequestForNodeID_controller_params_completion___block_invoke;
      v55[3] = &unk_265375C18;
      v55[4] = v15;
      id v56 = v21;
      id v59 = v13;
      id v57 = v22;
      id v58 = v12;
      [v33 notifyDelegateOfApplyUpdateWithPairing:v34 requestParams:v31 completionHandler:v55];
    }
    else
    {
      id v39 = (void *)MEMORY[0x2533B64D0]();
      id v40 = v15;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        long long v43 = [v21 otaUpdateToken];
        id v44 = [v12 updateToken];
        *(_DWORD *)buf = 138544130;
        id v61 = v42;
        __int16 v62 = 2112;
        id v63 = v43;
        __int16 v64 = 2112;
        uint64_t v65 = v44;
        __int16 v66 = 2112;
        uint64_t v67 = v21;
        _os_log_impl(&dword_252495000, v41, OS_LOG_TYPE_ERROR, "%{public}@Provided token %@ doesn't match assigned token %@ for accessory %@ - Allow update", buf, 0x2Au);
      }
      id v45 = [v21 otaApplyUpdateRequestTimer];

      if (v45)
      {
        id v46 = [v21 otaApplyUpdateRequestTimer];
        [v46 stop];

        [v21 setOtaApplyUpdateRequestTimer:0];
      }
      [v22 setAction:&unk_2702B5400];
      [v22 setDelayedActionTime:&unk_2702B5490];
      id v47 = [HMMTROTAApplyUpdateTimer alloc];
      id v48 = [v12 getNewVersion];
      id v49 = [v22 delayedActionTime];
      id v50 = [(HMMTROTAProviderDelegate *)v40 clientQueue];
      id v51 = [(HMMTROTAApplyUpdateTimer *)v47 initWithServer:v21 otaProvider:v40 newVersion:v48 delay:v49 queue:v50];
      [v21 setOtaUpdateTimer:v51];

      id v52 = [v21 otaUpdateTimer];
      [v52 start];

      (*((void (**)(id, id, void))v13 + 2))(v13, v22, 0);
    }
    id v11 = v53;
    id v10 = v54;
  }
  else
  {
    id v35 = (void *)MEMORY[0x2533B64D0]();
    __int16 v36 = v15;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v61 = v38;
      __int16 v62 = 2112;
      id v63 = v10;
      _os_log_impl(&dword_252495000, v37, OS_LOG_TYPE_ERROR, "%{public}@No paired accessory for nodeID %@ - Allow update", buf, 0x16u);
    }
    [v22 setAction:&unk_2702B5400];
    (*((void (**)(id, id, void))v13 + 2))(v13, v22, 0);
  }
}

void __91__HMMTROTAProviderDelegate_handleApplyUpdateRequestForNodeID_controller_params_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = *(void **)(a1 + 40);
      int v38 = 138543874;
      id v39 = v10;
      __int16 v40 = 2112;
      id v41 = v11;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@notifyDelegateOfApplyUpdateWithPairing failed for accessory %@ with error: %@", (uint8_t *)&v38, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 64);
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  else
  {
    __int16 v14 = [v5 action];
    uint64_t v15 = [v14 integerValue];

    if (v15 == 2)
    {
      id v22 = *(void **)(a1 + 48);
      __int16 v23 = &unk_2702B5430;
    }
    else if (v15 == 1)
    {
      id v22 = *(void **)(a1 + 48);
      __int16 v23 = &unk_2702B5448;
    }
    else
    {
      if (v15)
      {
        __int16 v16 = (void *)MEMORY[0x2533B64D0]();
        id v17 = *(id *)(a1 + 32);
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = HMFGetLogIdentifier();
          id v20 = [v5 action];
          uint64_t v21 = *(void **)(a1 + 40);
          int v38 = 138543874;
          id v39 = v19;
          __int16 v40 = 2112;
          id v41 = v20;
          __int16 v42 = 2112;
          id v43 = v21;
          _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown action %@ for accessory %@ - Defaulting to allow update", (uint8_t *)&v38, 0x20u);
        }
      }
      id v22 = *(void **)(a1 + 48);
      __int16 v23 = &unk_2702B5400;
    }
    [v22 setAction:v23];
    id v24 = [v5 delayedActionTime];
    [*(id *)(a1 + 48) setDelayedActionTime:v24];

    char v25 = [*(id *)(a1 + 48) action];
    int v26 = [v25 isEqualToNumber:&unk_2702B5400];

    if (v26)
    {
      uint64_t v27 = [HMMTROTAApplyUpdateTimer alloc];
      uint64_t v29 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 40);
      id v30 = [*(id *)(a1 + 56) getNewVersion];
      id v31 = [*(id *)(a1 + 48) delayedActionTime];
      id v32 = [*(id *)(a1 + 32) clientQueue];
      long long v33 = [(HMMTROTAApplyUpdateTimer *)v27 initWithServer:v28 otaProvider:v29 newVersion:v30 delay:v31 queue:v32];
      [*(id *)(a1 + 40) setOtaUpdateTimer:v33];

      __int16 v34 = [*(id *)(a1 + 40) otaUpdateTimer];
      [v34 start];

      id v35 = [*(id *)(a1 + 40) matterFirmwareUpdateStatus];
      __int16 v36 = [*(id *)(a1 + 56) getNewVersion];
      [v35 updateDownloadedFirmwareVersionNumber:v36];

      id v37 = [*(id *)(a1 + 40) matterFirmwareUpdateStatus];
      [v37 updateFirmwareUpdateStatus:5];
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)handleQueryImageForNodeID:(id)a3 controller:(id)a4 params:(id)a5 completion:(id)a6
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v103 = a4;
  id v11 = a5;
  id v105 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263F10F00]);
  id v13 = [MEMORY[0x263F089D8] string];
  __int16 v14 = [v11 protocolsSupported];
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke;
  v111[3] = &unk_265375BC8;
  id v104 = v13;
  id v112 = v104;
  [v14 enumerateObjectsUsingBlock:v111];

  uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v93 = HMFGetLogIdentifier();
    v92 = [v11 vendorID];
    uint64_t v18 = [v11 productID];
    __int16 v19 = [v11 softwareVersion];
    locationa = [v11 protocolsSupported];
    uint64_t v91 = [locationa count];
    v90 = [v11 hardwareVersion];
    [v11 location];
    id v20 = v98 = v16;
    [v11 requestorCanConsent];
    uint64_t v21 = v96 = v15;
    [v11 metadataForProvider];
    id v22 = v101 = v12;
    *(_DWORD *)buf = 138545922;
    v114 = v93;
    __int16 v115 = 2112;
    id v116 = v10;
    __int16 v117 = 2112;
    v118 = v92;
    __int16 v119 = 2112;
    v120 = v18;
    __int16 v121 = 2112;
    v122 = v19;
    __int16 v123 = 2048;
    uint64_t v124 = v91;
    __int16 v125 = 2112;
    id v126 = v104;
    __int16 v127 = 2112;
    v128 = v90;
    __int16 v129 = 2112;
    v130 = v20;
    __int16 v131 = 2112;
    v132 = v21;
    __int16 v133 = 2112;
    v134 = v22;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Processing QueryImage command { nodeID = %@, vendorId = %@, productId = %@, softwareVersion = %@, protocolsSupported size = %lu, protocols[%@], hardwareVersion = %@, location = %@, requestorCanConsent = %@, metadataForProvider = %@ }", buf, 0x70u);

    id v12 = v101;
    uint64_t v15 = v96;

    __int16 v16 = v98;
  }

  __int16 v23 = [v11 protocolsSupported];
  char v24 = [v23 containsObject:&unk_2702B5400];

  if (v24)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v16->_browser);
    if (WeakRetained)
    {
      location = (id *)&v16->_browser;
      id v25 = objc_loadWeakRetained((id *)&v16->_browser);
      id v26 = [v25 accessoryServerWithNodeID:v10];

      v102 = v12;
      if (v26)
      {
        uint64_t v27 = [v26 currentPairing];

        if (v27) {
          goto LABEL_11;
        }
      }
      uint64_t v28 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v29 = v16;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v31 = v99 = v16;
        id v32 = [v11 vendorID];
        [v11 productID];
        v34 = id v33 = v11;
        *(_DWORD *)buf = 138544130;
        v114 = v31;
        __int16 v115 = 2112;
        id v116 = v10;
        __int16 v117 = 2112;
        v118 = v32;
        __int16 v119 = 2112;
        v120 = v34;
        _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@Could not associate QueryImage request {nodeID=%@, vendorId=%@, productId=%@} to a paired accessory", buf, 0x2Au);

        id v11 = v33;
        id v12 = v102;

        __int16 v16 = v99;
      }

      if (!v26)
      {
        v79 = (void *)MEMORY[0x2533B64D0]();
        v80 = v29;
        v81 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          v82 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v114 = v82;
          _os_log_impl(&dword_252495000, v81, OS_LOG_TYPE_ERROR, "%{public}@Cannot proceed if accessory server is nil, sending an error back to accessory", buf, 0xCu);
        }
        [v12 setStatus:&unk_2702B5430];
        v83 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:4 userInfo:0];
        (*((void (**)(id, id, void *))v105 + 2))(v105, v12, v83);

        id v26 = 0;
        goto LABEL_30;
      }
      id v35 = [v26 currentPairing];

      if (v35)
      {
LABEL_11:
        id v89 = v10;
        __int16 v36 = (void *)MEMORY[0x2533B64D0]();
        id v37 = v16;
        int v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v39 = HMFGetLogIdentifier();
          __int16 v40 = [v11 vendorID];
          id v41 = [v11 productID];
          *(_DWORD *)buf = 138544386;
          v114 = v39;
          __int16 v115 = 2112;
          id v116 = v26;
          __int16 v117 = 2112;
          v118 = v89;
          __int16 v119 = 2112;
          v120 = v40;
          __int16 v121 = 2112;
          v122 = v41;
          _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@Found accessory %@ for QueryImage request {nodeID=%@, vendorId=%@, productId=%@} ", buf, 0x34u);
        }
        __int16 v42 = [v11 softwareVersion];
        [v26 updateSoftwareVersion:v42];

        id v43 = [v26 otaAnnounceTimer];

        if (v43)
        {
          uint64_t v44 = [v26 otaAnnounceTimer];
          [v44 stop];

          [v26 setOtaAnnounceTimer:0];
        }
        id v45 = [v26 otaApplyUpdateRequestTimer];

        if (v45)
        {
          id v46 = (void *)MEMORY[0x2533B64D0]();
          id v47 = v37;
          id v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            id v49 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v114 = v49;
            __int16 v115 = 2112;
            id v116 = v26;
            _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected QueryImage when we were waiting for ApplyUpdateRequest after BDX transfer completed, resetting state for accessory %@", buf, 0x16u);
          }
          id v50 = [v26 otaApplyUpdateRequestTimer];
          [v50 stop];

          [v26 setOtaApplyUpdateRequestTimer:0];
          id v51 = [v26 matterFirmwareUpdateStatus];
          [v51 updateFirmwareUpdateStatus:0];
        }
        id v52 = [HMMTRSoftwareUpdateProviderQueryImageRequestParams alloc];
        id v53 = [v11 vendorID];
        id v54 = [v11 productID];
        id v55 = [v11 softwareVersion];
        [v11 hardwareVersion];
        id v56 = v100 = v37;
        id v57 = [v11 location];
        id v58 = [v11 requestorCanConsent];
        id v59 = [v11 metadataForProvider];
        v60 = [(HMMTRSoftwareUpdateProviderQueryImageRequestParams *)v52 initWithVendorID:v53 productId:v54 softwareVersion:v55 protocolsSupported:&unk_2702B61F8 hardwareVersion:v56 location:v57 requestorCanConsent:v58 metadataForProvider:v59];

        id v61 = objc_loadWeakRetained(location);
        __int16 v62 = [v61 softwareUpdateProvider];
        id v63 = [v26 currentPairing];
        v106[0] = MEMORY[0x263EF8330];
        v106[1] = 3221225472;
        v106[2] = __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke_21;
        v106[3] = &unk_265375BF0;
        v106[4] = v100;
        id v26 = v26;
        id v107 = v26;
        id v12 = v102;
        id v108 = v102;
        id v110 = v105;
        id v109 = v11;
        [v62 notifyDelegateOfQueryImageWithPairing:v63 requestParams:v60 completionHandler:v106];

        id v10 = v89;
        goto LABEL_30;
      }
      [v12 setStatus:&unk_2702B5448];
      v84 = (void *)MEMORY[0x2533B64D0]([v12 setDelayedActionTime:&unk_2702B6270]);
      v85 = v29;
      v86 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        v87 = HMFGetLogIdentifier();
        v88 = [v12 delayedActionTime];
        *(_DWORD *)buf = 138543618;
        v114 = v87;
        __int16 v115 = 2112;
        id v116 = v88;
        _os_log_impl(&dword_252495000, v86, OS_LOG_TYPE_INFO, "%{public}@Do not have pairing information for this accessory. Requesting accessory to check back again after %@ secs", buf, 0x16u);
      }
      v78 = (void (*)(void))*((void *)v105 + 2);
    }
    else
    {
      v71 = (void *)MEMORY[0x2533B64D0]();
      v72 = v16;
      v73 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        v74 = HMFGetLogIdentifier();
        v75 = [v11 vendorID];
        [v11 productID];
        v77 = id v76 = v11;
        *(_DWORD *)buf = 138544130;
        v114 = v74;
        __int16 v115 = 2112;
        id v116 = v10;
        __int16 v117 = 2112;
        v118 = v75;
        __int16 v119 = 2112;
        v120 = v77;
        _os_log_impl(&dword_252495000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref for QueryImage request {nodeID=%@, vendorId=%@, productId=%@}", buf, 0x2Au);

        id v11 = v76;
      }

      [v12 setStatus:&unk_2702B5430];
      id v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
      v78 = (void (*)(void))*((void *)v105 + 2);
    }
    v78();
LABEL_30:

    goto LABEL_31;
  }
  __int16 v64 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v65 = v16;
  __int16 v66 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    uint64_t v67 = HMFGetLogIdentifier();
    uint64_t v68 = [v11 vendorID];
    [v11 productID];
    v70 = id v69 = v11;
    *(_DWORD *)buf = 138544130;
    v114 = v67;
    __int16 v115 = 2112;
    id v116 = v10;
    __int16 v117 = 2112;
    v118 = v68;
    __int16 v119 = 2112;
    v120 = v70;
    _os_log_impl(&dword_252495000, v66, OS_LOG_TYPE_ERROR, "%{public}@Accessory did not list BDXSynchronous as a supported protocol for QueryImage request {nodeID=%@, vendorId=%@, productId=%@}", buf, 0x2Au);

    id v11 = v69;
  }

  [v12 setStatus:&unk_2702B5418];
  (*((void (**)(id, id, void))v105 + 2))(v105, v12, 0);
LABEL_31:
}

uint64_t __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"{[%lu] = %@},", a3, a2];
}

void __83__HMMTROTAProviderDelegate_handleQueryImageForNodeID_controller_params_completion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v70 = 138543874;
      v71 = v10;
      __int16 v72 = 2112;
      uint64_t v73 = v11;
      __int16 v74 = 2112;
      id v75 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error while trying to QueryImage for accessory %@: %@.", (uint8_t *)&v70, 0x20u);
    }
    [*(id *)(a1 + 48) setStatus:&unk_2702B5430];
LABEL_5:
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 48);
    __int16 v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:4 userInfo:0];
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v13, v14);
  }
  else
  {
    uint64_t v15 = [v5 status];
    uint64_t v16 = [v15 integerValue];

    switch(v16)
    {
      case 0:
        id v17 = (void *)MEMORY[0x2533B64D0]();
        id v18 = *(id *)(a1 + 32);
        __int16 v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          uint64_t v21 = *(void *)(a1 + 40);
          int v70 = 138543618;
          v71 = v20;
          __int16 v72 = 2112;
          uint64_t v73 = v21;
          _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Software update image available for accessory %@", (uint8_t *)&v70, 0x16u);
        }
        [*(id *)(a1 + 48) setStatus:&unk_2702B5400];
        id v22 = [v5 userConsentNeeded];
        uint64_t v23 = [v22 integerValue];

        if (v23 != 1) {
          goto LABEL_14;
        }
        char v24 = [*(id *)(a1 + 56) requestorCanConsent];
        uint64_t v25 = [v24 integerValue];

        id v26 = (void *)MEMORY[0x2533B64D0]();
        id v27 = *(id *)(a1 + 32);
        uint64_t v28 = HMFGetOSLogHandle();
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
        if (v25 == 1)
        {
          if (v29)
          {
            id v30 = HMFGetLogIdentifier();
            uint64_t v31 = *(void *)(a1 + 40);
            int v70 = 138543618;
            v71 = v30;
            __int16 v72 = 2112;
            uint64_t v73 = v31;
            _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@User Consent Pending, requestor can consent for accessory %@", (uint8_t *)&v70, 0x16u);
          }
          [*(id *)(a1 + 48) setUserConsentNeeded:&unk_2702B5478];
LABEL_14:
          id v32 = [v5 imageURI];
          [*(id *)(a1 + 48) setImageURI:v32];

          id v33 = [v5 softwareVersion];
          [*(id *)(a1 + 48) setSoftwareVersion:v33];

          __int16 v34 = [v5 softwareVersionString];
          [*(id *)(a1 + 48) setSoftwareVersionString:v34];

          id v35 = [*(id *)(a1 + 32) generateUpdateToken];
          [*(id *)(a1 + 40) setOtaUpdateToken:v35];

          __int16 v36 = [*(id *)(a1 + 40) otaUpdateToken];
          [*(id *)(a1 + 48) setUpdateToken:v36];

          id v37 = (void *)MEMORY[0x2533B64D0]();
          id v38 = *(id *)(a1 + 32);
          id v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            __int16 v40 = HMFGetLogIdentifier();
            uint64_t v41 = *(void *)(a1 + 40);
            __int16 v42 = [*(id *)(a1 + 48) updateToken];
            int v70 = 138543874;
            v71 = v40;
            __int16 v72 = 2112;
            uint64_t v73 = v41;
            __int16 v74 = 2112;
            id v75 = v42;
            _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_INFO, "%{public}@Associated accessory %@ with update token %@", (uint8_t *)&v70, 0x20u);
          }
        }
        else
        {
          if (v29)
          {
            uint64_t v68 = HMFGetLogIdentifier();
            uint64_t v69 = *(void *)(a1 + 40);
            int v70 = 138543618;
            v71 = v68;
            __int16 v72 = 2112;
            uint64_t v73 = v69;
            _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_INFO, "%{public}@User Consent Pending for accessory %@", (uint8_t *)&v70, 0x16u);
          }
          [*(id *)(a1 + 48) setStatus:&unk_2702B5448];
          [*(id *)(a1 + 48) setUserConsentNeeded:&unk_2702B5490];
          [*(id *)(a1 + 48) setDelayedActionTime:&unk_2702B6270];
        }
        break;
      case 1:
        id v49 = (void *)MEMORY[0x2533B64D0]();
        id v50 = *(id *)(a1 + 32);
        id v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          id v52 = HMFGetLogIdentifier();
          uint64_t v53 = *(void *)(a1 + 40);
          int v70 = 138543618;
          v71 = v52;
          __int16 v72 = 2112;
          uint64_t v73 = v53;
          _os_log_impl(&dword_252495000, v51, OS_LOG_TYPE_INFO, "%{public}@Software update provider is busy for accessory %@", (uint8_t *)&v70, 0x16u);
        }
        [*(id *)(a1 + 48) setStatus:&unk_2702B5448];
        id v54 = [v5 delayedActionTime];
        [*(id *)(a1 + 48) setDelayedActionTime:v54];

        break;
      case 2:
        id v55 = (void *)MEMORY[0x2533B64D0]();
        id v56 = *(id *)(a1 + 32);
        id v57 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          id v58 = HMFGetLogIdentifier();
          uint64_t v59 = *(void *)(a1 + 40);
          int v70 = 138543618;
          v71 = v58;
          __int16 v72 = 2112;
          uint64_t v73 = v59;
          _os_log_impl(&dword_252495000, v57, OS_LOG_TYPE_INFO, "%{public}@Software update image not available for accessory %@", (uint8_t *)&v70, 0x16u);
        }
        v60 = *(void **)(a1 + 48);
        id v61 = &unk_2702B5430;
        goto LABEL_29;
      case 3:
        __int16 v62 = (void *)MEMORY[0x2533B64D0]();
        id v63 = *(id *)(a1 + 32);
        __int16 v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          uint64_t v65 = HMFGetLogIdentifier();
          uint64_t v66 = *(void *)(a1 + 40);
          uint64_t v67 = [v5 status];
          int v70 = 138543874;
          v71 = v65;
          __int16 v72 = 2112;
          uint64_t v73 = v66;
          __int16 v74 = 2112;
          id v75 = v67;
          _os_log_impl(&dword_252495000, v64, OS_LOG_TYPE_ERROR, "%{public}@Unknown QueryImage state %@ for accessory %@", (uint8_t *)&v70, 0x20u);
        }
        v60 = *(void **)(a1 + 48);
        id v61 = &unk_2702B5418;
LABEL_29:
        [v60 setStatus:v61];
        break;
      default:
        id v43 = (void *)MEMORY[0x2533B64D0]();
        id v44 = *(id *)(a1 + 32);
        id v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          id v46 = HMFGetLogIdentifier();
          uint64_t v47 = *(void *)(a1 + 40);
          id v48 = [v5 status];
          int v70 = 138543874;
          v71 = v46;
          __int16 v72 = 2112;
          uint64_t v73 = v47;
          __int16 v74 = 2112;
          id v75 = v48;
          _os_log_impl(&dword_252495000, v45, OS_LOG_TYPE_ERROR, "%{public}@Unknown QueryImage state %@ for accessory %@", (uint8_t *)&v70, 0x20u);
        }
        goto LABEL_5;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (HMMTROTAProviderDelegate)initWithQueue:(id)a3 browser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTROTAProviderDelegate;
  uint64_t v9 = [(HMMTROTAProviderDelegate *)&v12 init];
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
  if (logCategory__hmf_once_t48 != -1) {
    dispatch_once(&logCategory__hmf_once_t48, &__block_literal_global_2865);
  }
  v2 = (void *)logCategory__hmf_once_v49;
  return v2;
}

uint64_t __39__HMMTROTAProviderDelegate_logCategory__block_invoke()
{
  logCategory__hmf_once_id v49 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end