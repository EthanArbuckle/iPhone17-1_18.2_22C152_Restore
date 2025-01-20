@interface MRUAudioAnalyzer
+ (id)audioAnalyzerForPID:(int)a3;
- (BOOL)isRunning;
- (MPCProcessAudioTap)tap;
- (MRUAudioAnalyzer)initWithPID:(int)a3;
- (MRUWaveformData)waveformData;
- (MRUWaveformSettings)settings;
- (NSHashTable)observers;
- (NSString)description;
- (OS_dispatch_queue)tapQueue;
- (float)sampleRate;
- (id)binSamples:(float *)a3 count:(int)a4;
- (int)pid;
- (int)refreshRate;
- (os_unfair_lock_s)lock;
- (void)addObserver:(id)a3;
- (void)computeFFTWithSamples:(float *)a3;
- (void)dealloc;
- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4;
- (void)processAudioTapDidStop;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setRefreshRate:(int)a3;
- (void)setSampleRate:(float)a3;
- (void)setSettings:(id)a3;
- (void)setTap:(id)a3;
- (void)setTapQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRUAudioAnalyzer

+ (id)audioAnalyzerForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (audioAnalyzerForPID__onceToken != -1) {
    dispatch_once(&audioAnalyzerForPID__onceToken, &__block_literal_global_21);
  }
  v5 = (void *)__MRUAudioAnalyzerByPID;
  v6 = [NSNumber numberWithInt:v3];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    v7 = [[MRUAudioAnalyzer alloc] initWithPID:v3];
    v8 = MCLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = a1;
      __int16 v14 = 1024;
      int v15 = v3;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "%@ Created audio analyzer for PID: %u - %@", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = (void *)__MRUAudioAnalyzerByPID;
    v10 = [NSNumber numberWithInt:v3];
    [v9 setObject:v7 forKey:v10];
  }

  return v7;
}

void __40__MRUAudioAnalyzer_audioAnalyzerForPID___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v1 = (void *)__MRUAudioAnalyzerByPID;
  __MRUAudioAnalyzerByPID = v0;
}

- (MRUAudioAnalyzer)initWithPID:(int)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MRUAudioAnalyzer;
  v4 = [(MRUAudioAnalyzer *)&v23 init];
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    uint64_t v6 = +[MRUWaveformSettings currentSettings];
    settings = v5->_settings;
    v5->_settings = (MRUWaveformSettings *)v6;

    v8 = +[MRUWaveformSettings currentSettings];
    [v8 samplingRefreshRate];
    v5->_refreshRate = (int)v9;

    v5->_sampleRate = 48000.0;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaControls.MRUAudioAnalyzer-tapQueue", 0);
    tapQueue = v5->_tapQueue;
    v5->_tapQueue = (OS_dispatch_queue *)v10;

    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v12;

    __int16 v14 = v5->_tapQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __32__MRUAudioAnalyzer_initWithPID___block_invoke;
    v20[3] = &unk_1E5F0E2E8;
    int v15 = v5;
    v21 = v15;
    int v22 = a3;
    dispatch_async(v14, v20);
    int v16 = (int)(ceilf(v5->_sampleRate / (float)v5->_refreshRate) * 0.5);
    *((_DWORD *)v15 + 2) = v16;
    unsigned int v17 = vcvtad_u64_f64(log2((double)v16));
    *((_DWORD *)v15 + 3) = v17;
    *((_DWORD *)v15 + 4) = 1 << v17;
    if (1 << v17 >= 0) {
      int v18 = 1 << v17;
    }
    else {
      int v18 = (1 << v17) + 1;
    }
    *((_DWORD *)v15 + 5) = v18 >> 1;
    *((float *)v15 + 6) = 2.0 / (float)(v18 >> 1);
    v15[4] = (float *)malloc_type_calloc((uint64_t)v18 >> 1, 4uLL, 0x100004052888210uLL);
    v15[5] = (float *)malloc_type_calloc(*((int *)v15 + 5), 4uLL, 0x100004052888210uLL);
    v15[7] = (float *)malloc_type_calloc(*((int *)v15 + 5), 4uLL, 0x100004052888210uLL);
    v15[6] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[8] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[9] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[10] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    v15[11] = (float *)malloc_type_calloc(*((int *)v15 + 4), 4uLL, 0x100004052888210uLL);
    vDSP_hann_window(v15[8], *((int *)v15 + 4), 2);
    v15[12] = (float *)vDSP_create_fftsetup(*((unsigned int *)v15 + 3), 0);
  }
  return v5;
}

