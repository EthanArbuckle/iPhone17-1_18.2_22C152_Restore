@interface GEOReferenceTimeManager
+ (id)sharedManager;
- (BOOL)_didKernBootTimeChange;
- (BOOL)_initFromPersistenceAtTime:(double)a3;
- (BOOL)_synchronized;
- (BOOL)synchronized;
- (NSString)description;
- (double)_referenceTime;
- (double)bestReferenceTime;
- (id)_initInternal;
- (id)_retrievePersistedBasisRefTimeData;
- (id)bestReferenceDate;
- (void)_kernBootTimeResult:(id)a3;
- (void)_persistBasisRefTimeData:(id)a3;
- (void)_startTimedSync;
- (void)_syncWithTimed;
- (void)dealloc;
- (void)referenceTimeResult:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation GEOReferenceTimeManager

void __40__GEOReferenceTimeManager_sharedManager__block_invoke()
{
  id v0 = [[GEOReferenceTimeManager alloc] _initInternal];
  v1 = (void *)_MergedGlobals_272;
  _MergedGlobals_272 = (uint64_t)v0;
}

- (id)_initInternal
{
  v14.receiver = self;
  v14.super_class = (Class)GEOReferenceTimeManager;
  v2 = [(GEOReferenceTimeManager *)&v14 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    syncSem = v2->_syncSem;
    v2->_syncSem = (OS_dispatch_semaphore *)v3;

    uint64_t v5 = geo_isolater_create();
    iso = v2->_iso;
    v2->_iso = (geo_isolater *)v5;

    v2->_isGEOAPD = +[GEOPlatform isRunningInGeoAPd];
    v2->_attemptNum = 0;
    geoTMGetKernelMonotonicClock();
    v2->_managerStartTime = v7;
    BOOL v8 = -[GEOReferenceTimeManager _initFromPersistenceAtTime:](v2, "_initFromPersistenceAtTime:");
    v2->_synchronized = v8;
    if (!v2->_isGEOAPD)
    {
      global_queue = (void *)geo_get_global_queue();
      _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1E9114D28, global_queue, v2);
      goto LABEL_6;
    }
    if (!v8)
    {
      v9 = geo_get_global_queue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__GEOReferenceTimeManager__initInternal__block_invoke;
      block[3] = &unk_1E53D79D8;
      v13 = v2;
      dispatch_async(v9, block);

      global_queue = v13;
LABEL_6:
    }
  }
  return v2;
}

- (BOOL)_initFromPersistenceAtTime:(double)a3
{
  v4 = GEOGetReferenceTimeManagerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "checking for persisted basis data", buf, 2u);
  }

  uint64_t v5 = [(GEOReferenceTimeManager *)self _retrievePersistedBasisRefTimeData];
  refTimeData = self->_refTimeData;
  self->_refTimeData = v5;

  if (!self->_refTimeData)
  {
    BOOL v8 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      v10 = "found no basis data";
      v11 = v16;
      goto LABEL_9;
    }
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  BOOL v7 = [(GEOReferenceTimeManager *)self _didKernBootTimeChange];
  BOOL v8 = GEOGetReferenceTimeManagerLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      __int16 v15 = 0;
      v10 = "found stale basis data";
      v11 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, v10, v11, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v9)
  {
    *(_WORD *)objc_super v14 = 0;
    BOOL v12 = 1;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "found good basis data", v14, 2u);
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_11:

  return v12;
}

- (id)_retrievePersistedBasisRefTimeData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _getValue(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1E9114D28, 1, 0, 0, 0);
  if (v2)
  {
    id v7 = 0;
    dispatch_semaphore_t v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      uint64_t v5 = GEOGetReferenceTimeManagerLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "unarchival error : %@", buf, 0xCu);
      }

      _setValue(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1E9114D28, 0, 0, 0);
    }
  }
  else
  {
    dispatch_semaphore_t v3 = 0;
  }

  return v3;
}

