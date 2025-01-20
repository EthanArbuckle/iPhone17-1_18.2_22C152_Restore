@interface HAPAccessoryServerBrowserHAP2Adapter
- (BOOL)isPaired:(id)a3;
- (HAPAccessoryServerBrowserHAP2Adapter)initWithHAP2Browser:(id)a3 queue:(id)a4;
- (HAPAccessoryServerBrowserHAP2Adapter)initWithQueue:(id)a3;
- (HAPAccessoryServerBrowserHAP2Adapter)initWithQueue:(id)a3 storage:(id)a4;
- (id)_getOrInsertServerWithDeviceID:(void *)a3 creationBlock:(unsigned char *)a4 created:;
- (id)delegate;
- (id)discoveredServers;
- (int64_t)linkType;
- (void)_handleLostAccessoryServer:(uint64_t)a1;
- (void)_notifyDelegateOfNewServer:(void *)a3 withCompletion:;
- (void)_setAdapterWithIdentifier:(uint64_t)a3 shouldBePaired:;
- (void)accessoryServerBrowser:(id)a3 didDiscoverPairedAccessoryServer:(id)a4 withCompletion:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didDiscoverUnpairedAccessoryServer:(id)a4 withCompletion:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didLosePairedAccessoryServer:(id)a4 error:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didLoseUnpairedAccessoryServer:(id)a4 error:(id)a5;
- (void)accessoryServerBrowser:(id)a3 didStartDiscoveringWithError:(id)a4;
- (void)accessoryServerBrowser:(id)a3 didStopDiscoveringWithError:(id)a4;
- (void)deRegisterAccessoryWithIdentifier:(id)a3;
- (void)discoverAccessoryServerWithIdentifier:(id)a3;
- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5;
- (void)registerPairedAccessoryWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)startConfirmingPairedAccessoryReachability;
- (void)startDiscoveringAccessoryServers;
- (void)stopConfirmingPairedAccessoryReachability;
- (void)stopDiscoveringAccessoryServers;
@end

@implementation HAPAccessoryServerBrowserHAP2Adapter

- (void)_setAdapterWithIdentifier:(uint64_t)a3 shouldBePaired:
{
  id v5 = a2;
  if (a1)
  {
    v6 = [[HAPDeviceID alloc] initWithDeviceIDString:v5];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__13905;
    v16 = __Block_byref_object_dispose__13906;
    id v17 = 0;
    id v7 = *(id *)(a1 + 88);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__HAPAccessoryServerBrowserHAP2Adapter__setAdapterWithIdentifier_shouldBePaired___block_invoke;
    v9[3] = &unk_1E69F26B0;
    v11 = &v12;
    v9[4] = a1;
    v8 = v6;
    v10 = v8;
    [v7 performReadingBlock:v9];

    [(id)v13[5] setShouldBePaired:a3];
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __81__HAPAccessoryServerBrowserHAP2Adapter__setAdapterWithIdentifier_shouldBePaired___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)registerPairedAccessoryWithIdentifier:(id)a3
{
}

- (void)startConfirmingPairedAccessoryReachability
{
  if (self) {
    self = (HAPAccessoryServerBrowserHAP2Adapter *)self->_browser;
  }
  [(HAPAccessoryServerBrowserHAP2Adapter *)self startConfirmingPairedAccessoryReachability];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_discoveredServers, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)accessoryServerBrowser:(id)a3 didLosePairedAccessoryServer:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = [(HAPAccessoryServerBrowser *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLosePairedAccessoryServer_error___block_invoke;
  v9[3] = &unk_1E69F46E0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __98__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLosePairedAccessoryServer_error___block_invoke(uint64_t a1)
{
}

- (void)_handleLostAccessoryServer:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = [(id)a1 workQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = [v3 deviceID];

    id v6 = v5;
    id v7 = [(id)a1 workQueue];
    dispatch_assert_queue_V2(v7);

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__13905;
    v24 = __Block_byref_object_dispose__13906;
    id v25 = 0;
    id v8 = *(id *)(a1 + 88);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__HAPAccessoryServerBrowserHAP2Adapter__removeDiscoveredServerWithDeviceID___block_invoke;
    v17[3] = &unk_1E69F26B0;
    v19 = &v20;
    v17[4] = a1;
    id v9 = v6;
    id v18 = v9;
    [v8 performWritingBlock:v17];

    id v10 = (id)v21[5];
    _Block_object_dispose(&v20, 8);

    if (v10)
    {
      v11 = -[HAPAccessoryServerBrowserHAP2Adapter delegate]((id *)a1);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = *(NSObject **)(a1 + 64);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __67__HAPAccessoryServerBrowserHAP2Adapter__handleLostAccessoryServer___block_invoke;
        v13[3] = &unk_1E69F4708;
        id v14 = v11;
        uint64_t v15 = a1;
        id v16 = v10;
        dispatch_async(v12, v13);
      }
    }
  }
}

- (id)delegate
{
  v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__13905;
    id v9 = __Block_byref_object_dispose__13906;
    id v10 = 0;
    id v2 = a1[11];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48__HAPAccessoryServerBrowserHAP2Adapter_delegate__block_invoke;
    v4[3] = &unk_1E69F44F0;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

uint64_t __67__HAPAccessoryServerBrowserHAP2Adapter__handleLostAccessoryServer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didRemoveAccessoryServer:*(void *)(a1 + 48) error:0];
}

