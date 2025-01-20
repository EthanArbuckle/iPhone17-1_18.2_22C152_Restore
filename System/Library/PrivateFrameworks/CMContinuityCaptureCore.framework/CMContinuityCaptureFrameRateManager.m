@interface CMContinuityCaptureFrameRateManager
- (BOOL)throttled;
- (CMContinuityCaptureFrameRateManager)init;
- (id)allowedFrameRateRangeForDevice:(id)a3;
- (id)throttledFrameRateByActiveStreamingEntities;
- (id)throttledFrameRateByThermalLevelAndLowPowerMode;
- (void)dealloc;
- (void)lowPowerModeChanged:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reportStreamStatus:(BOOL)a3 forDevice:(id)a4;
- (void)updateAllowedFPS;
@end

@implementation CMContinuityCaptureFrameRateManager

- (CMContinuityCaptureFrameRateManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureFrameRateManager;
  v2 = [(CMContinuityCaptureFrameRateManager *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    objc_sync_enter(v4);
    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    activeStreamingDevices = v4->_activeStreamingDevices;
    v4->_activeStreamingDevices = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    allowedFrameRateRangeForDevice = v4->_allowedFrameRateRangeForDevice;
    v4->_allowedFrameRateRangeForDevice = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    clientRequestedFrameRateRangeForDevice = v4->_clientRequestedFrameRateRangeForDevice;
    v4->_clientRequestedFrameRateRangeForDevice = (NSMapTable *)v9;

    v11 = +[CMContinuityCaptureThermalMonitor sharedInstance];
    [v11 addObserver:v4 forKeyPath:@"thermalLevel" options:3 context:0];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v4 selector:sel_lowPowerModeChanged_ name:*MEMORY[0x263F08450] object:0];

    v4->_currentThermalLevel = 1;
    objc_sync_exit(v4);

    v13 = v4;
  }

  return v3;
}

- (void)dealloc
{
  v3 = +[CMContinuityCaptureThermalMonitor sharedInstance];
  [v3 removeObserver:self forKeyPath:@"thermalLevel" context:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F08450] object:0];

  v5.receiver = self;
  v5.super_class = (Class)CMContinuityCaptureFrameRateManager;
  [(CMContinuityCaptureFrameRateManager *)&v5 dealloc];
}

- (BOOL)throttled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_throttled);
  return v2 & 1;
}

- (id)allowedFrameRateRangeForDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMapTable *)v5->_allowedFrameRateRangeForDevice objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  if ([v9 isEqualToString:@"thermalLevel"])
  {
    v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      objc_super v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      int v16 = 138543874;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Evaluate FPS Throttle due to change in thermal level(%@ -> %@)", (uint8_t *)&v16, 0x20u);
    }
    [(CMContinuityCaptureFrameRateManager *)v12 updateAllowedFPS];
  }
  objc_sync_exit(v12);
}

- (void)lowPowerModeChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [a3 name];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F08450]];

  if (v5)
  {
    v6 = [MEMORY[0x263F08AB0] processInfo];
    int v7 = [v6 isLowPowerModeEnabled];

    v8 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      id v10 = self;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Device PowerState has changed - lowPowerModeEnabled(%d)", (uint8_t *)&v9, 0x12u);
    }

    [(CMContinuityCaptureFrameRateManager *)self updateAllowedFPS];
  }
}

- (id)throttledFrameRateByThermalLevelAndLowPowerMode
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08AB0] processInfo];
  int v4 = [v3 isLowPowerModeEnabled];

  int v5 = +[CMContinuityCaptureThermalMonitor sharedInstance];
  unint64_t v6 = [v5 thermalLevel];
  unint64_t currentThermalLevel = self->_currentThermalLevel;

  if (v6 > currentThermalLevel)
  {
    v8 = +[CMContinuityCaptureThermalMonitor sharedInstance];
    self->_unint64_t currentThermalLevel = [v8 thermalLevel];
  }
  unint64_t v9 = self->_currentThermalLevel;
  BOOL v10 = v9 > 3;
  if (v9 == 3) {
    int v11 = 1;
  }
  else {
    int v11 = v4;
  }
  if (v10) {
    int v11 = 2;
  }
  if (v11 == 1)
  {
    int v12 = &unk_26E96A5A0;
  }
  else
  {
    if (v11 != 2) {
      return 0;
    }
    int v12 = &unk_26E96A5B8;
  }
  uint64_t v13 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    int v16 = self;
    __int16 v17 = 1024;
    int v18 = v4;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl(&dword_235FC2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Throttle Reason: Thermal/LPM (%d). Throttled frame rate: %@", (uint8_t *)&v15, 0x1Cu);
  }

  return v12;
}

