@interface HMIVideoAnalyzerScheduler
+ (id)sharedInstance;
- (BOOL)_shouldSkipLogState;
- (BOOL)ignoreThermalAndSystemResourceUsageLevel;
- (HMIVideoAnalyzerScheduler)init;
- (NSArray)analyzerConfigurations;
- (NSArray)analyzerStates;
- (NSArray)analyzers;
- (NSPointerArray)internalAnalyzers;
- (id)analyzerWithConfiguration:(id)a3 block:(id)a4;
- (id)reducedConfiguration:(id)a3;
- (id)reducedConfiguration:(id)a3 configurations:(id)a4;
- (id)reducedConfiguration:(id)a3 states:(id)a4;
- (int64_t)_getPeakPowerPressureLevel;
- (int64_t)logStateCount;
- (int64_t)usageLevel;
- (unint64_t)maxH264VideoDecoders;
- (unint64_t)maxH264VideoEncoders;
- (unint64_t)maxH265VideoEncoders;
- (void)_compactInternalAnalyzers;
- (void)_logState;
- (void)_updateAnalyzer:(id)a3 withIndex:(unint64_t)a4;
- (void)registerAnalyzer:(id)a3;
- (void)setIgnoreThermalAndSystemResourceUsageLevel:(BOOL)a3;
- (void)setLogStateCount:(int64_t)a3;
- (void)setMaxH264VideoDecoders:(unint64_t)a3;
- (void)setMaxH264VideoEncoders:(unint64_t)a3;
- (void)setMaxH265VideoEncoders:(unint64_t)a3;
- (void)systemResourceUsageDidChangeTo:(int64_t)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIVideoAnalyzerScheduler

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMIVideoAnalyzerScheduler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __43__HMIVideoAnalyzerScheduler_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (HMIVideoAnalyzerScheduler)init
{
  v20.receiver = self;
  v20.super_class = (Class)HMIVideoAnalyzerScheduler;
  v2 = [(HMIVideoAnalyzerScheduler *)&v20 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  v2->_lock._os_unfair_lock_opaque = 0;
  v2->_registerLock._os_unfair_lock_opaque = 0;
  uint64_t v4 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:28 options:1.0];
  tick = v3->_tick;
  v3->_tick = (HMFTimer *)v4;

  [(HMFTimer *)v3->_tick setDelegate:v3];
  uint64_t v6 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  internalAnalyzers = v3->_internalAnalyzers;
  v3->_internalAnalyzers = (NSPointerArray *)v6;

  v8 = objc_alloc_init(HMISystemResourceUsageMonitor);
  usageMonitor = v3->_usageMonitor;
  v3->_usageMonitor = v8;

  [(HMISystemResourceUsageMonitor *)v3->_usageMonitor setDelegate:v3];
  [(HMISystemResourceUsageMonitor *)v3->_usageMonitor start];
  v3->_ignoreThermalAndSystemResourceUsageLevel = 0;
  if (+[HMIPreference isProductTypeB620])
  {
    uint64_t v10 = 3;
  }
  else if (+[HMIPreference isAudioAccessory])
  {
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 5;
  }
  v3->_maxH264VideoDecoders = v10;
  BOOL v11 = +[HMIPreference isAudioAccessory];
  uint64_t v12 = 4;
  if (v11) {
    uint64_t v12 = 2;
  }
  v3->_maxH264VideoEncoders = v12;
  v3->_maxH265VideoEncoders = 0;
  v13 = +[HMIPreference sharedInstance];
  if ([v13 BOOLPreferenceForKey:@"useHEVC" defaultValue:1])
  {
    if (+[HMIPreference isProductTypeJ305]
      || +[HMIPreference isProductTypeJ105])
    {
    }
    else
    {
      BOOL v19 = +[HMIPreference isProductTypeJ255];

      if (!v19) {
        goto LABEL_15;
      }
    }
    v3->_maxH265VideoEncoders = v3->_maxH264VideoEncoders;
    v3->_maxH264VideoEncoders = 0;
  }
  else
  {
  }
LABEL_15:
  v14 = +[HMIPreference sharedInstance];
  v15 = [v14 numberPreferenceForKey:@"maxH265Encoders"];

  if (v15) {
    v3->_maxH265VideoEncoders = [v15 unsignedIntegerValue];
  }
  v16 = +[HMIPreference sharedInstance];
  v17 = [v16 numberPreferenceForKey:@"maxH264Encoders"];

  if (v17) {
    v3->_maxH264VideoEncoders = [v17 unsignedIntegerValue];
  }

  return v3;
}

