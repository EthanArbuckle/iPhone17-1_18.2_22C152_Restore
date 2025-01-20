@interface BRCFileCoordinator
+ (void)itemAtPath:(id)a3 logicalFilename:(id)a4 didMoveToPath:(id)a5 logicalFilename:(id)a6 hasContentUpdate:(BOOL)a7;
+ (void)itemAtPath:(id)a3 origLogicalName:(id)a4 didBounceToNewLogicalName:(id)a5;
+ (void)itemDidAppearAtPath:(id)a3 logicalFilename:(id)a4;
+ (void)itemDidChangeAtPath:(id)a3 logicalFilename:(id)a4;
+ (void)itemDidDisappearAtPath:(id)a3 logicalFilename:(id)a4;
- (BOOL)forRead;
- (BOOL)isUpdateForReconnecting;
- (BRCFileCoordinator)initWithSession:(id)a3 forRead:(BOOL)a4 doneHandler:(id)a5;
- (void)_didObtainCoordination:(id)a3 context:(id)a4 url1:(id)a5 url2:(id)a6 handler:(id)a7 fcHandler:(id)a8 error:(id)a9;
- (void)_willRequestCoordinationWithContext:(id)a3 url1:(id)a4 url2:(id)a5;
- (void)cancel;
- (void)cancelAfterDelay:(double)a3;
- (void)scheduleDeleteOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6;
- (void)scheduleReadOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6;
- (void)scheduleRenameOfItemAtURL:(id)a3 toItemAtURL:(id)a4 contentUpdate:(BOOL)a5 queue:(id)a6 taskTracker:(id)a7 accessor:(id)a8;
- (void)scheduleUpdateOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6;
- (void)setIsUpdateForReconnecting:(BOOL)a3;
@end

@implementation BRCFileCoordinator

- (BRCFileCoordinator)initWithSession:(id)a3 forRead:(BOOL)a4 doneHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRCFileCoordinator;
  v11 = [(BRCFileCoordinator *)&v19 init];
  v12 = v11;
  if (v11)
  {
    p_session = &v11->_session;
    objc_storeStrong((id *)&v11->_session, a3);
    if (!*p_session)
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCFileCoordinator initWithSession:forRead:doneHandler:]((uint64_t)v17, v18);
      }
    }
    uint64_t v14 = MEMORY[0x1D94389C0](v10);
    id doneHandler = v12->_doneHandler;
    v12->_id doneHandler = (id)v14;

    v12->_forRead = a4;
    v12->_startStamp = brc_current_date_nsec();
  }

  return v12;
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_cancelled = 1;
  timer = v2->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = v2->_timer;
    v2->_timer = 0;
  }
  objc_sync_exit(v2);

  v5.receiver = v2;
  v5.super_class = (Class)BRCFileCoordinator;
  [(BRCFileCoordinator *)&v5 cancel];
}

- (void)cancelAfterDelay:(double)a3
{
  if (a3 != 0.0)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!v4->_cancelled && !v4->_timer)
    {
      uint64_t v5 = brc_current_date_nsec() - v4->_startStamp;
      uint64_t v6 = (uint64_t)(a3 * 1000000000.0);
      if (v6 <= v5)
      {
        [(BRCFileCoordinator *)v4 cancel];
      }
      else
      {
        dispatch_time_t v7 = dispatch_time(0, v6 - v5);
        dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
        timer = v4->_timer;
        v4->_timer = (OS_dispatch_source *)v8;

        id v10 = v4->_timer;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __39__BRCFileCoordinator_cancelAfterDelay___block_invoke;
        v18[3] = &unk_1E6993698;
        v18[4] = v4;
        v11 = v10;
        v12 = v18;
        v13 = v11;
        uint64_t v14 = v12;
        v15 = v14;
        v16 = v14;
        if (*MEMORY[0x1E4F59658])
        {
          v16 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v14);
        }
        dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v16);
        dispatch_source_set_event_handler(v13, v17);

        dispatch_source_set_timer((dispatch_source_t)v4->_timer, v7, 0xFFFFFFFFFFFFFFFFLL, v6 / 10);
        dispatch_resume((dispatch_object_t)v4->_timer);
      }
    }
    objc_sync_exit(v4);
  }
}

