void FPCommandBufferCreated(uint64_t a1, uint64_t a2)
{
  +[FPCAMetalLayerState commandBufferCreate:creationTime:]((uint64_t)FPCAMetalLayerState, a1, a2);
}

void FPCommandBufferScheduled(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void FPCommandBufferCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void FPDrawableLifetimeMarkStarted(uint64_t a1, int a2, uint64_t a3, double a4, double a5)
{
}

void FPDrawableLifetimeMarkClientDidPresent(uint64_t a1, uint64_t a2, double a3)
{
}

void FPDrawableLifetimeMarkFinished(uint64_t a1, int a2, uint64_t a3, char a4, double a5, uint64_t a6, void *a7, uint64_t a8, void *a9)
{
}

void ___aggregationTimerSource_block_invoke()
{
  mach_continuous_time();
  v0 = _FPLayerStateSyncQueue();
  dispatch_source_t v1 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v0);
  v2 = (void *)qword_26B1F5120;
  qword_26B1F5120 = (uint64_t)v1;

  dispatch_source_set_timer((dispatch_source_t)qword_26B1F5120, 0, gFPAggregationIntervalNs, gFPAggregationIntervalNs);
  v3 = qword_26B1F5120;

  dispatch_source_set_event_handler(v3, &__block_literal_global_142);
}

void FPCommandBufferCommitted(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();

  +[FPCAMetalLayerState commandBufferCommit:commitTime:]((uint64_t)FPCAMetalLayerState, a1, v2);
}

void ___aggregationTimerSource_block_invoke_2()
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  qword_26B1F50D8 = mach_continuous_time();
  self;
  if (gFPNeedsReportCount)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v0 = _FPGlobalLayerStateDictionary();
    dispatch_source_t v1 = objc_msgSend(v0, "allValues", 0);

    uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v15 != v4) {
            objc_enumerationMutation(v1);
          }
          -[FPCAMetalLayerState _reportState](*(void *)(*((void *)&v14 + 1) + 8 * i));
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v3);
    }

    self;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    uint64_t v7 = v6;
    self;
    if (_MergedGlobals_0 == 1)
    {
      if (qword_26B1F5110 != -1) {
        dispatch_once(&qword_26B1F5110, &__block_literal_global_86);
      }
      if ((byte_26B1F5069 & 1) == 0
        && (*(double *)&qword_26B1F5118 == 0.0 || *(double *)&v7 - *(double *)&qword_26B1F5118 >= 5.0))
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v36 = 0u;
        memset(buffer, 0, sizeof(buffer));
        if (proc_pid_rusage(dword_26B1F506C, 6, buffer))
        {
          byte_26B1F5069 = 1;
          v8 = _fpRusageDebugHandle();
          if (os_signpost_enabled(v8))
          {
            v9 = __error();
            v10 = strerror(*v9);
            *(_DWORD *)buf = 136315138;
            v20 = v10;
            _os_signpost_emit_with_name_impl(&dword_24F441000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RusageFailure", "proc_pid_rusage() failed due to error: '%s'", buf, 0xCu);
          }
        }
        else
        {
          unint64_t v11 = MEMORY[0x25335DFE0]();
          v12 = _fpStateHandle();
          if (os_signpost_enabled(v12))
          {
            *(_DWORD *)buf = 134350848;
            v20 = (char *)*((void *)&v49 + 1);
            __int16 v21 = 2050;
            uint64_t v22 = v54;
            __int16 v23 = 2050;
            double v24 = (double)*((unint64_t *)&v38 + 1) * 0.000000953674316;
            __int16 v25 = 2050;
            double v26 = (double)(unint64_t)v49 * 0.000000953674316;
            __int16 v27 = 2050;
            double v28 = (double)v11 * 0.000000953674316;
            __int16 v29 = 2050;
            double v30 = (double)(unint64_t)v43 * 0.000000953674316;
            __int16 v31 = 2050;
            double v32 = (double)*((unint64_t *)&v43 + 1) * 0.000000953674316;
            __int16 v33 = 2050;
            double v34 = (double)*((unint64_t *)&v48 + 1) * 0.000000953674316;
            _os_signpost_emit_with_name_impl(&dword_24F441000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CAMetalLayerClientSystemResourceUsage", "\nTotal instructions: \t\t%{public, name=ri_instructions}llu instr\nTotal P-core instructions: \t%{public, name=ri_pinstructions}llu pinstr\nPhysical footprint: \t\t%{public, name=ri_phys_footprint}.2fMiB\nPeak Physical footprint: \t%{public, name=ri_lifetime_max_phys_footprint}.2fMiB\nMemory limit headroom:\t\t%{public, name=os_proc_available_memory}.2fMiB\nDiskIO - Reads: \t\t%{public, name=ri_diskio_bytesread}.2fMiB\nDiskIO - Writes: \t\t%{public, name=ri_diskio_byteswritten}.2fMiB\nDiskIO - Logical Writes: \t%{public, name=ri_logical_writes}.2fMiB\n", buf, 0x52u);
          }

          qword_26B1F5118 = v7;
        }
      }
    }
    self;
    if (*(double *)&qword_26B1F50E8 == 0.0 || *(double *)&v7 - *(double *)&qword_26B1F50E8 >= 30.0)
    {
      if (qword_26B1F5108 != -1) {
        dispatch_once(&qword_26B1F5108, &__block_literal_global_74);
      }
      v13 = _fpStateHandle();
      if (os_signpost_enabled(v13))
      {
        LODWORD(buffer[0]) = 138543874;
        *(rusage_info_t *)((char *)buffer + 4) = (rusage_info_t)qword_26B1F50F0;
        WORD2(buffer[1]) = 2114;
        *(rusage_info_t *)((char *)&buffer[1] + 6) = *(rusage_info_t *)algn_26B1F50F8;
        HIWORD(buffer[2]) = 2114;
        buffer[3] = (rusage_info_t)qword_26B1F5100;
        _os_signpost_emit_with_name_impl(&dword_24F441000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CAMetalLayerClientBundleInfo", "Bundle Info:\nBundleID: '%{public, name=BundleID}@'\nBundle Short Version: '%{public, name=BundleShortVersion}@'\nBundle Version: '%{public, name=BundleVersion}@'\n", (uint8_t *)buffer, 0x20u);
      }

      qword_26B1F50E8 = v7;
    }
  }
  qword_26B1F50E0 = qword_26B1F50D8;
}