- (void)registerAnalyzer:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSPointerArray *)self->_internalAnalyzers hmf_addObject:v4];
  [(HMFTimer *)self->_tick resume];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)analyzerWithConfiguration:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  os_unfair_lock_lock_with_options();
  v8 = [(HMIVideoAnalyzerScheduler *)self reducedConfiguration:v6];

  v9 = v7[2](v7, v8);
  [(HMIVideoAnalyzerScheduler *)self registerAnalyzer:v9];
  os_unfair_lock_unlock(&self->_registerLock);

  return v9;
}

- (NSArray)analyzerConfigurations
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  id v4 = [(HMIVideoAnalyzerScheduler *)self analyzers];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_26);

  return (NSArray *)v5;
}

uint64_t __51__HMIVideoAnalyzerScheduler_analyzerConfigurations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 configuration];
}

- (NSArray)analyzerStates
{
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  id v4 = [(HMIVideoAnalyzerScheduler *)self analyzers];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_52);

  return (NSArray *)v5;
}

uint64_t __43__HMIVideoAnalyzerScheduler_analyzerStates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 state];
}

- (id)reducedConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(HMIVideoAnalyzerScheduler *)self analyzerConfigurations];
  id v6 = [(HMIVideoAnalyzerScheduler *)self reducedConfiguration:v4 configurations:v5];

  return v6;
}

- (id)reducedConfiguration:(id)a3 states:(id)a4
{
  id v6 = a3;
  v7 = objc_msgSend(a4, "na_map:", &__block_literal_global_55_0);
  v8 = [(HMIVideoAnalyzerScheduler *)self reducedConfiguration:v6 configurations:v7];

  return v8;
}

uint64_t __57__HMIVideoAnalyzerScheduler_reducedConfiguration_states___block_invoke(uint64_t a1, void *a2)
{
  return [a2 configuration];
}

