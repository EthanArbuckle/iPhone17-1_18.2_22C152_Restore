@interface BRCFSEventsMonitor
- (BOOL)_queueEvents:(id)a3 markSelfEncountered:(BOOL)a4;
- (BOOL)isCancelled;
- (BOOL)openWithRoot:(id)a3 isImmutableRoot:(BOOL)a4 volume:(id)a5 error:(id *)a6;
- (BOOL)openWithRoot:(id)a3 volume:(id)a4 error:(id *)a5;
- (BOOL)setUpRoot:(id)a3 isImmutableRoot:(BOOL)a4 volume:(id)a5 error:(id *)a6;
- (BOOL)setUpStreamSynchronously:(BOOL)a3 reason:(id)a4 error:(id *)a5;
- (BOOL)volumeIsCaseSensitive;
- (BRCFSEventsDelegate)delegate;
- (BRCFSEventsMonitor)initWithAccountSession:(id)a3;
- (BRCFSEventsMonitor)initWithAccountSession:(id)a3 name:(id)a4;
- (BRCRelativePath)root;
- (NSString)description;
- (PQLConnection)db;
- (void)_cancel;
- (void)_close;
- (void)_updatePersistedStateWithState:(id)a3;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)didProcessEventID:(unint64_t)a3;
- (void)flushStream;
- (void)fseventAtPath:(id)a3 withFlags:(unsigned int)a4 andID:(unint64_t)a5 eventIndex:(unsigned int)a6 eventCount:(unsigned int)a7 initialScan:(BOOL)a8;
- (void)fseventOnRootWithEventID:(unint64_t)a3 andReason:(id)a4;
- (void)processFseventBatch;
- (void)queueEvents:(id)a3 markSelfEncountered:(BOOL)a4;
- (void)resetWithReason:(id)a3;
- (void)resetWithReason:(id)a3 dropFSEventID:(BOOL)a4;
- (void)resume;
- (void)setDB:(id)a3;
- (void)setDelegate:(id)a3;
- (void)signalAfterCurrentFSEvent:(id)a3;
- (void)stopWatcher;
- (void)suspend;
@end

@implementation BRCFSEventsMonitor

- (BOOL)volumeIsCaseSensitive
{
  return [(BRCVolume *)self->_volume isCaseSensitive];
}

- (BOOL)setUpRoot:(id)a3 isImmutableRoot:(BOOL)a4 volume:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  int v57 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  if (!v12)
  {
    v44 = brc_bread_crumbs();
    v45 = brc_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
      -[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]();
    }
  }
  p_root = &self->_root;
  objc_storeStrong((id *)&self->_root, a3);
  objc_storeStrong((id *)&self->_volume, a5);
  root = self->_root;
  if (v8)
  {
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    v48 = __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke;
    v49 = &unk_1E699BAD8;
    v50 = self;
    id v51 = v11;
    v52 = &v53;
    [(BRCRelativePath *)root performOnOpenFileDescriptor:&v46 error:&v57];
    if (v57)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v46, v47, v48, v49, v50);
      if (v15)
      {
        v16 = brc_bread_crumbs();
        v17 = brc_default_log();
        if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
        {
          v42 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v59 = "-[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]";
          __int16 v60 = 2080;
          if (!a6) {
            v42 = "(ignored by caller)";
          }
          *(void *)v61 = v42;
          *(_WORD *)&v61[8] = 2112;
          *(void *)&v61[10] = v15;
          __int16 v62 = 2112;
          v63 = v16;
          _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v15;
      }

LABEL_29:
      BOOL v32 = 0;
      goto LABEL_34;
    }
  }
  else if ([(BRCRelativePath *)*p_root resolveAndKeepOpenMustExist:0 error:&v57])
  {
    uint64_t v18 = [(BRCRelativePath *)*p_root fileID];
    v54[3] = v18;
    [(BRCRelativePath *)*p_root close];
  }
  else
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v41 = *p_root;
      *(_DWORD *)buf = 138412802;
      v59 = (const char *)v41;
      __int16 v60 = 1024;
      *(_DWORD *)v61 = v57;
      *(_WORD *)&v61[4] = 2112;
      *(void *)&v61[6] = v19;
      _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] root:%@ can't be opened %{errno}d%@", buf, 0x1Cu);
    }
  }
  v21 = brc_bread_crumbs();
  v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v59 = (const char *)v11;
    __int16 v60 = 2112;
    *(void *)v61 = v12;
    *(_WORD *)&v61[8] = 2112;
    *(void *)&v61[10] = v21;
    _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[NOTICE] root:'%@' is on device: %@%@", buf, 0x20u);
  }

  uint64_t v23 = v54[3];
  if (v23 != [(BRCFSEventsPersistedState *)self->_persistedState rootID])
  {
    if ([(BRCFSEventsPersistedState *)self->_persistedState rootID] && v8)
    {
      v24 = brc_bread_crumbs();
      v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_root;
        unint64_t v27 = [(BRCFSEventsPersistedState *)self->_persistedState rootID];
        uint64_t v28 = v54[3];
        *(_DWORD *)buf = 138413058;
        v59 = (const char *)v26;
        __int16 v60 = 2048;
        *(void *)v61 = v27;
        *(_WORD *)&v61[8] = 2048;
        *(void *)&v61[10] = v28;
        __int16 v62 = 2112;
        v63 = v24;
        _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] root %@ changed ino from %llu to %llu%@", buf, 0x2Au);
      }

      v29 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 70);
      if (v29)
      {
        v30 = brc_bread_crumbs();
        v31 = brc_default_log();
        if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
        {
          v43 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v59 = "-[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]";
          __int16 v60 = 2080;
          if (!a6) {
            v43 = "(ignored by caller)";
          }
          *(void *)v61 = v43;
          *(_WORD *)&v61[8] = 2112;
          *(void *)&v61[10] = v29;
          __int16 v62 = 2112;
          v63 = v30;
          _os_log_error_impl(&dword_1D353B000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a6) {
        *a6 = v29;
      }

      goto LABEL_29;
    }
    v33 = (void *)[(BRCFSEventsPersistedState *)self->_persistedState copy];
    objc_msgSend(v33, "setRootID:", -[BRCRelativePath fileID](*p_root, "fileID"));
    [(BRCFSEventsMonitor *)self _updatePersistedStateWithState:v33];
  }
  v34 = NSString;
  objc_msgSend(v12, "mountPath", v46, v47, v48, v49, v50);
  id v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "br_pathWithFileSystemRepresentation:", objc_msgSend(v35, "fileSystemRepresentation"));
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  devicePath = self->_devicePath;
  self->_devicePath = v36;

  v38 = brc_bread_crumbs();
  v39 = brc_default_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]();
  }

  BOOL v32 = 1;
LABEL_34:
  _Block_object_dispose(&v53, 8);

  return v32;
}

uint64_t __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 168) isDocument]) {
    return 20;
  }
  if (fcntl(a2, 64, 3))
  {
    int v5 = *__error();
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v18;
      __int16 v23 = 1024;
      int v24 = v5;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_1D353B000, v7, (os_log_type_t)0x90u, "[ERROR] Can't set data protection on '%@' %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v5;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 168) fileID];
  int v8 = dup(a2);
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F144A8], v8, 0x21uLL, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 80));
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v9;

  id v12 = *(void **)(*(void *)(a1 + 32) + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke_49;
  v19[3] = &unk_1E6993698;
  id v20 = *(id *)(a1 + 40);
  v13 = v12;
  v14 = v19;
  v15 = v14;
  v16 = v14;
  if (*MEMORY[0x1E4F59658])
  {
    v16 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v14);
  }
  dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v16);
  dispatch_source_set_event_handler(v13, v17);

  return 0;
}

