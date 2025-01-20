@interface DNDSPairedDeviceStateMonitor
- (DNDAccountFeatureSupport)accountFeatureSupport;
- (DNDSPairedDevice)pairedDevice;
- (DNDSPairedDevice)previousPairedDevice;
- (DNDSPairedDeviceStateMonitor)initWithLocalIDSService:(id)a3 cloudIDSService:(id)a4;
- (DNDSPairedDeviceStateMonitorDelegate)delegate;
- (NSSet)cloudDevices;
- (NSString)sysdiagnoseDataIdentifier;
- (id)_getCurrentPairedDevice;
- (id)pairedDeviceForDeviceIdentifier:(id)a3;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (void)_beginMonitoringForChanges;
- (void)_endMonitoringForChanges;
- (void)_getCurrentPairedDevice;
- (void)_pairedDeviceStateChanged:(id)a3;
- (void)_queue_informDelegatesOfPairedStateChange;
- (void)_queue_updateCloudDevices;
- (void)_queue_updatePairedState;
- (void)dealloc;
- (void)resume;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setCloudDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPreviousPairedDevice:(id)a3;
@end

@implementation DNDSPairedDeviceStateMonitor

- (DNDSPairedDeviceStateMonitor)initWithLocalIDSService:(id)a3 cloudIDSService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DNDSPairedDeviceStateMonitor;
  id v9 = [(DNDSPairedDeviceStateMonitor *)&v18 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.donotdisturb.server.PairedDeviceStateMonitor", v10);
    v12 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v11;

    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v9 + 2));
    v14 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v13;

    objc_storeStrong((id *)v9 + 3, a3);
    objc_storeStrong((id *)v9 + 4, a4);
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] set];
    v16 = (void *)*((void *)v9 + 8);
    *((void *)v9 + 8) = v15;

    DNDSRegisterSysdiagnoseDataProvider(v9);
  }

  return (DNDSPairedDeviceStateMonitor *)v9;
}

- (void)dealloc
{
  [(DNDSPairedDeviceStateMonitor *)self _endMonitoringForChanges];
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSPairedDeviceStateMonitor;
  [(DNDSPairedDeviceStateMonitor *)&v3 dealloc];
}

- (void)resume
{
  coalescingTimer = self->_coalescingTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __38__DNDSPairedDeviceStateMonitor_resume__block_invoke;
  handler[3] = &unk_1E6973540;
  handler[4] = self;
  dispatch_source_set_event_handler(coalescingTimer, handler);
  dispatch_source_set_timer((dispatch_source_t)self->_coalescingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_resume((dispatch_object_t)self->_coalescingTimer);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__DNDSPairedDeviceStateMonitor_resume__block_invoke_2;
  v5[3] = &unk_1E6973540;
  v5[4] = self;
  dispatch_async(queue, v5);
}

uint64_t __38__DNDSPairedDeviceStateMonitor_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_informDelegatesOfPairedStateChange");
}

uint64_t __38__DNDSPairedDeviceStateMonitor_resume__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginMonitoringForChanges];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updatePairedState");
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_updateCloudDevices");
}

- (DNDAccountFeatureSupport)accountFeatureSupport
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSSet *)self->_cloudDevices count];
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = self->_cloudDevices;
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      uint64_t v8 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "supportsSilenceLists", (void)v14))
          {
            uint64_t v8 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
LABEL_14:
  }
  else
  {
    uint64_t v8 = 1;
  }
  pairedDevice = self->_pairedDevice;
  if (pairedDevice) {
    uint64_t v11 = [(DNDSPairedDevice *)pairedDevice supportsSilenceLists];
  }
  else {
    uint64_t v11 = 1;
  }
  v12 = [MEMORY[0x1E4F5F568] accountFeaturesWithCloud:v8 hasCloudDevices:v3 != 0 paired:v11 hasPairedDevices:pairedDevice != 0];
  return (DNDAccountFeatureSupport *)v12;
}