- (id)reducedConfiguration:(id)a3 configurations:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 allowReducedConfiguration])
  {
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __65__HMIVideoAnalyzerScheduler_reducedConfiguration_configurations___block_invoke;
    v52[3] = &unk_26477DED0;
    v52[4] = &v61;
    v52[5] = &v57;
    v52[6] = &v53;
    objc_msgSend(v7, "na_each:", v52);
    id v8 = (id)[v6 copy];
    if (![(HMIVideoAnalyzerScheduler *)self ignoreThermalAndSystemResourceUsageLevel])
    {
      v9 = +[HMIPreference sharedInstance];
      -[HMIVideoAnalyzerScheduler setMaxH264VideoDecoders:](self, "setMaxH264VideoDecoders:", [v9 maxConcurrentAnalyzersForSystemResourceUsageLevel:self->_usageLevel]);
    }
    if ([v8 decodeMode])
    {
      unint64_t v10 = v62[3];
      if (v10 >= [(HMIVideoAnalyzerScheduler *)self maxH264VideoDecoders])
      {
        BOOL v11 = (void *)MEMORY[0x22A641C70]();
        uint64_t v12 = self;
        HMFGetOSLogHandle();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          uint64_t v15 = v62[3];
          *(_DWORD *)buf = 138543618;
          v66 = v14;
          __int16 v67 = 2048;
          uint64_t v68 = v15;
          _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Cannot decode additional streams using H.264, %lu H.264 decoders are already being used.", buf, 0x16u);
        }
        [v8 setDecodeMode:0];
      }
    }
    if ([v8 decodeMode])
    {
      if ([v8 transcode])
      {
        unint64_t v16 = v54[3];
        if (v16 >= [(HMIVideoAnalyzerScheduler *)self maxH265VideoEncoders])
        {
          v17 = (void *)MEMORY[0x22A641C70]();
          v18 = self;
          HMFGetOSLogHandle();
          BOOL v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_super v20 = HMFGetLogIdentifier();
            uint64_t v21 = v54[3];
            *(_DWORD *)buf = 138543618;
            v66 = v20;
            __int16 v67 = 2048;
            uint64_t v68 = v21;
            _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Cannot transcode additional streams using H.265, %lu H.265 encoders are already being used, trying with H.264.", buf, 0x16u);
          }
          unint64_t v22 = v58[3];
          if (v22 >= [(HMIVideoAnalyzerScheduler *)v18 maxH264VideoEncoders])
          {
            v23 = (void *)MEMORY[0x22A641C70]();
            v24 = v18;
            HMFGetOSLogHandle();
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = HMFGetLogIdentifier();
              uint64_t v27 = v58[3];
              *(_DWORD *)buf = 138543618;
              v66 = v26;
              __int16 v67 = 2048;
              uint64_t v68 = v27;
              _os_log_impl(&dword_225DC6000, v25, OS_LOG_TYPE_INFO, "%{public}@Cannot transcode additional streams, %lu H.264 encoders are already being used.", buf, 0x16u);
            }
            [v8 setTranscode:0];
          }
          else
          {
            ++v58[3];
            [v8 setTranscodeCodecType:1635148593];
          }
        }
        else
        {
          ++v54[3];
          [v8 setTranscodeCodecType:1752589105];
        }
      }
      if (v8)
      {
        [v8 timelapseInterval];
        if ((v50 & 0x100000000) != 0)
        {
          unint64_t v28 = v54[3];
          if (v28 >= [(HMIVideoAnalyzerScheduler *)self maxH265VideoEncoders])
          {
            v34 = (void *)MEMORY[0x22A641C70]();
            v35 = self;
            HMFGetOSLogHandle();
            v36 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              v37 = HMFGetLogIdentifier();
              uint64_t v38 = v54[3];
              *(_DWORD *)buf = 138543618;
              v66 = v37;
              __int16 v67 = 2048;
              uint64_t v68 = v38;
              _os_log_impl(&dword_225DC6000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Cannot encode timelapse using H.265, %lu H.265 encoders are already being used, trying with H.264.", buf, 0x16u);
            }
            unint64_t v39 = v58[3];
            if (v39 >= [(HMIVideoAnalyzerScheduler *)v35 maxH264VideoEncoders])
            {
              v40 = (void *)MEMORY[0x22A641C70]();
              v41 = v35;
              HMFGetOSLogHandle();
              v42 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                v43 = HMFGetLogIdentifier();
                uint64_t v44 = v58[3];
                *(_DWORD *)buf = 138543618;
                v66 = v43;
                __int16 v67 = 2048;
                uint64_t v68 = v44;
                _os_log_impl(&dword_225DC6000, v42, OS_LOG_TYPE_INFO, "%{public}@Cannot encode timelapse, %lu H.264 encoders are already being used.", buf, 0x16u);
              }
              long long v47 = *MEMORY[0x263F01090];
              uint64_t v48 = *(void *)(MEMORY[0x263F01090] + 16);
              [v8 setTimelapseInterval:&v47];
            }
            else
            {
              ++v58[3];
              [v8 setTimelapseCodecType:1635148593];
            }
          }
          else
          {
            ++v54[3];
            [v8 setTimelapseCodecType:1752589105];
          }
        }
      }
      else
      {
        uint64_t v49 = 0;
        uint64_t v50 = 0;
        uint64_t v51 = 0;
      }
    }
    else
    {
      [v8 setTranscode:0];
      long long v45 = *MEMORY[0x263F01090];
      uint64_t v46 = *(void *)(MEMORY[0x263F01090] + 16);
      [v8 setTimelapseInterval:&v45];
    }
    if (![(HMIVideoAnalyzerScheduler *)self ignoreThermalAndSystemResourceUsageLevel])
    {
      v29 = +[HMIPreference sharedInstance];
      [v29 maxAnalysisFPSForSystemResourceUsageLevel:self->_usageLevel];
      double v31 = v30;

      [v6 analysisFPS];
      if (v31 < v32) {
        double v32 = v31;
      }
      [v8 setAnalysisFPS:v32];
    }
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