void __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke_49(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  abc_report_panic_with_signature();
  v2 = NSString;
  id v3 = [*(id *)(a1 + 32) filename];
  objc_msgSend(v2, "stringWithFormat:", @"the root %s was deleted by an external process", objc_msgSend(v3, "fileSystemRepresentation"));
  objc_claimAutoreleasedReturnValue();

  v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = brc_append_system_info_to_message();
    *(_DWORD *)buf = 138412546;
    dispatch_source_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_fault_impl(&dword_1D353B000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);
  }
  brc_append_system_info_to_message();
  v7 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/legacy/BRCFSEventsMonitor.m", 168, v7);
}

- (BOOL)setUpStreamSynchronously:(BOOL)a3 reason:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  int v8 = (__CFString *)a4;
  self->_drainEvents = 0;
  v65 = [(BRCFSEventsPersistedState *)self->_persistedState streamUUID];
  CFUUIDRef v9 = FSEventsCopyUUIDForDevice([(BRCVolume *)self->_volume deviceID]);
  if (v9)
  {
    CFUUIDRef v10 = v9;
    CFStringRef v11 = CFUUIDCreateString(0, v9);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
    CFRelease(v11);
    CFRelease(v10);
  }
  else
  {
    uint64_t v12 = 0;
  }
  v66 = +[BRCUserDefaults defaultsForMangledID:0];
  [v66 fseventsLatency];
  CFTimeInterval v14 = v13;
  if (v12)
  {
    if (v65)
    {
      if (objc_msgSend(v12, "isEqual:"))
      {
        v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v58 = [(BRCVolume *)self->_volume deviceID];
          v59 = [v12 UUIDString];
          unint64_t v60 = [(BRCFSEventsPersistedState *)self->_persistedState latestEventID];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&uint8_t buf[4] = v58;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v59;
          *(_WORD *)&buf[18] = 2048;
          *(CFTimeInterval *)&buf[20] = v14;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v60;
          *(_WORD *)&buf[38] = 2112;
          *(void *)&buf[40] = v15;
          _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] resuming fsevents on device:%u uuid:%@ latency:%f from id:%llu%@", buf, 0x30u);
        }
        goto LABEL_22;
      }
      dispatch_block_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        int v64 = [(BRCVolume *)self->_volume deviceID];
        v61 = [v65 UUIDString];
        __int16 v62 = [v12 UUIDString];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&uint8_t buf[4] = v64;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v61;
        *(_WORD *)&buf[18] = 2114;
        *(void *)&buf[20] = v62;
        *(_WORD *)&buf[28] = 2048;
        *(CFTimeInterval *)&buf[30] = v14;
        *(_WORD *)&buf[38] = 2112;
        *(void *)&buf[40] = v17;
        _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] device:%u changed uuid from %{public}@ to %{public}@ - falling back to full scan latency:%f%@", buf, 0x30u);
      }
      v19 = @"device changed fsevent UUID";
    }
    else
    {
      dispatch_block_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v55 = [(BRCVolume *)self->_volume deviceID];
        uint64_t v56 = [v12 UUIDString];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v56;
        *(_WORD *)&buf[18] = 2048;
        *(CFTimeInterval *)&buf[20] = v14;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v17;
        _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] starting fsevents on device:%u uuid:%@ latency:%f%@", buf, 0x26u);
      }
      v19 = @"creating a new stream";
    }
  }
  else
  {
    dispatch_block_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v63 = [(BRCVolume *)self->_volume deviceID];
      uint64_t v53 = [v65 UUIDString];
      v54 = [0 UUIDString];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v63;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v53;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v54;
      *(_WORD *)&buf[28] = 2048;
      *(CFTimeInterval *)&buf[30] = v14;
      *(_WORD *)&buf[38] = 2112;
      *(void *)&buf[40] = v17;
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] device:%u changed uuid from %@ to %@ - falling back to full scan latency:%f%@", buf, 0x30u);
    }
    v19 = @"historical events not availible";
  }

  if (!v8) {
    int v8 = v19;
  }
  v15 = (void *)[(BRCFSEventsPersistedState *)self->_persistedState copy];
  [v15 setStreamUUID:v12];
  [(BRCFSEventsMonitor *)self _updatePersistedStateWithState:v15];
LABEL_22:

  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  if ([(BRCFSEventsPersistedState *)self->_persistedState latestEventID]) {
    FSEventStreamEventId v20 = [(BRCFSEventsPersistedState *)self->_persistedState latestEventID];
  }
  else {
    FSEventStreamEventId v20 = -1;
  }
  v21 = [(BRCRelativePath *)self->_root absolutePath];
  v75 = v21;
  self->_stream = FSEventStreamCreate(0, (FSEventStreamCallback)fseventsCallback, &context, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1], v20, v14, 0x31u);

  stream = self->_stream;
  if (stream)
  {
    __int16 v23 = +[BRCUserDefaults defaultsForMangledID:0];
    int v24 = [v23 scheduleDeepScanOnFSEventsReset];

    if (v20 == -1) {
      int v25 = v24;
    }
    else {
      int v25 = 0;
    }
    if (v25 == 1)
    {
      v26 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
      uint64_t v27 = [v26 lostScanGroup];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      buf[24] = 1;
      dispatch_group_enter(v27);
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke;
      v70[3] = &unk_1E69991A0;
      v70[4] = self;
      v71 = v8;
      v73 = buf;
      uint64_t v28 = v27;
      v72 = v28;
      uint64_t v29 = MEMORY[0x1D94389C0](v70);
      v30 = (void *)v29;
      if (v6)
      {
        (*(void (**)(uint64_t))(v29 + 16))(v29);
      }
      else
      {
        v37 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
        v38 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, v37);
        historicalEventSource = self->_historicalEventSource;
        self->_historicalEventSource = v38;

        v40 = self->_historicalEventSource;
        id v41 = v30;
        v42 = v40;
        id v43 = v41;
        v44 = v43;
        v45 = v43;
        if (*MEMORY[0x1E4F59658])
        {
          v45 = ((void (*)(id))*MEMORY[0x1E4F59658])(v43);
        }
        dispatch_block_t v46 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v45);
        dispatch_source_set_event_handler(v42, v46);

        uint64_t v47 = self->_historicalEventSource;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke_69;
        v67[3] = &unk_1E6996218;
        v69 = buf;
        v68 = v28;
        v48 = v47;
        v49 = v67;
        v50 = v49;
        if (*MEMORY[0x1E4F59658])
        {
          uint64_t v51 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v49);

          v50 = (void *)v51;
        }
        dispatch_source_set_cancel_handler(v48, v50);

        dispatch_source_merge_data((dispatch_source_t)self->_historicalEventSource, 1uLL);
      }

      _Block_object_dispose(buf, 8);
    }
    FSEventStreamSetDispatchQueue(self->_stream, (dispatch_queue_t)self->_streamQueue);
  }
  else
  {
    v31 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v31)
    {
      BOOL v32 = brc_bread_crumbs();
      v33 = brc_default_log();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        int v57 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[BRCFSEventsMonitor setUpStreamSynchronously:reason:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5) {
          int v57 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v57;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v31;
        *(_WORD *)&buf[32] = 2112;
        *(void *)&buf[34] = v32;
        _os_log_error_impl(&dword_1D353B000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v31;
    }

    uint64_t v34 = *__error();
    id v35 = brc_bread_crumbs();
    v36 = brc_default_log();
    if (os_log_type_enabled(v36, (os_log_type_t)0x90u)) {
      -[BRCFSEventsMonitor setUpStreamSynchronously:reason:error:]((uint64_t)v35, v34, v36);
    }

    *__error() = v34;
  }

  return stream != 0;
}

