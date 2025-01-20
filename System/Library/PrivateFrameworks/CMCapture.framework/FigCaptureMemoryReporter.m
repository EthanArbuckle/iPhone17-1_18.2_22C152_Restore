@interface FigCaptureMemoryReporter
+ (id)sharedInstance;
- (FigCaptureMemoryReporter)init;
- (unint64_t)currentFootprint;
- (unint64_t)peakFootprintSinceReset;
- (void)_changeReportFrequency:(uint64_t)a1;
- (void)_generateMemgraph:(uint64_t)a1;
- (void)_logCurrentTransactions;
- (void)_reportMemoryStatus;
- (void)_startMemgraphCoolDown:(uint64_t)a1;
- (void)_startReporting;
- (void)_updateActiveClientCountWithDelta:(uint64_t)a1;
- (void)dealloc;
- (void)decrementActiveClientCount:(BOOL)a3 clientIsCameraMessagesApp:(BOOL)a4;
- (void)incrementActiveClientCount:(BOOL)a3 clientIsCameraMessagesApp:(BOOL)a4 withMemoryPool:(id)a5;
- (void)resetPeakFootprint;
@end

@implementation FigCaptureMemoryReporter

void __51__FigCaptureMemoryReporter__changeReportFrequency___block_invoke(uint64_t a1)
{
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken_1 != -1) {
    dispatch_once(&sharedInstance_sOnceToken_1, &__block_literal_global_106);
  }
  return (id)sharedInstance_sSharedFigMemoryReporter;
}

- (void)incrementActiveClientCount:(BOOL)a3 clientIsCameraMessagesApp:(BOOL)a4 withMemoryPool:(id)a5
{
  if (self->_anyLoggingEnabled)
  {
    BOOL v6 = a4;
    BOOL v7 = a3;
    if ((dword_1EB4C51B0 & 4) != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_memoryPool = (BWMemoryPool *)a5;
    -[FigCaptureMemoryReporter _updateActiveClientCountWithDelta:]((uint64_t)self, 1);
    if (v7) {
      self->_activeClientsIncludeCamera = 1;
    }
    if (v6) {
      self->_activeClientsIncludeCameraMessagesApp = 1;
    }
  }
}

- (void)_updateActiveClientCountWithDelta:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    int v5 = *(_DWORD *)(a1 + 44);
    int v6 = v5 + a2;
    int v7 = v6 & ~(v6 >> 31);
    *(_DWORD *)(a1 + 44) = v7;
    if (v5 != v7 && (!v5 || v6 <= 0))
    {
      *(unsigned char *)(a1 + 40) = 1;
      BOOL v8 = v6 < 1;
      uint64_t v9 = 104;
      if (v8) {
        uint64_t v9 = 112;
      }
      -[FigCaptureMemoryReporter _changeReportFrequency:](a1, *(void *)(a1 + v9));
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_changeReportFrequency:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 16);
    if (v4)
    {
      if ((dword_1EB4C51B0 & 4) != 0)
      {
        int v11 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v4 = *(NSObject **)(a1 + 16);
      }
      dispatch_source_cancel(v4);

      *(void *)(a1 + 16) = 0;
    }
    if ((dword_1EB4C51B0 & 4) != 0)
    {
      int v11 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 8));
    *(void *)(a1 + 16) = v7;
    dispatch_source_set_timer(v7, 0, 1000000 * a2, 0x3E8uLL);
    BOOL v8 = *(NSObject **)(a1 + 16);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __51__FigCaptureMemoryReporter__changeReportFrequency___block_invoke;
    handler[3] = &unk_1E5C24430;
    handler[4] = a1;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 16));
  }
}

- (void)resetPeakFootprint
{
}

