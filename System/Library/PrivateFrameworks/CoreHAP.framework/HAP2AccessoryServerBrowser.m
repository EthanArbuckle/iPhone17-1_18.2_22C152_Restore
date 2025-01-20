@interface HAP2AccessoryServerBrowser
+ (id)new;
- (BOOL)isConfirming;
- (BOOL)isDiscovering;
- (BOOL)onDemandConnectionsAreEnabled;
- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3;
- (HAP2AccessoryServerBrowser)init;
- (HAP2AccessoryServerBrowser)initWithCoordinators:(id)a3 storage:(id)a4;
- (HAP2AccessoryServerBrowserDelegate)delegate;
- (HAP2AccessoryServerBrowserOperation)currentOperation;
- (HAP2PropertyLock)propertyLock;
- (HAP2SerializedOperationQueue)workQueue;
- (HAP2Storage)storage;
- (HAPAccessoryPairingRequest)pairingRequest;
- (HAPPowerManager)powerManager;
- (NSArray)coordinatorInfo;
- (NSArray)pairedAccessoryServers;
- (NSArray)unpairedAccessoryServers;
- (NSMapTable)weakOperationQueuesByDeviceID;
- (NSMutableArray)browserOperationQueue;
- (NSMutableArray)livePairedAccessoryServers;
- (NSMutableArray)liveUnpairedAccessoryServers;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)dispatchWorkQueue;
- (id)_lookupPairedAccessoryServerWithDeviceID:(id)a3;
- (id)_removeAccessoryServerFromArray:(id)a3 withDeviceID:(id)a4;
- (id)currentIdentity;
- (id)operationQueueForDeviceID:(id)a3;
- (unint64_t)powerState;
- (void)_beginOperation;
- (void)_enqueueOperation:(id)a3;
- (void)_finishOperation;
- (void)_finishStartDiscovering;
- (void)_finishStopDiscovering;
- (void)_notifyCoordinatorsOfAccessoryWithDeviceID:(id)a3;
- (void)_startDiscovering;
- (void)_stopDiscovering;
- (void)_updateArraysForDiscoveredAccessoryServer:(id)a3 paired:(BOOL)a4 lost:(id *)a5 existing:(id *)a6;
- (void)accessoryServerDidUpdateConnectionState:(id)a3;
- (void)accessoryWithDeviceIDIsPaired:(id)a3 completion:(id)a4;
- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3;
- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3;
- (void)coordinator:(id)a3 didCreatePairedAccessoryServer:(id)a4;
- (void)coordinator:(id)a3 didCreateUnpairedAccessoryServer:(id)a4;
- (void)coordinator:(id)a3 didLoseAccessory:(id)a4 error:(id)a5;
- (void)coordinator:(id)a3 didStartDiscoveringWithError:(id)a4;
- (void)coordinator:(id)a3 didStopDiscoveringWithError:(id)a4;
- (void)handleCurrentNetworkChangedNotification:(id)a3;
- (void)initializeKeyBagIfNecessary;
- (void)removePublicKeyForAccessoryWithID:(id)a3 completion:(id)a4;
- (void)retrieveLocalPairingIdentityForDeviceID:(id)a3 completion:(id)a4;
- (void)savePublicKey:(id)a3 forAccessoryWithID:(id)a4 completion:(id)a5;
- (void)setConfirming:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscovering:(BOOL)a3;
- (void)setLivePairedAccessoryServers:(id)a3;
- (void)setLiveUnpairedAccessoryServers:(id)a3;
- (void)setPowerManager:(id)a3;
- (void)setPowerState:(unint64_t)a3;
- (void)startConfirmingPairedAccessoryReachability;
- (void)startDiscovering;
- (void)stopConfirmingPairedAccessoryReachability;
- (void)stopDiscovering;
- (void)storage:(id)a3 didRemoveKeyWithIdentifier:(id)a4;
- (void)storage:(id)a3 didSaveKeyWithIdentifier:(id)a4;
@end

@implementation HAP2AccessoryServerBrowser

- (void)storage:(id)a3 didSaveKeyWithIdentifier:(id)a4
{
}

- (void)startConfirmingPairedAccessoryReachability
{
  objc_initWeak(&location, self);
  v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HAP2AccessoryServerBrowser_startConfirmingPairedAccessoryReachability__block_invoke;
  v4[3] = &unk_1E69F4658;
  objc_copyWeak(&v5, &location);
  [v3 addBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_notifyCoordinatorsOfAccessoryWithDeviceID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (HAP2SerializedOperationQueue)workQueue
{
  return self->_workQueue;
}

void __72__HAP2AccessoryServerBrowser_startConfirmingPairedAccessoryReachability__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setConfirming:1];
    v2 = [v3 pairedAccessoryServers];
    [v2 enumerateObjectsUsingBlock:&__block_literal_global_9067];

    id WeakRetained = v3;
  }
}