void __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9438760]();
  FSEventStreamEventId CurrentEventId = FSEventsGetCurrentEventId();
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor setUpStreamSynchronously:reason:error:]_block_invoke", 298, v8);
  v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v8[0];
    v7 = [*(id *)(*(void *)(a1 + 32) + 168) absolutePath];
    *(_DWORD *)buf = 134218754;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    FSEventStreamEventId v14 = CurrentEventId;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx initial full scan of root:'%@' current-id:%llu%@", buf, 0x2Au);
  }
  [*(id *)(a1 + 32) fseventOnRootWithEventID:CurrentEventId andReason:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  __brc_leave_section(v8);
}

void __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke_69(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (BOOL)openWithRoot:(id)a3 volume:(id)a4 error:(id *)a5
{
  return [(BRCFSEventsMonitor *)self openWithRoot:a3 isImmutableRoot:1 volume:a4 error:a5];
}

- (BOOL)openWithRoot:(id)a3 isImmutableRoot:(BOOL)a4 volume:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor openWithRoot:isImmutableRoot:volume:error:]", 333, v20);
  uint64_t v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v20[0];
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Start monitoring root at %@%@", buf, 0x20u);
  }

  name = self->_name;
  if (name)
  {
    v21 = @"name";
    uint64_t v22 = name;
    __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  }
  else
  {
    __int16 v15 = 0;
  }
  v16 = +[BRCFSEventsPersistedState loadFromClientStateInSession:self->_session options:v15];
  persistedState = self->_persistedState;
  self->_persistedState = v16;

  if ([(BRCFSEventsMonitor *)self setUpRoot:v10 isImmutableRoot:v8 volume:v11 error:a6])
  {
    BOOL v18 = [(BRCFSEventsMonitor *)self setUpStreamSynchronously:0 reason:0 error:a6];
  }
  else
  {
    BOOL v18 = 0;
  }

  __brc_leave_section(v20);
  return v18;
}

- (void)signalAfterCurrentFSEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_semaphore, a3);
  uint64_t v7 = objc_opt_new();
  rendezVous = v6->_rendezVous;
  v6->_rendezVous = (BRCFSEventsPersistedState *)v7;

  [(BRCFSEventsPersistedState *)v6->_rendezVous setRootID:[(BRCFSEventsPersistedState *)v6->_persistedState rootID]];
  CFUUIDRef v9 = [(BRCFSEventsPersistedState *)v6->_persistedState streamUUID];
  [(BRCFSEventsPersistedState *)v6->_rendezVous setStreamUUID:v9];

  [(BRCFSEventsPersistedState *)v6->_rendezVous setLatestEventID:FSEventsGetCurrentEventId()];
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = v6->_rendezVous;
    persistedState = v6->_persistedState;
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = persistedState;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] setting rendez-vous:{%@} current:{%@}%@", buf, 0x20u);
  }

  objc_sync_exit(v6);
  uint64_t v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = v6;
  dispatch_async(v12, block);
}

void __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke(uint64_t a1)
{
  int v3 = 0;
  if (([*(id *)(*(void *)(a1 + 32) + 168) performOnOpenFileDescriptor:&__block_literal_global_66 error:&v3] & 1) == 0)
  {
    v1 = brc_bread_crumbs();
    v2 = brc_default_log();
    if (os_log_type_enabled(v2, (os_log_type_t)0x90u)) {
      __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke_cold_1(&v3, (uint64_t)v1, v2);
    }
  }
}

uint64_t __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = NSString;
  v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [v3 stringWithFormat:@"rendez-vous.%@.nosync", v5];

  id v7 = v6;
  BOOL v8 = (const char *)[v7 fileSystemRepresentation];
  int v14 = BRCOpenAt(a2, v8, 774, v9, v10, v11, v12, v13, 0x1B0u);
  if (v14 < 0)
  {
    int v17 = *__error();
    __int16 v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v7;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 2112;
      __int16 v27 = v18;
      __int16 v20 = "[ERROR] failed creating '%@' %{errno}d%@";
      goto LABEL_9;
    }
LABEL_6:

    *__error() = v17;
    uint64_t v16 = *__error();
    goto LABEL_7;
  }
  close(v14);
  int v15 = BRCUnlinkAt(a2, v7, 0);
  uint64_t v16 = 0;
  if (v15 < 0)
  {
    int v17 = *__error();
    __int16 v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v7;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 2112;
      __int16 v27 = v18;
      __int16 v20 = "[ERROR] failed deleting '%@' %{errno}d%@";
LABEL_9:
      _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, v20, buf, 0x1Cu);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v16;
}

- (void)didProcessEventID:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(BRCFSEventsPersistedState *)self->_persistedState setLatestEventID:a3];
  v4 = self;
  objc_sync_enter(v4);
  rendezVous = v4->_rendezVous;
  if (rendezVous)
  {
    uint64_t v6 = [(BRCFSEventsPersistedState *)rendezVous streamUUID];
    id v7 = [(BRCFSEventsPersistedState *)self->_persistedState streamUUID];
    if ([v6 isEqual:v7])
    {
      unint64_t v8 = [(BRCFSEventsPersistedState *)v4->_rendezVous latestEventID];
      unint64_t v9 = [(BRCFSEventsPersistedState *)self->_persistedState latestEventID];

      if (v8 > v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = v4->_rendezVous;
      persistedState = self->_persistedState;
      int v16 = 138412802;
      int v17 = v14;
      __int16 v18 = 2112;
      v19 = persistedState;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] signaling rendez-vous:{%@} current:{%@}%@", (uint8_t *)&v16, 0x20u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)v4->_semaphore);
    semaphore = v4->_semaphore;
    v4->_semaphore = 0;

    uint64_t v13 = v4->_rendezVous;
    v4->_rendezVous = 0;
  }
LABEL_9:
  objc_sync_exit(v4);
}

- (void)_updatePersistedStateWithState:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_persistedState, a3);
  if (self->_name)
  {
    objc_msgSend(@"fsevents", "stringByAppendingPathComponent:");
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = @"fsevents";
  }
  uint64_t v6 = [(BRCAccountSession *)self->_session clientState];
  [v6 setObject:v7 forKeyedSubscript:v5];
}

- (BOOL)_queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSMutableArray *)self->_fseventsToProcess count])
  {
    id v7 = [(NSMutableArray *)self->_fseventsToProcess objectAtIndexedSubscript:0];
    int v8 = [v7 flags] & 0xE;

    if (v8)
    {
      unint64_t v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSEventsMonitor _queueEvents:markSelfEncountered:]();
      }

      goto LABEL_37;
    }
  }
  uint64_t v11 = [v6 objectAtIndexedSubscript:0];
  int v12 = [v11 flags] & 0xE;

  if (v12)
  {
    uint64_t v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSEventsMonitor _queueEvents:markSelfEncountered:]();
    }

    [(NSMutableArray *)self->_fseventsToProcess removeAllObjects];
    fseventsToProcess = self->_fseventsToProcess;
    int v16 = [v6 objectAtIndexedSubscript:0];
    [(NSMutableArray *)fseventsToProcess addObject:v16];

    [(BRCFairSource *)self->_fseventsProcessSource signal];
    goto LABEL_37;
  }
  if (v4)
  {
    if (self->_hasMarkSelf)
    {
      int v17 = [(NSMutableArray *)self->_fseventsToProcess count];
      if (v17 >= 1)
      {
        uint64_t v18 = v17 + 1;
        while (1)
        {
          v19 = [(NSMutableArray *)self->_fseventsToProcess objectAtIndexedSubscript:(v18 - 2)];
          if (([v19 flags] & 0x80000) != 0) {
            break;
          }

          if ((unint64_t)--v18 <= 1) {
            goto LABEL_19;
          }
        }
        [(NSMutableArray *)self->_fseventsToProcess removeObjectAtIndex:(v18 - 2)];
      }
    }
    else
    {
      self->_hasMarkSelf = 1;
    }
  }
