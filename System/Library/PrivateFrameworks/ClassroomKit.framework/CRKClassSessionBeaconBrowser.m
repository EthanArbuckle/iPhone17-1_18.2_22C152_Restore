@interface CRKClassSessionBeaconBrowser
+ (id)invitationUUID;
- (BOOL)allowInvitationSessions;
- (BOOL)isBrowsing;
- (BOOL)isScanning;
- (CRKClassSessionBeaconBrowser)init;
- (CRKClassSessionBeaconBrowserDelegate)delegate;
- (CRKWiProxTrackerScanner)trackerScanner;
- (NSSet)organizationUUIDs;
- (NSSet)trackingUUIDs;
- (id)organizationUUIDsMatchingZoneData:(id)a3;
- (id)stateDictionary;
- (id)zoneDataForAdvertisementUUID:(id)a3;
- (id)zoneDataForOrganizationUUID:(id)a3;
- (void)dealloc;
- (void)delegateDidFailWithError:(id)a3;
- (void)delegateDidFindClassSession:(id)a3 flags:(unsigned __int16)a4;
- (void)delegateDidFindInvitationSessionWithEndpoint:(id)a3;
- (void)increaseScanFrequencyForDuration:(double)a3;
- (void)increasedScanDurationElapsed;
- (void)setAllowInvitationSessions:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsBrowsing:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setOrganizationUUIDs:(id)a3;
- (void)setTrackerScanner:(id)a3;
- (void)setTrackingUUIDs:(id)a3;
- (void)startBrowsing;
- (void)startInitialScan;
- (void)startScanningForDevicesInZone:(id)a3;
- (void)stopBrowsing;
- (void)stopScanningForDevicesInAllZones;
- (void)stopScanningForDevicesInZone:(id)a3;
- (void)trackerScanner:(id)a3 didUpdateDeviceScannerState:(id)a4;
- (void)trackerScanner:(id)a3 didUpdateZoneTrackerState:(id)a4;
- (void)trackerScanner:(id)a3 scanner:(id)a4 didFailToRegisterDevices:(id)a5 withError:(id)a6;
- (void)trackerScanner:(id)a3 scanner:(id)a4 foundDevice:(id)a5 withData:(id)a6;
- (void)trackerScanner:(id)a3 scanner:(id)a4 foundRequestedDevices:(id)a5;
- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 didFailToRegisterZones:(id)a5 withError:(id)a6;
- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 enteredZone:(id)a5;
- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 exitedZone:(id)a5;
- (void)updateScanner;
- (void)updateZones;
@end

@implementation CRKClassSessionBeaconBrowser

- (void)dealloc
{
  [(CRKClassSessionBeaconBrowser *)self stopBrowsing];
  v3.receiver = self;
  v3.super_class = (Class)CRKClassSessionBeaconBrowser;
  [(CRKClassSessionBeaconBrowser *)&v3 dealloc];
}

- (CRKClassSessionBeaconBrowser)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKClassSessionBeaconBrowser;
  v2 = [(CRKClassSessionBeaconBrowser *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mScanningZones = v2->mScanningZones;
    v2->mScanningZones = (NSMutableSet *)v3;
  }
  return v2;
}

- (void)setOrganizationUUIDs:(id)a3
{
  unint64_t v10 = (unint64_t)a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKClassSessionBeaconBrowser.m", 64, @"%@ must be called from the main thread", v9 object file lineNumber description];
  }
  organizationUUIDs = self->_organizationUUIDs;
  if (v10 | (unint64_t)organizationUUIDs)
  {
    if (([(NSSet *)organizationUUIDs isEqual:v10] & 1) == 0)
    {
      objc_super v6 = (NSSet *)[(id)v10 copy];
      v7 = self->_organizationUUIDs;
      self->_organizationUUIDs = v6;

      if ([(CRKClassSessionBeaconBrowser *)self isBrowsing]) {
        [(CRKClassSessionBeaconBrowser *)self updateZones];
      }
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)setAllowInvitationSessions:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    objc_super v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKClassSessionBeaconBrowser.m", 78, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  if (self->_allowInvitationSessions != v3)
  {
    self->_allowInvitationSessions = v3;
    if ([(CRKClassSessionBeaconBrowser *)self isBrowsing])
    {
      [(CRKClassSessionBeaconBrowser *)self updateZones];
    }
  }
}

