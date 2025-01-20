@interface CMContinuityCaptureProvider
+ (id)filterCapabilitiesByMinorVersion:(id)a3;
- (BOOL)activate;
- (BOOL)connectClient:(id)a3 error:(id *)a4;
- (BOOL)setProviderProperties:(id)a3 error:(id *)a4;
- (CMContinuityCaptureProvider)initWithQueue:(id)a3;
- (NSSet)availableProperties;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_captureDeviceForEntity:(int64_t)a3 deviceUID:(id)a4;
- (id)_debugInfo;
- (id)debugInfo;
- (id)providerPropertiesForProperties:(id)a3 error:(id *)a4;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_reset:(id)a3;
- (void)_terminateCompleteForDevice:(id)a3;
- (void)cancel;
- (void)createCompositeDeviceWithTransportDevice:(id)a3;
- (void)debugInfo:(id)a3;
- (void)disconnectClient:(id)a3;
- (void)logDevicePublishSummary:(id)a3 publishTime:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postEventOnAllDevices:(id)a3 data:(id)a4;
- (void)registerStreamIntentForDevice:(id)a3 forTransportType:(int64_t)a4 completion:(id)a5;
- (void)reset:(id)a3;
- (void)resetTransportDevice:(id)a3 forIdentifier:(id)a4;
- (void)terminateAllDevices;
- (void)terminateCompleteForDevice:(id)a3;
- (void)terminateCompositeDeviceWithIdentifier:(id)a3;
- (void)terminateDevicesIfApplicable:(id)a3;
- (void)unregisterStreamIntentForDevice:(id)a3;
- (void)updateState;
@end

@implementation CMContinuityCaptureProvider

- (CMContinuityCaptureProvider)initWithQueue:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CMContinuityCaptureProvider;
  v6 = [(CMIOExtensionProvider *)&v21 initWithSource:self clientQueue:v5];
  v7 = v6;
  if (v6 && (p_queue = &v6->_queue, objc_storeStrong((id *)&v6->_queue, a3), *p_queue))
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    observedDevices = v7->_observedDevices;
    v7->_observedDevices = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    availableCaptureDevicesByIdentifiers = v7->_availableCaptureDevicesByIdentifiers;
    v7->_availableCaptureDevicesByIdentifiers = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    devicePublishLogs = v7->_devicePublishLogs;
    v7->_devicePublishLogs = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    pendingTerminateDeviceIdentifiers = v7->_pendingTerminateDeviceIdentifiers;
    v7->_pendingTerminateDeviceIdentifiers = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    registeredStreamDevicesOnWifi = v7->_registeredStreamDevicesOnWifi;
    v7->_registeredStreamDevicesOnWifi = v17;

    v19 = v7;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)filterCapabilitiesByMinorVersion:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v37 = [MEMORY[0x263EFF980] array];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v34 = v3;
  obuint64_t j = [v3 devicesCapabilities];
  uint64_t v38 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
  if (!v38) {
    goto LABEL_50;
  }
  uint64_t v36 = *(void *)v82;
  do
  {
    for (uint64_t i = 0; i != v38; ++i)
    {
      if (*(void *)v82 != v36) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(void **)(*((void *)&v81 + 1) + 8 * i);
      v6 = [MEMORY[0x263EFF980] array];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      v7 = [v5 streamFormats];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v77 objects:v87 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v78;
        do
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v78 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v77 + 1) + 8 * j);
            if (!v12)
            {
              uint64_t v74 = 0;
              uint64_t v75 = 0;
              uint64_t v76 = 0;
              uint64_t v71 = 0;
              uint64_t v72 = 0;
              uint64_t v70 = 0;
LABEL_17:
              [v6 addObject:v12];
              continue;
            }
            [*(id *)(*((void *)&v77 + 1) + 8 * j) minimumSupportedVersion];
            if (v74 == 3)
            {
              [v12 minimumSupportedVersion];
              if (v73 <= 303) {
                goto LABEL_17;
              }
            }
            [v12 minimumSupportedVersion];
            if (v70 <= 2) {
              goto LABEL_17;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v77 objects:v87 count:16];
        }
        while (v9);
      }

      v39 = [MEMORY[0x263EFF980] array];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v13 = [v5 manualFramingSupportedStreamFormats];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v66 objects:v86 count:16];
      if (!v14) {
        goto LABEL_34;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v67;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v67 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v66 + 1) + 8 * k);
          if (!v18)
          {
            uint64_t v63 = 0;
            uint64_t v64 = 0;
            uint64_t v65 = 0;
            uint64_t v60 = 0;
            uint64_t v61 = 0;
            uint64_t v59 = 0;
LABEL_31:
            [v6 addObject:v18];
            continue;
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * k) minimumSupportedVersion];
          if (v63 == 3)
          {
            [v18 minimumSupportedVersion];
            if (v62 <= 303) {
              goto LABEL_31;
            }
          }
          [v18 minimumSupportedVersion];
          if (v59 <= 2) {
            goto LABEL_31;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v66 objects:v86 count:16];
      }
      while (v15);
