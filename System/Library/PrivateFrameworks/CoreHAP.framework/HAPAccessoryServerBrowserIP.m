@interface HAPAccessoryServerBrowserIP
+ (id)logCategory;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)recommendBrowserReset;
- (HAPAccessoryServerBrowserDelegate)delegate;
- (HAPAccessoryServerBrowserIP)initWithQueue:(id)a3;
- (HAPPowerManager)powerManager;
- (HAPWACAccessoryBrowser)hapWACBrowser;
- (HMFTimer)bonjourEventTimer;
- (NSMutableSet)discoveredAccessoryServers;
- (NSMutableSet)pendingBonjourEvents;
- (NSOperationQueue)delegateOperationQueue;
- (NSString)serverIdentifierToSkipBonjourUpdate;
- (OS_dispatch_queue)delegateQueue;
- (id)logIdentifier;
- (id)serverWithIdentifier:(id)a3 ignoreLPM:(BOOL)a4;
- (id)visible2Pt4Networks;
- (int)_initializeAndStartBonjourBrowser;
- (int)_processPendingBonjourEvent:(id)a3;
- (int)_purgePendingBonjourEvents:(id)a3 withProcessing:(BOOL)a4;
- (int)_server:(id *)a3 forBonjourDevice:(id)a4;
- (int64_t)linkType;
- (unint64_t)maximumNumberOfPairVeifiesAllowed;
- (unint64_t)maximumPairVerifyFailureCount;
- (void)_doBonjourRemoveWithServer:(id)a3;
- (void)_doReachabilityUpdateForServer:(id)a3 withDictionary:(id)a4;
- (void)_handleBonjourAddOrUpdateWithEventInfo:(id)a3;
- (void)_handleBonjourBrowserEvent:(unsigned int)a3 eventInfo:(id)a4;
- (void)_handleBonjourRemoveWithEventInfo:(id)a3;
- (void)_handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4;
- (void)_invalidateAccessoryServers:(BOOL)a3;
- (void)_invalidateAndRemoveAccessoryServer:(id)a3;
- (void)_invalidateWACServers;
- (void)_matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_pendBonjourEvent:(id)a3;
- (void)_pendBonjourRemoveEvent:(id)a3;
- (void)_server:(id *)a3 forHAPWACAccessory:(id)a4;
- (void)_setReachability:(BOOL)a3 forServer:(id)a4;
- (void)_timerDidExpire:(id)a3;
- (void)devicePowerStateChanged:(unint64_t)a3;
- (void)discoverAccessoryServerWithIdentifier:(id)a3;
- (void)handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4;
- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5;
- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5;
- (void)notifyDelegatesOfWACCompletionWithIdentifier:(id)a3 error:(id)a4;
- (void)pendDelegateBlock:(id)a3 identifier:(id)a4;
- (void)pendDelegateOperation:(id)a3 identifier:(id)a4;
- (void)processPendingBonjourRemoveEvents:(id)a3;
- (void)processPendingBonjourRemoveEventsForDeviceID:(id)a3;
- (void)setBonjourEventTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateOperationQueue:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDiscoveredAccessoryServers:(id)a3;
- (void)setHapWACBrowser:(id)a3;
- (void)setPendingBonjourEvents:(id)a3;
- (void)setPowerManager:(id)a3;
- (void)setServerIdentifierToSkipBonjourUpdate:(id)a3;
- (void)startDiscoveringAccessoryServers;
- (void)startDiscoveringAirPlayAccessoriesWithDelegate:(id)a3;
- (void)startDiscoveringWACAccessoryServerWithIdentifier:(id)a3;
- (void)startDiscoveringWACAccessoryServers;
- (void)stopDiscoveringAccessoryServers;
- (void)stopDiscoveringWACAccessoryServersWithInvalidation:(BOOL)a3;
- (void)timerDidFire:(id)a3;
- (void)unitTest_handleBonjourBrowserEvent:(unsigned int)a3 eventInfo:(id)a4;
- (void)wacBrowser:(id)a3 didFindHAPWACAccessory:(id)a4;
- (void)wacBrowser:(id)a3 didFindUnconfiguredPairedHAPWACAccessory:(id)a4;
- (void)wacBrowser:(id)a3 didRemoveHAPWACAccessory:(id)a4;
@end

@implementation HAPAccessoryServerBrowserIP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverIdentifierToSkipBonjourUpdate, 0);
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_hapWACBrowser, 0);
  objc_storeStrong((id *)&self->_bonjourEventTimer, 0);
  objc_storeStrong((id *)&self->_pendingBonjourEvents, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_discoveredAccessoryServers, 0);
}

- (unint64_t)maximumNumberOfPairVeifiesAllowed
{
  return self->_maximumNumberOfPairVeifiesAllowed;
}

- (void)setServerIdentifierToSkipBonjourUpdate:(id)a3
{
}

- (NSString)serverIdentifierToSkipBonjourUpdate
{
  return self->_serverIdentifierToSkipBonjourUpdate;
}

- (void)setPowerManager:(id)a3
{
}

- (HAPPowerManager)powerManager
{
  return self->_powerManager;
}

- (void)setHapWACBrowser:(id)a3
{
}

- (HAPWACAccessoryBrowser)hapWACBrowser
{
  return self->_hapWACBrowser;
}

- (void)setBonjourEventTimer:(id)a3
{
}

- (HMFTimer)bonjourEventTimer
{
  return self->_bonjourEventTimer;
}

- (void)setPendingBonjourEvents:(id)a3
{
}

- (NSMutableSet)pendingBonjourEvents
{
  return self->_pendingBonjourEvents;
}

- (void)setDelegateOperationQueue:(id)a3
{
}

- (NSOperationQueue)delegateOperationQueue
{
  return self->_delegateOperationQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HAPAccessoryServerBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAccessoryServerBrowserDelegate *)WeakRetained;
}

- (void)setDiscoveredAccessoryServers:(id)a3
{
}

- (NSMutableSet)discoveredAccessoryServers
{
  return self->_discoveredAccessoryServers;
}

- (id)logIdentifier
{
  return @"IP Browser";
}

- (void)unitTest_handleBonjourBrowserEvent:(unsigned int)a3 eventInfo:(id)a4
{
  id v6 = a4;
  v7 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HAPAccessoryServerBrowserIP_unitTest_handleBonjourBrowserEvent_eventInfo___block_invoke;
  block[3] = &unk_1E69F25C0;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

uint64_t __76__HAPAccessoryServerBrowserIP_unitTest_handleBonjourBrowserEvent_eventInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleBonjourBrowserEvent:*(unsigned int *)(a1 + 48) eventInfo:*(void *)(a1 + 40)];
}

- (id)serverWithIdentifier:(id)a3 ignoreLPM:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [(HAPAccessoryServerBrowserIP *)self discoveredAccessoryServers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      v13 = [v12 identifier];
      int v14 = [v13 isEqual:v6];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    if ((!v4 || ![v12 wakeNumber]) && (objc_msgSend(v12, "isWacAccessory") & 1) == 0)
    {
      id v15 = v12;
      goto LABEL_15;
    }
  }