uint64_t __39__BRCFileCoordinator_cancelAfterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)_willRequestCoordinationWithContext:(id)a3 url1:(id)a4 url2:(id)a5
{
  dispatch_source_t v8 = (NSURL *)a4;
  id v9 = (NSURL *)a5;
  [a3 startTracingCode];
  [(BRCFileCoordinator *)self hash];
  kdebug_trace();
  url1 = self->_url1;
  self->_url1 = v8;
  v12 = v8;

  url2 = self->_url2;
  self->_url2 = v9;
}

- (void)_didObtainCoordination:(id)a3 context:(id)a4 url1:(id)a5 url2:(id)a6 handler:(id)a7 fcHandler:(id)a8 error:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = [v16 tracker];
  v23 = [v16 queue];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke;
  v34[3] = &unk_1E69968F8;
  id v35 = v16;
  id v36 = v15;
  v37 = self;
  id v38 = v21;
  id v39 = v17;
  id v40 = v18;
  id v41 = v19;
  id v42 = v20;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_53;
  v31[3] = &unk_1E6994600;
  id v32 = v36;
  id v33 = v42;
  id v24 = v42;
  id v25 = v36;
  id v26 = v19;
  id v27 = v18;
  id v28 = v17;
  id v29 = v21;
  id v30 = v16;
  brc_task_tracker_async_with_logs_and_qos(v22, v23, DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, v34, v31);
}

