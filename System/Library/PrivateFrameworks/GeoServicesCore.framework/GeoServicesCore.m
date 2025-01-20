void geo_assert_isolated(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_owner(a1 + 4);
}

void _geo_isolate_unlock(os_unfair_lock_s **a1)
{
}

void geo_assert_not_isolated(const os_unfair_lock *a1)
{
}

uint64_t _geo_isolate_lock_data()
{
  return os_unfair_lock_lock_with_options();
}

uint64_t _geo_isolate_lock()
{
  return os_unfair_lock_lock_with_options();
}

id GEOGetResourceManifestLog()
{
  if (qword_1EB30C6C0 != -1) {
    dispatch_once(&qword_1EB30C6C0, &__block_literal_global_7);
  }
  v0 = (void *)qword_1EB30C6B8;
  return v0;
}

id GEOGetOfflineStateLog()
{
  if (qword_1EB30C770 != -1) {
    dispatch_once(&qword_1EB30C770, &__block_literal_global_40_0);
  }
  v0 = (void *)qword_1EB30C768;
  return v0;
}

id GEOGetCuratedCollectionsLog()
{
  if (qword_1EB30C6A0 != -1) {
    dispatch_once(&qword_1EB30C6A0, &__block_literal_global_1);
  }
  v0 = (void *)_MergedGlobals_2;
  return v0;
}

void geo_reentrant_isolate_sync(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v6 = v3;
  v5 = (void (**)(void))v4;
  os_unfair_recursive_lock_lock_with_options();
  v5[2](v5);
  os_unfair_recursive_lock_unlock();
}

void sub_1DD9521C0(void *a1)
{
}

void sub_1DD9521D4(_Unwind_Exception *a1)
{
}

double GEOMachAbsoluteTimeGetCurrent()
{
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  }
  return *(double *)&qword_1EB30C668 * (double)mach_absolute_time();
}

double GEOGetMonotonicTime()
{
  return (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
}

void sub_1DD95284C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GEOGetStateCaptureLog()
{
  if (qword_1EB30C648 != -1) {
    dispatch_once(&qword_1EB30C648, &__block_literal_global_27);
  }
  v0 = (void *)qword_1EB30C640;
  return v0;
}

void geo_reentrant_isolate_sync_data(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v6 = v3;
  v5 = (void (**)(void))v4;
  os_unfair_recursive_lock_lock_with_options();
  v5[2](v5);
  os_unfair_recursive_lock_unlock();
}

void sub_1DD952960(void *a1)
{
}

void sub_1DD952974(_Unwind_Exception *a1)
{
}

id GEOGetOfflineServiceLog()
{
  if (qword_1EB30C760 != -1) {
    dispatch_once(&qword_1EB30C760, &__block_literal_global_37);
  }
  v0 = (void *)qword_1EB30C758;
  return v0;
}

id GEOGetUserSessionLog()
{
  if (qword_1EB30C710 != -1) {
    dispatch_once(&qword_1EB30C710, &__block_literal_global_22);
  }
  v0 = (void *)qword_1EB30C708;
  return v0;
}

uint64_t geo_isolater_create(uint64_t a1)
{
  v2 = [geo_isolater alloc];
  return (uint64_t)[(geo_isolater *)v2 initWithName:a1];
}

id _GEOCreateTransaction(char *__format, ...)
{
  va_start(va, __format);
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)__str = 0u;
  long long v4 = 0u;
  vsnprintf(__str, 0x1F4uLL, __format, va);
  v1 = (void *)os_transaction_create();
  return v1;
}

id GEOGetTileLoadingLog()
{
  if (qword_1EB30C6E0 != -1) {
    dispatch_once(&qword_1EB30C6E0, &__block_literal_global_13);
  }
  v0 = (void *)qword_1EB30C6D8;
  return v0;
}

void geo_isolate_async(void *a1, NSObject *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __geo_isolate_async_block_invoke;
  v9[3] = &unk_1E6CFC0D8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(a2, v9);
}

dispatch_queue_t geo_dispatch_queue_create_with_qos(const char *a1, dispatch_qos_class_t a2)
{
  long long v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v5 = dispatch_queue_attr_make_with_qos_class(v4, a2, 0);

  dispatch_queue_t v6 = dispatch_queue_create(a1, v5);
  return v6;
}