- (void)startBrowsing
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    objc_super v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKClassSessionBeaconBrowser.m", 94, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  if (![(CRKClassSessionBeaconBrowser *)self isBrowsing])
  {
    v4 = _CRKLogBluetooth_2();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Initializing bluetooth tracker and scanner", buf, 2u);
    }

    v5 = [[CRKWiProxTrackerScanner alloc] initWithDelegate:self];
    [(CRKClassSessionBeaconBrowser *)self setTrackerScanner:v5];

    [(CRKClassSessionBeaconBrowser *)self updateZones];
    [(CRKClassSessionBeaconBrowser *)self setIsBrowsing:1];
    [(CRKClassSessionBeaconBrowser *)self startInitialScan];
  }
}

- (void)stopBrowsing
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKClassSessionBeaconBrowser.m", 110, @"%@ must be called from the main thread", v9 object file lineNumber description];
  }
  if ([(CRKClassSessionBeaconBrowser *)self isBrowsing])
  {
    v4 = _CRKLogBluetooth_2();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Stop browsing", buf, 2u);
    }

    [(CRKClassSessionBeaconBrowser *)self setIsBrowsing:0];
    [(CRKClassSessionBeaconBrowser *)self stopScanningForDevicesInAllZones];
    v5 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
    [v5 unregisterAllZoneChanges];

    objc_super v6 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
    [v6 invalidate];

    [(CRKClassSessionBeaconBrowser *)self setTrackerScanner:0];
    self->mZoneTrackerLastState = 0;
    [(CRKClassSessionBeaconBrowser *)self setIsScanning:0];
    v7 = [MEMORY[0x263EFFA08] set];
    [(CRKClassSessionBeaconBrowser *)self setTrackingUUIDs:v7];
  }
}

- (void)increaseScanFrequencyForDuration:(double)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKClassSessionBeaconBrowser.m", 129, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  objc_super v6 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v10 = a3;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "Increasing bluetooth scan rate for %f seconds", buf, 0xCu);
  }

  ++self->mIncreasedScanRequestCount;
  [(CRKClassSessionBeaconBrowser *)self updateScanner];
  [(CRKClassSessionBeaconBrowser *)self performSelector:sel_increasedScanDurationElapsed withObject:0 afterDelay:a3];
}

- (id)stateDictionary
{
  v60[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
  uint64_t v4 = [v3 zoneTrackerState];

  if (v4 == 3)
  {
    v5 = objc_opt_new();
    objc_super v6 = objc_opt_new();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v7 = [(CRKClassSessionBeaconBrowser *)self organizationUUIDs];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v53 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v52 + 1) + 8 * i) UUIDString];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v9);
    }

    if ([(CRKClassSessionBeaconBrowser *)self allowInvitationSessions]) {
      [v6 addObject:@"436C6173-7372-6F6F-6D49-6E7669746531"];
    }
    if ([v6 count])
    {
      v13 = [v6 componentsJoinedByString:@", "];
      [v5 setObject:v13 forKeyedSubscript:@"Monitoring Zones"];
    }
    v40 = v5;
    v41 = v6;
    v14 = objc_opt_new();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDString:");
    v16 = [(CRKClassSessionBeaconBrowser *)self zoneDataForAdvertisementUUID:v15];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v43 = self;
    v17 = self->mScanningZones;
    uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v49;
      unint64_t v21 = 0x263EFF000uLL;
      v42 = v17;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          v24 = [*(id *)(v21 + 2296) data];
          int v25 = [v23 isEqualToData:v24];

          if (v25)
          {
            v26 = v14;
            v27 = @"Initial Scan";
LABEL_22:
            [v26 addObject:v27];
            continue;
          }
          if ([v23 isEqualToData:v16])
          {
            v26 = v14;
            v27 = @"436C6173-7372-6F6F-6D49-6E7669746531";
            goto LABEL_22;
          }
          v28 = v16;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v29 = [(CRKClassSessionBeaconBrowser *)v43 organizationUUIDsMatchingZoneData:v23];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v45;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v45 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = [*(id *)(*((void *)&v44 + 1) + 8 * k) UUIDString];
                [v14 addObject:v34];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v56 count:16];
            }
            while (v31);
          }

          v16 = v28;
          v17 = v42;
          unint64_t v21 = 0x263EFF000;
        }
        uint64_t v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v19);
    }

    v35 = v40;
    if ([v14 count])
    {
      v36 = [v14 componentsJoinedByString:@", "];
      [v40 setObject:v36 forKeyedSubscript:@"Scanning Zones"];
    }
    v37 = v41;
    if (v43->mIncreasedScanRequestCount) {
      [v40 setObject:@"YES" forKeyedSubscript:@"Ranging"];
    }
  }
  else
  {
    v59 = @"Bluetooth State";
    v38 = NSNumber;
    v37 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
    v14 = objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v37, "zoneTrackerState"));
    v60[0] = v14;
    v35 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
  }

  return v35;
}

