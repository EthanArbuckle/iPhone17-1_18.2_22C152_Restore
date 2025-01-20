@interface MPCAudioSpectrumAnalyzer
- (BOOL)_shouldAttachAudioTap;
- (MPCAudioSpectrumAnalyzer)initWithPlaybackEngine:(id)a3;
- (MPCAudioSpectrumAnalyzer)initWithPlaybackEngine:(id)a3 refreshRate:(id)a4;
- (MPCAudioSpectrumAnalyzer)selfRef;
- (MPCPlaybackEngine)playbackEngine;
- (MPCProcessAudioTap)processAudioTap;
- (NSMutableArray)observers;
- (NSNumber)refreshRate;
- (_MPCAudioSpectrumAnalyzerStorage)storage;
- (void)_analyzeAudioData:(void *)a3 numberOfFrames:(unsigned int)a4;
- (void)_analyzeSamples:(AudioBufferList *)a3 numberFrames:(int64_t)a4;
- (void)_createAudioTap;
- (void)_createProcessTap;
- (void)_createQueueTap;
- (void)_destroyAudioTap;
- (void)_destroyProcessTap;
- (void)_destroyQueueTap;
- (void)_prepareTap:(opaqueMTAudioProcessingTap *)a3 maxFrames:(int64_t)a4 processingFormat:(const AudioStreamBasicDescription *)a5;
- (void)_resetObservers;
- (void)configurePlayerItem:(id)a3;
- (void)dealloc;
- (void)engine:(id)a3 didChangeToState:(unint64_t)a4;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProcessAudioTap:(id)a3;
- (void)setSelfRef:(id)a3;
- (void)setStorage:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MPCAudioSpectrumAnalyzer

uint64_t __63__MPCAudioSpectrumAnalyzer_initWithPlaybackEngine_refreshRate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createAudioTap];
}