id GEORegisterPListStateCaptureAtFrequency(unsigned int a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v12 = (objc_class *)NSString;
  id v13 = a4;
  id v14 = a3;
  id v15 = a2;
  long long v16 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  long long v17 = _GEORegisterPListStateCaptureAtFrequency(a1, v15, v14, v16);

  return v17;
}

void GEORegisterPListStateCaptureLegacy(void *a1, void *a2, unsigned int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a2;
  id v14 = a4;
  id v15 = a5;
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    __int16 v24 = 0;
    long long v20 = MEMORY[0x1E4F14500];
    long long v21 = "Assertion failed: legacyHandle != ((void *)0)";
    long long v22 = (uint8_t *)&v24;
LABEL_13:
    _os_log_fault_impl(&dword_1DD951000, v20, OS_LOG_TYPE_FAULT, v21, v22, 2u);
    goto LABEL_8;
  }
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    long long v20 = MEMORY[0x1E4F14500];
    long long v21 = "Assertion failed: self != ((void *)0)";
    long long v22 = buf;
    goto LABEL_13;
  }
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
  long long v16 = (void *)[[NSString alloc] initWithFormat:v15 arguments:&a9];
  long long v17 = _GEORegisterPListStateCaptureAtFrequency(a3, v14, v13, v16);
  if (v17)
  {
    *a1 = atomic_fetch_add(&qword_1EB30C630, 1uLL);
    long long v18 = (void *)qword_1EB30C638;
    long long v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:");
    [v18 setObject:v17 forKeyedSubscript:v19];
  }
LABEL_8:
}

geo_state_capture_handle *_GEORegisterPListStateCaptureAtFrequency(unsigned int a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(geo_state_capture_handle);
  long long v12 = v11;
  if (v11)
  {
    v11->_frequency = a1;
    objc_storeWeak((id *)&v11->_weakStateCapturing, v9);
    objc_storeStrong((id *)&v12->_queue, a2);
    uint64_t v13 = [v10 dataUsingEncoding:4];
    description = v12->_description;
    v12->_description = (NSData *)v13;

    objc_initWeak(location, v12);
    if (qword_1EB30C650 != -1) {
      dispatch_once(&qword_1EB30C650, &__block_literal_global_40);
    }
    id v15 = (id)qword_1EB30C658;
    objc_copyWeak(&v19, location);
    uint64_t v16 = os_state_add_handler();

    v12->_stateCaptureHandle = v16;
    long long v17 = v12;
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl(&dword_1DD951000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: handle != ((void *)0)", (uint8_t *)location, 2u);
  }

  return v12;
}

dispatch_queue_t geo_dispatch_queue_create_with_format(char *__format, ...)
{
  va_start(va, __format);
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x64uLL, __format, va);
  return geo_dispatch_queue_create_with_target(__str, 0);
}

dispatch_queue_t geo_dispatch_queue_create_with_target(const char *a1, NSObject *a2)
{
  long long v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create_with_target_V2(a1, v4, a2);

  return v5;
}

id geo_dispatch_block_clean_copy(dispatch_block_t block)
{
  dispatch_block_t v1 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED|0x40, block);
  return v1;
}

geo_reentrant_isolater *geo_reentrant_isolater_create_with_format(char *__format, ...)
{
  va_start(va, __format);
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x64uLL, __format, va);
  return [[geo_reentrant_isolater alloc] initWithName:__str];
}

geo_isolater *geo_isolater_create_with_format(char *__format, ...)
{
  va_start(va, __format);
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x64uLL, __format, va);
  return [[geo_isolater alloc] initWithName:__str];
}

dispatch_queue_t geo_dispatch_queue_create_with_workloop_qos(const char *a1, uint64_t a2)
{
  long long v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_attr_make_with_qos_class(v4, (dispatch_qos_class_t)a2, 0);

  global_workloop = geo_get_global_workloop(a2);
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(a1, v5, global_workloop);

  return v7;
}