LABEL_34:

      v19 = [MEMORY[0x263EFF980] array];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v20 = [v5 controls];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v85 count:16];
      if (!v21) {
        goto LABEL_48;
      }
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v56;
      while (2)
      {
        uint64_t v24 = 0;
        while (2)
        {
          if (*(void *)v56 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v55 + 1) + 8 * v24);
          if (!v25)
          {
            uint64_t v52 = 0;
            uint64_t v53 = 0;
            uint64_t v54 = 0;
            uint64_t v49 = 0;
            uint64_t v50 = 0;
            uint64_t v48 = 0;
LABEL_45:
            [v19 addObject:v25];
            goto LABEL_46;
          }
          [*(id *)(*((void *)&v55 + 1) + 8 * v24) minimumSupportedVersion];
          if (v52 == 3)
          {
            [v25 minimumSupportedVersion];
            if (v51 <= 303) {
              goto LABEL_45;
            }
          }
          [v25 minimumSupportedVersion];
          if (v48 <= 2) {
            goto LABEL_45;
          }
LABEL_46:
          if (v22 != ++v24) {
            continue;
          }
          break;
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v85 count:16];
        if (v22) {
          continue;
        }
        break;
      }
LABEL_48:

      v26 = -[CMContinuityCaptureDeviceCapabilities initWithEntityType:streamFormats:manualFramingSupportedStreamFormats:controls:]([CMContinuityCaptureDeviceCapabilities alloc], "initWithEntityType:streamFormats:manualFramingSupportedStreamFormats:controls:", [v5 entityType], v6, v39, v19);
      [v37 addObject:v26];
    }
    uint64_t v38 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
  }
  while (v38);
LABEL_50:

  if (v34)
  {
    [v34 capabilitiesVersion];
    uint64_t v27 = v45;
    [v34 capabilitiesVersion];
    uint64_t v28 = v43;
    [v34 capabilitiesVersion];
    uint64_t v29 = v41;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v28 = 0;
    uint64_t v27 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    v40[3] = 0;
    v40[4] = 0;
  }
  if (v28 >= 303) {
    uint64_t v28 = 303;
  }
  if (v27 >= 3) {
    uint64_t v30 = 3;
  }
  else {
    uint64_t v30 = v27;
  }
  if (v29 >= 1) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = v29;
  }
  v40[0] = v30;
  v40[1] = v28;
  v40[2] = v31;
  v32 = -[CMContinuityCaptureCapabilities initWithCapabilitiesVersion:devicesCapabilities:userDisabled:]([CMContinuityCaptureCapabilities alloc], "initWithCapabilitiesVersion:devicesCapabilities:userDisabled:", v40, v37, [v34 userDisabled]);

  return v32;
}

- (void)logDevicePublishSummary:(id)a3 publishTime:(id)a4
{
  v13[3] = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  if ((unint64_t)[(NSMutableArray *)self->_devicePublishLogs count] >= 0xB) {
    [(NSMutableArray *)self->_devicePublishLogs removeObjectAtIndex:0];
  }
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = &stru_26E95AB60;
  }
  v12[0] = @"DeviceIdentifier";
  v12[1] = @"DevicePublishTime";
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = &stru_26E95AB60;
  }
  v13[0] = v8;
  v13[1] = v9;
  v12[2] = @"DeviceTerminateTime";
  uint64_t v10 = CMContinuityCaptureGetCurrentTimeString();
  v13[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  [(NSMutableArray *)self->_devicePublishLogs addObject:v11];
}

- (void)terminateAllDevices
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    availableCaptureDevicesByIdentifiers = self->_availableCaptureDevicesByIdentifiers;
    *(_DWORD *)buf = 138412802;
    v20 = self;
    __int16 v21 = 2082;
    uint64_t v22 = "-[CMContinuityCaptureProvider terminateAllDevices]";
    __int16 v23 = 2114;
    uint64_t v24 = availableCaptureDevicesByIdentifiers;
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %{public}s %{public}@ ", buf, 0x20u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v7 = 138412546;
    long long v13 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(const char **)(*((void *)&v14 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_pendingTerminateDeviceIdentifiers, "containsObject:", v11, v13))
        {
          v12 = CMContinuityCaptureLog(1);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v20 = self;
            __int16 v21 = 2114;
            uint64_t v22 = v11;
            _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination", buf, 0x16u);
          }
        }
        else
        {
          [(CMContinuityCaptureProvider *)self terminateCompositeDeviceWithIdentifier:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)postEventOnAllDevices:(id)a3 data:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers allValues];
  uint64_t v9 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    __int16 v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ Post %@ on devices %{public}@ data %{public}@", buf, 0x2Au);
  }

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "postEvent:entity:data:", v6, 0, v7, (void)v15);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v10 = CMContinuityCaptureLog(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[CMContinuityCaptureProvider postEventOnAllDevices:data:]((uint64_t)self, v10);
    }
  }
}