id _fpStateHandle()
{
  if (_fpStateHandle_onceToken != -1) {
    dispatch_once(&_fpStateHandle_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_fpStateHandle_handle;

  return v0;
}

id _aggregationTimerSource()
{
  if (qword_26B1F5128 != -1) {
    dispatch_once(&qword_26B1F5128, &__block_literal_global_140);
  }
  v0 = (void *)qword_26B1F5120;

  return v0;
}

id _FPGlobalInFlightCommandBufferDictionary()
{
  if (qword_26B1F50B8 != -1) {
    dispatch_once(&qword_26B1F50B8, &__block_literal_global_46);
  }
  v0 = (void *)qword_26B1F50B0;

  return v0;
}

id _FPGlobalLayerStateDictionary()
{
  if (qword_26B1F5088 != -1) {
    dispatch_once(&qword_26B1F5088, &__block_literal_global_13_0);
  }
  v0 = (void *)qword_26B1F5080;

  return v0;
}

id _FPLayerStateSyncQueue()
{
  if (qword_26B1F5078 != -1) {
    dispatch_once(&qword_26B1F5078, &__block_literal_global_1);
  }
  v0 = (void *)qword_26B1F5070;

  return v0;
}

id _fpErrorHandle()
{
  if (_fpErrorHandle_onceToken != -1) {
    dispatch_once(&_fpErrorHandle_onceToken, &__block_literal_global);
  }
  v0 = (void *)_fpErrorHandle_handle;

  return v0;
}

BOOL _shouldEmitErrorSignpost()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  double v1 = Current - *(double *)&qword_26B1F5058;
  if (Current - *(double *)&qword_26B1F5058 < 1.0)
  {
    ++qword_26B1F5060;
  }
  else
  {
    if (qword_26B1F5060)
    {
      uint64_t v2 = _fpErrorHandle();
      if (os_signpost_enabled(v2))
      {
        int v4 = 134218240;
        uint64_t v5 = qword_26B1F5060;
        __int16 v6 = 2048;
        uint64_t v7 = qword_26B1F5058;
        _os_signpost_emit_with_name_impl(&dword_24F441000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampenedErrorCount", "Dampened %llu errors over the last %f seconds due to hysteresis", (uint8_t *)&v4, 0x16u);
      }

      qword_26B1F5060 = 0;
    }
    qword_26B1F5058 = *(void *)&Current;
  }
  return v1 >= 1.0;
}

void FPMetalLayerMarkSetPixelFormat(uint64_t a1, uint64_t a2)
{
}

void FPCAMetalLayerAllocated(uint64_t a1)
{
}

void FPMetalLayerMarkSetSize(uint64_t a1, double a2, double a3)
{
}

uint64_t ___accumulatedGPUTime_block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = a2;
  uint64_t v5 = a3;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v4) {
    double v7 = v4[7];
  }
  if (v5) {
    double v6 = v5[7];
  }
  if (v7 >= v6)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    if (v4) {
      double v10 = v4[7];
    }
    if (v5) {
      double v9 = v5[7];
    }
    uint64_t v8 = v10 > v9;
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

void __FPScaleMachTimestamp_block_invoke()
{
  if (_initTimebase_onceToken != -1) {
    dispatch_once(&_initTimebase_onceToken, &__block_literal_global_2);
  }
}

uint64_t ___fpErrorHandle_block_invoke()
{
  _fpErrorHandle_handle = (uint64_t)os_log_create("com.apple.FramePacing", "ClientErrors");

  return MEMORY[0x270F9A758]();
}

uint64_t ___fpConfigurationHandle_block_invoke()
{
  _fpConfigurationHandle_handle = (uint64_t)os_log_create("com.apple.FramePacing", "Configuration");

  return MEMORY[0x270F9A758]();
}

void _FPCheckEnvironmentVariablesAndDefaultsForConfiguration()
{
  v0 = _FPConfigurationCheckingQueue();
  dispatch_async(v0, &__block_literal_global_27);
}

id _FPConfigurationCheckingQueue()
{
  if (qword_26B1F50A8 != -1) {
    dispatch_once(&qword_26B1F50A8, &__block_literal_global_24);
  }
  v0 = (void *)qword_26B1F50A0;

  return v0;
}

id _fpConfigurationHandle()
{
  if (_fpConfigurationHandle_onceToken != -1) {
    dispatch_once(&_fpConfigurationHandle_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)_fpConfigurationHandle_handle;

  return v0;
}

uint64_t ___fpStateHandle_block_invoke()
{
  _fpStateHandle_handle = (uint64_t)os_log_create("com.apple.FramePacing", "FrameStats");

  return MEMORY[0x270F9A758]();
}

double ___initTimebase_block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1 * 0.000000001;
    gTimebaseRatio = *(void *)&result;
  }
  return result;
}