- (id)zoneDataForOrganizationUUID:(id)a3
{
  BOOL v3 = a3;
  v5[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    [a3 getUUIDBytes:v5];
    BOOL v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:12];
  }

  return v3;
}

- (id)zoneDataForAdvertisementUUID:(id)a3
{
  BOOL v3 = a3;
  v5[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    [a3 getUUIDBytes:v5];
    BOOL v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:16];
  }

  return v3;
}

- (id)organizationUUIDsMatchingZoneData:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 0xC)
  {
    if ((unint64_t)[v4 length] >= 0xD)
    {
      uint64_t v6 = objc_msgSend(v4, "subdataWithRange:", 0, 12);

      id v4 = (id)v6;
    }
    v5 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [(CRKClassSessionBeaconBrowser *)self organizationUUIDs];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v13 = [(CRKClassSessionBeaconBrowser *)self zoneDataForOrganizationUUID:v12];
          int v14 = [v13 isEqualToData:v4];

          if (v14) {
            [v5 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

+ (id)invitationUUID
{
  if (invitationUUID_onceToken != -1) {
    dispatch_once(&invitationUUID_onceToken, &__block_literal_global_82);
  }
  v2 = (void *)invitationUUID_invitationUUID;

  return v2;
}

uint64_t __46__CRKClassSessionBeaconBrowser_invitationUUID__block_invoke()
{
  invitationUUID_invitationUUID = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"436C6173-7372-6F6F-6D49-6E7669746531"];

  return MEMORY[0x270F9A758]();
}

- (void)updateZones
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
  uint64_t v4 = [v3 zoneTrackerState];

  if (v4 == 2)
  {
    v5 = _CRKLogBluetooth_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_INFO, "Tracking off; unregistering all zones", buf, 2u);
    }

    uint64_t v6 = [MEMORY[0x263EFFA08] set];
    [(CRKClassSessionBeaconBrowser *)self setTrackingUUIDs:v6];

    v7 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
    [v7 unregisterAllZoneChanges];

    [(CRKClassSessionBeaconBrowser *)self stopScanningForDevicesInAllZones];
    return;
  }
  uint64_t v8 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
  uint64_t v9 = [v8 zoneTrackerState];

  if (v9 == 3)
  {
    uint64_t v10 = objc_opt_new();
    long long v52 = objc_opt_new();
    uint64_t v11 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v12 = [(CRKClassSessionBeaconBrowser *)self organizationUUIDs];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v62 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          [v10 addObject:v17];
          long long v18 = [(CRKClassSessionBeaconBrowser *)self trackingUUIDs];
          char v19 = [v18 containsObject:v17];

          if ((v19 & 1) == 0)
          {
            uint64_t v20 = [(CRKClassSessionBeaconBrowser *)self zoneDataForOrganizationUUID:v17];
            if (v20) {
              [v52 addObject:v20];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v61 objects:v73 count:16];
      }
      while (v14);
    }

    uint64_t v21 = [(id)objc_opt_class() invitationUUID];
    v22 = [(CRKClassSessionBeaconBrowser *)self trackingUUIDs];
    v23 = objc_msgSend(v22, "crk_setBySubtractingSet:", v10);
    v24 = (void *)[v23 mutableCopy];

    [v24 removeObject:v21];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v57 objects:v72 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = [(CRKClassSessionBeaconBrowser *)self zoneDataForOrganizationUUID:*(void *)(*((void *)&v57 + 1) + 8 * j)];
          if (v30) {
            [v11 addObject:v30];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v57 objects:v72 count:16];
      }
      while (v27);
    }

    if ([(CRKClassSessionBeaconBrowser *)self allowInvitationSessions])
    {
      [v10 addObject:v21];
      uint64_t v31 = [(CRKClassSessionBeaconBrowser *)self trackingUUIDs];
      char v32 = [v31 containsObject:v21];

      v33 = v52;
      if ((v32 & 1) == 0)
      {
        v34 = [(CRKClassSessionBeaconBrowser *)self zoneDataForAdvertisementUUID:v21];
        if (v34)
        {
          v35 = v52;
LABEL_36:
          [v35 addObject:v34];
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
    else
    {
      v37 = [(CRKClassSessionBeaconBrowser *)self trackingUUIDs];
      int v38 = [v37 containsObject:v21];

      v33 = v52;
      if (v38)
      {
        v34 = [(CRKClassSessionBeaconBrowser *)self zoneDataForAdvertisementUUID:v21];
        if (v34)
        {
          v35 = v11;
          goto LABEL_36;
        }
LABEL_37:
      }
    }
    if ([v11 count])
    {
      v39 = _CRKLogBluetooth_2();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
        *(_DWORD *)buf = 138543362;
        v71 = v40;
        _os_log_impl(&dword_224C00000, v39, OS_LOG_TYPE_DEFAULT, "Removing %{public}@ no-longer-needed zones", buf, 0xCu);
      }
      v41 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
      v68 = @"ZTZonesArray";
      v69 = v11;
      v42 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      [v41 unregisterForZoneChanges:v42];

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v43 = v11;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v53 objects:v67 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v54;
        do
        {
          for (uint64_t k = 0; k != v45; ++k)
          {
            if (*(void *)v54 != v46) {
              objc_enumerationMutation(v43);
            }
            [(CRKClassSessionBeaconBrowser *)self stopScanningForDevicesInZone:*(void *)(*((void *)&v53 + 1) + 8 * k)];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v53 objects:v67 count:16];
        }
        while (v45);
      }

      v33 = v52;
    }
    if ([v33 count])
    {
      long long v48 = _CRKLogBluetooth_2();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        long long v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
        *(_DWORD *)buf = 138543362;
        v71 = v49;
        _os_log_impl(&dword_224C00000, v48, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ zones", buf, 0xCu);
      }
      long long v50 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
      v65[0] = @"ZTZonesArray";
      v65[1] = @"ZTZoneEntry";
      v66[0] = v33;
      v66[1] = MEMORY[0x263EFFA88];
      v65[2] = @"ZTZoneExit";
      v66[2] = MEMORY[0x263EFFA88];
      long long v51 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
      [v50 registerForZoneChangesMatching:v51];
    }
    [(CRKClassSessionBeaconBrowser *)self setTrackingUUIDs:v10];

    return;
  }
  v36 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224C00000, v36, OS_LOG_TYPE_INFO, "Tracking state indeterminate; waiting for update", buf, 2u);
  }
}