- (void)terminateCompleteForDevice:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CMContinuityCaptureProvider_terminateCompleteForDevice___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__CMContinuityCaptureProvider_terminateCompleteForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _terminateCompleteForDevice:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_terminateCompleteForDevice:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 client];
  id v6 = [v5 device];
  id v7 = [v6 deviceIdentifier];
  id v8 = [v7 UUIDString];

  id v9 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v28 = self;
  uint64_t v10 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers objectForKey:v8];

  if (v10)
  {
    uint64_t v11 = CMContinuityCaptureLog(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = self;
      __int16 v36 = 2114;
      id v37 = v4;
      _os_log_impl(&dword_235FC2000, v11, OS_LOG_TYPE_DEFAULT, "%@ Terminate %{public}@ ", buf, 0x16u);
    }

    availableCaptureDevicesByIdentifiers = self->_availableCaptureDevicesByIdentifiers;
    uint64_t v13 = [v4 client];
    long long v14 = [v13 device];
    long long v15 = [v14 deviceIdentifier];
    long long v16 = [v15 UUIDString];
    [(NSMutableDictionary *)availableCaptureDevicesByIdentifiers removeObjectForKey:v16];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v17 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers allKeys];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          if (([v8 isEqualToString:v22] & 1) == 0)
          {
            id v23 = [v4 client];
            [v23 device];
            v25 = id v24 = v4;
            int v26 = [v25 hasStreamIntent];

            id v4 = v24;
            if (v26)
            {
              id v27 = [(NSMutableDictionary *)v28->_availableCaptureDevicesByIdentifiers objectForKeyedSubscript:v22];
              [v27 postEvent:@"kCMContinuityCaptureEventStreamEnableForMultipleStreamExit" entity:0 data:0];
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    [(CMContinuityCaptureProvider *)v28 _reset:v4];
  }
}

- (void)createCompositeDeviceWithTransportDevice:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 deviceIdentifier];
    id v8 = [v7 UUIDString];
    *(_DWORD *)buf = 138412802;
    uint64_t v53 = self;
    __int16 v54 = 2080;
    long long v55 = "-[CMContinuityCaptureProvider createCompositeDeviceWithTransportDevice:]";
    __int16 v56 = 2114;
    long long v57 = v8;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@", buf, 0x20u);
  }
  id v9 = [[CMContinuityCaptureCompositeDevice alloc] initWithDevice:v4 provider:self];
  if (v9)
  {
    availableCaptureDevicesByIdentifiers = self->_availableCaptureDevicesByIdentifiers;
    uint64_t v11 = [v4 deviceIdentifier];
    uint64_t v12 = [v11 UUIDString];
    [(NSMutableDictionary *)availableCaptureDevicesByIdentifiers setObject:v9 forKeyedSubscript:v12];

    uint64_t v13 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    uint64_t v14 = [v13 activeSession];
    if (v14)
    {
      long long v15 = (void *)v14;
      long long v16 = +[CMContinuityCaptureSessionStateManager sharedInstance];
      long long v17 = [v16 activeSession];
      uint64_t v18 = [v17 device];
      if ([v18 hasStreamIntent])
      {
        uint64_t v44 = +[CMContinuityCaptureSessionStateManager sharedInstance];
        uint64_t v43 = [v44 activeSession];
        v40 = [v43 device];
        [v40 deviceIdentifier];
        uint64_t v45 = self;
        v20 = uint64_t v19 = v4;
        __int16 v21 = [v20 UUIDString];
        uint64_t v22 = [v19 deviceIdentifier];
        [v22 UUIDString];
        id v23 = v41 = v16;
        char v42 = [v21 isEqualToString:v23];

        id v4 = v19;
        self = v45;

        if ((v42 & 1) == 0) {
          [(CMContinuityCaptureCompositeDevice *)v9 postEvent:@"kCMContinuityCaptureEventStreamDisableForMultipleStream" entity:0 data:0];
        }
        goto LABEL_10;
      }
    }
LABEL_10:
    id v24 = [(CMContinuityCaptureCompositeDevice *)v9 client];
    uint64_t v25 = [v24 device];
    int v26 = [v25 magicStateMonitor];
    id v27 = [v26 queue];
    dispatch_assert_queue_not_V2(v27);

    uint64_t v28 = [(CMContinuityCaptureCompositeDevice *)v9 client];
    long long v29 = [v28 device];
    long long v30 = [v29 magicStateMonitor];
    long long v31 = [v30 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke;
    block[3] = &unk_264C99080;
    long long v32 = v9;
    uint64_t v50 = v32;
    uint64_t v51 = self;
    dispatch_async_and_wait(v31, block);

    v33 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    v34 = [v33 queue];
    dispatch_assert_queue_not_V2(v34);

    v35 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    __int16 v36 = [v35 queue];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke_2;
    v46[3] = &unk_264C99080;
    uint64_t v47 = v32;
    uint64_t v48 = self;
    dispatch_async_and_wait(v36, v46);

    [(NSMutableSet *)self->_observedDevices addObject:v4];
    goto LABEL_11;
  }
  id v37 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = [v4 deviceIdentifier];
    v39 = [v38 UUIDString];
    *(_DWORD *)buf = 138412546;
    uint64_t v53 = self;
    __int16 v54 = 2114;
    long long v55 = v39;
    _os_log_impl(&dword_235FC2000, v37, OS_LOG_TYPE_DEFAULT, "%@ Failed to create capture device for identifier %{public}@", buf, 0x16u);
  }
