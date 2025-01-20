@interface MX_NetworkObserver
- (BOOL)isCarrierNetworkReachable;
- (MX_NetworkObserver)init;
- (void)dealloc;
- (void)networkPathUpdate:(id)a3;
@end

@implementation MX_NetworkObserver

- (MX_NetworkObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)MX_NetworkObserver;
  v2 = [(MX_NetworkObserver *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.coremedia.networkobserver", v3);
    v2->mAccessQueue = (OS_dispatch_queue *)v4;
    v2->mNetworkReachable = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__MX_NetworkObserver_init__block_invoke;
    block[3] = &unk_1E57C6368;
    block[4] = v2;
    dispatch_async(v4, block);
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  mMonitor = self->mMonitor;
  if (mMonitor)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    v5 = (void (*)(OS_nw_path_monitor *))getnw_path_monitor_cancelSymbolLoc_ptr;
    v19 = getnw_path_monitor_cancelSymbolLoc_ptr;
    if (!getnw_path_monitor_cancelSymbolLoc_ptr)
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __getnw_path_monitor_cancelSymbolLoc_block_invoke;
      v14 = &unk_1E57C5B30;
      v15 = &v16;
      v6 = (void *)NetworkLibrary();
      v17[3] = (uint64_t)dlsym(v6, "nw_path_monitor_cancel");
      getnw_path_monitor_cancelSymbolLoc_ptr = *(_UNKNOWN **)(v15[1] + 24);
      v5 = (void (*)(OS_nw_path_monitor *))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v5)
    {
      v9 = (_Unwind_Exception *)__68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v9);
    }
    v5(mMonitor);
    soft_nw_release((uint64_t)self->mMonitor);
  }
  mCurrentPath = self->mCurrentPath;
  if (mCurrentPath) {
    soft_nw_release((uint64_t)mCurrentPath);
  }
  mAccessQueue = self->mAccessQueue;
  if (mAccessQueue) {
    dispatch_release(mAccessQueue);
  }
  v10.receiver = self;
  v10.super_class = (Class)MX_NetworkObserver;
  [(MX_NetworkObserver *)&v10 dealloc];
}

- (void)networkPathUpdate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int mNetworkReachable = self->mNetworkReachable;
    mCurrentPath = self->mCurrentPath;
    if (mCurrentPath)
    {
      soft_nw_release((uint64_t)mCurrentPath);
      self->mCurrentPath = 0;
    }
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    objc_super v7 = (uint64_t (*)(id))getnw_retainSymbolLoc_ptr;
    v20 = getnw_retainSymbolLoc_ptr;
    if (!getnw_retainSymbolLoc_ptr)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getnw_retainSymbolLoc_block_invoke;
      v24 = &unk_1E57C5B30;
      v25 = &v17;
      v8 = (void *)NetworkLibrary();
      v9 = dlsym(v8, "nw_retain");
      *(void *)(v25[1] + 24) = v9;
      getnw_retainSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
      objc_super v7 = (uint64_t (*)(id))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v7) {
      goto LABEL_16;
    }
    objc_super v10 = (OS_nw_path *)v7(a3);
    self->mCurrentPath = v10;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v11 = (uint64_t (*)(OS_nw_path *))getnw_path_get_statusSymbolLoc_ptr;
    v20 = getnw_path_get_statusSymbolLoc_ptr;
    if (!getnw_path_get_statusSymbolLoc_ptr)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getnw_path_get_statusSymbolLoc_block_invoke;
      v24 = &unk_1E57C5B30;
      v25 = &v17;
      uint64_t v12 = (void *)NetworkLibrary();
      v13 = dlsym(v12, "nw_path_get_status");
      *(void *)(v25[1] + 24) = v13;
      getnw_path_get_statusSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
      uint64_t v11 = (uint64_t (*)(OS_nw_path *))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v11)
    {
LABEL_16:
      __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
      __break(1u);
    }
    int v14 = (v11(v10) & 0xFFFFFFFD) == 1;
    self->int mNetworkReachable = v14;
    if (mNetworkReachable != v14 && dword_1E9359ED0 != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (BOOL)isCarrierNetworkReachable
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mAccessQueue = self->mAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MX_NetworkObserver_isCarrierNetworkReachable__block_invoke;
  v5[3] = &unk_1E57C96A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_async_and_wait(mAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end