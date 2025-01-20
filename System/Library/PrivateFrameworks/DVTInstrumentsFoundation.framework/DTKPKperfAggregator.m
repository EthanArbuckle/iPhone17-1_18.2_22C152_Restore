@interface DTKPKperfAggregator
- (BOOL)_ktraceTeardown:(id *)a3;
- (DTKPKperfAggregator)initWithConfig:(id)a3;
- (id).cxx_construct;
- (id)_getKernelBufferLocked:(BOOL *)a3 error:(id *)a4;
- (id)_getKperfKernelBufferLocked:(BOOL *)a3 error:(id *)a4;
- (id)_kdebugReadWithMoreLocked:(BOOL *)a3 error:(id *)a4;
- (id)_kernelCallbackInit;
- (id)_kernelCallbackStart;
- (id)callback;
- (id)pause;
- (id)resume;
- (id)start;
- (id)stop;
- (id)swapOutCurrentDatastream:(id *)a3;
- (int)_flushDataFromKernel:(unsigned int)a3 more:(BOOL *)a4 error:(id *)a5;
- (unsigned)_kernelCallbackImpl;
- (void)_kernelCallbackError;
- (void)_kernelCallbackNotifyCallblock:(unsigned int)a3;
- (void)_kernelCallbackStop;
- (void)_releaseKernelResources;
- (void)_reportCallbackStats;
- (void)_reportStats;
- (void)_reportTimeStats;
- (void)_resetStats;
- (void)setCallback:(id)a3;
@end

@implementation DTKPKperfAggregator

- (void)_reportTimeStats
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t rep = self->_startTime.__d_.__rep_;
  int64_t v3 = self->_endTime.__d_.__rep_;
  if (qword_2687080C0 != -1) {
    dispatch_once(&qword_2687080C0, &unk_26E5158A8);
  }
  v5 = qword_2687080C8;
  if (os_log_type_enabled((os_log_t)qword_2687080C8, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (v3 - rep) % 3600000000000;
    uint64_t v7 = v6 / 60000000000;
    uint64_t v8 = (unsigned __int128)(v6 % 60000000000 * (__int128)0x112E0BE826D694B3) >> 64;
    unint64_t id = self->_id;
    int v10 = 134218496;
    unint64_t v11 = id;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 1024;
    int v15 = (v8 >> 26) + ((unint64_t)v8 >> 63);
    _os_log_impl(&dword_23087D000, v5, OS_LOG_TYPE_INFO, "[%llu] Lasted: %um:%us", (uint8_t *)&v10, 0x18u);
  }
}

- (void)_reportCallbackStats
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (qword_2687080C0 != -1) {
    dispatch_once(&qword_2687080C0, &unk_26E5158A8);
  }
  int64_t v3 = qword_2687080C8;
  if (os_log_type_enabled((os_log_t)qword_2687080C8, OS_LOG_TYPE_INFO))
  {
    unint64_t id = self->_id;
    unint64_t callbackCalledCount = self->_callbackCalledCount;
    unint64_t callbackNotificationCount = self->_callbackNotificationCount;
    int v7 = 134218496;
    unint64_t v8 = id;
    __int16 v9 = 2048;
    unint64_t v10 = callbackCalledCount;
    __int16 v11 = 2048;
    unint64_t v12 = callbackNotificationCount;
    _os_log_impl(&dword_23087D000, v3, OS_LOG_TYPE_INFO, "[%llu] Callback: %llu calls (%llu notifications)", (uint8_t *)&v7, 0x20u);
  }
}