LABEL_19:
  if ([(NSMutableArray *)self->_fseventsToProcess count] >= self->_maxFSEventQueueSize)
  {
    id v35 = brc_bread_crumbs();
    v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[BRCFSEventsMonitor _queueEvents:markSelfEncountered:]();
    }
  }
  [(NSMutableArray *)self->_fseventsToProcess addObjectsFromArray:v6];
  if ([(NSMutableArray *)self->_fseventsToProcess count]) {
    [(BRCFairSource *)self->_fseventsProcessSource signal];
  }
  if ([(NSMutableArray *)self->_fseventsToProcess count] < self->_maxFSEventQueueSize) {
    goto LABEL_37;
  }
  __int16 v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v20;
    _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] We've reached the fsevent processing cap. Trying to coalesce pkg level events%@", buf, 0xCu);
  }

  uint64_t v22 = objc_opt_new();
  int v23 = [(NSMutableArray *)self->_fseventsToProcess count];
  if (v23 >= 1)
  {
    unint64_t v24 = v23 + 1;
    do
    {
      int v25 = [(NSMutableArray *)self->_fseventsToProcess objectAtIndexedSubscript:(v24 - 2)];
      __int16 v26 = [v25 path];
      __int16 v27 = objc_msgSend(v26, "br_pathOfPackageRoot");

      if (v27)
      {
        uint64_t v28 = [v22 objectForKeyedSubscript:v27];
        if (v28)
        {
          uint64_t v29 = brc_bread_crumbs();
          v30 = brc_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v37 = [v25 path];
            *(_DWORD *)buf = 138412802;
            v39 = v37;
            __int16 v40 = 2112;
            id v41 = v27;
            __int16 v42 = 2112;
            id v43 = v29;
            _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Coalescing event at %@ to pkg root at %@%@", buf, 0x20u);
          }
          [v28 setPath:v27];
          [v28 setFlags:131073];
          [(NSMutableArray *)self->_fseventsToProcess removeObjectAtIndex:(v24 - 2)];
        }
        else
        {
          [v22 setObject:v25 forKeyedSubscript:v27];
        }
      }
      --v24;
    }
    while (v24 > 1);
  }
  if ([(NSMutableArray *)self->_fseventsToProcess count] < self->_maxFSEventQueueSize)
  {

LABEL_37:
    BOOL v31 = 0;
    goto LABEL_38;
  }
  v33 = brc_bread_crumbs();
  uint64_t v34 = brc_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v33;
    _os_log_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] We still have too many events in the queue, blocking until events are flushed%@", buf, 0xCu);
  }

  BOOL v31 = 1;
LABEL_38:

  return v31;
}

- (void)queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [(BRCAccountSession *)self->_session personaIdentifier];
    id v7 = v5;
    BRPerformWithPersonaAndError();
  }
}

void __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_80;
    block[3] = &unk_1E699BE18;
    int v12 = &v14;
    block[4] = v6;
    id v11 = *(id *)(a1 + 40);
    char v13 = *(unsigned char *)(a1 + 48);
    dispatch_sync(v7, block);
    if (*((unsigned char *)v15 + 24))
    {
      int v8 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_2;
      v9[3] = &unk_1E6993698;
      v9[4] = *(void *)(a1 + 32);
      dispatch_async_and_wait(v8, v9);
    }
    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_80(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _queueEvents:*(void *)(a1 + 40) markSelfEncountered:*(unsigned __int8 *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) processFseventBatch];
}

- (void)processFseventBatch
{
  id v3 = self->_processQueue;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__56;
  v21 = __Block_byref_object_dispose__56;
  id v22 = 0;
  BOOL v4 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  dispatch_assert_queue_V2(v4);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__BRCFSEventsMonitor_processFseventBatch__block_invoke;
    block[3] = &unk_1E699BE68;
    block[4] = self;
    void block[5] = &v17;
    block[6] = &v13;
    dispatch_sync((dispatch_queue_t)v3, block);
    uint64_t v5 = [(id)v18[5] count];
    uint64_t v6 = v5;
    if ((int)v5 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v5;
      do
      {
        unint64_t v9 = [(id)v18[5] objectAtIndexedSubscript:v7];
        uint64_t v10 = [v9 path];
        -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:](self, "fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:", v10, [v9 flags], objc_msgSend(v9, "eventID"), v7, v6, 0);

        ++v7;
      }
      while (v8 != v7);
    }
    if (*((unsigned char *)v14 + 24))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __41__BRCFSEventsMonitor_processFseventBatch__block_invoke_2;
      v11[3] = &unk_1E6993698;
      v11[4] = self;
      dispatch_async((dispatch_queue_t)v3, v11);
    }
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __41__BRCFSEventsMonitor_processFseventBatch__block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  unint64_t v3 = *(void *)(v2 + 112);
  unint64_t v4 = [*(id *)(v2 + 96) count];
  uint64_t v5 = a1[4];
  if (v3 >= v4)
  {
    uint64_t v6 = [*(id *)(v5 + 96) count];
    uint64_t v5 = a1[4];
  }
  else
  {
    uint64_t v6 = *(void *)(v5 + 112);
  }
  uint64_t v7 = objc_msgSend(*(id *)(v5 + 96), "subarrayWithRange:", 0, v6);
  uint64_t v8 = *(void *)(a1[5] + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(a1[4] + 96), "removeObjectsInRange:", 0, v6);
  *(unsigned char *)(a1[4] + 120) = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1[4] + 96);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "flags", (void)v16) & 0x80000) != 0)
        {
          *(unsigned char *)(a1[4] + 120) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  uint64_t result = [*(id *)(a1[4] + 96) count];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  return result;
}

uint64_t __41__BRCFSEventsMonitor_processFseventBatch__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) signal];
}

