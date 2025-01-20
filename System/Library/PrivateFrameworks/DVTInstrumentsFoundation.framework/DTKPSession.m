@interface DTKPSession
+ (int)blessPid:(int)a3;
+ (void)initialize;
- (BOOL)isActive;
- (BOOL)isPaused;
- (BOOL)pause:(id *)a3;
- (BOOL)resume:(id *)a3;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (DTKPSession)init;
- (DTKPSession)initWithConfig:(id)a3 andAggregator:(id)a4;
- (id).cxx_construct;
- (id)_lockKPerf;
- (id)swapOutCurrentDatastream:(id *)a3;
- (int)_unlockKperf;
- (unsigned)recordingPriority;
- (unsigned)sessionID;
- (void)dealloc;
- (void)setRecordingPriority:(unsigned __int8)a3;
@end

@implementation DTKPSession

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DTKPSetupLogging();
  }
}

+ (int)blessPid:(int)a3
{
  if (kperf_bless_set()) {
    return -1;
  }
  else {
    return 0;
  }
}

- (DTKPSession)init
{
}

- (DTKPSession)initWithConfig:(id)a3 andAggregator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DTKPSession;
  id v9 = [(DTKPSession *)&v12 init];
  v10 = (id *)v9;
  if (v9)
  {
    objc_storeStrong((id *)v9 + 11, a3);
    objc_storeStrong(v10 + 12, a4);
    *((_DWORD *)v10 + 2) = atomic_fetch_add_explicit(dword_268707F58, 1u, memory_order_relaxed);
    *((unsigned char *)v10 + 104) = 10;
  }

  return (DTKPSession *)v10;
}

- (void)dealloc
{
  id v6 = 0;
  [(DTKPSession *)self stop:&v6];
  id v3 = v6;
  v4 = v3;
  if (v3) {
    NSLog(&cfstr_ErrorStoppingR.isa, v3);
  }

  v5.receiver = self;
  v5.super_class = (Class)DTKPSession;
  [(DTKPSession *)&v5 dealloc];
}

- (unsigned)sessionID
{
  return *((_DWORD *)self + 2);
}

- (id)swapOutCurrentDatastream:(id *)a3
{
  return (id)[*((id *)self + 12) swapOutCurrentDatastream:a3];
}

- (id)_lockKPerf
{
  uint64_t v3 = 0;
  v4 = 0;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&qword_268707F60, (unint64_t *)&v3, (unint64_t)self, memory_order_release, memory_order_relaxed);
  if (v3)
  {
    v4 = sub_2308C394C(@"_lockKPerf: could not lock kperf. Likely another session just started.", -1);
  }
  return v4;
}

- (int)_unlockKperf
{
  v2 = (DTKPSession *)atomic_load(&qword_268707F60);
  if (v2 != self) {
    return -1;
  }
  int result = 0;
  atomic_store(0, &qword_268707F60);
  return result;
}

- (BOOL)start:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_super v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  if (CSTaskIsTranslated())
  {
    sub_2308C394C(@"ktrace cannot trace the system under Rosetta translation", -500);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3) {
      *a3 = v6;
    }
    BOOL v7 = 0;
    *((_DWORD *)self + 20) = 4;
  }
  else
  {
    int v8 = *((_DWORD *)self + 20);
    if (v8)
    {
      id v9 = [NSString stringWithFormat:@"Cannot start session unless it's idle. Current state: %s", sub_2308C3DA4(v8)];
      sub_2308C394C(v9, -500);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (a3) {
        *a3 = v10;
      }
    }
    else
    {
      v11 = (id)sDTKPLogClient;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v24 = [(DTKPSession *)self sessionID];
        _os_log_impl(&dword_23087D000, v11, OS_LOG_TYPE_INFO, "DTKPSession: Starting recording. ID %d.", buf, 8u);
      }

      id v12 = [(DTKPSession *)self _lockKPerf];
      v13 = v12;
      if (a3)
      {
        v13 = 0;
        *a3 = v12;
      }
      if (!v12)
      {
        [(DTKPSession *)self recordingPriority];
        if (kperf_bless_allow_preemption())
        {
          v14 = [NSString stringWithFormat:@"Could not set the recording priority."];
          sub_2308C394C(v14, -6);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          if (a3) {
            *a3 = v15;
          }
          else {
            v13 = v15;
          }
        }
        else
        {
          id v16 = [*((id *)self + 11) apply];
          id v17 = v16;
          if (a3)
          {
            *a3 = v16;
            id v17 = v13;
          }
          if (v16)
          {
            v13 = v17;
          }
          else
          {
            id v21 = [*((id *)self + 12) start];
            v13 = v21;
            if (a3)
            {
              *a3 = v21;
              v13 = v17;
            }
            if (!v21)
            {
              BOOL v7 = 1;
              *((_DWORD *)self + 20) = 1;
              goto LABEL_29;
            }
            id v22 = (id)[*((id *)self + 11) reset];
          }
        }
        [(DTKPSession *)self _unlockKperf];
      }
      *((_DWORD *)self + 20) = 4;
      if (!a3)
      {
        id v18 = v13;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          v19 = [v18 localizedDescription];
          sub_23093D7C4(v19, buf);
        }
      }
    }
    BOOL v7 = 0;
  }