- (void)_reportMemoryStatus
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v2 = &unk_1EB4C5000;
  if ((dword_1EB4C51B0 & 4) != 0) {
    uint64_t ContinuousUpTimeNanoseconds = FigGetContinuousUpTimeNanoseconds();
  }
  else {
    uint64_t ContinuousUpTimeNanoseconds = -1;
  }
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40)) {
    *(unsigned char *)(a1 + 40) = 0;
  }
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long buffer = 0u;
  if (proc_pid_rusage(*(_DWORD *)(a1 + 64), 6, (rusage_info_t *)&buffer)) {
    goto LABEL_93;
  }
  unint64_t v4 = *((void *)&v119 + 1);
  int v5 = (unint64_t *)(a1 + 128);
  unint64_t v6 = atomic_load((unint64_t *)(a1 + 128));
  unint64_t v7 = v4;
  unint64_t v49 = v4;
  if (v6 > v4) {
    unint64_t v7 = atomic_load(v5);
  }
  atomic_store(v7, v5);
  unint64_t v8 = *((void *)&v106 + 1);
  *(void *)(a1 + 120) = *((void *)&v106 + 1);
  unint64_t v9 = v8 >> 10;
  if (*(int *)(a1 + 44) > 0 || *(unsigned char *)(a1 + 70) || *(_DWORD *)(a1 + 80) < v9)
  {
    uint64_t v65 = 0;
    uint64_t v66 = 0;
  }
  else
  {
    unsigned int v24 = *(_DWORD *)(a1 + 84);
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    if (v24 <= v9)
    {
      int v25 = 0;
      goto LABEL_45;
    }
  }
  v10 = *(void **)(a1 + 144);
  if (v10 && (dword_1EB4C51B0 & 0x40) != 0) {
    [v10 getInUseFootprint:&v66 andOutOfUseFootprint:&v65];
  }
  proc_reset_footprint_interval();
  if (v9 <= 0x100000)
  {
    int v11 = v9 + (v9 >> 4);
    int v12 = v9 - (v9 >> 4);
  }
  else
  {
    int v11 = v9 + 0x10000;
    int v12 = v9 - 0x10000;
  }
  *(_DWORD *)(a1 + 80) = v11;
  *(_DWORD *)(a1 + 84) = v12;
  char v13 = dword_1EB4C51B0;
  if ((dword_1EB4C51B0 & 1) == 0)
  {
    if ((dword_1EB4C51B0 & 0x40) == 0) {
      goto LABEL_22;
    }
LABEL_32:
    unsigned int v80 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v20 = v80;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = v20 & 0xFFFFFFFE;
    }
    if (v21)
    {
      int v67 = 136315650;
      v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
      __int16 v69 = 1024;
      *(_DWORD *)v70 = v66 >> 10;
      *(_WORD *)&v70[4] = 1024;
      *(_DWORD *)&v70[6] = v65 >> 10;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v2 = &unk_1EB4C5000;
    if ((dword_1EB4C51B0 & 2) == 0) {
      goto LABEL_44;
    }
LABEL_38:
    int v101 = 0;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v82 = 0u;
    memset(task_info_out, 0, sizeof(task_info_out));
    *(_DWORD *)os_log_type_t type = 93;
    if (!task_info(*MEMORY[0x1E4F14960], 0x16u, task_info_out, (mach_msg_type_number_t *)type))
    {
      if ((v2[432] & 2) != 0)
      {
        int v63 = 0;
        os_log_type_t v62 = OS_LOG_TYPE_DEFAULT;
        v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v2 = (unsigned char *)&unk_1EB4C5000;
        if ((dword_1EB4C51B0 & 2) != 0)
        {
          int v63 = 0;
          os_log_type_t v62 = OS_LOG_TYPE_DEFAULT;
          v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v2 = &unk_1EB4C5000;
        }
      }
      goto LABEL_44;
    }
LABEL_93:
    FigDebugAssert3();
    return;
  }
  unsigned int v80 = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v15 = v80;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    unsigned int v16 = v15;
  }
  else {
    unsigned int v16 = v15 & 0xFFFFFFFE;
  }
  if (v16)
  {
    unint64_t v17 = *(void *)(a1 + 120) >> 10;
    v18 = @"true";
    if (!v3) {
      v18 = @"false";
    }
    int v67 = 136316674;
    v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
    __int16 v69 = 2048;
    *(void *)v70 = v103;
    *(_WORD *)&v70[8] = 2048;
    unint64_t v71 = *((void *)&v103 + 1);
    __int16 v72 = 2048;
    uint64_t v73 = *((void *)&v105 + 1) >> 10;
    __int16 v74 = 2048;
    unint64_t v75 = v17;
    __int16 v76 = 2048;
    unint64_t v77 = v49 >> 10;
    __int16 v78 = 2112;
    v79 = v18;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  char v13 = dword_1EB4C51B0;
  v2 = (unsigned char *)&unk_1EB4C5000;
  if ((dword_1EB4C51B0 & 0x40) != 0) {
    goto LABEL_32;
  }
LABEL_22:
  if ((v13 & 2) != 0) {
    goto LABEL_38;
  }
LABEL_44:
  int v25 = 1;
LABEL_45:
  uint64_t v61 = 0;
  long long v60 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  *(_OWORD *)host_info64_out = 0u;
  long long v53 = 0u;
  mach_msg_type_number_t host_info64_outCnt = 38;
  if (host_statistics64(*(_DWORD *)(a1 + 52), 4, host_info64_out, &host_info64_outCnt)) {
    goto LABEL_93;
  }
  unsigned int v26 = v9;
  uint64_t v27 = *(void *)(a1 + 56);
  unint64_t v28 = v27 * host_info64_out[3];
  unint64_t v29 = v28 >> 10;
  unint64_t v45 = v27 * host_info64_out[0];
  unint64_t v46 = v27 * host_info64_out[1];
  unint64_t v47 = v27 * host_info64_out[2];
  unint64_t v48 = (16 * v60);
  if (*(int *)(a1 + 44) > 0
    || *(unsigned char *)(a1 + 70)
    || *(_DWORD *)(a1 + 88) < v29
    || *(_DWORD *)(a1 + 92) > v29)
  {
    if (v29 <= 0x100000)
    {
      int v30 = v29 + (v29 >> 4);
      int v31 = v29 - (v29 >> 4);
    }
    else
    {
      int v30 = v29 + 0x10000;
      int v31 = v29 - 0x10000;
    }
    *(_DWORD *)(a1 + 88) = v30;
    *(_DWORD *)(a1 + 92) = v31;
    if (v2[432])
    {
      int v44 = v25;
      unsigned int v80 = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v34 = v80;
      if (os_log_type_enabled(v33, type[0])) {
        unsigned int v35 = v34;
      }
      else {
        unsigned int v35 = v34 & 0xFFFFFFFE;
      }
      if (v35)
      {
        int v67 = 136316418;
        v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
        __int16 v69 = 2048;
        *(void *)v70 = v28 >> 10;
        *(_WORD *)&v70[8] = 2048;
        unint64_t v71 = v45 >> 10;
        __int16 v72 = 2048;
        uint64_t v73 = v46 >> 10;
        __int16 v74 = 2048;
        unint64_t v75 = v47 >> 10;
        __int16 v76 = 2048;
        unint64_t v77 = v48;
        _os_log_send_and_compose_impl();
      }
      int v32 = 1;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v2 = &unk_1EB4C5000;
      int v25 = v44;
      if (!v3) {
        goto LABEL_65;
      }
    }
    else
    {
      int v32 = 1;
      if (!v3) {
        goto LABEL_65;
      }
    }
  }
  else
  {
    int v32 = 0;
    if (!v3) {
      goto LABEL_65;
    }
  }
  if (*(int *)(a1 + 44) >= 1 && (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49))) {
    goto LABEL_67;
  }