LABEL_13:
  id v15 = 0;
LABEL_15:

  return v15;
}

- (void)wacBrowser:(id)a3 didFindUnconfiguredPairedHAPWACAccessory:(id)a4
{
  id v5 = a4;
  id v6 = [(HAPAccessoryServerBrowser *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v43 = v5;
    __int16 v44 = 2112;
    uint64_t v45 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%{public}@WAC Browser found Unconfigured Accessory: %@", buf, 0x16u);
  }
  if ([*(id *)(a1 + 40) isHomeKitAccessory])
  {
    id v41 = 0;
    [*(id *)(a1 + 32) _server:&v41 forHAPWACAccessory:*(void *)(a1 + 40)];
    id v7 = (HAPAccessoryServerIP *)v41;
    if (!v7)
    {
      uint64_t v8 = [HAPAccessoryServerIP alloc];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [*(id *)(a1 + 32) keyStore];
      id v7 = [(HAPAccessoryServerIP *)v8 initWithHAPWACAccessory:v9 keystore:v10 browser:*(void *)(a1 + 32)];
    }
    uint64_t v11 = *(void **)(a1 + 32);
    v12 = [(HAPAccessoryServer *)v7 identifier];
    int v13 = [v11 isPaired:v12];

    int v14 = (void *)MEMORY[0x1D944E080]();
    id v15 = *(id *)(a1 + 32);
    v16 = HMFGetOSLogHandle();
    long long v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        long long v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v43 = v18;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Found unconfigured server paired with us - needs to reprovision", buf, 0xCu);
      }
      long long v19 = [*(id *)(a1 + 32) discoveredAccessoryServers];
      char v20 = [v19 containsObject:v7];

      if ((v20 & 1) == 0)
      {
        v21 = [*(id *)(a1 + 32) discoveredAccessoryServers];
        [v21 addObject:v7];
      }
      uint64_t v22 = [*(id *)(a1 + 32) delegate];
      if (objc_opt_respondsToSelector())
      {
        v23 = *(void **)(a1 + 32);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_76;
        v37[3] = &unk_1E69F4708;
        id v24 = v22;
        uint64_t v25 = *(void *)(a1 + 32);
        id v38 = v24;
        uint64_t v39 = v25;
        v40 = v7;
        v26 = [(HAPAccessoryServer *)v40 identifier];
        [v23 pendDelegateBlock:v37 identifier:v26];
      }
      if (objc_opt_respondsToSelector())
      {
        v27 = *(void **)(a1 + 32);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_2;
        v33[3] = &unk_1E69F4708;
        id v28 = v22;
        uint64_t v29 = *(void *)(a1 + 32);
        id v34 = v28;
        uint64_t v35 = v29;
        v36 = v7;
        v30 = [(HAPAccessoryServer *)v36 identifier];
        [v27 pendDelegateBlock:v33 identifier:v30];
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        uint64_t v32 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v43 = v31;
        __int16 v44 = 2112;
        uint64_t v45 = v32;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Ignoring accessory not paired with us: %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_76(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didFindAccessoryServerNeedingReprovisioning:*(void *)(a1 + 48) error:0];
}

uint64_t __83__HAPAccessoryServerBrowserIP_wacBrowser_didFindUnconfiguredPairedHAPWACAccessory___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didFindAccessoryServerForReprovisioning:*(void *)(a1 + 48)];
}

- (void)wacBrowser:(id)a3 didRemoveHAPWACAccessory:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HAPAccessoryServerBrowser *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v5;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Removing WAC Accessory: %@", buf, 0x16u);
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) deviceId];
  id v9 = [v7 serverWithIdentifier:v8 ignoreLPM:1];

  uint64_t v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = *(id *)(a1 + 32);
  v12 = HMFGetOSLogHandle();
  int v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@WAC accessory was removed invalidating server: %{public}@", buf, 0x16u);
    }
    id v15 = [*(id *)(a1 + 32) delegate];
    v16 = [[HAPAccessoryServerBrowserInvalidateServerOperation alloc] initWithServer:v9];
    long long v17 = *(void **)(a1 + 32);
    long long v18 = [v9 identifier];
    [v17 pendDelegateOperation:v16 identifier:v18];

    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      long long v19 = (void *)MEMORY[0x1E4F28B48];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke_73;
      v27[3] = &unk_1E69F45E0;
      objc_copyWeak(&v30, (id *)buf);
      id v28 = v15;
      id v20 = v9;
      id v29 = v20;
      v21 = [v19 blockOperationWithBlock:v27];
      uint64_t v22 = *(void **)(a1 + 32);
      v23 = [v20 identifier];
      [v22 pendDelegateOperation:v21 identifier:v23];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    id v24 = [*(id *)(a1 + 32) discoveredAccessoryServers];
    [v24 removeObject:v9];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      v26 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      id v34 = v26;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Unknown wac device was removed: %@", buf, 0x16u);
    }
  }
}

void __67__HAPAccessoryServerBrowserIP_wacBrowser_didRemoveHAPWACAccessory___block_invoke_73(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [*(id *)(a1 + 32) accessoryServerBrowser:WeakRetained didRemoveAccessoryServer:*(void *)(a1 + 40) error:0];
}

- (void)wacBrowser:(id)a3 didFindHAPWACAccessory:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HAPAccessoryServerBrowser *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v5;
    __int16 v33 = 2112;
    uint64_t v34 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%{public}@WAC Browser found wac accessory: %@", buf, 0x16u);
  }
  if (![*(id *)(a1 + 40) isHomeKitAccessory])
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v13;
      __int16 v33 = 2112;
      uint64_t v34 = v14;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring unknown accessory: %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 40) requiresOwnershipToken])
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v10;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring WAC accessory requiring ownership token", buf, 0xCu);
    }
LABEL_11:
    return;
  }
  id v30 = 0;
  [*(id *)(a1 + 32) _server:&v30 forHAPWACAccessory:*(void *)(a1 + 40)];
  id v15 = (HAPAccessoryServerIP *)v30;
  if (v15)
  {
    v16 = v15;
    [(HAPAccessoryServerIP *)v15 updateWithHAPWACAccessory:*(void *)(a1 + 40)];
  }
  else
  {
    long long v17 = [HAPAccessoryServerIP alloc];
    uint64_t v18 = *(void *)(a1 + 40);
    long long v19 = [*(id *)(a1 + 32) keyStore];
    v16 = [(HAPAccessoryServerIP *)v17 initWithHAPWACAccessory:v18 keystore:v19 browser:*(void *)(a1 + 32)];

    id v20 = [*(id *)(a1 + 32) discoveredAccessoryServers];
    [v20 addObject:v16];
  }
  v21 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v22 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke_72;
    v26[3] = &unk_1E69F4708;
    id v23 = v21;
    uint64_t v24 = *(void *)(a1 + 32);
    id v27 = v23;
    uint64_t v28 = v24;
    id v29 = v16;
    uint64_t v25 = [(HAPAccessoryServer *)v29 identifier];
    [v22 pendDelegateBlock:v26 identifier:v25];
  }
}