LABEL_29:
  std::mutex::unlock(v5);
  return v7;
}

- (BOOL)pause:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  int v6 = *((_DWORD *)self + 20);
  if (v6 == 1)
  {
    BOOL v7 = (id)sDTKPLogClient;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v15 = [(DTKPSession *)self sessionID];
      _os_log_impl(&dword_23087D000, v7, OS_LOG_TYPE_INFO, "DTKPSession: Pausing recording. ID %d.", buf, 8u);
    }

    int v8 = [*((id *)self + 12) pause];
    id v9 = v8;
    if (!v8)
    {
      *((_DWORD *)self + 20) = 2;
      BOOL v12 = 1;
      goto LABEL_8;
    }
    sub_2308C3FA4(v8, a3);
    *((_DWORD *)self + 20) = 4;
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"Cannot pause session session unless it's running. Current state: %s", sub_2308C3DA4(v6)];
    v11 = sub_2308C394C(v10, -500);

    sub_2308C3FA4(v11, a3);
  }
  BOOL v12 = 0;
LABEL_8:
  std::mutex::unlock(v5);
  return v12;
}

- (BOOL)resume:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  int v6 = *((_DWORD *)self + 20);
  if (v6 == 2)
  {
    BOOL v7 = (id)sDTKPLogClient;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v15 = [(DTKPSession *)self sessionID];
      _os_log_impl(&dword_23087D000, v7, OS_LOG_TYPE_INFO, "DTKPSession: Resuming recording. ID %d.", buf, 8u);
    }

    int v8 = [*((id *)self + 12) resume];
    id v9 = v8;
    if (!v8)
    {
      BOOL v12 = 1;
      *((_DWORD *)self + 20) = 1;
      goto LABEL_8;
    }
    sub_2308C3FA4(v8, a3);
    *((_DWORD *)self + 20) = 4;
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"Cannot resume session unless it's paused. Current state: %s", sub_2308C3DA4(v6)];
    v11 = sub_2308C394C(v10, -500);

    sub_2308C3FA4(v11, a3);
  }
  BOOL v12 = 0;
LABEL_8:
  std::mutex::unlock(v5);
  return v12;
}

- (BOOL)stop:(id *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  int v6 = *((_DWORD *)self + 20);
  if ((v6 - 1) < 2)
  {
    id v10 = (id)sDTKPLogClient;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109120;
      v17[1] = [(DTKPSession *)self sessionID];
      _os_log_impl(&dword_23087D000, v10, OS_LOG_TYPE_INFO, "DTKPSession: Stopping recording. ID %d.", (uint8_t *)v17, 8u);
    }

    v11 = [*((id *)self + 12) stop];
    BOOL v12 = v11;
    if (v11)
    {
      sub_2308C3FA4(v11, a3);
      int v13 = 1;
    }
    else
    {
      int v13 = 0;
    }
    v14 = [*((id *)self + 11) reset];

    if (v14)
    {
      sub_2308C3FA4(v14, a3);
      int v13 = 1;
    }
    BOOL v7 = v13 == 0;
    if (v13) {
      int v15 = 4;
    }
    else {
      int v15 = 3;
    }
    *((_DWORD *)self + 20) = v15;

    goto LABEL_16;
  }
  BOOL v7 = 1;
  if (v6 == 4)
  {
LABEL_16:
    [(DTKPSession *)self _unlockKperf];
    goto LABEL_17;
  }
  if (!v6)
  {
    int v8 = [NSString stringWithFormat:@"Cannot stop a session which is currently idle."];
    id v9 = sub_2308C394C(v8, -500);

    sub_2308C3FA4(v9, a3);
    BOOL v7 = 0;
  }
LABEL_17:
  std::mutex::unlock(v5);
  return v7;
}

- (BOOL)isActive
{
  v2 = self;
  uint64_t v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  LOBYTE(v2) = (*((_DWORD *)v2 + 20) - 1) < 2;
  std::mutex::unlock(v3);
  return (char)v2;
}

- (BOOL)isPaused
{
  v2 = self;
  uint64_t v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  LOBYTE(v2) = *((_DWORD *)v2 + 20) == 2;
  std::mutex::unlock(v3);
  return (char)v2;
}

- (unsigned)recordingPriority
{
  return *((unsigned char *)self + 104);
}

- (void)setRecordingPriority:(unsigned __int8)a3
{
  *((unsigned char *)self + 104) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 16));
}

- (id).cxx_construct
{
  *((void *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  return self;
}

@end