LABEL_11:
}

void __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) client];
  v2 = [v4 device];
  id v3 = [v2 magicStateMonitor];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"magic" options:3 context:0];
}

void __72__CMContinuityCaptureProvider_createCompositeDeviceWithTransportDevice___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client];
  v2 = [v3 device];
  [v2 addObserver:*(void *)(a1 + 40) forKeyPath:@"wired" options:3 context:0];
}

- (void)terminateCompositeDeviceWithIdentifier:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = self;
    __int16 v42 = 2080;
    uint64_t v43 = "-[CMContinuityCaptureProvider terminateCompositeDeviceWithIdentifier:]";
    __int16 v44 = 2114;
    id v45 = v4;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@", buf, 0x20u);
  }

  id v7 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers objectForKey:v4];

  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers objectForKeyedSubscript:v4];
    id v9 = [v8 publishTime];
    if (v9)
    {
      uint64_t v10 = [v8 publishTime];
      [(CMContinuityCaptureProvider *)self logDevicePublishSummary:v4 publishTime:v10];
    }
    else
    {
      [(CMContinuityCaptureProvider *)self logDevicePublishSummary:v4 publishTime:&stru_26E95AB60];
    }

    [(NSMutableSet *)self->_pendingTerminateDeviceIdentifiers addObject:v4];
    [(CMContinuityCaptureProvider *)self unregisterStreamIntentForDevice:v8];
    observedDevices = self->_observedDevices;
    uint64_t v12 = [v8 client];
    uint64_t v13 = [v12 device];
    LODWORD(observedDevices) = [(NSMutableSet *)observedDevices containsObject:v13];

    if (observedDevices)
    {
      uint64_t v14 = [v8 client];
      long long v15 = [v14 device];
      long long v16 = [v15 magicStateMonitor];
      long long v17 = [v16 queue];
      dispatch_assert_queue_not_V2(v17);

      uint64_t v18 = [v8 client];
      uint64_t v19 = [v18 device];
      uint64_t v20 = [v19 magicStateMonitor];
      __int16 v21 = [v20 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke;
      block[3] = &unk_264C99080;
      id v22 = v8;
      id v38 = v22;
      v39 = self;
      dispatch_async_and_wait(v21, block);

      id v23 = +[CMContinuityCaptureDiscoverySession sharedInstance];
      id v24 = [v23 queue];
      dispatch_assert_queue_not_V2(v24);

      uint64_t v25 = +[CMContinuityCaptureDiscoverySession sharedInstance];
      int v26 = [v25 queue];
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      v33 = __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke_2;
      v34 = &unk_264C99080;
      id v27 = v22;
      id v35 = v27;
      __int16 v36 = self;
      dispatch_async_and_wait(v26, &v31);

      uint64_t v28 = self->_observedDevices;
      long long v29 = objc_msgSend(v27, "client", v31, v32, v33, v34);
      long long v30 = [v29 device];
      [(NSMutableSet *)v28 removeObject:v30];
    }
    [v8 postEvent:@"kCMContinuityCaptureEventTerminate" entity:0 data:0];
  }
}

void __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) client];
  v2 = [v4 device];
  id v3 = [v2 magicStateMonitor];
  [v3 removeObserver:*(void *)(a1 + 40) forKeyPath:@"magic" context:0];
}

void __70__CMContinuityCaptureProvider_terminateCompositeDeviceWithIdentifier___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client];
  v2 = [v3 device];
  [v2 removeObserver:*(void *)(a1 + 40) forKeyPath:@"wired" context:0];
}

- (void)reset:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(CMContinuityCaptureProvider *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CMContinuityCaptureProvider_reset___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__CMContinuityCaptureProvider_reset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _reset:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_reset:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 client];
  id v6 = [v5 device];
  id v7 = [v6 deviceIdentifier];
  id v8 = [v7 UUIDString];

  id v9 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v9);

  if ([(NSMutableSet *)self->_pendingTerminateDeviceIdentifiers containsObject:v8])
  {
    uint64_t v10 = CMContinuityCaptureLog(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ Reset %{public}@", (uint8_t *)&v11, 0x16u);
    }

    [(NSMutableSet *)self->_pendingTerminateDeviceIdentifiers removeObject:v8];
    [(CMContinuityCaptureProvider *)self updateState];
  }
}

