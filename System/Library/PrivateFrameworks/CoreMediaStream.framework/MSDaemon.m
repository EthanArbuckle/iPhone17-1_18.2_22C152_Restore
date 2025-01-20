@interface MSDaemon
- (BOOL)isBusy;
- (BOOL)stabilizedIsBusy;
- (MSDaemon)init;
- (NSTimer)hysteresisTimer;
- (OS_dispatch_queue)idleCountQueue;
- (int)UIBusyCount;
- (int)busyCount;
- (void)_didChangeIdleBusyState:(BOOL)a3;
- (void)_hysteresisTimerDidFire:(id)a3;
- (void)didIdle;
- (void)didUnidle;
- (void)releaseBusy;
- (void)releaseUIBusy;
- (void)retainBusy;
- (void)retainUIBusy;
- (void)setBusyCount:(int)a3;
- (void)setHysteresisTimer:(id)a3;
- (void)setIdleCountQueue:(id)a3;
- (void)setStabilizedIsBusy:(BOOL)a3;
- (void)setUIBusyCount:(int)a3;
@end

@implementation MSDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hysteresisTimer, 0);
  objc_storeStrong((id *)&self->_idleCountQueue, 0);
}

- (void)setStabilizedIsBusy:(BOOL)a3
{
  self->_stabilizedIsBusy = a3;
}

- (BOOL)stabilizedIsBusy
{
  return self->_stabilizedIsBusy;
}

- (void)setHysteresisTimer:(id)a3
{
}

- (NSTimer)hysteresisTimer
{
  return self->_hysteresisTimer;
}

- (void)setIdleCountQueue:(id)a3
{
}

- (OS_dispatch_queue)idleCountQueue
{
  return self->_idleCountQueue;
}

- (void)setUIBusyCount:(int)a3
{
  self->_UIBusyCount = a3;
}

- (int)UIBusyCount
{
  return self->_UIBusyCount;
}

- (void)setBusyCount:(int)a3
{
  self->_busyCount = a3;
}

- (int)busyCount
{
  return self->_busyCount;
}

- (void)_hysteresisTimerDidFire:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = [(MSDaemon *)self hysteresisTimer];
  [v4 invalidate];

  [(MSDaemon *)self setHysteresisTimer:0];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ Hysteresis-stabilized idled.", (uint8_t *)&v5, 0xCu);
  }
  [(MSDaemon *)self setStabilizedIsBusy:0];
  [(MSDaemon *)self stabilizedDidIdle];
}

- (void)didUnidle
{
}

- (void)didIdle
{
}

- (void)_didChangeIdleBusyState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = [(MSDaemon *)self hysteresisTimer];
  v6 = v5;
  if (v3)
  {
    [v5 invalidate];

    [(MSDaemon *)self setHysteresisTimer:0];
    if (![(MSDaemon *)self stabilizedIsBusy])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v11 = self;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Hysteresis-stabilized unidled.", buf, 0xCu);
      }
      [(MSDaemon *)self setStabilizedIsBusy:1];
      [(MSDaemon *)self stabilizedDidUnidle];
    }
  }
  else
  {

    if (v6)
    {
      id v9 = [(MSDaemon *)self hysteresisTimer];
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
      [v9 setFireDate:v7];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__hysteresisTimerDidFire_ selector:0 userInfo:0 repeats:1.0];
      [(MSDaemon *)self setHysteresisTimer:v8];

      id v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      uint64_t v7 = [(MSDaemon *)self hysteresisTimer];
      [v9 addTimer:v7 forMode:*MEMORY[0x1E4F1C4B0]];
    }
  }
}

- (void)releaseUIBusy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MSDaemon_releaseUIBusy__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __25__MSDaemon_releaseUIBusy__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  int v12 = 0;
  v2 = [*(id *)(a1 + 32) idleCountQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __25__MSDaemon_releaseUIBusy__block_invoke_2;
  v10[3] = &unk_1E6C3D4E0;
  v10[4] = *(void *)(a1 + 32);
  v10[5] = &v15;
  v10[6] = v13;
  v10[7] = v11;
  dispatch_sync(v2, v10);

  if (*((_DWORD *)v16 + 6))
  {
    BOOL v3 = *(_DWORD **)(a1 + 32);
    if (!v3[4] && !v3[3]) {
      [v3 didIdle];
    }
  }
  v4 = MEMORY[0x1E4F14500];
  id v5 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(_DWORD *)(v7 + 12);
    LODWORD(v7) = *(_DWORD *)(v7 + 16);
    *(_DWORD *)buf = 138543874;
    v20 = v6;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 1024;
    int v24 = v7;
    id v9 = v6;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ Releasing UI busy count. Now busy = %d, UI busy = %d", buf, 0x18u);
  }
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
}