void __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  memset(v46, 0, sizeof(v46));
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 sections];
  }
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v28 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v48 = v46[0];
    __int16 v49 = 2112;
    v50 = v28;
    __int16 v51 = 2112;
    v52 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Got coordinated %@%@", buf, 0x20u);
  }

  brc_current_date_nsec();
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(NSObject **)(v5 + 96);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v5 = *(void *)(a1 + 48);
  }
  if (*(unsigned char *)(v5 + 112) || objc_msgSend(*(id *)(a1 + 56), "br_isCocoaErrorCode:", 3072))
  {
    brc_bread_crumbs();
    dispatch_time_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      id v30 = [*(id *)(*(void *)(a1 + 48) + 80) path];
      brc_interval_from_nsec();
      *(_DWORD *)buf = 138413058;
      uint64_t v48 = v29;
      __int16 v49 = 2112;
      v50 = v30;
      __int16 v51 = 2048;
      v52 = v31;
      __int16 v53 = 2112;
      v54 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] Coordinated %@ request at '%@' canceled after %0.06f seconds%@", buf, 0x2Au);
    }
  }
  else if (*(void *)(a1 + 56))
  {
    brc_bread_crumbs();
    dispatch_time_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v12 = [*(id *)(*(void *)(a1 + 48) + 80) path];
      brc_interval_from_nsec();
      v13 = *(__CFString **)(a1 + 56);
      *(_DWORD *)buf = 138413314;
      uint64_t v48 = v11;
      __int16 v49 = 2112;
      v50 = v12;
      __int16 v51 = 2048;
      v52 = v14;
      __int16 v53 = 2112;
      v54 = v13;
      __int16 v55 = 2112;
      v56 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] Coordinated %@ request failed at '%@' in %0.06f seconds: %@%@", buf, 0x34u);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(v15 + 80);
    if (v16 && !*(void *)(a1 + 64) || (uint64_t v17 = *(void *)(v15 + 88)) != 0 && !*(void *)(a1 + 72))
    {
      brc_bread_crumbs();
      dispatch_time_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      dispatch_source_t v8 = brc_default_log();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        uint64_t v32 = *(void *)(a1 + 40);
        id v33 = [*(id *)(*(void *)(a1 + 48) + 80) path];
        brc_interval_from_nsec();
        *(_DWORD *)buf = 138413058;
        uint64_t v48 = v32;
        __int16 v49 = 2112;
        v50 = v33;
        __int16 v51 = 2048;
        v52 = v34;
        __int16 v53 = 2112;
        v54 = v7;
        _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] Coordinated %@ request failed at '%@' in %0.06f seconds%@", buf, 0x2Au);
      }
    }
    else
    {
      if (v16)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 48) + 80), *(id *)(a1 + 64));
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 88);
      }
      if (v17) {
        objc_storeStrong((id *)(*(void *)(a1 + 48) + 88), *(id *)(a1 + 72));
      }
      brc_bread_crumbs();
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v45 = *(void *)(a1 + 40);
        uint64_t v35 = *(void *)(a1 + 48);
        if (*(void *)(v35 + 88)) {
          id v36 = @"from";
        }
        else {
          id v36 = @"at";
        }
        v43 = v36;
        v37 = [*(id *)(v35 + 80) path];
        id v38 = *(void **)(*(void *)(a1 + 48) + 88);
        if (v38) {
          id v39 = @"' to '";
        }
        else {
          id v39 = &stru_1F2AC7720;
        }
        id v40 = [v38 path];
        brc_interval_from_nsec();
        id v42 = &stru_1F2AC7720;
        if (v40) {
          id v42 = v40;
        }
        *(_DWORD *)buf = 138413826;
        uint64_t v48 = v45;
        __int16 v49 = 2112;
        v50 = v43;
        __int16 v51 = 2112;
        v52 = v37;
        __int16 v53 = 2112;
        v54 = v39;
        __int16 v55 = 2112;
        v56 = v42;
        __int16 v57 = 2048;
        uint64_t v58 = v41;
        __int16 v59 = 2112;
        v60 = v18;
        _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Obtained coordinated %@ %@ '%@%@%@' in %0.06f seconds%@", buf, 0x48u);
      }
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      [*(id *)(a1 + 32) endTracingCode];
      [*(id *)(a1 + 48) hash];
      kdebug_trace();
      brc_current_date_nsec();
      brc_bread_crumbs();
      dispatch_time_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      dispatch_source_t v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v44 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        if (*(void *)(v20 + 88)) {
          id v21 = @"from";
        }
        else {
          id v21 = @"at";
        }
        v22 = [*(id *)(v20 + 80) path];
        v23 = *(void **)(*(void *)(a1 + 48) + 88);
        if (v23) {
          id v24 = @"' to '";
        }
        else {
          id v24 = &stru_1F2AC7720;
        }
        id v25 = [v23 path];
        brc_interval_from_nsec();
        if (v25) {
          id v27 = v25;
        }
        else {
          id v27 = &stru_1F2AC7720;
        }
        *(_DWORD *)buf = 138413826;
        uint64_t v48 = v44;
        __int16 v49 = 2112;
        v50 = v21;
        __int16 v51 = 2112;
        v52 = v22;
        __int16 v53 = 2112;
        v54 = v24;
        __int16 v55 = 2112;
        v56 = v27;
        __int16 v57 = 2048;
        uint64_t v58 = v26;
        __int16 v59 = 2112;
        v60 = v7;
        _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Releasing coordinated %@ %@ '%@%@%@' after %0.06f seconds%@", buf, 0x48u);
      }
    }
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 104);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
  uint64_t v10 = *(void *)(a1 + 88);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
  __brc_leave_section(v46);
}