LABEL_65:
  if (*(unsigned char *)(a1 + 69) || *(unsigned char *)(a1 + 68))
  {
LABEL_67:
    int v36 = *((_DWORD *)v2 + 108);
    if ((v36 & 0x20) != 0 && (*(_DWORD *)(a1 + 76) <= v26 || *(unsigned char *)(a1 + 69)))
    {
      -[FigCaptureMemoryReporter _logCurrentTransactions](a1);
      int v36 = *((_DWORD *)v2 + 108);
    }
    if ((v36 & 8) != 0 && (*(_DWORD *)(a1 + 72) <= v26 || *(unsigned char *)(a1 + 68))) {
      -[FigCaptureMemoryReporter _generateMemgraph:](a1);
    }
  }
  if ((v25 | v32) == 1)
  {
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    if ((v2[432] & 0x11) != 0)
    {
      v37 = *(NSObject **)(a1 + 136);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = *(void *)(a1 + 120) >> 10;
        task_info_out[0] = 134219520;
        *(void *)&task_info_out[1] = v38;
        LOWORD(task_info_out[3]) = 2048;
        *(void *)((char *)&task_info_out[3] + 2) = v49 >> 10;
        HIWORD(task_info_out[5]) = 2048;
        *(void *)&task_info_out[6] = v28 >> 10;
        LOWORD(task_info_out[8]) = 2048;
        *(void *)((char *)&task_info_out[8] + 2) = v45 >> 10;
        HIWORD(task_info_out[10]) = 2048;
        *(void *)&task_info_out[11] = v46 >> 10;
        LOWORD(task_info_out[13]) = 2048;
        *(void *)((char *)&task_info_out[13] + 2) = v47 >> 10;
        HIWORD(task_info_out[15]) = 2048;
        *(void *)&long long v82 = v48;
        _os_log_impl(&dword_1A5887000, v37, OS_LOG_TYPE_DEFAULT, "m11:%lld, m12:%lld, m21:%lld, m22:%lld, m23:%lld, m24:%lld, m25:%lld", (uint8_t *)task_info_out, 0x48u);
      }
    }
  }
  if ((v2[432] & 4) != 0 && (ContinuousUpTimeNanoseconds & 0x8000000000000000) == 0)
  {
    uint64_t v39 = FigGetContinuousUpTimeNanoseconds();
    if ((v2[432] & 4) != 0)
    {
      uint64_t v40 = v39;
      unsigned int v80 = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v42 = v80;
      if (os_log_type_enabled(v41, type[0])) {
        unsigned int v43 = v42;
      }
      else {
        unsigned int v43 = v42 & 0xFFFFFFFE;
      }
      if (v43)
      {
        int v67 = 136315394;
        v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
        __int16 v69 = 2048;
        *(void *)v70 = (v40 - ContinuousUpTimeNanoseconds) / 0x3E8uLL;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

FigCaptureMemoryReporter *__42__FigCaptureMemoryReporter_sharedInstance__block_invoke()
{
  result = objc_alloc_init(FigCaptureMemoryReporter);
  sharedInstance_sSharedFigMemoryReporter = (uint64_t)result;
  return result;
}

- (FigCaptureMemoryReporter)init
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureMemoryReporter;
  v2 = [(FigCaptureMemoryReporter *)&v5 init];
  if (v2)
  {
    FigDebugIsInternalBuild();
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((void *)v2 + 1) = FigDispatchQueueCreateStandardDispatchQueue();
    *((_DWORD *)v2 + 16) = getpid();
    host_t v3 = MEMORY[0x1A6272A30]();
    *((_DWORD *)v2 + 13) = v3;
    host_page_size(v3, (vm_size_t *)v2 + 7);
    *((void *)v2 + 4) = 0;
    *((_WORD *)v2 + 34) = 0;
    v2[70] = 0;
    *((int32x2_t *)v2 + 9) = vdup_n_s32(0x4B000u);
    *(_OWORD *)(v2 + 104) = xmmword_1A5F0D090;
    v2[96] = (_WORD)dword_1EB4C51B0 != 0;
    *((void *)v2 + 18) = 0;
  }
  return (FigCaptureMemoryReporter *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMemoryReporter;
  [(FigCaptureMemoryReporter *)&v3 dealloc];
}

- (void)decrementActiveClientCount:(BOOL)a3 clientIsCameraMessagesApp:(BOOL)a4
{
  if (self->_anyLoggingEnabled)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if ((dword_1EB4C51B0 & 4) != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[FigCaptureMemoryReporter _updateActiveClientCountWithDelta:]((uint64_t)self, -1);
    if (v5 || v4)
    {
      if (v5) {
        self->_activeClientsIncludeCamera = 0;
      }
      if (v4) {
        self->_activeClientsIncludeCameraMessagesApp = 0;
      }
      if ((dword_1EB4C51B0 & 8) != 0) {
        -[FigCaptureMemoryReporter _startMemgraphCoolDown:]((uint64_t)self, 1);
      }
    }
  }
}

- (void)_startMemgraphCoolDown:(uint64_t)a1
{
  if (a1)
  {
    BOOL v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    if (!*(void *)(a1 + 24))
    {
      BOOL v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 8));
      *(void *)(a1 + 24) = v5;
      dispatch_time_t v6 = dispatch_time(0, 1000000000 * a2);
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
      unint64_t v7 = *(NSObject **)(a1 + 24);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __51__FigCaptureMemoryReporter__startMemgraphCoolDown___block_invoke;
      handler[3] = &unk_1E5C24430;
      handler[4] = a1;
      dispatch_source_set_event_handler(v7, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 24));
    }
    os_unfair_lock_unlock(v4);
  }
}

