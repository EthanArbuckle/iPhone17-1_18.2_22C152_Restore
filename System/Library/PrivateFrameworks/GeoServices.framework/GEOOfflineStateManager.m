@interface GEOOfflineStateManager
+ ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3;
+ (BOOL)isCohortAllowed:(id)a3;
+ (BOOL)isOfflineAvailable;
+ (BOOL)isOfflineAvailableLocally;
+ (GEOOfflineStateManager)shared;
+ (void)beginMonitoringAvailability;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentStateForCohortId:(id)a3;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedStateForCohortId:(id)a3;
- (BOOL)_shouldDeleteStateForCohort:(void *)a1;
- (BOOL)cohortId:(id)a3 shouldAttemptFailoverForRequest:(id)a4;
- (id).cxx_construct;
- (id)_stateForCohort:(id)a1;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (uint64_t)_reportNetworkUp:(int)a3 airplaneMode:;
- (uint64_t)_setNeedsStateUpdate;
- (uint64_t)_stateForCohort:(void *)a3 key:;
- (uint64_t)_track:forRequest:usedInterfaces:requestMode:;
- (uint64_t)_updateState:(void *)a3 forKey:(void *)a4 inCohort:;
- (uint64_t)_writeCohortStatesIsolated:(uint64_t)result;
- (unint64_t)currentSuggestedStateForCohortId:(id)a3;
- (unint64_t)subscriptionCount;
- (void)_enumerateResultsInLast:(void *)a3 options:(double)a4 withBlock:;
- (void)_loadAcceptableDurations;
- (void)_networkStateChanged;
- (void)_receivedHeartbeat:(id)a3;
- (void)_reportResponse:(uint64_t)a3 usedInterfaces:(double)a4 requestMode:(uint64_t)a5 forCohortId:(void *)a6 duration:(void *)a7 error:;
- (void)_setNeedsStateUpdateIsolated;
- (void)_setSuggestedState:(uint64_t)a1 reason:(unint64_t)a2 forCohortId:(uint64_t)a3;
- (void)_updateCohortLastUpdatedTimestampIfNecessary:(double)a3 timestamp:;
- (void)_updateSubscriptionsCount;
- (void)airplaneModeChanged;
- (void)checkConnectivityForPeer:(id)a3;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
- (void)dealloc;
- (void)reportResponse:(id)a3 usedInterfaces:(unint64_t)a4 requestMode:(int)a5 forCohortId:(id)a6 duration:(double)a7 error:(id)a8;
- (void)reportTileResponse:(uint64_t)a3 usedInterfaces:(uint64_t)a4 forCohortId:(uint64_t)a5 duration:(void *)a6 error:(void *)a7;
- (void)setSavedState:(id)a3 forCohortId:(id)a4;
- (void)setState:(id)a3 savedState:(id)a4 forCohortId:(id)a5;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)waitForTransitionToActiveState:(id)a3 forCohortId:(id)a4 timeout:(double)a5 callbackQueue:(id)a6 callback:(id)a7;
@end

@implementation GEOOfflineStateManager

+ (BOOL)isCohortAllowed:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock(&stru_1EB29F9BC);
  if (!qword_1EB29F9D0)
  {
    uint64_t v4 = _getValue(GeoOfflineConfig_CohortAllowList, (uint64_t)off_1E9115618, 1, 0, 0, 0);
    v5 = (void *)qword_1EB29F9D8;
    qword_1EB29F9D8 = v4;

    uint64_t v6 = GeoOfflineConfig_CohortAllowList;
    v7 = off_1E9115618;
    global_queue = (void *)geo_get_global_queue();
    uint64_t v9 = _GEOConfigAddBlockListenerForKey(v6, (uint64_t)v7, global_queue, &__block_literal_global_77);
    v10 = (void *)qword_1EB29F9D0;
    qword_1EB29F9D0 = v9;
  }
  char v11 = [(id)qword_1EB29F9D8 containsObject:v3];
  os_unfair_lock_unlock(&stru_1EB29F9BC);

  return v11;
}

+ (BOOL)isOfflineAvailable
{
  +[GEOOfflineStateManager beginMonitoringAvailability]();
  if (_offlineAvailabilityChangedNotifyToken == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_offlineAvailabilityChangedNotifyToken is invalid", buf, 2u);
    }
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v2)
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _offlineAvailabilityChangedNotifyToken != NOTIFY_TOKEN_INVALID", v4, 2u);
      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = _MergedGlobals_227 != 0;
  }
  return v2;
}

+ (void)beginMonitoringAvailability
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self;
  if (_offlineAvailabilityChangedNotifyToken == -1)
  {
    v0 = (const char *)GEOOfflineAvailabilityChangedDarwinNotification;
    global_queue = geo_get_global_queue();
    uint32_t v2 = notify_register_dispatch(v0, &_offlineAvailabilityChangedNotifyToken, global_queue, &__block_literal_global_79);

    int v4 = _offlineAvailabilityChangedNotifyToken;
    if (_offlineAvailabilityChangedNotifyToken == -1)
    {
      v5 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v2;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Unable to install offline availability monitor: %u", (uint8_t *)v6, 8u);
      }
    }
    else
    {
      __53__GEOOfflineStateManager_beginMonitoringAvailability__block_invoke(v3, v4);
    }
  }
}

void __53__GEOOfflineStateManager_beginMonitoringAvailability__block_invoke(int a1, int token)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint32_t state = notify_get_state(token, &v16);
  int v3 = GEOGetOfflineStateLog();
  int v4 = v3;
  if (state)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = state;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Unable to get subscription count state: %u", buf, 8u);
    }
LABEL_24:

    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v16;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEFAULT, "Got new subscription count state: %llu", buf, 0xCu);
  }

  qword_1EB29F9E0 = 0;
  int v5 = v16 != 0;
  self;
  if (_MergedGlobals_227 != v5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v18 = __50__GEOOfflineStateManager__setOfflineAvailability___block_invoke;
    v19 = &__block_descriptor_33_e5_v8__0l;
    char v20 = v5;
    int v4 = v17;
    uint64_t v6 = self;
    int v7 = [v6 isOfflineAvailable];
    int v8 = [v6 isOfflineAvailableLocally];
    v18((uint64_t)v4);
    int v9 = [v6 isOfflineAvailable];
    int v10 = [v6 isOfflineAvailableLocally];
    char v11 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "NO";
      if (v7) {
        v13 = "YES";
      }
      else {
        v13 = "NO";
      }
      if (v9) {
        v14 = "YES";
      }
      else {
        v14 = "NO";
      }
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = v13;
      if (v8) {
        v15 = "YES";
      }
      else {
        v15 = "NO";
      }
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2082;
      v22 = v15;
      if (v10) {
        v12 = "YES";
      }
      __int16 v23 = 2082;
      v24 = v12;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEFAULT, "Offline availability changing from general: %{public}s -> %{public}s / local: %{public}s -> %{public}s", buf, 0x2Au);
    }

    if (v7 != v9 || v8 != v10)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __46__GEOOfflineStateManager__updateAvailability___block_invoke;
      v22 = (const char *)&__block_descriptor_36_e5_v8__0l;
      LOBYTE(v23) = v9;
      HIBYTE(v23) = v7;
      LOBYTE(v24) = v10;
      BYTE1(v24) = v8;
      dispatch_async(MEMORY[0x1E4F14428], buf);
    }
    goto LABEL_24;
  }
}

+ (GEOOfflineStateManager)shared
{
  if (qword_1EB29F9C8 != -1) {
    dispatch_once(&qword_1EB29F9C8, &__block_literal_global_69);
  }
  uint32_t v2 = (void *)qword_1EB29F9C0;

  return (GEOOfflineStateManager *)v2;
}

- (void)reportResponse:(id)a3 usedInterfaces:(unint64_t)a4 requestMode:(int)a5 forCohortId:(id)a6 duration:(double)a7 error:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  id v15 = a6;
  id v14 = a8;
  if (([v15 isEqual:@"com.apple.Maps"] & 1) != 0
    && shouldCountRequest(*(void *)&a3, v10))
  {
    -[GEOOfflineStateManager _reportResponse:usedInterfaces:requestMode:forCohortId:duration:error:]((uint64_t)self, *(void *)&a3, a4, a7, v10, v15, v14);
  }
}

- (uint64_t)_writeCohortStatesIsolated:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    geo_assert_isolated();
    if (a2)
    {
      int v4 = NSNumber;
      GEOGetMonotonicTime();
      uint64_t v6 = [v4 numberWithUnsignedLongLong:(unint64_t)v5];
    }
    else
    {
      uint64_t v6 = 0;
    }
    [*(id *)(v3 + 160) setObject:v6 forKeyedSubscript:@"lastUpdated"];
    if (a2) {

    }
    int v7 = GeoOfflineConfig_CohortStates;
    int v8 = off_1E9115718;
    int v9 = *(void **)(v3 + 160);
    return _setValue(v7, (uint64_t)v8, v9, 1, 0);
  }
  return result;
}

- (void)_receivedHeartbeat:(id)a3
{
  id v7 = [a3 object];
  int v4 = [v7 auditToken];
  double v5 = [v4 offlineCohortId];

  if (+[GEOOfflineStateManager isCohortAllowed:v5])
  {
    GEOGetMonotonicTime();
    -[GEOOfflineStateManager _updateCohortLastUpdatedTimestampIfNecessary:timestamp:]((double *)self, v5, v6);
  }
}