uint64_t __65__HAPAccessoryServerBrowserIP_wacBrowser_didFindHAPWACAccessory___block_invoke_72(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerBrowser:*(void *)(a1 + 40) didFindAccessoryServer:*(void *)(a1 + 48) stateChanged:0 stateNumber:0];
}

- (BOOL)recommendBrowserReset
{
  return 1;
}

- (void)_invalidateWACServers
{
  v2 = self;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServerBrowserIP *)self discoveredAccessoryServers];
  BOOL v4 = (void *)[v3 copy];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v40;
    *(void *)&long long v7 = 138543618;
    long long v35 = v7;
    id v36 = v5;
    v37 = v2;
    uint64_t v38 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        if (objc_msgSend(v11, "isWacAccessory", v35))
        {
          v12 = [v11 identifier];
          BOOL v13 = [(HAPAccessoryServerBrowser *)v2 isPaired:v12];

          if (v13)
          {
            uint64_t v14 = MEMORY[0x1D944E080]();
            id v15 = v2;
            v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              long long v17 = HMFGetLogIdentifier();
              uint64_t v18 = [v11 name];
              long long v19 = [v11 identifier];
              *(_DWORD *)buf = 138543874;
              __int16 v44 = v17;
              __int16 v45 = 2112;
              uint64_t v46 = v18;
              __int16 v47 = 2114;
              v48 = v19;
              _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory Server %@/%{public}@ is already paired - not removing the accessory server", buf, 0x20u);

              uint64_t v9 = v38;
            }

            id v20 = (void *)v14;
LABEL_17:
            goto LABEL_18;
          }
          if (([v11 hasBonjourDeviceInfo] & 1) != 0
            || [v11 isWacLegacy] && objc_msgSend(v11, "isWacComplete"))
          {
            uint64_t v21 = MEMORY[0x1D944E080]();
            uint64_t v22 = v2;
            id v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              uint64_t v25 = [v11 name];
              v26 = [v11 identifier];
              [v11 isWacLegacy];
              id v27 = HMFBooleanToString();
              [v11 isWacComplete];
              uint64_t v28 = HMFBooleanToString();
              *(_DWORD *)buf = 138544386;
              __int16 v44 = v24;
              __int16 v45 = 2112;
              uint64_t v46 = v25;
              __int16 v47 = 2114;
              v48 = v26;
              __int16 v49 = 2112;
              v50 = v27;
              __int16 v51 = 2112;
              v52 = v28;
              _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%{public}@Accessory Server %@/%{public}@ already has a Bonjour device info/completed WAC %@/%@ - not removing the accessory server", buf, 0x34u);

              v2 = v37;
              uint64_t v9 = v38;

              id v5 = v36;
            }

            id v20 = (void *)v21;
            goto LABEL_17;
          }
          id v29 = (void *)MEMORY[0x1D944E080]();
          id v30 = v2;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = HMFGetLogIdentifier();
            __int16 v33 = [v11 identifier];
            *(_DWORD *)buf = v35;
            __int16 v44 = v32;
            __int16 v45 = 2114;
            uint64_t v46 = v33;
            _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_INFO, "%{public}@Removing unpaired accessory %{public}@", buf, 0x16u);

            v2 = v37;
            id v5 = v36;
          }

          [(HAPAccessoryServerBrowserIP *)v30 _invalidateAndRemoveAccessoryServer:v11];
        }
LABEL_18:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v34 = [v5 countByEnumeratingWithState:&v39 objects:v53 count:16];
      uint64_t v8 = v34;
    }
    while (v34);
  }
}

- (void)_timerDidExpire:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  BOOL v4 = [(HAPAccessoryServerBrowserIP *)self pendingBonjourEvents];
  id v5 = (void *)[v4 copy];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    id v34 = v6;
    long long v35 = self;
    do
    {
      uint64_t v10 = 0;
      uint64_t v36 = v8;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
        v12 = [v11 objectForKeyedSubscript:@"kHAPBonjourEventReceivedTimeKey"];
        BOOL v13 = [v11 objectForKeyedSubscript:@"kHAPBonjourEventKey"];
        uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:v12];
        double v16 = v15;

        if (v16 > 40.0)
        {
          id v37 = 0;
          [(HAPAccessoryServerBrowserIP *)self _server:&v37 forBonjourDevice:v13];
          id v17 = v37;
          uint64_t v18 = v17;
          if (v17 && [v17 isSessionRestoreActive])
          {
            long long v19 = (void *)MEMORY[0x1D944E080]();
            id v20 = self;
            uint64_t v21 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = HMFGetLogIdentifier();
              id v23 = [v13 objectForKeyedSubscript:@"deviceID"];
              *(_DWORD *)buf = 138543618;
              v43 = v22;
              __int16 v44 = 2114;
              __int16 v45 = v23;
              _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Timed out,  Not handling pending Bonjour for %{public}@, as session restore is active", buf, 0x16u);

              id v6 = v34;
              self = v35;
            }
          }
          else
          {
            uint64_t v24 = (void *)MEMORY[0x1D944E080]();
            uint64_t v25 = self;
            v26 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              id v27 = HMFGetLogIdentifier();
              uint64_t v28 = [v13 objectForKeyedSubscript:@"deviceID"];
              *(_DWORD *)buf = 138543618;
              v43 = v27;
              __int16 v44 = 2114;
              __int16 v45 = v28;
              _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_INFO, "%{public}@Timed out, handling pending Bonjour event for %{public}@", buf, 0x16u);

              id v6 = v34;
              self = v35;
            }

            id v29 = [v13 objectForKeyedSubscript:@"deviceID"];
            [(HAPAccessoryServerBrowserIP *)v25 _purgePendingBonjourEvents:v29 withProcessing:1];
          }
          uint64_t v8 = v36;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v8);
  }

  id v30 = [(HAPAccessoryServerBrowserIP *)self pendingBonjourEvents];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    uint64_t v32 = [(HAPAccessoryServerBrowserIP *)self bonjourEventTimer];
    [v32 resume];
  }
}

- (void)timerDidFire:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HAPAccessoryServerBrowserIP *)self bonjourEventTimer];

  id v6 = v7;
  if (v5 == v7)
  {
    [(HAPAccessoryServerBrowserIP *)self _timerDidExpire:v7];
    id v6 = v7;
  }
}

- (void)devicePowerStateChanged:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v4 = [(HAPAccessoryServerBrowserIP *)self bonjourEventTimer];
    int v5 = [v4 isRunning];

    if (v5)
    {
      id v6 = [(HAPAccessoryServerBrowserIP *)self bonjourEventTimer];
      [v6 kick];
    }
  }
}