uint64_t __48__HAPAccessoryServerBrowserHAP2Adapter_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));

  return MEMORY[0x1F41817F8]();
}

void __76__HAPAccessoryServerBrowserHAP2Adapter__removeDiscoveredServerWithDeviceID___block_invoke(uint64_t a1)
{
  id v2 = -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (id)discoveredServers
{
  if (a1)
  {
    id v2 = a1;
    [a1[11] assertOwner];
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)accessoryServerBrowser:(id)a3 didLoseUnpairedAccessoryServer:(id)a4 error:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [(HAPAccessoryServerBrowser *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLoseUnpairedAccessoryServer_error___block_invoke;
  v9[3] = &unk_1E69F46E0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __100__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didLoseUnpairedAccessoryServer_error___block_invoke(uint64_t a1)
{
}

- (void)accessoryServerBrowser:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(HAPAccessoryServerBrowser *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke(uint64_t a1)
{
  id v2 = -[HAPAccessoryServerBrowserHAP2Adapter delegate](*(id **)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(NSObject **)(v3 + 64);
    }
    else {
      uint64_t v4 = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke_2;
    v11[3] = &unk_1E69F4708;
    id v5 = v2;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v12 = v5;
    uint64_t v13 = v6;
    id v14 = v7;
    dispatch_async(v4, v11);
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = [v8 workQueue];
    dispatch_assert_queue_V2(v9);

    id v10 = (void *)v8[11];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__HAPAccessoryServerBrowserHAP2Adapter__clearDiscoveredServers__block_invoke;
    v15[3] = &unk_1E69F4330;
    v15[4] = v8;
    [v10 performWritingBlock:v15];
  }
}

uint64_t __91__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStopDiscoveringWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didStopDiscoveringWithError:*(void *)(a1 + 48)];
}

void __63__HAPAccessoryServerBrowserHAP2Adapter__clearDiscoveredServers__block_invoke(uint64_t a1)
{
  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 removeAllObjects];
}

- (void)accessoryServerBrowser:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HAPAccessoryServerBrowser *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke(uint64_t a1)
{
  id v2 = -[HAPAccessoryServerBrowserHAP2Adapter delegate](*(id **)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(NSObject **)(v3 + 64);
    }
    else {
      uint64_t v4 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke_2;
    block[3] = &unk_1E69F4708;
    id v5 = v2;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(v4, block);
  }
}

uint64_t __92__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didStartDiscoveringWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didStartDiscoveringWithError:*(void *)(a1 + 48)];
}