- (void)_updateCohortLastUpdatedTimestampIfNecessary:(double)a3 timestamp:
{
  id v5 = a2;
  if (a1)
  {
    GEOGetMonotonicTime();
    if (a1[19] + 240.0 < v6)
    {
      id v7 = -[GEOOfflineStateManager _stateForCohort:](a1, v5);
      int v8 = [v7 objectForKeyedSubscript:@"lastUpdated"];
      [v8 doubleValue];
      if (v9 < a3)
      {
        uint64_t v10 = (void *)[v7 mutableCopy];
        char v11 = [NSNumber numberWithUnsignedLongLong:(unint64_t)a3];
        [v10 setObject:v11 forKeyedSubscript:@"lastUpdated"];

        id v12 = v5;
        id v13 = v10;
        geo_isolate_sync_data();
      }
    }
  }
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentStateForCohortId:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:v4])
  {
    int v6 = 0;
    int v11 = 0;
    int v9 = 0;
    unsigned int v7 = 0;
    goto LABEL_20;
  }
  uint64_t v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, @"currentState");
  int v6 = BYTE3(v5);
  if (v5 - 1 >= 2) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = v5;
  }
  if (BYTE1(v5) - 1 >= 2) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = BYTE1(v5);
  }
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
LABEL_18:
      int v9 = v8 << 8;
      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v13 = 67109120;
      unsigned int v14 = v7;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v13, 8u);
    }
  }
  if (v8 < 2) {
    goto LABEL_18;
  }
  if (v8 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v13 = 67109120;
      unsigned int v14 = v8;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v13, 8u);
    }
    goto LABEL_18;
  }
  int v9 = 256;
LABEL_19:
  int v11 = 0x10000;
LABEL_20:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v11 | (v6 << 24) | v9 | v7);
}

- (uint64_t)_stateForCohort:(void *)a3 key:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    unsigned int v7 = -[GEOOfflineStateManager _stateForCohort:](a1, v5);
    unsigned int v8 = [v7 objectForKeyedSubscript:v6];
    uint64_t v9 = [v8 unsignedIntValue];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_stateForCohort:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    geo_assert_not_isolated();
    if (+[GEOOfflineStateManager isCohortAllowed:v3])
    {
      uint64_t v6 = 0;
      unsigned int v7 = &v6;
      uint64_t v8 = 0x3032000000;
      uint64_t v9 = __Block_byref_object_copy__34;
      uint64_t v10 = __Block_byref_object_dispose__34;
      id v11 = 0;
      id v5 = v3;
      geo_isolate_sync_data();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        a1 = (id)v7[5];
      }
      else {
        a1 = 0;
      }

      _Block_object_dispose(&v6, 8);
    }
    else
    {
      a1 = (id)MEMORY[0x1E4F1CC08];
    }
  }

  return a1;
}

- (void)reportTileResponse:(uint64_t)a3 usedInterfaces:(uint64_t)a4 forCohortId:(uint64_t)a5 duration:(void *)a6 error:(void *)a7
{
  id v16 = a6;
  id v12 = a7;
  unsigned int v17 = 0;
  if (GEOTileKeyStyle(a4, &v17))
  {
    uint64_t v13 = v17;
    BOOL v14 = v17 - 11 > 0x3E || ((1 << (v17 - 11)) & 0x43808C0004000205) == 0;
    BOOL v15 = !v14 || v17 == 1;
    if (v15 && [v16 isEqual:@"com.apple.Maps"]) {
      -[GEOOfflineStateManager _reportResponse:usedInterfaces:requestMode:forCohortId:duration:error:](a1, (v13 << 32) | 0x100, a5, a2, 0, v16, v12);
    }
  }
}

void __42__GEOOfflineStateManager__stateForCohort___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v5 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[5];
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEFAULT, "Cohort %@ had no previous state, using defaults", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = defaultCohortState();
    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(a1[4] + 160) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[5]];
  }
}

- (unint64_t)currentSuggestedStateForCohortId:(id)a3
{
  id v4 = a3;
  if (+[GEOOfflineStateManager isCohortAllowed:v4])
  {
    uint64_t v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, @"suggestedState");
    if (v5 >= 3) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = v5;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedStateForCohortId:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:v4])
  {
    int v6 = 0;
    int v11 = 0;
    int v9 = 0;
    unsigned int v7 = 0;
    goto LABEL_20;
  }
  uint64_t v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, @"savedState");
  int v6 = BYTE3(v5);
  if (v5 - 1 >= 2) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = v5;
  }
  if (BYTE1(v5) - 1 >= 2) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = BYTE1(v5);
  }
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
LABEL_18:
      int v9 = v8 << 8;
      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v13 = 67109120;
      unsigned int v14 = v7;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v13, 8u);
    }
  }
  if (v8 < 2) {
    goto LABEL_18;
  }
  if (v8 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v13 = 67109120;
      unsigned int v14 = v8;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v13, 8u);
    }
    goto LABEL_18;
  }
  int v9 = 256;
LABEL_19:
  int v11 = 0x10000;
LABEL_20:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v11 | (v6 << 24) | v9 | v7);
}

uint64_t __81__GEOOfflineStateManager__updateCohortLastUpdatedTimestampIfNecessary_timestamp___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 160) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 32);

  return -[GEOOfflineStateManager _writeCohortStatesIsolated:](v3, 1);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == GeoOfflineConfig_RequestTypeAcceptableDurations && a3.var1 == off_1E9115688)
  {
    -[GEOOfflineStateManager _loadAcceptableDurations]((uint64_t)self);
  }
  else if (a3.var0 == GeoOfflineConfig_CohortStates && a3.var1 == off_1E9115718)
  {
    uint64_t v5 = _getValue(GeoOfflineConfig_CohortStates, (uint64_t)off_1E9115718, 1, 0, 0, 0);
    if (![v5 count])
    {
      int v6 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "States cleared externally", buf, 2u);
      }

      geo_isolate_sync_data();
    }
  }
}

