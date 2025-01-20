@interface AFAudioPowerUpdater
- (AFAudioPowerProviding)provider;
- (AFAudioPowerUpdater)initWithProvider:(id)a3 queue:(id)a4 frequency:(int64_t)a5 delegate:(id)a6;
- (BOOL)_createSharedMemory;
- (float)_unsafeAveragePower;
- (float)_unsafePeakPower;
- (id)_createNewXPCWrapper;
- (id)_createSharedMemoryXPCObject;
- (int64_t)frequency;
- (void)_beginUpdate;
- (void)_createNewXPCWrapperWithCompletion:(id)a3;
- (void)_destroySharedMemory;
- (void)_endUpdate;
- (void)_getPowerWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_timerFired;
- (void)_updatePowerWithAveragePower:(float)a3 andPeakPower:(float)a4;
- (void)_writeSharedMemoryWithAveragePower:(float)a3 peakPower:(float)a4;
- (void)beginUpdate;
- (void)createNewXPCWrapperWithCompletion:(id)a3;
- (void)dealloc;
- (void)endUpdate;
- (void)getPowerWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation AFAudioPowerUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (AFAudioPowerProviding)provider
{
  return self->_provider;
}

- (float)_unsafePeakPower
{
  float v4 = 0.0;
  int v2 = [(AFAudioPowerProviding *)self->_provider getAveragePower:0 andPeakPower:&v4];
  float result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (float)_unsafeAveragePower
{
  float v4 = 0.0;
  int v2 = [(AFAudioPowerProviding *)self->_provider getAveragePower:&v4 andPeakPower:0];
  float result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (id)_createNewXPCWrapper
{
  int v2 = [(AFAudioPowerUpdater *)self _createSharedMemoryXPCObject];
  if (v2) {
    v3 = [[AFXPCWrapper alloc] initWithXPCObject:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)_createNewXPCWrapperWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(AFAudioPowerUpdater *)self _createNewXPCWrapper];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)_destroySharedMemory
{
  sharedMemory = self->_sharedMemory;
  if (sharedMemory)
  {
    munmap(sharedMemory, 8uLL);
    self->_sharedMemory = 0;
  }
}

- (void)_writeSharedMemoryWithAveragePower:(float)a3 peakPower:(float)a4
{
  sharedMemory = (float *)self->_sharedMemory;
  if (sharedMemory)
  {
    float *sharedMemory = a3;
    sharedMemory[1] = a4;
  }
}

- (id)_createSharedMemoryXPCObject
{
  [(AFAudioPowerUpdater *)self _createSharedMemory];
  sharedMemory = self->_sharedMemory;
  if (sharedMemory) {
    sharedMemory = xpc_shmem_create(sharedMemory, 8uLL);
  }
  return sharedMemory;
}

- (BOOL)_createSharedMemory
{
  sharedMemory = self->_sharedMemory;
  if (!sharedMemory)
  {
    self->_sharedMemory = mmap(0, 8uLL, 2, 4097, -1, 0);
    *(float *)&double v4 = self->_averagePower;
    *(float *)&double v5 = self->_peakPower;
    [(AFAudioPowerUpdater *)self _writeSharedMemoryWithAveragePower:v4 peakPower:v5];
    sharedMemory = self->_sharedMemory;
  }
  return sharedMemory != 0;
}

- (void)_invalidate
{
  [(AFAudioPowerUpdater *)self _endUpdate];
  [(AFAudioPowerUpdater *)self _destroySharedMemory];
  provider = self->_provider;
  self->_provider = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  *(void *)&self->_averagePower = 0;
}

- (void)_updatePowerWithAveragePower:(float)a3 andPeakPower:(float)a4
{
  self->_averagePower = a3;
  self->_peakPower = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    *(float *)&double v10 = a3;
    *(float *)&double v11 = a4;
    [v12 audioPowerUpdaterDidUpdate:self averagePower:v10 peakPower:v11];
  }
}

- (void)_getPowerWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(void, float, float))a3;
  uint64_t v11 = 0;
  if ([(AFAudioPowerProviding *)self->_provider getAveragePower:(char *)&v11 + 4 andPeakPower:&v11])
  {
    LODWORD(v5) = HIDWORD(v11);
    LODWORD(v6) = v11;
    [(AFAudioPowerUpdater *)self _updatePowerWithAveragePower:v5 andPeakPower:v6];
    LODWORD(v7) = HIDWORD(v11);
    LODWORD(v8) = v11;
    [(AFAudioPowerUpdater *)self _writeSharedMemoryWithAveragePower:v7 peakPower:v8];
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v9 = AFSiriLogContextSpeech;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    provider = self->_provider;
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFAudioPowerUpdater _getPowerWithCompletion:]";
    __int16 v14 = 2112;
    v15 = provider;
    _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get average power and peak power from audio power provider %@.", buf, 0x16u);
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v4) {
LABEL_6:
  }
    v4[2](v4, self->_averagePower, self->_peakPower);
LABEL_7:
}

- (void)_timerFired
{
}

- (void)_endUpdate
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    double v4 = self->_timer;
    self->_timer = 0;
  }
  provider = self->_provider;
  [(AFAudioPowerProviding *)provider didEndAccessPower];
}

- (void)_beginUpdate
{
  [(AFAudioPowerProviding *)self->_provider willBeginAccessPower];
  unint64_t v3 = self->_frequency - 1;
  if (v3 <= 2 && !self->_timer)
  {
    uint64_t v4 = qword_19D0E2668[v3];
    double v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, v4, 0);
    objc_initWeak(&location, self);
    double v7 = self->_timer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__AFAudioPowerUpdater__beginUpdate__block_invoke;
    v8[3] = &unk_1E592B978;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __35__AFAudioPowerUpdater__beginUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

- (void)createNewXPCWrapperWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__AFAudioPowerUpdater_createNewXPCWrapperWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __57__AFAudioPowerUpdater_createNewXPCWrapperWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createNewXPCWrapperWithCompletion:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AFAudioPowerUpdater_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__AFAudioPowerUpdater_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)endUpdate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AFAudioPowerUpdater_endUpdate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__AFAudioPowerUpdater_endUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endUpdate];
}

- (void)getPowerWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AFAudioPowerUpdater_getPowerWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __46__AFAudioPowerUpdater_getPowerWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPowerWithCompletion:*(void *)(a1 + 40)];
}

- (void)beginUpdate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AFAudioPowerUpdater_beginUpdate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__AFAudioPowerUpdater_beginUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginUpdate];
}

- (void)dealloc
{
  [(AFAudioPowerUpdater *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFAudioPowerUpdater;
  [(AFAudioPowerUpdater *)&v3 dealloc];
}

- (AFAudioPowerUpdater)initWithProvider:(id)a3 queue:(id)a4 frequency:(int64_t)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AFAudioPowerUpdater;
  __int16 v14 = [(AFAudioPowerUpdater *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_provider, a3);
    objc_storeStrong((id *)&v15->_queue, a4);
    v15->_frequency = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_sharedMemory = 0;
  }

  return v15;
}

@end