- (void)resetTransportDevice:(id)a3 forIdentifier:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([(NSMutableSet *)self->_pendingTerminateDeviceIdentifiers containsObject:v7])
  {
    id v9 = CMContinuityCaptureLog(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v68 = self;
      __int16 v69 = 2114;
      uint64_t v70 = v7;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination", buf, 0x16u);
    }
  }
  else
  {
    id v9 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers objectForKeyedSubscript:v7];
    uint64_t v10 = [v9 client];
    int v11 = [v10 device];
    char v12 = [v11 isEqual:v6];

    if ((v12 & 1) == 0)
    {
      __int16 v13 = CMContinuityCaptureLog(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v9 client];
        uint64_t v15 = [v14 device];
        *(_DWORD *)buf = 138413058;
        long long v68 = self;
        __int16 v69 = 2080;
        uint64_t v70 = "-[CMContinuityCaptureProvider resetTransportDevice:forIdentifier:]";
        __int16 v71 = 2112;
        uint64_t v72 = v15;
        __int16 v73 = 2112;
        id v74 = v6;
        _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ %s (%@) -> (%@)", buf, 0x2Au);
      }
      observedDevices = self->_observedDevices;
      long long v17 = [v9 client];
      uint64_t v18 = [v17 device];
      LODWORD(observedDevices) = [(NSMutableSet *)observedDevices containsObject:v18];

      uint64_t v19 = &off_236059000;
      unint64_t v20 = 0x264C98000;
      if (observedDevices)
      {
        __int16 v21 = [v9 client];
        id v22 = [v21 device];
        id v23 = [v22 magicStateMonitor];
        id v24 = [v23 queue];
        dispatch_assert_queue_not_V2(v24);

        uint64_t v25 = [v9 client];
        int v26 = [v25 device];
        id v27 = [v26 magicStateMonitor];
        uint64_t v28 = [v27 queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke;
        block[3] = &unk_264C99080;
        long long v29 = v9;
        uint64_t v65 = v29;
        long long v66 = self;
        dispatch_async_and_wait(v28, block);

        uint64_t v19 = &off_236059000;
        long long v30 = +[CMContinuityCaptureDiscoverySession sharedInstance];
        uint64_t v31 = [v30 queue];
        dispatch_assert_queue_not_V2(v31);

        uint64_t v32 = +[CMContinuityCaptureDiscoverySession sharedInstance];
        v33 = [v32 queue];
        v61[0] = MEMORY[0x263EF8330];
        v61[1] = 3221225472;
        v61[2] = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_2;
        v61[3] = &unk_264C99080;
        v34 = v29;
        uint64_t v62 = v34;
        uint64_t v63 = self;
        dispatch_async_and_wait(v33, v61);

        id v35 = self->_observedDevices;
        __int16 v36 = [v34 client];
        id v37 = [v36 device];
        [(NSMutableSet *)v35 removeObject:v37];

        unint64_t v20 = 0x264C98000uLL;
      }
      id v38 = [*(id *)(v20 + 2944) sharedInstance];
      v39 = [v38 queue];
      dispatch_assert_queue_not_V2(v39);

      v40 = [*(id *)(v20 + 2944) sharedInstance];
      uint64_t v41 = [v40 queue];
      uint64_t v55 = MEMORY[0x263EF8330];
      uint64_t v56 = *((void *)v19 + 114);
      uint64_t v42 = v56;
      long long v57 = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_3;
      uint64_t v58 = &unk_264C99080;
      id v43 = v6;
      id v59 = v43;
      uint64_t v60 = self;
      dispatch_async_and_wait(v41, &v55);

      __int16 v44 = [v43 magicStateMonitor];
      id v45 = [v44 queue];
      dispatch_assert_queue_not_V2(v45);

      uint64_t v46 = [v43 magicStateMonitor];
      uint64_t v47 = [v46 queue];
      uint64_t v49 = MEMORY[0x263EF8330];
      uint64_t v50 = v42;
      uint64_t v51 = __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_4;
      uint64_t v52 = &unk_264C99080;
      id v48 = v43;
      id v53 = v48;
      __int16 v54 = self;
      dispatch_async_and_wait(v47, &v49);

      -[NSMutableSet addObject:](self->_observedDevices, "addObject:", v48, v49, v50, v51, v52);
    }
    [v9 resetTransportDevice:v6];
  }
}

void __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) client];
  v2 = [v4 device];
  id v3 = [v2 magicStateMonitor];
  [v3 removeObserver:*(void *)(a1 + 40) forKeyPath:@"magic" context:0];
}