void __65__HMIVideoAnalyzerScheduler_reducedConfiguration_configurations___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 decodeMode]) {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
  }
  if ([v3 transcode])
  {
    if ([v3 transcodeCodecType] == 1635148593)
    {
      uint64_t v4 = a1[5];
LABEL_8:
      ++*(void *)(*(void *)(v4 + 8) + 24);
      goto LABEL_9;
    }
    if ([v3 transcodeCodecType] == 1752589105)
    {
      uint64_t v4 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:
  if (v3)
  {
    [v3 timelapseInterval];
    if (v6)
    {
      if ([v3 timelapseCodecType] == 1635148593)
      {
        uint64_t v5 = a1[5];
LABEL_16:
        ++*(void *)(*(void *)(v5 + 8) + 24);
        goto LABEL_17;
      }
      if ([v3 timelapseCodecType] == 1752589105)
      {
        uint64_t v5 = a1[6];
        goto LABEL_16;
      }
    }
  }
LABEL_17:
}

- (void)_compactInternalAnalyzers
{
  [(NSPointerArray *)self->_internalAnalyzers addPointer:0];
  internalAnalyzers = self->_internalAnalyzers;
  [(NSPointerArray *)internalAnalyzers compact];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x22A641C70]();
  os_unfair_lock_lock_with_options();
  [(HMIVideoAnalyzerScheduler *)self _compactInternalAnalyzers];
  if (![(NSPointerArray *)self->_internalAnalyzers count]) {
    [(HMFTimer *)self->_tick suspend];
  }
  os_unfair_lock_unlock(&self->_lock);
  char v6 = [(HMIVideoAnalyzerScheduler *)self analyzers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HMIVideoAnalyzerScheduler_timerDidFire___block_invoke;
  v7[3] = &unk_26477DEF8;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];

  [(HMIVideoAnalyzerScheduler *)self _logState];
}

uint64_t __42__HMIVideoAnalyzerScheduler_timerDidFire___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateAnalyzer:a2 withIndex:a3];
}

- (void)systemResourceUsageDidChangeTo:(int64_t)a3
{
  self->_usageLevel = a3;
}

- (void)_updateAnalyzer:(id)a3 withIndex:(unint64_t)a4
{
  id v12 = a3;
  if ([v12 monitored])
  {
    [v12 delay];
    double v6 = 0.0;
    if (v5 <= 16.0)
    {
      double v7 = 0.25;
      double v8 = 1.0;
      if (v5 > 2.0) {
        double v8 = 0.5;
      }
      if (v5 <= 4.0) {
        double v7 = v8;
      }
      if (v5 <= 8.0) {
        double v6 = v7;
      }
      else {
        double v6 = 0.125;
      }
    }
    if (![(HMIVideoAnalyzerScheduler *)self ignoreThermalAndSystemResourceUsageLevel])
    {
      v9 = +[HMIPreference sharedInstance];
      [v9 maxAnalysisFPSForSystemResourceUsageLevel:self->_usageLevel];
      double v11 = v10;

      if (v11 < v6) {
        double v6 = v11;
      }
    }
    [v12 setAnalysisFPS:v6];
  }
}

- (BOOL)_shouldSkipLogState
{
  uint64_t v3 = [(HMIVideoAnalyzerScheduler *)self logStateCount];
  [(HMIVideoAnalyzerScheduler *)self setLogStateCount:[(HMIVideoAnalyzerScheduler *)self logStateCount] + 1];
  id v4 = +[HMIPreference sharedInstance];
  double v5 = [v4 numberPreferenceForKey:@"schedulerStateLogFrequency" defaultValue:&unk_26D9A9420];
  uint64_t v6 = [v5 integerValue];

  return v3 % v6 != 0;
}