void __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained coordinatorInfo];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke_2;
  v4[3] = &unk_1E69F1D20;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __52__HAP2AccessoryServerBrowser_pairedAccessoryServers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) livePairedAccessoryServers];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __44__HAP2AccessoryServerBrowser_setConfirming___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setConfirming:(BOOL)a3
{
  id v5 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__HAP2AccessoryServerBrowser_setConfirming___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performWritingBlock:v6];
}

- (NSArray)pairedAccessoryServers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8984;
  v11 = __Block_byref_object_dispose__8985;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HAP2AccessoryServerBrowser_pairedAccessoryServers__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSMutableArray)livePairedAccessoryServers
{
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  [v3 assertOwner];

  livePairedAccessoryServers = self->_livePairedAccessoryServers;

  return livePairedAccessoryServers;
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (NSArray)coordinatorInfo
{
  return self->_coordinatorInfo;
}

void __73__HAP2AccessoryServerBrowser__notifyCoordinatorsOfAccessoryWithDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 coordinator];
  [v3 resurfaceDiscoveryInfoForDeviceID:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_weakOperationQueuesByDeviceID, 0);
  objc_storeStrong((id *)&self->_dispatchWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_coordinatorInfo, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_livePairedAccessoryServers, 0);
  objc_storeStrong((id *)&self->_liveUnpairedAccessoryServers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_browserOperationQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPowerState:(unint64_t)a3
{
  self->_powerState = a3;
}

- (unint64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerManager:(id)a3
{
}

- (HAPPowerManager)powerManager
{
  return self->_powerManager;
}

- (NSMapTable)weakOperationQueuesByDeviceID
{
  return self->_weakOperationQueuesByDeviceID;
}

- (OS_dispatch_queue)dispatchWorkQueue
{
  return self->_dispatchWorkQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setLivePairedAccessoryServers:(id)a3
{
}

- (void)setLiveUnpairedAccessoryServers:(id)a3
{
}

- (HAP2Storage)storage
{
  return self->_storage;
}

- (void)handleCurrentNetworkChangedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = [v4 name];
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "notification=%@", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(HAP2AccessoryServerBrowser *)self pairedAccessoryServers];
  [v8 enumerateObjectsUsingBlock:&__block_literal_global_237];
}

uint64_t __70__HAP2AccessoryServerBrowser_handleCurrentNetworkChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleNetworkChanged];
}

- (void)storage:(id)a3 didRemoveKeyWithIdentifier:(id)a4
{
}

- (void)coordinator:(id)a3 didLoseAccessory:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke;
  v14[3] = &unk_1E69F45E0;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) deviceID];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__8984;
  v26 = __Block_byref_object_dispose__8985;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8984;
  v20 = __Block_byref_object_dispose__8985;
  id v21 = 0;
  id v4 = [WeakRetained propertyLock];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke_2;
  uint64_t v11 = &unk_1E69F1CF8;
  v14 = &v22;
  id v12 = WeakRetained;
  id v5 = v3;
  id v13 = v5;
  id v15 = &v16;
  [v4 performWritingBlock:&v8];

  id v6 = objc_msgSend(WeakRetained, "delegate", v8, v9, v10, v11, v12);
  if (v6)
  {
    if (v23[5] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v6 accessoryServerBrowser:WeakRetained didLoseUnpairedAccessoryServer:v23[5] error:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v7 = (void *)v17[5];
      if (v7) {
        objc_msgSend(v7, "handleLostDiscoveryAdvertisementWithWillSleep:", objc_msgSend(WeakRetained, "powerState") == 1);
      }
    }
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

uint64_t __65__HAP2AccessoryServerBrowser_coordinator_didLoseAccessory_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 liveUnpairedAccessoryServers];
  uint64_t v4 = [v2 _removeAccessoryServerFromArray:v3 withDeviceID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _lookupPairedAccessoryServerWithDeviceID:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (void)coordinator:(id)a3 didCreatePairedAccessoryServer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_1F2C8CD98]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  objc_initWeak(&location, self);
  id v10 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke;
  v13[3] = &unk_1E69F45E0;
  objc_copyWeak(&v16, &location);
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 addBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isDiscovering])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v12 = 0;
    id v13 = 0;
    [WeakRetained _updateArraysForDiscoveredAccessoryServer:v3 paired:1 lost:&v13 existing:&v12];
    id v4 = v13;
    id v5 = v12;
    id v6 = *(void **)(a1 + 40);
    if (v4)
    {
      [v4 becomePairedWithAccessoryServer:v6];
      id v6 = v4;
    }
    id v7 = v6;
    uint64_t v8 = [WeakRetained delegate];
    id v9 = (void *)v8;
    if (v5)
    {
      [v5 mergeWithNewlyDiscoveredPairedAccessoryServer:*(void *)(a1 + 40)];
    }
    else if (v8)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke_2;
      v10[3] = &unk_1E69F46E0;
      v10[4] = WeakRetained;
      id v11 = v7;
      [v9 accessoryServerBrowser:WeakRetained didDiscoverPairedAccessoryServer:v11 withCompletion:v10];
    }
  }
}