- (void)accessoryServerBrowser:(id)a3 didDiscoverUnpairedAccessoryServer:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke;
  block[3] = &unk_1E69F4070;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke(uint64_t a1)
{
  char v11 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke_2;
  id v9 = &unk_1E69F2728;
  id v10 = *(id *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1D944E2D0](&v6);
  uint64_t v3 = *(id **)(a1 + 40);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "deviceID", v6, v7, v8, v9);
  id v5 = -[HAPAccessoryServerBrowserHAP2Adapter _getOrInsertServerWithDeviceID:creationBlock:created:](v3, v4, v2, &v11);

  if (v11) {
    -[HAPAccessoryServerBrowserHAP2Adapter _notifyDelegateOfNewServer:withCompletion:](*(void **)(a1 + 40), v5, *(void **)(a1 + 48));
  }
  else {
    [v5 setUnpairedServer:*(void *)(a1 + 32)];
  }
}

HAPAccessoryServerHAP2Adapter *__113__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverUnpairedAccessoryServer_withCompletion___block_invoke_2(uint64_t a1)
{
  id v1 = [[HAPAccessoryServerHAP2Adapter alloc] initWithUnpairedServer:*(void *)(a1 + 32)];

  return v1;
}

- (id)_getOrInsertServerWithDeviceID:(void *)a3 creationBlock:(unsigned char *)a4 created:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = [a1 workQueue];
    dispatch_assert_queue_V2(v9);

    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__13905;
    v28 = __Block_byref_object_dispose__13906;
    id v29 = 0;
    id v10 = a1[11];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke;
    v21[3] = &unk_1E69F26B0;
    v23 = &v24;
    v21[4] = a1;
    id v11 = v7;
    id v22 = v11;
    [v10 performReadingBlock:v21];

    id v12 = v25;
    if (v25[5])
    {
      *a4 = 0;
      id v13 = (id)v12[5];
    }
    else
    {
      uint64_t v14 = v8[2](v8);
      id v15 = (void *)v25[5];
      v25[5] = v14;

      id v16 = a1[11];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke_2;
      v18[3] = &unk_1E69F26B0;
      v18[4] = a1;
      id v19 = v11;
      uint64_t v20 = &v24;
      [v16 performWritingBlock:v18];

      *a4 = 1;
      id v13 = (id)v25[5];
    }
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)_notifyDelegateOfNewServer:(void *)a3 withCompletion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 workQueue];
    dispatch_assert_queue_V2(v7);

    id v8 = -[HAPAccessoryServerBrowserHAP2Adapter delegate]((id *)a1);
    if (objc_opt_respondsToSelector())
    {
      id v9 = a1[8];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke;
      v10[3] = &unk_1E69F3D58;
      id v11 = v8;
      id v12 = a1;
      id v13 = v5;
      id v14 = v6;
      dispatch_async(v9, v10);
    }
  }
}

void __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didFindAccessoryServer:*(void *)(a1 + 48) stateChanged:0 stateNumber:0];
  id v2 = [*(id *)(a1 + 40) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke_2;
  block[3] = &unk_1E69F3B20;
  id v4 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

uint64_t __82__HAPAccessoryServerBrowserHAP2Adapter__notifyDelegateOfNewServer_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke(uint64_t a1)
{
  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __93__HAPAccessoryServerBrowserHAP2Adapter__getOrInsertServerWithDeviceID_creationBlock_created___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)accessoryServerBrowser:(id)a3 didDiscoverPairedAccessoryServer:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke;
  block[3] = &unk_1E69F4070;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke(uint64_t a1)
{
  char v11 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke_2;
  id v9 = &unk_1E69F2728;
  id v10 = *(id *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1D944E2D0](&v6);
  id v3 = *(id **)(a1 + 40);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "deviceID", v6, v7, v8, v9);
  id v5 = -[HAPAccessoryServerBrowserHAP2Adapter _getOrInsertServerWithDeviceID:creationBlock:created:](v3, v4, v2, &v11);

  if (v11) {
    -[HAPAccessoryServerBrowserHAP2Adapter _notifyDelegateOfNewServer:withCompletion:](*(void **)(a1 + 40), v5, *(void **)(a1 + 48));
  }
  else {
    [v5 setPairedServer:*(void *)(a1 + 32)];
  }
}

