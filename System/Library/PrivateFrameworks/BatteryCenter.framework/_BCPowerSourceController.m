@interface _BCPowerSourceController
+ (void)initialize;
- (BOOL)_isDevicePartOfPair:(id)a3;
- (BOOL)_isLowPowerModeActive;
- (BOOL)_shouldCoalesceDevices:(id)a3 minimumPercentCharge:(int64_t *)a4;
- (BOOL)_shouldConsiderDeviceWithPowerSourceDescription:(id)a3;
- (NSArray)connectedDevices;
- (_BCPowerSourceController)init;
- (id)_deviceByCoalescingDevice:(id)a3;
- (id)_identifierFromPowerSourceDescription:(id)a3;
- (id)_nameForCurrentDevice;
- (id)_nameForVendor:(int64_t)a3 accessoryCategory:(unint64_t)a4 name:(id)a5 partName:(id)a6 isInternal:(BOOL)a7;
- (id)_orderedDevicesFromPowerSourcesBlob:(void *)a3 powerSourcesList:(__CFArray *)a4;
- (int)_displayChargePercentForCurrentCapacity:(id)a3 andMaxCapacity:(id)a4 updateZeroValue:(BOOL)a5;
- (int)_registerForNotification:(const char *)a3 token:(int *)a4 queue:(id)a5 handler:(id)a6;
- (int)_registerForPowerSourceChangeNotification:(const char *)a3 token:(int *)a4 queue:(id)a5;
- (int64_t)_lowBatteryLevelForCurrentDevice;
- (int64_t)_lowBatteryLevelForVendor:(int64_t)a3 accessoryCategory:(unint64_t)a4 transportType:(int64_t)a5;
- (int64_t)_powerSourceStateFromPowerSourceStateString:(id)a3;
- (int64_t)_transportTypeFromPowerSourceTransportTypeString:(id)a3;
- (int64_t)_vendorFromPowerSourceDescriptionVendorIdentifier:(id)a3 transportType:(int64_t)a4;
- (unint64_t)_accessoryCategoryFromPowerSourceAccessoryCategory:(id)a3 partType:(unint64_t)a4 transportType:(int64_t)a5 vendor:(int64_t)a6 productIdentifier:(int64_t)a7;
- (unint64_t)_partFromPowerSourcePartIdentifier:(id)a3;
- (void)_beginPowerSourceObservingIfNecessary;
- (void)_endPowerSourceObserving;
- (void)_handleLowPowerModeChanged:(int)a3;
- (void)_notifyObserver:(id)a3 block:(id)a4 queue:(id)a5;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_queryConnectedDevices;
- (void)_updateLowPowerModeState;
- (void)addBatteryDeviceObserver:(id)a3 queue:(id)a4;
- (void)connectedDevices;
- (void)dealloc;
- (void)removeBatteryDeviceObserver:(id)a3;
@end

@implementation _BCPowerSourceController

- (void)_queryConnectedDevices
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_21C664000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Query for connected devices", buf, 0xCu);
  }
  v4 = [(_BCPowerSourceController *)self connectedDevices];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50___BCPowerSourceController__queryConnectedDevices__block_invoke;
  v6[3] = &unk_264413B30;
  id v7 = v4;
  id v5 = v4;
  [(_BCPowerSourceController *)self _notifyObserversWithBlock:v6];
}

- (NSArray)connectedDevices
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_21C664000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Fetch connected devices", buf, 0xCu);
  }
  IOPSCopyPowerSourcesByTypePrecise();
  v4 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_ERROR)) {
    [(_BCPowerSourceController *)(uint64_t)self connectedDevices];
  }
  id v5 = MEMORY[0x263EFFA68];

  return (NSArray *)v5;
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)[(NSMapTable *)v5->_observersToQueues copy];
    objc_sync_exit(v5);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v12 = objc_msgSend(v7, "objectForKey:", v11, (void)v13);
          [(_BCPowerSourceController *)v5 _notifyObserver:v11 block:v4 queue:v12];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_notifyObserver:(id)a3 block:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8 && v9 && a5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56___BCPowerSourceController__notifyObserver_block_queue___block_invoke;
    block[3] = &unk_264413C18;
    block[4] = self;
    id v12 = v8;
    id v13 = v10;
    dispatch_async((dispatch_queue_t)a5, block);
  }
}