void __47__GEOReferenceTimeManager_referenceTimeResult___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _synchronized];
  [*(id *)(a1 + 32) _referenceTime];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  dispatch_semaphore_t v3 = *(unsigned char **)(a1 + 32);
  if (v3[33] && [v3 _didKernBootTimeChange])
  {
    id v4 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "timed sync required", buf, 2u);
    }

    global_queue = geo_get_global_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__GEOReferenceTimeManager_referenceTimeResult___block_invoke_68;
    block[3] = &unk_1E53D79D8;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(global_queue, block);
  }
}

- (BOOL)_synchronized
{
  geo_assert_isolated();
  if (!_GEOConfigHasValue(GeoServicesConfig_RefTimeValid, (uint64_t)off_1E9114D48)) {
    return self->_synchronized;
  }
  int v3 = GeoServicesConfig_RefTimeValid;
  id v4 = off_1E9114D48;

  return GEOConfigGetBOOL(v3, (uint64_t)v4);
}

- (double)_referenceTime
{
  geo_assert_isolated();
  double Double = 0.0;
  if (_GEOConfigHasValue(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1E9114D38)) {
    double Double = GEOConfigGetDouble(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1E9114D38);
  }
  [(GEOReferenceTimeData *)self->_refTimeData currentReferenceTime];
  return Double + v4;
}

- (BOOL)_didKernBootTimeChange
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__GEOReferenceTimeManager__didKernBootTimeChange__block_invoke;
  v6[3] = &unk_1E53E8778;
  v6[4] = self;
  v6[5] = &v7;
  [(GEOReferenceTimeManager *)self _kernBootTimeResult:v6];
  if (*((unsigned char *)v8 + 24))
  {
    uint64_t v2 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "kern boottime mismatch", v5, 2u);
    }

    BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)_kernBootTimeResult:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void (**)(id, uint64_t, uint64_t, BOOL))a3;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  size_t v8 = 16;
  int v4 = sysctlbyname("kern.boottime", &v9, &v8, 0, 0);
  if (v4)
  {
    uint64_t v5 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = __error();
      uint64_t v7 = strerror(*v6);
      *(_DWORD *)buf = 136315138;
      BOOL v12 = v7;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "can't read kern.boottime : (%s)", buf, 0xCu);
    }
  }
  v3[2](v3, v9, v10, v4 == 0);
}

uint64_t __49__GEOReferenceTimeManager__didKernBootTimeChange__block_invoke(uint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t v4 = result;
  if (a4 && (result = [*(id *)(*(void *)(result + 32) + 8) kernBootTime], result == a2))
  {
    result = [*(id *)(*(void *)(v4 + 32) + 8) kernBootTime];
    BOOL v8 = v7 != a3;
  }
  else
  {
    BOOL v8 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = v8;
  return result;
}

- (id)bestReferenceDate
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(GEOReferenceTimeManager *)self bestReferenceTime];

  return (id)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (double)bestReferenceTime
{
  uint64_t v5 = 0;
  v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__GEOReferenceTimeManager_bestReferenceTime__block_invoke;
  v4[3] = &unk_1E53E87C8;
  v4[4] = &v5;
  [(GEOReferenceTimeManager *)self referenceTimeResult:v4];
  double Current = v6[3];
  if (Current == 0.0) {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  _Block_object_dispose(&v5, 8);
  return Current;
}

- (void)referenceTimeResult:(id)a3
{
  BOOL v3 = (void (**)(id, void, double))a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  geo_isolate_sync();
  v3[2](v3, *((unsigned __int8 *)v9 + 24), v5[3]);
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
}

+ (id)sharedManager
{
  if (qword_1EB29FF48 != -1) {
    dispatch_once(&qword_1EB29FF48, &__block_literal_global_129);
  }
  uint64_t v2 = (void *)_MergedGlobals_272;

  return v2;
}

uint64_t __44__GEOReferenceTimeManager_bestReferenceTime__block_invoke(uint64_t result, int a2, double a3)
{
  if (a2) {
    *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  }
  return result;
}

uint64_t __40__GEOReferenceTimeManager__initInternal__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startTimedSync];
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  v3.receiver = self;
  v3.super_class = (Class)GEOReferenceTimeManager;
  [(GEOReferenceTimeManager *)&v3 dealloc];
}