HAPAccessoryServerHAP2Adapter *__111__HAPAccessoryServerBrowserHAP2Adapter_accessoryServerBrowser_didDiscoverPairedAccessoryServer_withCompletion___block_invoke_2(uint64_t a1)
{
  id v1 = [[HAPAccessoryServerHAP2Adapter alloc] initWithPairedServer:*(void *)(a1 + 32)];

  return v1;
}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
}

- (BOOL)isPaired:(id)a3
{
  id v4 = a3;
  id v5 = [[HAPDeviceID alloc] initWithDeviceIDString:v4];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__13905;
  v33 = __Block_byref_object_dispose__13906;
  id v34 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  uint64_t v7 = propertyLock;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke;
  v26[3] = &unk_1E69F26B0;
  v28 = &v29;
  v26[4] = self;
  id v8 = v5;
  v27 = v8;
  [(HAP2PropertyLock *)v7 performReadingBlock:v26];

  id v9 = (void *)v30[5];
  if (v9)
  {
    char v10 = [v9 isPaired];
  }
  else
  {
    char v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    if (self) {
      browser = self->_browser;
    }
    else {
      browser = 0;
    }
    id v13 = browser;
    id v14 = [(HAP2AccessoryServerBrowserPrivate *)v13 storage];
    id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke_2;
    v18[3] = &unk_1E69F2700;
    v21 = &v22;
    id v19 = v8;
    id v16 = v11;
    uint64_t v20 = v16;
    [v14 hasKeysForIdentifiers:v15 completion:v18];

    dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    char v10 = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
  }

  _Block_object_dispose(&v29, 8);
  return v10;
}

uint64_t __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 72) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

void __49__HAPAccessoryServerBrowserHAP2Adapter_isPaired___block_invoke_2(void *a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:a1[4]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 BOOLValue];

  id v4 = a1[5];

  dispatch_group_leave(v4);
}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E69F4070;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[HAPDeviceID alloc] initWithDeviceIDString:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    id v4 = *(void **)(v3 + 80);
  }
  else {
    id v4 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_1E69F26D8;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 48);
  [v4 accessoryWithDeviceIDIsPaired:v2 completion:v7];
}

void __107__HAPAccessoryServerBrowserHAP2Adapter_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__13905;
    char v25 = __Block_byref_object_dispose__13906;
    id v26 = 0;
    id v7 = *(id *)(v6 + 88);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__HAPAccessoryServerBrowserHAP2Adapter_accessoryServers__block_invoke;
    v20[3] = &unk_1E69F44F0;
    v20[4] = v6;
    v20[5] = &v21;
    objc_msgSend(v7, "performReadingBlock:", v20, (void)v16);

    id v8 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "identifier", (void)v16);
        int v14 = HMFEqualObjects();

        if (v14)
        {
          id v9 = v12;
          goto LABEL_13;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (a3) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = a2;
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v15, v9);
}