void __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client];
  v2 = [v3 device];
  [v2 removeObserver:*(void *)(a1 + 40) forKeyPath:@"wired" context:0];
}

uint64_t __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40) forKeyPath:@"wired" options:3 context:0];
}

void __66__CMContinuityCaptureProvider_resetTransportDevice_forIdentifier___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) magicStateMonitor];
  [v2 addObserver:*(void *)(a1 + 40) forKeyPath:@"magic" options:3 context:0];
}

- (void)updateState
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v5 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers allKeys];
  uint64_t v28 = (void *)[v4 initWithArray:v5];

  id v6 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  id v7 = [v6 availableClientDevices];

  id v8 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = self;
    __int16 v35 = 2114;
    __int16 v36 = v7;
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ CurrentDevices : %{public}@", buf, 0x16u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v30;
    *(void *)&long long v11 = 138412546;
    long long v27 = v11;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        long long v16 = objc_msgSend(v15, "deviceIdentifier", v27);
        long long v17 = [v16 UUIDString];

        if ([v15 userDisconnected])
        {
          uint64_t v18 = CMContinuityCaptureLog(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v15 deviceIdentifier];
            int v20 = [v15 wired];
            *(_DWORD *)buf = 138412802;
            v34 = self;
            __int16 v35 = 2114;
            __int16 v36 = v19;
            __int16 v37 = 1024;
            LODWORD(v38) = v20;
            _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%@ Ignore Device %{public}@ in User Disconnect Mode (wired:%d)", buf, 0x1Cu);
          }
LABEL_20:

          goto LABEL_21;
        }
        __int16 v21 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers objectForKey:v17];

        if (!v21)
        {
          id v23 = [v15 capabilities];
          uint64_t v18 = +[CMContinuityCaptureProvider filterCapabilitiesByMinorVersion:v23];

          id v24 = CMContinuityCaptureLog(1);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v34 = self;
            __int16 v35 = 2114;
            __int16 v36 = v17;
            __int16 v37 = 2114;
            id v38 = v18;
            _os_log_impl(&dword_235FC2000, v24, OS_LOG_TYPE_DEFAULT, "%@ New Device (%{public}@) : %{public}@", buf, 0x20u);
          }

          [(CMContinuityCaptureProvider *)self createCompositeDeviceWithTransportDevice:v15];
          goto LABEL_20;
        }
        id v22 = CMContinuityCaptureLog(1);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v27;
          v34 = self;
          __int16 v35 = 2114;
          __int16 v36 = v17;
          _os_log_impl(&dword_235FC2000, v22, OS_LOG_TYPE_DEFAULT, "%@ Device (%{public}@) present", buf, 0x16u);
        }

        [v28 removeObject:v17];
        if ([(NSMutableSet *)self->_pendingTerminateDeviceIdentifiers containsObject:v17])
        {
          uint64_t v18 = CMContinuityCaptureLog(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v27;
            v34 = self;
            __int16 v35 = 2114;
            __int16 v36 = v17;
            _os_log_impl(&dword_235FC2000, v18, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination, skip reset", buf, 0x16u);
          }
          goto LABEL_20;
        }
        [(CMContinuityCaptureProvider *)self resetTransportDevice:v15 forIdentifier:v17];
LABEL_21:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v25 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
      uint64_t v12 = v25;
    }
    while (v25);
  }

  int v26 = [v28 allObjects];
  [(CMContinuityCaptureProvider *)self terminateDevicesIfApplicable:v26];
}

- (void)terminateDevicesIfApplicable:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v7 = 138412546;
    long long v13 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_pendingTerminateDeviceIdentifiers, "containsObject:", v11, v13, (void)v14))
        {
          uint64_t v12 = CMContinuityCaptureLog(1);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = self;
            __int16 v20 = 2114;
            uint64_t v21 = v11;
            _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEFAULT, "%@ Device %{public}@ has pending termination", buf, 0x16u);
          }
        }
        else
        {
          [(CMContinuityCaptureProvider *)self terminateCompositeDeviceWithIdentifier:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v8);
  }
}

- (BOOL)activate
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  long long v7 = __39__CMContinuityCaptureProvider_activate__block_invoke;
  uint64_t v8 = &unk_264C990F8;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, &v5);
  objc_msgSend(MEMORY[0x263F016E8], "startServiceWithProvider:", self, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return 1;
}

void __39__CMContinuityCaptureProvider_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[CMContinuityCaptureUserOnboarding sharedInstance];
    id v2 = +[CMContinuityCaptureDiscoverySession sharedInstance];
    id v3 = WeakRetained;
    atomic_store(1u, WeakRetained + 224);
    [v2 addObserver:v3 forKeyPath:@"availableClientDevices" options:3 context:0];
    [v1 addObserver:WeakRetained forKeyPath:@"state" options:3 context:0];
  }
}