- (void)_reportStats
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t dataPulledSize = self->_dataPulledSize;
  double v4 = (double)dataPulledSize;
  if (dataPulledSize) {
    int v5 = vcvtmd_s64_f64(log2((double)dataPulledSize) / 10.0);
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = [NSString stringWithFormat:@"%.2f %s", v4 / exp2((double)v5 * 10.0), off_264B90548[v5]];
  if (qword_2687080C0 != -1) {
    dispatch_once(&qword_2687080C0, &unk_26E5158A8);
  }
  int v7 = (id)qword_2687080C8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t id = self->_id;
    unint64_t v9 = [(DTKPConfiguration *)self->_config bufferSize];
    double v10 = (double)v9;
    if (v9) {
      int v11 = vcvtmd_s64_f64(log2((double)v9) / 10.0);
    }
    else {
      int v11 = 0;
    }
    unint64_t v12 = [NSString stringWithFormat:@"%.2f %s", v10 / exp2((double)v11 * 10.0), off_264B90548[v11]];
    *(_DWORD *)buf = 134218242;
    unint64_t v17 = id;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_23087D000, v7, OS_LOG_TYPE_INFO, "[%llu] Kernel: buffer size: %@", buf, 0x16u);
  }
  if (qword_2687080C0 != -1) {
    dispatch_once(&qword_2687080C0, &unk_26E5158A8);
  }
  uint64_t v13 = qword_2687080C8;
  if (os_log_type_enabled((os_log_t)qword_2687080C8, OS_LOG_TYPE_INFO))
  {
    unint64_t v14 = self->_id;
    unint64_t numberOfPulls = self->_numberOfPulls;
    *(_DWORD *)buf = 134218498;
    unint64_t v17 = v14;
    __int16 v18 = 2112;
    v19 = v6;
    __int16 v20 = 2048;
    unint64_t v21 = numberOfPulls;
    _os_log_impl(&dword_23087D000, v13, OS_LOG_TYPE_INFO, "[%llu] Pulled: %@ (%llu pulls)", buf, 0x20u);
  }
  [(DTKPKperfAggregator *)self _reportTimeStats];
  [(DTKPKperfAggregator *)self _reportCallbackStats];
}

- (void)_resetStats
{
  self->_unint64_t dataPulledSize = 0;
  self->_unint64_t numberOfPulls = 0;
  self->_unint64_t callbackCalledCount = 0;
  self->_unint64_t callbackNotificationCount = 0;
}

