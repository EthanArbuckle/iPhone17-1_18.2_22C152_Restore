@interface HAPWACAccessoryBrowser
+ (id)logCategory;
- (CUWiFiScanner)cuWiFiScanner;
- (HAPAirPlayAccessoryBrowserDelegate)airplayDelegate;
- (HAPWACAccessoryBrowser)initWithDelegate:(id)a3 queue:(id)a4;
- (HAPWACAccessoryBrowserDelegate)delegate;
- (HMFTimer)backoffTimer;
- (NSDate)browsingStartTime;
- (NSMutableSet)found2Pt4Networks;
- (NSMutableSet)foundUnconfiguredPairedAccessories;
- (NSMutableSet)foundUnconfiguredUnpairedAccessories;
- (NSString)browsingIdentifier;
- (NSString)scanning2Pt4SSID;
- (id)_removeUnconfiguredWACDevice:(id)a3;
- (id)found2Pt4Completion;
- (id)logIdentifier;
- (id)visible2Pt4Networks;
- (unint64_t)state;
- (void)_addFoundUnconfiguredUnpairedWACDevice:(id)a3;
- (void)_handleBrowsingBackOffTimerExpiry;
- (void)_handleChangeUnconfiguredPairedWACAccessory:(id)a3;
- (void)_handleChangeUnconfiguredUnpairedWACAccessory:(id)a3;
- (void)_handleNewUnconfiguredUnpairedWACDevice:(id)a3;
- (void)_handleUnconfiguredPairedWACDevice:(id)a3;
- (void)_initWiFiScannerWithScanner:(id)a3;
- (void)_reportFound2Pt4Network:(id)a3;
- (void)_restartBrowsingWithAllNetworks;
- (void)_startBrowsingForWACAccessories;
- (void)_stopBrowsingForWACAccessories;
- (void)discoverAccessoryServerWithIdentifier:(id)a3;
- (void)handleChangeUnconfiguredWACDevice:(id)a3;
- (void)handleFoundAPDevice:(id)a3;
- (void)handleFoundUnconfiguredPairedWACDevice:(id)a3;
- (void)handleFoundUnconfiguredUnpairedWACDevice:(id)a3;
- (void)handleRemovedUnconfiguredWACDevice:(id)a3;
- (void)initWiFiScannerWithScanner:(id)a3;
- (void)scan2Pt4APWithSSID:(id)a3 completion:(id)a4;
- (void)setAirplayDelegate:(id)a3;
- (void)setBrowsingIdentifier:(id)a3;
- (void)setBrowsingStartTime:(id)a3;
- (void)setCuWiFiScanner:(id)a3;
- (void)setFound2Pt4Completion:(id)a3;
- (void)setFound2Pt4Networks:(id)a3;
- (void)setFoundUnconfiguredPairedAccessories:(id)a3;
- (void)setFoundUnconfiguredUnpairedAccessories:(id)a3;
- (void)setScanning2Pt4SSID:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)startDiscoveringAccessoryServers;
- (void)startDiscoveringAirPlayAccessoriesWithDelegate:(id)a3;
- (void)stopDiscoveringAccessoryServers;
- (void)timerDidFire:(id)a3;
@end

@implementation HAPWACAccessoryBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_cuWiFiScanner, 0);
  objc_storeStrong((id *)&self->_found2Pt4Networks, 0);
  objc_storeStrong((id *)&self->_foundUnconfiguredPairedAccessories, 0);
  objc_storeStrong((id *)&self->_foundUnconfiguredUnpairedAccessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_found2Pt4Completion, 0);
  objc_storeStrong((id *)&self->_scanning2Pt4SSID, 0);
  objc_destroyWeak((id *)&self->_airplayDelegate);
  objc_storeStrong((id *)&self->_browsingStartTime, 0);

  objc_storeStrong((id *)&self->_browsingIdentifier, 0);
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setCuWiFiScanner:(id)a3
{
}

- (CUWiFiScanner)cuWiFiScanner
{
  return self->_cuWiFiScanner;
}

- (void)setFound2Pt4Networks:(id)a3
{
}

- (NSMutableSet)found2Pt4Networks
{
  return self->_found2Pt4Networks;
}

