@interface HAPAccessoryServerBrowserWiProxBTLE
+ (id)logCategory;
- (BOOL)removeTrackedPeripheralWithStableIdentifier:(id)a3;
- (BOOL)scanInBackground;
- (HAPAccessoryServerBrowserWiProxBTLE)initWithDelegate:(id)a3 queue:(id)a4;
- (HAPAccessoryServerBrowserWiProxBTLEDelegate)delegate;
- (NSMapTable)reachabilityScanTuples;
- (OS_dispatch_queue)workQueue;
- (WPHomeKit)wpHomeKit;
- (id)_lock_trackedPeripheralWithIdentifier:(id)a3;
- (id)_parseAdvertisementData:(id)a3 forPeripheral:(id)a4 RSSI:(id)a5;
- (id)logIdentifier;
- (id)trackedIdentifiers;
- (id)trackedPeripheralForIdentifier:(id)a3;
- (id)trackedPeripheralWithIdentifier:(id)a3;
- (id)trackedPeripherals;
- (int64_t)currentScanState;
- (int64_t)currentScanType;
- (unint64_t)_getLinkQuality:(id)a3;
- (unsigned)routeMode;
- (void)_probeReachabilityForTrackedAccessories;
- (void)_removeTrackedPeripheral:(id)a3;
- (void)_reportHAPPeripheral:(id)a3;
- (void)_reportReachabilityForHAPPeripheral:(id)a3;
- (void)_startBrowsingForHAPBLEAccessories;
- (void)_startScanningWithScanType:(int64_t)a3;
- (void)_startTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3 restartScan:(BOOL)a4;
- (void)_stopBrowsingForHAPBLEAccessories:(BOOL)a3;
- (void)_stopScanning;
- (void)_stopTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3;
- (void)homeKit:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6;
- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6 type:(int64_t)a7;
- (void)homeKitDidUpdateState:(id)a3;
- (void)homeKitStartedScanning:(id)a3;
- (void)homeKitStoppedScanning:(id)a3;
- (void)pauseScans;
- (void)probeReachabilityForTrackedAccessoriesWithScanTuples:(id)a3;
- (void)resetLastSeenForTrackedAccessories:(id)a3;
- (void)restartScans;
- (void)retrieveStateForTrackedAccessoryWithIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7;
- (void)setCurrentScanState:(int64_t)a3;
- (void)setCurrentScanType:(int64_t)a3;
- (void)setRouteMode:(unsigned __int8)a3;
- (void)setScanInBackground:(BOOL)a3;
- (void)startBrowsingForHAPBLEAccessories;
- (void)startTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3;
- (void)stopBrowsingForHAPBLEAccessories:(BOOL)a3;
- (void)stopTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3;
- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4;
@end

@implementation HAPAccessoryServerBrowserWiProxBTLE

- (void)retrieveStateForTrackedAccessoryWithIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7
{
  v12 = [(HAPAccessoryServerBrowserWiProxBTLE *)self trackedPeripheralWithIdentifier:a3];
  if (v12)
  {
    id v17 = v12;
    if (a6)
    {
      v13 = [v12 averageRSSI];
      *a6 = [(HAPAccessoryServerBrowserWiProxBTLE *)self _getLinkQuality:v13];

      v12 = v17;
    }
    if (a4)
    {
      *a4 = [v17 stateNumber];
      v12 = v17;
    }
    if (a7)
    {
      v14 = NSNumber;
      double Current = CFAbsoluteTimeGetCurrent();
      [v17 lastSeen];
      *a7 = [v14 numberWithDouble:Current - v16];
      v12 = v17;
    }
    if (a5)
    {
      *a5 = [v17 isReachable];
      v12 = v17;
    }
  }
}

- (id)trackedPeripheralWithIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(HAPAccessoryServerBrowserWiProxBTLE *)self _lock_trackedPeripheralWithIdentifier:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_lock_trackedPeripheralWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = self->_trackedPeripherals;
    id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "identifier", (void)v13);
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reachabilityScanTuples);
  objc_storeStrong((id *)&self->_wpHomeKit, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_trackedIdentifiers, 0);

  objc_storeStrong((id *)&self->_trackedPeripherals, 0);
}

- (NSMapTable)reachabilityScanTuples
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reachabilityScanTuples);

  return (NSMapTable *)WeakRetained;
}

- (void)setCurrentScanType:(int64_t)a3
{
  self->_currentScanType = a3;
}