uint64_t __73__HAP2AccessoryServerBrowser_coordinator_didCreatePairedAccessoryServer___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isConfirming];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 startConfirming];
  }
  return result;
}

- (void)coordinator:(id)a3 didCreateUnpairedAccessoryServer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_1F2C8C6F0]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  objc_initWeak(&location, self);
  id v10 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__HAP2AccessoryServerBrowser_coordinator_didCreateUnpairedAccessoryServer___block_invoke;
  v13[3] = &unk_1E69F45E0;
  objc_copyWeak(&v16, &location);
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 addBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __75__HAP2AccessoryServerBrowser_coordinator_didCreateUnpairedAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isDiscovering])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v10 = 0;
    id v11 = 0;
    [WeakRetained _updateArraysForDiscoveredAccessoryServer:v3 paired:0 lost:&v11 existing:&v10];
    id v4 = v11;
    id v5 = v10;
    id v6 = *(void **)(a1 + 40);
    if (v4)
    {
      [v4 becomeUnpairedWithAccessoryServer:v6];
      id v6 = v4;
    }
    id v7 = v6;
    uint64_t v8 = [WeakRetained delegate];
    id v9 = v8;
    if (v5)
    {
      [v5 mergeWithNewlyDiscoveredUnpairedAccessoryServer:*(void *)(a1 + 40)];
    }
    else if (v8)
    {
      [v8 accessoryServerBrowser:WeakRetained didDiscoverUnpairedAccessoryServer:v7 withCompletion:0];
    }
  }
}

- (void)coordinator:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke;
  v11[3] = &unk_1E69F45E0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 addBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v3 = [WeakRetained coordinatorInfo];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke_2;
  id v7 = &unk_1E69F1DC0;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = WeakRetained;
  id v11 = &v12;
  [v3 enumerateObjectsUsingBlock:&v4];

  if (*((unsigned char *)v13 + 24)) {
    objc_msgSend(WeakRetained, "_finishStopDiscovering", v4, v5, v6, v7, v8);
  }

  _Block_object_dispose(&v12, 8);
}

void __70__HAP2AccessoryServerBrowser_coordinator_didStopDiscoveringWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v14 coordinator];
  LODWORD(v6) = [v6 isEqual:v7];

  id v8 = v14;
  if (v6)
  {
    *a4 = 1;
    [v14 setError:*(void *)(a1 + 40)];
    id v9 = [*(id *)(a1 + 48) currentOperation];
    id v10 = v9;
    if (v9 && [v9 type] == 2)
    {
      id v11 = [v10 pendingCoordinators];
      [v11 removeObject:*(void *)(a1 + 32)];

      if (*(void *)(a1 + 40))
      {
        uint64_t v12 = [v10 error];

        if (!v12) {
          [v10 setError:*(void *)(a1 + 40)];
        }
      }
      id v13 = [v10 pendingCoordinators];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v13 count] == 0;
    }
    id v8 = v14;
  }
}

- (void)coordinator:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke;
  v11[3] = &unk_1E69F45E0;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 addBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v3 = [WeakRetained coordinatorInfo];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke_2;
  id v7 = &unk_1E69F1DC0;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = WeakRetained;
  id v11 = &v12;
  [v3 enumerateObjectsUsingBlock:&v4];

  if (*((unsigned char *)v13 + 24)) {
    objc_msgSend(WeakRetained, "_finishStartDiscovering", v4, v5, v6, v7, v8);
  }

  _Block_object_dispose(&v12, 8);
}

