@interface CSCarKitUtils
+ (id)sharedInstance;
- (BOOL)_isValidLatencyCorrectionValue:(id)a3;
- (BOOL)isBargeInDisabledForConnectedVehicle;
- (BOOL)isCarPlayConnected;
- (CSCarKitUtils)init;
- (NSDictionary)carPlayCapabilitiesDict;
- (id)_fetchCarCapabilitiesDict;
- (id)_latencyCorrectionSecondsForHeadUnit;
- (id)_userInfoValueForKey:(id)a3;
- (id)potentiallyAddHWLatencyToOption:(id)a3 streamHandle:(unint64_t)a4 voiceController:(id)a5;
- (unint64_t)_delayBecauseCarKitSendsNotificationBeforeCapabilitiesActuallyReady;
- (void)_fetchCarCapabilitiesInBackgroundWithCompletion:(id)a3;
- (void)_invalidateCachedCarPlayCapabilities;
- (void)_recacheCarPlayCapabilitiesWithCompletion:(id)a3;
- (void)_startObservingCarCapabilitiesNotfication:(const __CFString *)a3;
- (void)_updateCarPlayCapabilitiesDict;
- (void)dealloc;
- (void)handleCarCapabilitiesUpdatedWithCompletion:(id)a3;
- (void)handleHeadUnitConnectedWithAsyncCompletion:(id)a3;
@end

@implementation CSCarKitUtils

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlayCapabilitiesDict, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSDictionary)carPlayCapabilitiesDict
{
  return self->_carPlayCapabilitiesDict;
}

- (id)_fetchCarCapabilitiesDict
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1479;
  v9 = __Block_byref_object_dispose__1480;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke;
  v4[3] = &unk_1E62010B0;
  v4[4] = &v5;
  +[CSUtils withElapsedTimeLogging:@"CRFetchCarPlayCapabilities" execute:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke_2;
  v10[3] = &unk_1E61FF638;
  uint64_t v12 = *(void *)(a1 + 32);
  v3 = v2;
  v11 = v3;
  v4 = v10;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v5 = (void (*)(void *))getCRFetchCarPlayCapabilitiesSymbolLoc_ptr;
  v16 = getCRFetchCarPlayCapabilitiesSymbolLoc_ptr;
  if (!getCRFetchCarPlayCapabilitiesSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v18 = __getCRFetchCarPlayCapabilitiesSymbolLoc_block_invoke;
    v19 = &unk_1E62010B0;
    v20 = &v13;
    v6 = (void *)CarKitLibrary();
    uint64_t v7 = dlsym(v6, "CRFetchCarPlayCapabilities");
    *(void *)(v20[1] + 24) = v7;
    getCRFetchCarPlayCapabilitiesSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    uint64_t v5 = (void (*)(void *))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v5)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v5(v4);

  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v3, v8))
  {
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSCarKitUtils _fetchCarCapabilitiesDict]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s CarKit CRFetchCarPlayCapabilities timed out", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __42__CSCarKitUtils__fetchCarCapabilitiesDict__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[CSCarKitUtils _fetchCarCapabilitiesDict]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Error in CRFetchCarPlayCapabilities: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_userInfoValueForKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_carCapabilitiesLock = &self->_carCapabilitiesLock;
  os_unfair_lock_lock(&self->_carCapabilitiesLock);
  id v6 = self->_carPlayCapabilitiesDict;
  os_unfair_lock_unlock(&self->_carCapabilitiesLock);
  if (v6)
  {
    os_unfair_lock_lock(&self->_carCapabilitiesLock);
    carPlayCapabilitiesDict = self->_carPlayCapabilitiesDict;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v8 = (id *)getCRCapabilitiesUserInfoKeySymbolLoc_ptr;
    uint64_t v21 = getCRCapabilitiesUserInfoKeySymbolLoc_ptr;
    if (!getCRCapabilitiesUserInfoKeySymbolLoc_ptr)
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCRCapabilitiesUserInfoKeySymbolLoc_block_invoke;
      v23 = &unk_1E62010B0;
      v24 = &v18;
      v9 = (void *)CarKitLibrary();
      id v10 = dlsym(v9, "CRCapabilitiesUserInfoKey");
      *(void *)(v24[1] + 24) = v10;
      getCRCapabilitiesUserInfoKeySymbolLoc_ptr = *(void *)(v24[1] + 24);
      uint64_t v8 = (id *)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v8)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    id v11 = *v8;
    uint64_t v12 = [(NSDictionary *)carPlayCapabilitiesDict objectForKey:v11];

    os_unfair_lock_unlock(p_carCapabilitiesLock);
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      __int16 v13 = [v12 objectForKey:v4];
      id v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315650;
        *(void *)&buf[4] = "-[CSCarKitUtils _userInfoValueForKey:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        v23 = v4;
        _os_log_debug_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEBUG, "%s returning %@ for key=%@.", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315650;
        *(void *)&buf[4] = "-[CSCarKitUtils _userInfoValueForKey:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v23 = v4;
        _os_log_debug_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEBUG, "%s CarPlayCapabilities userInfo returned bad value: %@; returning nil for key=%@.",
          buf,
          0x20u);
      }
      __int16 v13 = 0;
    }
  }
  else
  {
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&buf[4] = "-[CSCarKitUtils _userInfoValueForKey:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_debug_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEBUG, "%s carPlayCapabilitiesDict is nil, background fetching and returning nil immediately for key=%@.", buf, 0x16u);
    }
    [(CSCarKitUtils *)self _fetchCarCapabilitiesInBackgroundWithCompletion:0];
    __int16 v13 = 0;
  }

  return v13;
}