uint64_t __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_53(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_53_cold_1(a1, (uint64_t)v2, v3);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)scheduleReadOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _os_activity_create(&dword_1D353B000, "coord-read", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  uint64_t v15 = [[BRCFileCoordinatorContext alloc] initWithTracker:v12 queue:v11 startCode:24 endCode:25];
  long long v27 = 0uLL;
  uint64_t v28 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleReadOfItemAtURL:queue:taskTracker:accessor:]", 224, &v27);
  uint64_t v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = v27;
    uint64_t v20 = [v10 path];
    *(_DWORD *)buf = 134218498;
    uint64_t v31 = v21;
    __int16 v32 = 2112;
    id v33 = v20;
    __int16 v34 = 2112;
    uint64_t v35 = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting coordinated read at '%@'%@", buf, 0x20u);
  }
  long long v25 = v27;
  uint64_t v26 = v28;
  [(BRCFileCoordinatorContext *)v15 setSections:&v25];
  [(BRCFileCoordinator *)self _willRequestCoordinationWithContext:v15 url1:v10 url2:0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke;
  v22[3] = &unk_1E6996920;
  id v18 = v13;
  id v24 = v18;
  v22[4] = self;
  id v19 = v15;
  v23 = v19;
  [(BRCFileCoordinator *)self __coordinateReadingItemAtURL:v10 options:65537 purposeID:@"com.apple.bird" byAccessor:v22];

  os_activity_scope_leave(&state);
}

void __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke_2;
  v13[3] = &unk_1E69952C0;
  id v8 = *(id *)(a1 + 48);
  id v14 = v7;
  id v15 = v8;
  id v9 = v7;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)MEMORY[0x1D94389C0](v13);
  [*(id *)(a1 + 32) _didObtainCoordination:@"read" context:*(void *)(a1 + 40) url1:v9 url2:0 handler:v12 fcHandler:v10 error:v11];
}

uint64_t __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)scheduleDeleteOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _os_activity_create(&dword_1D353B000, "coord-delete", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  id v15 = [[BRCFileCoordinatorContext alloc] initWithTracker:v12 queue:v11 startCode:26 endCode:27];
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleDeleteOfItemAtURL:queue:taskTracker:accessor:]", 244, &v28);
  uint64_t v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = v28;
    uint64_t v21 = [v10 path];
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    __int16 v34 = v21;
    __int16 v35 = 2112;
    uint64_t v36 = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting coordinated delete at '%@'%@", buf, 0x20u);
  }
  long long v26 = v28;
  uint64_t v27 = v29;
  [(BRCFileCoordinatorContext *)v15 setSections:&v26];
  [(BRCFileCoordinator *)self _willRequestCoordinationWithContext:v15 url1:v10 url2:0];
  url1 = self->_url1;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke;
  v23[3] = &unk_1E6996920;
  id v19 = v13;
  id v25 = v19;
  v23[4] = self;
  uint64_t v20 = v15;
  id v24 = v20;
  [(BRCFileCoordinator *)self __coordinateWritingItemAtURL:url1 options:1 purposeID:@"com.apple.bird" byAccessor:v23];

  os_activity_scope_leave(&state);
}

void __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke_2;
  v13[3] = &unk_1E69952C0;
  id v8 = *(id *)(a1 + 48);
  id v14 = v7;
  id v15 = v8;
  id v9 = v7;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)MEMORY[0x1D94389C0](v13);
  [*(id *)(a1 + 32) _didObtainCoordination:@"delete" context:*(void *)(a1 + 40) url1:v9 url2:0 handler:v12 fcHandler:v10 error:v11];
}

uint64_t __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 1);
}

- (void)scheduleUpdateOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _os_activity_create(&dword_1D353B000, "coord-write", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  id v15 = [[BRCFileCoordinatorContext alloc] initWithTracker:v12 queue:v11 startCode:22 endCode:23];
  long long v29 = 0uLL;
  uint64_t v30 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleUpdateOfItemAtURL:queue:taskTracker:accessor:]", 264, &v29);
  uint64_t v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = v29;
    uint64_t v22 = [v10 path];
    *(_DWORD *)buf = 134218498;
    uint64_t v33 = v23;
    __int16 v34 = 2112;
    __int16 v35 = v22;
    __int16 v36 = 2112;
    uint64_t v37 = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting coordinated write at '%@'%@", buf, 0x20u);
  }
  long long v27 = v29;
  uint64_t v28 = v30;
  [(BRCFileCoordinatorContext *)v15 setSections:&v27];
  [(BRCFileCoordinator *)self _willRequestCoordinationWithContext:v15 url1:v10 url2:0];
  if (self->_isUpdateForReconnecting) {
    uint64_t v18 = 0x20000;
  }
  else {
    uint64_t v18 = 4;
  }
  url1 = self->_url1;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke;
  v24[3] = &unk_1E6996920;
  id v20 = v13;
  id v26 = v20;
  v24[4] = self;
  uint64_t v21 = v15;
  id v25 = v21;
  [(BRCFileCoordinator *)self __coordinateWritingItemAtURL:url1 options:v18 purposeID:@"com.apple.bird" byAccessor:v24];

  os_activity_scope_leave(&state);
}