- (void)_persistBasisRefTimeData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  objc_super v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v10];
  id v4 = v10;
  if (v3)
  {
    _setValue(GeoServicesConfig_BasisRefTimeData, (uint64_t)off_1E9114D28, v3, 1, 0);
    uint64_t v5 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "persisted new GEOReferenceTimeData";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_188D96000, v7, v8, v6, buf, v9);
    }
  }
  else
  {
    uint64_t v5 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      uint64_t v6 = "unable to secure encode GEOReferenceTimeData : %@";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
      goto LABEL_6;
    }
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  objc_super v3 = GEOGetReferenceTimeManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "client basis data changed", buf, 2u);
  }

  global_queue = (void *)geo_get_global_queue();
  geo_isolate_async();
}

uint64_t __55__GEOReferenceTimeManager_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  geoTMGetKernelMonotonicClock();
  uint64_t result = objc_msgSend(v2, "_initFromPersistenceAtTime:");
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

- (void)_startTimedSync
{
  objc_super v3 = GEOGetReferenceTimeManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "starting sync with timed", buf, 2u);
  }

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_syncSem, 0))
  {
    id v4 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "sync with timed already running", v5, 2u);
    }
  }
  else
  {
    [(GEOReferenceTimeManager *)self _syncWithTimed];
  }
}

- (void)_syncWithTimed
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  objc_super v3 = GEOGetReferenceTimeManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "syncing with timed", (uint8_t *)&buf, 2u);
  }

  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  id location = 0;
  p_id location = &location;
  uint64_t v30 = 0x2020000000;
  id v4 = (uint64_t (*)(uint64_t *, uint64_t *, int *))getTMGetReferenceTimeSymbolLoc_ptr;
  v31 = getTMGetReferenceTimeSymbolLoc_ptr;
  if (!getTMGetReferenceTimeSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v33 = __getTMGetReferenceTimeSymbolLoc_block_invoke;
    v34 = &unk_1E53DB3C8;
    v35 = &location;
    uint64_t v5 = (void *)CoreTimeLibrary();
    uint64_t v6 = dlsym(v5, "TMGetReferenceTime");
    *((void *)v35[1] + 3) = v6;
    getTMGetReferenceTimeSymbolLoc_ptr = (_UNKNOWN *)*((void *)v35[1] + 3);
    id v4 = (uint64_t (*)(uint64_t *, uint64_t *, int *))p_location[3];
  }
  _Block_object_dispose(&location, 8);
  if (!v4)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  int v7 = v4(&v27, &v26, &v25);
  geoTMGetKernelMonotonicClock();
  if (!v7 || *((int *)v23 + 6) < 1)
  {
    char v11 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "didn't retrieve good reference time", (uint8_t *)&buf, 2u);
    }

    id v12 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = *((_DWORD *)v23 + 6);
      LODWORD(buf) = 67109376;
      DWORD1(buf) = v7;
      WORD4(buf) = 1024;
      *(_DWORD *)((char *)&buf + 10) = v13;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "TMGetReferenceTime(return code %d, reliable %d)", (uint8_t *)&buf, 0xEu);
    }

    *((_DWORD *)v23 + 6) = 0;
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  id v10 = GEOGetReferenceTimeManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "retrieved good reference time", (uint8_t *)&buf, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__GEOReferenceTimeManager__syncWithTimed__block_invoke;
  v21[3] = &unk_1E53E87A0;
  v21[6] = v27;
  v21[7] = v26;
  v21[8] = v9;
  v21[4] = self;
  v21[5] = &v22;
  [(GEOReferenceTimeManager *)self _kernBootTimeResult:v21];
  if (!*((_DWORD *)v23 + 6))
  {
LABEL_17:
    unsigned int attemptNum = self->_attemptNum;
    self->_unsigned int attemptNum = attemptNum + 1;
    if (2 * attemptNum <= 0x200)
    {
      self->_unsigned int attemptNum = attemptNum + 2;
      unint64_t v15 = 2 * (attemptNum + 1);
    }
    else
    {
      unint64_t v15 = 512;
    }
    objc_initWeak(&location, self);
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)((double)v15 * 1000000000.0));
    global_queue = geo_get_global_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_67;
    block[3] = &unk_1E53D7B90;
    objc_copyWeak(&v20, &location);
    dispatch_after(v16, global_queue, block);

    v18 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "will try again in %llu seconds", (uint8_t *)&buf, 0xCu);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v22, 8);
}