void __71__HAP2AccessoryServerBrowser_coordinator_didStartDiscoveringWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v14 coordinator];
  LODWORD(v6) = [v6 isEqual:v7];

  id v8 = v14;
  if (v6)
  {
    *a4 = 1;
    [v14 setError:*(void *)(a1 + 40)];
    id v9 = [*(id *)(a1 + 48) currentOperation];
    id v10 = v9;
    if (v9 && [v9 type] == 1)
    {
      id v11 = [v10 pendingCoordinators];
      [v11 removeObject:*(void *)(a1 + 32)];

      if (*(void *)(a1 + 40))
      {
        uint64_t v12 = [v10 error];

        if (!v12) {
          [v10 setError:*(void *)(a1 + 40)];
        }
      }
      id v13 = [v10 pendingCoordinators];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v13 count] == 0;
    }
    id v8 = v14;
  }
}

- (void)_updateArraysForDiscoveredAccessoryServer:(id)a3 paired:(BOOL)a4 lost:(id *)a5 existing:(id *)a6
{
  id v10 = a3;
  id v11 = [v10 deviceID];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8984;
  v31 = __Block_byref_object_dispose__8985;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__8984;
  v25 = __Block_byref_object_dispose__8985;
  id v26 = 0;
  uint64_t v12 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke;
  v15[3] = &unk_1E69F1D98;
  BOOL v20 = a4;
  v15[4] = self;
  uint64_t v18 = &v27;
  id v13 = v11;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  v19 = &v21;
  [v12 performWritingBlock:v15];

  *a5 = (id) v28[5];
  *a6 = (id) v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 liveUnpairedAccessoryServers];
  }
  else {
  uint64_t v4 = [v3 livePairedAccessoryServers];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72)) {
    [v5 livePairedAccessoryServers];
  }
  else {
  id v6 = [v5 liveUnpairedAccessoryServers];
  }
  uint64_t v7 = [*(id *)(a1 + 32) _removeAccessoryServerFromArray:v4 withDeviceID:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke_2;
  v15[3] = &unk_1E69F1D70;
  id v16 = *(id *)(a1 + 40);
  uint64_t v10 = [v6 indexOfObjectPassingTest:v15];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v11) {
      uint64_t v11 = *(void *)(a1 + 48);
    }
    [v6 addObject:v11];
  }
  else
  {
    uint64_t v12 = [v6 objectAtIndexedSubscript:v10];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

uint64_t __93__HAP2AccessoryServerBrowser__updateArraysForDiscoveredAccessoryServer_paired_lost_existing___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 deviceID];
  uint64_t v4 = [v3 isEqualToDeviceID:*(void *)(a1 + 32)];

  return v4;
}

- (id)_removeAccessoryServerFromArray:(id)a3 withDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  [v8 assertOwner];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__HAP2AccessoryServerBrowser__removeAccessoryServerFromArray_withDeviceID___block_invoke;
  v14[3] = &unk_1E69F1D70;
  id v15 = v7;
  id v9 = v7;
  uint64_t v10 = [v6 indexOfObjectPassingTest:v14];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = v10;
    uint64_t v11 = [v6 objectAtIndexedSubscript:v10];
    [v6 removeObjectAtIndex:v12];
  }

  return v11;
}

uint64_t __75__HAP2AccessoryServerBrowser__removeAccessoryServerFromArray_withDeviceID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 deviceID];
  uint64_t v4 = [v3 isEqualToDeviceID:*(void *)(a1 + 32)];

  return v4;
}

- (id)_lookupPairedAccessoryServerWithDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  [v5 assertOwner];

  id v6 = [(HAP2AccessoryServerBrowser *)self livePairedAccessoryServers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerBrowser__lookupPairedAccessoryServerWithDeviceID___block_invoke;
  v11[3] = &unk_1E69F1D48;
  id v7 = v4;
  id v12 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v11];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v6 objectAtIndexedSubscript:v8];
  }

  return v9;
}

uint64_t __71__HAP2AccessoryServerBrowser__lookupPairedAccessoryServerWithDeviceID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 deviceID];
  uint64_t v4 = [v3 isEqualToDeviceID:*(void *)(a1 + 32)];

  return v4;
}

- (void)_finishStopDiscovering
{
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  id v6 = [(HAP2AccessoryServerBrowser *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(HAP2AccessoryServerBrowser *)self currentOperation];
    uint64_t v5 = [v4 error];
    [v6 accessoryServerBrowser:self didStopDiscoveringWithError:v5];
  }
  [(HAP2AccessoryServerBrowser *)self _finishOperation];
}