void __32__GEOOfflineStateManager_shared__block_invoke()
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (+[GEOPlatform isRunningInGeod])
  {
    v0 = [GEOOfflineStateManager alloc];
    if (v0)
    {
      v85.receiver = v0;
      v85.super_class = (Class)GEOOfflineStateManager;
      id v1 = objc_msgSendSuper2(&v85, sel_init);
      if (v1)
      {
        *((double *)v1 + 15) = GEOConfigGetDouble(GeoOfflineConfig_StateManagerUpdateInterval, (uint64_t)off_1E91156B8);
        uint64_t v2 = geo_isolater_create();
        uint64_t v3 = (void *)*((void *)v1 + 1);
        *((void *)v1 + 1) = v2;

        -[GEOOfflineStateManager _loadAcceptableDurations]((uint64_t)v1);
        uint64_t v4 = geo_dispatch_queue_create_with_qos();
        uint64_t v5 = (void *)*((void *)v1 + 22);
        *((void *)v1 + 22) = v4;

        unint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_StateManagerRingBufferSize, (uint64_t)off_1E9115698);
        unint64_t v7 = UInteger;
        uint64_t v9 = *((void *)v1 + 4);
        uint64_t v8 = *((void *)v1 + 5);
        unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v8 - v9) >> 3);
        unint64_t v11 = UInteger - v10;
        if (UInteger <= v10)
        {
          if (UInteger < v10) {
            *((void *)v1 + 5) = v9 + 40 * UInteger;
          }
        }
        else
        {
          uint64_t v12 = *((void *)v1 + 6);
          if (0xCCCCCCCCCCCCCCCDLL * ((v12 - v8) >> 3) >= v11)
          {
            uint64_t v27 = v8 + 40 * v11;
            uint64_t v28 = 40 * UInteger - 40 * v10;
            do
            {
              *(_DWORD *)(v8 + 32) = 0;
              *(_OWORD *)uint64_t v8 = 0uLL;
              *(_OWORD *)(v8 + 16) = 0uLL;
              v8 += 40;
              v28 -= 40;
            }
            while (v28);
            *((void *)v1 + 5) = v27;
          }
          else
          {
            if (UInteger > 0x666666666666666) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((v12 - v9) >> 3);
            uint64_t v14 = 2 * v13;
            if (2 * v13 <= UInteger) {
              uint64_t v14 = UInteger;
            }
            if (v13 >= 0x333333333333333) {
              unint64_t v15 = 0x666666666666666;
            }
            else {
              unint64_t v15 = v14;
            }
            id v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAARiseTransitSetDetails2>>(v15);
            v18 = &v16[40 * v10];
            v19 = &v16[40 * v7];
            char v20 = v18;
            uint64_t v21 = 40 * v7 - 40 * v10;
            do
            {
              *((_DWORD *)v20 + 8) = 0;
              *(_OWORD *)char v20 = 0uLL;
              *((_OWORD *)v20 + 1) = 0uLL;
              v20 += 40;
              v21 -= 40;
            }
            while (v21);
            v22 = &v16[40 * v17];
            v24 = (char *)*((void *)v1 + 4);
            __int16 v23 = (char *)*((void *)v1 + 5);
            if (v23 != v24)
            {
              do
              {
                long long v25 = *(_OWORD *)(v23 - 40);
                long long v26 = *(_OWORD *)(v23 - 24);
                *((_DWORD *)v18 - 2) = *((_DWORD *)v23 - 2);
                *(_OWORD *)(v18 - 24) = v26;
                *(_OWORD *)(v18 - 40) = v25;
                v18 -= 40;
                v23 -= 40;
              }
              while (v23 != v24);
              __int16 v23 = (char *)*((void *)v1 + 4);
            }
            *((void *)v1 + 4) = v18;
            *((void *)v1 + 5) = v19;
            *((void *)v1 + 6) = v22;
            if (v23) {
              operator delete(v23);
            }
          }
        }
        *((_DWORD *)v1 + 14) = 0;
        v29 = _getValue(GeoOfflineConfig_CohortStates, (uint64_t)off_1E9115718, 1, 0, 0, 0);
        uint64_t v30 = [v29 mutableCopy];
        v31 = (void *)*((void *)v1 + 20);
        *((void *)v1 + 20) = v30;

        GEOGetMonotonicTime();
        double v33 = v32;
        v34 = [*((id *)v1 + 20) objectForKeyedSubscript:@"lastUpdated"];
        v78 = v34;
        [v34 doubleValue];
        BOOL v37 = v35 > v33 || v34 == 0;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id obj = [*((id *)v1 + 20) allKeys];
        uint64_t v38 = [obj countByEnumeratingWithState:&v81 objects:v97 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v82;
          do
          {
            uint64_t v40 = 0;
            do
            {
              if (*(void *)v82 != v39) {
                objc_enumerationMutation(obj);
              }
              v41 = *(NSString **)(*((void *)&v81 + 1) + 8 * v40);
              if (([(NSString *)v41 isEqual:@"lastUpdated"] & 1) == 0)
              {
                v42 = [*((id *)v1 + 20) objectForKeyedSubscript:v41];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  _migrateState(*((NSDictionary **)v1 + 20), v41, &cfstr_Savedstate.isa);
                  _migrateState(*((NSDictionary **)v1 + 20), v41, &cfstr_Currentstate.isa);
                  if (v37 || -[GEOOfflineStateManager _shouldDeleteStateForCohort:](v1, v41))
                  {
                    v43 = [v42 objectForKeyedSubscript:@"currentState"];
                    __int16 v44 = [v43 unsignedIntValue];
                    int v45 = v44;
                    if (v44 < 2u) {
                      goto LABEL_47;
                    }
                    if (v44 != 2)
                    {
                      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
                        goto LABEL_47;
                      }
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&buf[4] = v45;
                      v50 = MEMORY[0x1E4F14500];
                      v51 = "Unreachable reached: invalid offline mode value %x";
LABEL_55:
                      _os_log_fault_impl(&dword_188D96000, v50, OS_LOG_TYPE_FAULT, v51, buf, 8u);
                      goto LABEL_47;
                    }
                    int v46 = HIBYTE(v44);
                    if (HIBYTE(v44) < 2u) {
                      goto LABEL_47;
                    }
                    if (HIBYTE(v44) == 2)
                    {
                      v95 = @"currentState";
                      v96 = v43;
                      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
                      [*((id *)v1 + 20) setObject:v47 forKeyedSubscript:v41];
                    }
                    else
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)&buf[4] = v46;
                        v50 = MEMORY[0x1E4F14500];
                        v51 = "Unreachable reached: invalid offline reason value %x";
                        goto LABEL_55;
                      }
LABEL_47:
                      [*((id *)v1 + 20) setObject:0 forKeyedSubscript:v41];
                    }
                  }
                }
              }
              ++v40;
            }
            while (v38 != v40);
            uint64_t v52 = [obj countByEnumeratingWithState:&v81 objects:v97 count:16];
            uint64_t v38 = v52;
          }
          while (v52);
        }

        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v91 = 3221225472;
        v92 = __41__GEOOfflineStateManager_initForTesting___block_invoke;
        v93 = &unk_1E53D8418;
        id v53 = v1;
        id v94 = v53;
        geo_isolate_sync();
        v54 = GEOGetOfflineStateLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          uint64_t v55 = *((void *)v1 + 20);
          LODWORD(handler) = 138412290;
          *(void *)((char *)&handler + 4) = v55;
          _os_log_impl(&dword_188D96000, v54, OS_LOG_TYPE_INFO, "Initialized with states: %@", (uint8_t *)&handler, 0xCu);
        }

        *((_DWORD *)v53 + 42) = -1;
        v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v56 addObserver:v53 selector:sel__offlineAvailabilityUpdated name:@"GEOOfflineAvailabilityChangedNotification" object:0];

        v57 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v57 addObserver:v53 selector:sel__receivedHeartbeat_ name:@"GEOPeerHeartbeatNotification" object:0];

        if (AppSupportLibraryCore())
        {
          uint64_t v58 = geo_dispatch_queue_create_with_qos();
          v59 = (void *)*((void *)v53 + 9);
          *((void *)v53 + 9) = v58;

          uint64_t v60 = [objc_alloc((Class)getRadiosPreferencesClass()) initWithQueue:*((void *)v53 + 9)];
          v61 = (void *)*((void *)v53 + 8);
          *((void *)v53 + 8) = v60;

          [*((id *)v53 + 8) setDelegate:v53];
        }
        else
        {
          uint64_t global_queue = geo_get_global_queue();
          v63 = (void *)*((void *)v53 + 9);
          *((void *)v53 + 9) = global_queue;

          v64 = GEOGetOfflineStateLog();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_impl(&dword_188D96000, v64, OS_LOG_TYPE_ERROR, "Unable to load AppSupportLibrary, unable to monitor Airplane Mode", (uint8_t *)&handler, 2u);
          }
        }
        [v53 _networkStateChanged];
        v65 = +[GEONetworkObserver sharedNetworkObserver];
        [v65 addNetworkReachableObserver:v53 selector:sel__networkStateChanged];

        objc_initWeak(&location, v53);
        v66 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
        v67 = geo_get_global_queue();
        *(void *)&long long handler = MEMORY[0x1E4F143A8];
        *((void *)&handler + 1) = 3221225472;
        v87 = __41__GEOOfflineStateManager_initForTesting___block_invoke_68;
        v88 = &unk_1E53E0EB0;
        objc_copyWeak(v89, &location);
        notify_register_dispatch(v66, (int *)v53 + 42, v67, &handler);

        -[GEOOfflineStateManager _updateSubscriptionsCount]((uint64_t)v53);
        objc_destroyWeak(v89);
        objc_destroyWeak(&location);
        uint64_t v68 = GeoOfflineConfig_RequestTypeAcceptableDurations;
        v69 = off_1E9115688;
        v70 = (void *)geo_get_global_queue();
        _GEOConfigAddDelegateListenerForKey(v68, (uint64_t)v69, v70, v53);

        uint64_t v71 = GeoOfflineConfig_CohortStates;
        v72 = off_1E9115718;
        v73 = (void *)geo_get_global_queue();
        _GEOConfigAddDelegateListenerForKey(v71, (uint64_t)v72, v73, v53);

        v74 = (void *)geo_get_global_queue();
        GEORegisterPListStateCaptureLegacy();

        v75 = v94;
        id v1 = v53;
      }
    }
    else
    {
      id v1 = 0;
    }
    v76 = (void *)qword_1EB29F9C0;
    qword_1EB29F9C0 = (uint64_t)v1;

    if (!qword_1EB29F9C0)
    {
      v77 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v97 = 0;
        _os_log_impl(&dword_188D96000, v77, OS_LOG_TYPE_FAULT, "Unable to create shared GEOOfflineStateManager", v97, 2u);
      }
    }
  }
}

- (void)_loadAcceptableDurations
{
  if (a1)
  {
    id v1 = _getValue(GeoOfflineConfig_RequestTypeAcceptableDurations, (uint64_t)off_1E9115688, 1, 0, 0, 0);
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__GEOOfflineStateManager__loadAcceptableDurations__block_invoke;
    v7[3] = &unk_1E53E0F68;
    id v3 = v2;
    id v8 = v3;
    [v1 enumerateKeysAndObjectsUsingBlock:v7];
    uint64_t v4 = [v3 objectForKeyedSubscript:&unk_1ED73DC30];

    if (!v4) {
      [v3 setObject:&unk_1ED73DC48 forKeyedSubscript:&unk_1ED73DC30];
    }
    int v6 = (void *)[v3 copy];
    id v5 = v6;
    geo_isolate_sync();
  }
}

- (BOOL)_shouldDeleteStateForCohort:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = -[GEOOfflineStateManager _stateForCohort:](a1, v3);
  id v5 = [v4 objectForKeyedSubscript:@"lastUpdated"];
  if (!v5 || (double Double = GEOConfigGetDouble(GeoOfflineConfig_CohortStateTTL, (uint64_t)off_1E91156E8), Double == 0.0))
  {
    BOOL v10 = 0;
  }
  else
  {
    GEOGetMonotonicTime();
    double v8 = v7;
    [v5 doubleValue];
    BOOL v10 = fmin(fmax(Double, 300.0), 2592000.0) + v9 < v8;
  }

  return v10;
}

uint64_t __41__GEOOfflineStateManager_initForTesting___block_invoke(uint64_t a1)
{
  return -[GEOOfflineStateManager _writeCohortStatesIsolated:](*(void *)(a1 + 32), 0);
}

void __41__GEOOfflineStateManager_initForTesting___block_invoke_68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOOfflineStateManager _updateSubscriptionsCount]((uint64_t)WeakRetained);
}

- (void)_updateSubscriptionsCount
{
  if (a1)
  {
    +[GEOOfflineStateManager beginMonitoringAvailability]();
    if (_offlineAvailabilityChangedNotifyToken == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_offlineAvailabilityChangedNotifyToken is invalid", buf, 2u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _offlineAvailabilityChangedNotifyToken != NOTIFY_TOKEN_INVALID", buf, 2u);
      }
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke;
      v8[3] = &unk_1E53E0F18;
      v8[4] = a1;
      uint64_t v2 = (void *)MEMORY[0x18C120660](v8);
      id v3 = +[GEOMapDataSubscriptionManager sharedManager];
      uint64_t global_queue = (void *)geo_get_global_queue();
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      _DWORD v6[2] = __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke_86;
      v6[3] = &unk_1E53E0F40;
      id v5 = v2;
      id v7 = v5;
      [v3 _fetchFullyDownloadedSubscriptionsOfType:1024 includeOutOfDate:1 callbackQueue:global_queue completionHandler:v6];
    }
  }
}

- (void)dealloc
{
  updateStateTimer = self->_updateStateTimer;
  if (updateStateTimer)
  {
    dispatch_source_cancel(updateStateTimer);
    uint64_t v4 = self->_updateStateTimer;
    self->_updateStateTimer = 0;
  }
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  id v5 = +[GEONetworkObserver sharedNetworkObserver];
  [v5 removeNetworkReachableObserver:self];

  int subscriptionsChangedNotifyToken = self->_subscriptionsChangedNotifyToken;
  if (subscriptionsChangedNotifyToken != -1)
  {
    notify_cancel(subscriptionsChangedNotifyToken);
    self->_int subscriptionsChangedNotifyToken = -1;
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)GEOOfflineStateManager;
  [(GEOOfflineStateManager *)&v8 dealloc];
}

void __42__GEOOfflineStateManager_isCohortAllowed___block_invoke()
{
  os_unfair_lock_lock(&stru_1EB29F9BC);
  uint64_t v0 = _getValue(GeoOfflineConfig_CohortAllowList, (uint64_t)off_1E9115618, 1, 0, 0, 0);
  id v1 = (void *)qword_1EB29F9D8;
  qword_1EB29F9D8 = v0;

  os_unfair_lock_unlock(&stru_1EB29F9BC);
}