- (void)setFoundUnconfiguredPairedAccessories:(id)a3
{
}

- (NSMutableSet)foundUnconfiguredPairedAccessories
{
  return self->_foundUnconfiguredPairedAccessories;
}

- (void)setFoundUnconfiguredUnpairedAccessories:(id)a3
{
}

- (NSMutableSet)foundUnconfiguredUnpairedAccessories
{
  return self->_foundUnconfiguredUnpairedAccessories;
}

- (HAPWACAccessoryBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPWACAccessoryBrowserDelegate *)WeakRetained;
}

- (void)setFound2Pt4Completion:(id)a3
{
}

- (id)found2Pt4Completion
{
  return self->_found2Pt4Completion;
}

- (void)setScanning2Pt4SSID:(id)a3
{
}

- (NSString)scanning2Pt4SSID
{
  return self->_scanning2Pt4SSID;
}

- (void)setAirplayDelegate:(id)a3
{
}

- (HAPAirPlayAccessoryBrowserDelegate)airplayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airplayDelegate);

  return (HAPAirPlayAccessoryBrowserDelegate *)WeakRetained;
}

- (void)setBrowsingStartTime:(id)a3
{
}

- (NSDate)browsingStartTime
{
  return self->_browsingStartTime;
}

- (void)setBrowsingIdentifier:(id)a3
{
}

- (NSString)browsingIdentifier
{
  return self->_browsingIdentifier;
}

- (id)logIdentifier
{
  return @"WAC Browser";
}

- (void)_reportFound2Pt4Network:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAPWACAccessoryBrowser *)self found2Pt4Completion];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(HAPWACAccessoryBrowser *)self scanning2Pt4SSID];

    if (v7)
    {
      if (!v4)
      {
        v10 = (void *)MEMORY[0x1D944E080]();
        v11 = self;
        v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v14 = HMFGetLogIdentifier();
          int v16 = 138543618;
          v17 = v14;
          __int16 v18 = 2112;
          id v19 = 0;
          _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@No 2.4 AP found with ssid: %@", (uint8_t *)&v16, 0x16u);
        }
        goto LABEL_10;
      }
      v8 = [(HAPWACAccessoryBrowser *)self scanning2Pt4SSID];
      int v9 = [v8 isEqual:v4];

      if (v9)
      {
        v10 = (void *)MEMORY[0x1D944E080]();
        v11 = self;
        v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = HMFGetLogIdentifier();
          int v16 = 138543618;
          v17 = v13;
          __int16 v18 = 2112;
          id v19 = v4;
          _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Found 2.4 AP found with ssid: %@", (uint8_t *)&v16, 0x16u);
        }
LABEL_10:

        v15 = [(HAPWACAccessoryBrowser *)v11 found2Pt4Completion];
        v15[2]();

        [(HAPWACAccessoryBrowser *)self setFound2Pt4Completion:0];
        [(HAPWACAccessoryBrowser *)self setScanning2Pt4SSID:0];
        [(HAPWACAccessoryBrowser *)self _handleBrowsingBackOffTimerExpiry];
      }
    }
  }
}

- (void)scan2Pt4APWithSSID:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D944E080]();
  int v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Scanning for 2.4 AP SSID: %@", buf, 0x16u);
  }
  v12 = [(HAPAccessoryServerBrowser *)v9 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HAPWACAccessoryBrowser_scan2Pt4APWithSSID_completion___block_invoke;
  block[3] = &unk_1E69F4070;
  block[4] = v9;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

uint64_t __56__HAPWACAccessoryBrowser_scan2Pt4APWithSSID_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setScanning2Pt4SSID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setFound2Pt4Completion:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) found2Pt4Networks];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _reportFound2Pt4Network:v5];
  }
  else
  {
    [v4 _handleBrowsingBackOffTimerExpiry];
    id v7 = *(void **)(a1 + 32);
    return [v7 _startBrowsingForWACAccessories];
  }
}

- (id)visible2Pt4Networks
{
  v2 = [(HAPWACAccessoryBrowser *)self found2Pt4Networks];
  int v3 = (void *)[v2 copy];

  return v3;
}