- (void)_stopDiscovering
{
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  if ([(HAP2AccessoryServerBrowser *)self isDiscovering])
  {
    [(HAP2AccessoryServerBrowser *)self setDiscovering:0];
    uint64_t v4 = [(HAP2AccessoryServerBrowser *)self propertyLock];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke;
    v16[3] = &unk_1E69F4330;
    v16[4] = self;
    [v4 performWritingBlock:v16];

    uint64_t v5 = [(HAP2AccessoryServerBrowser *)self currentOperation];
    id v6 = [(HAP2AccessoryServerBrowser *)self coordinatorInfo];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke_2;
    id v14 = &unk_1E69F1D20;
    id v7 = v5;
    id v15 = v7;
    [v6 enumerateObjectsUsingBlock:&v11];

    uint64_t v8 = objc_msgSend(v7, "pendingCoordinators", v11, v12, v13, v14);
    uint64_t v9 = [v8 count];

    if (!v9) {
      [(HAP2AccessoryServerBrowser *)self _finishStopDiscovering];
    }
    uint64_t v10 = [(HAP2AccessoryServerBrowser *)self powerManager];
    [v10 deRegisterFromSleepWake:self];
  }
  else
  {
    [(HAP2AccessoryServerBrowser *)self _finishOperation];
  }
}

void __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) liveUnpairedAccessoryServers];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) livePairedAccessoryServers];
  [v3 removeAllObjects];
}

void __46__HAP2AccessoryServerBrowser__stopDiscovering__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setError:0];
  id v3 = [v6 coordinator];
  if ([v3 isDiscovering])
  {
    uint64_t v4 = [*(id *)(a1 + 32) pendingCoordinators];
    [v4 addObject:v3];

    uint64_t v5 = [v6 coordinator];
    [v5 stopDiscovering];
  }
}

- (void)_finishStartDiscovering
{
  id v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  id v6 = [(HAP2AccessoryServerBrowser *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(HAP2AccessoryServerBrowser *)self currentOperation];
    uint64_t v5 = [v4 error];
    [v6 accessoryServerBrowser:self didStartDiscoveringWithError:v5];
  }
  [(HAP2AccessoryServerBrowser *)self _finishOperation];
}

- (void)_startDiscovering
{
  id v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  if ([(HAP2AccessoryServerBrowser *)self isDiscovering])
  {
    [(HAP2AccessoryServerBrowser *)self _finishOperation];
  }
  else
  {
    [(HAP2AccessoryServerBrowser *)self setPowerState:0];
    uint64_t v4 = +[HAPPowerManager sharedInstance];
    [(HAP2AccessoryServerBrowser *)self setPowerManager:v4];

    uint64_t v5 = [(HAP2AccessoryServerBrowser *)self powerManager];
    id v6 = [(HAP2AccessoryServerBrowser *)self dispatchWorkQueue];
    [v5 registerForSleepWake:self queue:v6];

    [(HAP2AccessoryServerBrowser *)self setDiscovering:1];
    id v7 = [(HAP2AccessoryServerBrowser *)self currentOperation];
    uint64_t v8 = [(HAP2AccessoryServerBrowser *)self coordinatorInfo];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__HAP2AccessoryServerBrowser__startDiscovering__block_invoke;
    v12[3] = &unk_1E69F1D20;
    id v9 = v7;
    id v13 = v9;
    [v8 enumerateObjectsUsingBlock:v12];

    uint64_t v10 = [v9 pendingCoordinators];
    uint64_t v11 = [v10 count];

    if (!v11) {
      [(HAP2AccessoryServerBrowser *)self _finishStartDiscovering];
    }
  }
}

void __47__HAP2AccessoryServerBrowser__startDiscovering__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setError:0];
  id v3 = [v6 coordinator];
  if (([v3 isDiscovering] & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) pendingCoordinators];
    [v4 addObject:v3];

    uint64_t v5 = [v6 coordinator];
    [v5 startDiscovering];
  }
}

- (void)_finishOperation
{
  id v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  uint64_t v4 = [(HAP2AccessoryServerBrowser *)self browserOperationQueue];
  [v4 removeObjectAtIndex:0];

  uint64_t v5 = [(HAP2AccessoryServerBrowser *)self browserOperationQueue];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(HAP2AccessoryServerBrowser *)self workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__HAP2AccessoryServerBrowser__finishOperation__block_invoke;
    v8[3] = &unk_1E69F4658;
    objc_copyWeak(&v9, &location);
    [v7 addBlock:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __46__HAP2AccessoryServerBrowser__finishOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _beginOperation];
}

- (void)_beginOperation
{
  id v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  uint64_t v4 = [(HAP2AccessoryServerBrowser *)self currentOperation];
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = [v4 type];
    if (v5 == 2)
    {
      [(HAP2AccessoryServerBrowser *)self _stopDiscovering];
    }
    else
    {
      BOOL v6 = v5 == 1;
      uint64_t v4 = v7;
      if (!v6) {
        goto LABEL_8;
      }
      [(HAP2AccessoryServerBrowser *)self _startDiscovering];
    }
    uint64_t v4 = v7;
  }