- (int64_t)currentScanType
{
  return self->_currentScanType;
}

- (void)setCurrentScanState:(int64_t)a3
{
  self->_currentScanState = a3;
}

- (int64_t)currentScanState
{
  return self->_currentScanState;
}

- (WPHomeKit)wpHomeKit
{
  return self->_wpHomeKit;
}

- (HAPAccessoryServerBrowserWiProxBTLEDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAccessoryServerBrowserWiProxBTLEDelegate *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)logIdentifier
{
  v3 = NSString;
  int v4 = [(HAPAccessoryServerBrowserWiProxBTLE *)self routeMode];
  v5 = @"Local";
  id v6 = @"-";
  uint64_t v7 = @"WHBS";
  if ((v4 & 2) == 0) {
    uint64_t v7 = @"WHB";
  }
  if (v4) {
    id v6 = v7;
  }
  if (v4) {
    v5 = v6;
  }
  v8 = v5;
  int64_t v9 = [(HAPAccessoryServerBrowserWiProxBTLE *)self currentScanState];
  if (v9)
  {
    int64_t v10 = v9;
    if (v9 == 1)
    {
      char v11 = @"BROWSE";
    }
    else
    {
      v12 = [NSNumber numberWithInteger:v9];
      char v11 = [v12 stringValue];
    }
  }
  else
  {
    char v11 = @"IDLE";
  }
  long long v13 = [(HAPAccessoryServerBrowserWiProxBTLE *)self wpHomeKit];
  long long v14 = HAPWiProxScanStateString([v13 state]);
  unint64_t v15 = [(HAPAccessoryServerBrowserWiProxBTLE *)self currentScanType];
  if (v15 > 2) {
    long long v16 = @"N";
  }
  else {
    long long v16 = off_1E69F3590[v15];
  }
  id v17 = [v3 stringWithFormat:@"HAPWiProxBLE-%@ %@(%@-%@)", v8, v11, v14, v16];

  return v17;
}

- (void)_reportReachabilityForHAPPeripheral:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self reachabilityScanTuples];
  id v6 = [v4 identifier];
  uint64_t v7 = [v5 objectForKey:v6];

  v8 = [(HAPAccessoryServerBrowserWiProxBTLE *)self reachabilityScanTuples];
  int64_t v9 = [v4 identifier];
  [v8 removeObjectForKey:v9];

  int64_t v10 = [v7 completion];

  if (v10)
  {
    char v11 = [v7 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__HAPAccessoryServerBrowserWiProxBTLE__reportReachabilityForHAPPeripheral___block_invoke;
    v12[3] = &unk_1E69F46E0;
    id v13 = v7;
    id v14 = v4;
    dispatch_async(v11, v12);
  }
}

void __75__HAPAccessoryServerBrowserWiProxBTLE__reportReachabilityForHAPPeripheral___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) completion];
  v2 = [*(id *)(a1 + 40) identifier];
  v3[2](v3, v2, 1);
}

- (void)_reportHAPPeripheral:(id)a3
{
  id v7 = a3;
  id v4 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self delegate];
  id v6 = (void *)[v7 copy];
  [v5 accessoryServerBrowserBTLE:self didDiscoverHAPPeripheral:v6];

  [(HAPAccessoryServerBrowserWiProxBTLE *)self _reportReachabilityForHAPPeripheral:v7];
}

- (void)_removeTrackedPeripheral:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        char v11 = [(HAPAccessoryServerBrowserWiProxBTLE *)self _lock_trackedPeripheralWithIdentifier:v10];
        if (v11) {
          [v5 addObject:v11];
        }
        [(NSMutableSet *)self->_trackedIdentifiers removeObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        -[NSMutableSet removeObject:](self->_trackedPeripherals, "removeObject:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)homeKit:(id)a3 failedToStartScanningWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D944E080]();
  int64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    char v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Failed to start scanning with error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)homeKitStoppedScanning:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Stopped Scanning", (uint8_t *)&v9, 0xCu);
  }
}

- (void)homeKitStartedScanning:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Started Scanning", (uint8_t *)&v9, 0xCu);
  }
}

- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(HAPAccessoryServerBrowserWiProxBTLE *)self _parseAdvertisementData:v12 forPeripheral:v11 RSSI:v13];
  if (v14)
  {
    id v15 = [(HAPAccessoryServerBrowserWiProxBTLE *)self trackedIdentifiers];
    uint64_t v16 = [v14 identifier];
    int v17 = [v15 containsObject:v16];

    if (v17)
    {
      long long v18 = [v14 identifier];
      id v19 = [(HAPAccessoryServerBrowserWiProxBTLE *)self trackedPeripheralWithIdentifier:v18];

      if (v19)
      {
        if (![v19 updateWithPeripheral:v14])
        {

          goto LABEL_12;
        }
      }
      else
      {
        id v19 = v14;
        long long v20 = [v19 encryptedPayload];

        if (!v20)
        {
          os_unfair_lock_lock_with_options();
          [(NSMutableSet *)self->_trackedPeripherals addObject:v19];
          os_unfair_lock_unlock(&self->_lock);
        }
      }
      context = (void *)MEMORY[0x1D944E080]();
      long long v21 = self;
      long long v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        long long v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v23;
        __int16 v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Reporting tracked peripheral: %{public}@", buf, 0x16u);
      }
    }
    [(HAPAccessoryServerBrowserWiProxBTLE *)self _reportHAPPeripheral:v14];
  }
LABEL_12:
}

- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6 type:(int64_t)a7
{
  id v17 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = v13;
  if (!v13
    || [v13 integerValue] < -127
    || (v15 = [v14 integerValue], uint64_t v16 = v14, v15 >= 21))
  {
    uint64_t v16 = &unk_1F2C80B20;
  }
  [(HAPAccessoryServerBrowserWiProxBTLE *)self homeKit:v17 foundDevice:v11 withData:v12 RSSI:v16];
}