- (id)_removeUnconfiguredWACDevice:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [(HAPWACAccessoryBrowser *)self foundUnconfiguredUnpairedAccessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
      v11 = [v10 deviceId];
      v12 = [v4 deviceId];
      int v13 = [v11 isEqual:v12];

      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Removing accessory: %@", buf, 0x16u);
    }
    id v14 = v10;

    if (v14)
    {
      id v19 = [(HAPWACAccessoryBrowser *)v16 foundUnconfiguredUnpairedAccessories];
      [v19 removeObject:v14];

      __int16 v20 = (void *)MEMORY[0x1D944E080]();
      id v21 = v16;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Reporting removal of accessory: %@", buf, 0x16u);
      }
      uint64_t v5 = [(HAPWACAccessoryBrowser *)v21 delegate];
      [v5 wacBrowser:v21 didRemoveHAPWACAccessory:v14];
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:
    id v14 = 0;
LABEL_16:
  }

  return v14;
}

- (void)handleRemovedUnconfiguredWACDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HAPWACAccessoryBrowser_handleRemovedUnconfiguredWACDevice___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HAPWACAccessoryBrowser_handleRemovedUnconfiguredWACDevice___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = [[HAPWACAccessory alloc] initWithWiFiDevice:*(void *)(a1 + 32)];
    id v2 = (id)[*(id *)(a1 + 40) _removeUnconfiguredWACDevice:v7];
    if ([(HAPWACAccessory *)v7 supportsAirPlay])
    {
      int v3 = [*(id *)(a1 + 40) airplayDelegate];

      if (v3)
      {
        id v4 = [*(id *)(a1 + 40) airplayDelegate];
        uint64_t v5 = *(void *)(a1 + 40);
        id v6 = [(HAPWACAccessory *)v7 cuWiFiDevice];
        [v4 wacBrowser:v5 didRemoveAirPlayDevice:v6];
      }
    }
  }
}

- (void)_handleChangeUnconfiguredPairedWACAccessory:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(HAPWACAccessoryBrowser *)self foundUnconfiguredPairedAccessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v10 deviceId];
        v12 = [v4 deviceId];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          [v10 updateWithHAPWACAccessory:v4];

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v14 = (void *)MEMORY[0x1D944E080]();
  v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v25 = v17;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Changed paired accessory %@ did not match previously found - handle as new", buf, 0x16u);
  }
  __int16 v18 = [MEMORY[0x1E4F1C9C8] date];
  id v19 = [(HAPWACAccessoryBrowser *)v15 browsingStartTime];
  [v18 timeIntervalSinceDate:v19];
  objc_msgSend(v4, "setDiscoveryTime:");

  [(HAPWACAccessoryBrowser *)v15 _handleUnconfiguredPairedWACDevice:v4];
LABEL_13:
}

- (void)_handleChangeUnconfiguredUnpairedWACAccessory:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [(HAPWACAccessoryBrowser *)self foundUnconfiguredUnpairedAccessories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v11 = [v10 deviceId];
        v12 = [v4 deviceId];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          [v10 updateWithHAPWACAccessory:v4];
          if ([v4 supportsAirPlay])
          {
            long long v20 = [(HAPWACAccessoryBrowser *)self airplayDelegate];

            if (v20)
            {
              long long v21 = (void *)MEMORY[0x1D944E080]();
              long long v22 = self;
              long long v23 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                v24 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v32 = v24;
                __int16 v33 = 2112;
                id v34 = v4;
                _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Changed AirPlay WAC Accessory: %@", buf, 0x16u);
              }
              long long v25 = [(HAPWACAccessoryBrowser *)v22 airplayDelegate];
              __int16 v26 = [v4 cuWiFiDevice];
              [v25 wacBrowser:v22 didUpdateAirPlayDevice:v26];
            }
          }

          goto LABEL_18;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v14 = (void *)MEMORY[0x1D944E080]();
  v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v32 = v17;
    __int16 v33 = 2112;
    id v34 = v4;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Changed accessory %@ did not match previously found - handle as new", buf, 0x16u);
  }
  __int16 v18 = [MEMORY[0x1E4F1C9C8] date];
  id v19 = [(HAPWACAccessoryBrowser *)v15 browsingStartTime];
  [v18 timeIntervalSinceDate:v19];
  objc_msgSend(v4, "setDiscoveryTime:");

  [(HAPWACAccessoryBrowser *)v15 _addFoundUnconfiguredUnpairedWACDevice:v4];