- (id)pairedDeviceForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DNDSPairedDeviceStateMonitor *)self cloudDevices];
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  v10 = [(DNDSPairedDeviceStateMonitor *)self pairedDevice];

  if (v10)
  {
    uint64_t v11 = [(DNDSPairedDeviceStateMonitor *)self pairedDevice];
    uint64_t v12 = [v9 arrayByAddingObject:v11];

    id v9 = (id)v12;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__DNDSPairedDeviceStateMonitor_pairedDeviceForDeviceIdentifier___block_invoke;
  v17[3] = &unk_1E69746F8;
  id v13 = v4;
  id v18 = v13;
  long long v14 = objc_msgSend(v9, "bs_firstObjectPassingTest:", v17);
  if (!v14)
  {
    long long v15 = DNDSLogPairedDeviceState;
    if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR)) {
      [(DNDSPairedDeviceStateMonitor *)(uint64_t)v13 pairedDeviceForDeviceIdentifier:v15];
    }
  }

  return v14;
}

uint64_t __64__DNDSPairedDeviceStateMonitor_pairedDeviceForDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = [a2 deviceIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_queue_updatePairedState
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSUInteger v3 = [(DNDSPairedDeviceStateMonitor *)self pairedDevice];
  uint64_t v4 = [(DNDSPairedDeviceStateMonitor *)self _getCurrentPairedDevice];
  uint64_t v5 = (void *)v4;
  if (v3 != (void *)v4 && (!v3 || !v4 || ([v3 isEqual:v4] & 1) == 0))
  {
    [(DNDSPairedDeviceStateMonitor *)self setPairedDevice:v5];
    uint64_t v7 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];

    if (!v7) {
      [(DNDSPairedDeviceStateMonitor *)self setPreviousPairedDevice:v3];
    }
    uint64_t v8 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];
    if ((void *)v8 == v5)
    {
    }
    else
    {
      id v9 = (void *)v8;
      v10 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];
      uint64_t v11 = v10;
      if (!v5 || !v10)
      {

LABEL_19:
        id v18 = (void *)DNDSLogPairedDeviceState;
        if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = NSNumber;
          v20 = v18;
          v21 = [v19 numberWithLongLong:2];
          int v23 = 138543874;
          v24 = v3;
          __int16 v25 = 2114;
          v26 = v5;
          __int16 v27 = 2112;
          v28 = v21;
          _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Paired device state changed: from=%{public}@, to=%{public}@; waiting to coalesce for %@s",
            (uint8_t *)&v23,
            0x20u);
        }
        coalescingTimer = self->_coalescingTimer;
        dispatch_time_t v16 = dispatch_walltime(0, 2000000000);
        long long v15 = coalescingTimer;
        uint64_t v17 = 1000000000;
LABEL_22:
        dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, v17);
        goto LABEL_23;
      }
      uint64_t v12 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];
      char v13 = [v12 isEqual:v5];

      if ((v13 & 1) == 0) {
        goto LABEL_19;
      }
    }
    long long v14 = DNDSLogPairedDeviceState;
    if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      v24 = v5;
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Paired device state returned to previously-paired device. Cancelling delegate callbacks. device=%{public}@", (uint8_t *)&v23, 0xCu);
    }
    [(DNDSPairedDeviceStateMonitor *)self setPreviousPairedDevice:0];
    long long v15 = self->_coalescingTimer;
    dispatch_time_t v16 = -1;
    uint64_t v17 = -1;
    goto LABEL_22;
  }
  uint64_t v6 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    v24 = v3;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Paired device did not change: current=%{public}@", (uint8_t *)&v23, 0xCu);
  }
LABEL_23:
}

- (void)_queue_informDelegatesOfPairedStateChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_suspend((dispatch_object_t)self->_coalescingTimer);
  NSUInteger v3 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];
  uint64_t v4 = [(DNDSPairedDeviceStateMonitor *)self pairedDevice];
  uint64_t v5 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];
  if ((void *)v5 == v4)
  {
  }
  else
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];
    uint64_t v8 = v7;
    if (!v7 || !v4)
    {

LABEL_10:
      uint64_t v12 = DNDSLogPairedDeviceState;
      if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        long long v15 = v3;
        __int16 v16 = 2114;
        uint64_t v17 = v4;
        _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Informing delegates of coalesced paired device state changed: from=%{public}@, to=%{public}@", (uint8_t *)&v14, 0x16u);
      }
      char v13 = [(DNDSPairedDeviceStateMonitor *)self delegate];
      [v13 pairedDeviceStateMonitor:self pairingChangedFromDevice:v3 toDevice:v4];

      goto LABEL_13;
    }
    id v9 = [(DNDSPairedDeviceStateMonitor *)self previousPairedDevice];
    char v10 = [v9 isEqual:v4];

    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v11 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    long long v15 = v4;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring paired device state; coalesced back to the original device: %{public}@",
      (uint8_t *)&v14,
      0xCu);
  }