- (id)_orderedDevicesFromPowerSourcesBlob:(void *)a3 powerSourcesList:(__CFArray *)a4
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = [MEMORY[0x263EFF9C0] set];
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  v130[0] = MEMORY[0x263EF8330];
  v130[1] = 3221225472;
  v130[2] = __81___BCPowerSourceController__orderedDevicesFromPowerSourcesBlob_powerSourcesList___block_invoke;
  v130[3] = &unk_264413B80;
  v110 = self;
  v130[4] = self;
  id v87 = v9;
  id v131 = v87;
  v88 = (uint64_t (**)(void, void))MEMORY[0x21D4AC9D0](v130);
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  CFIndex Count = CFArrayGetCount(a4);
  id v12 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v137 = v110;
    __int16 v138 = 2048;
    CFIndex v139 = Count;
    _os_log_impl(&dword_21C664000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found %lu power sources", buf, 0x16u);
  }
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
      long long v15 = IOPSGetPowerSourceDescription(a3, ValueAtIndex);
      [v10 addObject:v15];
    }
  }
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  obuint64_t j = v10;
  uint64_t v16 = [obj countByEnumeratingWithState:&v126 objects:v135 count:16];
  v17 = v110;
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v127;
    uint64_t v89 = *(void *)v127;
    do
    {
      uint64_t v20 = 0;
      uint64_t v91 = v18;
      do
      {
        if (*(void *)v127 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v126 + 1) + 8 * v20);
        v22 = (void *)[v21 mutableCopy];
        v111 = [v21 objectForKey:@"Debug Information"];
        if ([v111 count]) {
          [v22 removeObjectForKey:@"Debug Information"];
        }
        v23 = BCLogPowerSourceController;
        if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v137 = v17;
          __int16 v138 = 2114;
          CFIndex v139 = (CFIndex)v22;
          _os_log_impl(&dword_21C664000, v23, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found power source: %{public}@", buf, 0x16u);
        }
        if ([v111 count])
        {
          v24 = BCLogPowerSourceController;
          if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v137 = v17;
            __int16 v138 = 2114;
            CFIndex v139 = (CFIndex)v111;
            _os_log_debug_impl(&dword_21C664000, v24, OS_LOG_TYPE_DEBUG, "(%{public}@) Power source debug info: %{public}@", buf, 0x16u);
          }
        }
        if ([(_BCPowerSourceController *)v17 _shouldConsiderDeviceWithPowerSourceDescription:v21])
        {
          v102 = v22;
          v25 = [(_BCPowerSourceController *)v17 _identifierFromPowerSourceDescription:v21];
          v26 = [v21 objectForKey:@"Product ID"];
          uint64_t v98 = [v26 integerValue];

          v104 = [v21 objectForKey:@"Model Number"];
          v27 = [v21 objectForKey:@"Transport Type"];
          uint64_t v28 = [(_BCPowerSourceController *)v17 _transportTypeFromPowerSourceTransportTypeString:v27];

          v29 = [v21 objectForKey:@"Vendor ID"];
          uint64_t v30 = [(_BCPowerSourceController *)v17 _vendorFromPowerSourceDescriptionVendorIdentifier:v29 transportType:v28];

          v103 = [v21 objectForKey:@"Group Identifier"];
          [v21 objectForKey:@"Part Identifier"];
          v32 = v31 = v17;
          uint64_t v33 = [(_BCPowerSourceController *)v31 _partFromPowerSourcePartIdentifier:v32];

          v34 = [v7 objectForKey:v25];
          v101 = [v21 objectForKey:@"Accessory Category"];
          uint64_t v97 = v28;
          uint64_t v108 = v30;
          id v106 = -[_BCPowerSourceController _accessoryCategoryFromPowerSourceAccessoryCategory:partType:transportType:vendor:productIdentifier:](v31, "_accessoryCategoryFromPowerSourceAccessoryCategory:partType:transportType:vendor:productIdentifier:");
          v105 = v25;
          if (v34)
          {
            if ((((uint64_t (**)(void, void *))v88)[2](v88, v34) & 1) == 0) {
              goto LABEL_21;
            }
LABEL_22:
            v35 = [v21 objectForKey:@"Power Source State"];
            uint64_t v99 = [(_BCPowerSourceController *)v110 _powerSourceStateFromPowerSourceStateString:v35];

            v36 = [v21 objectForKey:@"Type"];
            uint64_t v37 = [v36 isEqualToString:@"InternalBattery"];
            v96 = v36;
            LODWORD(v36) = [v36 isEqualToString:@"Accessory Source"];
            v38 = [v21 objectForKey:@"Name"];
            v39 = [v21 objectForKey:@"Part Name"];
            uint64_t v40 = [(_BCPowerSourceController *)v110 _nameForVendor:v108 accessoryCategory:v106 name:v38 partName:v39 isInternal:v37];

            int v94 = v37;
            [v34 setInternal:v37];
            [v34 setPowerSource:v36 ^ 1];
            [v34 setPowerSourceState:v99];
            [v34 setTransportType:v97];
            v95 = (void *)v40;
            [v34 setName:v40];
            v41 = [v21 objectForKey:@"Name"];
            [v34 setGroupName:v41];

            v42 = [v21 objectForKey:@"Accessory Identifier"];
            uint64_t v43 = objc_opt_class();
            id v44 = v42;
            if (v43)
            {
              if (objc_opt_isKindOfClass()) {
                v45 = v44;
              }
              else {
                v45 = 0;
              }
            }
            else
            {
              v45 = 0;
            }
            id v47 = v45;

            [v34 setAccessoryIdentifier:v47];
            unsigned int v100 = 1;
            [v34 setConnected:1];
            v93 = [v21 objectForKey:@"AdapterDetails"];
            v48 = [v93 objectForKey:@"IsWireless"];
            uint64_t v49 = [v48 BOOLValue];

            [v34 setWirelesslyCharging:v49];
            uint64_t v50 = [v21 objectForKey:@"Current Capacity"];
            v51 = [v21 objectForKey:@"Max Capacity"];
            v92 = (void *)v50;
            int v52 = -[_BCPowerSourceController _displayChargePercentForCurrentCapacity:andMaxCapacity:updateZeroValue:](v110, "_displayChargePercentForCurrentCapacity:andMaxCapacity:updateZeroValue:", v50, v51, [v34 isInternal]);
            uint64_t v53 = [(_BCPowerSourceController *)v110 _lowBatteryLevelForVendor:v108 accessoryCategory:v106 transportType:v97];
            v54 = [v21 objectForKey:@"Is Charging"];
            if (([v54 BOOLValue] & 1) == 0)
            {
              v55 = [v21 objectForKey:@"Show Charging UI"];
              unsigned int v100 = [v55 BOOLValue];
            }
            if ([v34 isInternal]) {
              uint64_t v56 = MGGetBoolAnswer() ^ 1;
            }
            else {
              uint64_t v56 = 0;
            }
            [v34 setPercentCharge:v52];
            [v34 setLowBattery:v53 >= v52];
            if (v94)
            {
              objc_msgSend(v34, "setLowPowerModeActive:", -[_BCPowerSourceController _isLowPowerModeActive](v110, "_isLowPowerModeActive"));
            }
            else
            {
              v57 = [v21 objectForKey:@"LPM Active"];
              objc_msgSend(v34, "setLowPowerModeActive:", objc_msgSend(v57, "BOOLValue"));
            }
            uint64_t v18 = v91;
            [v34 setCharging:v100];
            [v34 setApproximatesPercentCharge:v56];
            v58 = BCLogPowerSourceController;
            if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v137 = v110;
              __int16 v138 = 2114;
              CFIndex v139 = (CFIndex)v34;
              _os_log_impl(&dword_21C664000, v58, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found device: %{public}@", buf, 0x16u);
            }

            v22 = v102;
          }
          else
          {
            uint64_t v46 = [v25 length];
            v22 = v102;
            uint64_t v18 = v91;
            if (v46)
            {
              v34 = +[BCBatteryDevice batteryDeviceWithIdentifier:v105 vendor:v30 productIdentifier:v98 parts:v33 matchIdentifier:v103];
              [v34 setModelNumber:v104];
              [v34 setAccessoryCategory:v106];
              if (((uint64_t (**)(void, void *))v88)[2](v88, v34))
              {
                uint64_t v18 = v91;
                if (v34) {
                  goto LABEL_22;
                }
              }
              else
              {
                [v7 setObject:v34 forKey:v105];
                uint64_t v18 = v91;
                if (v34)
                {
LABEL_21:
                  [v8 addObject:v105];
                  goto LABEL_22;
                }
              }
            }
          }

          v17 = v110;
          uint64_t v19 = v89;
        }

        ++v20;
      }
      while (v18 != v20);
      uint64_t v59 = [obj countByEnumeratingWithState:&v126 objects:v135 count:16];
      uint64_t v18 = v59;
    }
    while (v59);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v107 = [v87 allValues];
  uint64_t v112 = [v107 countByEnumeratingWithState:&v122 objects:v134 count:16];
  if (v112)
  {
    uint64_t v109 = *(void *)v123;
    do
    {
      for (uint64_t j = 0; j != v112; ++j)
      {
        if (*(void *)v123 != v109) {
          objc_enumerationMutation(v107);
        }
        v61 = *(void **)(*((void *)&v122 + 1) + 8 * j);
        v62 = [MEMORY[0x263EFF980] array];
        if ((unint64_t)[v61 count] < 2)
        {
          v75 = [v61 lastObject];
          [v62 addObject:v75];
        }
        else
        {
          uint64_t v121 = 0;
          if ([(_BCPowerSourceController *)v17 _shouldCoalesceDevices:v61 minimumPercentCharge:&v121])
          {
            v63 = [v61 lastObject];
            v64 = [v63 matchIdentifier];
            v65 = [v7 objectForKey:v64];

            if (!v65)
            {
              v65 = [(_BCPowerSourceController *)v17 _deviceByCoalescingDevice:v61];
              v66 = [v65 identifier];
              [v7 setObject:v65 forKey:v66];
            }
            [v62 addObject:v65];
            [v65 setPercentCharge:v121];
            uint64_t v67 = -[_BCPowerSourceController _lowBatteryLevelForVendor:accessoryCategory:transportType:](v17, "_lowBatteryLevelForVendor:accessoryCategory:transportType:", [v65 vendor], objc_msgSend(v65, "accessoryCategory"), objc_msgSend(v65, "transportType"));
            [v65 setLowBattery:v121 <= v67];
            v68 = BCLogPowerSourceController;
            if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v137 = v17;
              __int16 v138 = 2114;
              CFIndex v139 = (CFIndex)v65;
              _os_log_impl(&dword_21C664000, v68, OS_LOG_TYPE_DEFAULT, "(%{public}@) Coalesced device: %{public}@", buf, 0x16u);
            }
            long long v119 = 0u;
            long long v120 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            id v69 = v61;
            uint64_t v70 = [v69 countByEnumeratingWithState:&v117 objects:v133 count:16];
            if (v70)
            {
              uint64_t v71 = v70;
              uint64_t v72 = *(void *)v118;
              do
              {
                for (uint64_t k = 0; k != v71; ++k)
                {
                  if (*(void *)v118 != v72) {
                    objc_enumerationMutation(v69);
                  }
                  v74 = [*(id *)(*((void *)&v117 + 1) + 8 * k) identifier];
                  [v7 removeObjectForKey:v74];
                }
                uint64_t v71 = [v69 countByEnumeratingWithState:&v117 objects:v133 count:16];
              }
              while (v71);
              v17 = v110;
            }
          }
          else
          {
            [v62 addObjectsFromArray:v61];
            v65 = [v61 lastObject];
            id v69 = [v65 identifier];
            [v7 removeObjectForKey:v69];
          }
        }
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id v76 = v62;
        uint64_t v77 = [v76 countByEnumeratingWithState:&v113 objects:v132 count:16];
        if (v77)
        {
          uint64_t v78 = v77;
          uint64_t v79 = *(void *)v114;
          do
          {
            for (uint64_t m = 0; m != v78; ++m)
            {
              if (*(void *)v114 != v79) {
                objc_enumerationMutation(v76);
              }
              v81 = *(void **)(*((void *)&v113 + 1) + 8 * m);
              v82 = [v81 identifier];
              [v7 setObject:v81 forKey:v82];

              v83 = [v81 identifier];
              [v8 addObject:v83];
            }
            uint64_t v78 = [v76 countByEnumeratingWithState:&v113 objects:v132 count:16];
          }
          while (v78);
        }
      }
      uint64_t v112 = [v107 countByEnumeratingWithState:&v122 objects:v134 count:16];
    }
    while (v112);
  }

  v84 = [v7 allValues];
  v85 = [v84 sortedArrayUsingComparator:&__block_literal_global];

  return v85;
}