- (int)_purgePendingBonjourEvents:(id)a3 withProcessing:(BOOL)a4
{
  BOOL v39 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(HAPAccessoryServerBrowserIP *)self pendingBonjourEvents];
  id v7 = (void *)[v6 copy];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v7;
  uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
  int v9 = 0;
  if (v41)
  {
    uint64_t v10 = *(void *)v43;
    *(void *)&long long v8 = 138543618;
    long long v34 = v8;
    uint64_t v38 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        BOOL v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"kHAPBonjourEventKey", v34);
        uint64_t v14 = objc_msgSend(v13, "hmf_stringForKey:", @"deviceID");
        int v15 = [v14 isEqualToString:v5];

        if (v15)
        {
          double v16 = objc_msgSend(v13, "hmf_stringForKey:", @"name");
          id v17 = [v12 objectForKeyedSubscript:@"kHAPBonjourEventType"];
          uint64_t v18 = [(HAPAccessoryServerBrowserIP *)self pendingBonjourEvents];
          [v18 removeObject:v12];

          long long v19 = (void *)MEMORY[0x1D944E080]();
          id v20 = self;
          uint64_t v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v22 = v36 = v9;
            [(HAPAccessoryServerBrowserIP *)v20 pendingBonjourEvents];
            long long v35 = v16;
            id v23 = self;
            uint64_t v24 = v17;
            v26 = id v25 = v5;
            uint64_t v27 = [v26 count];
            *(_DWORD *)buf = 138544130;
            uint64_t v47 = v22;
            __int16 v48 = 2112;
            __int16 v49 = v24;
            __int16 v50 = 2112;
            __int16 v51 = v13;
            __int16 v52 = 2048;
            uint64_t v53 = v27;
            _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed pending Bonjour %@, Event: %@, Current Count: %lu", buf, 0x2Au);

            id v5 = v25;
            id v17 = v24;
            self = v23;
            double v16 = v35;

            int v9 = v36;
          }

          if (v39 && [v17 isEqualToString:@"kHAPBonjourEventType_Remove"])
          {
            uint64_t v28 = (void *)MEMORY[0x1D944E080]();
            id v29 = v20;
            id v30 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v37 = v17;
              uint64_t v32 = v31 = v9;
              *(_DWORD *)buf = v34;
              uint64_t v47 = v32;
              __int16 v48 = 2112;
              __int16 v49 = v16;
              _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_INFO, "%{public}@Processing pending Bonjour remove event for BonjourDevice with name %@", buf, 0x16u);

              int v9 = v31;
              id v17 = v37;
            }

            [(HAPAccessoryServerBrowserIP *)v29 _handleBonjourRemoveWithEventInfo:v13];
          }
          ++v9;

          uint64_t v10 = v38;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v41);
  }

  return v9;
}

- (void)processPendingBonjourRemoveEventsForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEventsForDeviceID___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __76__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEventsForDeviceID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgePendingBonjourEvents:*(void *)(a1 + 40) withProcessing:1];
}

- (int)_processPendingBonjourEvent:(id)a3
{
  return [(HAPAccessoryServerBrowserIP *)self _purgePendingBonjourEvents:a3 withProcessing:1];
}

- (void)_pendBonjourEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowserIP *)self pendingBonjourEvents];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    id v7 = [(HAPAccessoryServerBrowserIP *)self bonjourEventTimer];
    [v7 resume];
  }
  id v8 = [(HAPAccessoryServerBrowserIP *)self pendingBonjourEvents];
  [v8 addObject:v4];
}

- (void)_pendBonjourRemoveEvent:(id)a3
{
  v43[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v33 = 0;
  [(HAPAccessoryServerBrowserIP *)self _server:&v33 forBonjourDevice:v4];
  id v5 = v33;
  uint64_t v6 = v5;
  if (v5
    && ([v5 identifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [(HAPAccessoryServerBrowser *)self isPaired:v7],
        v7,
        !v8))
  {
    id v23 = (void *)MEMORY[0x1D944E080]();
    uint64_t v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v35 = v26;
      __int16 v36 = 2112;
      id v37 = v4;
      __int16 v38 = 2114;
      uint64_t v39 = (uint64_t)v6;
      _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%{public}@Handling Bonjour remove event %@ for unpaired accessory server: %{public}@", buf, 0x20u);
    }
    [v6 bonjourRemoveEvent];
    uint64_t v27 = objc_msgSend(v4, "hmf_stringForKey:", @"deviceID");
    int v28 = [(HAPAccessoryServerBrowserIP *)v24 _processPendingBonjourEvent:v27];

    if (!v28)
    {
      id v29 = (void *)MEMORY[0x1D944E080]();
      id v30 = v24;
      int v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v35 = v32;
        _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEBUG, "%{public}@None pending - processing the remove", buf, 0xCu);
      }
      [(HAPAccessoryServerBrowserIP *)v30 _handleBonjourRemoveWithEventInfo:v4];
    }
  }
  else
  {
    v43[0] = @"kHAPBonjourEventType_Remove";
    v42[0] = @"kHAPBonjourEventType";
    v42[1] = @"kHAPBonjourEventReceivedTimeKey";
    int v9 = [MEMORY[0x1E4F1C9C8] date];
    v42[2] = @"kHAPBonjourEventKey";
    v43[1] = v9;
    v43[2] = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];

    id v11 = (void *)MEMORY[0x1D944E080]();
    v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = [(HAPAccessoryServerBrowserIP *)v12 pendingBonjourEvents];
      uint64_t v16 = [v15 count];
      [v6 isSessionRestoreActive];
      id v17 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      long long v35 = v14;
      __int16 v36 = 2112;
      id v37 = v4;
      __int16 v38 = 2048;
      uint64_t v39 = v16;
      __int16 v40 = 2114;
      uint64_t v41 = v17;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Pending Bonjour remove event: %@, Current Count: %lu, session restore: %{public}@ ", buf, 0x2Au);
    }
    [(HAPAccessoryServerBrowserIP *)v12 _pendBonjourEvent:v10];
    if (v6 && ([v6 isSessionRestoreActive] & 1) == 0)
    {
      uint64_t v18 = (void *)MEMORY[0x1D944E080]();
      long long v19 = v12;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        uint64_t v22 = [v6 identifier];
        *(_DWORD *)buf = 138543618;
        long long v35 = v21;
        __int16 v36 = 2114;
        id v37 = v22;
        _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Marking all accessories for server %{public}@ as unreachable while confirming the remove event", buf, 0x16u);
      }
      [(HAPAccessoryServerBrowserIP *)v19 _setReachability:0 forServer:v6];
    }
  }
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  id v4 = [(HAPAccessoryServerBrowserIP *)self delegate];
  if (v4)
  {
    id v5 = [(HAPAccessoryServerBrowserIP *)self delegateQueue];
    if (v5)
    {
      uint64_t v6 = [(HAPAccessoryServerBrowserIP *)self delegate];
      char v7 = objc_opt_respondsToSelector();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)_setReachability:(BOOL)a3 forServer:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(a4, "accessories", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setReachable:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_invalidateAccessoryServers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(HAPAccessoryServerBrowserIP *)self discoveredAccessoryServers];
  uint64_t v7 = [v5 setWithSet:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        if (!v3
          || (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "identifier", (void)v16),
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              BOOL v15 = [(HAPAccessoryServerBrowser *)self isPaired:v14],
              v14,
              !v15))
        {
          -[HAPAccessoryServerBrowserIP _invalidateAndRemoveAccessoryServer:](self, "_invalidateAndRemoveAccessoryServer:", v13, (void)v16);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_server:(id *)a3 forHAPWACAccessory:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *a3 = 0;
    uint64_t v6 = [a4 deviceId];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [(HAPAccessoryServerBrowserIP *)self discoveredAccessoryServers];
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 identifier];
          int v13 = [v12 isEqualToString:v6];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v14 = v8;
    *a3 = v14;
  }
}