- (BOOL)isBargeInDisabledForConnectedVehicle
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(CSCarKitUtils *)self isCarPlayConnected])
  {
    v3 = [(CSCarKitUtils *)self _userInfoValueForKey:@"disableBargeInRequest"];
    if (!v3)
    {
      v3 = [(CSCarKitUtils *)self _userInfoValueForKey:@"disableFlexibleFollowup"];
    }
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "-[CSCarKitUtils isBargeInDisabledForConnectedVehicle]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_INFO, "%s disabled = %@", (uint8_t *)&v8, 0x16u);
    }
    char v5 = [v3 BOOLValue];
  }
  else
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      v9 = "-[CSCarKitUtils isBargeInDisabledForConnectedVehicle]";
      _os_log_debug_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEBUG, "%s disabled = 0 because car play is not connected", (uint8_t *)&v8, 0xCu);
    }
    return 0;
  }
  return v5;
}

- (id)_latencyCorrectionSecondsForHeadUnit
{
  return [(CSCarKitUtils *)self _userInfoValueForKey:@"latencyCorrectionSeconds"];
}

- (void)_updateCarPlayCapabilitiesDict
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_carCapabilitiesLock = &self->_carCapabilitiesLock;
  os_unfair_lock_lock(&self->_carCapabilitiesLock);
  id v4 = self->_carPlayCapabilitiesDict;
  os_unfair_lock_unlock(p_carCapabilitiesLock);
  if (v4)
  {
    char v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[CSCarKitUtils _updateCarPlayCapabilitiesDict]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_debug_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEBUG, "%s Using cached CarPlayCapabilities: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v6 = [(CSCarKitUtils *)self _fetchCarCapabilitiesDict];
    uint64_t v7 = CSLogContextFacilityCoreSpeech;
    BOOL v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
      {
        int v11 = 136315394;
        uint64_t v12 = "-[CSCarKitUtils _updateCarPlayCapabilitiesDict]";
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_debug_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEBUG, "%s Caching CarPlayCapabilities dictionary: %@", (uint8_t *)&v11, 0x16u);
      }
      os_unfair_lock_lock(p_carCapabilitiesLock);
      carPlayCapabilitiesDict = self->_carPlayCapabilitiesDict;
      self->_carPlayCapabilitiesDict = v6;
      __int16 v10 = v6;

      os_unfair_lock_unlock(p_carCapabilitiesLock);
    }
    else if (v8)
    {
      int v11 = 136315138;
      uint64_t v12 = "-[CSCarKitUtils _updateCarPlayCapabilitiesDict]";
      _os_log_debug_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEBUG, "%s CRFetchCarPlayCapabilities returned nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)_isValidLatencyCorrectionValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)potentiallyAddHWLatencyToOption:(id)a3 streamHandle:(unint64_t)a4 voiceController:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!+[CSUtils supportEarconRemoval])
  {
    uint64_t v12 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    *(_DWORD *)v29 = 136315138;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    __int16 v13 = "%s Earcon removal feature flag disabled. Not adjusting latency from CS layer.";
LABEL_17:
    _os_log_debug_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEBUG, v13, v29, 0xCu);
    goto LABEL_18;
  }
  if (![(CSCarKitUtils *)self isCarPlayConnected])
  {
    uint64_t v12 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    *(_DWORD *)v29 = 136315138;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    __int16 v13 = "%s Not CarPlay. Not adjusting latency from CS layer.";
    goto LABEL_17;
  }
  if (([v8 potentiallyNeedsCarPlayLatencyCorrection] & 1) == 0)
  {
    uint64_t v12 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    *(_DWORD *)v29 = 136315138;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    __int16 v13 = "%s CarPlay latency correction not applicable. Not adjusting latency from CS layer.";
    goto LABEL_17;
  }
  uint64_t v10 = [v8 startAlertBehavior];
  if (!+[CSUtils supportStateFeedback])
  {
    BOOL v11 = 1;
    if (!v10) {
      goto LABEL_22;
    }
LABEL_14:
    if (!v11) {
      goto LABEL_22;
    }
    uint64_t v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v29 = 136315138;
      *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
      __int16 v13 = "%s Alert behavior is either not Muted or is not Haptic with State Feedback enabled. Not adjusting latency from CS layer.";
      goto LABEL_17;
    }