- (int64_t)_vendorFromPowerSourceDescriptionVendorIdentifier:(id)a3 transportType:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if ((unint64_t)a4 < 2)
  {
    int64_t v7 = 1;
    goto LABEL_18;
  }
  if (!v5)
  {
LABEL_17:
    int64_t v7 = 0;
    goto LABEL_18;
  }
  uint64_t v8 = [v5 integerValue];
  if (a4 == 3)
  {
    int64_t v7 = 1;
    if (v8 > 1451)
    {
      if (v8 == 1452) {
        goto LABEL_18;
      }
      if (v8 != 10507) {
        goto LABEL_17;
      }
    }
    else
    {
      if (v8 == 76) {
        goto LABEL_18;
      }
      if (v8 != 204) {
        goto LABEL_17;
      }
    }
    int64_t v7 = 2;
    goto LABEL_18;
  }
  BOOL v10 = a4 == 4 && v8 == 1452;
  if (a4 == 2) {
    int64_t v7 = v8 == 1452;
  }
  else {
    int64_t v7 = v10;
  }
LABEL_18:

  return v7;
}

- (int64_t)_transportTypeFromPowerSourceTransportTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"Internal"])
  {
    int64_t v4 = 1;
  }
  else if (([v3 isEqual:@"Serial"] & 1) != 0 {
         || ([v3 isEqual:@"USB"] & 1) != 0
  }
         || ([v3 isEqual:@"AID"] & 1) != 0)
  {
    int64_t v4 = 2;
  }
  else if (([v3 isEqual:@"Bluetooth"] & 1) != 0 {
         || ([v3 isEqual:@"Bluetooth LE"] & 1) != 0)
  }
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqual:@"Inductive In-Band"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldConsiderDeviceWithPowerSourceDescription:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 objectForKey:@"Max Capacity"];
  [v4 floatValue];
  if (BSFloatIsZero())
  {
    char v5 = 0;
  }
  else
  {
    v6 = [v3 objectForKey:@"Power Source State"];
    char v7 = [v6 isEqual:@"Off Line"];

    char v5 = v7 ^ 1;
  }

  return v5;
}