- (void)homeKitDidUpdateState:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = HAPWiProxScanStateString([v4 state]);
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Changed power state to: %@", buf, 0x16u);
  }
  id v10 = [(HAPAccessoryServerBrowserWiProxBTLE *)v6 wpHomeKit];
  uint64_t v11 = [v10 state];

  if (v11 == 3)
  {
    if ([(HAPAccessoryServerBrowserWiProxBTLE *)v6 currentScanState] == 1) {
      [(HAPAccessoryServerBrowserWiProxBTLE *)v6 _startBrowsingForHAPBLEAccessories];
    }
    id v12 = [(HAPAccessoryServerBrowserWiProxBTLE *)v6 trackedIdentifiers];
    uint64_t v13 = [v12 count];

    if (v13) {
      [(HAPAccessoryServerBrowserWiProxBTLE *)v6 _startTrackingHAPBLEAccessoriesWithIdentifiers:0 restartScan:1];
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    __int16 v14 = [(HAPAccessoryServerBrowserWiProxBTLE *)v6 trackedPeripherals];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v18++) reset];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (id)_parseAdvertisementData:(id)a3 forPeripheral:(id)a4 RSSI:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1BC30]];
  uint64_t v12 = [v11 bytes];
  uint64_t v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1BC28]];
  __int16 v14 = [v8 objectForKeyedSubscript:@"kCBAdvDataDeviceAddress"];
  if ([v14 length])
  {
    [v14 bytes];
    HardwareAddressToCString();
    uint64_t v15 = [NSString stringWithUTF8String:buf];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if ((unint64_t)[v11 length] < 0x11
    || ((int v16 = *(unsigned __int8 *)(v12 + 2), v16 != 17) ? (v17 = v16 == 6) : (v17 = 1), !v17))
  {
    long long v23 = 0;
    v24 = &unk_1F2C80B38;
    goto LABEL_42;
  }
  v43 = self;
  id v46 = v10;
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v52 = [NSNumber numberWithUnsignedInteger:(unint64_t)*(unsigned __int8 *)(v12 + 3) >> 5];
  v53 = v18;
  char v19 = *(unsigned char *)(v12 + 3);
  if ([v18 unsignedShortValue] == 17 && (v19 & 0xE0) == 0x20 && (v19 & 0x1F) == 22)
  {
    HardwareAddressToCString();
    v51 = [NSString stringWithUTF8String:buf];
    v47 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v12 + 10, objc_msgSend(v11, "length") - 10);
    v48 = 0;
    uint64_t v21 = 0;
    v49 = 0;
    v50 = 0;
    uint64_t v22 = 0;
LABEL_22:
    v24 = &unk_1F2C80B38;
LABEL_23:
    id v45 = v9;
    v41 = (void *)v21;
    v42 = (void *)v22;
    if ([v24 integerValue] == 2)
    {
      v25 = -[HAPBLEPeripheral initWithName:peripheralUUID:identifier:hapVersion:hkType:advInterval:statusFlags:category:stateNumber:configNumber:setupHash:encryptedPayload:whbStableIdentifier:advDeviceAddress:]([HAPBLEPeripheral alloc], "initWithName:peripheralUUID:identifier:hapVersion:hkType:advInterval:statusFlags:category:stateNumber:configNumber:setupHash:encryptedPayload:whbStableIdentifier:advDeviceAddress:", v13, v9, v51, v24, v53, v52, v22, v50, v49, v48, v21, v47, 0, v15, v21, v22);
      if (HAPIsHH2Enabled_onceToken != -1) {
        dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
      }
      if ((HAPIsHH2Enabled_hh2Enabled & 1) == 0)
      {
        __int16 v26 = [(HAPAccessoryServerBrowserWiProxBTLE *)v43 delegate];
        char v27 = objc_opt_respondsToSelector();

        if (v27)
        {
          uint64_t v28 = [(HAPAccessoryServerBrowserWiProxBTLE *)v43 delegate];
          uint64_t v29 = [v28 retrieveCBPeripheralWithUUID:v45 blePeripheral:v25];

          v44 = v29;
          v30 = [v29 name];
          unint64_t v31 = [v30 length];
          if (v31 > [v13 length] && v13 && objc_msgSend(v30, "hasPrefix:", v13)) {
            [(HAPBLEPeripheral *)v25 setName:v30];
          }
          [(HAPBLEPeripheral *)v25 setCbPeripheral:v44];
        }
      }
      v32 = [v8 objectForKeyedSubscript:@"kCachedAdvertisement"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v33 = v32;
      }
      else {
        v33 = 0;
      }
      id v34 = v33;

      uint64_t v35 = [v34 BOOLValue];
      [(HAPBLEPeripheral *)v25 setIsCached:v35];
      [(HAPBLEPeripheral *)v25 setAverageRSSI:v10];
    }
    else
    {
      v36 = (void *)MEMORY[0x1D944E080]();
      v37 = v43;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v55 = v39;
        __int16 v56 = 2114;
        v57 = v24;
        __int16 v58 = 2048;
        uint64_t v59 = 2;
        __int16 v60 = 2112;
        id v61 = v11;
        _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Dropping, incompatible protocol version: %{public}@, expected: %ld, adv: %@", buf, 0x2Au);
      }
      v25 = 0;
      id v10 = v46;
    }
    long long v23 = v25;

    id v9 = v45;
    goto LABEL_41;
  }
  if ([v18 unsignedShortValue] != 6)
  {
    uint64_t v21 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    uint64_t v22 = 0;
    v51 = 0;
    goto LABEL_22;
  }
  if ((unint64_t)[v11 length] >= 0x11)
  {
    if ((unint64_t)[v11 length] < 0x15) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v12 + 17 length:4];
    }
    uint64_t v22 = [NSNumber numberWithUnsignedInt:*(unsigned char *)(v12 + 4) & 1];
    HardwareAddressToCString();
    v51 = [NSString stringWithUTF8String:buf];
    v50 = [NSNumber numberWithUnsignedInteger:*(unsigned __int16 *)(v12 + 11)];
    v49 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v12 + 13)];
    v48 = [NSNumber numberWithUnsignedInteger:*(unsigned __int8 *)(v12 + 15)];
    v24 = [NSNumber numberWithUnsignedInteger:*(unsigned __int8 *)(v12 + 16)];
    v47 = 0;
    goto LABEL_23;
  }
  long long v23 = 0;
  v24 = &unk_1F2C80B38;
LABEL_41:

LABEL_42:

  return v23;
}