NSObject *geo_dispatch_timer_create_on_qos(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9 = a2;
  global_workloop = geo_get_global_workloop(a1);
  id v11 = geo_dispatch_timer_create_on_queue(global_workloop, v9, a3, a4, a5);

  return v11;
}

void geo_dispatch_async_qos(uint64_t a1, void *a2)
{
  id v3 = a2;
  global_queue = geo_get_global_queue(a1);
  dispatch_async(global_queue, v3);
}

uint64_t geo_get_global_workloop(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a1 | 0x2000];
  os_unfair_lock_lock_with_options();
  id v3 = (void *)qword_1EB30C690;
  if (!qword_1EB30C690)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    dispatch_queue_t v5 = (void *)qword_1EB30C690;
    qword_1EB30C690 = v4;

    id v3 = (void *)qword_1EB30C690;
  }
  uint64_t v6 = [v3 objectForKey:v2];
  if (!v6)
  {
    id v7 = [NSString stringWithFormat:@"%@.x%x", @"com.apple.geo.global.queue.", a1];
    uint64_t v6 = geo_dispatch_workloop_create_with_qos((const char *)[v7 UTF8String]);
    [(id)qword_1EB30C690 setObject:v6 forKey:v2];
  }
  os_unfair_lock_unlock(&stru_1EB30C684);

  return v6;
}

uint64_t geo_get_global_queue(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a1 | 0x1000];
  os_unfair_lock_lock_with_options();
  id v3 = (void *)qword_1EB30C690;
  if (!qword_1EB30C690)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    dispatch_queue_t v5 = (void *)qword_1EB30C690;
    qword_1EB30C690 = v4;

    id v3 = (void *)qword_1EB30C690;
  }
  uint64_t v6 = [v3 objectForKey:v2];
  if (!v6)
  {
    id v7 = [NSString stringWithFormat:@"%@.x%x", @"com.apple.geo.global.queue.", a1];
    uint64_t v6 = geo_dispatch_workloop_create_with_qos((const char *)[v7 UTF8String]);
    [(id)qword_1EB30C690 setObject:v6 forKey:v2];
  }
  os_unfair_lock_unlock(&stru_1EB30C684);

  return v6;
}

uint64_t GEOXPCServerTypeForIdentifier(void *a1)
{
  dispatch_block_t v1 = (unsigned char *)[a1 UTF8String];
  LOBYTE(v2) = *v1;
  if (!*v1) {
    return 0;
  }
  unint64_t v3 = 0;
  int v4 = 0;
  do
  {
    int v2 = (char)v2;
    if (v3) {
      int v2 = 0;
    }
    v4 += v2;
    if (v3 > 0x30) {
      break;
    }
    int v2 = v1[++v3];
  }
  while (v2);
  if (v4 > 612)
  {
    if (v4 > 758)
    {
      uint64_t v5 = 11;
      uint64_t v20 = 13;
      uint64_t v21 = 12;
      if (v4 != 1755) {
        uint64_t v21 = 0;
      }
      if (v4 != 961) {
        uint64_t v20 = v21;
      }
      if (v4 != 881) {
        uint64_t v5 = v20;
      }
      uint64_t v7 = 14;
      uint64_t v22 = 10;
      uint64_t v23 = 8;
      if (v4 != 770) {
        uint64_t v23 = 0;
      }
      if (v4 != 766) {
        uint64_t v22 = v23;
      }
      if (v4 != 759) {
        uint64_t v7 = v22;
      }
      BOOL v10 = v4 <= 880;
    }
    else
    {
      uint64_t v5 = 23;
      uint64_t v12 = 5;
      uint64_t v13 = 17;
      if (v4 != 722) {
        uint64_t v13 = 0;
      }
      if (v4 != 661) {
        uint64_t v12 = v13;
      }
      if (v4 != 651) {
        uint64_t v5 = v12;
      }
      uint64_t v7 = 22;
      uint64_t v14 = 24;
      uint64_t v15 = 19;
      if (v4 != 645) {
        uint64_t v15 = 0;
      }
      if (v4 != 636) {
        uint64_t v14 = v15;
      }
      if (v4 != 613) {
        uint64_t v7 = v14;
      }
      BOOL v10 = v4 <= 650;
    }
  }
  else if (v4 > 503)
  {
    uint64_t v5 = 15;
    uint64_t v16 = 7;
    uint64_t v17 = 21;
    if (v4 != 605) {
      uint64_t v17 = 0;
    }
    if (v4 != 589) {
      uint64_t v16 = v17;
    }
    if (v4 != 568) {
      uint64_t v5 = v16;
    }
    uint64_t v7 = 9;
    uint64_t v18 = 3;
    uint64_t v19 = 20;
    if (v4 != 560) {
      uint64_t v19 = 0;
    }
    if (v4 != 528) {
      uint64_t v18 = v19;
    }
    if (v4 != 504) {
      uint64_t v7 = v18;
    }
    BOOL v10 = v4 <= 567;
  }
  else
  {
    uint64_t v5 = 2;
    uint64_t v6 = 18;
    if (v4 != 448) {
      uint64_t v6 = v4 == 453;
    }
    if (v4 != 435) {
      uint64_t v5 = v6;
    }
    uint64_t v7 = 4;
    uint64_t v8 = 16;
    uint64_t v9 = 6;
    if (v4 != 433) {
      uint64_t v9 = 0;
    }
    if (v4 != 339) {
      uint64_t v8 = v9;
    }
    if (v4 != 134) {
      uint64_t v7 = v8;
    }
    BOOL v10 = v4 <= 434;
  }
  if (v10) {
    return v7;
  }
  else {
    return v5;
  }
}