- (int64_t)_powerSourceStateFromPowerSourceStateString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"Off Line"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqual:@"AC Power"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqual:@"Battery Power"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_partFromPowerSourcePartIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"Left"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqual:@"Right"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqual:@"Case"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_nameForVendor:(int64_t)a3 accessoryCategory:(unint64_t)a4 name:(id)a5 partName:(id)a6 isInternal:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (v7)
  {
    id v13 = [(_BCPowerSourceController *)self _nameForCurrentDevice];
  }
  else if ([v11 length])
  {
    id v13 = v12;
  }
  else
  {
    id v13 = (__CFString *)v10;
  }
  long long v14 = v13;
  if ([(__CFString *)v13 length]) {
    long long v15 = v14;
  }
  else {
    long long v15 = &stru_26CCDE918;
  }
  uint64_t v16 = v15;

  return v16;
}

- (id)_nameForCurrentDevice
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (int64_t)_lowBatteryLevelForVendor:(int64_t)a3 accessoryCategory:(unint64_t)a4 transportType:(int64_t)a5
{
  if (a5 == 1) {
    return [(_BCPowerSourceController *)self _lowBatteryLevelForCurrentDevice];
  }
  if (a3 == 1 && a4 - 5 <= 4) {
    return qword_21C66AEA0[a4 - 5];
  }
  return 20;
}