void __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke_2;
  v13[3] = &unk_1E69952C0;
  id v8 = *(id *)(a1 + 48);
  id v14 = v7;
  id v15 = v8;
  id v9 = v7;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)MEMORY[0x1D94389C0](v13);
  [*(id *)(a1 + 32) _didObtainCoordination:@"update" context:*(void *)(a1 + 40) url1:v9 url2:0 handler:v12 fcHandler:v10 error:v11];
}

uint64_t __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

- (void)scheduleRenameOfItemAtURL:(id)a3 toItemAtURL:(id)a4 contentUpdate:(BOOL)a5 queue:(id)a6 taskTracker:(id)a7 accessor:(id)a8
{
  BOOL v11 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v29 = a8;
  uint64_t v18 = _os_activity_create(&dword_1D353B000, "coord-rename", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v18, &state);
  id v19 = [[BRCFileCoordinatorContext alloc] initWithTracker:v17 queue:v16 startCode:28 endCode:29];
  long long v35 = 0uLL;
  uint64_t v36 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleRenameOfItemAtURL:toItemAtURL:contentUpdate:queue:taskTracker:accessor:]", 294, &v35);
  id v20 = brc_bread_crumbs();
  uint64_t v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v35;
    uint64_t v28 = [v14 path];
    uint64_t v25 = [v15 path];
    *(_DWORD *)buf = 134218754;
    uint64_t v39 = v27;
    __int16 v40 = 2112;
    uint64_t v41 = v28;
    __int16 v42 = 2112;
    uint64_t v43 = v25;
    __int16 v44 = 2112;
    uint64_t v45 = v20;
    id v26 = (void *)v25;
    _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting rename from '%@' to '%@'%@", buf, 0x2Au);
  }
  long long v33 = v35;
  uint64_t v34 = v36;
  [(BRCFileCoordinatorContext *)v19 setSections:&v33];
  [(BRCFileCoordinator *)self _willRequestCoordinationWithContext:v19 url1:v14 url2:v15];
  if (v11) {
    uint64_t v22 = 6;
  }
  else {
    uint64_t v22 = 2;
  }
  if ((objc_msgSend(v14, "br_isInTrash", v26) & 1) == 0) {
    v22 |= objc_msgSend(v15, "br_isInTrash");
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke;
  v30[3] = &unk_1E6996970;
  id v23 = v29;
  id v32 = v23;
  v30[4] = self;
  id v24 = v19;
  uint64_t v31 = v24;
  [(BRCFileCoordinator *)self __coordinateWritingItemAtURL:v14 options:v22 writingItemAtURL:v15 options:8 purposeID:@"com.apple.bird" byAccessor:v30];

  os_activity_scope_leave(&state);
}

void __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke_2;
  id v20 = &unk_1E6996948;
  id v11 = *(id *)(a1 + 48);
  id v22 = v10;
  id v23 = v11;
  id v21 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = a5;
  id v15 = a4;
  id v16 = (void *)MEMORY[0x1D94389C0](&v17);
  objc_msgSend(*(id *)(a1 + 32), "_didObtainCoordination:context:url1:url2:handler:fcHandler:error:", @"rename", *(void *)(a1 + 40), v13, v12, v16, v14, v15, v17, v18, v19, v20);
}

