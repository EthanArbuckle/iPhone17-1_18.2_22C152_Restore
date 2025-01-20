@interface MTRBaseDevice(HMMTRPairing)
- (__CFString)_vendorNameForVendorID:()HMMTRPairing vendorMetadataStore:;
- (id)_retrieveFabricClusterWithQueue:()HMMTRPairing;
- (uint64_t)fetchCurrentPairingWithCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:;
- (uint64_t)fetchPairingsWithCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:;
- (void)_fetchPairingsWithCallbackQueue:()HMMTRPairing filtered:vendorMetadataStore:completionHandler:;
- (void)_removeFabricWithIndex:()HMMTRPairing callbackQueue:completionHandler:;
- (void)fetchCurrentFabricIndexWithCallbackQueue:()HMMTRPairing completionHandler:;
- (void)fetchFabricDescriptorsWithCallbackQueue:()HMMTRPairing filtered:completionHandler:;
- (void)fetchSerialNumberWithCallbackQueue:()HMMTRPairing completionHandler:;
- (void)removeAllPairingsForCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:;
- (void)removePairing:()HMMTRPairing callbackQueue:vendorMetadataStore:completionHandler:;
- (void)unpairDevice:()HMMTRPairing completionHandler:;
- (void)updateFabricLabel:()HMMTRPairing callbackQueue:completionHandler:;
@end

@implementation MTRBaseDevice(HMMTRPairing)

- (__CFString)_vendorNameForVendorID:()HMMTRPairing vendorMetadataStore:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 unsignedShortValue] == 65522)
  {
    v8 = @"Chai";
  }
  else if ([v6 unsignedShortValue] == 65521)
  {
    v8 = @"Matter Test";
  }
  else
  {
    v9 = [v7 retrieveVendorMetadataForVendorID:v6 productID:0];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 name];
    }
    else
    {
      v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = a1;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = HMFGetLogIdentifier();
        int v17 = 138543618;
        v18 = v15;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Cannot find vendor name for vendorID %@, returning vendorID as vendor name.", (uint8_t *)&v17, 0x16u);
      }
      uint64_t v11 = [v6 stringValue];
    }
    v8 = (__CFString *)v11;
  }
  return v8;
}

- (void)_fetchPairingsWithCallbackQueue:()HMMTRPairing filtered:vendorMetadataStore:completionHandler:
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __110__MTRBaseDevice_HMMTRPairing___fetchPairingsWithCallbackQueue_filtered_vendorMetadataStore_completionHandler___block_invoke;
  v14[3] = &unk_265378A90;
  id v15 = v10;
  id v16 = v11;
  v14[4] = a1;
  id v12 = v10;
  id v13 = v11;
  [a1 fetchFabricDescriptorsWithCallbackQueue:a3 filtered:a4 completionHandler:v14];
}

- (void)fetchFabricDescriptorsWithCallbackQueue:()HMMTRPairing filtered:completionHandler:
{
  id v8 = a5;
  id v11 = [a1 _retrieveFabricClusterWithQueue:a3];
  id v9 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v10 = [NSNumber numberWithBool:a4];
  [v9 setFabricFiltered:v10];

  [v11 readAttributeFabricsWithParams:v9 completionHandler:v8];
}

- (uint64_t)fetchCurrentPairingWithCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:
{
  return [a1 _fetchPairingsWithCallbackQueue:a3 filtered:1 vendorMetadataStore:a4 completionHandler:a5];
}

- (uint64_t)fetchPairingsWithCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:
{
  return [a1 _fetchPairingsWithCallbackQueue:a3 filtered:0 vendorMetadataStore:a4 completionHandler:a5];
}

- (void)fetchSerialNumberWithCallbackQueue:()HMMTRPairing completionHandler:
{
  id v6 = (objc_class *)MEMORY[0x263F10C78];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithDevice:a1 endpoint:0 queue:v8];

  [v9 readAttributeSerialNumberWithCompletionHandler:v7];
}

- (void)removeAllPairingsForCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Remove all pairings: Collecting fabrics table list", buf, 0xCu);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke;
  v18[3] = &unk_265378A68;
  v18[4] = v12;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  [v12 fetchCurrentFabricIndexWithCallbackQueue:v17 completionHandler:v18];
}

- (void)updateFabricLabel:()HMMTRPairing callbackQueue:completionHandler:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _retrieveFabricClusterWithQueue:a4];
  id v11 = objc_alloc_init(MEMORY[0x263F10F30]);
  [v11 setLabel:v9];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__MTRBaseDevice_HMMTRPairing__updateFabricLabel_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_2653789C8;
  id v14 = v8;
  id v12 = v8;
  [v10 updateFabricLabelWithParams:v11 completionHandler:v13];
}

- (void)fetchCurrentFabricIndexWithCallbackQueue:()HMMTRPairing completionHandler:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Getting current fabric index: %@", buf, 0x16u);
  }
  id v12 = [v9 _retrieveFabricClusterWithQueue:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__MTRBaseDevice_HMMTRPairing__fetchCurrentFabricIndexWithCallbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_2653789A0;
  v14[4] = v9;
  id v15 = v7;
  id v13 = v7;
  [v12 readAttributeCurrentFabricIndexWithCompletionHandler:v14];
}

- (void)unpairDevice:()HMMTRPairing completionHandler:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempting to unpair device: %@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke;
  v14[3] = &unk_265378978;
  id v15 = v6;
  id v16 = v7;
  v14[4] = v9;
  id v12 = v6;
  id v13 = v7;
  [v9 fetchCurrentFabricIndexWithCallbackQueue:v12 completionHandler:v14];
}

- (void)_removeFabricWithIndex:()HMMTRPairing callbackQueue:completionHandler:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x2533B64D0]();
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Attempting to remove fabric index: %@", buf, 0x16u);
  }
  id v15 = [v12 _retrieveFabricClusterWithQueue:v9];
  id v16 = objc_alloc_init(MEMORY[0x263F10F28]);
  [v16 setFabricIndex:v8];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__MTRBaseDevice_HMMTRPairing___removeFabricWithIndex_callbackQueue_completionHandler___block_invoke;
  v18[3] = &unk_265378950;
  v18[4] = v12;
  id v19 = v10;
  id v17 = v10;
  [v15 removeFabricWithParams:v16 completionHandler:v18];
}

- (void)removePairing:()HMMTRPairing callbackQueue:vendorMetadataStore:completionHandler:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = a1;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v28 = v17;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_INFO, "%{public}@Remove pairing: Iterating over fabrics table list to find FabricIndex for pairing %@", buf, 0x16u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke;
  v22[3] = &unk_265378928;
  id v25 = v11;
  id v26 = v13;
  v22[4] = v15;
  id v23 = v12;
  id v24 = v10;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  id v21 = v13;
  [v15 fetchFabricDescriptorsWithCallbackQueue:v18 filtered:0 completionHandler:v22];
}

- (id)_retrieveFabricClusterWithQueue:()HMMTRPairing
{
  v4 = (objc_class *)MEMORY[0x263F10CA0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithDevice:a1 endpoint:0 queue:v5];

  return v6;
}

@end