LABEL_18:
}

- (void)handleChangeUnconfiguredWACDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HAPWACAccessoryBrowser_handleChangeUnconfiguredWACDevice___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__HAPWACAccessoryBrowser_handleChangeUnconfiguredWACDevice___block_invoke(uint64_t a1)
{
  id v4 = [[HAPWACAccessory alloc] initWithWiFiDevice:*(void *)(a1 + 32)];
  BOOL v2 = [(HAPWACAccessory *)v4 homeKitPaired];
  int v3 = *(void **)(a1 + 40);
  if (v2) {
    [v3 _handleChangeUnconfiguredPairedWACAccessory:v4];
  }
  else {
    [v3 _handleChangeUnconfiguredUnpairedWACAccessory:v4];
  }
}

- (void)_handleUnconfiguredPairedWACDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAPWACAccessoryBrowser *)self foundUnconfiguredPairedAccessories];
  [v5 addObject:v4];

  id v6 = [(HAPWACAccessoryBrowser *)self browsingIdentifier];

  if (!v6
    || ([(HAPWACAccessoryBrowser *)self browsingIdentifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v4 deviceId],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    v10 = (void *)MEMORY[0x1D944E080]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Reporting HomeKit Paired WAC Accessory: %@", (uint8_t *)&v15, 0x16u);
    }
    id v14 = [(HAPWACAccessoryBrowser *)v11 delegate];
    [v14 wacBrowser:v11 didFindUnconfiguredPairedHAPWACAccessory:v4];
  }
}

- (void)handleFoundUnconfiguredPairedWACDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HAPWACAccessoryBrowser_handleFoundUnconfiguredPairedWACDevice___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HAPWACAccessoryBrowser_handleFoundUnconfiguredPairedWACDevice___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v4 = [[HAPWACAccessory alloc] initWithWiFiDevice:*(void *)(a1 + 32)];
    BOOL v2 = [MEMORY[0x1E4F1C9C8] date];
    int v3 = [*(id *)(a1 + 40) browsingStartTime];
    [v2 timeIntervalSinceDate:v3];
    -[HAPWACAccessory setDiscoveryTime:](v4, "setDiscoveryTime:");

    [*(id *)(a1 + 40) _handleUnconfiguredPairedWACDevice:v4];
  }
}

- (void)_handleNewUnconfiguredUnpairedWACDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPWACAccessoryBrowser *)self _removeUnconfiguredWACDevice:v4];
  id v6 = [(HAPWACAccessoryBrowser *)self foundUnconfiguredUnpairedAccessories];
  [v6 addObject:v4];

  uint64_t v7 = [(HAPWACAccessoryBrowser *)self browsingIdentifier];

  if (!v7
    || ([(HAPWACAccessoryBrowser *)self browsingIdentifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 deviceId],
        int v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v10))
  {
    v11 = (void *)MEMORY[0x1D944E080]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      __int16 v17 = v14;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Reporting new HAP WAC Accessory: %@", (uint8_t *)&v16, 0x16u);
    }
    int v15 = [(HAPWACAccessoryBrowser *)v12 delegate];
    [v15 wacBrowser:v12 didFindHAPWACAccessory:v4];
  }
}

- (void)handleFoundAPDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HAPWACAccessoryBrowser_handleFoundAPDevice___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HAPWACAccessoryBrowser_handleFoundAPDevice___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v13 = [v2 ssid];
    if ([v13 length])
    {
      uint64_t v3 = [*(id *)(a1 + 40) state];

      if (v3 == 1)
      {
        id v4 = (void *)MEMORY[0x1D944E080]();
        id v5 = *(id *)(a1 + 40);
        id v6 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v7 = HMFGetLogIdentifier();
          id v8 = [*(id *)(a1 + 32) ssid];
          *(_DWORD *)buf = 138543618;
          int v15 = v7;
          __int16 v16 = 2112;
          __int16 v17 = v8;
          _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Found 2.4 Network SSID: %@", buf, 0x16u);
        }
        int v9 = [*(id *)(a1 + 40) found2Pt4Networks];
        int v10 = [*(id *)(a1 + 32) ssid];
        [v9 addObject:v10];

        v11 = *(void **)(a1 + 40);
        v12 = [*(id *)(a1 + 32) ssid];
        [v11 _reportFound2Pt4Network:v12];
      }
    }
    else
    {
    }
  }
}