void __46__GEOOfflineStateManager__updateAvailability___block_invoke(unsigned __int8 *a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = @"overall";
  id v3 = [NSNumber numberWithBool:a1[32]];
  v9[0] = v3;
  v8[1] = @"overall_changed";
  uint64_t v4 = [NSNumber numberWithBool:a1[33] != a1[32]];
  v9[1] = v4;
  v8[2] = @"local";
  id v5 = [NSNumber numberWithBool:a1[34]];
  v9[2] = v5;
  v8[3] = @"local_changed";
  int v6 = [NSNumber numberWithBool:a1[35] != a1[34]];
  v9[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];
  [v2 postNotificationName:@"GEOOfflineAvailabilityChangedNotification" object:0 userInfo:v7];
}

uint64_t __50__GEOOfflineStateManager__setOfflineAvailability___block_invoke(uint64_t result)
{
  _MergedGlobals_227 = *(unsigned char *)(result + 32);
  return result;
}

+ (BOOL)isOfflineAvailableLocally
{
  +[GEOOfflineStateManager beginMonitoringAvailability]();
  if (_offlineAvailabilityChangedNotifyToken == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_offlineAvailabilityChangedNotifyToken is invalid", buf, 2u);
    }
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v2)
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _offlineAvailabilityChangedNotifyToken != NOTIFY_TOKEN_INVALID", v4, 2u);
      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = _MergedGlobals_227 != 0;
  }
  return v2;
}

void __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v17 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23[0] = v7;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Unable to fetch subscriptions: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v9 += ((unint64_t)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dataTypes", (void)v18) >> 10) & 1;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }

    unint64_t v13 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v8 count];
      *(_DWORD *)buf = 67109376;
      LODWORD(v23[0]) = v14;
      WORD2(v23[0]) = 1024;
      *(_DWORD *)((char *)v23 + 6) = v9;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEFAULT, "Got %d subscriptions & %d usable", buf, 0xEu);
    }

    qword_1EB29F9E8 = [v8 count];
    if (v9 != qword_1EB29F9E0)
    {
      qword_1EB29F9E0 = v9;
      uint32_t v15 = notify_set_state(_offlineAvailabilityChangedNotifyToken, v9);
      if (v15)
      {
        id v16 = GEOGetOfflineStateLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v23[0]) = v15;
          _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "Unable to set subscription count state: %u", buf, 8u);
        }
      }
      else
      {
        notify_post((const char *)GEOOfflineAvailabilityChangedDarwinNotification);
      }
      -[GEOOfflineStateManager _setNeedsStateUpdate](*(void *)(a1 + 32));
    }
  }
}

- (uint64_t)_setNeedsStateUpdate
{
  if (result)
  {
    if (!*(unsigned char *)(result + 128)) {
      return geo_isolate_sync();
    }
  }
  return result;
}

uint64_t __51__GEOOfflineStateManager__updateSubscriptionsCount__block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__GEOOfflineStateManager_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 160);
  *(void *)(v3 + 160) = v2;
}

void __50__GEOOfflineStateManager__loadAcceptableDurations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if ([v5 isEqual:@"default"])
    {
      LODWORD(v7) = 0;
      int v8 = 0;
LABEL_12:
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = [NSNumber numberWithInt:v8 | v7];
      [v11 setObject:v6 forKeyedSubscript:v12];

      goto LABEL_13;
    }
    if ([v5 hasSuffix:@"*"])
    {
      uint64_t v10 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

      id v5 = (id)v10;
    }
    unint64_t v7 = GEODataRequestKindFromString(v5);
    if (v7)
    {
      int v8 = HIDWORD(v7);
      goto LABEL_12;
    }
    uint64_t v9 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Unrecognized request type \"%@\"", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, "RequestTypeAcceptableDurations key (%@) is not of type string or value (%@) is not of type number", (uint8_t *)&v13, 0x16u);
    }
  }

LABEL_13:
}

void __50__GEOOfflineStateManager__loadAcceptableDurations__block_invoke_98(uint64_t a1)
{
}

- (void)_reportResponse:(uint64_t)a3 usedInterfaces:(double)a4 requestMode:(uint64_t)a5 forCohortId:(void *)a6 duration:(void *)a7 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = a6;
  id v12 = a7;
  int v13 = v12;
  if (a1 && a2)
  {
    if (v12)
    {
      if ((objc_msgSend(v12, "_geo_isNetworkError") & 1) == 0) {
        goto LABEL_17;
      }
      uint64_t v14 = 3;
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      uint64_t v28 = __Block_byref_object_copy__34;
      v29 = __Block_byref_object_dispose__34;
      *(void *)uint64_t v30 = 0;
      geo_isolate_sync();
      __int16 v15 = *(void **)(*(void *)&buf[8] + 40);
      id v16 = [NSNumber numberWithInt:HIDWORD(a2) | a2];
      uint64_t v17 = [v15 objectForKeyedSubscript:v16];

      if (v17) {
        goto LABEL_9;
      }
      long long v18 = *(void **)(*(void *)&buf[8] + 40);
      long long v19 = [NSNumber numberWithInt:a2];
      uint64_t v17 = [v18 objectForKeyedSubscript:v19];

      if (v17
        || ([*(id *)(*(void *)&buf[8] + 40) objectForKeyedSubscript:&unk_1ED73DC30],
            (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
LABEL_9:
        [v17 doubleValue];
      }
      else
      {
        double v20 = 10.0;
      }
      if (v20 >= a4) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 2;
      }

      _Block_object_dispose(buf, 8);
    }
    long long v21 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = off_1E53E10D8[v14 - 1];
      GEODataRequestKindAsString(a2);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = GEORequestCounterInterfaceTypesToStrings(a3);
      uint64_t v25 = [v24 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 136447490;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v28 = v26;
      strcpy((char *)&v29, "p\bhash");
      HIBYTE(v29) = 0;
      *(_DWORD *)uint64_t v30 = 138412032;
      *(void *)&v30[4] = v23;
      __int16 v31 = 2114;
      double v32 = v25;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "Tracking %{public}s (%.02fs) request from %{public}@ of type %{mask.hash}@ using: %{public}@", buf, 0x3Eu);
    }
    -[GEOOfflineStateManager _track:forRequest:usedInterfaces:requestMode:]();
  }
LABEL_17:
}

void __96__GEOOfflineStateManager__reportResponse_usedInterfaces_requestMode_forCohortId_duration_error___block_invoke(uint64_t a1)
{
}

- (uint64_t)_track:forRequest:usedInterfaces:requestMode:
{
  return geo_isolate_sync();
}

- (void)airplaneModeChanged
{
  radioPrefsQueue = self->_radioPrefsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__GEOOfflineStateManager_airplaneModeChanged__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(radioPrefsQueue, block);
}

void __45__GEOOfflineStateManager_airplaneModeChanged__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) refresh];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 64) airplaneMode];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[GEONetworkObserver sharedNetworkObserver];
  -[GEOOfflineStateManager _reportNetworkUp:airplaneMode:](v3, [v4 isNetworkReachable], v2);
}

- (uint64_t)_reportNetworkUp:(int)a3 airplaneMode:
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = 5;
    if (a3) {
      uint64_t v3 = 6;
    }
    if (a2) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = v3;
    }
    id v5 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = off_1E53E10F0[v4 - 4];
      int v7 = 136446210;
      int v8 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEFAULT, "Tracking network state change to: %{public}s", (uint8_t *)&v7, 0xCu);
    }

    return -[GEOOfflineStateManager _track:forRequest:usedInterfaces:requestMode:]();
  }
  return result;
}

- (void)_networkStateChanged
{
  radioPrefsQueue = self->_radioPrefsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__GEOOfflineStateManager__networkStateChanged__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(radioPrefsQueue, block);
}

void __46__GEOOfflineStateManager__networkStateChanged__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) refresh];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 64) airplaneMode];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[GEONetworkObserver sharedNetworkObserver];
  -[GEOOfflineStateManager _reportNetworkUp:airplaneMode:](v3, [v4 isNetworkReachable], v2);
}

void __71__GEOOfflineStateManager__track_forRequest_usedInterfaces_requestMode___block_invoke(uint64_t a1)
{
  GEOGetMonotonicTime();
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  unint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(_DWORD *)(a1 + 64);
  if (v5 >= 4 && v5 != 7)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(void *)(v10 + 80) = v2;
    *(void *)(v10 + 88) = v3;
    *(void *)(v10 + 96) = v5;
    *(void *)(v10 + 104) = v4;
    *(_DWORD *)(v10 + 112) = v6;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 32) + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 56);
  *(void *)uint64_t v8 = v2;
  *(void *)(v8 + 8) = v3;
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v4;
  *(_DWORD *)(v8 + 32) = v6;
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = (*(_DWORD *)(*(void *)(a1 + 32) + 56) + 1)
                                           % (0xCCCCCCCCCCCCCCCDLL
                                            * ((uint64_t)(*(void *)(*(void *)(a1 + 32) + 40)
                                                       - *(void *)(*(void *)(a1 + 32) + 32)) >> 3));
  uint64_t v9 = *(void *)(a1 + 32);

  -[GEOOfflineStateManager _setNeedsStateUpdateIsolated](v9);
}

- (void)_setNeedsStateUpdateIsolated
{
  if (a1 && !*(unsigned char *)(a1 + 128))
  {
    *(unsigned char *)(a1 + 128) = 1;
    uint64_t v2 = *(void *)(a1 + 144);
    if (!v2)
    {
      uint64_t global_queue = geo_get_global_queue();
      dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
      unint64_t v5 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v4;

      objc_initWeak(&location, (id)a1);
      int v6 = *(NSObject **)(a1 + 144);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__GEOOfflineStateManager__setNeedsStateUpdateIsolated__block_invoke;
      v14[3] = &unk_1E53D88B0;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v6, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    GEOGetMonotonicTime();
    double v8 = *(double *)(a1 + 120) - (v7 - *(double *)(a1 + 136));
    double v9 = v8 * 1000000000.0;
    uint64_t v10 = *(NSObject **)(a1 + 144);
    BOOL v11 = v8 < 0.2;
    double v12 = 200000000.0;
    if (!v11) {
      double v12 = v9;
    }
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)v12);
    dispatch_source_set_timer(v10, v13, 0xFFFFFFFFFFFFFFFFLL, 0x30D40uLL);
    if (!v2) {
      dispatch_activate(*(dispatch_object_t *)(a1 + 144));
    }
  }
}