- (void)startInitialScan
{
  id v3 = [MEMORY[0x263EFF8F8] data];
  [(CRKClassSessionBeaconBrowser *)self startScanningForDevicesInZone:v3];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_stopScanningForDevicesInZone_ object:v3];
  [(CRKClassSessionBeaconBrowser *)self performSelector:sel_stopScanningForDevicesInZone_ withObject:v3 afterDelay:5.0];
}

- (void)startScanningForDevicesInZone:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Start scanning for devices in zone: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableSet *)self->mScanningZones addObject:v4];
  [(CRKClassSessionBeaconBrowser *)self updateScanner];
}

- (void)stopScanningForDevicesInZone:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_stopScanningForDevicesInZone_ object:v4];
  if ([(NSMutableSet *)self->mScanningZones containsObject:v4])
  {
    v5 = _CRKLogBluetooth_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Stop scanning in zone: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [(NSMutableSet *)self->mScanningZones removeObject:v4];
    [(CRKClassSessionBeaconBrowser *)self updateScanner];
  }
}

- (void)stopScanningForDevicesInAllZones
{
  id v3 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Stop scanning all zones", v4, 2u);
  }

  [(NSMutableSet *)self->mScanningZones removeAllObjects];
  [(CRKClassSessionBeaconBrowser *)self updateScanner];
}