- (void)_addFoundUnconfiguredUnpairedWACDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 supportsAirPlay])
  {
    id v5 = [(HAPWACAccessoryBrowser *)self airplayDelegate];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D944E080]();
      uint64_t v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v9 = HMFGetLogIdentifier();
        int v12 = 138543618;
        id v13 = v9;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Found AirPlay WAC Accessory: %@", (uint8_t *)&v12, 0x16u);
      }
      int v10 = [(HAPWACAccessoryBrowser *)v7 airplayDelegate];
      v11 = [v4 cuWiFiDevice];
      [v10 wacBrowser:v7 didFindAirPlayDevice:v11];
    }
  }
  [(HAPWACAccessoryBrowser *)self _handleNewUnconfiguredUnpairedWACDevice:v4];
}

- (void)handleFoundUnconfiguredUnpairedWACDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HAPWACAccessoryBrowser_handleFoundUnconfiguredUnpairedWACDevice___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HAPWACAccessoryBrowser_handleFoundUnconfiguredUnpairedWACDevice___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v4 = [[HAPWACAccessory alloc] initWithWiFiDevice:*(void *)(a1 + 32)];
    BOOL v2 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v3 = [*(id *)(a1 + 40) browsingStartTime];
    [v2 timeIntervalSinceDate:v3];
    -[HAPWACAccessory setDiscoveryTime:](v4, "setDiscoveryTime:");

    [*(id *)(a1 + 40) _addFoundUnconfiguredUnpairedWACDevice:v4];
  }
}

- (void)_stopBrowsingForWACAccessories
{
  if ([(HAPWACAccessoryBrowser *)self state] == 2)
  {
    uint64_t v3 = [(HAPWACAccessoryBrowser *)self cuWiFiScanner];
    [v3 suspend];

    uint64_t v4 = 4;
  }
  else
  {
    if ([(HAPWACAccessoryBrowser *)self state] != 1) {
      return;
    }
    uint64_t v4 = 3;
  }
  [(HAPWACAccessoryBrowser *)self setState:v4];
  id v5 = [(HAPWACAccessoryBrowser *)self backoffTimer];
  [v5 resume];
}

- (void)stopDiscoveringAccessoryServers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    int v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
  }
  int v9 = [(HAPAccessoryServerBrowser *)v5 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HAPWACAccessoryBrowser_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = v5;
  dispatch_async(v9, block);
}

uint64_t __57__HAPWACAccessoryBrowser_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAirplayDelegate:0];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 _stopBrowsingForWACAccessories];
}