- (void)waitForTransitionToActiveState:(id)a3 forCohortId:(id)a4 timeout:(double)a5 callbackQueue:(id)a6 callback:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  dispatch_time_t v13 = a6;
  uint64_t v14 = (void (**)(id, uint64_t))a7;
  id v15 = GEOGetOfflineStateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Asked to wait for cohort %{public}@ to enter desired state", (uint8_t *)&buf, 0xCu);
  }

  if ((*((unsigned int (**)(id, void))v11 + 2))(v11, [(GEOOfflineStateManager *)self activeStateForCohortId:v12]))
  {
    id v16 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "Cohort is already in desired state", (uint8_t *)&buf, 2u);
    }

    v14[2](v14, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v45 = 0x3812000000;
    int v46 = __Block_byref_object_copy__102;
    v47 = __Block_byref_object_dispose__103;
    v48 = "";
    uint64_t v49 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__34;
    v41 = __Block_byref_object_dispose__34;
    id v42 = 0;
    uint64_t v17 = GeoOfflineConfig_CohortStates;
    long long v18 = off_1E9115718;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke;
    v30[3] = &unk_1E53E0FB8;
    v30[4] = self;
    id v19 = v12;
    id v31 = v19;
    id v32 = v11;
    v34 = &v37;
    p_long long buf = &buf;
    objc_copyWeak(&v36, &location);
    double v20 = v14;
    uint64_t v33 = v20;
    uint64_t v21 = _GEOConfigAddBlockListenerForKey(v17, (uint64_t)v18, v13, v30);
    v22 = (void *)v38[5];
    v38[5] = v21;

    double Double = GEOConfigGetDouble(GeoOfflineConfig_OnlineOfflineFailoverTimeout, (uint64_t)off_1E91158D8);
    dispatch_time_t v24 = dispatch_time(0, (uint64_t)(Double * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_105;
    block[3] = &unk_1E53E1008;
    uint64_t v28 = &buf;
    v29 = &v37;
    id v26 = v19;
    uint64_t v27 = v20;
    dispatch_after(v24, v13, block);

    objc_destroyWeak(&v36);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);
  }
}

void __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [*(id *)(a1 + 32) activeStateForCohortId:*(void *)(a1 + 40)]))
  {
    GEOConfigRemoveBlockListener(*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8) + 48;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2;
    v5[3] = &unk_1E53E0F90;
    objc_copyWeak(&v8, (id *)(a1 + 80));
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 56);
    GEOOnce(v4, v5);

    objc_destroyWeak(&v8);
  }
}

void __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Cohort %{public}@ has entered desired state", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_105(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8) + 48;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2_106;
  v3[3] = &unk_1E53E0FE0;
  uint64_t v6 = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  GEOOnce(v2, v3);
}

uint64_t __100__GEOOfflineStateManager_waitForTransitionToActiveState_forCohortId_timeout_callbackQueue_callback___block_invoke_2_106(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  GEOConfigRemoveBlockListener(*(void **)(*(void *)(a1[6] + 8) + 40));
  uint64_t v2 = *(void *)(a1[6] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = GEOGetOfflineStateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Timed out waiting for cohort '%{public}@' failed to transition to offline mode", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)checkConnectivityForPeer:(id)a3
{
  id v4 = a3;
  connectivityCheckQueue = self->_connectivityCheckQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__GEOOfflineStateManager_checkConnectivityForPeer___block_invoke;
  v7[3] = &unk_1E53D81E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectivityCheckQueue, v7);
}

void __51__GEOOfflineStateManager_checkConnectivityForPeer___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 176));
    if (*(void *)(v1 + 184))
    {
      uint64_t v3 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Refusing to check connectivity, still performing previous check", (uint8_t *)&buf, 2u);
      }
      goto LABEL_32;
    }
    id v4 = [v2 auditToken];
    uint64_t v3 = [v4 offlineCohortId];

    if ([v3 length])
    {
      if (+[GEOOfflineStateManager isCohortAllowed:v3])
      {
        if ((unsigned __int16)[(id)v1 currentStateForCohortId:v3] == 258)
        {
          uint64_t v31 = 0;
          id v32 = &v31;
          uint64_t v33 = 0x2020000000;
          char v34 = 0;
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          uint64_t v40 = __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke;
          v41 = &unk_1E53DDE00;
          uint64_t v42 = v1;
          v43 = &v31;
          geo_isolate_sync();
          if (*((unsigned char *)v32 + 24))
          {
            uint64_t v5 = GEOGetOfflineStateLog();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v22 = 0;
              _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Refusing to check connectivity, network is down", v22, 2u);
            }
          }
          else
          {
            double Double = GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityInterval, (uint64_t)off_1E9115938);
            if (Double != 0.0)
            {
              double v8 = fmin(fmax(Double, 30.0), 3600.0)
                 - (GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityTimeout, (uint64_t)off_1E9115948)
                  + 1.0);
              uint64_t v27 = 0;
              uint64_t v28 = (double *)&v27;
              uint64_t v29 = 0x2020000000;
              uint64_t v30 = 0;
              *(void *)v22 = MEMORY[0x1E4F143A8];
              uint64_t v23 = 3221225472;
              dispatch_time_t v24 = __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke_107;
              uint64_t v25 = &unk_1E53E1030;
              id v26 = &v27;
              -[GEOOfflineStateManager _enumerateResultsInLast:options:withBlock:](v1, 2, v22, v8 + 0.5);
              double v9 = v28[3];
              if (v9 == 0.0 || v9 >= v8)
              {
                uint64_t v10 = GEOGetURLWithSource(64, 0);
                id v12 = +[GEORequestCounter sharedCounter];
                dispatch_time_t v13 = [v2 auditToken];
                uint64_t v14 = [v12 requestCounterTicketForType:2860 auditToken:v13 traits:0];

                id v15 = [GEODataRequest alloc];
                id v16 = [v2 auditToken];
                uint64_t v17 = [(GEODataRequest *)v15 initWithKind:2860 URL:v10 auditToken:v16 timeoutInterval:0 additionalHTTPHeaders:0 bodyData:0 userAgent:GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityTimeout, (uint64_t)off_1E9115948) entityTag:0 cachedData:0 requestCounterTicket:v14 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:2];

                long long v18 = +[GEODataURLSession sharedDataURLSession];
                uint64_t v19 = [v18 taskWithRequest:v17 delegate:v1 delegateQueue:*(void *)(v1 + 176)];
                uint64_t v21 = *(void **)(v1 + 184);
                double v20 = (id *)(v1 + 184);
                *double v20 = (id)v19;

                [*v20 start];
              }
              else
              {
                uint64_t v10 = GEOGetOfflineStateLog();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v11 = *((void *)v28 + 3);
                  *(_DWORD *)double v35 = 134218240;
                  uint64_t v36 = v11;
                  __int16 v37 = 2048;
                  double v38 = v8;
                  _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEFAULT, "Refusing to check connectivity, only %f of %f seconds have elapsed since last check / online event", v35, 0x16u);
                }
              }

              _Block_object_dispose(&v27, 8);
              goto LABEL_31;
            }
            uint64_t v5 = GEOGetOfflineStateLog();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v22 = 0;
              _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Refusing to check connectivity, disabled", v22, 2u);
            }
          }

LABEL_31:
          _Block_object_dispose(&v31, 8);
          goto LABEL_32;
        }
        id v6 = GEOGetOfflineStateLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v3;
          _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Refusing to check connectivity, cohort %@ is not in OfflineAuto state", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        id v6 = GEOGetOfflineStateLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v3;
          _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_FAULT, "Refusing to check connectivity for invalid cohort: %@.", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      id v6 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v2;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_FAULT, "Refusing to check connectivity for: %@", (uint8_t *)&buf, 0xCu);
      }
    }

LABEL_32:
  }
}

uint64_t __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(double *)(v1 + 80) != 0.0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (*(void *)(v1 + 96) > 7uLL) | (0x60u >> *(void *)(v1 + 96)) & 1;
  }
  return result;
}

uint64_t __52__GEOOfflineStateManager__checkConnectivityForPeer___block_invoke_107(uint64_t result, uint64_t a2, unsigned char *a3, double a4)
{
  if ((*(unsigned char *)(a2 + 25) & 1) == 0)
  {
    unint64_t v4 = *(void *)(a2 + 16);
    if (v4 < 4 || v4 == 7)
    {
      *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
      *a3 = 1;
    }
  }
  return result;
}

- (void)_enumerateResultsInLast:(void *)a3 options:(double)a4 withBlock:
{
  int v7 = a3;
  if (a1)
  {
    GEOGetMonotonicTime();
    double v9 = v8;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x4812000000;
    uint64_t v30 = __Block_byref_object_copy__112;
    uint64_t v31 = __Block_byref_object_dispose__113;
    id v32 = "";
    uint64_t v33 = 0;
    char v34 = 0;
    uint64_t v35 = 0;
    uint64_t v23 = 0;
    dispatch_time_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 0;
    geo_isolate_sync();
    unint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((v28[7] - v28[6]) >> 3);
    unsigned int v12 = *((_DWORD *)v24 + 6);
    if ((a2 & 2) != 0)
    {
      unint64_t v18 = (v12 + 1) % v11;
      do
      {
        uint64_t v19 = (double *)(v28[6] + 40 * v12);
        v10.n128_f64[0] = v9 - *v19;
        if (*v19 != 0.0 && v10.n128_f64[0] < a4) {
          v7[2](v7, v10);
        }
        uint64_t v21 = v12;
        if (v12) {
          int v22 = v12;
        }
        else {
          int v22 = v11;
        }
        unsigned int v12 = v22 - 1;
      }
      while (v18 != v21);
    }
    else
    {
      if (v12) {
        unint64_t v13 = *((unsigned int *)v24 + 6);
      }
      else {
        unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((v28[7] - v28[6]) >> 3);
      }
      unint64_t v14 = v13 - 1;
      do
      {
        id v15 = (double *)(v28[6] + 40 * v12);
        v10.n128_f64[0] = v9 - *v15;
        if (*v15 != 0.0 && v10.n128_f64[0] < a4) {
          v7[2](v7, v10);
        }
        uint64_t v17 = v12;
        unsigned int v12 = (v12 + 1) % v11;
      }
      while (v14 != v17);
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
    if (v33)
    {
      char v34 = v33;
      operator delete(v33);
    }
  }
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v6 = a3;
  int v7 = (GEODataURLSessionTask *)a4;
  double v8 = v7;
  if (self->_connectivityCheckTask == v7)
  {
    self->_connectivityCheckTask = 0;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: task == _connectivityCheckTask", v9, 2u);
  }
}

- (unint64_t)subscriptionCount
{
  return qword_1EB29F9E0;
}

void __68__GEOOfflineStateManager__enumerateResultsInLast_options_withBlock___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v4 = *(unsigned char **)(v2 + 32);
  uint64_t v3 = *(unsigned char **)(v2 + 40);
  uint64_t v5 = v3 - v4;
  if (v3 == v4)
  {
    double v8 = 0;
    double v9 = 0;
    id v6 = 0;
  }
  else
  {
    if (0xCCCCCCCCCCCCCCCDLL * (v5 >> 3) >= 0x666666666666667) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    id v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAARiseTransitSetDetails2>>(0xCCCCCCCCCCCCCCCDLL * (v5 >> 3));
    double v8 = &v6[40 * v7];
    memmove(v6, v4, v5 - 4);
    double v9 = &v6[8 * (v5 >> 3)];
  }
  __n128 v10 = *(void **)(a1[5] + 8);
  unint64_t v11 = (void *)v10[6];
  if (v11)
  {
    v10[7] = v11;
    operator delete(v11);
  }
  v10[6] = v6;
  v10[7] = v9;
  v10[8] = v8;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(a1[4] + 56);
}