- (void)fseventAtPath:(id)a3 withFlags:(unsigned int)a4 andID:(unint64_t)a5 eventIndex:(unsigned int)a6 eventCount:(unsigned int)a7 initialScan:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v12 = *(void *)&a4;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v12 & 8) != 0)
  {
    long long v18 = brc_bread_crumbs();
    long long v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = BRCPrettyPrintBitmap();
      uint64_t v21 = (void *)v20;
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)v104 = a6 + 1;
      id v22 = " (initial scan)";
      *(_WORD *)&v104[4] = 1024;
      if (!v8) {
        id v22 = "";
      }
      *(_DWORD *)&v104[6] = a7;
      *(_WORD *)v105 = 2112;
      *(void *)&v105[2] = v14;
      *(_WORD *)&v105[10] = 2112;
      *(void *)&v105[12] = v20;
      __int16 v106 = 2048;
      *(void *)v107 = a5;
      *(_WORD *)&v107[8] = 2080;
      v108 = v22;
      *(_WORD *)v109 = 2112;
      *(void *)&v109[2] = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s fsevents id wrapped%@", buf, 0x40u);
    }
    [(BRCFSEventsMonitor *)self resetWithReason:@"fsevents wrapped"];
  }
  else
  {
    if ((v12 & 2) != 0 && !v8)
    {
      uint64_t v15 = brc_bread_crumbs();
      long long v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = BRCPrettyPrintBitmap();
        *(_DWORD *)buf = 67110658;
        *(_DWORD *)v104 = a6 + 1;
        *(_WORD *)&v104[4] = 1024;
        *(_DWORD *)&v104[6] = a7;
        *(_WORD *)v105 = 2112;
        *(void *)&v105[2] = v14;
        *(_WORD *)&v105[10] = 2112;
        *(void *)&v105[12] = v17;
        __int16 v106 = 2048;
        *(void *)v107 = a5;
        *(_WORD *)&v107[8] = 2080;
        v108 = "";
        *(_WORD *)v109 = 2112;
        *(void *)&v109[2] = v15;
        _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s user dropped fsevents%@", buf, 0x40u);
      }
      [(BRCFSEventsMonitor *)self resetWithReason:@"soft dropped fsevents" dropFSEventID:0];
      goto LABEL_97;
    }
    if ((v12 & 6) != 0)
    {
      int v23 = brc_bread_crumbs();
      unint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = BRCPrettyPrintBitmap();
        __int16 v26 = (void *)v25;
        *(_DWORD *)buf = 67110658;
        *(_DWORD *)v104 = a6 + 1;
        __int16 v27 = " (initial scan)";
        *(_WORD *)&v104[4] = 1024;
        if (!v8) {
          __int16 v27 = "";
        }
        *(_DWORD *)&v104[6] = a7;
        *(_WORD *)v105 = 2112;
        *(void *)&v105[2] = v14;
        *(_WORD *)&v105[10] = 2112;
        *(void *)&v105[12] = v25;
        __int16 v106 = 2048;
        *(void *)v107 = a5;
        *(_WORD *)&v107[8] = 2080;
        v108 = v27;
        *(_WORD *)v109 = 2112;
        *(void *)&v109[2] = v23;
        _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s dropped fsevents%@", buf, 0x40u);
      }
      uint64_t v28 = brc_bread_crumbs();
      uint64_t v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:]();
      }

      [(BRCFSEventsMonitor *)self resetWithReason:@"dropped fsevents"];
      goto LABEL_97;
    }
    if ((v12 & 0x10) == 0)
    {
      if ((v12 & 0x80000) != 0)
      {
        v66 = brc_bread_crumbs();
        v67 = brc_default_log();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v75 = BRCPrettyPrintBitmap();
          v76 = (void *)v75;
          *(_DWORD *)buf = 67110658;
          *(_DWORD *)v104 = a6 + 1;
          uint64_t v77 = " (initial scan)";
          *(_WORD *)&v104[4] = 1024;
          if (!v8) {
            uint64_t v77 = "";
          }
          *(_DWORD *)&v104[6] = a7;
          *(_WORD *)v105 = 2112;
          *(void *)&v105[2] = v14;
          *(_WORD *)&v105[10] = 2112;
          *(void *)&v105[12] = v75;
          __int16 v106 = 2048;
          *(void *)v107 = a5;
          *(_WORD *)&v107[8] = 2080;
          v108 = v77;
          *(_WORD *)v109 = 2112;
          *(void *)&v109[2] = v66;
          _os_log_debug_impl(&dword_1D353B000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s ignored (own event)%@", buf, 0x40u);
        }
      }
      else
      {
        if ((v12 & 0xFFA8FFFF) != 0)
        {
          id v30 = v14;
          uint64_t v31 = (uint64_t)v30;
          if (([v30 hasPrefix:@"/"] & 1) == 0)
          {
            uint64_t v31 = [(NSString *)self->_devicePath stringByAppendingPathComponent:v30];
          }
          v91 = (void *)v31;
          id v32 = [[BRCRelativePath alloc] _initWithPath:v31 relativeToRoot:self->_root];
          int v102 = 0;
          v92 = v32;
          if ([v32 resolveAndKeepOpenMustExist:0 error:&v102])
          {
            if (v8) {
              goto LABEL_81;
            }
            int v33 = [v92 isRoot] ^ 1;
            if ((v12 & 0xB01) == 0) {
              LOBYTE(v33) = 1;
            }
            if (v33)
            {
LABEL_81:
              memset(&v101, 0, 24);
              __brc_create_section(1, (uint64_t)"-[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:]", 732, &v101);
              v90 = brc_bread_crumbs();
              v69 = brc_default_log();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                uint64_t v88 = *(void *)&v101.st_dev;
                uint64_t v70 = BRCPrettyPrintBitmap();
                *(_DWORD *)buf = 134220034;
                v71 = "";
                *(void *)v104 = v88;
                *(_WORD *)&v104[8] = 1024;
                if (v8) {
                  v71 = " (initial scan)";
                }
                *(_DWORD *)v105 = a6 + 1;
                *(_WORD *)&v105[4] = 1024;
                *(_DWORD *)&v105[6] = a7;
                *(_WORD *)&v105[10] = 2112;
                *(void *)&v105[12] = v30;
                __int16 v106 = 2112;
                *(void *)v107 = v70;
                *(_WORD *)&v107[8] = 2048;
                v108 = (const char *)a5;
                *(_WORD *)v109 = 2080;
                *(void *)&v109[2] = v71;
                *(_WORD *)&v109[10] = 2112;
                *(void *)&v109[12] = v92;
                *(_WORD *)&v109[20] = 2112;
                v110 = v90;
                v72 = (void *)v70;
                _os_log_impl(&dword_1D353B000, v69, OS_LOG_TYPE_INFO, "[INFO] ┏%llx fsevent:%u/%u path:'%@' flags:%@ id:%llu%s %@%@", buf, 0x54u);
              }
              kdebug_trace();
              db = self->_db;
              if (db)
              {
                v94[0] = MEMORY[0x1E4F143A8];
                v94[1] = 3221225472;
                v94[2] = __86__BRCFSEventsMonitor_fseventAtPath_withFlags_andID_eventIndex_eventCount_initialScan___block_invoke;
                v94[3] = &unk_1E699BE90;
                id v95 = WeakRetained;
                id v96 = v92;
                int v100 = v12;
                id v97 = v91;
                v98 = self;
                unint64_t v99 = a5;
                [(PQLConnection *)db groupInBatch:v94];
              }
              else
              {
                v74 = [v91 lastPathComponent];
                [WeakRetained fseventAtPath:v92 flags:v12 unresolvedLastPathComponent:v74];

                [(BRCFSEventsMonitor *)self didProcessEventID:a5];
              }
              [v92 close];
              __brc_leave_section((uint64_t *)&v101.st_dev);
            }
            else
            {
              uint64_t v34 = brc_bread_crumbs();
              id v35 = brc_default_log();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v36 = BRCPrettyPrintBitmap();
                *(_DWORD *)buf = 67110658;
                *(_DWORD *)v104 = a6 + 1;
                *(_WORD *)&v104[4] = 1024;
                *(_DWORD *)&v104[6] = a7;
                *(_WORD *)v105 = 2112;
                *(void *)&v105[2] = v30;
                *(_WORD *)&v105[10] = 2112;
                *(void *)&v105[12] = v36;
                __int16 v106 = 2048;
                *(void *)v107 = a5;
                *(_WORD *)&v107[8] = 2080;
                v108 = "";
                *(_WORD *)v109 = 2112;
                *(void *)&v109[2] = v34;
                _os_log_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEFAULT, "[NOTICE] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s root needs deep-scan%@", buf, 0x40u);
              }
              memset(&v101, 0, sizeof(v101));
              id v37 = [(BRCRelativePath *)self->_root absolutePath];
              int v38 = lstat((const char *)[v37 fileSystemRepresentation], &v101);

              if (v38 < 0)
              {
                int v78 = *__error();
                v79 = brc_bread_crumbs();
                v80 = brc_default_log();
                if (os_log_type_enabled(v80, (os_log_type_t)0x90u))
                {
                  v87 = [(BRCRelativePath *)self->_root absolutePath];
                  *(_DWORD *)buf = 138412802;
                  *(void *)v104 = v87;
                  *(_WORD *)&v104[8] = 1024;
                  *(_DWORD *)v105 = v78;
                  *(_WORD *)&v105[4] = 2112;
                  *(void *)&v105[6] = v79;
                  _os_log_error_impl(&dword_1D353B000, v80, (os_log_type_t)0x90u, "[ERROR] can't stat root at '%@' after fsevent %{errno}d%@", buf, 0x1Cu);
                }
                *__error() = v78;
              }
              else
              {
                __darwin_ino64_t st_ino = v101.st_ino;
                if (st_ino != [(BRCRelativePath *)self->_root fileID])
                {
                  __int16 v40 = brc_bread_crumbs();
                  id v41 = brc_default_log();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
                  {
                    root = self->_root;
                    int v43 = aPcDBLSW[(unint64_t)v101.st_mode >> 12];
                    if ((v101.st_mode & 0x100) != 0) {
                      int v44 = 114;
                    }
                    else {
                      int v44 = 45;
                    }
                    if ((v101.st_mode & 0x80) != 0) {
                      int v45 = 119;
                    }
                    else {
                      int v45 = 45;
                    }
                    if ((v101.st_mode & 0x40) != 0) {
                      int v46 = 120;
                    }
                    else {
                      int v46 = 45;
                    }
                    if ((v101.st_mode & 0x20) != 0) {
                      int v47 = 114;
                    }
                    else {
                      int v47 = 45;
                    }
                    if ((v101.st_mode & 0x10) != 0) {
                      int v48 = 119;
                    }
                    else {
                      int v48 = 45;
                    }
                    if ((v101.st_mode & 8) != 0) {
                      int v49 = 120;
                    }
                    else {
                      int v49 = 45;
                    }
                    if ((v101.st_mode & 4) != 0) {
                      int v50 = 114;
                    }
                    else {
                      int v50 = 45;
                    }
                    if ((v101.st_mode & 2) != 0) {
                      int v51 = 119;
                    }
                    else {
                      int v51 = 45;
                    }
                    if (v101.st_mode) {
                      int v52 = 120;
                    }
                    else {
                      int v52 = 45;
                    }
                    *(_DWORD *)buf = 138417666;
                    *(void *)v104 = root;
                    *(_WORD *)&v104[8] = 1024;
                    *(_DWORD *)v105 = v101.st_dev;
                    *(_WORD *)&v105[4] = 2048;
                    *(void *)&v105[6] = v101.st_ino;
                    *(_WORD *)&v105[14] = 1024;
                    *(_DWORD *)&v105[16] = v43;
                    __int16 v106 = 1024;
                    *(_DWORD *)v107 = v44;
                    *(_WORD *)&v107[4] = 1024;
                    *(_DWORD *)&v107[6] = v45;
                    LOWORD(v108) = 1024;
                    *(_DWORD *)((char *)&v108 + 2) = v46;
                    HIWORD(v108) = 1024;
                    *(_DWORD *)v109 = v47;
                    *(_WORD *)&v109[4] = 1024;
                    *(_DWORD *)&v109[6] = v48;
                    *(_WORD *)&v109[10] = 1024;
                    *(_DWORD *)&v109[12] = v49;
                    *(_WORD *)&v109[16] = 1024;
                    *(_DWORD *)&v109[18] = v50;
                    LOWORD(v110) = 1024;
                    *(_DWORD *)((char *)&v110 + 2) = v51;
                    HIWORD(v110) = 1024;
                    int v111 = v52;
                    __int16 v112 = 1024;
                    int st_nlink = v101.st_nlink;
                    __int16 v114 = 1024;
                    uid_t st_uid = v101.st_uid;
                    __int16 v116 = 1024;
                    gid_t st_gid = v101.st_gid;
                    __int16 v118 = 2048;
                    __darwin_time_t tv_sec = v101.st_atimespec.tv_sec;
                    __int16 v120 = 2048;
                    __darwin_time_t v121 = v101.st_mtimespec.tv_sec;
                    __int16 v122 = 2048;
                    __darwin_time_t v123 = v101.st_ctimespec.tv_sec;
                    __int16 v124 = 2048;
                    off_t st_size = v101.st_size;
                    __int16 v126 = 1024;
                    __uint32_t st_flags = v101.st_flags;
                    __int16 v128 = 2112;
                    v129 = v40;
                    _os_log_fault_impl(&dword_1D353B000, v41, OS_LOG_TYPE_FAULT, "[CRIT] the root changed fileID\n  from %@\n    to deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
                  }

                  uint64_t v53 = [(BRCRelativePath *)self->_root absolutePath];
                  int IsOwnedByUbd = BRCRootIsOwnedByUbd(v53);

                  if (IsOwnedByUbd)
                  {
                    int v55 = brc_bread_crumbs();
                    uint64_t v56 = brc_default_log();
                    if (os_log_type_enabled(v56, (os_log_type_t)0x90u)) {
                      -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:]();
                    }
                  }
                  abc_report_panic_with_signature();
                  uint64_t v57 = objc_msgSend(NSString, "stringWithFormat:", @"The root changed filedID from %llu to %llu", v101.st_ino, -[BRCRelativePath fileID](self->_root, "fileID"));
                  int v58 = brc_bread_crumbs();
                  v59 = brc_default_log();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
                    -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:](v57, (uint64_t)v58, v59);
                  }

                  brc_append_system_info_to_message();
                  unint64_t v60 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
                  __assert_rtn("-[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/legacy/BRCFSEventsMonitor.m", 724, v60);
                }
              }
              [v92 close];
              [(BRCFSEventsMonitor *)self resetWithReason:@"root needs deep scan"];
            }
          }
          else
          {
            v89 = brc_bread_crumbs();
            v68 = brc_default_log();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v84 = BRCPrettyPrintBitmap();
              v85 = (void *)v84;
              *(_DWORD *)buf = 67110914;
              *(_DWORD *)v104 = a6 + 1;
              if (v8) {
                v86 = " (initial scan)";
              }
              else {
                v86 = "";
              }
              *(_WORD *)&v104[4] = 1024;
              *(_DWORD *)&v104[6] = a7;
              *(_WORD *)v105 = 2112;
              *(void *)&v105[2] = v30;
              *(_WORD *)&v105[10] = 2112;
              *(void *)&v105[12] = v84;
              __int16 v106 = 2048;
              *(void *)v107 = a5;
              *(_WORD *)&v107[8] = 2080;
              v108 = v86;
              *(_WORD *)v109 = 1024;
              *(_DWORD *)&v109[2] = v102;
              *(_WORD *)&v109[6] = 2112;
              *(void *)&v109[8] = v89;
              _os_log_debug_impl(&dword_1D353B000, v68, OS_LOG_TYPE_DEBUG, "[DEBUG] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s ignored %{errno}d%@", buf, 0x46u);
            }
            [(BRCFSEventsMonitor *)self didProcessEventID:a5];
          }

          goto LABEL_97;
        }
        v66 = brc_bread_crumbs();
        v67 = brc_default_log();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v81 = BRCPrettyPrintBitmap();
          v82 = (void *)v81;
          *(_DWORD *)buf = 67110658;
          *(_DWORD *)v104 = a6 + 1;
          v83 = " (initial scan)";
          *(_WORD *)&v104[4] = 1024;
          if (!v8) {
            v83 = "";
          }
          *(_DWORD *)&v104[6] = a7;
          *(_WORD *)v105 = 2112;
          *(void *)&v105[2] = v14;
          *(_WORD *)&v105[10] = 2112;
          *(void *)&v105[12] = v81;
          __int16 v106 = 2048;
          *(void *)v107 = a5;
          *(_WORD *)&v107[8] = 2080;
          v108 = v83;
          *(_WORD *)v109 = 2112;
          *(void *)&v109[2] = v66;
          _os_log_debug_impl(&dword_1D353B000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s ignored (cloned)%@", buf, 0x40u);
        }
      }

      [(BRCFSEventsMonitor *)self didProcessEventID:a5];
      goto LABEL_97;
    }
    v61 = brc_bread_crumbs();
    __int16 v62 = brc_default_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = BRCPrettyPrintBitmap();
      int v64 = (void *)v63;
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)v104 = a6 + 1;
      v65 = " (initial scan)";
      *(_WORD *)&v104[4] = 1024;
      if (!v8) {
        v65 = "";
      }
      *(_DWORD *)&v104[6] = a7;
      *(_WORD *)v105 = 2112;
      *(void *)&v105[2] = v14;
      *(_WORD *)&v105[10] = 2112;
      *(void *)&v105[12] = v63;
      __int16 v106 = 2048;
      *(void *)v107 = a5;
      *(_WORD *)&v107[8] = 2080;
      v108 = v65;
      *(_WORD *)v109 = 2112;
      *(void *)&v109[2] = v61;
      _os_log_impl(&dword_1D353B000, v62, OS_LOG_TYPE_DEFAULT, "[NOTICE] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s done processing history%@", buf, 0x40u);
    }
  }
