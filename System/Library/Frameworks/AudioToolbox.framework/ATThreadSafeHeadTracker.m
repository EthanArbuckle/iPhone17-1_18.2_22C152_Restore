@interface ATThreadSafeHeadTracker
- (ATThreadSafeHeadTracker)initWithRateLimit:(float)a3 detectPredictionAnchor:(BOOL)a4 userContext:(void *)a5 factory:(void *)a6 execution:(void *)a7 finalizer:(void *)a8;
- (id).cxx_construct;
- (void)dealloc;
- (void)handleSystemSleepMonitorDidWakeFromSleep;
@end

@implementation ATThreadSafeHeadTracker

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepMonitor, 0);
  cntrl = self->_impl.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)handleSystemSleepMonitorDidWakeFromSleep
{
  v3 = ATThreadSafeHeadTrackerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_DEFAULT, "re-creating predictor after system did wake from sleep", v9, 2u);
  }

  ptr = self->_impl.__ptr_;
  uint64_t v5 = (*((uint64_t (**)(void))ptr + 4))(*((void *)ptr + 5));
  if (v5)
  {
    unint64_t v6 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)ptr + 5);
    unint64_t v7 = atomic_load((unint64_t *)ptr + 3);
    atomic_store(v6, (unint64_t *)ptr + 3);
    os_unfair_lock_unlock((os_unfair_lock_t)ptr + 5);
    if (v7) {
      (*((void (**)(unint64_t))ptr + 7))(v7);
    }
    v8 = ATThreadSafeHeadTrackerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3931000, v8, OS_LOG_TYPE_DEFAULT, "swapped in recreated predictor and destroyed old predictor", buf, 2u);
    }
  }
  else
  {
    v8 = ATThreadSafeHeadTrackerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A3931000, v8, OS_LOG_TYPE_ERROR, "ATTSHT failed to recreate predictor", v11, 2u);
    }
  }
}