LABEL_13:
  [(DNDSPairedDeviceStateMonitor *)self setPreviousPairedDevice:0];
  dispatch_resume((dispatch_object_t)self->_coalescingTimer);
}

- (id)_getCurrentPairedDevice
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F5F5C8] currentDevice];
  uint64_t v4 = [v3 deviceClass];

  if (v4 == 1)
  {
    uint64_t v5 = [MEMORY[0x1E4F79EF0] sharedInstance];
    [(IDSService *)self->_localService devices];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)[obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (!v6)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      v51 = 0;
      uint64_t v19 = 0;
      unsigned int v46 = 1;
      goto LABEL_31;
    }
    v47 = self;
    v49 = v5;
    uint64_t v7 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v58 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v9 isLocallyPaired] && objc_msgSend(v9, "isActive"))
        {
          uint64_t v5 = v49;
          uint64_t v21 = [v49 deviceForIDSDevice:v9];
          if (v21)
          {
            uint64_t v6 = (void *)v21;
            int v22 = [v9 isConnected];
            int v23 = DNDSLogPairedDeviceState;
            BOOL v24 = os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT);
            if (v22)
            {
              if (v24)
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v62 = v9;
                _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Found active paired device: %@", buf, 0xCu);
              }
              uint64_t v17 = objc_msgSend(v9, "_dnds_assertionSyncProtocolVersion");
              uint64_t v16 = objc_msgSend(v9, "_dnds_configurationSyncProtocolVersion");
              uint64_t v25 = [v9 productBuildVersion];
              uint64_t v26 = objc_msgSend(v9, "_dnds_isIOS14EraOS");
              v51 = (void *)v25;
              if (v26) {
                unsigned int v46 = 0;
              }
              else {
                unsigned int v46 = objc_msgSend(v9, "_dnds_supportsSilenceLists");
              }
              self = v47;
              uint64_t v19 = [v9 uniqueIDOverride];
              uint64_t v18 = objc_msgSend(v9, "_dnds_pairedDeviceClass");
              uint64_t v15 = v26;
              goto LABEL_31;
            }
            if (v24)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v62 = v9;
              _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring unconnected active paired device: %@", buf, 0xCu);
            }
            uint64_t v15 = 0;
            uint64_t v16 = 0;
            uint64_t v17 = 0;
            uint64_t v18 = 0;
            v51 = 0;
            uint64_t v19 = 0;
          }
          else
          {
            __int16 v27 = DNDSLogPairedDeviceState;
            if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR)) {
              [(DNDSPairedDeviceStateMonitor *)(uint64_t)v9 _getCurrentPairedDevice];
            }
            uint64_t v15 = 0;
            uint64_t v16 = 0;
            uint64_t v17 = 0;
            uint64_t v18 = 0;
            v51 = 0;
            uint64_t v19 = 0;
            uint64_t v6 = 0;
          }
          unsigned int v46 = 1;
          goto LABEL_31;
        }
        char v10 = (void *)DNDSLogPairedDeviceState;
        if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = v10;
          int v12 = [v9 isConnected];
          int v13 = [v9 isActive];
          int v14 = [v9 isCloudConnected];
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v62 = v12;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = v13;
          LOWORD(v63) = 1024;
          *(_DWORD *)((char *)&v63 + 2) = v14;
          HIWORD(v63) = 2114;
          *(void *)v64 = 0;
          _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring device: isConnected=%{BOOL}d, isActive=%{BOOL}d, isCloudConnected:%{BOOL}d, device=%{public}@", buf, 0x1Eu);
        }
      }
      uint64_t v6 = (void *)[obj countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    v51 = 0;
    uint64_t v19 = 0;
    unsigned int v46 = 1;
    uint64_t v5 = v49;
LABEL_31:

    v28 = [v6 valueForProperty:*MEMORY[0x1E4F79E10]];
    uint64_t v29 = [v6 valueForProperty:*MEMORY[0x1E4F79DC8]];
    v30 = [v6 valueForProperty:*MEMORY[0x1E4F79E08]];
    if (v18 && v17 && v16)
    {
      id v48 = v30;
      if (v28 && v29)
      {
        uint64_t v43 = v18;
        uint64_t v44 = v16;
        unint64_t v45 = v17;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v31 = [(IDSService *)self->_cloudService devices];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v32)
        {
          unsigned int v42 = v15;
          v50 = v5;
          uint64_t v33 = *(void *)v54;
          while (2)
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v54 != v33) {
                objc_enumerationMutation(v31);
              }
              v35 = [*(id *)(*((void *)&v53 + 1) + 8 * j) uniqueIDOverride];
              char v36 = [v35 isEqual:v19];

              if (v36)
              {
                uint64_t v32 = 1;
                goto LABEL_54;
              }
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v65 count:16];
            if (v32) {
              continue;
            }
            break;
          }