- (int)_server:(id *)a3 forBonjourDevice:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v22 = 0;
  uint64_t v7 = (const void *)BonjourDevice_CopyCFString();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(HAPAccessoryServerBrowserIP *)self discoveredAccessoryServers];
  id v9 = (id)[v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v13 = [v12 identifier];
        int v14 = [v13 isEqualToString:v7];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v7) {
    CFRelease(v7);
  }
  id v15 = v9;
  *a3 = v15;
  int v16 = v22;

  return v16;
}

- (void)_handleBonjourRemoveWithEventInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v16 = 0;
  [(HAPAccessoryServerBrowserIP *)self _server:&v16 forBonjourDevice:v4];
  id v5 = v16;
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = [v7 isPaired];
      *(_DWORD *)buf = 138543618;
      long long v18 = v9;
      __int16 v19 = 1024;
      LODWORD(v20) = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Authenticated: %d", buf, 0x12u);
    }
    [(HAPAccessoryServerBrowserIP *)self _doBonjourRemoveWithServer:v7];
  }
  else
  {
    uint64_t v11 = [v4 objectForKeyedSubscript:@"name"];
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    int v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v18 = v15;
      __int16 v19 = 2112;
      long long v20 = v11;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Removed BonjourDevice with name %@ but it was not a part of the discoveredAccessoryServers set", buf, 0x16u);
    }
  }
}

- (void)_doBonjourRemoveWithServer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 identifier];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      int v13 = v9;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing IP accessory server with device ID %{public}@", (uint8_t *)&v10, 0x16u);
    }
    [v4 bonjourRemoveEvent];
    [v4 unregisterForNotifications:v6];
    [(HAPAccessoryServerBrowserIP *)v6 _invalidateAndRemoveAccessoryServer:v4];
  }
}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(HAPAccessoryServerBrowser *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__HAPAccessoryServerBrowserIP_indicateNotificationFromServer_notifyType_withDictionary___block_invoke;
  v13[3] = &unk_1E69F4518;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  unint64_t v17 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __88__HAPAccessoryServerBrowserIP_indicateNotificationFromServer_notifyType_withDictionary___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v3 = objc_msgSend(v2, "hmf_numberForKey:", @"HAPAccessoryInstanceID");
  }
  else
  {
    BOOL v3 = 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 40), "discoveredAccessoryServers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        int v10 = [v9 identifier];
        id v11 = [*(id *)(a1 + 48) identifier];
        int v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          uint64_t v18 = *(void *)(a1 + 56);
          __int16 v19 = (void *)MEMORY[0x1D944E080]();
          id v20 = *(id *)(a1 + 40);
          uint64_t v21 = HMFGetOSLogHandle();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if (v18 == 1)
          {
            if (v22)
            {
              id v23 = HMFGetLogIdentifier();
              uint64_t v24 = [v9 identifier];
              *(_DWORD *)buf = 138543874;
              id v33 = v23;
              __int16 v34 = 2114;
              long long v35 = v24;
              __int16 v36 = 2114;
              id v37 = v3;
              _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Browser - Notification HAPNotification_ReachabilityUpdate from server %{public}@ with instanceId %{public}@", buf, 0x20u);
            }
            [*(id *)(a1 + 40) _doReachabilityUpdateForServer:v9 withDictionary:*(void *)(a1 + 32)];
          }
          else
          {
            if (v22)
            {
              id v25 = HMFGetLogIdentifier();
              v26 = +[HAPNotification typeToString:*(void *)(a1 + 56)];
              uint64_t v27 = [v9 identifier];
              *(_DWORD *)buf = 138544130;
              id v33 = v25;
              __int16 v34 = 2112;
              long long v35 = v26;
              __int16 v36 = 2114;
              id v37 = v27;
              __int16 v38 = 2114;
              uint64_t v39 = v3;
              _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Browser - Unhandled notification %@ from server %{public}@ with instanceId %{public}@", buf, 0x2Au);
            }
          }

          goto LABEL_23;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v13 = (void *)MEMORY[0x1D944E080]();
  id v14 = *(id *)(a1 + 40);
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = HMFGetLogIdentifier();
    unint64_t v17 = [*(id *)(a1 + 48) identifier];
    *(_DWORD *)buf = 138543618;
    id v33 = v16;
    __int16 v34 = 2114;
    long long v35 = v17;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@*** Server Browser Failed to find AccessoryServerIP object for handling notification: %{public}@", buf, 0x16u);
  }
LABEL_23:
}

- (void)_doReachabilityUpdateForServer:(id)a3 withDictionary:(id)a4
{
  *(void *)&v23[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 reachabilityPingEnabled])
  {
    int v8 = objc_msgSend(v7, "hmf_BOOLForKey:", @"HAPAccessoryReachable");
    id v9 = (void *)MEMORY[0x1D944E080]();
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v13 = [v6 identifier];
      int v20 = 138543874;
      uint64_t v21 = v12;
      __int16 v22 = 1024;
      *(_DWORD *)id v23 = v8;
      v23[2] = 2114;
      *(void *)&v23[3] = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@accessory server reachability via ping %d from accessory server %{public}@", (uint8_t *)&v20, 0x1Cu);
    }
    if ((v8 & 1) == 0)
    {
      id v14 = [v6 identifier];
      [(HAPAccessoryServerBrowserIP *)v10 _processPendingBonjourEvent:v14];
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = self;
    unint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      __int16 v19 = [v6 identifier];
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      *(void *)id v23 = v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@ignoring reachability update on browser - pings not enabled for accessory server %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)_invalidateAndRemoveAccessoryServer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isPreSoftAuthWacStarted];
  id v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Not invalidating accessory server during WAC progress - %@", buf, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing from discoveredAccessoryServers: %@", buf, 0x16u);
    }
    int v12 = [(HAPAccessoryServerBrowserIP *)v7 discoveredAccessoryServers];
    [v12 removeObject:v4];

    int v13 = [(HAPAccessoryServerBrowserIP *)v7 delegate];
    id v14 = [[HAPAccessoryServerBrowserInvalidateServerOperation alloc] initWithServer:v4];
    id v15 = [v4 identifier];
    [(HAPAccessoryServerBrowserIP *)v7 pendDelegateOperation:v14 identifier:v15];

    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak((id *)buf, v7);
      id v16 = (void *)MEMORY[0x1E4F28B48];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __67__HAPAccessoryServerBrowserIP__invalidateAndRemoveAccessoryServer___block_invoke;
      v20[3] = &unk_1E69F45E0;
      objc_copyWeak(&v23, (id *)buf);
      id v21 = v13;
      id v17 = v4;
      id v22 = v17;
      uint64_t v18 = [v16 blockOperationWithBlock:v20];
      __int16 v19 = [v17 identifier];
      [(HAPAccessoryServerBrowserIP *)v7 pendDelegateOperation:v18 identifier:v19];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __67__HAPAccessoryServerBrowserIP__invalidateAndRemoveAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [*(id *)(a1 + 32) accessoryServerBrowser:WeakRetained didRemoveAccessoryServer:*(void *)(a1 + 40) error:0];
}