- (void)increasedScanDurationElapsed
{
  int64_t v2 = self->mIncreasedScanRequestCount - 1;
  self->mIncreasedScanRequestCount = v2;
  if (!v2)
  {
    id v4 = _CRKLogBluetooth_2();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Decreasing bluetooth scan rate", v5, 2u);
    }

    [(CRKClassSessionBeaconBrowser *)self updateScanner];
  }
}

- (void)updateScanner
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = NSNumber;
    v5 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
    int v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "deviceScannerState"));
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](self->mScanningZones, "count"));
    uint64_t v8 = [NSNumber numberWithInteger:self->mIncreasedScanRequestCount];
    *(_DWORD *)buf = 138543874;
    v23 = v6;
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2114;
    uint64_t v27 = v8;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_INFO, "Updating scanner: scanner state = %{public}@, zones count = %{public}@, increased scan request count = %{public}@", buf, 0x20u);
  }
  uint64_t v9 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
  if ([v9 deviceScannerState] == 3)
  {
    uint64_t v10 = [(NSMutableSet *)self->mScanningZones count];

    if (v10)
    {
      if (self->mIncreasedScanRequestCount <= 0) {
        uint64_t v11 = @"WPPuckBeaconNoRanging";
      }
      else {
        uint64_t v11 = @"WPPuckCompany";
      }
      uint64_t v12 = v11;
      uint64_t v13 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
      char v19 = v12;
      uint64_t v20 = @"kPuckTypes";
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
      uint64_t v21 = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      [v13 registerForDevicesMatching:v15 options:MEMORY[0x263EFFA78]];

      if (![(CRKClassSessionBeaconBrowser *)self isScanning])
      {
        +[CRKNetworkPowerAssertion increment];
        [(CRKClassSessionBeaconBrowser *)self setIsScanning:1];
      }

      return;
    }
  }
  else
  {
  }
  long long v16 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
  if ([v16 deviceScannerState] == 2)
  {
  }
  else
  {
    uint64_t v17 = [(NSMutableSet *)self->mScanningZones count];

    if (v17) {
      return;
    }
  }
  long long v18 = [(CRKClassSessionBeaconBrowser *)self trackerScanner];
  [v18 unregisterAllDeviceChanges];

  if ([(CRKClassSessionBeaconBrowser *)self isScanning])
  {
    [(CRKClassSessionBeaconBrowser *)self setIsScanning:0];
    +[CRKNetworkPowerAssertion decrement];
  }
}

- (void)trackerScanner:(id)a3 didUpdateZoneTrackerState:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int64_t mZoneTrackerLastState = self->mZoneTrackerLastState;
  uint64_t v7 = [v5 state];
  self->int64_t mZoneTrackerLastState = [v5 state];
  uint64_t v8 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 state];
    uint64_t v10 = @"YES";
    if (mZoneTrackerLastState == v7) {
      uint64_t v10 = @"NO";
    }
    uint64_t v11 = v10;
    int v12 = 134349314;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Zone tracker state %{public}ld, is changed: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  if (mZoneTrackerLastState != v7 && [v5 state] == 3)
  {
    [(CRKClassSessionBeaconBrowser *)self updateZones];
    [(CRKClassSessionBeaconBrowser *)self startInitialScan];
  }
}

- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 enteredZone:(id)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Zone entered %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(CRKClassSessionBeaconBrowser *)self startScanningForDevicesInZone:v6];
}

- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 exitedZone:(id)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Zone exited %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(CRKClassSessionBeaconBrowser *)self stopScanningForDevicesInZone:v6];
}

- (void)trackerScanner:(id)a3 zoneTracker:(id)a4 didFailToRegisterZones:(id)a5 withError:(id)a6
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08608];
  v12[0] = a6;
  uint64_t v7 = NSDictionary;
  id v8 = a6;
  id v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  uint64_t v10 = CRKErrorWithCodeAndUserInfo(103, v9);
  [(CRKClassSessionBeaconBrowser *)self delegateDidFailWithError:v10];
}

- (void)trackerScanner:(id)a3 didUpdateDeviceScannerState:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "state"));
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "Device scanner state %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [(CRKClassSessionBeaconBrowser *)self updateScanner];
}

