@interface MTRBaseDevice
@end

@implementation MTRBaseDevice

void __110__MTRBaseDevice_HMMTRPairing___fetchPairingsWithCallbackQueue_filtered_vendorMetadataStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v25 = v6;
    v8 = [MEMORY[0x263EFF980] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v5;
    id v9 = v5;
    uint64_t v28 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v28)
    {
      uint64_t v10 = *(void *)v30;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v9);
          }
          v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v13 = [HMMTRPairing alloc];
          v14 = *(void **)(a1 + 32);
          v15 = [v12 vendorId];
          v16 = [v14 _vendorNameForVendorID:v15 vendorMetadataStore:*(void *)(a1 + 40)];
          v17 = [(HMMTRPairing *)v13 initWithFabricDescriptor:v12 vendorName:v16];

          if (v17)
          {
            [v8 addObject:v17];
          }
          else
          {
            v18 = (void *)MEMORY[0x2533B64D0]();
            id v19 = *(id *)(a1 + 32);
            v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v21 = v9;
              v23 = v22 = v8;
              *(_DWORD *)buf = 138543618;
              v34 = v23;
              __int16 v35 = 2112;
              v36 = v12;
              _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not construct HMMTRPairing from fetched fabricDescriptor: %@", buf, 0x16u);

              v8 = v22;
              id v9 = v21;
              uint64_t v10 = v27;
            }
          }
        }
        uint64_t v28 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v28);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v7 = v25;
    id v5 = v26;
  }
  else
  {
    v24 = +[HMMTRAccessoryPairingEndContext mtrContextWithStep:10 error:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to find current fabric Index, unpairing might not complete deterministically. Error: %@", buf, 0x16u);
    }
  }
  id v11 = a1[4];
  id v12 = a1[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_16;
  v14[3] = &unk_265378928;
  v14[4] = v11;
  id v18 = a1[7];
  id v15 = v5;
  id v16 = a1[6];
  id v17 = a1[5];
  id v13 = v5;
  [v11 fetchFabricDescriptorsWithCallbackQueue:v12 filtered:0 completionHandler:v14];
}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v30 = v5;
  long long v31 = v6;
  if (v6)
  {
    v7 = (void *)MEMORY[0x2533B64D0](v6);
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Remove all pairings error: Could not retrieve Fabrics List. %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
  }
  else
  {
    id v11 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v48 = __Block_byref_object_copy__10758;
    v49 = __Block_byref_object_dispose__10759;
    id v50 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v5;
    uint64_t v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16, v5);
    id v13 = 0;
    if (v12)
    {
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v17 = *(void **)(a1 + 40);
          id v18 = [v16 fabricIndex];
          LODWORD(v17) = [v17 isEqualToNumber:v18];

          if (v17)
          {
            id v19 = [HMMTRPairing alloc];
            v20 = *(void **)(a1 + 32);
            __int16 v21 = [v16 vendorId];
            id v22 = [v20 _vendorNameForVendorID:v21 vendorMetadataStore:*(void *)(a1 + 48)];
            uint64_t v23 = [(HMMTRPairing *)v19 initWithFabricDescriptor:v16 vendorName:v22];

            id v13 = (void *)v23;
          }
          else
          {
            dispatch_group_enter(v11);
            v24 = *(void **)(a1 + 32);
            id v25 = [v16 fabricIndex];
            uint64_t v26 = *(void *)(a1 + 56);
            v39[0] = MEMORY[0x263EF8330];
            v39[1] = 3221225472;
            v39[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_17;
            v39[3] = &unk_2653789F0;
            v39[4] = *(void *)(a1 + 32);
            v39[5] = v16;
            v41 = buf;
            v40 = v11;
            [v24 _removeFabricWithIndex:v25 callbackQueue:v26 completionHandler:v39];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v12);
    }

    uint64_t v27 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_19;
    block[3] = &unk_265378A40;
    uint64_t v28 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v34 = v13;
    id v35 = v28;
    id v36 = *(id *)(a1 + 56);
    uint64_t v38 = buf;
    id v37 = *(id *)(a1 + 64);
    id v29 = v13;
    dispatch_group_notify(v11, v27, block);

    _Block_object_dispose(buf, 8);
  }
}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x2533B64D0]();
    id v6 = *(id *)(a1 + 32);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) fabricID];
      int v10 = 138543874;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove fabric ID %@ with Error %@", (uint8_t *)&v10, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_19(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing current pairing %@", buf, 0x16u);
  }
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_20;
  v12[3] = &unk_265378A18;
  v12[4] = v7;
  id v13 = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 64);
  id v10 = (id)v11;
  long long v14 = v11;
  [v7 _removeFabricWithIndex:v8 callbackQueue:v9 completionHandler:v12];
}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x2533B64D0]();
    id v6 = *(id *)(a1 + 32);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543874;
      long long v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove our own pairing %@ with Error %@", (uint8_t *)&v10, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __81__MTRBaseDevice_HMMTRPairing__updateFabricLabel_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__MTRBaseDevice_HMMTRPairing__fetchCurrentFabricIndexWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    __int16 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Current Fabric Index: %@ Error: %@", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) _retrieveFabricClusterWithQueue:*(void *)(a1 + 40)];
    id v7 = objc_alloc_init(MEMORY[0x263F10F28]);
    [v7 setFabricIndex:v5];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke_2;
    v8[3] = &unk_265378950;
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    [v6 removeFabricWithParams:v7 completionHandler:v8];
  }
}

void __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    __int16 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Unpair Status: %@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__MTRBaseDevice_HMMTRPairing___removeFabricWithIndex_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    __int16 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Remove pairing Status: %@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v10;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Remove pairing error: Could not retrieve Fabrics List. %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v25 = v5;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v17 = [HMMTRPairing alloc];
          uint64_t v18 = *(void **)(a1 + 32);
          uint64_t v19 = [v16 vendorId];
          v20 = [v18 _vendorNameForVendorID:v19 vendorMetadataStore:*(void *)(a1 + 40)];
          __int16 v21 = [(HMMTRPairing *)v17 initWithFabricDescriptor:v16 vendorName:v20];

          if ([*(id *)(a1 + 48) isEqual:v21])
          {
            uint64_t v23 = *(void **)(a1 + 32);
            v24 = [v16 fabricIndex];
            [v23 _removeFabricWithIndex:v24 callbackQueue:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];

            goto LABEL_15;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke_8;
    block[3] = &unk_265378900;
    block[4] = *(void *)(a1 + 32);
    id v22 = *(NSObject **)(a1 + 56);
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 64);
    dispatch_async(v22, block);

LABEL_15:
    id v6 = 0;
    id v5 = v25;
  }
}

void __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543618;
    int v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_ERROR, "%{public}@Remove pairing error: Could not find pairing matching %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

@end