void __56__HAPAccessoryServerBrowserHAP2Adapter_accessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v7 allValues];
  uint64_t v4 = [v2 setWithArray:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[HAPAccessoryServerBrowserHAP2Adapter delegate](*(id **)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = [[HAPDeviceID alloc] initWithDeviceIDString:*(void *)(a1 + 40)];
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__13905;
    uint64_t v29 = __Block_byref_object_dispose__13906;
    id v30 = 0;
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      id v4 = (void *)v4[11];
    }
    uint64_t v5 = v4;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_2;
    v22[3] = &unk_1E69F26B0;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v24 = &v25;
    v22[4] = v6;
    id v7 = v3;
    uint64_t v23 = v7;
    [v5 performReadingBlock:v22];

    uint64_t v8 = *(void *)(a1 + 32);
    if (v26[5])
    {
      if (v8) {
        id v9 = *(NSObject **)(v8 + 64);
      }
      else {
        id v9 = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_3;
      block[3] = &unk_1E69F26B0;
      uint64_t v10 = (id *)v21;
      id v11 = v2;
      uint64_t v12 = *(void *)(a1 + 32);
      v21[0] = v11;
      v21[1] = v12;
      v21[2] = &v25;
      dispatch_async(v9, block);
    }
    else
    {
      if (v8) {
        id v13 = *(NSObject **)(v8 + 64);
      }
      else {
        id v13 = 0;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_4;
      v17[3] = &unk_1E69F4708;
      uint64_t v10 = (id *)v18;
      id v14 = v2;
      uint64_t v15 = *(void *)(a1 + 32);
      long long v16 = *(void **)(a1 + 40);
      v18[0] = v14;
      v18[1] = v15;
      id v19 = v16;
      dispatch_async(v13, v17);
    }
    _Block_object_dispose(&v25, 8);
  }
}

void __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  -[HAPAccessoryServerBrowserHAP2Adapter discoveredServers](*(id **)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didFindAccessoryServer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stateChanged:0 stateNumber:0];
}

uint64_t __78__HAPAccessoryServerBrowserHAP2Adapter_discoverAccessoryServerWithIdentifier___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 48)];
}

- (void)stopConfirmingPairedAccessoryReachability
{
  if (self) {
    self = (HAPAccessoryServerBrowserHAP2Adapter *)self->_browser;
  }
  [(HAPAccessoryServerBrowserHAP2Adapter *)self stopConfirmingPairedAccessoryReachability];
}

- (void)stopDiscoveringAccessoryServers
{
  uint64_t v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HAPAccessoryServerBrowserHAP2Adapter_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __71__HAPAccessoryServerBrowserHAP2Adapter_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 80);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 stopDiscovering];
}

- (void)startDiscoveringAccessoryServers
{
  uint64_t v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HAPAccessoryServerBrowserHAP2Adapter_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __72__HAPAccessoryServerBrowserHAP2Adapter_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 80);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 startDiscovering];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HAPAccessoryServerBrowserHAP2Adapter_setDelegate_queue___block_invoke;
  v11[3] = &unk_1E69F4708;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v11];
}

void __58__HAPAccessoryServerBrowserHAP2Adapter_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 64);

  objc_storeStrong(v3, v2);
}

- (int64_t)linkType
{
  return 1;
}

- (HAPAccessoryServerBrowserHAP2Adapter)initWithHAP2Browser:(id)a3 queue:(id)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPAccessoryServerBrowserHAP2Adapter;
  uint64_t v8 = [(HAPAccessoryServerBrowser *)&v15 initWithQueue:a4];
  if (v8)
  {
    [v7 setDelegate:v8];
    objc_storeStrong((id *)&v8->_browser, a3);
    uint64_t v9 = +[HAP2PropertyLock lockWithName:@"HAPAccessoryServerBrowserHAP2Adapter.propertyLock"];
    propertyLock = v8->_propertyLock;
    v8->_propertyLock = (HAP2PropertyLock *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    discoveredServers = v8->_discoveredServers;
    v8->_discoveredServers = (NSMutableDictionary *)v11;

    id v13 = v8;
  }

  return v8;
}

- (HAPAccessoryServerBrowserHAP2Adapter)initWithQueue:(id)a3 storage:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [HAP2AccessoryServerBrowser alloc];
  self;
  uint64_t v9 = objc_opt_new();
  v15[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  uint64_t v11 = [(HAP2AccessoryServerBrowser *)v8 initWithCoordinators:v10 storage:v6];
  id v12 = [(HAPAccessoryServerBrowserHAP2Adapter *)self initWithHAP2Browser:v11 queue:v7];

  if (v12) {
    id v13 = v12;
  }

  return v12;
}

- (HAPAccessoryServerBrowserHAP2Adapter)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end