- (int64_t)_getPeakPowerPressureLevel
{
  if (!+[HMIPreference isProductTypeJ255]) {
    return -1;
  }
  v2 = +[HMIPeakPowerPressureMonitor sharedInstance];
  int64_t v3 = [v2 peakPowerPressureLevel];

  return v3;
}

- (void)_logState
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  if (![(HMIVideoAnalyzerScheduler *)self _shouldSkipLogState])
  {
    unint64_t usageLevel = self->_usageLevel;
    if (usageLevel > 3) {
      id v4 = @"Undefined";
    }
    else {
      id v4 = off_26477DF88[usageLevel];
    }
    unint64_t v82 = 0;
    unint64_t v83 = 0;
    unint64_t v80 = 0;
    unint64_t v81 = 0;
    unint64_t v78 = 0;
    unint64_t v79 = 0;
    HMIGetMemoryFootprint(&v83, &v82);
    double v5 = +[HMIPreference sharedInstance];
    int v6 = [v5 BOOLPreferenceForKey:@"logOtherProcessMemorySchedulerState" defaultValue:0];

    if (v6)
    {
      int v8 = HMIGetProcessID(@"mediaserverd");
      HMIGetMemoryFootprintForProcessID(v8, &v79, &v78);
      int v9 = HMIGetProcessID(@"homed");
      BOOL v7 = HMIGetMemoryFootprintForProcessID(v9, &v81, &v80);
    }
    double v10 = (void *)MEMORY[0x22A641C70](v7);
    double v11 = [(HMIVideoAnalyzerScheduler *)self analyzers];
    id v12 = [v11 firstObject];

    if (v12)
    {
      v73 = v10;
      objc_msgSend(v11, "na_each:", &__block_literal_global_81);
      v13 = +[HMIPreference sharedInstance];
      int v14 = [v13 BOOLPreferenceForKey:@"logHumanFriendlySchedulerState" defaultValue:0];

      unint64_t v15 = 0x26477A000;
      v74 = v11;
      if (v14)
      {
        unint64_t v16 = [MEMORY[0x263F089D8] stringWithString:@"Scheduler state: "];
        [v16 appendFormat:@"usage: %@", v4];
        v17 = +[HMIPreference sharedInstance];
        [v17 isIdle];
        v18 = HMFBooleanToString();
        [v16 appendFormat:@", idle: %@", v18];

        BOOL v19 = [MEMORY[0x263F08AB0] processInfo];
        objc_super v20 = [v19 processName];
        [v16 appendFormat:@", %@: (%llu MB | %llu MB)", v20, v83 >> 20, v82 >> 20];

        uint64_t v21 = +[HMIPreference sharedInstance];
        LODWORD(v20) = [v21 BOOLPreferenceForKey:@"logOtherProcessMemorySchedulerState" defaultValue:0];

        if (v20)
        {
          [v16 appendFormat:@", mediaserverd: (%llu MB | %llu MB)", v79 >> 20, v78 >> 20];
          [v16 appendFormat:@", homed: (%llu MB | %llu MB)", v81 >> 20, v80 >> 20];
        }
        unint64_t v22 = +[HMIThermalMonitor sharedInstance];
        [v16 appendFormat:@", thermalLevel: %lu", objc_msgSend(v22, "thermalLevel")];

        [v16 appendFormat:@", peakPowerPressureLevel: %lu", -[HMIVideoAnalyzerScheduler _getPeakPowerPressureLevel](self, "_getPeakPowerPressureLevel")];
        int v23 = HMIIsDebug();
        v24 = @"Release";
        if (v23) {
          v24 = @"Debug";
        }
        [v16 appendFormat:@", build: %@", v24];
        v25 = +[HMIPreference sharedInstance];
        [v16 appendFormat:@", maxConcurrentAnalyzers: %lu", objc_msgSend(v25, "maxConcurrentAnalyzersForSystemResourceUsageLevel:", self->_usageLevel)];

        v26 = (void *)MEMORY[0x22A641C70]();
        uint64_t v27 = self;
        unint64_t v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v95 = v29;
          __int16 v96 = 2112;
          v97 = v16;
          _os_log_impl(&dword_225DC6000, v28, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

          double v11 = v74;
        }

        double v30 = [v11 firstObject];
        double v31 = [v30 state];
        double v32 = [v31 tableColumns];

        v33 = (void *)MEMORY[0x22A641C70]();
        v34 = v27;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = HMFGetLogIdentifier();
          [v32 componentsJoinedByString:@" | "];
          uint64_t v38 = v37 = v4;
          *(_DWORD *)buf = 138543618;
          v95 = v36;
          __int16 v96 = 2112;
          v97 = v38;
          _os_log_impl(&dword_225DC6000, v35, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

          id v4 = v37;
        }

        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 3221225472;
        v75[2] = __38__HMIVideoAnalyzerScheduler__logState__block_invoke_124;
        v75[3] = &unk_26477DF68;
        id v76 = v32;
        v77 = v34;
        id v39 = v32;
        double v11 = v74;
        objc_msgSend(v74, "na_each:", v75);

        unint64_t v15 = 0x26477A000uLL;
      }
      uint64_t v68 = (void *)MEMORY[0x263EFF9A0];
      v93[0] = v4;
      v92[0] = @"usage";
      v92[1] = @"idle";
      v40 = NSNumber;
      v72 = +[HMIPreference sharedInstance];
      v71 = objc_msgSend(v40, "numberWithBool:", objc_msgSend(v72, "isIdle"));
      v93[1] = v71;
      v70 = [MEMORY[0x263F08AB0] processInfo];
      uint64_t v69 = [v70 processName];
      v92[2] = v69;
      v90[0] = @"footprint";
      v41 = [NSNumber numberWithUnsignedLongLong:v83 >> 20];
      v91[0] = v41;
      v90[1] = @"maxFootprint";
      v42 = [NSNumber numberWithUnsignedLongLong:v82 >> 20];
      v91[1] = v42;
      v43 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
      v93[2] = v43;
      v92[3] = @"thermalLevel";
      uint64_t v44 = NSNumber;
      long long v45 = [*(id *)(v15 + 3760) sharedInstance];
      uint64_t v46 = objc_msgSend(v44, "numberWithUnsignedInteger:", objc_msgSend(v45, "thermalLevel"));
      v93[3] = v46;
      v92[4] = @"peakPowerPressureLevel";
      long long v47 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIVideoAnalyzerScheduler _getPeakPowerPressureLevel](self, "_getPeakPowerPressureLevel"));
      v93[4] = v47;
      v92[5] = @"build";
      int v48 = HMIIsDebug();
      uint64_t v49 = @"Release";
      if (v48) {
        uint64_t v49 = @"Debug";
      }
      v93[5] = v49;
      v92[6] = @"analyzers";
      uint64_t v50 = objc_msgSend(v11, "na_map:", &__block_literal_global_162_0);
      v93[6] = v50;
      uint64_t v51 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:7];
      v52 = [v68 dictionaryWithDictionary:v51];

      uint64_t v53 = +[HMIPreference sharedInstance];
      int v54 = [v53 BOOLPreferenceForKey:@"logOtherProcessMemorySchedulerState" defaultValue:0];

      if (v54)
      {
        v88[0] = @"mediaserverd";
        v86[0] = @"footprint";
        uint64_t v55 = [NSNumber numberWithUnsignedLongLong:v79 >> 20];
        v86[1] = @"maxFootprint";
        v87[0] = v55;
        uint64_t v56 = [NSNumber numberWithUnsignedLongLong:v78 >> 20];
        v87[1] = v56;
        uint64_t v57 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
        v88[1] = @"homed";
        v89[0] = v57;
        v84[0] = @"footprint";
        v58 = [NSNumber numberWithUnsignedLongLong:v81 >> 20];
        v84[1] = @"maxFootprint";
        v85[0] = v58;
        uint64_t v59 = [NSNumber numberWithUnsignedLongLong:v80 >> 20];
        v85[1] = v59;
        uint64_t v60 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
        v89[1] = v60;
        uint64_t v61 = [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
        [v52 addEntriesFromDictionary:v61];
      }
      v62 = [MEMORY[0x263F08900] dataWithJSONObject:v52 options:0 error:0];
      uint64_t v63 = (void *)MEMORY[0x22A641C70]();
      uint64_t v64 = objc_alloc_init(HMIVideoAnalyzerSchedulerJSONLogger);
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = HMFGetLogIdentifier();
        __int16 v67 = (void *)[[NSString alloc] initWithData:v62 encoding:4];
        *(_DWORD *)buf = 138543618;
        v95 = v66;
        __int16 v96 = 2112;
        v97 = v67;
        _os_log_impl(&dword_225DC6000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);
      }

      double v10 = v73;
      double v11 = v74;
    }
  }
}