void __32__MRUAudioAnalyzer_initWithPID___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F76ED0]);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 112)];
  uint64_t v4 = [v2 initWithPID:v3 refreshRate:v7 delegate:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v4;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isRunning) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p - PID=%u running=%@ observers=%lu>", v4, self, self->_pid, v5, -[NSHashTable count](self->_observers, "count")];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MCLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%@ Dealloc", buf, 0xCu);
  }

  free(self->_realBuffer);
  free(self->_imagBuffer);
  free(self->_transferBuffer);
  free(self->_magnitudes);
  free(self->_hannWindow);
  free(self->_leftSamples);
  free(self->_rightSamples);
  free(self->_mixed);
  vDSP_destroy_fftsetup(self->_fftSetup);
  v4.receiver = self;
  v4.super_class = (Class)MRUAudioAnalyzer;
  [(MRUAudioAnalyzer *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSHashTable *)self->_observers containsObject:v4])
  {
    [(NSHashTable *)self->_observers addObject:v4];
    uint64_t v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@ Registered observer: %@", (uint8_t *)&v6, 0x16u);
    }

    [(MRUAudioAnalyzer *)self start];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_observers removeObject:v4];
  uint64_t v5 = MCLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%@ Unregistered observer: %@", (uint8_t *)&v6, 0x16u);
  }

  if (![(NSHashTable *)self->_observers count]) {
    [(MRUAudioAnalyzer *)self stop];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_isRunning)
  {
    self->_isRunning = 1;
    uint64_t v3 = +[MRUFinishTaskAssertionManager sharedManager];
    [v3 releaseForTaskToken:self];

    id v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v8 = self;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%@ Starting audio analyzer", buf, 0xCu);
    }

    tapQueue = self->_tapQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__MRUAudioAnalyzer_start__block_invoke;
    block[3] = &unk_1E5F0D7F8;
    block[4] = self;
    dispatch_async(tapQueue, block);
  }
}

void __25__MRUAudioAnalyzer_start__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tap];
  [v1 start];
}

- (void)stop
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_isRunning)
  {
    self->_isRunning = 0;
    objc_initWeak(&location, self);
    uint64_t v3 = +[MRUFinishTaskAssertionManager sharedManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __24__MRUAudioAnalyzer_stop__block_invoke;
    v7[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v8, &location);
    [v3 acquireForTaskToken:self withReason:@"Stop audio tap" invalidationHandler:v7];

    id v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%@ Stopping audio analyzer", buf, 0xCu);
    }

    tapQueue = self->_tapQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__MRUAudioAnalyzer_stop__block_invoke_21;
    block[3] = &unk_1E5F0D7F8;
    block[4] = self;
    dispatch_async(tapQueue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __24__MRUAudioAnalyzer_stop__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = MCLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_ERROR, "%@ Task assertion invalidated before tap stopped.", (uint8_t *)&v4, 0xCu);
  }
}

void __24__MRUAudioAnalyzer_stop__block_invoke_21(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tap];
  [v1 stop];
}

- (id)binSamples:(float *)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = [MRUWaveformData alloc];
  *(float *)&double v8 = self->_sampleRate;
  uint64_t v9 = [(MRUWaveformData *)v7 initWithFFTSamples:a3 count:v4 sampleRate:self->_settings settings:v8];

  return v9;
}

- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4
{
  -[MRUAudioAnalyzer computeFFTWithSamples:](self, "computeFFTWithSamples:", a3, *(void *)&a4);
  id v5 = [(MRUAudioAnalyzer *)self binSamples:self->_magnitudes count:self->_complexCount];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__MRUAudioAnalyzer_processAudioTapDidReceiveAudioSamples_numberOfSamples___block_invoke;
  v7[3] = &unk_1E5F0D8E8;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __74__MRUAudioAnalyzer_processAudioTapDidReceiveAudioSamples_numberOfSamples___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) audioAnalyzer:*(void *)(a1 + 32) didUpdateWaveform:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)processAudioTapDidStop
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MRUAudioAnalyzer_processAudioTapDidStop__block_invoke;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42__MRUAudioAnalyzer_processAudioTapDidStop__block_invoke(uint64_t a1)
{
  id v2 = +[MRUFinishTaskAssertionManager sharedManager];
  [v2 releaseForTaskToken:*(void *)(a1 + 32)];
}

- (void)computeFFTWithSamples:(float *)a3
{
  uint64_t v3 = self;
  DSPSplitComplex v6 = *(DSPSplitComplex *)&self->_realBuffer;
  vDSP_vmul(a3, 1, self->_hannWindow, 1, self->_transferBuffer, 1, self->_bufferSizePowerOf2);
  transferBuffer = (const DSPComplex *)v3->_transferBuffer;
  vDSP_Length complexCount = v3->_complexCount;
  uint64_t v3 = (MRUAudioAnalyzer *)((char *)v3 + 20);
  vDSP_ctoz(transferBuffer, 2, &v6, 1, complexCount);
  vDSP_fft_zrip(*(FFTSetup *)((char *)&v3->_leftSamples + 4), &v6, 1, LODWORD(v3[-1]._tapQueue), 1);
  vDSP_zvmags(&v6, 1, *(float **)((char *)&v3->_realBuffer + 4), 1, SLODWORD(v3->super.isa));
  vvsqrtf(*(float **)((char *)&v3->_realBuffer + 4), *(const float **)((char *)&v3->_realBuffer + 4), (const int *)v3);
  vDSP_vsmul(*(const float **)((char *)&v3->_realBuffer + 4), 1, (const float *)&v3->super.isa + 1, *(float **)((char *)&v3->_realBuffer + 4), 1, SLODWORD(v3->super.isa));
}

- (int)pid
{
  return self->_pid;
}

- (MRUWaveformData)waveformData
{
  return self->_waveformData;
}

- (int)refreshRate
{
  return self->_refreshRate;
}

- (void)setRefreshRate:(int)a3
{
  self->_refreshRate = a3;
}

- (float)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(float)a3
{
  self->_sampleRate = a3;
}

- (MRUWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (MPCProcessAudioTap)tap
{
  return self->_tap;
}

- (void)setTap:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (OS_dispatch_queue)tapQueue
{
  return self->_tapQueue;
}

- (void)setTapQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_tap, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_waveformData, 0);
}

@end