LABEL_54:
          uint64_t v5 = v50;
          v39 = v51;
          uint64_t v15 = v42;
        }
        else
        {
          v39 = v51;
        }

        v20 = [[DNDSPairedDevice alloc] initWithLocalDeviceIdentifier:v19 deviceClass:v43 assertionSyncProtocolVersion:v45 configurationSyncProtocolVersion:v44 iOS14EraOS:v15 supportsSilenceLists:v46 pairingIdentifier:v28 pairingDataStore:v29];
        [(DNDSPairedDevice *)v20 setDeviceName:v48];
        [(DNDSPairedDevice *)v20 setOsBuild:v39];
        if (v45 >= 9) {
          [(DNDSPairedDevice *)v20 setICloudEnabled:v32];
        }
      }
      else
      {
        v40 = DNDSLogPairedDeviceState;
        if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)v62 = v6;
          *(_WORD *)&v62[8] = 2114;
          v63 = v28;
          *(_WORD *)v64 = 2114;
          *(void *)&v64[2] = v29;
          _os_log_error_impl(&dword_1D3052000, v40, OS_LOG_TYPE_ERROR, "Pairing ID and data store of current watch was invalid; device=%{public}@, pairingID=%{public}@, pairingData"
            "Store=%{public}@",
            buf,
            0x20u);
        }
        v20 = 0;
        v39 = v51;
      }
      v30 = v48;
    }
    else if (v6)
    {
      v37 = v30;
      v38 = DNDSLogPairedDeviceState;
      v39 = v51;
      if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_ERROR)) {
        [(DNDSPairedDeviceStateMonitor *)(uint64_t)v6 _getCurrentPairedDevice];
      }
      v20 = 0;
      v30 = v37;
    }
    else
    {
      v20 = 0;
      v39 = v51;
    }
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (void)_beginMonitoringForChanges
{
  [(IDSService *)self->_localService addDelegate:self queue:self->_queue];
  [(IDSService *)self->_cloudService addDelegate:self queue:self->_queue];
  objc_initWeak(&location, self);
  NSUInteger v3 = (const char *)[(id)*MEMORY[0x1E4F79ED8] UTF8String];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__DNDSPairedDeviceStateMonitor__beginMonitoringForChanges__block_invoke;
  v5[3] = &unk_1E6974C50;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_pairedDeviceDidChangeNotificationToken, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__DNDSPairedDeviceStateMonitor__beginMonitoringForChanges__block_invoke(uint64_t a1)
{
  v2 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Paired watch updated, will check for pairing change", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updatePairedState");
}

- (void)_queue_updateCloudDevices
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D3052000, log, OS_LOG_TYPE_DEBUG, "No change in cloud devices.", v1, 2u);
}

- (void)_endMonitoringForChanges
{
  [(IDSService *)self->_localService removeDelegate:self];
  [(IDSService *)self->_cloudService removeDelegate:self];
  int pairedDeviceDidChangeNotificationToken = self->_pairedDeviceDidChangeNotificationToken;
  if (pairedDeviceDidChangeNotificationToken != -1)
  {
    notify_cancel(pairedDeviceDidChangeNotificationToken);
  }
}