void __38__HMIVideoAnalyzerScheduler__logState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 state];
  [v2 check];
}

void __38__HMIVideoAnalyzerScheduler__logState__block_invoke_124(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 state];
  double v5 = [v4 tableValues];

  int v6 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  unint64_t v15 = __38__HMIVideoAnalyzerScheduler__logState__block_invoke_2;
  unint64_t v16 = &unk_26477DF40;
  id v17 = *(id *)(a1 + 32);
  id v7 = v6;
  id v18 = v7;
  int v8 = (void *)MEMORY[0x22A641C70]([v5 enumerateObjectsUsingBlock:&v13]);
  id v9 = *(id *)(a1 + 40);
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = HMFGetLogIdentifier();
    id v12 = objc_msgSend(v7, "componentsJoinedByString:", @" | ", v13, v14, v15, v16, v17);
    *(_DWORD *)buf = 138543618;
    objc_super v20 = v11;
    __int16 v21 = 2112;
    unint64_t v22 = v12;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);
  }
}

void __38__HMIVideoAnalyzerScheduler__logState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  double v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  unint64_t v6 = [v5 length];

  if ([v11 length] <= v6)
  {
    int v8 = objc_msgSend(&stru_26D98B6C8, "stringByPaddingToLength:withString:startingAtIndex:", v6 - objc_msgSend(v11, "length"), @" ", 0);
    id v9 = *(void **)(a1 + 40);
    double v10 = [v8 stringByAppendingString:v11];
    [v9 addObject:v10];
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    int v8 = [v11 substringToIndex:v6];
    [v7 addObject:v8];
  }
}