- (void)cancel
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v41 = self;
    __int16 v42 = 2082;
    id v43 = "-[CMContinuityCaptureProvider cancel]";
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %{public}s", buf, 0x16u);
  }

  id v4 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v4);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v11 = [v10 continuityCaptureDevices];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v30;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v29 + 1) + 8 * v15++) invalidate];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v16 = [(CMIOExtensionProvider *)self devices];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        [(CMIOExtensionProvider *)self removeDevice:*(void *)(*((void *)&v25 + 1) + 8 * v20++) error:0];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v18);
  }

  [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers removeAllObjects];
  uint64_t v21 = +[CMContinuityCaptureUserOnboarding sharedInstance];
  id v22 = +[CMContinuityCaptureDiscoverySession sharedInstance];
  uint64_t v23 = v22;
  unsigned __int8 v24 = atomic_load((unsigned __int8 *)&self->_observingStateKVOs);
  if (v24)
  {
    [v22 removeObserver:self forKeyPath:@"availableClientDevices" context:0];
    [v21 removeObserver:self forKeyPath:@"state" context:0];
    atomic_store(0, (unsigned __int8 *)&self->_observingStateKVOs);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__CMContinuityCaptureProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_264C99238;
  objc_copyWeak(v21, &location);
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21[1] = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __78__CMContinuityCaptureProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _observeValueForKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) change:*(void *)(a1 + 48) context:*(void *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (CMContinityCaptureDebugLogEnabled())
  {
    id v12 = CMContinuityCaptureLog(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      long long v34 = self;
      __int16 v35 = 2114;
      id v36 = v9;
      __int16 v37 = 2114;
      id v38 = v10;
      _os_log_debug_impl(&dword_235FC2000, v12, OS_LOG_TYPE_DEBUG, "%@ keypath:%{public}@ object:%{public}@", buf, 0x20u);
    }
  }
  if ([v9 isEqualToString:@"availableClientDevices"]) {
    goto LABEL_20;
  }
  if (![v9 isEqualToString:@"state"])
  {
    if (![v9 isEqualToString:@"magic"]) {
      goto LABEL_21;
    }
LABEL_20:
    [(CMContinuityCaptureProvider *)self updateState];
    goto LABEL_21;
  }
  uint64_t v13 = *MEMORY[0x263F081B8];
  id v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  uint64_t v15 = [v14 integerValue];

  if (v15 == 4)
  {
    id v16 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
    uint64_t v17 = [v16 integerValue];

    if (v17 <= 2)
    {
      id v18 = +[CMContinuityCaptureDiscoverySession sharedInstance];
      id v19 = [v18 availableClientDevices];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            long long v25 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v24), "magicStateMonitor", (void)v28);
            [v25 holdMagicStateAssertion:2];

            ++v24;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v22);
      }
    }
  }
  long long v26 = objc_msgSend(v11, "objectForKeyedSubscript:", v13, (void)v28);
  uint64_t v27 = [v26 integerValue];

  if (v27 >= 3) {
    goto LABEL_20;
  }
LABEL_21:
}

- (void)registerStreamIntentForDevice:(id)a3 forTransportType:(int64_t)a4 completion:(id)a5
{
  int v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  id v10 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138413058;
    id v12 = self;
    __int16 v13 = 2082;
    id v14 = "-[CMContinuityCaptureProvider registerStreamIntentForDevice:forTransportType:completion:]";
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 1024;
    int v18 = v6;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ %{public}s Device:%{public}@ Transport:%d", (uint8_t *)&v11, 0x26u);
  }

  v9[2](v9, 0);
}

- (void)unregisterStreamIntentForDevice:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v5 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
  [v5 unscheduleNotification:2];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CMContinuityCaptureProvider_unregisterStreamIntentForDevice___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __63__CMContinuityCaptureProvider_unregisterStreamIntentForDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = objc_msgSend(WeakRetained[24], "allValues", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (([*(id *)(a1 + 32) isEqual:v9] & 1) == 0) {
            [v9 postEvent:@"kCMContinuityCaptureEventStreamEnableForMultipleStreamExit" entity:0 data:0];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (id)debugInfo
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__0;
  long long v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v3 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(CMContinuityCaptureProvider *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__CMContinuityCaptureProvider_debugInfo__block_invoke;
  v7[3] = &unk_264C994B0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_async_and_wait(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __40__CMContinuityCaptureProvider_debugInfo__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _debugInfo];
  return MEMORY[0x270F9A758]();
}

- (id)_debugInfo
{
  id v3 = [(CMContinuityCaptureProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers allKeys];
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"CurrentPublishedDevices"];
  }
  devicePublishLogs = self->_devicePublishLogs;
  if (devicePublishLogs)
  {
    uint64_t v7 = (void *)[(NSMutableArray *)devicePublishLogs copy];
    [v4 setObject:v7 forKeyedSubscript:@"DevicePublishHistory"];
  }
  return v4;
}

- (void)debugInfo:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(CMContinuityCaptureProvider *)self debugInfo];
  v4[2](v4, v5);
}