LABEL_97:
}

uint64_t __86__BRCFSEventsMonitor_fseventAtPath_withFlags_andID_eventIndex_eventCount_initialScan___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v5 = [*(id *)(a1 + 48) lastPathComponent];
  [v2 fseventAtPath:v3 flags:v4 unresolvedLastPathComponent:v5];

  uint64_t v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v6 didProcessEventID:v7];
}

- (void)fseventOnRootWithEventID:(unint64_t)a3 andReason:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v8 = self->_root;
  db = self->_db;
  if (db)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__BRCFSEventsMonitor_fseventOnRootWithEventID_andReason___block_invoke;
    v10[3] = &unk_1E699BEB8;
    id v11 = WeakRetained;
    uint64_t v12 = v8;
    id v13 = v6;
    id v14 = self;
    unint64_t v15 = a3;
    [(PQLConnection *)db groupInBatch:v10];
  }
  else
  {
    [WeakRetained fseventRecursiveAtRoot:v8 withReason:v6];
    [(BRCFSEventsMonitor *)self didProcessEventID:a3];
  }
}

uint64_t __57__BRCFSEventsMonitor_fseventOnRootWithEventID_andReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) fseventRecursiveAtRoot:*(void *)(a1 + 40) withReason:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  return [v2 didProcessEventID:v3];
}