- (BOOL)_ktraceTeardown:(id *)a3
{
  uint64_t v5 = kperf_logging_stop();
  int v6 = v5;
  BOOL v7 = v5 == 0;
  if (a3 && v5)
  {
    unint64_t v8 = [NSString stringWithFormat:@"kperf_logging_stop failed with %d.", v5];
    sub_2309067A4(v8, -6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(DTKPConfiguration *)self->_config hasEnabledKPCClasses])
  {
    int v9 = kpc_set_counting();
    BOOL v7 = (v9 | v6) == 0;
    if (a3)
    {
      if (v9)
      {
        double v10 = NSString;
        int v11 = __error();
        unint64_t v12 = [v10 stringWithFormat:@"kpc_set_counting failed (%s).", strerror(*v11)];
        sub_2309067A4(v12, -8);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v7 = 0;
      }
    }
  }
  if (self->_kperfSample)
  {
    int v13 = kperf_sample_off();
    if (v13) {
      BOOL v7 = 0;
    }
    if (a3 && v13)
    {
      unint64_t v14 = NSString;
      int v15 = __error();
      uint64_t v16 = [v14 stringWithFormat:@"kperf_sample_on failed (%s).", strerror(*v15)];
      sub_2309067A4(v16, -6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  return v7;
}

- (DTKPKperfAggregator)initWithConfig:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTKPKperfAggregator;
  int v6 = [(DTKPKperfAggregator *)&v13 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    unint64_t v8 = [DVTStreamManager alloc];
    int v9 = objc_opt_new();
    uint64_t v10 = [(DVTStreamManager *)v8 initWithStream:v9];
    manager = v7->_manager;
    v7->_manager = (DVTStreamManager *)v10;

    v7->_usingTimer = 0;
    *(_WORD *)&v7->_kperfSample = 0;
    v7->_unint64_t id = atomic_fetch_add(&qword_2687080D0, 1uLL);
  }

  return v7;
}

- (id)start
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v38 = self;
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  double v4 = [(DTKPKperfAggregator *)self _kernelCallbackInit];
  if (v4)
  {
    id v5 = v4;
    int v6 = v5;
    goto LABEL_34;
  }
  [(DTKPKperfAggregator *)self _resetStats];
  uint64_t v35 = (uint64_t)&v35;
  v36 = &v35;
  uint64_t v37 = 0;
  uint64_t live = kperf_buffer_create_live();
  v38->_kperfBuffer = (kperf_buf *)live;
  if (live)
  {
    v39 = &unk_26E514E58;
    v40 = &v38;
    v41 = &v39;
    unint64_t v8 = (uint64_t *)operator new(0x30uLL);
    *unint64_t v8 = 0;
    v8[1] = 0;
    sub_2308DE718((uint64_t)(v8 + 2), (uint64_t)&v39);
    int v9 = v36;
    *unint64_t v8 = (uint64_t)&v35;
    v8[1] = (uint64_t)v9;
    *int v9 = (uint64_t)v8;
    v36 = v8;
    ++v37;
    sub_2308DE8A0(&v39);
    uint64_t v10 = [(DTKPConfiguration *)v38->_config generateConfigWords];
    int v11 = [(DTKPConfiguration *)v38->_config triggers];
    uint64_t v12 = [v11 count];

    if ([v10 length]
      && ([v10 length],
          [v10 bytes],
          uint64_t v13 = kperf_buffer_set_config(),
          v13))
    {
      for (i = v36; i != &v35; i = (uint64_t *)i[1])
      {
        sub_2308DE680((uint64_t)&v39, (uint64_t)(i + 2));
        if (!v41) {
          sub_2308AAD24();
        }
        (*((void (**)(void **))*v41 + 6))(v41);
        sub_2308DE8A0(&v39);
      }
      uint64_t v22 = [NSString stringWithFormat:@"kperf_buffer_set_config failed with %d.", v13];
      int v6 = sub_230908178(v22, -6);
    }
    else if ([(DTKPConfiguration *)v38->_config hasEnabledKPCClasses] {
           && ([(DTKPConfiguration *)v38->_config enabledKPCClasses],
    }
               kpc_set_counting()))
    {
      int v15 = *__error();
      for (j = v36; j != &v35; j = (uint64_t *)j[1])
      {
        sub_2308DE680((uint64_t)&v39, (uint64_t)(j + 2));
        if (!v41) {
          sub_2308AAD24();
        }
        (*((void (**)(void **))*v41 + 6))(v41);
        sub_2308DE8A0(&v39);
      }
      v23 = [NSString stringWithFormat:@"kpc_set_counting failed (%s).", strerror(v15)];
      int v6 = sub_230908178(v23, -6);
    }
    else
    {
      if (v12)
      {
        uint64_t v17 = kperf_sample_on();
        v39 = &unk_26E514EB0;
        v40 = &v38;
        v41 = &v39;
        __int16 v18 = (uint64_t *)operator new(0x30uLL);
        *__int16 v18 = 0;
        v18[1] = 0;
        sub_2308DE718((uint64_t)(v18 + 2), (uint64_t)&v39);
        v19 = v36;
        *__int16 v18 = (uint64_t)&v35;
        v18[1] = (uint64_t)v19;
        uint64_t *v19 = (uint64_t)v18;
        v36 = v18;
        ++v37;
        sub_2308DE8A0(&v39);
        if (v17)
        {
          for (k = v36; k != &v35; k = (uint64_t *)k[1])
          {
            sub_2308DE680((uint64_t)&v39, (uint64_t)(k + 2));
            if (!v41) {
              sub_2308AAD24();
            }
            (*((void (**)(void **))*v41 + 6))(v41);
            sub_2308DE8A0(&v39);
          }
          unint64_t v21 = [NSString stringWithFormat:@"kperf_sample_on failed with %d.", v17];
          int v6 = sub_230908178(v21, -6);

          goto LABEL_31;
        }
        v38->_kperfSample = 1;
      }
      uint64_t v24 = kperf_logging_start();
      v39 = &unk_26E514F08;
      v41 = &v39;
      v25 = (uint64_t *)operator new(0x30uLL);
      uint64_t *v25 = 0;
      v25[1] = 0;
      sub_2308DE718((uint64_t)(v25 + 2), (uint64_t)&v39);
      v26 = v36;
      uint64_t *v25 = (uint64_t)&v35;
      v25[1] = (uint64_t)v26;
      uint64_t *v26 = (uint64_t)v25;
      v36 = v25;
      ++v37;
      sub_2308DE8A0(&v39);
      if (!v24)
      {
        v30.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
        v31 = v38;
        v38->_startTime.__d_.__rep_ = v30.__d_.__rep_;
        if ([(DTKPConfiguration *)v31->_config collectionMode] == 3)
        {
          id v5 = 0;
          int v6 = 0;
        }
        else
        {
          id v5 = [(DTKPKperfAggregator *)v38 _kernelCallbackStart];
          if (v5)
          {
            v39 = &unk_26E514F60;
            v40 = &v38;
            v41 = &v39;
            sub_23090713C((uint64_t)&v35, (uint64_t)&v39);
            sub_2308DE8A0(&v39);
            sub_230907198(v36, &v35);
            v32 = NSString;
            v33 = [v5 localizedDescription];
            v34 = [v32 stringWithFormat:@"_kernelCallbackStart failed. Underlying error: %@", v33];
            int v6 = sub_230907110(v34, -6);
          }
          else
          {
            int v6 = 0;
            v38->_usingTimer = 1;
          }
        }
        goto LABEL_32;
      }
      for (m = v36; m != &v35; m = (uint64_t *)m[1])
      {
        sub_2308DE680((uint64_t)&v39, (uint64_t)(m + 2));
        if (!v41) {
          sub_2308AAD24();
        }
        (*((void (**)(void **))*v41 + 6))(v41);
        sub_2308DE8A0(&v39);
      }
      v28 = [NSString stringWithFormat:@"kperf_logging_start failed with %d.", v24];
      int v6 = sub_230908178(v28, -6);
    }
LABEL_31:
    id v5 = 0;
LABEL_32:

    goto LABEL_33;
  }
  int v6 = sub_230908178(@"kperf_buffer_create_live failed.", -1);
  id v5 = 0;
LABEL_33:
  sub_2308DE60C(&v35);
LABEL_34:

  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v6;
}

- (id)pause
{
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  id v6 = 0;
  [(DTKPKperfAggregator *)self _ktraceTeardown:&v6];
  id v4 = v6;
  if (self->_usingTimer) {
    [(DVTQueueBasedTimer *)self->_timer pause];
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v4;
}

- (id)resume
{
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  int v4 = [(DTKPConfiguration *)self->_config hasEnabledKPCClasses];
  if (v4)
  {
    [(DTKPConfiguration *)self->_config enabledKPCClasses];
    if (kpc_set_counting())
    {
      id v5 = NSString;
      id v6 = __error();
      BOOL v7 = [v5 stringWithFormat:@"kpc_set_counting failed (%s).", strerror(*v6)];
      sub_230908178(v7, -8);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      int v15 = v8;
      goto LABEL_18;
    }
  }
  if (self->_kperfSample && kperf_sample_on())
  {
    if (v4) {
      kpc_set_counting();
    }
    int v9 = NSString;
    uint64_t v10 = __error();
    BOOL v7 = [v9 stringWithFormat:@"kperf_sample_on failed (%s).", strerror(*v10)];
    sub_230908178(v7, -6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (kperf_logging_start())
  {
    kperf_sample_off();
    if (v4) {
      kpc_set_counting();
    }
    int v11 = NSString;
    uint64_t v12 = __error();
    BOOL v7 = [v11 stringWithFormat:@"kperf_logging_start failed (%s).", strerror(*v12)];
    sub_230908178(v7, -6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (self->_usingTimer) {
    [(DVTQueueBasedTimer *)self->_timer resume];
  }
  id v17 = 0;
  int v13 = [(DTKPKperfAggregator *)self _flushDataFromKernel:1 more:0 error:&v17];
  id v14 = v17;
  BOOL v7 = v14;
  if (v13)
  {
    id v8 = v14;
    goto LABEL_17;
  }
  int v15 = 0;
LABEL_18:

  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v15;
}

- (id)stop
{
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  id v10 = 0;
  [(DTKPKperfAggregator *)self _ktraceTeardown:&v10];
  id v4 = v10;
  self->_endTime.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  if (self->_usingTimer) {
    [(DVTQueueBasedTimer *)self->_timer stop];
  }
  char v9 = 0;
  do
  {
    id v8 = v4;
    int v5 = [(DTKPKperfAggregator *)self _flushDataFromKernel:0 more:&v9 error:&v8];
    id v6 = v8;

    if (v5) {
      break;
    }
    id v4 = v6;
  }
  while (v9);
  [(DTKPKperfAggregator *)self _releaseKernelResources];
  [(DTKPKperfAggregator *)self _reportStats];
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return v6;
}

- (id)swapOutCurrentDatastream:(id *)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_manager, sel_export);
}

- (void)_kernelCallbackNotifyCallblock:(unsigned int)a3
{
  id v4 = _Block_copy(self->_callback);
  if (v4)
  {
    int v5 = dispatch_get_global_queue(21, 0);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2309076CC;
    v6[3] = &unk_264B904E0;
    id v7 = v4;
    unsigned int v8 = a3;
    dispatch_async(v5, v6);
  }
}

- (void)_kernelCallbackStop
{
}

- (id)_kernelCallbackStart
{
  return 0;
}

- (void)_kernelCallbackError
{
  [(DTKPKperfAggregator *)self _kernelCallbackNotifyCallblock:1];
  int64_t v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2309077A4;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (unsigned)_kernelCallbackImpl
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  ++self->_callbackCalledCount;
  int v3 = kperf_buffer_wait();
  int v4 = v3;
  if (v3 == 35 || v3 == 0)
  {
    char v14 = 0;
    id v13 = 0;
    [(DTKPKperfAggregator *)self _flushDataFromKernel:0 more:&v14 error:&v13];
    id v6 = v13;
    if (v6)
    {
      if (qword_2687080C0 != -1) {
        dispatch_once(&qword_2687080C0, &unk_26E5158A8);
      }
      id v7 = (id)qword_2687080C8;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        unsigned int v8 = [v6 localizedDescription];
        sub_23093EB30(v8, buf, v7);
      }

      [(DTKPKperfAggregator *)self _kernelCallbackError];
      unsigned int v9 = 2;
    }
    else if (!v4 {
           || v14
    }
           || (unint64_t v11 = [(DVTStreamManager *)self->_manager currentStreamSize],
               v11 >= [(DTKPConfiguration *)self->_config bufferSize]))
    {
      [(DTKPKperfAggregator *)self _kernelCallbackNotifyCallblock:2];
      unsigned int v9 = 0;
      ++self->_callbackNotificationCount;
    }
    else
    {
      unsigned int v9 = 1;
    }
  }
  else
  {
    if (qword_2687080C0 != -1) {
      dispatch_once(&qword_2687080C0, &unk_26E5158A8);
    }
    id v10 = qword_2687080C8;
    if (os_log_type_enabled((os_log_t)qword_2687080C8, OS_LOG_TYPE_ERROR)) {
      sub_23093EAB8(v4, v10);
    }
    [(DTKPKperfAggregator *)self _kernelCallbackError];
    return 2;
  }
  return v9;
}

- (id)_kernelCallbackInit
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = *(void *)"";
  v8[3] = sub_230907B1C;
  v8[4] = sub_230907B28;
  objc_initWeak(&v9, self);
  int v3 = [DVTQueueBasedTimer alloc];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_230907B30;
  v7[3] = &unk_264B90508;
  v7[4] = v8;
  int v4 = [(DVTQueueBasedTimer *)v3 initWithInterval:25 qos:v7 block:0.2];
  timer = self->_timer;
  self->_timer = v4;

  _Block_object_dispose(v8, 8);
  objc_destroyWeak(&v9);
  return 0;
}

- (void)_releaseKernelResources
{
  if (self->_kperfBuffer)
  {
    kperf_buffer_free();
    self->_kperfBuffer = 0;
    uint64_t v3 = kperf_logging_set_size();
    MEMORY[0x230FC1BF0](v3);
    kperf_reset();
  }
}

- (id)_kdebugReadWithMoreLocked:(BOOL *)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  unint64_t v6 = [(DTKPConfiguration *)self->_config bufferSize];
  if (v6 >= 0x2000000) {
    size_t v7 = 0x2000000;
  }
  else {
    size_t v7 = v6;
  }
  size_t v14 = v7;
  unsigned int v8 = malloc_type_malloc(v7, 0xA52F31E0uLL);
  *(_OWORD *)int v15 = xmmword_23094A360;
  uint64_t v16 = 0;
  if (sysctl(v15, 3u, v8, &v14, 0, 0) < 0)
  {
    if (a4)
    {
      id v10 = NSString;
      unint64_t v11 = __error();
      uint64_t v12 = [v10 stringWithFormat:@"trace_read failed with errno: %s", strerror(*v11)];
      sub_2309067A4(v12, -1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*__error())
    {
      id v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v14 <<= 6;
  }
  id v9 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v8 length:v7 freeWhenDone:YES];
  if (a3 && v7 - v14 <= 0x3FF) {
    *a3 = 1;
  }
LABEL_15:
  return v9;
}

- (id)_getKperfKernelBufferLocked:(BOOL *)a3 error:(id *)a4
{
  int v5 = kperf_buffer_readdata_withmore();
  if (v5 <= 0)
  {
    int v8 = v5;
    id v9 = 0;
    if (a4 && v8)
    {
      size_t v7 = @"kperf_buffer_readdata_withmore failed.";
      goto LABEL_8;
    }
  }
  else
  {
    int v6 = kperf_buffer_getbuf();
    if (a4 && v6)
    {
      size_t v7 = @"kperf_buffer_getbuf failed.";
LABEL_8:
      sub_230908178(v7, -6);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = 0;
      *a4 = v10;
      goto LABEL_10;
    }
    id v9 = [[[NSData alloc] initWithBytesNoCopy:MEMORY[0x263EFF8F8] length:MEMORY[0x263EFF900] deallocator:MEMORY[0x263EFF908]] autorelease];
  }
LABEL_10:
  return v9;
}

- (id)_getKernelBufferLocked:(BOOL *)a3 error:(id *)a4
{
  if (self->_hasUsedKperf) {
    goto LABEL_2;
  }
  size_t v7 = [(DTKPKperfAggregator *)self _getKperfKernelBufferLocked:a3 error:a4];
  if (v7)
  {
    id v9 = v7;
    self->_hasUsedKperf = 1;
    [(DVTStreamManager *)self->_manager commit:v7 error:a4];

LABEL_2:
    size_t v7 = [(DTKPKperfAggregator *)self _kdebugReadWithMoreLocked:a3 error:a4];
  }
  return v7;
}

- (int)_flushDataFromKernel:(unsigned int)a3 more:(BOOL *)a4 error:(id *)a5
{
  char v18 = 1;
  uint64_t v17 = 0;
  if (a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = 0xFFFFFFFFLL;
  }
  if (a4)
  {
    size_t v7 = a4;
    *a4 = 1;
  }
  else
  {
    size_t v7 = (BOOL *)&v18;
  }
  unint64_t v8 = 0;
  if (a5) {
    id v9 = a5;
  }
  else {
    id v9 = (id *)&v17;
  }
  int64x2_t v16 = vdupq_n_s64(1uLL);
  while (1)
  {
    if (!std::recursive_mutex::try_lock((std::recursive_mutex *)&self->_lock)) {
      return 0;
    }
    id v10 = -[DTKPKperfAggregator _getKernelBufferLocked:error:](self, "_getKernelBufferLocked:error:", v7, v9, v16.i64[0]);
    uint64_t v11 = [v10 length];
    v12.i64[1] = v16.i64[1];
    v12.i64[0] = v11;
    *(int64x2_t *)&self->_unint64_t dataPulledSize = vaddq_s64(*(int64x2_t *)&self->_dataPulledSize, v12);
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
    if (*v9)
    {
      int v14 = -6;
      goto LABEL_22;
    }
    if ([v10 length]) {
      break;
    }
LABEL_16:

    int v14 = 0;
    if (!*v7 || v8 >= v6) {
      return v14;
    }
  }
  uint64_t v13 = [v10 length];
  [(DVTStreamManager *)self->_manager commit:v10 error:v9];
  if (!*v9)
  {
    v8 += v13;
    goto LABEL_16;
  }
  int v14 = -100;
LABEL_22:

  return v14;
}

- (id)callback
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id).cxx_construct
{
  self->_startTime.__d_.__rep_ = 0;
  self->_endTime.__d_.__rep_ = 0;
  MEMORY[0x230FC1050](&self->_lock, a2);
  return self;
}

@end