- (void)_handleBonjourAddOrUpdateWithEventInfo:(id)a3
{
  id v5 = a3;
  id v4 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HAPAccessoryServerBrowserIP *)self _handleConnectionUpdateWithBonjourDeviceInfo:v5 socketInfo:0];
}

- (void)handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__HAPAccessoryServerBrowserIP_handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke;
  block[3] = &unk_1E69F4708;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __86__HAPAccessoryServerBrowserIP_handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionUpdateWithBonjourDeviceInfo:*(void *)(a1 + 40) socketInfo:*(void *)(a1 + 48)];
}

- (void)_handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v40 = 0;
  [(HAPAccessoryServerBrowserIP *)self _server:&v40 forBonjourDevice:v6];
  id v8 = v40;
  if (!v8)
  {
    if (v7) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    id v16 = [HAPAccessoryServerIP alloc];
    id v17 = [(HAPAccessoryServerBrowser *)self keyStore];
    uint64_t v18 = [(HAPAccessoryServerIP *)v16 initWithBonjourDeviceInfo:v6 keyStore:v17 browser:self discoveryMethod:v15];

    __int16 v19 = [(HAPAccessoryServer *)v18 identifier];
    int v20 = [(HAPAccessoryServerBrowserIP *)self serverIdentifierToSkipBonjourUpdate];
    int v21 = [v19 isEqual:v20];

    if (v7 || !v21)
    {
      id v22 = (void *)MEMORY[0x1D944E080]();
      id v23 = self;
      id v27 = HMFGetOSLogHandle();
      uint64_t v24 = v27;
      if (v18)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          long long v29 = [(HAPAccessoryServer *)v18 name];
          long long v30 = [(HAPAccessoryServer *)v18 identifier];
          *(_DWORD *)buf = 138543874;
          long long v42 = v28;
          __int16 v43 = 2112;
          id v44 = v29;
          __int16 v45 = 2114;
          uint64_t v46 = v30;
          _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@Discovered new accessory server %@/%{public}@ with BonjourDevice info", buf, 0x20u);
        }
        long long v31 = [(HAPAccessoryServerBrowserIP *)v23 discoveredAccessoryServers];
        [v31 addObject:v18];

        if (v7)
        {
          uint64_t v32 = (void *)MEMORY[0x1D944E080]();
          id v33 = v23;
          __int16 v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            long long v35 = HMFGetLogIdentifier();
            __int16 v36 = [(HAPAccessoryServer *)v18 identifier];
            *(_DWORD *)buf = 138543618;
            long long v42 = v35;
            __int16 v43 = 2112;
            id v44 = v36;
            _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_INFO, "%{public}@Saving socket info for newly discovered server %@", buf, 0x16u);
          }
          [(HAPAccessoryServerIP *)v18 setCachedSocketInfo:v7];
        }
        if ([(HAPAccessoryServerBrowserIP *)v23 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
        {
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __87__HAPAccessoryServerBrowserIP__handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke;
          v38[3] = &unk_1E69F46E0;
          v38[4] = v23;
          uint64_t v39 = v18;
          id v37 = [(HAPAccessoryServer *)v39 identifier];
          [(HAPAccessoryServerBrowserIP *)v23 pendDelegateBlock:v38 identifier:v37];
        }
        [(HAPAccessoryServer *)v18 registerForNotifications:v23];
        goto LABEL_26;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v42 = v25;
        __int16 v43 = 2112;
        id v44 = v6;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create an accessory server from the TXT record data after discovering BonjourDevice %@", buf, 0x16u);
        goto LABEL_24;
      }
    }
    else
    {
      id v22 = (void *)MEMORY[0x1D944E080]();
      id v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        __int16 v26 = [(HAPAccessoryServer *)v18 identifier];
        *(_DWORD *)buf = 138543618;
        long long v42 = v25;
        __int16 v43 = 2112;
        id v44 = v26;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@*** Skipping bonjour add for %@.  Remove HAPServerIPBrowserSkipBonjourUpdateForIdentifier from preferences to clear", buf, 0x16u);

LABEL_24:
      }
    }

LABEL_26:

    goto LABEL_27;
  }
  id v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v8 identifier];
    [v8 isWacAccessory];
    id v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    long long v42 = v12;
    __int16 v43 = 2114;
    id v44 = v13;
    __int16 v45 = 2114;
    uint64_t v46 = v14;
    __int16 v47 = 2112;
    id v48 = v6;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating IP accessory server %{public}@ wacAccessory:%{public}@ with new BonjourDevice info: %@", buf, 0x2Au);
  }
  [(HAPAccessoryServerBrowserIP *)v10 _setReachability:1 forServer:v8];
  [v8 updateWithBonjourDeviceInfo:v6 socketInfo:v7];
LABEL_27:
}

void __87__HAPAccessoryServerBrowserIP__handleConnectionUpdateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

- (void)_handleBonjourBrowserEvent:(unsigned int)a3 eventInfo:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_msgSend(v6, "hmf_stringForKey:", @"deviceID");
  id v8 = objc_msgSend(v6, "hmf_stringForKey:", @"name");
  if (a3 != 3)
  {
    if (a3 != 2)
    {
      if (a3 == 1 && v6)
      {
        id v9 = (void *)MEMORY[0x1D944E080]();
        id v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          uint64_t v41 = v12;
          __int16 v42 = 2112;
          __int16 v43 = v8;
          __int16 v44 = 2114;
          __int16 v45 = v7;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Received add/update message for BonjourDevice with name '%@', id %{public}@", buf, 0x20u);
        }
        int v13 = [(HAPAccessoryServerBrowserIP *)v10 _purgePendingBonjourEvents:v7 withProcessing:0];
        if (v13)
        {
          int v14 = v13;
          uint64_t v15 = (void *)MEMORY[0x1D944E080]();
          id v16 = v10;
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v18;
            __int16 v42 = 1024;
            LODWORD(v43) = v14;
            _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Purged %d pending remove events", buf, 0x12u);
          }
        }
        [(HAPAccessoryServerBrowserIP *)v10 _handleBonjourAddOrUpdateWithEventInfo:v6];
      }
      goto LABEL_24;
    }
    if (!v6) {
      goto LABEL_24;
    }
    id v39 = 0;
    [(HAPAccessoryServerBrowserIP *)self _server:&v39 forBonjourDevice:v6];
    id v23 = v39;
    int v24 = [v23 isSessionEstablished];
    if ([v23 wakeNumber])
    {
      id v25 = (void *)MEMORY[0x1D944E080]();
      __int16 v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        long long v29 = [v23 identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v28;
        __int16 v42 = 2114;
        __int16 v43 = v29;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_INFO, "%{public}@pending bonjour remove event for suspended accessory server: %{public}@", buf, 0x16u);
      }
    }
    else if (!v24)
    {
      if ([v23 isWacAccessory] && (objc_msgSend(v23, "isWacComplete") & 1) == 0)
      {
        __int16 v34 = (void *)MEMORY[0x1D944E080]();
        long long v35 = self;
        __int16 v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          id v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v41 = v37;
          __int16 v42 = 2112;
          __int16 v43 = v8;
          _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_DEBUG, "%{public}@WAC in progress, ignoring the remove event for BonjourDevice with name %@", buf, 0x16u);
        }
      }
      else
      {
        long long v30 = (void *)MEMORY[0x1D944E080]();
        long long v31 = self;
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v41 = v33;
          __int16 v42 = 2112;
          __int16 v43 = v8;
          _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_INFO, "%{public}@No session yet, processing the remove event for BonjourDevice with name %@", buf, 0x16u);
        }
        [(HAPAccessoryServerBrowserIP *)v31 _handleBonjourRemoveWithEventInfo:v6];
      }
      goto LABEL_23;
    }
    [(HAPAccessoryServerBrowserIP *)self _pendBonjourRemoveEvent:v6];