- (void)_probeReachabilityForTrackedAccessories
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    double v7 = [(HAPAccessoryServerBrowserWiProxBTLE *)v4 trackedIdentifiers];
    *(_DWORD *)buf = 138543618;
    v43 = v6;
    __int16 v44 = 2114;
    double v45 = v7;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Probing reachability for tracked accessories: %{public}@", buf, 0x16u);
  }
  id v8 = [(HAPAccessoryServerBrowserWiProxBTLE *)v4 wpHomeKit];
  if ([v8 state] != 3)
  {

    goto LABEL_12;
  }
  if ([(HAPAccessoryServerBrowserWiProxBTLE *)v4 currentScanState])
  {
    unsigned __int8 v9 = [(HAPAccessoryServerBrowserWiProxBTLE *)v4 routeMode];

    if ((v9 & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = v4;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    double v14 = [(HAPAccessoryServerBrowserWiProxBTLE *)v11 trackedIdentifiers];
    *(_DWORD *)buf = 138543618;
    v43 = v13;
    __int16 v44 = 2114;
    double v45 = v14;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Restarting High Priority Passive Scan to probe reachability: %{public}@", buf, 0x16u);
  }
  [(HAPAccessoryServerBrowserWiProxBTLE *)v11 _stopScanning];
  [(HAPAccessoryServerBrowserWiProxBTLE *)v11 _startScanningWithScanType:1];
LABEL_12:
  double Current = CFAbsoluteTimeGetCurrent();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  int v16 = [(HAPAccessoryServerBrowserWiProxBTLE *)v4 trackedPeripherals];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v39;
    *(void *)&long long v18 = 138543618;
    long long v36 = v18;
    do
    {
      uint64_t v21 = 0;
      uint64_t v37 = v19;
      do
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * v21);
        objc_msgSend(v22, "lastSeen", v36);
        double v24 = v23;
        int v25 = [v22 isReachable];
        __int16 v26 = (void *)MEMORY[0x1D944E080]();
        char v27 = v4;
        uint64_t v28 = HMFGetOSLogHandle();
        uint64_t v29 = v28;
        if (v25)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v30 = HMFGetLogIdentifier();
            [v22 shortDescription];
            uint64_t v31 = v20;
            v32 = v4;
            id v34 = v33 = v16;
            *(_DWORD *)buf = 138543874;
            v43 = v30;
            __int16 v44 = 2048;
            double v45 = Current - v24;
            __int16 v46 = 2114;
            v47 = v34;
            _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_INFO, "%{public}@Tracked peripheral was seen %.3f seconds ago. Reachability probe returns tracked peripheral: %{public}@", buf, 0x20u);

            int v16 = v33;
            id v4 = v32;
            uint64_t v20 = v31;
            uint64_t v19 = v37;
          }
          [(HAPAccessoryServerBrowserWiProxBTLE *)v27 _reportReachabilityForHAPPeripheral:v22];
        }
        else
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v36;
            v43 = v35;
            __int16 v44 = 2114;
            double v45 = *(double *)&v22;
            _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Has not recently seen: %{public}@", buf, 0x16u);
          }
          [v22 reset];
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v19);
  }
}

- (void)probeReachabilityForTrackedAccessoriesWithScanTuples:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__HAPAccessoryServerBrowserWiProxBTLE_probeReachabilityForTrackedAccessoriesWithScanTuples___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __92__HAPAccessoryServerBrowserWiProxBTLE_probeReachabilityForTrackedAccessoriesWithScanTuples___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 _probeReachabilityForTrackedAccessories];
}

- (id)trackedPeripheralForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAPAccessoryServerBrowserWiProxBTLE *)self trackedPeripheralWithIdentifier:v4];

  return v6;
}

- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HAPAccessoryServerBrowserWiProxBTLE_updateStateForIdentifier_stateNumber___block_invoke;
  block[3] = &unk_1E69F4708;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __76__HAPAccessoryServerBrowserWiProxBTLE_updateStateForIdentifier_stateNumber___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) trackedPeripheralWithIdentifier:*(void *)(a1 + 40)];
  [v2 updateStateNumber:*(void *)(a1 + 48)];
}

- (unint64_t)_getLinkQuality:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  if ([v3 integerValue] <= -50)
  {
    if ([v4 integerValue] > -70)
    {
      unint64_t v5 = 1;
      goto LABEL_11;
    }
    if ([v4 integerValue] > -80)
    {
      unint64_t v5 = 2;
      goto LABEL_11;
    }
    if ([v4 integerValue] > -85)
    {
      unint64_t v5 = 3;
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v5 = 4;
    goto LABEL_11;
  }
  unint64_t v5 = 0;
LABEL_11:

  return v5;
}

- (void)resetLastSeenForTrackedAccessories:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HAPAccessoryServerBrowserWiProxBTLE_resetLastSeenForTrackedAccessories___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __74__HAPAccessoryServerBrowserWiProxBTLE_resetLastSeenForTrackedAccessories___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) trackedPeripheralForIdentifier:*(void *)(a1 + 40)];
  [v1 reset];
}