id __38__HMIVideoAnalyzerScheduler__logState__block_invoke_160(uint64_t a1, void *a2)
{
  id v2 = [a2 state];
  id v3 = [v2 JSONObject];

  return v3;
}

- (NSArray)analyzers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSPointerArray *)self->_internalAnalyzers allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)ignoreThermalAndSystemResourceUsageLevel
{
  return self->_ignoreThermalAndSystemResourceUsageLevel;
}

- (void)setIgnoreThermalAndSystemResourceUsageLevel:(BOOL)a3
{
  self->_ignoreThermalAndSystemResourceUsageLevel = a3;
}

- (int64_t)usageLevel
{
  return self->_usageLevel;
}

- (unint64_t)maxH264VideoDecoders
{
  return self->_maxH264VideoDecoders;
}

- (void)setMaxH264VideoDecoders:(unint64_t)a3
{
  self->_maxH264VideoDecoders = a3;
}

- (unint64_t)maxH264VideoEncoders
{
  return self->_maxH264VideoEncoders;
}

- (void)setMaxH264VideoEncoders:(unint64_t)a3
{
  self->_maxH264VideoEncoders = a3;
}

- (unint64_t)maxH265VideoEncoders
{
  return self->_maxH265VideoEncoders;
}

- (void)setMaxH265VideoEncoders:(unint64_t)a3
{
  self->_maxH265VideoEncoders = a3;
}

- (NSPointerArray)internalAnalyzers
{
  return (NSPointerArray *)objc_getProperty(self, a2, 72, 1);
}

- (int64_t)logStateCount
{
  return self->_logStateCount;
}

- (void)setLogStateCount:(int64_t)a3
{
  self->_logStateCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAnalyzers, 0);
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong((id *)&self->_tick, 0);
}

@end