void FPMetalLayerMarkDealloc(uint64_t a1)
{
}

void FPMetalLayerMarkSetName(uint64_t a1, void *a2)
{
}

id _fpMetalLayerDebugHandle()
{
  if (qword_26B1F5010 != -1) {
    dispatch_once(&qword_26B1F5010, &__block_literal_global_10);
  }
  v0 = (void *)_MergedGlobals;

  return v0;
}

uint64_t ___fpMetalLayerDebugHandle_block_invoke()
{
  _MergedGlobals = (uint64_t)os_log_create("com.apple.FramePacing", "MetalLayerDebug");

  return MEMORY[0x270F9A758]();
}

id _fpDrawableLifetimeDebugHandle()
{
  if (qword_26B1F5020 != -1) {
    dispatch_once(&qword_26B1F5020, &__block_literal_global_13);
  }
  v0 = (void *)qword_26B1F5018;

  return v0;
}

uint64_t ___fpDrawableLifetimeDebugHandle_block_invoke()
{
  qword_26B1F5018 = (uint64_t)os_log_create("com.apple.FramePacing", "DrawableLifetimeDebug");

  return MEMORY[0x270F9A758]();
}

id _fpCommandBufferDebugHandle()
{
  if (qword_26B1F5030 != -1) {
    dispatch_once(&qword_26B1F5030, &__block_literal_global_16);
  }
  v0 = (void *)qword_26B1F5028;

  return v0;
}

uint64_t ___fpCommandBufferDebugHandle_block_invoke()
{
  qword_26B1F5028 = (uint64_t)os_log_create("com.apple.FramePacing", "CommandBufferDebug");

  return MEMORY[0x270F9A758]();
}

id _fpTimeDebugHandle()
{
  if (qword_26B1F5040 != -1) {
    dispatch_once(&qword_26B1F5040, &__block_literal_global_19);
  }
  v0 = (void *)qword_26B1F5038;

  return v0;
}

uint64_t ___fpTimeDebugHandle_block_invoke()
{
  qword_26B1F5038 = (uint64_t)os_log_create("com.apple.FramePacing", "TimeDebug");

  return MEMORY[0x270F9A758]();
}