- (void)setScanInBackground:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_scanInBackground = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)scanInBackground
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_scanInBackground;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_stopTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v23 = 138543618;
    double v24 = v8;
    __int16 v25 = 2114;
    uint64_t v26 = (uint64_t)v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Request to stop tracking accessories with Identifiers: %{public}@", (uint8_t *)&v23, 0x16u);
  }
  [(HAPAccessoryServerBrowserWiProxBTLE *)v6 _removeTrackedPeripheral:v4];
  id v9 = [(HAPAccessoryServerBrowserWiProxBTLE *)v6 trackedIdentifiers];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    id v11 = (void *)MEMORY[0x1D944E080]();
    id v12 = v6;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      double v14 = HMFGetLogIdentifier();
      uint64_t v15 = [(HAPAccessoryServerBrowserWiProxBTLE *)v12 currentScanState];
      int v23 = 138543618;
      double v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No more accessories to track scanState: %tu", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v16 = [(HAPAccessoryServerBrowserWiProxBTLE *)v12 currentScanState];
    uint64_t v17 = (void *)MEMORY[0x1D944E080]();
    long long v18 = v12;
    uint64_t v19 = HMFGetOSLogHandle();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v20)
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v23 = 138543362;
        double v24 = v21;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@No more accessories to track. Continuing to scan.", (uint8_t *)&v23, 0xCu);
      }
    }
    else
    {
      if (v20)
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v23 = 138543362;
        double v24 = v22;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@No more accessories to track. Stopping Scan.", (uint8_t *)&v23, 0xCu);
      }
      [(HAPAccessoryServerBrowserWiProxBTLE *)v18 _stopScanning];
    }
  }
}

- (void)stopTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__HAPAccessoryServerBrowserWiProxBTLE_stopTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __84__HAPAccessoryServerBrowserWiProxBTLE_stopTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopTrackingHAPBLEAccessoriesWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)_startTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3 restartScan:(BOOL)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v47 = v9;
    __int16 v48 = 2114;
    id v49 = v40;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Request to start tracking accessories with new Identifiers: %{public}@", buf, 0x16u);
  }
  if (v40) {
    id v10 = v40;
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  long long v41 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
  id v11 = [(HAPAccessoryServerBrowserWiProxBTLE *)v7 trackedIdentifiers];
  [v41 minusSet:v11];

  if ([v41 count]) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = a4;
  }
  context = (void *)MEMORY[0x1D944E080]();
  id v13 = v7;
  oslog = HMFGetOSLogHandle();
  if (v12)
  {
    double v14 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v41 allObjects];
      long long v36 = [(HAPAccessoryServerBrowserWiProxBTLE *)v13 trackedIdentifiers];
      uint64_t v16 = [v36 allObjects];
      id v17 = v15;
      id v18 = v16;
      uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v20 = v17;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:buf count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            if (([v18 containsObject:v24] & 1) == 0)
            {
              __int16 v25 = [NSString stringWithFormat:@"%@ [NEW]", v24];
              [v19 addObject:v25];
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:buf count:16];
        }
        while (v21);
      }

      if (v18) {
        [v19 addObjectsFromArray:v18];
      }

      *(_DWORD *)buf = 138543618;
      id v47 = v37;
      __int16 v48 = 2114;
      id v49 = v19;
      _os_log_impl(&dword_1D4758000, oslog, OS_LOG_TYPE_INFO, "%{public}@Tracking Identifiers: %{public}@", buf, 0x16u);

      double v14 = oslog;
    }

    os_unfair_lock_lock_with_options();
    [(NSMutableSet *)v13->_trackedIdentifiers unionSet:v41];
    os_unfair_lock_unlock(&v13->_lock);
    uint64_t v26 = [(HAPAccessoryServerBrowserWiProxBTLE *)v13 wpHomeKit];
    BOOL v27 = [v26 state] == 3;

    if (v27)
    {
      if (![(HAPAccessoryServerBrowserWiProxBTLE *)v13 currentScanState])
      {
        uint64_t v28 = [(HAPAccessoryServerBrowserWiProxBTLE *)v13 trackedIdentifiers];
        BOOL v29 = [v28 count] == 0;

        if (!v29) {
          [(HAPAccessoryServerBrowserWiProxBTLE *)v13 _startScanningWithScanType:1];
        }
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x1D944E080]();
      v33 = v13;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v47 = v35;
        _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_ERROR, "%{public}@Pending tracking as WiProx is not powered on", buf, 0xCu);
      }
    }
  }
  else
  {
    v30 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v47 = v31;
      _os_log_impl(&dword_1D4758000, oslog, OS_LOG_TYPE_DEBUG, "%{public}@No new identifiers to track", buf, 0xCu);

      v30 = oslog;
    }
  }
}