- (void)_startBrowsingForWACAccessories
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944E080](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v58 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting to discover WAC accessories", buf, 0xCu);
  }
  uint64_t v7 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F5E220]);
    [(HAPWACAccessoryBrowser *)v4 setCuWiFiScanner:v8];

    int v9 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
    [(HAPWACAccessoryBrowser *)v4 _initWiFiScannerWithScanner:v9];
  }
  int v10 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];

  if (v10)
  {
    if ([(HAPWACAccessoryBrowser *)v4 state])
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v11 = [(HAPWACAccessoryBrowser *)v4 foundUnconfiguredUnpairedAccessories];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v53;
        *(void *)&long long v13 = 138543618;
        long long v47 = v13;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v53 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v52 + 1) + 8 * v16);
            uint64_t v18 = (void *)MEMORY[0x1D944E080]();
            id v19 = v4;
            uint64_t v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              long long v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v47;
              v58 = v21;
              __int16 v59 = 2112;
              uint64_t v60 = v17;
              _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Reporting previously found unconfigured accessory: %@", buf, 0x16u);
            }
            long long v22 = [(HAPWACAccessoryBrowser *)v19 delegate];
            [v22 wacBrowser:v19 didFindHAPWACAccessory:v17];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v11 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v14);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v23 = [(HAPWACAccessoryBrowser *)v4 foundUnconfiguredPairedAccessories];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v24)
      {
        uint64_t v26 = v24;
        uint64_t v27 = *(void *)v49;
        *(void *)&long long v25 = 138543618;
        long long v47 = v25;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v49 != v27) {
              objc_enumerationMutation(v23);
            }
            uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * v28);
            long long v30 = (void *)MEMORY[0x1D944E080]();
            __int16 v31 = v4;
            id v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              __int16 v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v47;
              v58 = v33;
              __int16 v59 = 2112;
              uint64_t v60 = v29;
              _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Reporting previously found configured accessory: %@", buf, 0x16u);
            }
            id v34 = [(HAPWACAccessoryBrowser *)v31 delegate];
            [v34 wacBrowser:v31 didFindUnconfiguredPairedHAPWACAccessory:v29];

            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [v23 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v26);
      }
    }
    v35 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
    [v35 setScanFlags:1];

    uint64_t v36 = [(HAPWACAccessoryBrowser *)v4 scanning2Pt4SSID];
    v37 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
    [v37 setSsid:v36];

    v38 = [MEMORY[0x1E4F1C9C8] date];
    [(HAPWACAccessoryBrowser *)v4 setBrowsingStartTime:v38];

    v39 = [(HAPWACAccessoryBrowser *)v4 backoffTimer];
    [v39 resume];

    uint64_t v40 = [(HAPWACAccessoryBrowser *)v4 state];
    v41 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
    v42 = v41;
    if (v40 == 4) {
      [v41 resume];
    }
    else {
      [v41 activate];
    }

    [(HAPWACAccessoryBrowser *)v4 setState:1];
  }
  else
  {
    v43 = (void *)MEMORY[0x1D944E080]();
    v44 = v4;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v46;
      _os_log_impl(&dword_1D4758000, v45, OS_LOG_TYPE_ERROR, "%{public}@Error instantiating CUWiFiScanner", buf, 0xCu);
    }
  }
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Discovering with identifier: %@", buf, 0x16u);
  }
  int v9 = [(HAPAccessoryServerBrowser *)v6 workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__HAPWACAccessoryBrowser_discoverAccessoryServerWithIdentifier___block_invoke;
  v11[3] = &unk_1E69F46E0;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

uint64_t __64__HAPWACAccessoryBrowser_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBrowsingIdentifier:*(void *)(a1 + 40)];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 _startBrowsingForWACAccessories];
}

- (void)startDiscoveringAirPlayAccessoriesWithDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Discovering AirPlay Accessories", buf, 0xCu);
  }
  int v9 = [(HAPAccessoryServerBrowser *)v6 workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HAPWACAccessoryBrowser_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke;
  v11[3] = &unk_1E69F46E0;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

uint64_t __73__HAPWACAccessoryBrowser_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAirplayDelegate:*(void *)(a1 + 40)];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 _startBrowsingForWACAccessories];
}

- (void)startDiscoveringAccessoryServers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
  }
  int v9 = [(HAPAccessoryServerBrowser *)v5 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HAPWACAccessoryBrowser_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = v5;
  dispatch_async(v9, block);
}

uint64_t __58__HAPWACAccessoryBrowser_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBrowsingIdentifier:0];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 _startBrowsingForWACAccessories];
}

- (void)_restartBrowsingWithAllNetworks
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Restarting browsing for all networks", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
  [v7 suspend];

  id v8 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
  [v8 setScanFlags:3];

  [(HAPWACAccessoryBrowser *)v4 setState:2];
  int v9 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
  [v9 resume];
}