id _fpRusageDebugHandle()
{
  if (_fpRusageDebugHandle_onceToken != -1) {
    dispatch_once(&_fpRusageDebugHandle_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)_fpRusageDebugHandle_handle;

  return v0;
}

uint64_t ___fpRusageDebugHandle_block_invoke()
{
  _fpRusageDebugHandle_handle = (uint64_t)os_log_create("com.apple.FramePacing", "RusageDebug");

  return MEMORY[0x270F9A758]();
}

id _fpIdleDebugHandle()
{
  if (qword_26B1F5050 != -1) {
    dispatch_once(&qword_26B1F5050, &__block_literal_global_25);
  }
  v0 = (void *)qword_26B1F5048;

  return v0;
}

uint64_t ___fpIdleDebugHandle_block_invoke()
{
  qword_26B1F5048 = (uint64_t)os_log_create("com.apple.FramePacing", "IdleDebug");

  return MEMORY[0x270F9A758]();
}

double FPScaleMachTimestamp(unint64_t a1)
{
  if (FPScaleMachTimestamp_onceToken != -1) {
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
  }
  return *(double *)&gTimebaseRatio * (double)a1;
}

uint64_t FPMachAbsoluteToRescaledMachContinuous(uint64_t a1)
{
  return a1;
}

unint64_t FPTimeIntervalToMachContinuousRescaled(double a1)
{
  if (_FPUnscaleTimeIntervalTimestamp_onceToken != -1) {
    dispatch_once(&_FPUnscaleTimeIntervalTimestamp_onceToken, &__block_literal_global_4_0);
  }
  unint64_t v2 = (unint64_t)(a1 / *(double *)&gTimebaseRatio);
  mach_get_times();
  return v2;
}

double FPRescaledMachTimestampDeltaToTimeInterval(unint64_t a1)
{
  if (FPScaleMachTimestamp_onceToken != -1) {
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
  }
  return *(double *)&gTimebaseRatio * (double)a1;
}

id _FPConfigurationSettingQueue()
{
  if (qword_26B1F5098 != -1) {
    dispatch_once(&qword_26B1F5098, &__block_literal_global_15);
  }
  v0 = (void *)qword_26B1F5090;

  return v0;
}

uint64_t _FPConfigurationSetPerDrawableSignpostingEnabled(char a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  unint64_t v2 = _FPConfigurationSettingQueue();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___FPConfigurationSetPerDrawableSignpostingEnabled_block_invoke;
  v5[3] = &unk_26532AC20;
  char v6 = a1;
  v5[4] = &v7;
  dispatch_sync(v2, v5);

  uint64_t v3 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

double _FPGetCurrentAggregationIntervalSeconds()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v0 = _FPConfigurationSettingQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___FPGetCurrentAggregationIntervalSeconds_block_invoke;
  block[3] = &unk_26532AC48;
  block[4] = &v4;
  dispatch_sync(v0, block);

  double v1 = (double)(unint64_t)v5[3] / 1000000000.0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

double _FPConfigurationSetAggregationInterval(double a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 >= 0.1)
  {
    if (a1 <= 20.0)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v9 = 0;
      uint64_t v5 = _FPConfigurationSettingQueue();
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = ___FPConfigurationSetAggregationInterval_block_invoke;
      v7[3] = &unk_26532AC70;
      v7[4] = buf;
      *(double *)&v7[5] = a1;
      dispatch_sync(v5, v7);

      double v4 = (double)*(unint64_t *)(*(void *)&buf[8] + 24) / 1000000000.0;
      _Block_object_dispose(buf, 8);
      return v4;
    }
    unint64_t v2 = _fpConfigurationHandle();
    if (os_signpost_enabled(v2))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = 0x4034000000000000;
      uint64_t v3 = "Failed to set aggregation interval since requested interval (%{public, name=previous_window_sec}.3fsec) is gr"
           "eater than the max allowed value (%{public, name=min_window_sec}.3fsec)";
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v2 = _fpConfigurationHandle();
    if (os_signpost_enabled(v2))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = 0x3FB999999999999ALL;
      uint64_t v3 = "Failed to set aggregation interval since requested interval (%{public, name=previous_window_sec}.3fsec) is le"
           "ss than the minimum allowed value (%{public, name=min_window_sec}.3fsec)";
LABEL_7:
      _os_signpost_emit_with_name_impl(&dword_24F441000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetAggregationIntervalError", v3, buf, 0x16u);
    }
  }

  return _FPGetCurrentAggregationIntervalSeconds();
}

uint64_t _FPGetCurrentPerDrawableSignpostingEnabled()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v0 = _FPConfigurationSettingQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___FPGetCurrentPerDrawableSignpostingEnabled_block_invoke;
  block[3] = &unk_26532AC48;
  block[4] = &v4;
  dispatch_sync(v0, block);

  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t _FPResetConfigurationToDefault()
{
  _FPConfigurationSetAggregationInterval(1.0);

  return _FPConfigurationSetPerDrawableSignpostingEnabled(0);
}

uint64_t _FPLayerStateClientPresentedInFlightDrawableCount(void *a1)
{
  if (a1) {
    a1 = (void *)a1[25];
  }
  return [a1 count];
}

uint64_t _FPLayerStateAcquiredDrawableCount(void *a1)
{
  if (a1) {
    a1 = (void *)a1[24];
  }
  return [a1 count];
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x270ED8118]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x270EDAA40]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x270EDAD68](*(void *)&pid, *(void *)&flavor, buffer);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}