uint64_t __45__GEOOfflineStateManager__lastEventTimestamp__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 32);
  if (!v2) {
    int v2 = -858993459 * ((unint64_t)(*(void *)(v1 + 40) - v3) >> 3);
  }
  double v4 = *(double *)(v3 + 40 * (v2 - 1));
  if (v4 != 0.0)
  {
    *(double *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v4;
    uint64_t v1 = *(void *)(result + 32);
  }
  double v5 = *(double *)(v1 + 80);
  uint64_t v6 = *(void *)(*(void *)(result + 40) + 8);
  if (v5 > *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = v5;
  }
  return result;
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  v38[4] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__34;
  uint64_t v29 = __Block_byref_object_dispose__34;
  objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__GEOOfflineStateManager_captureStatePlistWithHints___block_invoke;
  v24[3] = &unk_1E53E1030;
  v24[4] = &v25;
  -[GEOOfflineStateManager _enumerateResultsInLast:options:withBlock:]((uint64_t)self, 0, v24, 1.79769313e308);
  v5 = double v4 = (void *)v26[5];
  [v4 addObject:v5];

  double Current = CFAbsoluteTimeGetCurrent();
  GEOGetMonotonicTime();
  double v8 = v7;
  v38[0] = v26[5];
  v37[0] = @"results";
  v37[1] = @"time";
  v35[0] = @"cf_time";
  double v9 = [NSNumber numberWithDouble:Current];
  v35[1] = @"monotonic";
  v36[0] = v9;
  __n128 v10 = [NSNumber numberWithDouble:v8];
  v36[1] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  v38[1] = v11;
  v37[2] = @"listeners";
  if (_offlineAvailabilityChangedNotifyToken == -1) {
    unsigned int v12 = @"NO";
  }
  else {
    unsigned int v12 = @"YES";
  }
  v33[0] = @"availability";
  v33[1] = @"subscriptions";
  if (self->_subscriptionsChangedNotifyToken == -1) {
    unint64_t v13 = @"NO";
  }
  else {
    unint64_t v13 = @"YES";
  }
  v34[0] = v12;
  v34[1] = v13;
  v33[2] = @"radioPreferences";
  if (self->_radiosPrefs) {
    unint64_t v14 = @"YES";
  }
  else {
    unint64_t v14 = @"NO";
  }
  v34[2] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  v38[2] = v15;
  v37[3] = @"states";
  v31[0] = @"totalSubscriptions";
  id v16 = [NSNumber numberWithUnsignedLongLong:qword_1EB29F9E8];
  v32[0] = v16;
  v31[1] = @"usableSubscriptions";
  uint64_t v17 = [NSNumber numberWithUnsignedLongLong:qword_1EB29F9E0];
  unint64_t v18 = (void *)v17;
  if (_MergedGlobals_227) {
    uint64_t v19 = @"YES";
  }
  else {
    uint64_t v19 = @"NO";
  }
  v32[1] = v17;
  v32[2] = v19;
  v31[2] = @"isAvailable";
  v31[3] = @"isEnabled";
  v31[4] = @"needsUpdate";
  if (self->_needsStateUpdate) {
    double v20 = @"YES";
  }
  else {
    double v20 = @"NO";
  }
  v32[3] = @"YES";
  v32[4] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:5];
  v38[3] = v21;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4];

  _Block_object_dispose(&v25, 8);

  return v22;
}

void __53__GEOOfflineStateManager_captureStatePlistWithHints___block_invoke(uint64_t a1, _anonymous_namespace_::Result *this)
{
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");
}

uint64_t __46__GEOOfflineStateManager__setNeedsStateUpdate__block_invoke(uint64_t a1)
{
  return -[GEOOfflineStateManager _setNeedsStateUpdateIsolated](*(void *)(a1 + 32));
}

void __54__GEOOfflineStateManager__setNeedsStateUpdateIsolated__block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (long long *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_99;
  }
  geo_isolate_sync();
  *(void *)uint64_t v50 = 0;
  *(void *)&v50[8] = v50;
  *(void *)&v50[16] = 0x2020000000;
  uint64_t v51 = 0;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  uint64_t v33 = __45__GEOOfflineStateManager__lastEventTimestamp__block_invoke;
  char v34 = &unk_1E53DDE00;
  uint64_t v35 = WeakRetained;
  uint64_t v36 = (__CFString *)v50;
  geo_isolate_sync();
  double v2 = *(double *)(*(void *)&v50[8] + 24);
  _Block_object_dispose(v50, 8);
  -[GEOOfflineStateManager _updateCohortLastUpdatedTimestampIfNecessary:timestamp:]((double *)WeakRetained, @"com.apple.Maps", v2);
  id v3 = @"com.apple.Maps";
  if (-[GEOOfflineStateManager _shouldDeleteStateForCohort:](WeakRetained, @"com.apple.Maps"))
  {
    double v4 = @"com.apple.Maps";
    if (+[GEOOfflineStateManager isCohortAllowed:@"com.apple.Maps"])
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      uint64_t v33 = __47__GEOOfflineStateManager__clearStateForCohort___block_invoke;
      char v34 = &unk_1E53D81E8;
      uint64_t v35 = WeakRetained;
      double v5 = @"com.apple.Maps";
      uint64_t v36 = @"com.apple.Maps";
      geo_isolate_sync_data();
    }
  }

  double Double = GEOConfigGetDouble(GeoOfflineConfig_StateManagerExamineInterval, (uint64_t)off_1E91156A8);
  double v7 = GEOConfigGetDouble(GeoOfflineConfig_StateManagerMinimumFailureAge, (uint64_t)off_1E91156C8);
  uint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_StateManagerVerbosity, (uint64_t)off_1E91156D8);
  unint64_t v9 = UInteger;
  uint64_t v10 = *((void *)WeakRetained + 12);
  if (v10 != 6)
  {
    int v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    int v46 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    unsigned int v43 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    int v62 = 0;
    uint64_t v61 = 0;
    char v42 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3321888768;
    uint64_t v33 = __38__GEOOfflineStateManager__updateState__block_invoke;
    char v34 = &__block_descriptor_88_ea8_32c51_ZTSKZ38__GEOOfflineStateManager__updateState_E3__0_e41_v32__0r__Result_d___i___iii__QQi_8d16_B24l;
    uint64_t v35 = &v47;
    uint64_t v36 = (__CFString *)&v44;
    __int16 v37 = &v43;
    double v38 = &v59;
    uint64_t v39 = &v42;
    double v40 = v7;
    uint64_t v41 = UInteger;
    -[GEOOfflineStateManager _enumerateResultsInLast:options:withBlock:]((uint64_t)WeakRetained, 0, buf, Double);
    if (v9 >= 2)
    {
      unsigned int v12 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t v50 = 67110912;
        *(_DWORD *)&v50[4] = v43;
        *(_WORD *)&v50[8] = 2048;
        *(double *)&v50[10] = Double;
        *(_WORD *)&v50[18] = 1024;
        *(_DWORD *)&v50[20] = HIDWORD(v59);
        LOWORD(v51) = 1024;
        *(_DWORD *)((char *)&v51 + 2) = v60;
        HIWORD(v51) = 1024;
        int v52 = HIDWORD(v60);
        __int16 v53 = 1024;
        int v54 = v61;
        __int16 v55 = 1024;
        int v56 = HIDWORD(v61);
        __int16 v57 = 1024;
        int v58 = v62;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "Read %u events from the last %.02fs with success: %u, slow: %u, failed: %u. Network status up: %u down: %u airplane: %u", v50, 0x36u);
      }
    }
    if (v43 && !v60 && !v42)
    {
      if (!v9)
      {
        unint64_t v14 = 1;
        uint64_t v15 = 1;
        goto LABEL_39;
      }
      unint64_t v13 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v50 = 0;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "All clear, suggesting online", v50, 2u);
      }
      unint64_t v14 = 1;
LABEL_23:

      uint64_t v15 = v14;