- (void)_handleBrowsingBackOffTimerExpiry
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HAPWACAccessoryBrowser *)v4 foundUnconfiguredUnpairedAccessories];
    id v8 = [(HAPWACAccessoryBrowser *)v4 found2Pt4Networks];
    int v9 = [(HAPWACAccessoryBrowser *)v4 foundUnconfiguredPairedAccessories];
    int v15 = 138544130;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    long long v22 = v9;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Stopping the suspended browse, clearing foundUnconfiguredUnpairedAccessories %@, foundNetworks: %@, foundUnconfiguredPairedAccessories: %@", (uint8_t *)&v15, 0x2Au);
  }
  int v10 = [(HAPWACAccessoryBrowser *)v4 cuWiFiScanner];
  [v10 invalidate];

  [(HAPWACAccessoryBrowser *)v4 setCuWiFiScanner:0];
  v11 = [(HAPWACAccessoryBrowser *)v4 backoffTimer];
  [v11 suspend];

  [(HAPWACAccessoryBrowser *)v4 setState:0];
  uint64_t v12 = [(HAPWACAccessoryBrowser *)v4 foundUnconfiguredUnpairedAccessories];
  [v12 removeAllObjects];

  __int16 v13 = [(HAPWACAccessoryBrowser *)v4 found2Pt4Networks];
  [v13 removeAllObjects];

  uint64_t v14 = [(HAPWACAccessoryBrowser *)v4 foundUnconfiguredPairedAccessories];
  [v14 removeAllObjects];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAPWACAccessoryBrowser *)self backoffTimer];

  if (v6 == v4)
  {
    if ([(HAPWACAccessoryBrowser *)self state] != 4)
    {
      if ([(HAPWACAccessoryBrowser *)self state] == 3)
      {
        [(HAPWACAccessoryBrowser *)self setState:4];
        uint64_t v12 = [(HAPWACAccessoryBrowser *)self cuWiFiScanner];
        [v12 suspend];

        __int16 v13 = [(HAPWACAccessoryBrowser *)self backoffTimer];
        [v13 resume];

        goto LABEL_10;
      }
      if ([(HAPWACAccessoryBrowser *)self state] != 1)
      {
        uint64_t v7 = (void *)MEMORY[0x1D944E080]();
        id v8 = self;
        int v9 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_5;
        }
        int v10 = HMFGetLogIdentifier();
        int v15 = 138543618;
        id v16 = v10;
        __int16 v17 = 2048;
        uint64_t v18 = [(HAPWACAccessoryBrowser *)v8 state];
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Incorrect state %tu on backoff timer expiry", (uint8_t *)&v15, 0x16u);
        goto LABEL_4;
      }
      uint64_t v14 = [(HAPWACAccessoryBrowser *)self scanning2Pt4SSID];

      if (!v14)
      {
        [(HAPWACAccessoryBrowser *)self _restartBrowsingWithAllNetworks];
        goto LABEL_10;
      }
      [(HAPWACAccessoryBrowser *)self _reportFound2Pt4Network:0];
    }
    [(HAPWACAccessoryBrowser *)self _handleBrowsingBackOffTimerExpiry];
    goto LABEL_10;
  }
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = HMFGetLogIdentifier();
    v11 = [(HAPWACAccessoryBrowser *)v8 backoffTimer];
    int v15 = 138543874;
    id v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = (uint64_t)v4;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Timer mismatch: %@/%@", (uint8_t *)&v15, 0x20u);

LABEL_4:
  }
LABEL_5:

LABEL_10:
}