- (void)_pairedDeviceStateChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__DNDSPairedDeviceStateMonitor__pairedDeviceStateChanged___block_invoke;
  block[3] = &unk_1E6973540;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__DNDSPairedDeviceStateMonitor__pairedDeviceStateChanged___block_invoke(uint64_t a1)
{
  v2 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_DEFAULT, "Paired device state updated, will check for pairing change", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updatePairedState");
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Nearby devices changed, devices=%{public}@", (uint8_t *)&v9, 0xCu);
  }
  if ([v6 isEqual:self->_localService]) {
    [(DNDSPairedDeviceStateMonitor *)self _queue_updatePairedState];
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DNDSLogPairedDeviceState;
  if (os_log_type_enabled((os_log_t)DNDSLogPairedDeviceState, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Devices changed, devices=%{public}@", (uint8_t *)&v9, 0xCu);
  }
  if ([v6 isEqual:self->_cloudService])
  {
    [(DNDSPairedDeviceStateMonitor *)self _queue_updateCloudDevices];
  }
  else if ([v6 isEqual:self->_localService])
  {
    [(DNDSPairedDeviceStateMonitor *)self _queue_updatePairedState];
  }
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.PairedDevice";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v46[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(DNDSPairedDeviceStateMonitor *)self pairedDevice];
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (v5)
  {
    v45[0] = @"identifier";
    id v7 = [v5 deviceIdentifier];
    v46[0] = v7;
    v45[1] = @"class";
    uint64_t v8 = DNDSStringFromPairedDeviceClass([v5 deviceClass]);
    v46[1] = v8;
    v45[2] = @"assertion-protocol-version";
    int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "assertionSyncProtocolVersion"));
    v46[2] = v9;
    v45[3] = @"config-protocol-version";
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "configurationSyncProtocolVersion"));
    v46[3] = v10;
    v45[4] = @"icloud-enabled";
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isICloudEnabled"));
    v46[4] = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:5];
    int v13 = (void *)[v12 mutableCopy];

    int v14 = [v5 deviceName];
    [v13 setObject:v14 forKeyedSubscript:@"name"];

    uint64_t v15 = [v5 osBuild];
    [v13 setObject:v15 forKeyedSubscript:@"build"];

    [v6 setObject:v13 forKeyedSubscript:@"paired-device"];
  }
  v35 = v5;
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v17 = [(DNDSPairedDeviceStateMonitor *)self cloudDevices];
  uint64_t v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [(DNDSPairedDeviceStateMonitor *)self cloudDevices];
  uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v37 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v39 != v37) {
          objc_enumerationMutation(obj);
        }
        int v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v42[0] = @"identifier";
        int v23 = [v22 deviceIdentifier];
        v43[0] = v23;
        v42[1] = @"class";
        BOOL v24 = DNDSStringFromPairedDeviceClass([v22 deviceClass]);
        v43[1] = v24;
        v42[2] = @"assertion-protocol-version";
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "assertionSyncProtocolVersion"));
        v43[2] = v25;
        v42[3] = @"config-protocol-version";
        uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "configurationSyncProtocolVersion"));
        v43[3] = v26;
        __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
        v28 = (void *)[v27 mutableCopy];

        uint64_t v29 = [v22 deviceName];
        [v28 setObject:v29 forKeyedSubscript:@"name"];

        v30 = [v22 osBuild];
        [v28 setObject:v30 forKeyedSubscript:@"build"];

        [v18 addObject:v28];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v20);
  }

  if ([v18 count])
  {
    v31 = (void *)[v18 copy];
    [v34 setObject:v31 forKeyedSubscript:@"cloud-devices"];
  }
  uint64_t v32 = (void *)[v34 copy];

  return v32;
}

- (DNDSPairedDevice)previousPairedDevice
{
  return (DNDSPairedDevice *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPreviousPairedDevice:(id)a3
{
}

- (DNDSPairedDevice)pairedDevice
{
  return (DNDSPairedDevice *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPairedDevice:(id)a3
{
}

- (NSSet)cloudDevices
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCloudDevices:(id)a3
{
}

- (DNDSPairedDeviceStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSPairedDeviceStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_previousPairedDevice, 0);
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_localService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
}

- (void)pairedDeviceForDeviceIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Unable to find device with ID %@. Devices: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_getCurrentPairedDevice
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Device not found in paired device registry: device=%{public}@", (uint8_t *)&v2, 0xCu);
}

@end