LABEL_18:
    id v14 = v8;
    goto LABEL_19;
  }
  BOOL v11 = [v8 startAlertBehavior] != 1;
  if (v10) {
    goto LABEL_14;
  }
LABEL_22:
  v16 = [(CSCarKitUtils *)self _latencyCorrectionSecondsForHeadUnit];
  v17 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v29 = 136315394;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    *(_WORD *)&v29[12] = 2112;
    *(void *)&v29[14] = v16;
    _os_log_debug_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEBUG, "%s CarCapabilities latencyCorrectionSeconds: %@", v29, 0x16u);
    v17 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v29 = 136315394;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = v16 != 0;
    _os_log_debug_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEBUG, "%s trackedHeadUnit: %d", v29, 0x12u);
  }
  id v14 = (id)[v8 copy];
  if (v16 && [(CSCarKitUtils *)self _isValidLatencyCorrectionValue:v16]) {
    int v18 = [v16 isEqualToNumber:&unk_1F13B8170] ^ 1;
  }
  else {
    int v18 = 0;
  }
  v19 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v29 = 136315394;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = v18;
    _os_log_debug_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEBUG, "%s correctableHeadUnit: %d", v29, 0x12u);
  }
  if (v16) {
    int v20 = v18;
  }
  else {
    int v20 = 1;
  }
  if (v20 != 1)
  {
    uint64_t v25 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
LABEL_43:
      objc_msgSend(v14, "setStartAlertBehavior:", 2, *(_OWORD *)v29);
      goto LABEL_44;
    }
    *(_DWORD *)v29 = 136315138;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    v27 = "%s HeadUnit is recognized as having problematic latencies, but no correction available. Adding earcon.";
LABEL_42:
    _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, v27, v29, 0xCu);
    goto LABEL_43;
  }
  [v16 floatValue];
  double v22 = v21;
  v23 = +[CSHardwareLatencyHelper sharedInstance];
  char v24 = [v23 addHWLatencyToOption:v8 withCorrection:a4 streamHandle:v9 voiceController:v22];

  if ((v24 & 1) == 0)
  {
    uint64_t v25 = CSLogContextFacilityCoreSpeech;
    BOOL v26 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    if (!v18)
    {
      if (v16)
      {
        if (!v26) {
          goto LABEL_44;
        }
        *(_DWORD *)v29 = 136315138;
        *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
        v28 = "%s HeadUnit is recognized as having problematic latencies, but didn't have a correction, and also failed t"
              "o add AVF latencies";
      }
      else
      {
        if (!v26) {
          goto LABEL_44;
        }
        *(_DWORD *)v29 = 136315138;
        *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
        v28 = "%s HeadUnit is not recognized as having problematic latencies, but we failed to add AVF latencies";
      }
      _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, v28, v29, 0xCu);
      goto LABEL_44;
    }
    if (!v26) {
      goto LABEL_43;
    }
    *(_DWORD *)v29 = 136315138;
    *(void *)&v29[4] = "-[CSCarKitUtils potentiallyAddHWLatencyToOption:streamHandle:voiceController:]";
    v27 = "%s HeadUnit is recognized as having problematic latencies, correction is available but failed to add AVF laten"
          "cies. Adding earcon.";
    goto LABEL_42;
  }