- (void)dealloc
{
  [(SWSystemSleepMonitor *)self->_sleepMonitor removeObserver:self];
  [(SWSystemSleepMonitor *)self->_sleepMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATThreadSafeHeadTracker;
  [(ATThreadSafeHeadTracker *)&v3 dealloc];
}

- (ATThreadSafeHeadTracker)initWithRateLimit:(float)a3 detectPredictionAnchor:(BOOL)a4 userContext:(void *)a5 factory:(void *)a6 execution:(void *)a7 finalizer:(void *)a8
{
  v42.receiver = self;
  v42.super_class = (Class)ATThreadSafeHeadTracker;
  v14 = [(ATThreadSafeHeadTracker *)&v42 init];
  if (!v14) {
    return (ATThreadSafeHeadTracker *)v14;
  }
  if (a6 && a7 && a8)
  {
    v15 = (char *)operator new(0xE0uLL);
    *(_OWORD *)(v15 + 8) = 0u;
    *(void *)v15 = &unk_1EF72B8F0;
    *((_OWORD *)v15 + 2) = 0u;
    v16 = v15 + 32;
    float v17 = 1.0 / a3;
    if (a3 <= 0.0) {
      float v17 = 0.01;
    }
    *((float *)v15 + 12) = v17;
    *((_DWORD *)v15 + 13) = 0;
    *((void *)v15 + 7) = 0;
    *((void *)v15 + 8) = a6;
    *((void *)v15 + 9) = a5;
    *((void *)v15 + 10) = a7;
    *((void *)v15 + 11) = a8;
  }
  else
  {
    v15 = (char *)operator new(0xE0uLL);
    *(_OWORD *)(v15 + 8) = 0u;
    *(void *)v15 = &unk_1EF72B8F0;
    *((_OWORD *)v15 + 2) = 0u;
    v16 = v15 + 32;
    float v18 = 1.0 / a3;
    if (a3 <= 0.0) {
      float v18 = 0.01;
    }
    *((float *)v15 + 12) = v18;
    *((_DWORD *)v15 + 13) = 0;
    *((void *)v15 + 7) = 0;
    *((void *)v15 + 8) = CreateDefaultPredictor;
    *((void *)v15 + 9) = 0;
    *((void *)v15 + 10) = ExecuteDefaultPredictor;
    *((void *)v15 + 11) = FinalizeDefaultPredictor;
  }
  uint64_t v19 = MEMORY[0x1E4F149A0];
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  *((_OWORD *)v15 + 6) = *MEMORY[0x1E4F149A0];
  *((_OWORD *)v15 + 7) = v20;
  long long v21 = *(_OWORD *)(v19 + 48);
  *((_OWORD *)v15 + 8) = *(_OWORD *)(v19 + 32);
  *((_OWORD *)v15 + 9) = v21;
  *((void *)v15 + 20) = 0;
  *((void *)v15 + 22) = 0;
  v15[184] = a4;
  *((void *)v15 + 24) = 0;
  v15[200] = 1;
  *((_DWORD *)v15 + 51) = 0;
  *((_DWORD *)v15 + 52) = 0;
  *(void *)&long long block = v16;
  *((void *)&block + 1) = v15;
  std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&block, v16, (uint64_t)v16);
  v22 = (std::__shared_weak_count *)*((void *)v14 + 2);
  *(_OWORD *)(v14 + 8) = block;
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  uint64_t v23 = *((void *)v14 + 1);
  v25 = *(void **)v23;
  v24 = *(std::__shared_weak_count **)(v23 + 8);
  if (v24) {
    atomic_fetch_add_explicit(&v24->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  v26 = dispatch_get_global_queue(25, 0);
  v27 = v26;
  *(void *)&long long block = MEMORY[0x1E4F143A8];
  *((void *)&block + 1) = 3321888768;
  v58 = ___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke;
  v59 = &__block_descriptor_56_ea8_40c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e5_v8__0l;
  v60 = (uint64_t *)v23;
  v61 = v25;
  v62 = v24;
  if (v24) {
    atomic_fetch_add_explicit(&v24->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v26, &block);

  if (!*(unsigned char *)(v23 + 152))
  {
LABEL_30:
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3321888768;
    v43[2] = ___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke_90;
    v43[3] = &__block_descriptor_48_ea8_32c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e8_v12__0i8l;
    v43[4] = v25;
    v44 = v24;
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    notify_register_dispatch("com.apple.coreaudio.attsht", (int *)(v23 + 172), v27, v43);

    if (v44) {
      std::__shared_weak_count::__release_weak(v44);
    }
    if (v62) {
      std::__shared_weak_count::__release_weak(v62);
    }
    if (v24) {
      std::__shared_weak_count::__release_weak(v24);
    }
    uint64_t v51 = 0;
    uint64_t v52 = (uint64_t)&v51;
    uint64_t v53 = 0x2050000000;
    v35 = (void *)getSWSystemSleepMonitorClass(void)::softClass;
    v54 = (void *)getSWSystemSleepMonitorClass(void)::softClass;
    if (!getSWSystemSleepMonitorClass(void)::softClass)
    {
      *(void *)&long long block = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3221225472;
      v58 = ___ZL28getSWSystemSleepMonitorClassv_block_invoke;
      v59 = &unk_1E5B16400;
      v60 = &v51;
      ___ZL28getSWSystemSleepMonitorClassv_block_invoke((uint64_t)&block);
      v35 = *(void **)(v52 + 24);
    }
    v36 = v35;
    _Block_object_dispose(&v51, 8);
    uint64_t v37 = [[v36 alloc] initWithIdentifier:@"ATThreadSafeHeadTracker" queue:v27];
    v38 = (void *)*((void *)v14 + 3);
    *((void *)v14 + 3) = v37;

    [*((id *)v14 + 3) addObserver:v14];
    return (ATThreadSafeHeadTracker *)v14;
  }
  v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t handler = 0;
  p_uint64_t handler = (uint64_t)&handler;
  uint64_t v47 = 0x2020000000;
  v29 = (id *)getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr;
  v48 = (void *)getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr;
  if (!getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr)
  {
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    uint64_t v53 = (uint64_t)___ZL49getAVAudioSessionRouteChangeNotificationSymbolLocv_block_invoke;
    v54 = &unk_1E5B16400;
    v55 = &handler;
    v30 = AudioSessionLibrary();
    v31 = dlsym(v30, "AVAudioSessionRouteChangeNotification");
    *(void *)(v55[1] + 24) = v31;
    getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr = *(void *)(v55[1] + 24);
    v29 = *(id **)(p_handler + 24);
  }
  _Block_object_dispose(&handler, 8);
  if (v29)
  {
    id v32 = *v29;
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3321888768;
    uint64_t v53 = (uint64_t)___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke_80;
    v54 = &__block_descriptor_48_ea8_32c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e24_v16__0__NSNotification_8l;
    v55 = v25;
    v56 = v24;
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v33 = [v28 addObserverForName:v32 object:0 queue:0 usingBlock:&v51];
    v34 = *(void **)(v23 + 160);
    *(void *)(v23 + 160) = v33;

    uint64_t handler = MEMORY[0x1E4F143A8];
    p_uint64_t handler = 3321888768;
    uint64_t v47 = (uint64_t)___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke_84;
    v48 = &__block_descriptor_48_ea8_32c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e8_v12__0i8l;
    v49 = v25;
    v50 = v24;
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    notify_register_dispatch("com.apple.coreaudio.attsht.outputlatency", (int *)(v23 + 176), v27, &handler);

    if (v50) {
      std::__shared_weak_count::__release_weak(v50);
    }
    if (v56) {
      std::__shared_weak_count::__release_weak(v56);
    }

    goto LABEL_30;
  }
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  v41 = [NSString stringWithUTF8String:"NSString *getAVAudioSessionRouteChangeNotification()"];
  objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, @"ATThreadSafeHeadTracker.mm", 38, @"%s", dlerror());

  __break(1u);
  return result;
}

@end