void __41__GEOReferenceTimeManager__syncWithTimed__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    uint64_t v5 = -[GEOReferenceTimeData initWithRefTime:refError:kernTime:bootTime:]([GEOReferenceTimeData alloc], "initWithRefTime:refError:kernTime:bootTime:", a2, a3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    [*(id *)(a1 + 32) _persistBasisRefTimeData:v5];
    global_queue = (void *)geo_get_global_queue();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_2;
    int v13 = &unk_1E53D8998;
    uint64_t v14 = *(void *)(a1 + 32);
    int v7 = v5;
    geo_isolate_async();
  }
  else
  {
    uint64_t v8 = GEOGetReferenceTimeManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "couldn't get kern boot time", v9, 2u);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

intptr_t __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);

  return dispatch_semaphore_signal(v2);
}

void __41__GEOReferenceTimeManager__syncWithTimed__block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncWithTimed];
}

uint64_t __47__GEOReferenceTimeManager_referenceTimeResult___block_invoke_68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startTimedSync];
}

- (BOOL)synchronized
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__GEOReferenceTimeManager_synchronized__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _synchronized];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)description
{
  BOOL HasValue = _GEOConfigHasValue(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1E9114D38);
  double Double = GEOConfigGetDouble(GeoServicesConfig_RefTimeOffset, (uint64_t)off_1E9114D38);
  BOOL v5 = _GEOConfigHasValue(GeoServicesConfig_RefTimeValid, (uint64_t)off_1E9114D48);
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_RefTimeValid, (uint64_t)off_1E9114D48);
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__67;
  v28 = __Block_byref_object_dispose__67;
  objc_msgSend(NSString, "stringWithFormat:", @"<GEOReferenceTimeManager(%p) :\n", self);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_synchronized) {
    char v7 = @"YES";
  }
  else {
    char v7 = @"NO";
  }
  uint64_t v8 = [(id)v25[5] stringByAppendingFormat:@"synchronized : %@\n", v7];
  uint64_t v9 = (void *)v25[5];
  v25[5] = v8;

  if (v5)
  {
    if (BOOL) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    uint64_t v11 = [(id)v25[5] stringByAppendingFormat:@"sync override : %@\n", v10];
    id v12 = (void *)v25[5];
    v25[5] = v11;
  }
  if (HasValue)
  {
    uint64_t v13 = objc_msgSend((id)v25[5], "stringByAppendingFormat:", @"sync offset applied : %f seconds\n", *(void *)&Double);
    uint64_t v14 = (void *)v25[5];
    v25[5] = v13;
  }
  unint64_t v15 = (void *)v25[5];
  geoTMGetKernelMonotonicClock();
  uint64_t v17 = objc_msgSend(v15, "stringByAppendingFormat:", @"current kern monotonic time: %f\n", v16);
  v18 = (void *)v25[5];
  v25[5] = v17;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__GEOReferenceTimeManager_description__block_invoke;
  v23[3] = &unk_1E53E87F0;
  v23[4] = &v24;
  [(GEOReferenceTimeManager *)self _kernBootTimeResult:v23];
  uint64_t v19 = [(id)v25[5] stringByAppendingFormat:@"reference time data : %@>\n", self->_refTimeData];
  id v20 = (void *)v25[5];
  v25[5] = v19;

  id v21 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return (NSString *)v21;
}

void __38__GEOReferenceTimeManager_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", @"current kern boot time: %ld.%d\n", a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncSem, 0);
  objc_storeStrong((id *)&self->_iso, 0);

  objc_storeStrong((id *)&self->_refTimeData, 0);
}

@end