LABEL_8:
}

- (void)_enqueueOperation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServerBrowser__enqueueOperation___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__HAP2AccessoryServerBrowser__enqueueOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained browserOperationQueue];
  [v2 addObject:*(void *)(a1 + 32)];

  id v3 = [WeakRetained browserOperationQueue];
  uint64_t v4 = [v3 count];

  if (v4 == 1) {
    [WeakRetained _beginOperation];
  }
}

- (HAP2AccessoryServerBrowserOperation)currentOperation
{
  id v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  uint64_t v4 = [(HAP2AccessoryServerBrowser *)self browserOperationQueue];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];

  return (HAP2AccessoryServerBrowserOperation *)v5;
}

- (NSMutableArray)browserOperationQueue
{
  id v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v3 assertCurrentQueue];

  browserOperationQueue = self->_browserOperationQueue;

  return browserOperationQueue;
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  int v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)onDemandConnectionsAreEnabled
{
  int v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)currentIdentity
{
  int v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)initializeKeyBagIfNecessary
{
  int v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)accessoryServerDidUpdateConnectionState:(id)a3
{
  id v4 = a3;
  if (![v4 connectionState])
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [(HAP2AccessoryServerBrowser *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke;
    v6[3] = &unk_1E69F4540;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 addBlock:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isDiscovering])
  {
    uint64_t v3 = [*(id *)(a1 + 32) deviceID];
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__8984;
    id v26 = __Block_byref_object_dispose__8985;
    id v27 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__8984;
    BOOL v20 = __Block_byref_object_dispose__8985;
    id v21 = 0;
    id v4 = [WeakRetained propertyLock];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke_2;
    uint64_t v11 = &unk_1E69F1CF8;
    id v14 = &v22;
    id v12 = WeakRetained;
    id v5 = v3;
    id v13 = v5;
    id v15 = &v16;
    [v4 performWritingBlock:&v8];

    uint64_t v6 = objc_msgSend(WeakRetained, "delegate", v8, v9, v10, v11, v12);
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:19];
      if (v23[5] && (objc_opt_respondsToSelector() & 1) != 0) {
        [v6 accessoryServerBrowser:WeakRetained didLoseUnpairedAccessoryServer:v23[5] error:v7];
      }
      if (v17[5] && (objc_opt_respondsToSelector() & 1) != 0) {
        [v6 accessoryServerBrowser:WeakRetained didLosePairedAccessoryServer:v17[5] error:v7];
      }
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
}

void __70__HAP2AccessoryServerBrowser_accessoryServerDidUpdateConnectionState___block_invoke_2(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = [v2 liveUnpairedAccessoryServers];
  uint64_t v4 = [v2 _removeAccessoryServerFromArray:v3 withDeviceID:a1[5]];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = (void *)a1[4];
  id v11 = [v7 livePairedAccessoryServers];
  uint64_t v8 = [v7 _removeAccessoryServerFromArray:v11 withDeviceID:a1[5]];
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)operationQueueForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__8984;
  uint64_t v16 = __Block_byref_object_dispose__8985;
  id v17 = 0;
  uint64_t v5 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HAP2AccessoryServerBrowser_operationQueueForDeviceID___block_invoke;
  v9[3] = &unk_1E69F26B0;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performWritingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__HAP2AccessoryServerBrowser_operationQueueForDeviceID___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) weakOperationQueuesByDeviceID];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = NSString;
    id v7 = [*(id *)(a1 + 40) deviceIDString];
    id v15 = [v6 stringWithFormat:@"operationQueue.%@", v7];

    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", HAPDispatchQueueName(*(void **)(a1 + 32), v15));
    uint64_t v9 = [HAP2SerializedOperationQueue alloc];
    id v10 = [*(id *)(a1 + 32) operationQueue];
    uint64_t v11 = [(HAP2SerializedOperationQueue *)v9 initWithName:v8 operationQueue:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [*(id *)(a1 + 32) weakOperationQueuesByDeviceID];
    [v14 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
  }
}

- (void)removePublicKeyForAccessoryWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke;
  v11[3] = &unk_1E69F4270;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [v8 addBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained storage];
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[4]];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke_2;
    v8[3] = &unk_1E69F1CD0;
    id v9 = a1[4];
    id v10 = a1[5];
    [v4 removeKeysForIdentifiers:v5 completion:v8];
  }
  else
  {
    id v6 = (void (**)(id, void *))a1[5];
    id v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    v6[2](v6, v7);
  }
}