NSObject *geo_dispatch_timer_create_on_queue(NSObject *a1, void *a2, double a3, double a4, double a5)
{
  id v9 = a2;
  BOOL v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, a1);
  id v11 = v10;
  if (v10)
  {
    if (a4 == -1.0) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = (unint64_t)(a4 * 1000000000.0);
    }
    dispatch_source_set_event_handler(v10, v9);
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v11, v13, v12, (unint64_t)(a5 * 1000000.0));
    uint64_t v14 = v11;
  }

  return v11;
}

NSObject *geo_dispatch_workloop_create_with_qos(const char *a1)
{
  inactive = dispatch_workloop_create_inactive(a1);
  dispatch_workloop_set_qos_class_floor();
  dispatch_activate(inactive);
  return inactive;
}

void geo_isolate_sync(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v6 = (os_unfair_lock_s *)v3;
  uint64_t v5 = (void (**)(void))v4;
  os_unfair_lock_lock_with_options();
  v5[2](v5);
  os_unfair_lock_unlock(v6 + 4);
}

void sub_1DD953C14(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1DD953C28(_Unwind_Exception *a1)
{
}

void geo_isolate_sync_data(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v6 = (os_unfair_lock_s *)v3;
  uint64_t v5 = (void (**)(void))v4;
  os_unfair_lock_lock_with_options();
  v5[2](v5);
  os_unfair_lock_unlock(v6 + 4);
}

void sub_1DD953CD4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1DD953CE8(_Unwind_Exception *a1)
{
}

id GEOGetUserDefaultsLog()
{
  if (qword_1EB30C6F0 != -1) {
    dispatch_once(&qword_1EB30C6F0, &__block_literal_global_16);
  }
  v0 = (void *)qword_1EB30C6E8;
  return v0;
}

dispatch_queue_t geo_dispatch_queue_create(const char *a1)
{
  return geo_dispatch_queue_create_with_target(a1, 0);
}

__CFString *GEOXPCServerIdentifierForType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x17) {
    return @"_any_";
  }
  else {
    return off_1E6CFBF30[a1 - 1];
  }
}

void __geo_isolate_async_block_invoke(uint64_t a1)
{
  dispatch_block_t v1 = *(void **)(a1 + 40);
  id v3 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  int v2 = v1;
  os_unfair_lock_lock_with_options();
  v2[2](v2);
  os_unfair_lock_unlock(v3 + 4);
}