- (BRCFSEventsMonitor)initWithAccountSession:(id)a3
{
  return [(BRCFSEventsMonitor *)self initWithAccountSession:a3 name:0];
}

- (BRCFSEventsMonitor)initWithAccountSession:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)BRCFSEventsMonitor;
  unint64_t v9 = [(BRCFSEventsMonitor *)&v37 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a4);
    objc_storeStrong((id *)&v10->_session, a3);
    atomic_store(1u, (unsigned int *)&v10->_suspendCount);
    id v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.brc.fs.events", v12);

    streamQueue = v10->_streamQueue;
    v10->_streamQueue = (OS_dispatch_queue *)v13;

    unint64_t v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    long long v16 = dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.brc.fs.events-process", v16);

    processQueue = v10->_processQueue;
    v10->_processQueue = (OS_dispatch_queue *)v17;

    long long v19 = [BRCFairSource alloc];
    uint64_t v20 = [v7 fairClientDBScheduler];
    uint64_t v21 = [(BRCFairSource *)v19 initWithName:@"fsevents" scheduler:v20];
    fseventsProcessSource = v10->_fseventsProcessSource;
    v10->_fseventsProcessSource = (BRCFairSource *)v21;

    int v23 = [v7 clientTruthWorkloop];
    [(BRCFairSource *)v10->_fseventsProcessSource setWorkloop:v23];

    objc_initWeak(&location, v10);
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    int v33 = __50__BRCFSEventsMonitor_initWithAccountSession_name___block_invoke;
    uint64_t v34 = &unk_1E6993C50;
    objc_copyWeak(&v35, &location);
    [(BRCFairSource *)v10->_fseventsProcessSource setEventHandler:&v31];
    unint64_t v24 = +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0, v31, v32, v33, v34);
    v10->_uint64_t maxFSEventQueueSize = [v24 fseventQueueBufferSize];

    uint64_t v25 = +[BRCUserDefaults defaultsForMangledID:0];
    v10->_fseventProcessBatchSize = [v25 fseventProcessBatchSize];

    id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if (v10->_maxFSEventQueueSize >= 0xC8) {
      uint64_t maxFSEventQueueSize = 200;
    }
    else {
      uint64_t maxFSEventQueueSize = v10->_maxFSEventQueueSize;
    }
    uint64_t v28 = [v26 initWithCapacity:maxFSEventQueueSize];
    fseventsToProcess = v10->_fseventsToProcess;
    v10->_fseventsToProcess = (NSMutableArray *)v28;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __50__BRCFSEventsMonitor_initWithAccountSession_name___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processFseventBatch];
}

- (void)dealloc
{
  devicePath = self->_devicePath;
  self->_devicePath = 0;

  streamQueue = self->_streamQueue;
  self->_streamQueue = 0;

  processQueue = self->_processQueue;
  self->_processQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)BRCFSEventsMonitor;
  [(BRCFSEventsMonitor *)&v6 dealloc];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(BRCFSEventsMonitor *)self root];
  objc_super v6 = [v5 absolutePath];
  id v7 = [v3 stringWithFormat:@"<%@: %p root:%@ suspendCount:%d>", v4, self, v6, atomic_load_explicit(&self->_suspendCount, memory_order_acquire)];

  return (NSString *)v7;
}

- (void)stopWatcher
{
  processQueue = self->_processQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BRCFSEventsMonitor_stopWatcher__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_sync(processQueue, block);
}

void __33__BRCFSEventsMonitor_stopWatcher__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (v1) {
    dispatch_source_cancel(v1);
  }
}

- (void)flushStream
{
  if (!atomic_load((unsigned int *)&self->_suspendCount)) {
    FSEventStreamFlushSync(self->_stream);
  }
}

- (void)_close
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  [(BRCFSEventsMonitor *)self suspend];
  obj = self;
  objc_sync_enter(obj);
  uint64_t v3 = obj;
  rootVnodeWatcher = obj->_rootVnodeWatcher;
  if (rootVnodeWatcher)
  {
    dispatch_resume(rootVnodeWatcher);
    uint64_t v5 = obj->_rootVnodeWatcher;
    obj->_rootVnodeWatcher = 0;

    uint64_t v3 = obj;
  }
  historicalEventSource = v3->_historicalEventSource;
  if (historicalEventSource)
  {
    dispatch_resume(historicalEventSource);
    id v7 = obj->_historicalEventSource;
    obj->_historicalEventSource = 0;

    uint64_t v3 = obj;
  }
  stream = v3->_stream;
  if (stream)
  {
    FSEventStreamRelease(stream);
    uint64_t v3 = obj;
    obj->_drainEvents = 1;
    obj->_stream = 0;
  }
  root = v3->_root;
  if (root)
  {
    [(BRCRelativePath *)root close];
    id v10 = obj->_root;
    obj->_root = 0;

    volume = obj->_volume;
    obj->_volume = 0;

    devicePath = obj->_devicePath;
    obj->_devicePath = 0;

    uint64_t v3 = obj;
  }
  persistedState = v3->_persistedState;
  v3->_persistedState = 0;

  db = obj->_db;
  obj->_db = 0;

  objc_sync_exit(obj);
}