LABEL_39:
      -[GEOOfflineStateManager _setSuggestedState:reason:forCohortId:]((uint64_t)WeakRetained, v14, v15);
      goto LABEL_99;
    }
    double v16 = *(double *)&v47;
    if (v42) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = (void)v48 == 3;
    }
    BOOL v18 = v17 || *(double *)&v47 == 0.0;
    if (v18 && *(double *)&v44 != 0.0 && (unint64_t)(v45 - 3) >= 5 && (void)v45)
    {
      unint64_t v13 = GEOGetOfflineStateLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        unint64_t v14 = 2;
        goto LABEL_23;
      }
      *(_WORD *)uint64_t v50 = 0;
      double v20 = "Last event successfully failed-over to offline, suggesting offline";
      unint64_t v14 = 2;
      uint64_t v21 = v13;
      os_log_type_t v22 = OS_LOG_TYPE_INFO;
      goto LABEL_66;
    }
    if (*(double *)&v47 != 0.0)
    {
      switch((uint64_t)v48)
      {
        case 0:
        case 4:
        case 5:
        case 6:
        case 7:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)uint64_t v50 = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid network event found in lastResult", v50, 2u);
          }
          goto LABEL_72;
        case 1:
          if (!HIDWORD(v59) && v60 < 2) {
            goto LABEL_72;
          }
          if (!v9) {
            goto LABEL_89;
          }
          uint64_t v19 = GEOGetOfflineStateLog();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_56;
          }
          *(_WORD *)uint64_t v50 = 0;
          uint64_t v23 = "Conditions improving, suggesting online";
          goto LABEL_55;
        case 2:
          if (v43 < 2) {
            goto LABEL_72;
          }
          if (HIDWORD(v60) <= (HIDWORD(v59) + v60))
          {
            if (v10 != 4) {
              goto LABEL_72;
            }
            if (!v9)
            {
LABEL_89:
              uint64_t v15 = 1;
              goto LABEL_90;
            }
            uint64_t v19 = GEOGetOfflineStateLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)uint64_t v50 = 0;
              uint64_t v23 = "Conditions slow with few failures and network is up, suggesting online";
LABEL_55:
              _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, v23, v50, 2u);
            }
LABEL_56:
            uint64_t v15 = 1;
            goto LABEL_45;
          }
          if (!v9)
          {
            unint64_t v14 = 2;
            uint64_t v15 = 2;
            goto LABEL_39;
          }
          unint64_t v13 = GEOGetOfflineStateLog();
          unint64_t v14 = 2;
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
          *(_WORD *)uint64_t v50 = 0;
          double v20 = "Conditions slow with little success, suggesting offline";
LABEL_65:
          unint64_t v14 = 2;
          uint64_t v21 = v13;
          os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
          break;
        case 3:
          if ((v60 + HIDWORD(v60)) < 2) {
            goto LABEL_72;
          }
          unint64_t v13 = GEOGetOfflineStateLog();
          unint64_t v14 = 2;
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_23;
          }
          *(_WORD *)uint64_t v50 = 0;
          double v20 = "Conditions degrading, suggesting offline";
          goto LABEL_65;
        default:
          goto LABEL_72;
      }
LABEL_66:
      _os_log_impl(&dword_188D96000, v21, v22, v20, v50, 2u);
      goto LABEL_23;
    }
    if (v10 == 4)
    {
      if (v9)
      {
        uint64_t v19 = GEOGetOfflineStateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v50 = 0;
          _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "No events available but network is up, suggesting online", v50, 2u);
        }
        uint64_t v15 = 3;
LABEL_45:
      }
      else
      {
        uint64_t v15 = 3;
      }
LABEL_90:
      uint64_t v30 = -[GEOOfflineStateManager _stateForCohort:key:](WeakRetained, @"com.apple.Maps", @"reason");
      if (v42) {
        -[GEOOfflineStateManager _setNeedsStateUpdate]((uint64_t)WeakRetained);
      }
      unint64_t v14 = 1;
      if (v15 == 1 || v30 != 2) {
        goto LABEL_39;
      }
      if (!v9) {
        goto LABEL_99;
      }
      dispatch_time_t v24 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v50 = 0;
        uint64_t v25 = "Last suggestion was due to failing requests, supressing online suggestion";
        goto LABEL_97;
      }
      goto LABEL_98;
    }
LABEL_72:
    if (!objc_msgSend(WeakRetained, "currentSuggestedStateForCohortId:", @"com.apple.Maps", v16))
    {
      BOOL v26 = v10 == 4;
      if (v10 == 4) {
        unint64_t v27 = 1;
      }
      else {
        unint64_t v27 = 2 * (v10 == 5);
      }
      if (v26) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = 4;
      }
      if (v9)
      {
        uint64_t v28 = GEOGetOfflineStateLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v29 = GEOOfflineSuggestedStateAsString(v27);
          *(_DWORD *)uint64_t v50 = 138412290;
          *(void *)&v50[4] = v29;
          _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_DEBUG, "Conditions indeterminite, no new or previous suggestion, using current network state to suggest %@", v50, 0xCu);
        }
      }
      if (v27 == 1) {
        goto LABEL_90;
      }
      if (v27)
      {
        unint64_t v14 = 2;
        goto LABEL_39;
      }
    }
    if (!v9) {
      goto LABEL_99;
    }
    dispatch_time_t v24 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v50 = 0;
      uint64_t v25 = "Conditions indeterminite, no new suggestion";
LABEL_97:
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, v25, v50, 2u);
    }
LABEL_98:

    goto LABEL_99;
  }
  if (UInteger)
  {
    unint64_t v11 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Device is in Airplane Mode, suggesting offline", buf, 2u);
    }
  }
  -[GEOOfflineStateManager _setSuggestedState:reason:forCohortId:]((uint64_t)WeakRetained, 2uLL, 4);
LABEL_99:
}

uint64_t __54__GEOOfflineStateManager__setNeedsStateUpdateIsolated__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
  uint64_t result = GEOGetMonotonicTime();
  *(void *)(*(void *)(a1 + 32) + 136) = v3;
  return result;
}

- (void)_setSuggestedState:(uint64_t)a1 reason:(unint64_t)a2 forCohortId:(uint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"com.apple.Maps";
  -[GEOOfflineStateManager _updateState:forKey:inCohort:](a1, a3, @"reason", @"com.apple.Maps");
  -[GEOOfflineStateManager _updateState:forKey:inCohort:](a1, a2, @"suggestedState", @"com.apple.Maps");
  double v7 = GEOGetOfflineStateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = GEOOfflineSuggestedStateAsString(a2);
    unint64_t v9 = (void *)v8;
    if ((unint64_t)(a3 - 1) > 3) {
      uint64_t v10 = "Invalid(?)";
    }
    else {
      uint64_t v10 = off_1E53E1108[a3 - 1];
    }
    *(_DWORD *)long long buf = 138543874;
    BOOL v17 = @"com.apple.Maps";
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 2082;
    uint64_t v21 = v10;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "Updating \"%{public}@\" suggestion: %{public}@ with reason: %{public}s", buf, 0x20u);
  }
  unint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  unsigned int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a2, @"GEOOfflineCurrentSuggestedState");
  uint64_t v15 = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v11 postNotificationName:@"GEOOfflineSuggestedStateChangedNotification" object:@"com.apple.Maps" userInfo:v13];
}

void __38__GEOOfflineStateManager__updateState__block_invoke(uint64_t a1, long long *a2, double a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)a2 + 25))
  {
    if (*((_DWORD *)a2 + 8) == 1)
    {
      uint64_t v10 = *(void *)(a1 + 40);
LABEL_28:
      long long v18 = *a2;
      long long v19 = a2[1];
      *(_DWORD *)(v10 + 32) = *((_DWORD *)a2 + 8);
      *(_OWORD *)uint64_t v10 = v18;
      *(_OWORD *)(v10 + 16) = v19;
    }
  }
  else
  {
    uint64_t v5 = *((void *)a2 + 2);
    switch(v5)
    {
      case 0:
      case 7:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          LOWORD(v20) = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid network event found events", (uint8_t *)&v20, 2u);
        }
        return;
      case 1:
      case 2:
        goto LABEL_16;
      case 3:
        GEOGetMonotonicTime();
        if (v11 - *(double *)a2 >= *(double *)(a1 + 72))
        {
LABEL_16:
          if (*(void *)(a1 + 80) >= 3uLL)
          {
            uint64_t v15 = GEOGetOfflineStateLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v16 = *((void *)a2 + 2);
              if (v16 > 6) {
                BOOL v17 = "invalid";
              }
              else {
                BOOL v17 = off_1E53E1128[v16];
              }
              int v20 = 136446722;
              uint64_t v21 = v17;
              __int16 v22 = 1024;
              int v23 = v16;
              __int16 v24 = 2048;
              double v25 = a3;
              _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Counting ResultStatus %{public}s(%d) from %.02f ago", (uint8_t *)&v20, 0x1Cu);
            }
          }
          ++**(_DWORD **)(a1 + 48);
          ++*(_DWORD *)(*(void *)(a1 + 56) + 4 * *((void *)a2 + 2));
          uint64_t v10 = *(void *)(a1 + 32);
          goto LABEL_28;
        }
        if (*(void *)(a1 + 80) >= 3uLL)
        {
          unsigned int v12 = GEOGetOfflineStateLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v13 = *((void *)a2 + 2);
            if (v13 > 6) {
              uint64_t v14 = "invalid";
            }
            else {
              uint64_t v14 = off_1E53E1128[v13];
            }
            int v20 = 136446722;
            uint64_t v21 = v14;
            __int16 v22 = 1024;
            int v23 = v13;
            __int16 v24 = 2048;
            double v25 = a3;
            _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "NOT counting ResultStatus %{public}s(%d) from %.02f ago", (uint8_t *)&v20, 0x1Cu);
          }
        }
        **(unsigned char **)(a1 + 64) = 1;
        break;
      case 4:
      case 5:
      case 6:
        if (*(void *)(a1 + 80) >= 3uLL)
        {
          double v7 = GEOGetOfflineStateLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v8 = *((void *)a2 + 2);
            if (v8 > 6) {
              unint64_t v9 = "invalid";
            }
            else {
              unint64_t v9 = off_1E53E1128[v8];
            }
            int v20 = 136446722;
            uint64_t v21 = v9;
            __int16 v22 = 1024;
            int v23 = v8;
            __int16 v24 = 2048;
            double v25 = a3;
            _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Counting ResultStatus %{public}s(%d) from %.02f ago", (uint8_t *)&v20, 0x1Cu);
          }

          uint64_t v5 = *((void *)a2 + 2);
        }
        ++*(_DWORD *)(*(void *)(a1 + 56) + 4 * v5);
        return;
      default:
        return;
    }
  }
}