uint64_t __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (void)itemDidChangeAtPath:(id)a3 logicalFilename:(id)a4
{
  v4 = [a3 logicalURLWithLogicalName:a4];
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[BRCFileCoordinator itemDidChangeAtPath:logicalFilename:](v4);
  }

  objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didChangeWithPurposeID:", v4, @"com.apple.bird");
}

+ (void)itemDidAppearAtPath:(id)a3 logicalFilename:(id)a4
{
  v4 = [a3 logicalURLWithLogicalName:a4];
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[BRCFileCoordinator itemDidAppearAtPath:logicalFilename:](v4);
  }

  objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didReconnectWithPurposeID:", v4, @"com.apple.bird");
}

+ (void)itemDidDisappearAtPath:(id)a3 logicalFilename:(id)a4
{
  v4 = [a3 logicalURLWithLogicalName:a4];
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[BRCFileCoordinator itemDidDisappearAtPath:logicalFilename:](v4);
    }

    objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didDisappearWithPurposeID:", v4, @"com.apple.bird");
  }
}

+ (void)itemAtPath:(id)a3 origLogicalName:(id)a4 didBounceToNewLogicalName:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [a3 logicalURLWithLogicalName:a4];
  id v9 = [v8 URLByDeletingLastPathComponent];
  id v10 = [v9 URLByAppendingPathComponent:v7];

  objc_msgSend(v10, "br_addPhysicalProperty");
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v8 path];
    id v14 = [v10 path];
    int v15 = 138412802;
    id v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] hinting file coordinator of a bounce\n    from '%@'\n      to '%@'%@", (uint8_t *)&v15, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didMoveToURL:purposeID:", v8, v10, @"com.apple.bird");
}

+ (void)itemAtPath:(id)a3 logicalFilename:(id)a4 didMoveToPath:(id)a5 logicalFilename:(id)a6 hasContentUpdate:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a5;
  id v13 = [a3 logicalURLWithLogicalName:a4];
  id v14 = [v12 logicalURLWithLogicalName:v11];

  int v15 = brc_bread_crumbs();
  id v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (v7) {
      __int16 v17 = " and content update";
    }
    else {
      __int16 v17 = "";
    }
    uint64_t v18 = [v13 path];
    __int16 v19 = [v14 path];
    int v20 = 136315906;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    id v23 = v18;
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] hinting file coordinator of a move%s\n    from '%@'\n      to '%@'%@", (uint8_t *)&v20, 0x2Au);
  }
  objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didMoveToURL:purposeID:", v13, v14, @"com.apple.bird");
  if (v7) {
    objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didChangeWithPurposeID:", v14, @"com.apple.bird");
  }
}

- (BOOL)isUpdateForReconnecting
{
  return self->_isUpdateForReconnecting;
}

- (void)setIsUpdateForReconnecting:(BOOL)a3
{
  self->_isUpdateForReconnecting = a3;
}

- (BOOL)forRead
{
  return self->_forRead;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_url2, 0);
  objc_storeStrong((id *)&self->_url1, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)initWithSession:(uint64_t)a1 forRead:(NSObject *)a2 doneHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _session%@", (uint8_t *)&v2, 0xCu);
}

void __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_53_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Canceling coordinated %@ because task tracker is cancelled%@", (uint8_t *)&v4, 0x16u);
}

+ (void)itemDidChangeAtPath:(void *)a1 logicalFilename:.cold.1(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] hinting file coordinator of a change\n    at '%@'%@", v4, v5, v6, v7, v8);
}

+ (void)itemDidAppearAtPath:(void *)a1 logicalFilename:.cold.1(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] hinting file coordinator of a reconnect\n    at '%@'%@", v4, v5, v6, v7, v8);
}

+ (void)itemDidDisappearAtPath:(void *)a1 logicalFilename:.cold.1(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] hinting file coordinator of delete\n    at '%@'%@", v4, v5, v6, v7, v8);
}

@end