- (int64_t)_lowBatteryLevelForCurrentDevice
{
  return (int)MGGetSInt32Answer();
}

- (BOOL)_isLowPowerModeActive
{
  BOOL lowPowerModeActive = self->_lowPowerModeActive;
  if (!self->_queue
    && ![(_BCPowerSourceController *)self _registerForNotification:"com.apple.system.lowpowermode" token:&self->_lowPowerModeNotifyToken queue:0 handler:0])
  {
    [(_BCPowerSourceController *)self _updateLowPowerModeState];
    return self->_lowPowerModeActive;
  }
  return lowPowerModeActive;
}

- (BOOL)_isDevicePartOfPair:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 matchIdentifier];
  if ([v4 length]) {
    BOOL v5 = [v3 accessoryCategory] != 2 || objc_msgSend(v3, "parts") != 4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_identifierFromPowerSourceDescription:(id)a3
{
  id v5 = a3;
  v6 = [v5 objectForKey:@"Group Identifier"];
  if ([v6 length])
  {
    BOOL v7 = [v5 objectForKey:@"Part Identifier"];
    if ([v7 length])
    {
      uint64_t v8 = [v6 stringByAppendingFormat:@"-%@", v7];
    }
    else
    {
      uint64_t v8 = v6;
    }
  }
  else
  {
    id v9 = [v5 objectForKey:@"Power Source ID"];
    uint64_t v8 = [v9 stringValue];

    if ([v8 length]) {
      goto LABEL_8;
    }
    BOOL v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BCPowerSourceController.m", 195, @"Missing kIOPSPowerSourceIDKey in %@", v5 object file lineNumber description];
  }

LABEL_8:
  return v8;
}

- (int)_displayChargePercentForCurrentCapacity:(id)a3 andMaxCapacity:(id)a4 updateZeroValue:(BOOL)a5
{
  id v7 = a4;
  [a3 floatValue];
  float v9 = v8;
  [v7 floatValue];
  float v11 = v10;

  float v12 = fmax(fmin((float)(v9 / v11), 1.0), 0.0);
  int v13 = (int)fminf(roundf(v12 * 100.0), 100.0);
  if (v13 < 1 && a5) {
    return 1;
  }
  else {
    return v13;
  }
}

- (unint64_t)_accessoryCategoryFromPowerSourceAccessoryCategory:(id)a3 partType:(unint64_t)a4 transportType:(int64_t)a5 vendor:(int64_t)a6 productIdentifier:(int64_t)a7
{
  id v7 = a3;
  if ([v7 isEqual:@"Speaker"])
  {
    unint64_t v8 = 1;
  }
  else if (([v7 isEqual:@"Headphone"] & 1) != 0 {
         || ([v7 isEqual:@"Audio Battery Case"] & 1) != 0)
  }
  {
    unint64_t v8 = 2;
  }
  else if ([v7 isEqual:@"Watch"])
  {
    unint64_t v8 = 3;
  }
  else if ([v7 isEqual:@"Battery Case"])
  {
    unint64_t v8 = 4;
  }
  else if ([v7 isEqual:@"Keyboard"])
  {
    unint64_t v8 = 5;
  }
  else if ([v7 isEqual:@"Trackpad"])
  {
    unint64_t v8 = 6;
  }
  else if ([v7 isEqual:@"Pencil"])
  {
    unint64_t v8 = 7;
  }
  else if ([v7 isEqual:@"Game Controller"])
  {
    unint64_t v8 = 8;
  }
  else if ([v7 isEqual:@"Mouse"])
  {
    unint64_t v8 = 9;
  }
  else if ([v7 isEqual:@"HearingAid"])
  {
    unint64_t v8 = 10;
  }
  else
  {
    unint64_t v8 = [v7 isEqual:@"Speaker"];
  }

  return v8;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BCRegisterUserNotificationsLogging();
  }
}