- (void)startTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__HAPAccessoryServerBrowserWiProxBTLE_startTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __85__HAPAccessoryServerBrowserWiProxBTLE_startTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startTrackingHAPBLEAccessoriesWithIdentifiers:*(void *)(a1 + 40) restartScan:0];
}

- (void)_stopBrowsingForHAPBLEAccessories:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerBrowserWiProxBTLE *)self setCurrentScanState:0]);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = HMFBooleanToString();
    int v22 = 138543618;
    int v23 = v8;
    __int16 v24 = 2114;
    __int16 v25 = v9;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Request to Stop Browsing for HomeKit accessories - force %{public}@", (uint8_t *)&v22, 0x16u);
  }
  id v10 = [(HAPAccessoryServerBrowserWiProxBTLE *)v6 wpHomeKit];
  uint64_t v11 = [v10 state];

  if (v11 == 3)
  {
    BOOL v12 = [(HAPAccessoryServerBrowserWiProxBTLE *)v6 trackedIdentifiers];
    if ([v12 count] && -[HAPAccessoryServerBrowserWiProxBTLE scanInBackground](v6, "scanInBackground"))
    {

      if (!a3)
      {
        [(HAPAccessoryServerBrowserWiProxBTLE *)v6 _startScanningWithScanType:0];
        return;
      }
    }
    else
    {
    }
    id v13 = (void *)MEMORY[0x1D944E080]();
    double v14 = v6;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      id v17 = NSNumber;
      id v18 = [(HAPAccessoryServerBrowserWiProxBTLE *)v14 trackedIdentifiers];
      uint64_t v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
      [(HAPAccessoryServerBrowserWiProxBTLE *)v14 scanInBackground];
      id v20 = HMFBooleanToString();
      uint64_t v21 = HMFBooleanToString();
      int v22 = 138544130;
      int v23 = v16;
      __int16 v24 = 2114;
      __int16 v25 = v19;
      __int16 v26 = 2114;
      BOOL v27 = v20;
      __int16 v28 = 2114;
      BOOL v29 = v21;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Stopping Scan. Tracked Identifiers: %{public}@, Background Scan: %{public}@, Force: %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    [(HAPAccessoryServerBrowserWiProxBTLE *)v14 _stopScanning];
  }
}

- (void)stopBrowsingForHAPBLEAccessories:(BOOL)a3
{
  unint64_t v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__HAPAccessoryServerBrowserWiProxBTLE_stopBrowsingForHAPBLEAccessories___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __72__HAPAccessoryServerBrowserWiProxBTLE_stopBrowsingForHAPBLEAccessories___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopBrowsingForHAPBLEAccessories:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_startBrowsingForHAPBLEAccessories
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  unint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Request to Start Browsing for HomeKit accessories", (uint8_t *)&v15, 0xCu);
  }
  [(HAPAccessoryServerBrowserWiProxBTLE *)v4 setCurrentScanState:1];
  BOOL v7 = [(HAPAccessoryServerBrowserWiProxBTLE *)v4 wpHomeKit];
  uint64_t v8 = [v7 state];

  id v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = v4;
  uint64_t v11 = HMFGetOSLogHandle();
  BOOL v12 = v11;
  if (v8 == 3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Re-starting High Priority Scan", (uint8_t *)&v15, 0xCu);
    }
    [(HAPAccessoryServerBrowserWiProxBTLE *)v10 _stopScanning];
    [(HAPAccessoryServerBrowserWiProxBTLE *)v10 _startScanningWithScanType:2];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Pending scan as WiProx is not powered on", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)startBrowsingForHAPBLEAccessories
{
  id v3 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HAPAccessoryServerBrowserWiProxBTLE_startBrowsingForHAPBLEAccessories__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __72__HAPAccessoryServerBrowserWiProxBTLE_startBrowsingForHAPBLEAccessories__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startBrowsingForHAPBLEAccessories];
}