- (unint64_t)peakFootprintSinceReset
{
  return atomic_load(&self->_peakFootprint);
}

- (void)_startReporting
{
  if (a1 && *(unsigned char *)(a1 + 96))
  {
    *(void *)(a1 + 136) = os_log_create("com.apple.coremedia.CMCapture.FigCaptureMemoryReporter", "");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    -[FigCaptureMemoryReporter _changeReportFrequency:](a1, *(void *)(a1 + 112));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  }
}

void __51__FigCaptureMemoryReporter__startMemgraphCoolDown___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 36));
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24));

  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 36);
  os_unfair_lock_unlock(v2);
}

- (void)_generateMemgraph:(uint64_t)a1
{
  kern_return_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  mach_port_t corpse_task_port;
  uint64_t v13;
  void v14[3];
  void v15[17];

  v15[16] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    uint64_t v3 = *(void *)(a1 + 24);
    os_unfair_lock_unlock(v2);
    if (dword_1EB4C51B0)
    {
      corpse_task_port = 0;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!v3)
    {
      BOOL v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
      task_read_t v6 = *MEMORY[0x1E4F14960];
      corpse_task_port = 0;
      unint64_t v7 = task_generate_corpse(v6, &corpse_task_port);
      if (dword_1EB4C51B0)
      {
        unint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v7)
      {
        FigDebugAssert3();
      }
      else
      {
        unint64_t v9 = corpse_task_port;
        char v13 = 0;
        v14[0] = &v13;
        v14[1] = 0x2020000000;
        v10 = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
        v14[2] = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
        if (!getReportMemoryExceptionFromTaskSymbolLoc_ptr)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke;
          v15[3] = &unk_1E5C24978;
          v15[4] = &v13;
          __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke((uint64_t)v15);
          v10 = *(void **)(v14[0] + 24);
        }
        _Block_object_dispose(&v13, 8);
        if (!v10) {
          -[FigCaptureMemoryReporter _generateMemgraph:]();
        }
        ((void (*)(uint64_t, uint64_t, void, void, void))v10)(v9, 1, 0, 0, 0);
        mach_port_deallocate(*v5, corpse_task_port);
        if (dword_1EB4C51B0)
        {
          int v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[FigCaptureMemoryReporter _startMemgraphCoolDown:](a1, 60);
      }
    }
  }
}