- (id)throttledFrameRateByActiveStreamingEntities
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v3 = self->_activeStreamingDevices;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v25 = self;
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v32;
    uint64_t v9 = *MEMORY[0x263EF9670];
    uint64_t v26 = *MEMORY[0x263EF9680];
    uint64_t v27 = *MEMORY[0x263EF9670];
    do
    {
      uint64_t v10 = 0;
      uint64_t v30 = v5;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v3);
        }
        int v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        int v12 = [v11 activeConfiguration];
        uint64_t v13 = [v12 entity];

        if (v13 == 2)
        {
          int v6 = 1;
        }
        else
        {
          v14 = [v11 activeConfiguration];
          if ([v14 entity] == 1)
          {
            int v15 = [v11 videoDevice];
            int v16 = [v15 deviceType];
            if ([v16 isEqualToString:v9])
            {
              __int16 v17 = [v11 companionDevice];
              [v17 videoDevice];
              int v28 = v7;
              int v29 = v6;
              v19 = int v18 = v3;
              [v19 deviceType];
              v21 = uint64_t v20 = v8;
              int v22 = [v21 isEqualToString:v26];

              uint64_t v8 = v20;
              v3 = v18;
              int v7 = v28;
              int v6 = v29;

              uint64_t v9 = v27;
            }
            else
            {
              int v22 = 0;
            }

            uint64_t v5 = v30;
          }
          else
          {
            int v22 = 0;
          }

          v7 |= v22;
        }
        ++v10;
      }
      while (v5 != v10);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v5);

    if ((v6 & v7 & 1) == 0) {
      return 0;
    }
    CMContinuityCaptureLog(0);
    v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v23 = &unk_26E96A5D0;
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      __int16 v37 = 2112;
      v38 = &unk_26E96A5D0;
      _os_log_impl(&dword_235FC2000, &v3->super, OS_LOG_TYPE_DEFAULT, "%{public}@ Throttle Reason: DeskCam. Throttled frame rate: %@", buf, 0x16u);
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)updateAllowedFPS
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  unsigned __int8 v2 = self;
  objc_sync_enter(v2);
  v43 = v2;
  v3 = [(CMContinuityCaptureFrameRateManager *)v2 throttledFrameRateByThermalLevelAndLowPowerMode];
  long long v33 = v3;
  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = -1;
  }
  uint64_t v5 = [(CMContinuityCaptureFrameRateManager *)v2 throttledFrameRateByActiveStreamingEntities];
  long long v32 = v5;
  if (v5)
  {
    unsigned int v6 = objc_msgSend(v5, "unsignedIntValue", v5, v33);
    if (v6 < v4) {
      unsigned int v4 = v6;
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obj = v2->_activeStreamingDevices;
  uint64_t v7 = [(NSHashTable *)obj countByEnumeratingWithState:&v44 objects:v64 count:16];
  if (v7)
  {
    unsigned int v41 = v4;
    char v42 = 0;
    uint64_t v38 = *(void *)v45;
    do
    {
      uint64_t v39 = v7;
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v10 = -[NSMapTable objectForKey:](v43->_clientRequestedFrameRateRangeForDevice, "objectForKey:", v9, v32);
        int v11 = v10;
        if (v10)
        {
          int v12 = [v10 maxFrameRate];
          unsigned int v13 = [v12 unsignedIntValue];

          v14 = [v11 minFrameRate];
          unsigned int v15 = [v14 unsignedIntValue];

          if (v13 >= v41) {
            unsigned int v16 = v41;
          }
          else {
            unsigned int v16 = v13;
          }
          BOOL v17 = v13 > v41;
          if (v15 >= v16) {
            uint64_t v18 = v16;
          }
          else {
            uint64_t v18 = v15;
          }
          allowedFrameRateRangeForDevice = v43->_allowedFrameRateRangeForDevice;
          uint64_t v20 = +[CMContinuityCaptureFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](CMContinuityCaptureFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", v18);
          [(NSMapTable *)allowedFrameRateRangeForDevice setObject:v20 forKey:v9];

          uint64_t v21 = CMContinuityCaptureLog(2);
          v42 |= v17;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v37 = [v9 activeConfiguration];
            CMContinuityCaptureStringForEntity([v37 entity]);
            id v40 = (id)objc_claimAutoreleasedReturnValue();
            v36 = [(NSMapTable *)v43->_clientRequestedFrameRateRangeForDevice objectForKey:v9];
            int v22 = [v36 minFrameRate];
            v23 = [(NSMapTable *)v43->_clientRequestedFrameRateRangeForDevice objectForKey:v9];
            v24 = [v23 maxFrameRate];
            v25 = [(NSMapTable *)v43->_allowedFrameRateRangeForDevice objectForKey:v9];
            uint64_t v26 = [v25 minFrameRate];
            uint64_t v27 = [(NSMapTable *)v43->_allowedFrameRateRangeForDevice objectForKey:v9];
            int v28 = [v27 maxFrameRate];
            if (v41 == -1)
            {
              int v29 = @"INT_MAX";
            }
            else
            {
              objc_msgSend(NSNumber, "numberWithUnsignedInt:");
              v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
              int v29 = v35;
            }
            *(_DWORD *)buf = 138545154;
            v49 = v43;
            __int16 v50 = 2112;
            id v51 = v40;
            __int16 v52 = 2112;
            v53 = v22;
            __int16 v54 = 2112;
            v55 = v24;
            __int16 v56 = 2112;
            v57 = v26;
            __int16 v58 = 2112;
            v59 = v28;
            __int16 v60 = 1024;
            int v61 = v42 & 1;
            __int16 v62 = 2112;
            v63 = v29;
            _os_log_impl(&dword_235FC2000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ - client requested frame rate min: %@ max: %@, allowed frame rate min: %@ max: %@. Throttled: %d systemThrottledMaxFrameRate: %@", buf, 0x4Eu);
            if (v41 != -1) {
          }
            }
        }
        else
        {
          uint64_t v21 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v43;
            _os_log_error_impl(&dword_235FC2000, v21, OS_LOG_TYPE_ERROR, "%{public}@ device not found in clientRequestedFrameRateRange dict", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [(NSHashTable *)obj countByEnumeratingWithState:&v44 objects:v64 count:16];
    }
    while (v7);
  }
  else
  {
    char v42 = 0;
  }

  unsigned __int8 v30 = atomic_load((unsigned __int8 *)&v43->_throttled);
  objc_sync_exit(v43);

  if (v30 & 1 | v42 & 1)
  {
    [(CMContinuityCaptureFrameRateManager *)v43 willChangeValueForKey:@"throttled"];
    long long v31 = v43;
    atomic_store(v42 & 1, (unsigned __int8 *)&v43->_throttled);
    [(CMContinuityCaptureFrameRateManager *)v31 didChangeValueForKey:@"throttled"];
  }
}

- (void)reportStreamStatus:(BOOL)a3 forDevice:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 activeConfiguration];
    uint64_t v9 = CMContinuityCaptureStringForEntity([v8 entity]);
    int v25 = 138543874;
    uint64_t v26 = self;
    __int16 v27 = 1024;
    BOOL v28 = v4;
    __int16 v29 = 2112;
    unsigned __int8 v30 = v9;
    _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ report stream status %d for device %@", (uint8_t *)&v25, 0x1Cu);
  }
  uint64_t v10 = [v6 videoDevice];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    int v12 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureFrameRateManager reportStreamStatus:forDevice:]((uint64_t)self, v12);
    }
  }
  unsigned int v13 = self;
  objc_sync_enter(v13);
  activeStreamingDevices = v13->_activeStreamingDevices;
  if (v4)
  {
    [(NSHashTable *)activeStreamingDevices addObject:v6];
    clientRequestedFrameRateRangeForDevice = v13->_clientRequestedFrameRateRangeForDevice;
    unsigned int v16 = [v6 activeConfiguration];
    uint64_t v17 = [v16 minFrameRate];
    uint64_t v18 = [v6 activeConfiguration];
    __int16 v19 = +[CMContinuityCaptureFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](CMContinuityCaptureFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", v17, [v18 maxFrameRate]);
    [(NSMapTable *)clientRequestedFrameRateRangeForDevice setObject:v19 forKey:v6];
  }
  else
  {
    [(NSHashTable *)activeStreamingDevices removeObject:v6];
    uint64_t v20 = [(NSMapTable *)v13->_clientRequestedFrameRateRangeForDevice objectForKey:v6];
    unsigned int v16 = v20;
    if (!v20) {
      goto LABEL_12;
    }
    uint64_t v21 = [v20 maxFrameRate];
    uint64_t v22 = [v21 unsignedIntValue];
    v23 = [v6 activeConfiguration];
    [v23 setMaxFrameRate:v22];

    uint64_t v18 = [v16 minFrameRate];
    uint64_t v24 = [v18 unsignedIntValue];
    __int16 v19 = [v6 activeConfiguration];
    [v19 setMinFrameRate:v24];
  }

LABEL_12:
  if (![(NSHashTable *)v13->_activeStreamingDevices count])
  {
    v13->_unint64_t currentThermalLevel = 1;
    v13->_throttledDeskCamMultipleCamerasInUse = 0;
  }
  objc_sync_exit(v13);

  if ([(NSHashTable *)v13->_activeStreamingDevices count]) {
    [(CMContinuityCaptureFrameRateManager *)v13 updateAllowedFPS];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRequestedFrameRateRangeForDevice, 0);
  objc_storeStrong((id *)&self->_allowedFrameRateRangeForDevice, 0);
  objc_storeStrong((id *)&self->_activeStreamingDevices, 0);
}

- (void)reportStreamStatus:(uint64_t)a1 forDevice:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235FC2000, a2, OS_LOG_TYPE_ERROR, "%{public}@ reportStreamStatus called but no videoDevice exists for device", (uint8_t *)&v2, 0xCu);
}

@end