- (void)pauseScans
{
  id v3 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HAPAccessoryServerBrowserWiProxBTLE_pauseScans__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__HAPAccessoryServerBrowserWiProxBTLE_pauseScans__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopScanning];
  id v2 = *(void **)(a1 + 32);

  return [v2 setCurrentScanState:0];
}

- (void)restartScans
{
  id v3 = [(HAPAccessoryServerBrowserWiProxBTLE *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HAPAccessoryServerBrowserWiProxBTLE_restartScans__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __51__HAPAccessoryServerBrowserWiProxBTLE_restartScans__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wpHomeKit];
  uint64_t v3 = [v2 state];

  if (v3 == 3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) currentScanType];
    [*(id *)(a1 + 32) _stopScanning];
    unint64_t v5 = *(void **)(a1 + 32);
    [v5 _startScanningWithScanType:v4];
  }
}

- (void)_stopScanning
{
  uint64_t v3 = [(HAPAccessoryServerBrowserWiProxBTLE *)self wpHomeKit];
  uint64_t v4 = [v3 state];

  if (v4 != 2)
  {
    unint64_t v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self wpHomeKit];
    [v5 stopScanningForType:0];

    id v6 = [(HAPAccessoryServerBrowserWiProxBTLE *)self wpHomeKit];
    [v6 stopScanningForType:1];
  }

  [(HAPAccessoryServerBrowserWiProxBTLE *)self setCurrentScanType:-1];
}

- (void)_startScanningWithScanType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FB7080]];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB7078]];

  if (!a3) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FB7088]];
  }
  BOOL v7 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerBrowserWiProxBTLE *)self setCurrentScanType:a3]);
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v13 = 138543618;
    double v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Start scanning with data: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(HAPAccessoryServerBrowserWiProxBTLE *)v8 wpHomeKit];
  [v11 startScanningWithData:v5 forType:0];

  BOOL v12 = [(HAPAccessoryServerBrowserWiProxBTLE *)v8 wpHomeKit];
  [v12 startScanningWithData:v5 forType:1];
}

- (unsigned)routeMode
{
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled != 1) {
    return 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unsigned __int8 routeMode = self->_routeMode;
  os_unfair_lock_unlock(p_lock);
  return routeMode;
}

- (void)setRouteMode:(unsigned __int8)a3
{
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled == 1)
  {
    os_unfair_lock_lock_with_options();
    self->_unsigned __int8 routeMode = a3;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)removeTrackedPeripheralWithStableIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  unint64_t v5 = [(HAPAccessoryServerBrowserWiProxBTLE *)self _lock_trackedPeripheralWithIdentifier:v4];
  if (v5) {
    [(NSMutableSet *)self->_trackedPeripherals removeObject:v5];
  }

  os_unfair_lock_unlock(&self->_lock);
  return v5 != 0;
}

- (id)trackedIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CAD0] setWithSet:self->_trackedIdentifiers];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)trackedPeripherals
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CAD0] setWithSet:self->_trackedPeripherals];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HAPAccessoryServerBrowserWiProxBTLE)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    v22.receiver = self;
    v22.super_class = (Class)HAPAccessoryServerBrowserWiProxBTLE;
    id v9 = [(HAPAccessoryServerBrowserWiProxBTLE *)&v22 init];
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_workQueue, a4);
      objc_storeWeak((id *)&v10->_delegate, v6);
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB7070]) initWithDelegate:v10 queue:v10->_workQueue];
      wpHomeKit = v10->_wpHomeKit;
      v10->_wpHomeKit = (WPHomeKit *)v11;

      v10->_currentScanState = 0;
      v10->_scanInBackground = 0;
      uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
      trackedIdentifiers = v10->_trackedIdentifiers;
      v10->_trackedIdentifiers = (NSMutableSet *)v13;

      uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
      trackedPeripherals = v10->_trackedPeripherals;
      v10->_trackedPeripherals = (NSMutableSet *)v15;

      v10->_unsigned __int8 routeMode = 0;
      v10->_currentScanType = -1;
    }
    self = v10;
    uint64_t v17 = self;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D944E080]();
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v24 = v20;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid arguments", buf, 0xCu);
    }
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t46 != -1) {
    dispatch_once(&logCategory__hmf_once_t46, &__block_literal_global_20290);
  }
  id v2 = (void *)logCategory__hmf_once_v47;

  return v2;
}

uint64_t __50__HAPAccessoryServerBrowserWiProxBTLE_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v47;
  logCategory__hmf_once_id v47 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end