LABEL_23:

    goto LABEL_24;
  }
  __int16 v19 = (void *)MEMORY[0x1D944E080]();
  int v20 = self;
  int v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v22;
    _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Received a stop browsing event for the BonjourBrowser, invalidating all unpaired accessory servers", buf, 0xCu);
  }
  [(HAPAccessoryServerBrowserIP *)v20 _purgePendingBonjourEvents:v7 withProcessing:1];
  [(HAPAccessoryServerBrowserIP *)v20 _invalidateAccessoryServers:1];
  if ([(HAPAccessoryServerBrowserIP *)v20 _delegateRespondsToSelector:sel_accessoryServerBrowser_didStopDiscoveringWithError_])
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __68__HAPAccessoryServerBrowserIP__handleBonjourBrowserEvent_eventInfo___block_invoke;
    v38[3] = &unk_1E69F4330;
    v38[4] = v20;
    [(HAPAccessoryServerBrowserIP *)v20 pendDelegateBlock:v38 identifier:0];
  }
LABEL_24:
}

void __68__HAPAccessoryServerBrowserIP__handleBonjourBrowserEvent_eventInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStopDiscoveringWithError:0];
}

- (unint64_t)maximumPairVerifyFailureCount
{
  return self->_maximumNumberOfPairVeifiesAllowed;
}

- (void)_matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, id))a5;
  if (v10)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = [(HAPAccessoryServerBrowserIP *)self discoveredAccessoryServers];
    id v12 = [v11 allObjects];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v16 matchesSetupID:v8 serverIdentifier:v9])
          {
            uint64_t v18 = [v16 identifier];
            BOOL v19 = [(HAPAccessoryServerBrowser *)self isPaired:v18];

            uint64_t v20 = [v16 hasPairings];
            uint64_t v13 = v19 | v20;
            if (v13 == 1)
            {
              uint64_t v21 = v20;
              context = (void *)MEMORY[0x1D944E080]();
              id v22 = self;
              id v23 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                __int16 v26 = HMFGetLogIdentifier();
                int v24 = [NSNumber numberWithBool:v19];
                id v25 = [NSNumber numberWithBool:v21];
                *(_DWORD *)buf = 138544386;
                id v33 = v26;
                __int16 v34 = 2112;
                long long v35 = v16;
                __int16 v36 = 2114;
                id v37 = v8;
                __int16 v38 = 2114;
                id v39 = v24;
                __int16 v40 = 2114;
                uint64_t v41 = v25;
                _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%{public}@IP Accessory server %@ matches setupID %{public}@ and is paired/hasPairings: (%{public}@/%{public}@)", buf, 0x34u);
              }
            }
            id v17 = v16;
            goto LABEL_16;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v42 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    id v17 = 0;
LABEL_16:

    v10[2](v10, v13, v17);
  }
}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServerBrowser *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__HAPAccessoryServerBrowserIP_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E69F3D58;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __98__HAPAccessoryServerBrowserIP_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _matchAccessoryServerWithSetupID:*(void *)(a1 + 40) serverIdentifier:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)processPendingBonjourRemoveEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEvents___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__HAPAccessoryServerBrowserIP_processPendingBonjourRemoveEvents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPendingBonjourEvent:*(void *)(a1 + 40)];
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverWithIdentifier:*(void *)(a1 + 40) ignoreLPM:1];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v3 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_2;
      id v17 = &unk_1E69F46E0;
      id v18 = v4;
      id v5 = &v19;
      id v19 = v2;
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = &v14;
LABEL_6:
      objc_msgSend(v4, "pendDelegateBlock:identifier:", v7, v6, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else if ([v3 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_3;
    id v11 = &unk_1E69F46E0;
    id v12 = v4;
    id v5 = &v13;
    id v13 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = &v8;
    goto LABEL_6;
  }
}

void __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:0 stateNumber:0];
}

void __69__HAPAccessoryServerBrowserIP_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

- (void)notifyDelegatesOfWACCompletionWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HAPAccessoryServerBrowserIP *)self _delegateRespondsToSelector:sel_accessoryServerBrowser_didFinishWACForAccessoryWithIdentifier_error_])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__HAPAccessoryServerBrowserIP_notifyDelegatesOfWACCompletionWithIdentifier_error___block_invoke;
    v8[3] = &unk_1E69F4708;
    v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(HAPAccessoryServerBrowserIP *)self pendDelegateBlock:v8 identifier:v9];
  }
}

void __82__HAPAccessoryServerBrowserIP_notifyDelegatesOfWACCompletionWithIdentifier_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFinishWACForAccessoryWithIdentifier:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (id)visible2Pt4Networks
{
  id v2 = [(HAPAccessoryServerBrowserIP *)self hapWACBrowser];
  BOOL v3 = [v2 visible2Pt4Networks];

  return v3;
}

- (void)stopDiscoveringWACAccessoryServersWithInvalidation:(BOOL)a3
{
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__HAPAccessoryServerBrowserIP_stopDiscoveringWACAccessoryServersWithInvalidation___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __82__HAPAccessoryServerBrowserIP_stopDiscoveringWACAccessoryServersWithInvalidation___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for WAC accessories", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) hapWACBrowser];
  [v6 stopDiscoveringAccessoryServers];

  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _invalidateWACServers];
  }
}

- (void)stopDiscoveringAccessoryServers
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HAPAccessoryServerBrowserIP_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __62__HAPAccessoryServerBrowserIP_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for IP accessories", (uint8_t *)&v8, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  if (v6[7])
  {
    BonjourBrowser_Stop();
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 56));
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    id v6 = *(void **)(a1 + 32);
  }
  int v7 = [v6 powerManager];
  [v7 deRegisterFromSleepWake:*(void *)(a1 + 32)];
}