- (void)trackerScanner:(id)a3 scanner:(id)a4 foundRequestedDevices:(id)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a5;
  id v6 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)trackerScanner:(id)a3 scanner:(id)a4 foundDevice:(id)a5 withData:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a6;
  int v7 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Found device %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v8 = [v6 objectForKeyedSubscript:@"kPuckCompanyUUID"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"kPuckCompanyMajor"];
  unsigned __int16 v10 = [v9 shortValue];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"kPuckCompanyMinor"];
  LOWORD(v9) = [v11 shortValue];

  uint64_t v12 = (unsigned __int16)v9 | (v10 << 16);
  if ([(CRKClassSessionBeaconBrowser *)self allowInvitationSessions]
    && ([v8 UUIDString],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqualToString:@"436C6173-7372-6F6F-6D49-6E7669746531"],
        v13,
        v14))
  {
    uint64_t v15 = objc_msgSend(NSString, "crk_stringWithIPAddress:", v12);
    uint64_t v16 = [[CRKRemoteEndpoint alloc] initWithIPAddress:v15 port:(unsigned __int16)CRKClassroomServicePortNumberV2];
    [(CRKClassSessionBeaconBrowser *)self delegateDidFindInvitationSessionWithEndpoint:v16];
  }
  else
  {
    id v29 = v6;
    long long buf = 0uLL;
    [v8 getUUIDBytes:&buf];
    unsigned int v17 = HIWORD(buf);
    unsigned int v18 = WORD6(buf);
    uint64_t v28 = v8;
    [(CRKClassSessionBeaconBrowser *)self zoneDataForOrganizationUUID:v8];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v27 = v34 = 0u;
    char v19 = -[CRKClassSessionBeaconBrowser organizationUUIDsMatchingZoneData:](self, "organizationUUIDsMatchingZoneData:");
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = bswap32(v17) >> 16;
      uint64_t v23 = bswap32(v18) >> 16;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v19);
          }
          __int16 v26 = (void *)[objc_alloc(MEMORY[0x263F39D28]) initWithOrganizationUUID:*(void *)(*((void *)&v31 + 1) + 8 * v25) groupID:v22 leaderIP:v12 port:(unsigned __int16)CRKClassroomServicePortNumberV2];
          [(CRKClassSessionBeaconBrowser *)self delegateDidFindClassSession:v26 flags:v23];

          ++v25;
        }
        while (v21 != v25);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v21);
    }

    id v8 = v28;
    id v6 = v29;
  }
}

- (void)trackerScanner:(id)a3 scanner:(id)a4 didFailToRegisterDevices:(id)a5 withError:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  uint64_t v9 = _CRKLogBluetooth_2();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CRKClassSessionBeaconBrowser trackerScanner:scanner:didFailToRegisterDevices:withError:]((uint64_t)v8, (uint64_t)v7, v9);
  }
}

- (void)delegateDidFindClassSession:(id)a3 flags:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v9 = a3;
  id v6 = [(CRKClassSessionBeaconBrowser *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CRKClassSessionBeaconBrowser *)self delegate];
    [v8 beaconBrowser:self didFindBeaconForClassSession:v9 flags:v4];
  }
}

- (void)delegateDidFindInvitationSessionWithEndpoint:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(CRKClassSessionBeaconBrowser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKClassSessionBeaconBrowser *)self delegate];
    [v6 beaconBrowser:self didFindBeaconForInvitationSessionWithEndpoint:v7];
  }
}

- (void)delegateDidFailWithError:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(CRKClassSessionBeaconBrowser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKClassSessionBeaconBrowser *)self delegate];
    [v6 beaconBrowser:self didFailWithError:v7];
  }
}

- (CRKClassSessionBeaconBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKClassSessionBeaconBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)organizationUUIDs
{
  return self->_organizationUUIDs;
}

- (BOOL)allowInvitationSessions
{
  return self->_allowInvitationSessions;
}

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (CRKWiProxTrackerScanner)trackerScanner
{
  return self->_trackerScanner;
}

- (void)setTrackerScanner:(id)a3
{
}

- (NSSet)trackingUUIDs
{
  return self->_trackingUUIDs;
}

- (void)setTrackingUUIDs:(id)a3
{
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingUUIDs, 0);
  objc_storeStrong((id *)&self->_trackerScanner, 0);
  objc_storeStrong((id *)&self->_organizationUUIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->mScanningZones, 0);
}

- (void)trackerScanner:(os_log_t)log scanner:didFailToRegisterDevices:withError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

@end