- (void)_logCurrentTransactions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id obj = (id)FigOSTransactionCopyDescriptions();
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
    if (dword_1EB4C51B0)
    {
      unsigned int v21 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16, v11, v13);
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v17 != v4) {
            objc_enumerationMutation(obj);
          }
          task_read_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v7 = objc_msgSend(v6, "rangeOfString:", @"://", v12, v14);
          if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
            task_read_t v6 = (void *)[v6 substringToIndex:v7];
          }
          if (dword_1EB4C51B0)
          {
            unsigned int v21 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            unint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v9 = v21;
            if (os_log_type_enabled(v8, type)) {
              unsigned int v10 = v9;
            }
            else {
              unsigned int v10 = v9 & 0xFFFFFFFE;
            }
            if (v10)
            {
              int v23 = 136315394;
              unsigned int v24 = "-[FigCaptureMemoryReporter _logCurrentTransactions]";
              __int16 v25 = 2112;
              unsigned int v26 = v6;
              LODWORD(v14) = 22;
              int v12 = &v23;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v3);
    }
    CFRelease(obj);
  }
}

- (unint64_t)currentFootprint
{
  return self->_currentFootprint;
}

- (void)_generateMemgraph:.cold.1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void soft_ReportMemoryExceptionFromTask(task_t, BOOL, const char * _Nullable, dispatch_queue_t _Nullable, void (^ _Nullable)(NSError * _Nullable))"), @"FigCaptureMemoryReporter.m", 38, @"%s", dlerror());
  __break(1u);
}

@end