void sub_1DD953E00(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1DD953E14(_Unwind_Exception *a1)
{
}

uint64_t __GEORegisterPListStateCaptureLegacy_block_invoke()
{
  qword_1EB30C630 = 1;
  qword_1EB30C638 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  return MEMORY[0x1F41817F8]();
}

void __47__geo_state_capture_handle__capturePlistState___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v2 = [WeakRetained captureStatePlistWithHints:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __GEOGetOfflineStateLog_block_invoke()
{
  qword_1EB30C768 = (uint64_t)os_log_create("com.apple.GeoServices", "OfflineState");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GEOGetUserSessionLog_block_invoke()
{
  qword_1EB30C708 = (uint64_t)os_log_create("com.apple.GeoServices", "UserSession");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GEOGetTileLoadingLog_block_invoke()
{
  qword_1EB30C6D8 = (uint64_t)os_log_create("com.apple.GeoServices", "TileLoading");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GEOGetStateCaptureLog_block_invoke()
{
  qword_1EB30C640 = (uint64_t)os_log_create("com.apple.GeoServices", "StateCapture");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GEOGetOfflineServiceLog_block_invoke()
{
  qword_1EB30C758 = (uint64_t)os_log_create("com.apple.GeoServices", "OfflineService");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GEOGetCuratedCollectionsLog_block_invoke()
{
  _MergedGlobals_2 = (uint64_t)os_log_create("com.apple.GeoServices", "CuratedCollections");
  return MEMORY[0x1F41817F8]();
}

double __GEOMachAbsoluteTimeGetCurrent_block_invoke()
{
  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  LODWORD(v1) = info.denom;
  double result = (double)v0 / (double)v1 * 0.000000001;
  qword_1EB30C668 = *(void *)&result;
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void GEOUnregisterStateCaptureLegacy(void *a1)
{
  if (a1)
  {
    if (*a1)
    {
      uint64_t v2 = (void *)qword_1EB30C638;
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:");
      [v2 removeObjectForKey:v3];

      *a1 = 0;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_fault_impl(&dword_1DD951000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: legacyHandle != ((void *)0)", v4, 2u);
  }
}

BOOL GEOAbsoluteTimeIsGreaterThanZero(double a1)
{
  return a1 > 2.22044605e-16;
}

uint64_t GEOMachContinuousTimeForTimestamp(double a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = mach_continuous_time();
  if (qword_1EB30C670 != -1) {
    dispatch_once(&qword_1EB30C670, &__block_literal_global_3);
  }
  return v3 + (uint64_t)((a1 - Current) / *(double *)&qword_1EB30C678);
}

double __GEOMachContinuousTimeForTimestamp_block_invoke()
{
  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  LODWORD(v1) = info.denom;
  double result = (double)v0 / (double)v1 * 0.000000001;
  qword_1EB30C678 = *(void *)&result;
  return result;
}

dispatch_queue_t geo_dispatch_queue_create_with_target_and_qos(const char *a1, void *a2, dispatch_qos_class_t a3)
{
  uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, a3, 0);
  uint64_t v8 = a2;

  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2(a1, v7, v8);
  return v9;
}

dispatch_workloop_t geo_dispatch_workloop_create_with_format(char *__format, ...)
{
  va_start(va, __format);
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x64uLL, __format, va);
  return dispatch_workloop_create(__str);
}

id geo_get_global_operation_queue(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a1];
  os_unfair_lock_lock_with_options();
  uint64_t v3 = (void *)qword_1EB30C688;
  if (!qword_1EB30C688)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v5 = (void *)qword_1EB30C688;
    qword_1EB30C688 = v4;

    uint64_t v3 = (void *)qword_1EB30C688;
  }
  id v6 = [v3 objectForKey:v2];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v7 = [NSString stringWithFormat:@"%@.x%x", @"com.apple.geo.global.opqueue.", a1];
    [v6 setName:v7];

    [v6 setMaxConcurrentOperationCount:1];
    global_queue = (void *)geo_get_global_queue(a1);
    [v6 setUnderlyingQueue:global_queue];
    [(id)qword_1EB30C688 setObject:v6 forKey:v2];
  }
  os_unfair_lock_unlock(&_MergedGlobals_1);

  return v6;
}

uint64_t geo_reentrant_isolater_create(uint64_t a1)
{
  uint64_t v2 = [geo_reentrant_isolater alloc];
  return (uint64_t)[(geo_reentrant_isolater *)v2 initWithName:a1];
}

void geo_assert_reentrant_isolated(const os_unfair_lock *a1)
{
}

void geo_assert_reentrant_not_isolated(const os_unfair_lock *a1)
{
}

id GEOGetPlaceRequestLog()
{
  if (qword_1EB30C6B0 != -1) {
    dispatch_once(&qword_1EB30C6B0, &__block_literal_global_4);
  }
  unint64_t v0 = (void *)qword_1EB30C6A8;
  return v0;
}

uint64_t __GEOGetPlaceRequestLog_block_invoke()
{
  qword_1EB30C6A8 = (uint64_t)os_log_create("com.apple.GeoServices", "PlaceRequest");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GEOGetResourceManifestLog_block_invoke()
{
  qword_1EB30C6B8 = (uint64_t)os_log_create("com.apple.GeoServices", "ResourceManifest");
  return MEMORY[0x1F41817F8]();
}

id GEOGetRoutePreloaderLog()
{
  if (qword_1EB30C6D0 != -1) {
    dispatch_once(&qword_1EB30C6D0, &__block_literal_global_10);
  }
  unint64_t v0 = (void *)qword_1EB30C6C8;
  return v0;
}

uint64_t __GEOGetRoutePreloaderLog_block_invoke()
{
  qword_1EB30C6C8 = (uint64_t)os_log_create("com.apple.GeoServices", "RoutePreloader");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GEOGetUserDefaultsLog_block_invoke()
{
  qword_1EB30C6E8 = (uint64_t)os_log_create("com.apple.GeoServices", "UserDefaults");
  return MEMORY[0x1F41817F8]();
}

id GEOGetPOIBusynessLog()
{
  if (qword_1EB30C700 != -1) {
    dispatch_once(&qword_1EB30C700, &__block_literal_global_19);
  }
  unint64_t v0 = (void *)qword_1EB30C6F8;
  return v0;
}

uint64_t __GEOGetPOIBusynessLog_block_invoke()
{
  qword_1EB30C6F8 = (uint64_t)os_log_create("com.apple.GeoServices", "POIBusyness");
  return MEMORY[0x1F41817F8]();
}

id GEOGetLaunchLog()
{
  if (qword_1EB30C720 != -1) {
    dispatch_once(&qword_1EB30C720, &__block_literal_global_25);
  }
  unint64_t v0 = (void *)qword_1EB30C718;
  return v0;
}

uint64_t __GEOGetLaunchLog_block_invoke()
{
  qword_1EB30C718 = (uint64_t)os_log_create("com.apple.GeoServices", "Launch");
  return MEMORY[0x1F41817F8]();
}

id GEOGetPlaceCardLayoutLog()
{
  if (qword_1EB30C730 != -1) {
    dispatch_once(&qword_1EB30C730, &__block_literal_global_28);
  }
  unint64_t v0 = (void *)qword_1EB30C728;
  return v0;
}

uint64_t __GEOGetPlaceCardLayoutLog_block_invoke()
{
  qword_1EB30C728 = (uint64_t)os_log_create("com.apple.GeoServices", "PlaceCardLayout");
  return MEMORY[0x1F41817F8]();
}

id GEOGetSubscriptionsLog()
{
  if (qword_1EB30C740 != -1) {
    dispatch_once(&qword_1EB30C740, &__block_literal_global_31);
  }
  unint64_t v0 = (void *)qword_1EB30C738;
  return v0;
}

uint64_t __GEOGetSubscriptionsLog_block_invoke()
{
  qword_1EB30C738 = (uint64_t)os_log_create("com.apple.GeoServices", "Subscriptions");
  return MEMORY[0x1F41817F8]();
}

id GEOGetOfflineDataAccessLog()
{
  if (qword_1EB30C750 != -1) {
    dispatch_once(&qword_1EB30C750, &__block_literal_global_34);
  }
  unint64_t v0 = (void *)qword_1EB30C748;
  return v0;
}

uint64_t __GEOGetOfflineDataAccessLog_block_invoke()
{
  qword_1EB30C748 = (uint64_t)os_log_create("com.apple.GeoServices", "OfflineDataAccess");
  return MEMORY[0x1F41817F8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return MEMORY[0x1F40CBD80]();
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}