- (void)_initWiFiScannerWithScanner:(id)a3
{
  id v4 = a3;
  [(HAPWACAccessoryBrowser *)self setCuWiFiScanner:v4];
  [v4 setLabel:@"HAPWACBrowser"];
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  [v4 setDispatchQueue:v5];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke;
  v10[3] = &unk_1E69F4020;
  objc_copyWeak(&v11, &location);
  [v4 setDeviceFoundHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_151;
  v8[3] = &unk_1E69F4020;
  objc_copyWeak(&v9, &location);
  [v4 setDeviceLostHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_152;
  v6[3] = &unk_1E69F4048;
  objc_copyWeak(&v7, &location);
  [v4 setDeviceChangedHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([v3 deviceIEFlags] & 0x40000000) == 0 || (objc_msgSend(v3, "deviceIEFlags") & 0x400000) != 0)
  {
    if ([v3 deviceIEFlags])
    {
      int v9 = [v3 deviceIEFlags];
      int v10 = (void *)MEMORY[0x1D944E080]();
      id v11 = WeakRetained;
      uint64_t v12 = HMFGetOSLogHandle();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if ((v9 & 0x400000) != 0)
      {
        if (v13)
        {
          int v15 = HMFGetLogIdentifier();
          int v16 = 138543618;
          __int16 v17 = v15;
          __int16 v18 = 2112;
          id v19 = v3;
          _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Found unconfigured & paired WAC device %@", (uint8_t *)&v16, 0x16u);
        }
        [v11 handleFoundUnconfiguredPairedWACDevice:v3];
      }
      else
      {
        if (v13)
        {
          uint64_t v14 = HMFGetLogIdentifier();
          int v16 = 138543618;
          __int16 v17 = v14;
          __int16 v18 = 2112;
          id v19 = v3;
          _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Unhandled device: %@", (uint8_t *)&v16, 0x16u);
        }
      }
    }
    else
    {
      [WeakRetained handleFoundAPDevice:v3];
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v16 = 138543618;
      __int16 v17 = v8;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Found unconfigured & unpaired WAC device %@", (uint8_t *)&v16, 0x16u);
    }
    [v6 handleFoundUnconfiguredUnpairedWACDevice:v3];
  }
}

void __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([v3 deviceIEFlags] & 0x40000000) != 0)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      int v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Lost device %@", (uint8_t *)&v9, 0x16u);
    }
    [v6 handleRemovedUnconfiguredWACDevice:v3];
  }
}

void __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_152(uint64_t a1, void *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([v5 deviceIEFlags] & 0x40000000) != 0)
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = WeakRetained;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = HMFGetLogIdentifier();
      int v11 = 138543874;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 1024;
      int v16 = a3;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Device %@ changed with flags: %u", (uint8_t *)&v11, 0x1Cu);
    }
    [v8 handleChangeUnconfiguredWACDevice:v5];
  }
}

- (void)initWiFiScannerWithScanner:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HAPWACAccessoryBrowser_initWiFiScannerWithScanner___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__HAPWACAccessoryBrowser_initWiFiScannerWithScanner___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initWiFiScannerWithScanner:*(void *)(a1 + 40)];
}

- (HAPWACAccessoryBrowser)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    v28.receiver = self;
    v28.super_class = (Class)HAPWACAccessoryBrowser;
    int v9 = [(HAPAccessoryServerBrowser *)&v28 initWithQueue:v7];
    int v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_delegate, v6);
      uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
      foundUnconfiguredUnpairedAccessories = v10->_foundUnconfiguredUnpairedAccessories;
      v10->_foundUnconfiguredUnpairedAccessories = (NSMutableSet *)v11;

      uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
      foundUnconfiguredPairedAccessories = v10->_foundUnconfiguredPairedAccessories;
      v10->_foundUnconfiguredPairedAccessories = (NSMutableSet *)v13;

      uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
      found2Pt4Networks = v10->_found2Pt4Networks;
      v10->_found2Pt4Networks = (NSMutableSet *)v15;

      cuWiFiScanner = v10->_cuWiFiScanner;
      v10->_cuWiFiScanner = 0;

      v10->_state = 0;
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:10.0];
      backoffTimer = v10->_backoffTimer;
      v10->_backoffTimer = (HMFTimer *)v18;

      [(HMFTimer *)v10->_backoffTimer setDelegate:v10];
      uint64_t v20 = v10->_backoffTimer;
      uint64_t v21 = [(HAPAccessoryServerBrowser *)v10 workQueue];
      [(HMFTimer *)v20 setDelegateQueue:v21];
    }
    long long v22 = v10;
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1D944E080]();
    long long v22 = self;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v30 = v26;
      _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failing HAP Browser instantioation - nil delegate", buf, 0xCu);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t37 != -1) {
    dispatch_once(&logCategory__hmf_once_t37, &__block_literal_global_22558);
  }
  BOOL v2 = (void *)logCategory__hmf_once_v38;

  return v2;
}

uint64_t __37__HAPWACAccessoryBrowser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v38;
  logCategory__hmf_once_v38 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end