- (void)_createProcessTap
{
  v3 = [[MPCProcessAudioTap alloc] initWithRefreshRate:self->_refreshRate delegate:self];
  processAudioTap = self->_processAudioTap;
  self->_processAudioTap = v3;

  v5 = [_MPCAudioSpectrumAnalyzerStorage alloc];
  uint64_t v6 = [(MPCProcessAudioTap *)self->_processAudioTap numberOfFrames];
  *(float *)&double v7 = (float)[(MPCProcessAudioTap *)self->_processAudioTap sampleRate];
  v8 = [(_MPCAudioSpectrumAnalyzerStorage *)v5 initWithMaximumNumberOfFrames:v6 sampleRate:v7];
  [(MPCAudioSpectrumAnalyzer *)self setStorage:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  [WeakRetained addEngineObserver:self];
}

- (void)setStorage:(id)a3
{
}

- (void)_createAudioTap
{
  v3 = [MEMORY[0x263F12178] standardUserDefaults];
  int v4 = [v3 isProcessTapEnabled];

  if (v4)
  {
    [(MPCAudioSpectrumAnalyzer *)self _createProcessTap];
  }
  else
  {
    [(MPCAudioSpectrumAnalyzer *)self _createQueueTap];
  }
}

- (MPCAudioSpectrumAnalyzer)initWithPlaybackEngine:(id)a3 refreshRate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPCAudioSpectrumAnalyzer;
  v8 = [(MPCAudioSpectrumAnalyzer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    objc_storeStrong((id *)&v9->_refreshRate, a4);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__MPCAudioSpectrumAnalyzer_initWithPlaybackEngine_refreshRate___block_invoke;
    block[3] = &unk_2643C5FC8;
    v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v9;
}

- (MPCAudioSpectrumAnalyzer)initWithPlaybackEngine:(id)a3
{
  return [(MPCAudioSpectrumAnalyzer *)self initWithPlaybackEngine:a3 refreshRate:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_processAudioTap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_refreshRate, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (void)setSelfRef:(id)a3
{
}

- (MPCAudioSpectrumAnalyzer)selfRef
{
  return self->_selfRef;
}

- (void)setProcessAudioTap:(id)a3
{
}

- (MPCProcessAudioTap)processAudioTap
{
  return self->_processAudioTap;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (_MPCAudioSpectrumAnalyzerStorage)storage
{
  return self->_storage;
}

- (NSNumber)refreshRate
{
  return self->_refreshRate;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)_prepareTap:(opaqueMTAudioProcessingTap *)a3 maxFrames:(int64_t)a4 processingFormat:(const AudioStreamBasicDescription *)a5
{
  id v7 = self;
  objc_sync_enter(v7);
  id v16 = [(MPCAudioSpectrumAnalyzer *)v7 storage];
  objc_sync_exit(v7);

  float mSampleRate = a5->mSampleRate;
  [v16 sampleRate];
  float v10 = v9;
  if ([v16 maxNumberOfFrames] < a4 || vabds_f32(v10, mSampleRate) >= 0.00000011921)
  {
    v12 = [_MPCAudioSpectrumAnalyzerStorage alloc];
    *(float *)&double v13 = mSampleRate;
    uint64_t v14 = [(_MPCAudioSpectrumAnalyzerStorage *)v12 initWithMaximumNumberOfFrames:a4 sampleRate:v13];

    v15 = v7;
    objc_sync_enter(v15);
    [(MPCAudioSpectrumAnalyzer *)v15 setStorage:v14];
    objc_sync_exit(v15);

    v11 = (void *)v14;
  }
  else
  {
    v11 = v16;
  }
}

- (void)_analyzeAudioData:(void *)a3 numberOfFrames:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(MPCAudioSpectrumAnalyzer *)v6 observers];
  v8 = (void *)[v7 copy];

  float v9 = [(MPCAudioSpectrumAnalyzer *)v6 storage];
  objc_sync_exit(v6);

  if ([v8 count])
  {
    if ([v9 maxNumberOfFrames] >= v4)
    {
      [v9 analyzeAudioData:a3 numberFrames:v4 observers:v8];
    }
    else
    {
      float v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134218240;
        uint64_t v12 = v4;
        __int16 v13 = 2048;
        uint64_t v14 = [v9 maxNumberOfFrames];
        _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[AP] - Audio tap reported audio samples before we had an appropriately sized buffer (numberOfFrames:%ld storageBufferSize:%ld)", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)_analyzeSamples:(AudioBufferList *)a3 numberFrames:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(MPCAudioSpectrumAnalyzer *)v6 observers];
  v8 = (void *)[v7 copy];

  float v9 = [(MPCAudioSpectrumAnalyzer *)v6 storage];
  objc_sync_exit(v6);

  if ([v8 count])
  {
    if ([v9 maxNumberOfFrames] >= a4)
    {
      [v9 analyzeFrequencies:a3 numberFrames:a4 observers:v8];
    }
    else
    {
      float v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134218240;
        int64_t v12 = a4;
        __int16 v13 = 2048;
        uint64_t v14 = [v9 maxNumberOfFrames];
        _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[AP] - Audio tap reported audio buffer list samples before we had an appropriately sized buffer (numberOfFrames:%ld storageBufferSize:%ld)", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)_destroyQueueTap
{
  self->_audioProcessingTap = 0;
}

- (void)_destroyProcessTap
{
  processAudioTap = self->_processAudioTap;
  self->_processAudioTap = 0;
}

- (void)_destroyAudioTap
{
  if (self->_processAudioTap) {
    [(MPCAudioSpectrumAnalyzer *)self _destroyProcessTap];
  }
  if (self->_audioProcessingTap)
  {
    [(MPCAudioSpectrumAnalyzer *)self _destroyQueueTap];
  }
}

- (void)_createQueueTap
{
  if (!MTMultitrackAudioProcessingTapCreate())
  {
    objc_storeStrong((id *)&self->_selfRef, self);
    self->_audioProcessingTap = 0;
  }
}

- (BOOL)_shouldAttachAudioTap
{
  v2 = [MEMORY[0x263F11D28] systemRoute];
  char v3 = [v2 isDeviceRoute];
  char v4 = v3 & ([v2 isAirPlayingToDevice] ^ 1);

  return v4;
}

- (void)_resetObservers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_observers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "beginReport", (void)v8);
        [v7 finishReport];
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_observers removeObject:v6];
  if (![(NSMutableArray *)v4->_observers count])
  {
    uint64_t v5 = [(MPCAudioSpectrumAnalyzer *)v4 processAudioTap];
    [v5 stop];
  }
  objc_sync_exit(v4);
}

- (void)registerObserver:(id)a3
{
  id v10 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = v10;
  observers = v4->_observers;
  if (!observers)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    long long v8 = v4->_observers;
    v4->_observers = (NSMutableArray *)v7;

    observers = v4->_observers;
    id v5 = v10;
  }
  [(NSMutableArray *)observers addObject:v5];
  long long v9 = [(MPCAudioSpectrumAnalyzer *)v4 processAudioTap];
  [v9 start];

  objc_sync_exit(v4);
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  id v10 = a3;
  if (a4 == 1)
  {
    id v6 = [(MPCAudioSpectrumAnalyzer *)self observers];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      long long v8 = [(MPCAudioSpectrumAnalyzer *)self processAudioTap];
      [v8 start];
    }
  }
  else if (a4 - 2 <= 2)
  {
    long long v9 = [(MPCAudioSpectrumAnalyzer *)self processAudioTap];
    [v9 stop];

    [(MPCAudioSpectrumAnalyzer *)self _resetObservers];
  }
}

- (void)configurePlayerItem:(id)a3
{
  id v4 = a3;
  if ([(MPCAudioSpectrumAnalyzer *)self _shouldAttachAudioTap]) {
    [v4 setAudioTapProcessor:self->_audioProcessingTap];
  }
}

- (void)dealloc
{
  [(MPCAudioSpectrumAnalyzer *)self setStorage:0];
  [(MPCAudioSpectrumAnalyzer *)self _destroyAudioTap];
  v3.receiver = self;
  v3.super_class = (Class)MPCAudioSpectrumAnalyzer;
  [(MPCAudioSpectrumAnalyzer *)&v3 dealloc];
}

@end