- (_BCPowerSourceController)init
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)_BCPowerSourceController;
  v2 = [(_BCPowerSourceController *)&v5 init];
  if (v2)
  {
    id v3 = BCLogPowerSourceController;
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = v2;
      _os_log_impl(&dword_21C664000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) initializing new power source controller", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(_BCPowerSourceController *)self _endPowerSourceObserving];
  v3.receiver = self;
  v3.super_class = (Class)_BCPowerSourceController;
  [(_BCPowerSourceController *)&v3 dealloc];
}

- (void)addBatteryDeviceObserver:(id)a3 queue:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v23 = v7;
  id v8 = a4;
  float v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BCPowerSourceController.m", 138, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"BCPowerSourceController.m", 139, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  float v10 = self;
  objc_sync_enter(v10);
  observersToQueues = v10->_observersToQueues;
  if (!observersToQueues)
  {
    uint64_t v12 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    int v13 = v10->_observersToQueues;
    v10->_observersToQueues = (NSMapTable *)v12;

    observersToQueues = v10->_observersToQueues;
  }
  [(NSMapTable *)observersToQueues setObject:v9 forKey:v7];
  objc_sync_exit(v10);

  long long v14 = (void *)BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = v14;
    uint64_t v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138544130;
    v25 = v17;
    __int16 v26 = 2048;
    v27 = v10;
    __int16 v28 = 2112;
    v29 = v19;
    __int16 v30 = 2048;
    v31 = &v23;
    _os_log_impl(&dword_21C664000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@)<%p> Added observer: %@<%p>", buf, 0x2Au);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59___BCPowerSourceController_addBatteryDeviceObserver_queue___block_invoke;
  v22[3] = &unk_264413B30;
  v22[4] = v10;
  [(_BCPowerSourceController *)v10 _notifyObserver:v23 block:v22 queue:v9];
  [(_BCPowerSourceController *)v10 _beginPowerSourceObservingIfNecessary];
}