- (void)pendDelegateOperation:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  if (a4) {
    [v7 setName:a4];
  }
  id v6 = [(HAPAccessoryServerBrowserIP *)self delegateOperationQueue];
  [v6 addOperation:v7];
}

- (void)pendDelegateBlock:(id)a3 identifier:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28B48];
  id v7 = a4;
  id v8 = [v6 blockOperationWithBlock:a3];
  [(HAPAccessoryServerBrowserIP *)self pendDelegateOperation:v8 identifier:v7];
}

- (void)startDiscoveringAirPlayAccessoriesWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HAPAccessoryServerBrowserIP_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __78__HAPAccessoryServerBrowserIP_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for AirPlay WAC accessories...", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) hapWACBrowser];
  [v6 startDiscoveringAirPlayAccessoriesWithDelegate:*(void *)(a1 + 40)];
}

- (void)startDiscoveringWACAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __80__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for HAP WAC accessories with identifier: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  int v7 = [*(id *)(a1 + 32) hapWACBrowser];
  [v7 discoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

- (void)startDiscoveringWACAccessoryServers
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __66__HAPAccessoryServerBrowserIP_startDiscoveringWACAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for HAP WAC accessories...", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) hapWACBrowser];
  [v6 startDiscoveringAccessoryServers];
}

- (void)startDiscoveringAccessoryServers
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting browse for IP accessories...", buf, 0xCu);
  }
  int v6 = [*(id *)(a1 + 32) _initializeAndStartBonjourBrowser];
  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didStartDiscoveringWithError_])
  {
    int v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke_45;
    v12[3] = &unk_1E69F3DD0;
    v12[4] = v7;
    int v13 = v6;
    [v7 pendDelegateBlock:v12 identifier:0];
  }
  int v8 = +[HAPPowerManager sharedInstance];
  [*(id *)(a1 + 32) setPowerManager:v8];

  uint64_t v9 = [*(id *)(a1 + 32) powerManager];
  __int16 v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v10 workQueue];
  [v9 registerForSleepWake:v10 queue:v11];
}

void __63__HAPAccessoryServerBrowserIP_startDiscoveringAccessoryServers__block_invoke_45(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = HMErrorFromOSStatus(*(unsigned int *)(a1 + 40));
  [v4 accessoryServerBrowser:v2 didStartDiscoveringWithError:v3];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HAPAccessoryServerBrowserIP_setDelegate_queue___block_invoke;
  block[3] = &unk_1E69F4708;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __49__HAPAccessoryServerBrowserIP_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setDelegateQueue:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) delegateOperationQueue];
  [v3 setUnderlyingQueue:v2];
}

- (int)_initializeAndStartBonjourBrowser
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HAPAccessoryServerBrowserIP__initializeAndStartBonjourBrowser__block_invoke;
  v8[3] = &unk_1E69F1E10;
  v8[4] = self;
  id v3 = (void *)MEMORY[0x1D944E2D0](v8, a2);
  p_bonjourBrowser = &self->_bonjourBrowser;
  if (self->_bonjourBrowser)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = BonjourBrowser_Create();
    if (v5
      || ([(HAPAccessoryServerBrowser *)self workQueue],
          id v6 = objc_claimAutoreleasedReturnValue(),
          BonjourBrowser_SetDispatchQueue(),
          v6,
          BonjourBrowser_SetEventHandlerBlock(),
          (int v5 = BonjourBrowser_Start()) != 0))
    {
      if (*p_bonjourBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(*p_bonjourBrowser);
        *p_bonjourBrowser = 0;
      }
    }
  }

  return v5;
}

uint64_t __64__HAPAccessoryServerBrowserIP__initializeAndStartBonjourBrowser__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleBonjourBrowserEvent:a2 eventInfo:a3];
}

- (int64_t)linkType
{
  return 1;
}

- (HAPAccessoryServerBrowserIP)initWithQueue:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HAPAccessoryServerBrowserIP;
  int v5 = [(HAPAccessoryServerBrowser *)&v32 initWithQueue:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    discoveredAccessoryServers = v5->_discoveredAccessoryServers;
    v5->_discoveredAccessoryServers = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    pendingBonjourEvents = v5->_pendingBonjourEvents;
    v5->_pendingBonjourEvents = (NSMutableSet *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:8.0];
    bonjourEventTimer = v5->_bonjourEventTimer;
    v5->_bonjourEventTimer = (HMFTimer *)v10;

    [(HMFTimer *)v5->_bonjourEventTimer setDelegate:v5];
    id v12 = v5->_bonjourEventTimer;
    id v13 = [(HAPAccessoryServerBrowser *)v5 workQueue];
    [(HMFTimer *)v12 setDelegateQueue:v13];

    uint64_t v14 = [[HAPWACAccessoryBrowser alloc] initWithDelegate:v5 queue:v4];
    hapWACBrowser = v5->_hapWACBrowser;
    v5->_hapWACBrowser = v14;

    uint64_t v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    delegateOperationQueue = v5->_delegateOperationQueue;
    v5->_delegateOperationQueue = v16;

    [(NSOperationQueue *)v5->_delegateOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_delegateOperationQueue setName:@"HAPAccessoryServerBrowserIPDelegateOperationQueue"];
    id v18 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v19 = [v18 preferenceForKey:@"HAPServerIPBrowserServerIdentifierToSkipBonjourUpdates"];
    uint64_t v20 = [v19 stringValue];
    serverIdentifierToSkipBonjourUpdate = v5->_serverIdentifierToSkipBonjourUpdate;
    v5->_serverIdentifierToSkipBonjourUpdate = (NSString *)v20;

    id v22 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v23 = [v22 preferenceForKey:@"HAPMaximumConsecutiveIPPairVerifyFailures"];
    int v24 = [v23 numberValue];

    if (v24) {
      uint64_t v25 = [v24 unsignedIntValue];
    }
    else {
      uint64_t v25 = 2;
    }
    v5->_maximumNumberOfPairVeifiesAllowed = v25;
    if (v5->_serverIdentifierToSkipBonjourUpdate)
    {
      __int16 v26 = (void *)MEMORY[0x1D944E080]();
      id v27 = v5;
      long long v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = HMFGetLogIdentifier();
        long long v30 = v5->_serverIdentifierToSkipBonjourUpdate;
        *(_DWORD *)buf = 138543618;
        __int16 v34 = v29;
        __int16 v35 = 2112;
        __int16 v36 = v30;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_INFO, "%{public}@Skipping bonjour updates for server with identifier: %@", buf, 0x16u);
      }
    }
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50 != -1) {
    dispatch_once(&logCategory__hmf_once_t50, &__block_literal_global_10215);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v51;

  return v2;
}

uint64_t __42__HAPAccessoryServerBrowserIP_logCategory__block_invoke()
{
  logCategory__hmf_once___int16 v51 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end