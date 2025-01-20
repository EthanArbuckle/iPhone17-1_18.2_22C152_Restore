@interface HTMonitorPidHangEvent
+ (void)checkHangForPid:(int)a3;
- ($2B1CEEAC013A2A6D6A5F780F196821AB)shmem_region;
- (id)initHTMonitorPidHangEvent:(id *)a3 shmem_size:(unint64_t)a4;
- (unint64_t)shmem_size;
- (void)dealloc;
@end

@implementation HTMonitorPidHangEvent

- (id)initHTMonitorPidHangEvent:(id *)a3 shmem_size:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HTMonitorPidHangEvent;
  id result = [(HTMonitorPidHangEvent *)&v7 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
  }
  return result;
}

- (void)dealloc
{
  munmap(self->_shmem_region, self->_shmem_size);
  self->_shmem_region = 0;
  self->_shmem_size = 0;
  v3.receiver = self;
  v3.super_class = (Class)HTMonitorPidHangEvent;
  [(HTMonitorPidHangEvent *)&v3 dealloc];
}

+ (void)checkHangForPid:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void *)pidHangEventDict;
  v5 = objc_msgSend(NSNumber, "numberWithInt:");
  v6 = [v4 objectForKeyedSubscript:v5];

  objc_super v7 = shared_ht_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = pidHangEventDict;
    _os_log_impl(&dword_1B3C06000, v7, OS_LOG_TYPE_INFO, "HangTracerMonitor:checkHangForPid pidHangEventDict  %@", buf, 0xCu);
  }

  if (v6)
  {
    int v8 = *(_DWORD *)(v6[1] + 4);
    v9 = shared_ht_log_handle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (!v10) {
        goto LABEL_13;
      }
      int v11 = *(_DWORD *)(v6[1] + 4);
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v11;
      v12 = "HangTracerMonitor:checkHangForPid number of hang Events =  %d";
      v13 = v9;
      uint32_t v14 = 8;
    }
    else
    {
      if (!v10) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v12 = "HangTracerMonitor:checkHangForPid number of hang Events is 0";
      v13 = v9;
      uint32_t v14 = 2;
    }
    _os_log_impl(&dword_1B3C06000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
LABEL_13:

    uint64_t v16 = v6[1];
    if (*(_DWORD *)(v16 + 4))
    {
      unint64_t v17 = 0;
      uint64_t v18 = 32;
      do
      {
        v19 = (unsigned int *)(v16 + v18);
        if (atomic_load(v19))
        {
          v21 = shared_ht_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v23) = a3;
            _os_log_impl(&dword_1B3C06000, v21, OS_LOG_TYPE_INFO, "HangTracerMonitor:checkHangForPid hang event suspend count is not 0 for pid=%u ", buf, 8u);
          }
        }
        else
        {
          HTCheckForHangForHTMonitor((uint64_t)(v19 - 6), v6[1] + 3080);
        }
        ++v17;
        uint64_t v16 = v6[1];
        v18 += 384;
      }
      while (v17 < *(unsigned int *)(v16 + 4));
    }
    goto LABEL_21;
  }
  v15 = shared_ht_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = a3;
    _os_log_impl(&dword_1B3C06000, v15, OS_LOG_TYPE_DEFAULT, "HangTracerMonitor:checkHangForPid(pid=%u) is not present in pidHangEventDict ", buf, 8u);
  }

LABEL_21:
}

- ($2B1CEEAC013A2A6D6A5F780F196821AB)shmem_region
{
  return self->_shmem_region;
}

- (unint64_t)shmem_size
{
  return self->_shmem_size;
}

@end