- (void)removeBatteryDeviceObserver:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v15 = v4;
  objc_super v5 = self;
  objc_sync_enter(v5);
  observersToQueues = v5->_observersToQueues;
  if (observersToQueues) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [(NSMapTable *)observersToQueues removeObjectForKey:v4];
    if (![(NSMapTable *)v5->_observersToQueues count])
    {
      id v8 = v5->_observersToQueues;
      v5->_observersToQueues = 0;

      [(_BCPowerSourceController *)v5 _endPowerSourceObserving];
    }
  }
  objc_sync_exit(v5);

  float v9 = (void *)BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    float v10 = v9;
    float v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    int v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138544130;
    v17 = v12;
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2048;
    id v23 = &v15;
    _os_log_impl(&dword_21C664000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@)<%p> Removed observer: %@<%p>", buf, 0x2Au);
  }
}

- (BOOL)_shouldCoalesceDevices:(id)a3 minimumPercentCharge:(int64_t *)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72___BCPowerSourceController__shouldCoalesceDevices_minimumPercentCharge___block_invoke;
  v10[3] = &unk_264413B58;
  id v6 = v5;
  id v11 = v6;
  uint64_t v12 = &v18;
  int v13 = &v14;
  [v6 enumerateObjectsUsingBlock:v10];
  int v7 = *((unsigned __int8 *)v15 + 24);
  if (a4 && *((unsigned char *)v15 + 24)) {
    *a4 = v19[3];
  }
  BOOL v8 = v7 != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)_deviceByCoalescingDevice:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 lastObject];
  id v5 = (void *)[v4 copy];
  id v6 = [MEMORY[0x263EFF980] array];
  int v7 = [v3 firstObject];
  uint64_t v8 = [v7 parts];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v21 = v4;
    char v12 = 0;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = [v15 identifier];
        [v6 addObject:v16];

        v12 |= v8 != [v15 parts];
        v8 |= [v15 parts];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);

    char v17 = [v6 componentsJoinedByString:@"-"];
    [v5 setIdentifier:v17];

    [v5 setParts:v8];
    id v4 = v21;
    if (v12)
    {
      uint64_t v18 = [v21 groupName];
      [v5 setName:v18];
    }
  }
  else
  {

    uint64_t v19 = [v6 componentsJoinedByString:@"-"];
    [v5 setIdentifier:v19];

    [v5 setParts:v8];
  }

  return v5;
}

- (int)_registerForNotification:(const char *)a3 token:(int *)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v10 = a5;
  id v11 = a6;
  char v12 = v11;
  if (*a4)
  {
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_ERROR)) {
      -[_BCPowerSourceController _registerForNotification:token:queue:handler:]();
    }
LABEL_4:
    uint32_t v13 = 0;
    goto LABEL_14;
  }
  if (v10 && v11)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __73___BCPowerSourceController__registerForNotification_token_queue_handler___block_invoke;
    handler[3] = &unk_264413BC8;
    handler[4] = self;
    uint64_t v18 = a3;
    id v17 = v11;
    uint32_t v13 = notify_register_dispatch(a3, a4, v10, handler);
  }
  else
  {
    uint32_t v13 = notify_register_check(a3, a4);
  }
  uint64_t v14 = BCLogPowerSourceController;
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2082;
    long long v22 = a3;
    _os_log_impl(&dword_21C664000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully registered for %{public}s notifications", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_ERROR)) {
    -[_BCPowerSourceController _registerForNotification:token:queue:handler:]();
  }
LABEL_14:

  return v13;
}

- (int)_registerForPowerSourceChangeNotification:(const char *)a3 token:(int *)a4 queue:(id)a5
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82___BCPowerSourceController__registerForPowerSourceChangeNotification_token_queue___block_invoke;
  v6[3] = &unk_264413BF0;
  void v6[4] = self;
  return [(_BCPowerSourceController *)self _registerForNotification:a3 token:a4 queue:a5 handler:v6];
}