void __75__HAP2AccessoryServerBrowser_removePublicKeyForAccessoryWithID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)savePublicKey:(id)a3 forAccessoryWithID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke;
  v15[3] = &unk_1E69F4298;
  objc_copyWeak(&v19, &location);
  id v12 = v10;
  id v18 = v12;
  id v13 = v9;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  [v11 addBlock:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained storage];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    v13[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke_2;
    v9[3] = &unk_1E69F1CD0;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v4 saveKeysForIdentifiers:v6 completion:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void __74__HAP2AccessoryServerBrowser_savePublicKey_forAccessoryWithID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveLocalPairingIdentityForDeviceID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__HAP2AccessoryServerBrowser_retrieveLocalPairingIdentityForDeviceID_completion___block_invoke;
  v11[3] = &unk_1E69F4270;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [v8 addBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __81__HAP2AccessoryServerBrowser_retrieveLocalPairingIdentityForDeviceID_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (HAPIsHH2Enabled_onceToken != -1) {
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
    }
    if (HAPIsHH2Enabled_hh2Enabled == 1)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v3 = objc_msgSend(WeakRetained, "pairedAccessoryServers", 0);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(v3);
            }
            id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            id v9 = [v8 deviceID];
            if ([v9 isEqual:*(void *)(a1 + 32)])
            {
              id v10 = [v8 delegate];
              id v11 = [v10 currentIdentity];

              if (v11)
              {
                uint64_t v13 = *(void *)(a1 + 40);
                id v14 = [v8 delegate];
                id v15 = [v14 currentIdentity];
                (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v15, 0);

                goto LABEL_19;
              }
            }
            else
            {
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v5);
      }
    }
    id v3 = [WeakRetained storage];
    [v3 fetchControllerKeyForDeviceId:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v3);
  }
LABEL_19:
}

- (void)accessoryWithDeviceIDIsPaired:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke;
  v11[3] = &unk_1E69F4270;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [v8 addBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained storage];
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[4]];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke_2;
    v8[3] = &unk_1E69F33D8;
    id v9 = a1[4];
    id v10 = a1[5];
    [v4 hasKeysForIdentifiers:v5 completion:v8];
  }
  else
  {
    id v6 = (void (**)(id, void, void *))a1[5];
    id v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    v6[2](v6, 0, v7);
  }
}

uint64_t __71__HAP2AccessoryServerBrowser_accessoryWithDeviceIDIsPaired_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v3 BOOLValue];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)stopConfirmingPairedAccessoryReachability
{
  objc_initWeak(&location, self);
  id v3 = [(HAP2AccessoryServerBrowser *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__HAP2AccessoryServerBrowser_stopConfirmingPairedAccessoryReachability__block_invoke;
  v4[3] = &unk_1E69F4658;
  objc_copyWeak(&v5, &location);
  [v3 addBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__HAP2AccessoryServerBrowser_stopConfirmingPairedAccessoryReachability__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setConfirming:0];
    int v2 = [v3 pairedAccessoryServers];
    [v2 enumerateObjectsUsingBlock:&__block_literal_global_88];

    id WeakRetained = v3;
  }
}

uint64_t __71__HAP2AccessoryServerBrowser_stopConfirmingPairedAccessoryReachability__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stopConfirming];
}

uint64_t __72__HAP2AccessoryServerBrowser_startConfirmingPairedAccessoryReachability__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 startConfirming];
}

- (void)stopDiscovering
{
  id v3 = [[HAP2AccessoryServerBrowserOperation alloc] initWithType:2];
  [(HAP2AccessoryServerBrowser *)self _enqueueOperation:v3];
}

- (void)startDiscovering
{
  id v3 = [[HAP2AccessoryServerBrowserOperation alloc] initWithType:1];
  [(HAP2AccessoryServerBrowser *)self _enqueueOperation:v3];
}

- (NSArray)unpairedAccessoryServers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__8984;
  id v11 = __Block_byref_object_dispose__8985;
  id v12 = 0;
  id v3 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HAP2AccessoryServerBrowser_unpairedAccessoryServers__block_invoke;
  v6[3] = &unk_1E69F44F0;
  void v6[4] = self;
  void v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __54__HAP2AccessoryServerBrowser_unpairedAccessoryServers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) liveUnpairedAccessoryServers];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isConfirming
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__HAP2AccessoryServerBrowser_isConfirming__block_invoke;
  v5[3] = &unk_1E69F44F0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performReadingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __42__HAP2AccessoryServerBrowser_isConfirming__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

- (void)setDiscovering:(BOOL)a3
{
  id v5 = [(HAP2AccessoryServerBrowser *)self workQueue];
  [v5 assertCurrentQueue];

  uint64_t v6 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HAP2AccessoryServerBrowser_setDiscovering___block_invoke;
  v7[3] = &unk_1E69F3DF8;
  void v7[4] = self;
  BOOL v8 = a3;
  [v6 performWritingBlock:v7];
}