LABEL_44:

LABEL_19:
  return v14;
}

- (BOOL)isCarPlayConnected
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = +[CSAudioRouteChangeMonitor sharedInstance];
  uint64_t v3 = [v2 carPlayConnected];
  id v4 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v6 = NSNumber;
    uint64_t v7 = v4;
    id v8 = [v6 numberWithBool:v3];
    int v9 = 136315394;
    uint64_t v10 = "-[CSCarKitUtils isCarPlayConnected]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_debug_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEBUG, "%s CarPlay connected = %@.", (uint8_t *)&v9, 0x16u);
  }
  return v3;
}

- (void)_recacheCarPlayCapabilitiesWithCompletion:(id)a3
{
  id v4 = a3;
  [(CSCarKitUtils *)self _invalidateCachedCarPlayCapabilities];
  [(CSCarKitUtils *)self _fetchCarCapabilitiesInBackgroundWithCompletion:v4];
}

- (void)_invalidateCachedCarPlayCapabilities
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[CSCarKitUtils _invalidateCachedCarPlayCapabilities]";
    _os_log_debug_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  os_unfair_lock_lock(&self->_carCapabilitiesLock);
  carPlayCapabilitiesDict = self->_carPlayCapabilitiesDict;
  self->_carPlayCapabilitiesDict = 0;

  os_unfair_lock_unlock(&self->_carCapabilitiesLock);
}

- (unint64_t)_delayBecauseCarKitSendsNotificationBeforeCapabilitiesActuallyReady
{
  return dispatch_time(0, 20000000);
}

- (void)_fetchCarCapabilitiesInBackgroundWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(CSCarKitUtils *)self _delayBecauseCarKitSendsNotificationBeforeCapabilitiesActuallyReady];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__CSCarKitUtils__fetchCarCapabilitiesInBackgroundWithCompletion___block_invoke;
  v8[3] = &unk_1E62012B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, queue, v8);
}

uint64_t __65__CSCarKitUtils__fetchCarCapabilitiesInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCarPlayCapabilitiesDict];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)handleCarCapabilitiesUpdatedWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[CSCarKitUtils handleCarCapabilitiesUpdatedWithCompletion:]";
    _os_log_debug_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(CSCarKitUtils *)self _recacheCarPlayCapabilitiesWithCompletion:v4];
}

- (void)handleHeadUnitConnectedWithAsyncCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[CSCarKitUtils handleHeadUnitConnectedWithAsyncCompletion:]";
    _os_log_debug_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(CSCarKitUtils *)self _recacheCarPlayCapabilitiesWithCompletion:v4];
}

- (void)_startObservingCarCapabilitiesNotfication:(const __CFString *)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)CRSessionStatusCapabilitiesUpdatedNotificationCallback, a3, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v7 = "-[CSCarKitUtils dealloc]";
    _os_log_debug_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)CSCarKitUtils;
  [(CSCarKitUtils *)&v5 dealloc];
}

- (CSCarKitUtils)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSCarKitUtils;
  dispatch_semaphore_t v2 = [(CSCarKitUtils *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__CSCarKitUtils_init__block_invoke;
    block[3] = &unk_1E6201288;
    id v4 = v2;
    id v7 = v4;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
    [(CSCarKitUtils *)v4 _startObservingCarCapabilitiesNotfication:@"CARSessionCarCapabilitiesReadyNotification"];
    [(CSCarKitUtils *)v4 _startObservingCarCapabilitiesNotfication:@"CARSessionCarCapabilitiesUpdatedNotification"];
  }
  return v3;
}

void __21__CSCarKitUtils_init__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.CoreSpeech.CSCarKitUtilsQueue", 0);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1511 != -1) {
    dispatch_once(&sharedInstance_onceToken_1511, &__block_literal_global_1512);
  }
  dispatch_queue_t v2 = (void *)sharedInstance_singleton;
  return v2;
}

void __31__CSCarKitUtils_sharedInstance__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = v0;

  dispatch_queue_t v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    id v4 = "+[CSCarKitUtils sharedInstance]_block_invoke";
    __int16 v5 = 2112;
    uint64_t v6 = sharedInstance_singleton;
    _os_log_debug_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEBUG, "%s Created shared instance: %@", (uint8_t *)&v3, 0x16u);
  }
}

@end