void *__25__MSDaemon_releaseUIBusy__block_invoke_2(void *result)
{
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 16))--;
  *(_DWORD *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  *(_DWORD *)(*(void *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  return result;
}

- (void)retainUIBusy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__MSDaemon_retainUIBusy__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __24__MSDaemon_retainUIBusy__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v2 = [*(id *)(a1 + 32) idleCountQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __24__MSDaemon_retainUIBusy__block_invoke_2;
  v9[3] = &unk_1E6C3D4E0;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  dispatch_sync(v2, v9);

  if (!*((_DWORD *)v19 + 6) && *((_DWORD *)v15 + 6) && !*((_DWORD *)v11 + 6)) {
    [*(id *)(a1 + 32) didUnidle];
  }
  BOOL v3 = MEMORY[0x1E4F14500];
  id v4 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(_DWORD *)(v6 + 12);
    LODWORD(v6) = *(_DWORD *)(v6 + 16);
    *(_DWORD *)buf = 138543874;
    __int16 v23 = v5;
    __int16 v24 = 1024;
    int v25 = v7;
    __int16 v26 = 1024;
    int v27 = v6;
    id v8 = v5;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ Retaining UI busy count. Now busy = %d, UI busy = %d", buf, 0x18u);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void *__24__MSDaemon_retainUIBusy__block_invoke_2(void *result)
{
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 16))++;
  *(_DWORD *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  *(_DWORD *)(*(void *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  return result;
}

- (BOOL)isBusy
{
  v2 = self;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(MSDaemon *)self idleCountQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__MSDaemon_isBusy__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __18__MSDaemon_isBusy__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 12) != 0;
  return result;
}

- (void)releaseBusy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MSDaemon_releaseBusy__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __23__MSDaemon_releaseBusy__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v2 = [*(id *)(a1 + 32) idleCountQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __23__MSDaemon_releaseBusy__block_invoke_2;
  v9[3] = &unk_1E6C3D4E0;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  dispatch_sync(v2, v9);

  if (*((_DWORD *)v19 + 6))
  {
    if (!*((_DWORD *)v15 + 6))
    {
      [*(id *)(a1 + 32) releasePowerAssertion];
      if (!*((_DWORD *)v11 + 6)) {
        [*(id *)(a1 + 32) didIdle];
      }
    }
  }
  BOOL v3 = MEMORY[0x1E4F14500];
  id v4 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(_DWORD *)(v6 + 12);
    LODWORD(v6) = *(_DWORD *)(v6 + 16);
    *(_DWORD *)buf = 138543874;
    __int16 v23 = v5;
    __int16 v24 = 1024;
    int v25 = v7;
    __int16 v26 = 1024;
    int v27 = v6;
    id v8 = v5;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ Releasing busy count. Now busy = %d, UI busy = %d", buf, 0x18u);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void *__23__MSDaemon_releaseBusy__block_invoke_2(void *result)
{
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 12))--;
  *(_DWORD *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  *(_DWORD *)(*(void *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  return result;
}

- (void)retainBusy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__MSDaemon_retainBusy__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __22__MSDaemon_retainBusy__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v2 = [*(id *)(a1 + 32) idleCountQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __22__MSDaemon_retainBusy__block_invoke_2;
  v9[3] = &unk_1E6C3D4E0;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  dispatch_sync(v2, v9);

  if (!*((_DWORD *)v19 + 6))
  {
    if (*((_DWORD *)v15 + 6))
    {
      [*(id *)(a1 + 32) retainPowerAssertion];
      if (!*((_DWORD *)v11 + 6)) {
        [*(id *)(a1 + 32) didUnidle];
      }
    }
  }
  BOOL v3 = MEMORY[0x1E4F14500];
  id v4 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(_DWORD *)(v6 + 12);
    LODWORD(v6) = *(_DWORD *)(v6 + 16);
    *(_DWORD *)buf = 138543874;
    __int16 v23 = v5;
    __int16 v24 = 1024;
    int v25 = v7;
    __int16 v26 = 1024;
    int v27 = v6;
    id v8 = v5;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ Retaining busy count. Now busy = %d, UI busy = %d", buf, 0x18u);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void *__22__MSDaemon_retainBusy__block_invoke_2(void *result)
{
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 12))++;
  *(_DWORD *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  *(_DWORD *)(*(void *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  return result;
}

- (MSDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDaemon;
  v2 = [(MSDaemon *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MSDaemon idle count queue", 0);
    idleCountQueue = v2->_idleCountQueue;
    v2->_idleCountQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end