- (void)_beginPowerSourceObservingIfNecessary
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_queue)
  {
    id v3 = BCLogPowerSourceController;
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v2;
      _os_log_impl(&dword_21C664000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Registering for power source change notifications", buf, 0xCu);
    }
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.BCBatteryDeviceController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    [(_BCPowerSourceController *)v2 _registerForPowerSourceChangeNotification:"com.apple.system.powersources.percent" token:&v2->_powerSourceBatteryChangeNotifyToken queue:v2->_queue];
    [(_BCPowerSourceController *)v2 _registerForPowerSourceChangeNotification:"com.apple.system.powersources.timeremaining" token:&v2->_powerSourceTimeRemainingNotifyToken queue:v2->_queue];
    [(_BCPowerSourceController *)v2 _registerForPowerSourceChangeNotification:"com.apple.system.accpowersources.source" token:&v2->_accPowerSourceNotifyToken queue:v2->_queue];
    [(_BCPowerSourceController *)v2 _registerForPowerSourceChangeNotification:"com.apple.system.accpowersources.timeremaining" token:&v2->_accPowerSourceTimeRemainingNotifyToken queue:v2->_queue];
    [(_BCPowerSourceController *)v2 _registerForPowerSourceChangeNotification:"com.apple.system.accpowersources.attach" token:&v2->_accAttachNotifyToken queue:v2->_queue];
    if (notify_is_valid_token(v2->_lowPowerModeNotifyToken)) {
      notify_cancel(v2->_lowPowerModeNotifyToken);
    }
    id v6 = v2->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65___BCPowerSourceController__beginPowerSourceObservingIfNecessary__block_invoke;
    v7[3] = &unk_264413BF0;
    v7[4] = v2;
    if (![(_BCPowerSourceController *)v2 _registerForNotification:"com.apple.system.lowpowermode" token:&v2->_lowPowerModeNotifyToken queue:v6 handler:v7])[(_BCPowerSourceController *)v2 _handleLowPowerModeChanged:v2->_lowPowerModeNotifyToken]; {
  }
    }
  objc_sync_exit(v2);
}

- (void)_endPowerSourceObserving
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_queue)
  {
    id v3 = BCLogPowerSourceController;
    BOOL v4 = os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      int v11 = 138543362;
      char v12 = v2;
      _os_log_impl(&dword_21C664000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Unregistering for power source change notifications", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v4, &v2->_powerSourceBatteryChangeNotifyToken);
    uint64_t v6 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v5, &v2->_powerSourceTimeRemainingNotifyToken);
    uint64_t v7 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v6, &v2->_accPowerSourceNotifyToken);
    uint64_t v8 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v7, &v2->_accPowerSourceTimeRemainingNotifyToken);
    uint64_t v9 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v8, &v2->_accAttachNotifyToken);
    __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v9, &v2->_lowPowerModeNotifyToken);
    queue = v2->_queue;
    v2->_queue = 0;
  }
  objc_sync_exit(v2);
}

- (void)_updateLowPowerModeState
{
  uint64_t state64 = 0;
  if (!notify_get_state(self->_lowPowerModeNotifyToken, &state64))
  {
    BOOL v3 = state64 != 0;
    BOOL v4 = self;
    objc_sync_enter(v4);
    if (v4->_lowPowerModeActive != v3) {
      v4->_BOOL lowPowerModeActive = v3;
    }
    objc_sync_exit(v4);
  }
}

- (void)_handleLowPowerModeChanged:(int)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [(_BCPowerSourceController *)self _isLowPowerModeActive];
  [(_BCPowerSourceController *)self _updateLowPowerModeState];
  int v5 = [(_BCPowerSourceController *)self _isLowPowerModeActive];
  if (v4 != v5)
  {
    int v6 = v5;
    uint64_t v7 = BCLogPowerSourceController;
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      uint64_t v9 = self;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl(&dword_21C664000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Low Power Mode changed: %d", (uint8_t *)&v8, 0x12u);
    }
    [(_BCPowerSourceController *)self _queryConnectedDevices];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersToQueues, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)connectedDevices
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C664000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to obtain power sources info", (uint8_t *)&v2, 0xCu);
}

- (void)_registerForNotification:token:queue:handler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C664000, v0, v1, "(%{public}@) Failed to register for %{public}s notifications");
}

- (void)_registerForNotification:token:queue:handler:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21C664000, v0, v1, "(%{public}@) Argument token not nil when registering for %{public}s notifications");
}

@end