- (BOOL)connectClient:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 clientID];
    int v10 = 138413059;
    long long v11 = self;
    __int16 v12 = 2080;
    id v13 = "-[CMContinuityCaptureProvider connectClient:error:]";
    __int16 v14 = 2113;
    uint64_t v15 = v7;
    __int16 v16 = 1025;
    int v17 = [v5 pid];
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s Client Connected - %{private}@, %{private}d", (uint8_t *)&v10, 0x26u);
  }
  uint64_t v8 = +[CMContinuityCaptureUserOnboarding sharedInstance];
  [v8 reportClientState:1 forClient:v5];

  return 1;
}

- (void)disconnectClient:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = CMContinuityCaptureLog(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 clientID];
    *(_DWORD *)buf = 138413059;
    long long v31 = self;
    __int16 v32 = 2080;
    long long v33 = "-[CMContinuityCaptureProvider disconnectClient:]";
    __int16 v34 = 2113;
    __int16 v35 = v6;
    __int16 v36 = 1025;
    int v37 = [v4 pid];
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s Client Disconnected - %{private}@, %{private}d", buf, 0x26u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(CMIOExtensionProvider *)self devices];
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        __int16 v12 = [v11 streams];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              int v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v17 disconnectClient:v4];
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  uint64_t v18 = +[CMContinuityCaptureUserOnboarding sharedInstance];
  [v18 reportClientState:2 forClient:v4];
}

- (NSSet)availableProperties
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v3 = v2;
  if (v2)
  {
    [v2 addObject:*MEMORY[0x263F016A8]];
    [v3 addObject:*MEMORY[0x263F016B0]];
    [v3 addObject:*MEMORY[0x263F01680]];
  }
  return (NSSet *)v3;
}

- (id)providerPropertiesForProperties:(id)a3 error:(id *)a4
{
  if (a3)
  {
    queue = self->_queue;
    id v5 = a3;
    dispatch_assert_queue_V2(queue);
    uint64_t v6 = [MEMORY[0x263F016F0] providerPropertiesWithDictionary:MEMORY[0x263EFFA78]];
    uint64_t v7 = *MEMORY[0x263F01680];
    int v8 = [v5 containsObject:*MEMORY[0x263F01680]];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263F016E0] propertyStateWithValue:&unk_26E96A2E8];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        [v6 setPropertyState:v9 forProperty:v7];
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (BOOL)setProviderProperties:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3)
  {
    queue = self->_queue;
    id v7 = a3;
    dispatch_assert_queue_V2(queue);
    int v8 = [v7 propertiesDictionary];
    uint64_t v9 = [v7 client];

    uint64_t v10 = CMContinuityCaptureLog(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      long long v24 = self;
      __int16 v25 = 2114;
      long long v26 = v8;
      _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ propertyDict %{public}@", (uint8_t *)&v23, 0x16u);
    }

    uint64_t v11 = *MEMORY[0x263F01680];
    __int16 v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F01680]];

    if (v12)
    {
      uint64_t v13 = CMContinuityCaptureLog(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v8 objectForKeyedSubscript:v11];
        uint64_t v15 = [v14 value];
        int v23 = 138412802;
        long long v24 = self;
        __int16 v25 = 2114;
        long long v26 = v15;
        __int16 v27 = 2114;
        long long v28 = v9;
        _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%@ CMIOExtensionPropertyClientStreamingFromDALDevice %{public}@ client %{public}@", (uint8_t *)&v23, 0x20u);
      }
      uint64_t v16 = [v8 objectForKeyedSubscript:v11];
      int v17 = [v16 value];
      int v18 = [v17 BOOLValue];

      uint64_t v19 = +[CMContinuityCaptureUserOnboarding sharedInstance];
      long long v20 = v19;
      if (v18) {
        uint64_t v21 = 3;
      }
      else {
        uint64_t v21 = 4;
      }
      [v19 reportClientState:v21 forClient:v9];
    }
  }
  return a3 != 0;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@: [%p]", v5, self];

  return (NSString *)v6;
}

- (id)_captureDeviceForEntity:(int64_t)a3 deviceUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = [(NSMutableDictionary *)self->_availableCaptureDevicesByIdentifiers objectForKeyedSubscript:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(v5, "continuityCaptureDevices", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 entity] == a3)
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 240, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registeredStreamDevicesOnWifi, 0);
  objc_storeStrong((id *)&self->_observedDevices, 0);
  objc_storeStrong((id *)&self->_devicePublishLogs, 0);
  objc_storeStrong((id *)&self->_pendingTerminateDeviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableCaptureDevicesByIdentifiers, 0);
}

- (void)postEventOnAllDevices:(uint64_t)a1 data:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_235FC2000, a2, OS_LOG_TYPE_FAULT, "%@ Invalid event name", (uint8_t *)&v2, 0xCu);
}

@end