uint64_t __45__HAP2AccessoryServerBrowser_setDiscovering___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isDiscovering
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__HAP2AccessoryServerBrowser_isDiscovering__block_invoke;
  v5[3] = &unk_1E69F44F0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performReadingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__HAP2AccessoryServerBrowser_isDiscovering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HAP2AccessoryServerBrowser_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

id __42__HAP2AccessoryServerBrowser_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerBrowserDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__8984;
  id v11 = __Block_byref_object_dispose__8985;
  id v12 = 0;
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__HAP2AccessoryServerBrowser_delegate__block_invoke;
  v6[3] = &unk_1E69F44F0;
  void v6[4] = self;
  void v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerBrowserDelegate *)v4;
}

uint64_t __38__HAP2AccessoryServerBrowser_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x1F41817F8]();
}

- (NSMutableArray)liveUnpairedAccessoryServers
{
  uint64_t v3 = [(HAP2AccessoryServerBrowser *)self propertyLock];
  [v3 assertOwner];

  liveUnpairedAccessoryServers = self->_liveUnpairedAccessoryServers;

  return liveUnpairedAccessoryServers;
}

- (HAP2AccessoryServerBrowser)initWithCoordinators:(id)a3 storage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HAP2AccessoryServerBrowser;
  id v8 = [(HAP2AccessoryServerBrowser *)&v42 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_storage, a4);
    [(HAP2Storage *)v9->_storage setDelegate:v9];
    uint64_t v10 = +[HAP2PropertyLock lockWithName:@"HAP2AccessoryServerBrowser.propertyLock"];
    propertyLock = v9->_propertyLock;
    v9->_propertyLock = (HAP2PropertyLock *)v10;

    id v12 = (NSOperationQueue *)objc_opt_new();
    id v13 = objc_msgSend(NSString, "stringWithUTF8String:", HAPDispatchQueueName(v9, @"operationQueue"));
    [(NSOperationQueue *)v12 setName:v13];

    [(NSOperationQueue *)v12 setQualityOfService:17];
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v12;
    id v15 = v12;

    long long v16 = objc_msgSend(NSString, "stringWithUTF8String:", HAPDispatchQueueName(v9, @"workQueue"));
    long long v17 = [[HAP2SerializedOperationQueue alloc] initWithName:v16 operationQueue:v15];
    objc_storeStrong((id *)&v9->_workQueue, v17);
    long long v18 = (const char *)HAPDispatchQueueName(v9, @"dispatchWorkQueue");
    long long v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    dispatchWorkQueue = v9->_dispatchWorkQueue;
    v9->_dispatchWorkQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    liveUnpairedAccessoryServers = v9->_liveUnpairedAccessoryServers;
    v9->_liveUnpairedAccessoryServers = (NSMutableArray *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    livePairedAccessoryServers = v9->_livePairedAccessoryServers;
    v9->_livePairedAccessoryServers = (NSMutableArray *)v24;

    uint64_t v26 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    weakOperationQueuesByDeviceID = v9->_weakOperationQueuesByDeviceID;
    v9->_weakOperationQueuesByDeviceID = (NSMapTable *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    browserOperationQueue = v9->_browserOperationQueue;
    v9->_browserOperationQueue = (NSMutableArray *)v28;

    v9->_discovering = 0;
    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v9 selector:sel_handleCurrentNetworkChangedNotification_ name:*MEMORY[0x1E4F653E8] object:0];

    v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __59__HAP2AccessoryServerBrowser_initWithCoordinators_storage___block_invoke;
    v38[3] = &unk_1E69F1C88;
    id v32 = v9;
    v39 = v32;
    v40 = v17;
    id v41 = v31;
    id v33 = v31;
    v34 = v17;
    [v6 enumerateObjectsUsingBlock:v38];
    uint64_t v35 = [v33 copy];
    coordinatorInfo = v32->_coordinatorInfo;
    v32->_coordinatorInfo = (NSArray *)v35;
  }
  return v9;
}

void __59__HAP2AccessoryServerBrowser_initWithCoordinators_storage___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 conformsToProtocol:&unk_1F2C83180]) {
    uint64_t v3 = v8;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = v3;
  [v6 setBrowser:v4 operationQueue:v5];
  [v6 setDelegate:*(void *)(a1 + 32)];
  id v7 = [[HAP2AccessoryServerBrowserCoordinatorInfo alloc] initWithCoordinator:v6];

  [*(id *)(a1 + 48) addObject:v7];
}

- (HAP2AccessoryServerBrowser)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end