- (void)close
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor close]", 876, v13);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v13[0];
    unint64_t v9 = objc_opt_class();
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    dispatch_queue_t v17 = v9;
    __int16 v18 = 2112;
    long long v19 = v3;
    id v10 = v9;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx closing the %@%@", buf, 0x20u);
  }
  [(BRCFSEventsMonitor *)self stopWatcher];
  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__BRCFSEventsMonitor_close__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_sync(streamQueue, block);
  objc_super v6 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  dispatch_async_and_wait(v6, &__block_literal_global_119);

  processQueue = self->_processQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __27__BRCFSEventsMonitor_close__block_invoke_4;
  v11[3] = &unk_1E6993698;
  v11[4] = self;
  dispatch_sync(processQueue, v11);
  __brc_leave_section(v13);
}

void __27__BRCFSEventsMonitor_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__BRCFSEventsMonitor_close__block_invoke_2;
  block[3] = &unk_1E6993698;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __27__BRCFSEventsMonitor_close__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

uint64_t __27__BRCFSEventsMonitor_close__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)resetWithReason:(id)a3
{
}

- (void)resetWithReason:(id)a3 dropFSEventID:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    int v23 = v7;
    id v14 = v19;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] resetting the %@ because of %@%@", buf, 0x20u);
  }
  if (!atomic_fetch_add(&self->_resetCount, 1u)) {
    [(BRCFSEventsMonitor *)self suspend];
  }
  unint64_t v9 = +[BRCUserDefaults defaultsForMangledID:0];
  [v9 fseventsResetBackoff];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke;
  block[3] = &unk_1E69970B8;
  BOOL v17 = a4;
  block[4] = self;
  id v16 = v6;
  id v13 = v6;
  dispatch_after(v11, streamQueue, block);
}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D9438760]();
  if ((int)atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 28), 0xFFFFFFFF) <= 1)
  {
    memset(v14, 0, sizeof(v14));
    __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor resetWithReason:dropFSEventID:]_block_invoke", 923, v14);
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 144) = 1;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    unint64_t v9 = __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_120;
    double v10 = &unk_1E69970B8;
    id v6 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    char v13 = *(unsigned char *)(a1 + 48);
    id v12 = v6;
    dispatch_async_and_wait(v5, &v7);

    objc_msgSend(*(id *)(a1 + 32), "resume", v7, v8, v9, v10, v11);
    __brc_leave_section(v14);
  }
}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_120(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2;
  block[3] = &unk_1E69970B8;
  char v5 = *(unsigned char *)(a1 + 48);
  block[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_sync(v2, block);
}

uint64_t __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2_cold_1();
  }

  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
    [v4 setStreamUUID:0];
    [*(id *)(a1 + 32) _updatePersistedStateWithState:v4];
  }
  char v5 = *(FSEventStreamRef **)(a1 + 32);
  if (v5[7])
  {
    FSEventStreamInvalidate(v5[7]);
    FSEventStreamRelease(*(FSEventStreamRef *)(*(void *)(a1 + 32) + 56));
    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    char v5 = *(FSEventStreamRef **)(a1 + 32);
  }
  return [(FSEventStreamRef *)v5 setUpStreamSynchronously:1 reason:*(void *)(a1 + 40) error:0];
}

- (void)suspend
{
  int add = atomic_fetch_add(&self->_suspendCount, 1u);
  id v4 = brc_bread_crumbs();
  char v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(BRCFileUnlinker *)add suspend];
  }

  if (!add)
  {
    id v6 = self;
    objc_sync_enter(v6);
    stream = v6->_stream;
    if (stream) {
      FSEventStreamStop(stream);
    }
    rootVnodeWatcher = v6->_rootVnodeWatcher;
    if (rootVnodeWatcher) {
      dispatch_suspend(rootVnodeWatcher);
    }
    historicalEventSource = v6->_historicalEventSource;
    if (historicalEventSource) {
      dispatch_suspend(historicalEventSource);
    }
    [(BRCFairSource *)v6->_fseventsProcessSource suspend];
    objc_sync_exit(v6);
  }
}

- (void)resume
{
  int v4 = *a1;
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = v4;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] failed starting fsevent stream %{errno}d%@", buf, 0x12u);
}

- (void)_cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if (!self->_isCancelled)
  {
    self->_isCancelled = 1;
    atomic_fetch_add(&self->_resetCount, 1u);
    stream = self->_stream;
    if (stream)
    {
      FSEventStreamStop(stream);
      FSEventStreamInvalidate(self->_stream);
    }
    rootVnodeWatcher = self->_rootVnodeWatcher;
    if (rootVnodeWatcher) {
      dispatch_source_cancel(rootVnodeWatcher);
    }
    historicalEventSource = self->_historicalEventSource;
    if (historicalEventSource) {
      dispatch_source_cancel(historicalEventSource);
    }
    fseventsProcessSource = self->_fseventsProcessSource;
    if (fseventsProcessSource)
    {
      [(BRCFairSource *)fseventsProcessSource cancel];
    }
  }
}

- (void)cancel
{
  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__BRCFSEventsMonitor_cancel__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(streamQueue, block);
}

void __28__BRCFSEventsMonitor_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__BRCFSEventsMonitor_cancel__block_invoke_2;
  block[3] = &unk_1E6993698;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __28__BRCFSEventsMonitor_cancel__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCRelativePath)root
{
  return self->_root;
}

- (BRCFSEventsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BRCFSEventsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PQLConnection)db
{
  return self->_db;
}

- (void)setDB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_rendezVous, 0);
  objc_storeStrong((id *)&self->_fseventsToProcess, 0);
  objc_storeStrong((id *)&self->_fseventsProcessSource, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_historicalEventSource, 0);
  objc_storeStrong((id *)&self->_streamQueue, 0);
  objc_storeStrong((id *)&self->_rootVnodeWatcher, 0);
  objc_storeStrong((id *)&self->_devicePath, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setUpRoot:isImmutableRoot:volume:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] opened root %@%@");
}

- (void)setUpRoot:isImmutableRoot:volume:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: volume%@", v2, v3, v4, v5, v6);
}

- (void)setUpStreamSynchronously:(uint64_t)a1 reason:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, a2, a3, "[ERROR] FSEventStreamCreateRelativeToDevice failed %{errno}d%@", v3, (void)v4, WORD4(v4), *MEMORY[0x1E4F143B8]);
}

void __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke_cold_1(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = *a1;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, a2, a3, "[ERROR] failed generating fsevent for rendez-voud %{errno}d%@", v3, (void)v4, WORD4(v4), *MEMORY[0x1E4F143B8]);
}

- (void)_queueEvents:markSelfEncountered:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _fseventsToProcess.count < _maxFSEventQueueSize%@", v2, v3, v4, v5, v6);
}

- (void)_queueEvents:markSelfEncountered:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Incoming events need deep scan.  Dropping all existing events%@", v2, v3, v4, v5, v6);
}

- (void)_queueEvents:markSelfEncountered:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Already need deep scan.  Dropping all incoming events%@", v2, v3, v4, v5, v6);
}

void __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Couldn't adopt the correct persona when processing fsevents%@", v2, v3, v4, v5, v6);
}

- (void)fseventAtPath:(NSObject *)a3 withFlags:andID:eventIndex:eventCount:initialScan:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = brc_append_system_info_to_message();
  OUTLINED_FUNCTION_3_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_1D353B000, a3, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", v6, 0x16u);
}

- (void)fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] ubd is still running%@", v1, 0xCu);
}

- (void)fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: We should try our best to avoid dropping fsevents%@", v2, v3, v4, v5, v6);
}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx reset: drained all fsevents from the old stream%@");
}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] creating the new stream%@", v2, v3, v4, v5, v6);
}

@end