- (uint64_t)_updateState:(void *)a3 forKey:(void *)a4 inCohort:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (+[GEOOfflineStateManager isCohortAllowed:v8])
    {
      unint64_t v9 = -[GEOOfflineStateManager _stateForCohort:]((id)a1, v8);
      uint64_t v10 = [v9 objectForKeyedSubscript:v7];
      uint64_t v11 = [v10 unsignedIntegerValue];

      if (v11 != a2)
      {
        id v12 = [v9 mutableCopy];
        unint64_t v13 = [NSNumber numberWithUnsignedInteger:a2];
        [v12 setObject:v13 forKeyedSubscript:v7];

        uint64_t v14 = NSNumber;
        GEOGetMonotonicTime();
        unint64_t v16 = [v14 numberWithUnsignedLongLong:(unint64_t)v15];
        [v12 setObject:v16 forKeyedSubscript:@"lastUpdated"];

        id v18 = v8;
        id v19 = v12;
        geo_isolate_sync_data();

        a1 = 1;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v9 = GEOGetOfflineStateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Ignoring %@ change for \"%@\"", buf, 0x16u);
      }
    }
    a1 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return a1;
}

uint64_t __55__GEOOfflineStateManager__updateState_forKey_inCohort___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 160) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 32);

  return -[GEOOfflineStateManager _writeCohortStatesIsolated:](v3, 1);
}

void __47__GEOOfflineStateManager__clearStateForCohort___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 160) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  -[GEOOfflineStateManager _writeCohortStatesIsolated:](*(void *)(a1 + 32), 1);
  double v2 = GEOGetOfflineStateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Cleared state for cohort %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)cohortId:(id)a3 shouldAttemptFailoverForRequest:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((a4.var0 - 672) < 2) {
    goto LABEL_25;
  }
  if (a4.var0 != 768) {
    goto LABEL_21;
  }
  BOOL v7 = 0;
  if (a4.var1.var0 <= 0x3Cu && ((1 << SLOBYTE(a4.var1.var0)) & 0x1004108000881E86) != 0)
  {
LABEL_25:
    if (!shouldCountRequest(*(void *)&a4, 1)) {
      goto LABEL_21;
    }
    if (!+[GEOOfflineStateManager isCohortAllowed:v6]) {
      goto LABEL_21;
    }
    if (!+[GEOOfflineStateManager isOfflineAvailable]) {
      goto LABEL_21;
    }
    __int16 v8 = (__int16)[(GEOOfflineStateManager *)self activeStateForCohortId:v6];
    int v9 = v8;
    if (v8 < 2u) {
      goto LABEL_21;
    }
    if (v8 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v18 = 67109120;
        int v19 = v9;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v18, 8u);
      }
      goto LABEL_21;
    }
    int v10 = HIBYTE(v8);
    if (HIBYTE(v8) >= 2u)
    {
      if (HIBYTE(v8) == 2) {
        goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v18 = 67109120;
        int v19 = v10;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v18, 8u);
      }
    }
    if (self->_lastNetworkState.status == 4)
    {
      GEOGetMonotonicTime();
      double v12 = v11;
      double Double = GEOConfigGetDouble(GeoOfflineConfig_AutoFailoverAttemptInterval, (uint64_t)off_1E9115878);
      uint64_t v14 = -[GEOOfflineStateManager _stateForCohort:key:](self, v6, @"failoverAttempt");
      unint64_t v15 = (unint64_t)v12;
      if (!v14 || v14 + (unint64_t)Double <= v15)
      {
        -[GEOOfflineStateManager _updateState:forKey:inCohort:]((uint64_t)self, v15, @"failoverAttempt", v6);
        BOOL v7 = 1;
        goto LABEL_22;
      }
    }
LABEL_21:
    BOOL v7 = 0;
  }
LABEL_22:

  return v7;
}

- (void)setState:(id)a3 savedState:(id)a4 forCohortId:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  unint64_t var0 = a3.var0;
  if (-[GEOOfflineStateManager _updateState:forKey:inCohort:]((uint64_t)self, a3.var0, @"currentState", v8))
  {
    -[GEOOfflineStateManager _updateState:forKey:inCohort:]((uint64_t)self, a4.var0, @"savedState", v8);
    if (a3.var1.var0 < 2u) {
      goto LABEL_14;
    }
    if (a3.var1.var0 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v18 = 67109120;
        LODWORD(v19) = a3.var1.var0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v18, 8u);
      }
      goto LABEL_14;
    }
    unsigned int var1 = a3.var1.var1;
    if (var1 >= 2)
    {
      if (var1 == 2) {
        goto LABEL_14;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v18 = 67109120;
        LODWORD(v19) = var1;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v18, 8u);
      }
    }
    GEOGetMonotonicTime();
    -[GEOOfflineStateManager _updateState:forKey:inCohort:]((uint64_t)self, (unint64_t)v11, @"failoverAttempt", v8);
LABEL_14:
    double v12 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      unint64_t v16 = GEOOfflineStateAsString(var0);
      BOOL v17 = GEOOfflineStateAsString(a4.var0);
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "Set \"%@\" state: %@ savedState %@", (uint8_t *)&v18, 0x20u);
    }
    goto LABEL_16;
  }
  double v12 = GEOGetOfflineStateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    unint64_t v13 = GEOOfflineStateAsString(a3.var0);
    uint64_t v14 = GEOOfflineStateAsString(a4.var0);
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Did not set \"%@\" state: %@ savedState: %@", (uint8_t *)&v18, 0x20u);
  }
LABEL_16:
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:v4]
    || !+[GEOOfflineStateManager isOfflineAvailable])
  {
    int v6 = 0;
    int v11 = 0;
    unsigned int v7 = 1;
    int v9 = 512;
    goto LABEL_21;
  }
  uint64_t v5 = -[GEOOfflineStateManager _stateForCohort:key:](self, v4, @"currentState");
  int v6 = BYTE3(v5);
  if (v5 - 1 >= 2) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = v5;
  }
  if (BYTE1(v5) - 1 >= 2) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = BYTE1(v5);
  }
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
LABEL_19:
      int v9 = v8 << 8;
      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v13 = 67109120;
      unsigned int v14 = v7;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v13, 8u);
    }
  }
  if (v8 < 2) {
    goto LABEL_19;
  }
  if (v8 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v13 = 67109120;
      unsigned int v14 = v8;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v13, 8u);
    }
    goto LABEL_19;
  }
  int v9 = 256;
LABEL_20:
  int v11 = 0x10000;
LABEL_21:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v11 | (v6 << 24) | v9 | v7);
}

+ ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!+[GEOOfflineStateManager isCohortAllowed:v3]
    || !+[GEOOfflineStateManager isOfflineAvailable])
  {
    unsigned int v21 = 0;
    int v26 = 0;
    unsigned int v22 = 1;
    int v24 = 512;
    goto LABEL_37;
  }
  id v4 = v3;
  uint64_t v5 = @"currentState";
  self;
  id v6 = v4;
  unsigned int v7 = self;
  if (+[GEOPlatform isRunningInGeod])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: !GEOPlatform.isRunningInGeod", buf, 2u);
    }
    id v10 = [v7 shared];
    uint64_t v18 = -[GEOOfflineStateManager _stateForCohort:](v10, v6);
    goto LABEL_17;
  }
  if (+[GEOOfflineStateManager isCohortAllowed:v6])
  {
    unsigned int v8 = +[GEOEntitlements currentProcessEntitlement:@"com.apple.geoservices.offline.cohort-id"];
    int v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      int v11 = [MEMORY[0x1E4F28B50] mainBundle];
      id v10 = [v11 bundleIdentifier];
    }
    if (([v6 isEqual:v10] & 1) != 0
      || +[GEOEntitlements currentProcessIsEntitled:@"com.apple.private.network.socket-delegate"])
    {
      double v12 = _getValue(GeoOfflineConfig_CohortStates, (uint64_t)off_1E9115718, 1, 0, 0, 0);
      int v13 = [v12 objectForKeyedSubscript:v6];
      unsigned int v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        defaultCohortState();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      unint64_t v16 = v15;

      goto LABEL_18;
    }
    BOOL v17 = GEOGetOfflineStateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_FAULT, "Attempt to read cohort state for another process without proper entitlment", buf, 2u);
    }

    v28[0] = @"currentState";
    v28[1] = @"savedState";
    *(void *)long long buf = &unk_1ED73DC60;
    uint64_t v30 = &unk_1ED73DC60;
    v28[2] = @"suggestedState";
    uint64_t v31 = &unk_1ED73DC78;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v28 count:3];
LABEL_17:
    unint64_t v16 = (void *)v18;
LABEL_18:

    goto LABEL_19;
  }
  unint64_t v16 = (void *)MEMORY[0x1E4F1CC08];
LABEL_19:

  id v19 = [v16 objectForKeyedSubscript:@"currentState"];
  unsigned int v20 = [v19 unsignedIntValue];

  unsigned int v21 = HIBYTE(v20);
  if (v20 - 1 >= 2) {
    unsigned int v22 = 1;
  }
  else {
    unsigned int v22 = v20;
  }
  if (BYTE1(v20) - 1 >= 2) {
    unsigned int v23 = 1;
  }
  else {
    unsigned int v23 = BYTE1(v20);
  }
  if (v22 >= 2)
  {
    if (v22 == 2)
    {
LABEL_35:
      int v24 = v23 << 8;
      goto LABEL_36;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v22;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
    }
  }
  if (v23 < 2) {
    goto LABEL_35;
  }
  if (v23 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v23;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", buf, 8u);
    }
    goto LABEL_35;
  }
  int v24 = 256;
LABEL_36:
  int v26 = 0x10000;
LABEL_37:

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)(v26 | (v21 << 24) | v24 | v22);
}

- (void)setSavedState:(id)a3 forCohortId:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivityCheckTask, 0);
  objc_storeStrong((id *)&self->_connectivityCheckQueue, 0);
  objc_storeStrong((id *)&self->_statesByCohortId, 0);
  objc_storeStrong((id *)&self->_updateStateTimer, 0);
  objc_storeStrong((id *)&self->_radioPrefsQueue, 0);
  objc_storeStrong((id *)&self->_radiosPrefs, 0);
  begin = self->_trackedRequests.__begin_;
  if (begin)
  {
    self->_trackedRequests.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_acceptableDurations, 0);

  objc_storeStrong((id *)&self->_isolator, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_DWORD *)self + 28) = 0;
  return self;
}

@end