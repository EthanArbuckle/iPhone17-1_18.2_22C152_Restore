@interface AXMDataSonifier
+ (id)sharedInstance;
- (AVAudioEngine)engine;
- (AVAudioEnvironmentNode)stereoPanner;
- (AVAudioPlayerNode)player;
- (AVAudioSourceNode)audioSourceNode;
- (AVAudioUnitEQ)lowpassFilter;
- (AVAudioUnitEffect)compressor;
- (AVAudioUnitEffect)limiter;
- (AVAudioUnitTimePitch)pitchShifter;
- (AXMAudioDataSource)liveContinuousAudioDataSource;
- (AXMAudioDataSource)playbackChartDataAudioDataSource;
- (AXMAudioDataSource)playbackTrendlineAudioDataSource;
- (AXMAudioDataSource)scrubbingContinuousAudioDataSource;
- (AXMAudioDataSource)scrubbingDiscreteAudioDataSource;
- (AXMAudioDataSource)scrubbingTrendlineAudioDataSource;
- (AXMAudioDataSourceMixer)liveContinuousMixerDataSource;
- (AXMAudioDataSourceMixer)playbackMixerDataSource;
- (AXMAudioDataSourceMixer)scrubbingMixerDataSource;
- (AXMChartDescriptor)currentChartDescriptor;
- (AXMDataSeriesDescriptor)currentSeries;
- (AXMDataSonifier)init;
- (AXMLiveContinuousSynth)continuousScrubbingTone;
- (AXMLiveContinuousSynth)liveContinuousDataTone;
- (AXMLiveContinuousSynth)trendlineScrubbingTone;
- (AudioStreamBasicDescription)_audioFormat;
- (BOOL)containsMultipleSeries;
- (BOOL)isEndingScrubbing;
- (BOOL)isInLiveContinuousToneSession;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)isScrubbing;
- (BOOL)needsRenderSonification;
- (BOOL)playAudioPlayer;
- (BOOL)series:(id)a3 hasContinuousPitchDataForTimePosition:(double)a4;
- (BOOL)shouldIncrementToPitch:(double)a3 by:(double)a4;
- (BOOL)shouldPlayInStereo;
- (BOOL)usesBinauralPanning;
- (NSArray)keyPitches;
- (NSMutableOrderedSet)dataCategories;
- (NSPointerArray)playbackObservers;
- (NSTimer)keyPitchUpdateTimer;
- (NSTimer)playbackObserverUpdateTimer;
- (double)_centsForFrequency:(double)a3;
- (double)_normalizedKeyPitchForFrequency:(double)a3;
- (double)currentContinuousPlaybackPosition;
- (double)currentDiscretePlaybackPosition;
- (double)currentPlaybackPosition;
- (double)currentPlaybackTime;
- (double)durationForDurationEncodingValue:(double)a3;
- (double)frequencyForPitchEncodingValue:(double)a3;
- (double)interpolatedPitchValueForNormalizedTimePosition:(double)a3 inSeries:(id)a4;
- (double)masterVolume;
- (double)maximumDiscreteToneLength;
- (double)maximumPlaybackFrequency;
- (double)maximumToneVolume;
- (double)minimumDiscreteToneLength;
- (double)minimumPlaybackFrequency;
- (double)minimumToneVolume;
- (double)normalizedTimeEncodingValueForValue:(id)a3;
- (double)normalizedValueForValue:(double)a3 min:(double)a4 max:(double)a5;
- (double)playbackDuration;
- (double)timeOffsetForTimeEncodingValue:(id)a3;
- (double)valueFromNormalizedValue:(double)a3 min:(double)a4 max:(double)a5;
- (double)volumeForVolumeEncodingValue:(double)a3;
- (float)lowpassCutoff;
- (id)_keyPitchesForContinuousSeries:(id)a3;
- (id)_newContinuousToneEnvelope;
- (id)function;
- (id)keyPitchForTime:(double)a3;
- (id)trendlineFunction;
- (int)dataMode;
- (int)interpolationMode;
- (int64_t)currentSeriesIndex;
- (unint64_t)playbackSampleCount;
- (unint64_t)sampleIndexForTimeOffset:(double)a3;
- (void)_initializeAXMAudioDataSources;
- (void)_initializeAudioChain;
- (void)_initializeAudioPlayerNode;
- (void)_initializeAudioSourceNode;
- (void)_initializeCompressor;
- (void)_initializeLimiter;
- (void)_initializeLiveToneDataSource;
- (void)_initializeLowpassFilter;
- (void)_initializePitchShifter;
- (void)_initializeStereoPanner;
- (void)_peakNormalizeBuffer:(void *)a3 length:(unint64_t)a4 level:(double)a5;
- (void)_regenerateTimeEncodingValuesForDataPoints;
- (void)_renderContinuousAudioForMultiSeries:(id)a3;
- (void)_renderDiscreteAudioForSeries:(id)a3;
- (void)_renderSeries:(id)a3;
- (void)_setPanning:(float)a3;
- (void)_setupMultiSeriesAudioChain;
- (void)_setupSingleSeriesAudioChain;
- (void)addPlaybackObserver:(id)a3;
- (void)beginContinuousPlayback;
- (void)beginLiveContinuousToneSession;
- (void)beginScrubbing;
- (void)dealloc;
- (void)endLiveContinuousToneSession;
- (void)endScrubbing;
- (void)liveTonePlaybackCallbackRenderingContext;
- (void)pause;
- (void)play;
- (void)playFrequencyAtTime:(double)a3;
- (void)removePlaybackObserver:(id)a3;
- (void)renderSonification;
- (void)scrubToPlaybackFrame:(unint64_t)a3;
- (void)scrubbingDiscreteDataRenderingContext;
- (void)scrubbingPlaybackCallbackRenderingContext;
- (void)setAudioSourceNode:(id)a3;
- (void)setCompressor:(id)a3;
- (void)setContinuousPlaybackPosition:(double)a3;
- (void)setCurrentChartDescriptor:(id)a3;
- (void)setCurrentPlaybackTime:(double)a3;
- (void)setCurrentSeriesIndex:(int64_t)a3;
- (void)setDiscretePlaybackPosition:(double)a3;
- (void)setEngine:(id)a3;
- (void)setKeyPitchUpdateTimer:(id)a3;
- (void)setKeyPitches:(id)a3;
- (void)setLimiter:(id)a3;
- (void)setLiveContinuousAudioDataSource:(id)a3;
- (void)setLiveContinuousMixerDataSource:(id)a3;
- (void)setLiveContinuousToneNormalizedFrequency:(double)a3;
- (void)setLowpassCutoff:(float)a3;
- (void)setLowpassFilter:(id)a3;
- (void)setMasterVolume:(double)a3;
- (void)setMasterVolume:(double)a3 fadeDuration:(double)a4;
- (void)setMaximumDiscreteToneLength:(double)a3;
- (void)setMaximumPlaybackFrequency:(double)a3;
- (void)setMaximumToneVolume:(double)a3;
- (void)setMinimumDiscreteToneLength:(double)a3;
- (void)setMinimumPlaybackFrequency:(double)a3;
- (void)setMinimumToneVolume:(double)a3;
- (void)setNeedsRenderSonification:(BOOL)a3;
- (void)setPitchShifter:(id)a3;
- (void)setPlaybackChartDataAudioDataSource:(id)a3;
- (void)setPlaybackDuration:(double)a3;
- (void)setPlaybackMixerDataSource:(id)a3;
- (void)setPlaybackObserverUpdateTimer:(id)a3;
- (void)setPlaybackObservers:(id)a3;
- (void)setPlaybackPosition:(double)a3;
- (void)setPlaybackTrendlineAudioDataSource:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setScrubbingContinuousAudioDataSource:(id)a3;
- (void)setScrubbingDiscreteAudioDataSource:(id)a3;
- (void)setScrubbingMixerDataSource:(id)a3;
- (void)setScrubbingTrendlineAudioDataSource:(id)a3;
- (void)setStereoPanner:(id)a3;
- (void)setTrendlineFunction:(id)a3;
- (void)setUsesBinauralPanning:(BOOL)a3;
- (void)stopPlaying;
- (void)stopScrubbing;
@end

@implementation AXMDataSonifier

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AXMDataSonifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AXMDataSonifier sharedInstance]::onceToken != -1) {
    dispatch_once(&+[AXMDataSonifier sharedInstance]::onceToken, block);
  }
  v2 = (void *)+[AXMDataSonifier sharedInstance]::singleton;

  return v2;
}

void __33__AXMDataSonifier_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[AXMDataSonifier sharedInstance]::singleton;
  +[AXMDataSonifier sharedInstance]::singleton = (uint64_t)v1;
}

- (AXMDataSonifier)init
{
  v25.receiver = self;
  v25.super_class = (Class)AXMDataSonifier;
  v2 = [(AXMDataSonifier *)&v25 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_minimumPlaybackFrequency = xmmword_1B58ACED0;
    v2->_usesBinauralPanning = 1;
    uint64_t v4 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    playbackObservers = v3->_playbackObservers;
    v3->_playbackObservers = (NSPointerArray *)v4;

    v6 = [[AXMAudioDataSourceMixer alloc] initWithName:@"PlaybackMixer" sampleRate:0 circular:44100.0];
    playbackMixerDataSource = v3->_playbackMixerDataSource;
    v3->_playbackMixerDataSource = v6;

    v8 = [[AXMAudioDataSource alloc] initWithName:@"PlaybackChartData" sampleRate:0 circular:44100.0];
    playbackChartDataAudioDataSource = v3->_playbackChartDataAudioDataSource;
    v3->_playbackChartDataAudioDataSource = v8;

    v10 = [[AXMAudioDataSource alloc] initWithName:@"PlaybackTrendline" sampleRate:0 circular:44100.0];
    playbackTrendlineAudioDataSource = v3->_playbackTrendlineAudioDataSource;
    v3->_playbackTrendlineAudioDataSource = v10;

    [(AXMAudioDataSourceMixer *)v3->_playbackMixerDataSource addDataSource:v3->_playbackChartDataAudioDataSource];
    v12 = [[AXMAudioDataSourceMixer alloc] initWithName:@"ScrubbingMixer" sampleRate:1 circular:44100.0];
    scrubbingMixerDataSource = v3->_scrubbingMixerDataSource;
    v3->_scrubbingMixerDataSource = v12;

    v14 = [[AXMAudioDataSource alloc] initWithName:@"ScrubbingDiscreteData" sampleRate:1 circular:44100.0];
    scrubbingDiscreteAudioDataSource = v3->_scrubbingDiscreteAudioDataSource;
    v3->_scrubbingDiscreteAudioDataSource = v14;

    v16 = [[AXMAudioDataSource alloc] initWithName:@"ScrubbingContinuousData" sampleRate:1 circular:44100.0];
    scrubbingContinuousAudioDataSource = v3->_scrubbingContinuousAudioDataSource;
    v3->_scrubbingContinuousAudioDataSource = v16;

    v18 = [[AXMAudioDataSource alloc] initWithName:@"ScrubbingTrendline" sampleRate:1 circular:44100.0];
    scrubbingTrendlineAudioDataSource = v3->_scrubbingTrendlineAudioDataSource;
    v3->_scrubbingTrendlineAudioDataSource = v18;

    [(AXMAudioDataSourceMixer *)v3->_scrubbingMixerDataSource addDataSource:v3->_scrubbingContinuousAudioDataSource];
    v20 = [[AXMAudioDataSourceMixer alloc] initWithName:@"LiveToneMixer" sampleRate:1 circular:44100.0];
    liveContinuousMixerDataSource = v3->_liveContinuousMixerDataSource;
    v3->_liveContinuousMixerDataSource = v20;

    v22 = [[AXMAudioDataSource alloc] initWithName:@"LiveContinuousData" sampleRate:1 circular:44100.0];
    liveContinuousAudioDataSource = v3->_liveContinuousAudioDataSource;
    v3->_liveContinuousAudioDataSource = v22;

    [(AXMAudioDataSourceMixer *)v3->_liveContinuousMixerDataSource addDataSource:v3->_liveContinuousAudioDataSource];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  scrubbingDiscreteDataRenderingContext = (void **)self->_scrubbingDiscreteDataRenderingContext;
  if (scrubbingDiscreteDataRenderingContext)
  {
    uint64_t v4 = *scrubbingDiscreteDataRenderingContext;
    if (*scrubbingDiscreteDataRenderingContext)
    {
      scrubbingDiscreteDataRenderingContext[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9A0B70](scrubbingDiscreteDataRenderingContext, 0x10C402FEFCB83);
  }
  scrubbingPlaybackCallbackRenderingContext = (void **)self->_scrubbingPlaybackCallbackRenderingContext;
  if (scrubbingPlaybackCallbackRenderingContext)
  {
    v6 = *scrubbingPlaybackCallbackRenderingContext;
    if (*scrubbingPlaybackCallbackRenderingContext)
    {
      scrubbingPlaybackCallbackRenderingContext[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x1BA9A0B70](scrubbingPlaybackCallbackRenderingContext, 0x10C402FEFCB83);
  }
  liveTonePlaybackCallbackRenderingContext = (void **)self->_liveTonePlaybackCallbackRenderingContext;
  if (liveTonePlaybackCallbackRenderingContext)
  {
    v8 = *liveTonePlaybackCallbackRenderingContext;
    if (*liveTonePlaybackCallbackRenderingContext)
    {
      liveTonePlaybackCallbackRenderingContext[1] = v8;
      operator delete(v8);
    }
    MEMORY[0x1BA9A0B70](liveTonePlaybackCallbackRenderingContext, 0x10C402FEFCB83);
  }
  v9.receiver = self;
  v9.super_class = (Class)AXMDataSonifier;
  [(AXMDataSonifier *)&v9 dealloc];
}

- (void)_initializeAXMAudioDataSources
{
  [(AXMDataSonifier *)self stopPlaying];
  [(AXMDataSonifier *)self playbackDuration];
  self->_playbackSampleCount = (unint64_t)((v3 + 200.0) * 44100.0 / 1000.0);
  uint64_t v4 = [(AXMDataSonifier *)self playbackMixerDataSource];
  objc_msgSend(v4, "setLength:", -[AXMDataSonifier playbackSampleCount](self, "playbackSampleCount"));

  v5 = [(AXMDataSonifier *)self playbackChartDataAudioDataSource];
  objc_msgSend(v5, "setLength:", -[AXMDataSonifier playbackSampleCount](self, "playbackSampleCount"));

  v6 = [(AXMDataSonifier *)self playbackTrendlineAudioDataSource];
  objc_msgSend(v6, "setLength:", -[AXMDataSonifier playbackSampleCount](self, "playbackSampleCount"));

  v7 = [(AXMDataSonifier *)self scrubbingMixerDataSource];
  [v7 setLength:88200];

  v8 = [(AXMDataSonifier *)self scrubbingDiscreteAudioDataSource];
  [v8 setLength:88200];

  objc_super v9 = [(AXMDataSonifier *)self scrubbingContinuousAudioDataSource];
  [v9 setLength:88200];

  v10 = [(AXMDataSonifier *)self scrubbingTrendlineAudioDataSource];
  [v10 setLength:88200];

  v11 = [(AXMDataSonifier *)self scrubbingDiscreteDataRenderingContext];
  v11[1] = *v11;
  std::vector<int>::resize((std::vector<int> *)[(AXMDataSonifier *)self scrubbingDiscreteDataRenderingContext], 0x15888uLL);
  v12 = *(void **)[(AXMDataSonifier *)self scrubbingDiscreteDataRenderingContext];
  uint64_t v13 = *(void *)([(AXMDataSonifier *)self scrubbingDiscreteDataRenderingContext]+ 8)- (void)v12;
  if (v13 >= 1)
  {
    bzero(v12, 4 * (((unint64_t)v13 >> 2) - ((unint64_t)v13 > 3)) + 4);
  }
}

- (void)_initializeLiveToneDataSource
{
  [(AXMDataSonifier *)self stopPlaying];
  id v3 = [(AXMDataSonifier *)self liveContinuousMixerDataSource];
  [v3 setLength:88200];

  id v4 = [(AXMDataSonifier *)self liveContinuousAudioDataSource];
  [v4 setLength:88200];
}

- (double)currentPlaybackPosition
{
  id v3 = [(AXMDataSonifier *)self currentSeries];
  if ([v3 isContinuous]) {
    [(AXMDataSonifier *)self currentContinuousPlaybackPosition];
  }
  else {
    [(AXMDataSonifier *)self currentDiscretePlaybackPosition];
  }
  double v5 = v4;

  return v5;
}

- (double)currentDiscretePlaybackPosition
{
  id v3 = [(AXMDataSonifier *)self playbackMixerDataSource];
  unint64_t v4 = [v3 length];

  double v5 = [(AXMDataSonifier *)self playbackMixerDataSource];
  unint64_t v6 = [v5 currentSampleIndex];

  double v7 = 0.0;
  if (v4 && v6 <= v4)
  {
    v8 = [(AXMDataSonifier *)self playbackMixerDataSource];
    double v7 = (double)(unint64_t)[v8 currentSampleIndex] / (double)v4;
  }
  return v7;
}

- (double)currentContinuousPlaybackPosition
{
  double currentPlaybackTime = self->_currentPlaybackTime;
  double audiographPlaybackDuration = self->audiographPlaybackDuration;
  BOOL v4 = audiographPlaybackDuration <= 0.0 || currentPlaybackTime > audiographPlaybackDuration;
  double result = currentPlaybackTime / audiographPlaybackDuration;
  if (v4) {
    return 0.0;
  }
  return result;
}

- (void)setMasterVolume:(double)a3
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  double v4 = fmax(a3, 0.0);
  id v6 = [(AXMDataSonifier *)self playbackMixerDataSource];
  [v6 setLevel:v4];

  id v7 = [(AXMDataSonifier *)self scrubbingMixerDataSource];
  [v7 setLevel:v4];

  id v8 = [(AXMDataSonifier *)self liveContinuousMixerDataSource];
  [v8 setLevel:v4];

  id v9 = [(AXMDataSonifier *)self player];
  *(float *)&double v4 = v4;
  LODWORD(v5) = LODWORD(v4);
  [v9 setVolume:v5];
}

- (double)masterVolume
{
  v2 = [(AXMDataSonifier *)self playbackMixerDataSource];
  [v2 level];
  double v4 = v3;

  return v4;
}

- (void)setMasterVolume:(double)a3 fadeDuration:(double)a4
{
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeDuration = *(void *)&a4;
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeStart = CFAbsoluteTimeGetCurrent();
  [(AXMDataSonifier *)self masterVolume];
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::startVolume = v6;
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::targetVolume = *(void *)&a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__AXMDataSonifier_setMasterVolume_fadeDuration___block_invoke;
  v9[3] = &unk_1E6118330;
  v9[4] = self;
  uint64_t v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v9 block:0.0];
  id v8 = (void *)-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer;
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer = v7;
}

void __48__AXMDataSonifier_setMasterVolume_fadeDuration___block_invoke(uint64_t a1)
{
  double v2 = (CFAbsoluteTimeGetCurrent() - *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeStart)
     / *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeDuration;
  if (v2 < 1.0) {
    double v2 = 1.0;
  }
  double v3 = *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::startVolume
     + (*(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::targetVolume
      - *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::startVolume)
     * v2;
  [*(id *)(a1 + 32) setMasterVolume:v3];
  if (v3 == *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::targetVolume)
  {
    [(id)-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer invalidate];
    double v4 = (void *)-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer;
    -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer = 0;
  }
}

- (void)play
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(AXMDataSonifier *)self isPlaying])
  {
    if (self->_needsRenderSonification) {
      [(AXMDataSonifier *)self renderSonification];
    }
    [(AXMDataSonifier *)self _initializeAudioChain];
    self->_playing = 1;
    engine = self->_engine;
    id v38 = 0;
    BOOL v4 = [(AVAudioEngine *)engine startAndReturnError:&v38];
    id v5 = v38;
    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v4;
    }
    if (!v6)
    {
      uint64_t v7 = AXMediaLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEFAULT, "failed to start audio engine", buf, 2u);
      }

      if (v5)
      {
        id v8 = AXMediaLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_DEFAULT, "failed to render audio buffer", buf, 2u);
        }
      }
    }
    id v9 = [(AXMDataSonifier *)self currentSeries];
    if ([v9 isContinuous]
      && ![(AXMDataSonifier *)self containsMultipleSeries])
    {
      BOOL v24 = [(AXMDataSonifier *)self playAudioPlayer];

      if (v24) {
        [(AXMDataSonifier *)self beginContinuousPlayback];
      }
    }
    else
    {
    }
    if ([(AXMDataSonifier *)self isPaused])
    {
      long long v31 = 0uLL;
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      long long v28 = 0uLL;
      v10 = [(AXMDataSonifier *)self playbackObservers];
      v11 = [v10 allObjects];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v39 count:16];
      if (v12)
      {
        id v25 = v5;
        uint64_t v13 = *(void *)v29;
        v14 = MEMORY[0x1E4F14428];
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __23__AXMDataSonifier_play__block_invoke_2;
              block[3] = &unk_1E6118358;
              block[4] = v16;
              void block[5] = self;
              dispatch_async(v14, block);
              self->_paused = 0;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v39 count:16];
        }
        while (v12);
LABEL_37:
        id v5 = v25;
      }
    }
    else
    {
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      v17 = [(AXMDataSonifier *)self playbackObservers];
      v11 = [v17 allObjects];

      uint64_t v18 = [v11 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v18)
      {
        id v25 = v5;
        uint64_t v19 = *(void *)v34;
        v20 = MEMORY[0x1E4F14428];
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v11);
            }
            uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * j);
            if (objc_opt_respondsToSelector())
            {
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __23__AXMDataSonifier_play__block_invoke;
              v32[3] = &unk_1E6118358;
              v32[4] = v22;
              v32[5] = self;
              dispatch_async(v20, v32);
            }
          }
          uint64_t v18 = [v11 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v18);
        goto LABEL_37;
      }
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __23__AXMDataSonifier_play__block_invoke_3;
    v26[3] = &unk_1E6118330;
    v26[4] = self;
    v23 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v26 block:0.0];
    [(AXMDataSonifier *)self setPlaybackObserverUpdateTimer:v23];
  }
}

uint64_t __23__AXMDataSonifier_play__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) currentPlaybackPosition];

  return objc_msgSend(v1, "dataSonifierPlaybackDidBeginAtPosition:");
}

uint64_t __23__AXMDataSonifier_play__block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) currentPlaybackPosition];

  return objc_msgSend(v1, "dataSonifierPlaybackDidResumeAtPosition:");
}

void __23__AXMDataSonifier_play__block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = [*(id *)(a1 + 32) playbackObservers];
  double v3 = [v2 allObjects];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    BOOL v6 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __23__AXMDataSonifier_play__block_invoke_4;
          v10[3] = &unk_1E6118358;
          uint64_t v9 = *(void *)(a1 + 32);
          v10[4] = v8;
          v10[5] = v9;
          dispatch_async(v6, v10);
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __23__AXMDataSonifier_play__block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) currentPlaybackPosition];
  double v3 = v2 * 1000.0;

  return [v1 dataSonifierPlaybackProgressDidChange:v3];
}

- (void)pause
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(AVAudioEngine *)self->_engine pause];
  *(_WORD *)&self->_playing = 256;
  double v3 = [(AXMDataSonifier *)self playbackObserverUpdateTimer];
  [v3 invalidate];

  uint64_t v4 = [(AXMDataSonifier *)self keyPitchUpdateTimer];
  [v4 invalidate];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(AXMDataSonifier *)self playbackObservers];
  BOOL v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __24__AXMDataSonifier_pause__block_invoke;
          v12[3] = &unk_1E6118358;
          v12[4] = v11;
          v12[5] = self;
          dispatch_async(v9, v12);
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

uint64_t __24__AXMDataSonifier_pause__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) currentPlaybackPosition];

  return objc_msgSend(v1, "dataSonifierPlaybackDidPauseAtPosition:");
}

- (void)stopPlaying
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVAudioEngine *)self->_engine stop];
  [(AVAudioPlayerNode *)self->_player stop];
  BOOL playing = self->_playing;
  *(_WORD *)&self->_BOOL playing = 0;
  if (playing)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [(AXMDataSonifier *)self playbackObservers];
    uint64_t v5 = [v4 allObjects];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      uint64_t v8 = MEMORY[0x1E4F14428];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __30__AXMDataSonifier_stopPlaying__block_invoke;
            block[3] = &unk_1E6118358;
            block[4] = v10;
            void block[5] = self;
            dispatch_async(v8, block);
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    uint64_t v11 = [(AXMDataSonifier *)self playbackObserverUpdateTimer];
    [v11 invalidate];
  }
  else
  {
    uint64_t v11 = AXMediaLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_DEFAULT, "Error stopping audio playback", v13, 2u);
    }
  }

  long long v12 = [(AXMDataSonifier *)self playbackMixerDataSource];
  [v12 setCurrentSampleIndex:0];
}

uint64_t __30__AXMDataSonifier_stopPlaying__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) currentPlaybackPosition];

  return objc_msgSend(v1, "dataSonifierPlaybackDidEndAtPosition:");
}

- (BOOL)shouldPlayInStereo
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(AXMDataSonifier *)self usesBinauralPanning]) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v2 = objc_msgSend(MEMORY[0x1E4F153E0], "sharedInstance", 0);
  double v3 = [v2 currentRoute];
  uint64_t v4 = [v3 outputs];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = (void *)*MEMORY[0x1E4F15138];
    uint64_t v8 = (void *)*MEMORY[0x1E4F150C0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 portType];
        if (v11 == v7)
        {

LABEL_15:
          BOOL v14 = 1;
          goto LABEL_16;
        }
        long long v12 = [v10 portType];
        BOOL v13 = v12 == v8;

        if (v13) {
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_16:

  return v14;
}

- (void)beginContinuousPlayback
{
  if ([(NSArray *)self->_keyPitches count])
  {
    objc_initWeak(&location, self);
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    BOOL v24 = __Block_byref_object_copy__8;
    id v25 = __Block_byref_object_dispose__8;
    id v26 = (id)[(NSArray *)self->_keyPitches mutableCopy];
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__8;
    long long v19 = __Block_byref_object_dispose__8;
    id v20 = [(id)v22[5] firstObject];
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    pitchShifter = self->_pitchShifter;
    [(id)v16[5] frequency];
    -[AXMDataSonifier _centsForFrequency:](self, "_centsForFrequency:");
    *(float *)&double v4 = v4;
    [(AVAudioUnitTimePitch *)pitchShifter setPitch:v4];
    CFTimeInterval v5 = CACurrentMediaTime();
    uint64_t v6 = [(NSArray *)self->_keyPitches lastObject];
    [v6 timeOffsetMS];
    double v8 = v7;

    [(NSTimer *)self->_keyPitchUpdateTimer invalidate];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB00];
    v12[1] = 3221225472;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[2] = __42__AXMDataSonifier_beginContinuousPlayback__block_invoke;
    v12[3] = &unk_1E6118380;
    v12[4] = &v21;
    objc_copyWeak(v13, &location);
    v13[1] = *(id *)&v5;
    *(double *)&v13[2] = v8 / 1000.0;
    v12[5] = &v15;
    void v12[6] = v14;
    uint64_t v10 = [v9 scheduledTimerWithTimeInterval:1 repeats:v12 block:0.0];
    keyPitchUpdateTimer = self->_keyPitchUpdateTimer;
    self->_keyPitchUpdateTimer = v10;

    objc_destroyWeak(v13);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AXMDataSonifier *)self stopPlaying];
  }
}

void __42__AXMDataSonifier_beginContinuousPlayback__block_invoke(uint64_t a1, void *a2)
{
  id v48 = a2;
  if (![*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count])
  {
    [v48 invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained stopPlaying];
    goto LABEL_6;
  }
  CFTimeInterval v3 = CACurrentMediaTime() - *(double *)(a1 + 64);
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  [v4 setCurrentPlaybackTime:v3];

  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  [v5 currentPlaybackTime];
  double v7 = v6;
  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = [v8 playbackMixerDataSource];
  [v9 setCurrentSampleIndex:(unint64_t)v7];

  CFTimeInterval v10 = v3 / *(double *)(a1 + 72) * 2.0 + -1.0;
  id v11 = objc_loadWeakRetained((id *)(a1 + 56));
  *(float *)&double v12 = v10;
  [v11 _setPanning:v12];

  id v13 = objc_loadWeakRetained((id *)(a1 + 56));
  [v13 currentPlaybackTime];
  double v15 = v14;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeOffsetMS];
  double v17 = v16 / 1000.0;

  long long v18 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v15 <= v17)
  {
    if ((unint64_t)[v18 count] < 2) {
      goto LABEL_10;
    }
    id v39 = objc_loadWeakRetained((id *)(a1 + 56));
    v40 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:1];
    [v40 frequency];
    objc_msgSend(v39, "_centsForFrequency:");
    double v42 = v41;

    id v43 = objc_loadWeakRetained((id *)(a1 + 56));
    LODWORD(v40) = [v43 shouldIncrementToPitch:v42 by:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

    if (!v40) {
      goto LABEL_10;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v44 = [WeakRetained pitchShifter];
    uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
    [v44 pitch];
    double v47 = *(double *)(v45 + 24) + v46;
    *(float *)&double v47 = v47;
    [v44 setPitch:v47];

LABEL_6:
    goto LABEL_10;
  }
  [v18 removeObjectAtIndex:0];
  uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) firstObject];
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  id v22 = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) frequency];
  objc_msgSend(v22, "_centsForFrequency:");
  double v24 = v23;

  id v25 = objc_loadWeakRetained((id *)(a1 + 56));
  id v26 = [v25 pitchShifter];
  *(float *)&double v27 = v24;
  [v26 setPitch:v27];

  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] >= 2)
  {
    long long v28 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:1];
    [v28 timeOffsetMS];
    double v30 = v29;
    long long v31 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:0];
    [v31 timeOffsetMS];
    double v33 = v32;

    id v34 = objc_loadWeakRetained((id *)(a1 + 56));
    long long v35 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:1];
    [v35 frequency];
    objc_msgSend(v34, "_centsForFrequency:");
    double v37 = v36 - v24;

    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v37 / (v30 - v33);
  }
LABEL_10:
}

- (void)setPlaybackDuration:(double)a3
{
  self->_userDefinedPlaybackDuration = a3;
  [(AXMDataSonifier *)self _regenerateTimeEncodingValuesForDataPoints];
}

- (double)playbackDuration
{
  double userDefinedPlaybackDuration = self->_userDefinedPlaybackDuration;
  if (userDefinedPlaybackDuration <= 0.0)
  {
    id v4 = [(AXMDataSonifier *)self currentChartDescriptor];
    id v5 = [v4 xAxis];

    double v6 = [(AXMDataSonifier *)self currentSeries];
    int v7 = [v5 isCategoricalAxis];
    if (v6) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
    if (v8 == 1)
    {
      uint64_t v9 = [v6 dataPoints];
      double userDefinedPlaybackDuration = 10000.0;
      if ((double)(unint64_t)[v9 count] * 800.0 <= 10000.0)
      {
        CFTimeInterval v10 = [v6 dataPoints];
        double userDefinedPlaybackDuration = (double)(unint64_t)[v10 count] * 800.0;
      }
    }
    else
    {
      double userDefinedPlaybackDuration = 10000.0;
    }
  }
  return userDefinedPlaybackDuration;
}

- (void)addPlaybackObserver:(id)a3
{
  id v5 = a3;
  id v4 = [(AXMDataSonifier *)self playbackObservers];
  [v4 addPointer:v5];
}

- (void)removePlaybackObserver:(id)a3
{
  id v8 = a3;
  id v4 = [(AXMDataSonifier *)self playbackObservers];
  id v5 = [v4 allObjects];
  uint64_t v6 = [v5 indexOfObject:v8];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = [(AXMDataSonifier *)self playbackObservers];
    [v7 removePointerAtIndex:v6];
  }
}

- (void)setPlaybackPosition:(double)a3
{
  id v5 = [(AXMDataSonifier *)self currentSeries];
  if ([v5 isContinuous]) {
    [(AXMDataSonifier *)self setContinuousPlaybackPosition:a3];
  }
  else {
    [(AXMDataSonifier *)self setDiscretePlaybackPosition:a3];
  }
}

- (void)setDiscretePlaybackPosition:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    uint64_t v6 = [(AXMDataSonifier *)self playbackMixerDataSource];
    unint64_t v7 = (unint64_t)((double)(unint64_t)[v6 length] * a3);

    if ([(AXMDataSonifier *)self isScrubbing])
    {
      [(AXMDataSonifier *)self scrubToPlaybackFrame:v7];
    }
    else
    {
      id v8 = [(AXMDataSonifier *)self playbackMixerDataSource];
      [v8 setCurrentSampleIndex:v7];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = [(AXMDataSonifier *)self playbackObservers];
      CFTimeInterval v10 = [v9 allObjects];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v18;
        id v13 = MEMORY[0x1E4F14428];
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v16[0] = MEMORY[0x1E4F143A8];
              v16[1] = 3221225472;
              v16[2] = __47__AXMDataSonifier_setDiscretePlaybackPosition___block_invoke;
              v16[3] = &unk_1E61183A8;
              v16[4] = v15;
              *(double *)&v16[5] = a3;
              dispatch_async(v13, v16);
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }
    }
  }
}

uint64_t __47__AXMDataSonifier_setDiscretePlaybackPosition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataSonifierPlaybackProgressDidChange:*(double *)(a1 + 40)];
}

- (void)setContinuousPlaybackPosition:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    double v6 = self->audiographPlaybackDuration * a3;
    if ([(AXMDataSonifier *)self isScrubbing])
    {
      [(AXMDataSonifier *)self playFrequencyAtTime:v6];
    }
    else
    {
      unint64_t v7 = [(AXMDataSonifier *)self playbackMixerDataSource];
      [v7 setCurrentSampleIndex:(unint64_t)v6];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = [(AXMDataSonifier *)self playbackObservers];
      uint64_t v9 = [v8 allObjects];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v17;
        uint64_t v12 = MEMORY[0x1E4F14428];
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v15[0] = MEMORY[0x1E4F143A8];
              v15[1] = 3221225472;
              v15[2] = __49__AXMDataSonifier_setContinuousPlaybackPosition___block_invoke;
              v15[3] = &unk_1E61183A8;
              v15[4] = v14;
              *(double *)&v15[5] = a3;
              dispatch_async(v12, v15);
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
    }
  }
}

uint64_t __49__AXMDataSonifier_setContinuousPlaybackPosition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataSonifierPlaybackProgressDidChange:*(double *)(a1 + 40)];
}

- (void)beginScrubbing
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  CFTimeInterval v3 = [(AXMDataSonifier *)self trendlineFunction];

  id v4 = [(AXMDataSonifier *)self scrubbingDiscreteAudioDataSource];
  [v4 setLevel:dbl_1B58ACEF0[v3 == 0]];

  id v5 = [(AXMDataSonifier *)self scrubbingMixerDataSource];
  double v6 = [(AXMDataSonifier *)self scrubbingDiscreteAudioDataSource];
  [v5 addDataSource:v6];
  BOOL v7 = v3 == 0;

  id v8 = [(AXMDataSonifier *)self scrubbingContinuousAudioDataSource];
  [v8 setLevel:dbl_1B58ACF00[v7]];

  uint64_t v9 = [AXMLiveContinuousSynth alloc];
  id v10 = [(AXMDataSonifier *)self _newContinuousToneEnvelope];
  uint64_t v11 = [(AXMSynth *)v9 initWithSampleRate:v10 envelope:44100.0];
  continuousScrubbingTone = self->_continuousScrubbingTone;
  self->_continuousScrubbingTone = v11;

  id v13 = [(AXMDataSonifier *)self scrubbingMixerDataSource];
  uint64_t v14 = [(AXMDataSonifier *)self scrubbingContinuousAudioDataSource];
  [v13 addDataSource:v14];

  uint64_t v15 = [(AXMDataSonifier *)self trendlineFunction];

  if (v15)
  {
    long long v16 = [(AXMDataSonifier *)self scrubbingTrendlineAudioDataSource];
    [v16 setLevel:0.354813389];

    long long v17 = [AXMLiveContinuousSynth alloc];
    id v18 = [(AXMDataSonifier *)self _newContinuousToneEnvelope];
    long long v19 = [(AXMSynth *)v17 initWithSampleRate:v18 envelope:44100.0];
    trendlineScrubbingTone = self->_trendlineScrubbingTone;
    self->_trendlineScrubbingTone = v19;

    uint64_t v21 = [(AXMDataSonifier *)self scrubbingMixerDataSource];
    uint64_t v22 = [(AXMDataSonifier *)self scrubbingTrendlineAudioDataSource];
    [v21 addDataSource:v22];
  }
  if ([(AXMDataSonifier *)self isPlaying]) {
    [(AXMDataSonifier *)self pause];
  }
  if ([(AXMDataSonifier *)self isEndingScrubbing]) {
    [(AXMDataSonifier *)self stopScrubbing];
  }
  [(AVAudioEngine *)self->_engine startAndReturnError:0];
  self->_scrubbing = 1;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v23 = [(AXMDataSonifier *)self playbackObservers];
  double v24 = [v23 allObjects];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v32;
    double v27 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v31 + 1) + 8 * v28);
        if (objc_opt_respondsToSelector())
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __33__AXMDataSonifier_beginScrubbing__block_invoke;
          v30[3] = &unk_1E6118358;
          v30[4] = v29;
          v30[5] = self;
          dispatch_async(v27, v30);
        }
        ++v28;
      }
      while (v25 != v28);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v25);
  }
}

uint64_t __33__AXMDataSonifier_beginScrubbing__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) currentPlaybackPosition];

  return objc_msgSend(v1, "dataSonifierScrubbingDidBeginAtPosition:");
}

- (id)keyPitchForTime:(double)a3
{
  int v5 = [(NSArray *)self->_keyPitches count];
  if (v5 < 1)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = 0;
    int v7 = 0;
    do
    {
      if (v5 + v7 < 0 != __OFADD__(v5, v7)) {
        int v8 = v5 + v7 + 1;
      }
      else {
        int v8 = v5 + v7;
      }
      uint64_t v9 = [(NSArray *)self->_keyPitches objectAtIndexedSubscript:(uint64_t)v8 >> 1];
      [v9 timeOffsetMS];
      int v10 = v8 >> 1;
      if (v11 <= a3)
      {
        id v12 = v9;

        int v7 = v10 + 1;
        double v6 = v12;
      }
      else
      {
        int v5 = v8 >> 1;
      }
    }
    while (v7 < v5);
  }

  return v6;
}

- (void)endScrubbing
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self->_isEndingScrubbing = 1;
  double v2 = [(AXMDataSonifier *)self continuousScrubbingTone];
  [v2 startRelease];

  CFTimeInterval v3 = [(AXMDataSonifier *)self trendlineScrubbingTone];
  [v3 startRelease];

  dispatch_time_t v4 = dispatch_time(0, 60000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AXMDataSonifier_endScrubbing__block_invoke;
  block[3] = &unk_1E61183D0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = [(AXMDataSonifier *)self playbackObservers];
  double v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __31__AXMDataSonifier_endScrubbing__block_invoke_2;
          id v13[3] = &unk_1E6118358;
          v13[4] = v11;
          v13[5] = self;
          dispatch_async(v9, v13);
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __31__AXMDataSonifier_endScrubbing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopScrubbing];
}

uint64_t __31__AXMDataSonifier_endScrubbing__block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) currentPlaybackPosition];

  return objc_msgSend(v1, "dataSonifierScrubbingDidEndAtPosition:");
}

- (void)stopScrubbing
{
  CFTimeInterval v3 = [(AXMDataSonifier *)self scrubbingMixerDataSource];
  [v3 removeAllDataSources];

  self->_scrubbing = 0;
  continuousScrubbingTone = self->_continuousScrubbingTone;
  self->_continuousScrubbingTone = 0;

  self->_isEndingScrubbing = 0;
  [(AVAudioEngine *)self->_engine stop];
  player = self->_player;

  [(AVAudioPlayerNode *)player stop];
}

- (void)playFrequencyAtTime:(double)a3
{
  if (vabdd_f64(self->_currentPlaybackTime, a3) >= 0.025)
  {
    self->_double currentPlaybackTime = a3;
    id v11 = [(AXMDataSonifier *)self keyPitchForTime:a3];
    if (![(AVAudioEngine *)self->_engine isRunning]) {
      [(AVAudioEngine *)self->_engine startAndReturnError:0];
    }
    if (![(AVAudioPlayerNode *)self->_player isPlaying]) {
      [(AXMDataSonifier *)self playAudioPlayer];
    }
    pitchShifter = self->_pitchShifter;
    [v11 frequency];
    *(float *)&double v6 = v6;
    [(AVAudioUnitTimePitch *)pitchShifter setPitch:v6];
    uint64_t v7 = [(NSArray *)self->_keyPitches lastObject];
    [v7 timeOffsetMS];
    double v9 = v8;

    double v10 = a3 / v9 * 2.0 + -1.0;
    *(float *)&double v10 = v10;
    [(AXMDataSonifier *)self _setPanning:v10];
  }
}

- (BOOL)playAudioPlayer
{
  return 1;
}

- (void)scrubToPlaybackFrame:(unint64_t)a3
{
  v119[1] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v4 = [(AXMDataSonifier *)self playbackMixerDataSource];
  unint64_t v95 = [v4 currentSampleIndex];

  BOOL v5 = [(AXMDataSonifier *)self currentSeriesIndex] == 0;
  double v6 = [(AXMDataSonifier *)self currentChartDescriptor];
  [v6 series];
  if (v5) {
    double v9 = {;
  }
  }
  else {
    uint64_t v7 = {;
  }
    double v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex") - 1);
    v119[0] = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:1];
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = v9;
  uint64_t v99 = [obj countByEnumeratingWithState:&v112 objects:v118 count:16];
  if (v99)
  {
    uint64_t v98 = *(void *)v113;
    double v10 = (double)a3;
    double v94 = 1000.0;
    double v93 = 0.01;
    do
    {
      for (uint64_t i = 0; i != v99; ++i)
      {
        if (*(void *)v113 != v98) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        if (objc_msgSend(v11, "isContinuous", *(void *)&v93, *(void *)&v94))
        {
          id v12 = [(AXMDataSonifier *)self playbackMixerDataSource];
          unint64_t v13 = [v12 length];

          if ([(AXMDataSonifier *)self series:v11 hasContinuousPitchDataForTimePosition:v10 / (double)v13])
          {
            long long v14 = [(AXMDataSonifier *)self continuousScrubbingTone];
            [v14 setMuted:0];

            [(AXMDataSonifier *)self interpolatedPitchValueForNormalizedTimePosition:v11 inSeries:v10 / (double)v13];
            -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
            double v16 = v15;
            id v17 = [(AXMDataSonifier *)self continuousScrubbingTone];
            [v17 setBaseFrequency:v16];
          }
          else
          {
            id v17 = [(AXMDataSonifier *)self continuousScrubbingTone];
            [v17 setMuted:1];
          }
        }
        else
        {
          id v18 = [(AXMDataSonifier *)self playbackMixerDataSource];
          unint64_t v19 = [v18 length];

          uint64_t v20 = [(AXMDataSonifier *)self playbackMixerDataSource];
          unint64_t v21 = [v20 length];
          if (v95 <= a3)
          {
            double v22 = (double)v95 / (double)v19;
            double v23 = (double)a3;
          }
          else
          {
            double v22 = v10 / (double)v19;
            double v23 = (double)v95;
          }

          id v101 = [MEMORY[0x1E4F1CA48] array];
          unint64_t v24 = 0;
          double v25 = v23 / (double)v21;
          while (1)
          {
            uint64_t v26 = [v11 dataPoints];
            BOOL v27 = v24 < [v26 count];

            if (!v27) {
              break;
            }
            uint64_t v28 = [v11 dataPoints];
            uint64_t v29 = [v28 objectAtIndexedSubscript:v24];

            double v30 = [v29 timeEncodingValue];
            [(AXMDataSonifier *)self normalizedTimeEncodingValueForValue:v30];
            double v32 = v31;

            if (v22 <= v32 && v32 < v25)
            {
              long long v33 = [NSNumber numberWithUnsignedInteger:v24];
              [v101 addObject:v33];
            }
            ++v24;
          }
          long long v34 = [(AXMDataSonifier *)self scrubbingDiscreteDataRenderingContext];
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          id v17 = v101;
          long long v35 = 0;
          uint64_t v36 = [v17 countByEnumeratingWithState:&v108 objects:v117 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v109;
            do
            {
              uint64_t v38 = 0;
              id v39 = v35;
              do
              {
                if (*(void *)v109 != v37) {
                  objc_enumerationMutation(v17);
                }
                v40 = *(void **)(*((void *)&v108 + 1) + 8 * v38);
                double v41 = [v11 dataPoints];
                double v42 = objc_msgSend(v41, "objectAtIndexedSubscript:", (int)objc_msgSend(v40, "intValue"));

                id v43 = [v42 pitchEncodingValue];
                [v43 doubleValue];
                -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
                double v45 = v44;

                float v46 = [v42 durationEncodingValue];
                [v46 doubleValue];
                -[AXMDataSonifier durationForDurationEncodingValue:](self, "durationForDurationEncodingValue:");
                double v48 = v47;

                v49 = [v42 volumeEncodingValue];
                [v49 doubleValue];
                -[AXMDataSonifier volumeForVolumeEncodingValue:](self, "volumeForVolumeEncodingValue:");
                double v51 = v50;

                long long v35 = [[AXMADSREnvelope alloc] initWithAttackDuration:20.0 attackLevel:v51 decayDuration:v48 / 5.0 sustainDuration:0.0 sustainLevel:0.0 releaseDuration:10.0];
                v52 = [[AXMSinglePitchSynth alloc] initWithFrequency:v35 sampleRate:v45 envelope:44100.0];
                [(AXMSinglePitchSynth *)v52 renderInBuffer:v34 atFrame:0];

                ++v38;
                id v39 = v35;
              }
              while (v36 != v38);
              uint64_t v36 = [v17 countByEnumeratingWithState:&v108 objects:v117 count:16];
            }
            while (v36);
          }

          if ([v17 count])
          {
            [(AXMADSREnvelope *)v35 lengthMS];
            double v54 = v53;
            uint64_t v55 = [v17 count];
            unint64_t v56 = [v17 count];
            uint64_t v57 = (unint64_t)((double)(unint64_t)(v55 - 1) + v54 / v94 * 44100.0);
            double v58 = v93 / vabdd_f64(v25, v22);
            if (v58 > 1.0) {
              double v58 = 1.0;
            }
            [(AXMDataSonifier *)self _peakNormalizeBuffer:v34 length:v57 level:v58 * (1.0 / (double)v56)];
            v59 = [(AXMDataSonifier *)self scrubbingDiscreteAudioDataSource];
            uint64_t v60 = [v59 currentSampleIndex];

            v61 = [(AXMDataSonifier *)self scrubbingDiscreteAudioDataSource];
            v62 = (uint64_t *)[v61 sampleBuffer];

            if (v57)
            {
              uint64_t v63 = 0;
              uint64_t v64 = *v62;
              unint64_t v65 = (v62[1] - *v62) >> 2;
              v66 = *v34;
              do
              {
                *(_DWORD *)(v64 + 4 * ((v60 + 882 + v63) % v65)) += v66[v63];
                ++v63;
              }
              while (v57 != v63);
              if (v57 >= 1) {
                bzero(*v34, 4 * (v57 - ((v57 & 0x3FFFFFFFFFFFFFFFLL) != 0)) + 4);
              }
            }
          }
        }
      }
      uint64_t v99 = [obj countByEnumeratingWithState:&v112 objects:v118 count:16];
    }
    while (v99);
  }

  v67 = [(AXMDataSonifier *)self trendlineFunction];
  BOOL v68 = v67 == 0;

  if (!v68)
  {
    v69 = [(AXMDataSonifier *)self playbackMixerDataSource];
    unint64_t v70 = [v69 length];

    v71 = [(AXMDataSonifier *)self currentChartDescriptor];
    v72 = [v71 timeAxisDescriptor];

    [v72 lowerBound];
    double v74 = v73;
    [v72 upperBound];
    [(AXMDataSonifier *)self valueFromNormalizedValue:(double)a3 / (double)v70 min:v74 max:v75];
    double v77 = v76;
    v78 = [(AXMDataSonifier *)self trendlineFunction];
    double v79 = v78[2](v77);

    [(AXMDataSonifier *)self frequencyForPitchEncodingValue:v79];
    double v81 = v80;
    v82 = [(AXMDataSonifier *)self trendlineScrubbingTone];
    [v82 setBaseFrequency:v81];
  }
  v83 = [(AXMDataSonifier *)self playbackMixerDataSource];
  [v83 setCurrentSampleIndex:a3];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v84 = [(AXMDataSonifier *)self playbackObservers];
  id v102 = [v84 allObjects];

  uint64_t v85 = [v102 countByEnumeratingWithState:&v104 objects:v116 count:16];
  if (v85)
  {
    uint64_t v86 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v85; ++j)
      {
        if (*(void *)v105 != v86) {
          objc_enumerationMutation(v102);
        }
        uint64_t v88 = *(void *)(*((void *)&v104 + 1) + 8 * j);
        if (objc_opt_respondsToSelector())
        {
          v89 = [(AXMDataSonifier *)self playbackMixerDataSource];
          unint64_t v90 = [v89 currentSampleIndex];
          v91 = [(AXMDataSonifier *)self playbackMixerDataSource];
          unint64_t v92 = [v91 length];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __40__AXMDataSonifier_scrubToPlaybackFrame___block_invoke;
          block[3] = &unk_1E61183A8;
          block[4] = v88;
          *(double *)&void block[5] = (double)v90 / (double)v92;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
      uint64_t v85 = [v102 countByEnumeratingWithState:&v104 objects:v116 count:16];
    }
    while (v85);
  }
}

uint64_t __40__AXMDataSonifier_scrubToPlaybackFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataSonifierScrubbingPositionDidChange:*(double *)(a1 + 40)];
}

- (void)setCurrentChartDescriptor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  objc_storeStrong((id *)&self->_currentChartDescriptor, a3);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [v18 series];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        double v9 = objc_msgSend(v8, "dataPoints", v18);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v9);
              }
              unint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              long long v14 = [v13 zCategoryAxisValue];
              BOOL v15 = v14 == 0;

              if (!v15)
              {
                double v16 = [(AXMDataSonifier *)self dataCategories];
                id v17 = [v13 zCategoryAxisValue];
                [v16 addObject:v17];
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  self->_needsRenderSonification = 1;
}

- (void)setCurrentSeriesIndex:(int64_t)a3
{
  [(AXMDataSonifier *)self stopPlaying];
  [(AXMDataSonifier *)self stopScrubbing];
  self->_currentSeriesIndex = a3;
  if (a3)
  {
    uint64_t v5 = [(AXMDataSonifier *)self currentChartDescriptor];
    uint64_t v6 = [v5 series];
    self->_currentSeriesIndex = a3 % (unint64_t)([v6 count] + 1);
  }

  [(AXMDataSonifier *)self renderSonification];
}

- (void)renderSonification
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Chart descriptor has no series, can't render sonification", v1, 2u);
}

- (void)_renderSeries:(id)a3
{
  id v12 = a3;
  if ([v12 isContinuous])
  {
    dispatch_time_t v4 = [(AXMDataSonifier *)self _keyPitchesForContinuousSeries:v12];
    keyPitches = self->_keyPitches;
    self->_keyPitches = v4;

    if ([(NSArray *)self->_keyPitches count])
    {
      uint64_t v6 = [(NSArray *)self->_keyPitches firstObject];
      [v6 timeOffsetMS];
      double v8 = v7;

      double v9 = [(NSArray *)self->_keyPitches lastObject];
      [v9 timeOffsetMS];
      double v11 = v10;

      self->double audiographPlaybackDuration = v11 - v8;
    }
    if ([(AXMDataSonifier *)self containsMultipleSeries]) {
      [(AXMDataSonifier *)self _renderContinuousAudioForMultiSeries:v12];
    }
  }
  else
  {
    [(AXMDataSonifier *)self _renderDiscreteAudioForSeries:v12];
  }
}

- (void)_renderDiscreteAudioForSeries:(id)a3
{
  id v22 = a3;
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v5 = [v22 dataPoints];
    unint64_t v6 = [v5 count];

    if (i >= v6) {
      break;
    }
    double v7 = [v22 dataPoints];
    double v8 = [v7 objectAtIndexedSubscript:i];

    [v8 playbackTimeOffsetMS];
    unint64_t v9 = -[AXMDataSonifier sampleIndexForTimeOffset:](self, "sampleIndexForTimeOffset:");
    double v10 = [v8 pitchEncodingValue];
    [v10 doubleValue];
    -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
    double v12 = v11;

    unint64_t v13 = [v8 durationEncodingValue];
    [v13 doubleValue];
    -[AXMDataSonifier durationForDurationEncodingValue:](self, "durationForDurationEncodingValue:");
    double v15 = v14;

    double v16 = [v8 volumeEncodingValue];
    [v16 doubleValue];
    -[AXMDataSonifier volumeForVolumeEncodingValue:](self, "volumeForVolumeEncodingValue:");
    double v18 = v17;

    unint64_t v19 = [[AXMADSREnvelope alloc] initWithAttackDuration:20.0 attackLevel:v18 decayDuration:v15 / 5.0 sustainDuration:20.0 sustainLevel:0.3 releaseDuration:10.0];
    long long v20 = [[AXMSinglePitchSynth alloc] initWithFrequency:v19 sampleRate:v12 envelope:44100.0];
    long long v21 = [(AXMDataSonifier *)self playbackChartDataAudioDataSource];
    -[AXMSinglePitchSynth renderInBuffer:atFrame:](v20, "renderInBuffer:atFrame:", [v21 sampleBuffer], v9);
  }
}

- (id)_keyPitchesForContinuousSeries:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXMDataSonifier *)self currentChartDescriptor];
  unint64_t v6 = [v5 series];
  uint64_t v7 = [v6 indexOfObject:v4];

  if ([v4 isContinuous])
  {
    double v8 = [v4 dataPoints];
    uint64_t v9 = [v8 count];

    double v10 = 0;
    if (v9 && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v10 = [MEMORY[0x1E4F1CA48] array];
      double v11 = [v4 dataPoints];
      double v12 = [v11 objectAtIndexedSubscript:0];
      [v12 playbackTimeOffsetMS];
      double v14 = v13;

      unint64_t v15 = 0;
      *(_OWORD *)&self->maxFrequency = xmmword_1B58ACF10;
      while (1)
      {
        double v16 = [v4 dataPoints];
        unint64_t v17 = [v16 count];

        if (v15 >= v17) {
          break;
        }
        double v18 = [v4 dataPoints];
        unint64_t v19 = [v18 objectAtIndexedSubscript:v15];

        [v19 playbackTimeOffsetMS];
        double v21 = v20;
        id v22 = [v19 pitchEncodingValue];
        [v22 doubleValue];
        -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
        double v24 = v23;

        long long v25 = [v19 volumeEncodingValue];
        [v25 doubleValue];
        -[AXMDataSonifier volumeForVolumeEncodingValue:](self, "volumeForVolumeEncodingValue:");
        double v27 = v26;

        uint64_t v28 = [[KeyPitch alloc] initWithFrequency:v24 volume:v27 timeOffset:v21 - v14];
        if (![v10 count]
          || ([v10 lastObject],
              uint64_t v29 = objc_claimAutoreleasedReturnValue(),
              [v29 timeOffsetMS],
              double v31 = v30,
              [(KeyPitch *)v28 timeOffsetMS],
              double v33 = v32,
              v29,
              v31 < v33))
        {
          [v10 addObject:v28];
          double v34 = fmin(self->minFrequency, v24);
          self->maxFrequency = fmax(self->maxFrequency, v24);
          self->minFrequency = v34;
        }

        ++v15;
      }
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)_renderContinuousAudioForMultiSeries:(id)a3
{
  id v4 = [a3 dataPoints];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  [v5 playbackTimeOffsetMS];
  double v7 = v6;

  unint64_t v8 = [(AXMDataSonifier *)self sampleIndexForTimeOffset:v7];
  uint64_t v9 = [AXMADSREnvelope alloc];
  double v10 = [(NSArray *)self->_keyPitches lastObject];
  [v10 timeOffsetMS];
  double v14 = [(AXMADSREnvelope *)v9 initWithAttackDuration:30.0 attackLevel:0.8 decayDuration:0.0 sustainDuration:v11 sustainLevel:0.8 releaseDuration:75.0];

  double v12 = [[AXMContinuousSynth alloc] initWithSampleRate:v14 envelope:self->_keyPitches keyPitches:44100.0];
  double v13 = [(AXMDataSonifier *)self playbackChartDataAudioDataSource];
  -[AXMContinuousSynth renderInBuffer:atFrame:](v12, "renderInBuffer:atFrame:", [v13 sampleBuffer], v8);
}

- (double)_centsForFrequency:(double)a3
{
  [(AXMDataSonifier *)self _normalizedKeyPitchForFrequency:a3];
  return v3 * 4800.0 + -2400.0;
}

- (double)_normalizedKeyPitchForFrequency:(double)a3
{
  return a3 / self->maxFrequency;
}

- (void)_initializeAudioChain
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F15380]);
  -[AXMDataSonifier setEngine:](self, "setEngine:");

  [(AXMDataSonifier *)self _initializeStereoPanner];
  if ([(AXMDataSonifier *)self containsMultipleSeries]) {
    [(AXMDataSonifier *)self _setupMultiSeriesAudioChain];
  }
  else {
    [(AXMDataSonifier *)self _setupSingleSeriesAudioChain];
  }
  double v3 = [(AVAudioEngine *)self->_engine mainMixerNode];
  LODWORD(v4) = 0.5;
  id v6 = v3;
  [v3 setOutputVolume:v4];
}

- (void)_setupSingleSeriesAudioChain
{
  id v6 = [(AXMDataSonifier *)self currentSeries];
  if (v6)
  {
    double v2 = [(AXMDataSonifier *)self currentSeries];
    if (([v2 isContinuous] & 1) == 0)
    {

LABEL_10:
      [(AXMDataSonifier *)self _setupMultiSeriesAudioChain];
      return;
    }
  }
  double v4 = [(AXMDataSonifier *)self currentSeries];

  if (v6)
  {
  }
  if (!v4) {
    goto LABEL_10;
  }
  [(AXMDataSonifier *)self _initializePitchShifter];
  [(AXMDataSonifier *)self _initializeAudioPlayerNode];
  id v7 = [(AVAudioEngine *)self->_engine mainMixerNode];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initStandardFormatWithSampleRate:2 channels:44100.0];
  [(AVAudioEngine *)self->_engine connect:self->_player to:self->_pitchShifter fromBus:0 toBus:0 format:v5];
  [(AVAudioEngine *)self->_engine connect:self->_pitchShifter to:self->_stereoPanner fromBus:0 toBus:0 format:v5];
  -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_stereoPanner, v7, 0, [v7 nextAvailableInputBus], v5);
}

- (void)_setupMultiSeriesAudioChain
{
  [(AXMDataSonifier *)self _initializeAudioSourceNode];
  [(AXMDataSonifier *)self _initializeLimiter];
  id v4 = [(AVAudioEngine *)self->_engine mainMixerNode];
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initStandardFormatWithSampleRate:2 channels:44100.0];
  [(AVAudioEngine *)self->_engine connect:self->_audioSourceNode to:self->_stereoPanner fromBus:0 toBus:0 format:v3];
  [(AVAudioEngine *)self->_engine connect:self->_stereoPanner to:self->_limiter fromBus:0 toBus:0 format:v3];
  -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_limiter, v4, 0, [v4 nextAvailableInputBus], v3);
}

- (void)_initializeAudioPlayerNode
{
  double v3 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E4F153D0]);
  player = self->_player;
  self->_player = v3;

  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 pathForResource:@"bassTone" ofType:@"wav"];

  id v7 = objc_alloc(MEMORY[0x1E4F15390]);
  unint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  uint64_t v9 = (void *)[v7 initForReading:v8 error:0];

  id v10 = objc_alloc(MEMORY[0x1E4F153B0]);
  double v11 = [v9 processingFormat];
  double v12 = (AVAudioPCMBuffer *)objc_msgSend(v10, "initWithPCMFormat:frameCapacity:", v11, objc_msgSend(v9, "length"));
  buffer = self->buffer;
  self->buffer = v12;

  double v14 = self->buffer;
  id v16 = 0;
  [v9 readIntoBuffer:v14 error:&v16];
  id v15 = v16;
  [(AVAudioEngine *)self->_engine attachNode:self->_player];
}

- (void)_initializePitchShifter
{
  double v3 = (AVAudioUnitTimePitch *)objc_alloc_init(MEMORY[0x1E4F15438]);
  pitchShifter = self->_pitchShifter;
  self->_pitchShifter = v3;

  [(AVAudioUnitTimePitch *)self->_pitchShifter setPitch:0.0];
  [(AVAudioUnitTimePitch *)self->_pitchShifter setOverlap:8589936700.0];
  [(AVAudioUnitTimePitch *)self->_pitchShifter setBypass:0];
  engine = self->_engine;
  id v6 = self->_pitchShifter;

  [(AVAudioEngine *)engine attachNode:v6];
}

- (void)_initializeAudioSourceNode
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  [(AXMDataSonifier *)self _audioFormat];
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:v13];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4F153F0]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke;
  id v10 = &unk_1E6118420;
  objc_copyWeak(&v11, &location);
  id v5 = (AVAudioSourceNode *)[v4 initWithFormat:v3 renderBlock:&v7];
  audioSourceNode = self->_audioSourceNode;
  self->_audioSourceNode = v5;

  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_audioSourceNode, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [WeakRetained playbackMixerDataSource];
  unint64_t v8 = [v7 currentSampleIndex];
  id v9 = objc_loadWeakRetained(v5);
  uint64_t v10 = [v9 playbackMixerDataSource];
  unint64_t v11 = [(id)v10 length];

  id v12 = objc_loadWeakRetained(v5);
  LOBYTE(v10) = [v12 isInLiveContinuousToneSession];

  if ((v10 & 1) == 0)
  {
    id v13 = objc_loadWeakRetained(v5);
    *(float *)&double v14 = (double)v8 / (double)v11 * 2.0 + -1.0;
    [v13 _setPanning:v14];
  }
  id v15 = objc_loadWeakRetained(v5);
  int v16 = [v15 isPlaying];

  id v17 = objc_loadWeakRetained(v5);
  double v18 = v17;
  if (v16)
  {
    unint64_t v19 = [v17 playbackMixerDataSource];
    __sz = (void *)[v19 sampleBuffer];

    if (!*a5) {
      return 0;
    }
    uint64_t v20 = 0;
    for (unint64_t i = (void **)(a5 + 4); ; i += 2)
    {
      id v22 = objc_loadWeakRetained(v5);
      double v23 = [v22 playbackMixerDataSource];
      uint64_t v24 = [v23 currentSampleIndex];

      unint64_t v25 = *((unsigned int *)i - 1);
      id v26 = objc_loadWeakRetained(v5);
      double v27 = [v26 playbackMixerDataSource];
      unint64_t v28 = v25 >> 2;
      [v27 prepareNextSamples:v25 >> 2];

      id v29 = objc_loadWeakRetained(v5);
      double v30 = [v29 playbackMixerDataSource];
      uint64_t v31 = [v30 length];

      unint64_t v32 = v31 - v24;
      if (v31 == v24)
      {
        double v33 = (char *)*i;
        size_t v34 = *((unsigned int *)i - 1);
      }
      else
      {
        long long v35 = *i;
        id v36 = objc_loadWeakRetained(v5);
        uint64_t v37 = v36;
        if (v28 <= v32)
        {
          double v41 = [v36 playbackMixerDataSource];
          memcpy(v35, (const void *)(*__sz + 4 * [v41 currentSampleIndex]), 4 * v28);

          id v42 = objc_loadWeakRetained(v5);
          id v43 = [v42 playbackMixerDataSource];
          objc_msgSend(v43, "setCurrentSampleIndex:", objc_msgSend(v43, "currentSampleIndex") + v28);

          goto LABEL_12;
        }
        uint64_t v38 = [v36 playbackMixerDataSource];
        memcpy(v35, (const void *)(*__sz + 4 * [v38 currentSampleIndex]), 4 * v32);

        id v39 = objc_loadWeakRetained(v5);
        v40 = [v39 playbackMixerDataSource];
        objc_msgSend(v40, "setCurrentSampleIndex:", objc_msgSend(v40, "currentSampleIndex") + v32);

        double v33 = (char *)*i + 4 * v32;
        size_t v34 = 4 * (v28 - v32);
      }
      bzero(v33, v34);
LABEL_12:
      if (++v20 >= (unint64_t)*a5)
      {
        if (v24 + v28 >= (uint64_t)(__sz[1] - *__sz) >> 2)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke_2;
          block[3] = &unk_1E61183F8;
          objc_copyWeak(&v124, v5);
          dispatch_async(MEMORY[0x1E4F14428], block);
          objc_destroyWeak(&v124);
        }
        return 0;
      }
    }
  }
  int v44 = [v17 isScrubbing];

  id v45 = objc_loadWeakRetained(v5);
  float v46 = v45;
  if (v44)
  {
    double v47 = [v45 scrubbingMixerDataSource];
    double v48 = (void *)[v47 sampleBuffer];

    id v49 = objc_loadWeakRetained(v5);
    double v50 = [v49 scrubbingTrendlineAudioDataSource];
    uint64_t v116 = [v50 sampleBuffer];

    double v51 = a5;
    if (*a5)
    {
      std::vector<int>::size_type v52 = 0;
      do
      {
        unint64_t v53 = v51[4 * v52 + 3];
        id v54 = objc_loadWeakRetained(v5);
        uint64_t v55 = [v54 scrubbingMixerDataSource];
        unint64_t v56 = [v55 length];
        std::vector<int>::size_type __sza = v52;

        id v57 = objc_loadWeakRetained(v5);
        double v58 = (std::vector<int> *)[v57 scrubbingPlaybackCallbackRenderingContext];
        unint64_t v59 = v53 >> 2;

        if (v53 >> 2 != v58->__end_ - v58->__begin_) {
          std::vector<int>::resize(v58, v53 >> 2);
        }
        id v60 = objc_loadWeakRetained(v5);
        v61 = [v60 trendlineFunction];

        if (v61)
        {
          int v62 = v53;
          id v63 = objc_loadWeakRetained(v5);
          unint64_t v53 = [v63 trendlineScrubbingTone];
          id v64 = objc_loadWeakRetained(v5);
          unint64_t v65 = [v64 scrubbingTrendlineAudioDataSource];
          objc_msgSend((id)v53, "renderInBuffer:atFrame:numSamples:", v116, objc_msgSend(v65, "currentSampleIndex"), v59);

          LODWORD(v53) = v62;
        }
        id v66 = objc_loadWeakRetained(v5);
        v67 = [v66 scrubbingMixerDataSource];
        [v67 prepareNextSamples:v59];

        if (v53 > 3)
        {
          uint64_t v69 = 0;
          if (v59 <= 1) {
            uint64_t v70 = 1;
          }
          else {
            uint64_t v70 = v59;
          }
          do
          {
            id v71 = objc_loadWeakRetained(v5);
            v72 = [v71 scrubbingMixerDataSource];
            unint64_t v73 = (v69 + [v72 currentSampleIndex]) % v56;

            std::vector<int>::pointer begin = v58->__begin_;
            v58->__begin_[v69++] = *(_DWORD *)(*v48 + 4 * v73);
          }
          while (v70 != v69);
        }
        else
        {
          std::vector<int>::pointer begin = v58->__begin_;
        }
        memcpy(*(void **)&a5[4 * __sza + 4], begin, 4 * v59);
        id v74 = objc_loadWeakRetained(v5);
        double v75 = [v74 scrubbingMixerDataSource];
        uint64_t v76 = [v75 currentSampleIndex];
        id v77 = objc_loadWeakRetained(v5);
        v78 = [v77 scrubbingMixerDataSource];
        [v78 setCurrentSampleIndex:(v76 + v59) % v56];

        double v51 = a5;
        std::vector<int>::size_type v52 = __sza + 1;
      }
      while (__sza + 1 < *a5);
    }
  }
  else
  {
    int v79 = [v45 isInLiveContinuousToneSession];

    if (v79)
    {
      id v80 = objc_loadWeakRetained(v5);
      double v81 = [v80 liveContinuousMixerDataSource];
      v82 = (void *)[v81 sampleBuffer];

      v83 = a5;
      if (*a5)
      {
        uint64_t v84 = 0;
        do
        {
          unint64_t v85 = v83[4 * v84 + 3];
          id v86 = objc_loadWeakRetained(v5);
          v87 = (std::vector<int> *)[v86 liveTonePlaybackCallbackRenderingContext];
          uint64_t v117 = v84;

          std::vector<int>::size_type __szb = v85 >> 2;
          if (v85 >> 2 != v87->__end_ - v87->__begin_) {
            std::vector<int>::resize(v87, __szb);
          }
          id v88 = objc_loadWeakRetained(v5);
          v89 = [v88 liveContinuousAudioDataSource];
          uint64_t v90 = [v89 sampleBuffer];

          id v91 = objc_loadWeakRetained(v5);
          unint64_t v92 = [v91 liveContinuousDataTone];
          id v93 = objc_loadWeakRetained(v5);
          double v94 = [v93 liveContinuousAudioDataSource];
          objc_msgSend(v92, "renderInBuffer:atFrame:numSamples:", v90, objc_msgSend(v94, "currentSampleIndex"), __szb);

          id v95 = objc_loadWeakRetained(v5);
          v96 = [v95 liveContinuousMixerDataSource];
          [v96 prepareNextSamples:__szb];

          if (v85 > 3)
          {
            uint64_t v98 = 0;
            if (__szb <= 1) {
              uint64_t v99 = 1;
            }
            else {
              uint64_t v99 = v85 >> 2;
            }
            do
            {
              id v100 = objc_loadWeakRetained(v5);
              id v101 = [v100 liveContinuousMixerDataSource];
              uint64_t v102 = [v101 currentSampleIndex];
              id v103 = objc_loadWeakRetained(v5);
              long long v104 = [v103 liveContinuousMixerDataSource];
              unint64_t v105 = (v98 + v102) % (unint64_t)[v104 length];

              std::vector<int>::pointer v97 = v87->__begin_;
              v87->__begin_[v98++] = *(_DWORD *)(*v82 + 4 * v105);
            }
            while (v99 != v98);
          }
          else
          {
            std::vector<int>::pointer v97 = v87->__begin_;
          }
          memcpy(*(void **)&a5[4 * v117 + 4], v97, 4 * __szb);
          id v106 = objc_loadWeakRetained(v5);
          long long v107 = [v106 liveContinuousMixerDataSource];
          uint64_t v108 = [v107 currentSampleIndex];
          id v109 = objc_loadWeakRetained(v5);
          long long v110 = [v109 liveContinuousMixerDataSource];
          unint64_t v111 = [v110 length];
          id v112 = objc_loadWeakRetained(v5);
          long long v113 = [v112 liveContinuousMixerDataSource];
          [v113 setCurrentSampleIndex:(v108 + __szb) % v111];

          uint64_t v84 = v117 + 1;
          v83 = a5;
        }
        while (v117 + 1 < (unint64_t)*a5);
      }
    }
    else
    {
      long long v114 = AXMediaLogCommon();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B57D5000, v114, OS_LOG_TYPE_DEFAULT, "Error: IO audio unit is running but we aren't in a scrubbing or playback session -- investigate.", buf, 2u);
      }
    }
  }
  return 0;
}

void __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopPlaying];
}

- (AudioStreamBasicDescription)_audioFormat
{
  retstr->mSampleRate = 44100.0;
  retstr->mBitsPerChannel = 16;
  *(_OWORD *)&retstr->mFormatID = xmmword_1B58ACF20;
  *(void *)&retstr->mBytesPerFrame = 0x200000004;
  return self;
}

- (void)_initializeLowpassFilter
{
  double v3 = (AVAudioUnitEQ *)[objc_alloc(MEMORY[0x1E4F15420]) initWithNumberOfBands:1];
  lowpassFilter = self->_lowpassFilter;
  self->_lowpassFilter = v3;

  id v5 = [(AVAudioUnitEQ *)self->_lowpassFilter bands];
  id v7 = [v5 objectAtIndexedSubscript:0];

  [v7 setFilterType:1];
  LODWORD(v6) = 1148846080;
  [v7 setFrequency:v6];
  [v7 setBypass:0];
}

- (void)setLowpassCutoff:(float)a3
{
  id v6 = [(AVAudioUnitEQ *)self->_lowpassFilter bands];
  id v4 = [v6 objectAtIndexedSubscript:0];
  *(float *)&double v5 = a3;
  [v4 setFrequency:v5];
}

- (float)lowpassCutoff
{
  double v2 = [(AVAudioUnitEQ *)self->_lowpassFilter bands];
  double v3 = [v2 objectAtIndexedSubscript:0];
  [v3 frequency];
  float v5 = v4;

  return v5;
}

- (void)_initializeCompressor
{
  double v3 = (AVAudioUnitEffect *)objc_alloc_init(MEMORY[0x1E4F15428]);
  compressor = self->_compressor;
  self->_compressor = v3;

  int v8 = 0;
  long long v7 = *(_OWORD *)"xfuapmcdlppa";
  float v5 = (AVAudioUnitEffect *)[objc_alloc(MEMORY[0x1E4F15428]) initWithAudioComponentDescription:&v7];
  id v6 = self->_compressor;
  self->_compressor = v5;

  [(AVAudioUnitEffect *)self->_compressor setBypass:0];
  AudioUnitSetParameter((AudioUnit)[(AVAudioUnitEffect *)self->_compressor audioUnit], 4u, 0, 0, 5.0, 0);
  AudioUnitSetParameter((AudioUnit)[(AVAudioUnitEffect *)self->_compressor audioUnit], 5u, 0, 0, 20.0, 0);
  AudioUnitSetParameter((AudioUnit)[(AVAudioUnitEffect *)self->_compressor audioUnit], 0x3E8u, 0, 0, 3.0, 0);
  AudioUnitSetParameter((AudioUnit)[(AVAudioUnitEffect *)self->_compressor audioUnit], 0, 0, 0, -0.5, 0);
  AudioUnitSetParameter((AudioUnit)[(AVAudioUnitEffect *)self->_compressor audioUnit], 6u, 0, 0, 0.0, 0);
}

- (void)_initializeStereoPanner
{
  double v3 = (AVAudioEnvironmentNode *)objc_alloc_init(MEMORY[0x1E4F15388]);
  stereoPanner = self->_stereoPanner;
  self->_stereoPanner = v3;

  engine = self->_engine;
  id v6 = self->_stereoPanner;

  [(AVAudioEngine *)engine attachNode:v6];
}

- (void)_setPanning:(float)a3
{
  stereoPanner = self->_stereoPanner;
  BOOL v5 = [(AXMDataSonifier *)self shouldPlayInStereo];
  double v6 = 0.0;
  if (v5) {
    *(float *)&double v6 = a3;
  }

  [(AVAudioEnvironmentNode *)stereoPanner setPan:v6];
}

- (void)_initializeLimiter
{
  int v6 = 0;
  long long v5 = *(_OWORD *)"xfuartmllppa";
  double v3 = (AVAudioUnitEffect *)[objc_alloc(MEMORY[0x1E4F15428]) initWithAudioComponentDescription:&v5];
  limiter = self->_limiter;
  self->_limiter = v3;

  [(AVAudioUnitEffect *)self->_limiter setBypass:0];
  AudioUnitSetParameter((AudioUnit)[(AVAudioUnitEffect *)self->_limiter audioUnit], 1u, 0, 0, 2.0, 0);
  [(AVAudioEngine *)self->_engine attachNode:self->_limiter];
}

- (double)normalizedTimeEncodingValueForValue:(id)a3
{
  id v4 = a3;
  long long v5 = [(AXMDataSonifier *)self currentChartDescriptor];
  int v6 = [v5 timeNumericAxisDescriptor];

  if (v6)
  {
    long long v7 = [(AXMDataSonifier *)self currentChartDescriptor];
    int v8 = [v7 timeNumericAxisDescriptor];

    [v4 number];
    double v10 = v9;
    [v8 lowerBound];
    double v12 = v11;
    [v8 upperBound];
    [(AXMDataSonifier *)self normalizedValueForValue:v10 min:v12 max:v13];
    double v15 = v14;
  }
  else
  {
    id v17 = [(AXMDataSonifier *)self currentChartDescriptor];
    double v18 = [v17 timeCategoricalAxisDescriptor];

    if (!v18)
    {
      double v15 = 0.0;
      goto LABEL_4;
    }
    unint64_t v19 = [(AXMDataSonifier *)self currentChartDescriptor];
    int v8 = [v19 timeCategoricalAxisDescriptor];

    uint64_t v20 = [v8 categoryOrder];
    double v21 = [v4 category];
    uint64_t v22 = [v20 indexOfObject:v21];

    double v15 = 0.0;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v23 = [v8 categoryOrder];
      double v15 = (double)v22 / (double)(unint64_t)[v23 count];
    }
  }

LABEL_4:
  return v15;
}

- (double)normalizedValueForValue:(double)a3 min:(double)a4 max:(double)a5
{
  return (AXMClampDouble(a3, a4, a5) - a4) / (a5 - a4);
}

- (double)valueFromNormalizedValue:(double)a3 min:(double)a4 max:(double)a5
{
  return a4 + a3 * (a5 - a4);
}

- (double)interpolatedPitchValueForNormalizedTimePosition:(double)a3 inSeries:(id)a4
{
  id v6 = a4;
  long long v7 = [(AXMDataSonifier *)self currentChartDescriptor];
  int v8 = [v7 timeAxisDescriptor];

  char v9 = [v8 isCategoricalAxis];
  if (v9)
  {
    double v10 = [v6 dataPoints];
    double v11 = (double)(unint64_t)[v10 count];

    double v12 = 0.0;
  }
  else
  {
    [v8 lowerBound];
    double v12 = v13;
    [v8 upperBound];
    double v11 = v14;
  }
  [(AXMDataSonifier *)self valueFromNormalizedValue:a3 min:v12 max:v11];
  double v16 = v15;
  id v17 = [v6 dataPoints];
  for (unint64_t i = 1; ; ++i)
  {
    if (i >= [v17 count])
    {
      double v24 = 0.0;
      goto LABEL_14;
    }
    if ((v9 & 1) == 0) {
      break;
    }
    double v19 = (double)i;
    if (v16 < (double)i)
    {
      unint64_t v25 = i - 1;
      double v26 = (double)(i - 1);
      goto LABEL_13;
    }
LABEL_10:
    ;
  }
  uint64_t v20 = [v17 objectAtIndexedSubscript:i];
  double v21 = [v20 timeEncodingValue];
  [v21 number];
  double v23 = v22;

  if (v23 <= v16) {
    goto LABEL_10;
  }
  unint64_t v25 = i - 1;
  double v27 = [v17 objectAtIndexedSubscript:i - 1];
  unint64_t v28 = [v27 timeEncodingValue];
  [v28 number];
  double v26 = v29;

  double v30 = [v17 objectAtIndexedSubscript:i];
  uint64_t v31 = [v30 timeEncodingValue];
  [v31 number];
  double v19 = v32;

LABEL_13:
  double v33 = [v17 objectAtIndexedSubscript:v25];
  size_t v34 = [v33 pitchEncodingValue];
  [v34 doubleValue];
  double v36 = v35;

  uint64_t v37 = [v17 objectAtIndexedSubscript:i];
  uint64_t v38 = [v37 pitchEncodingValue];
  [v38 doubleValue];
  double v40 = v39;

  double v24 = v36 + (v16 - v26) / (v19 - v26) * (v40 - v36);
LABEL_14:

  return v24;
}

- (double)timeOffsetForTimeEncodingValue:(id)a3
{
  id v4 = a3;
  [(AXMDataSonifier *)self normalizedTimeEncodingValueForValue:v4];
  double v6 = v5;
  [(AXMDataSonifier *)self playbackDuration];
  double v8 = v6 * v7;

  return v8;
}

- (unint64_t)sampleIndexForTimeOffset:(double)a3
{
  return (unint64_t)(a3 / 1000.0 * 44100.0);
}

- (double)frequencyForPitchEncodingValue:(double)a3
{
  [(AXMDataSonifier *)self minimumPlaybackFrequency];
  double v6 = log2(v5);
  [(AXMDataSonifier *)self maximumPlaybackFrequency];
  double v8 = log2(v7);
  char v9 = [(AXMDataSonifier *)self currentChartDescriptor];
  double v10 = [v9 pitchAxisDescriptor];

  [v10 lowerBound];
  double v12 = v11;
  [v10 upperBound];
  [(AXMDataSonifier *)self normalizedValueForValue:a3 min:v12 max:v13];
  double v15 = exp2(v6 + v14 * (v8 - v6));
  [(AXMDataSonifier *)self minimumPlaybackFrequency];
  double v17 = v16;
  [(AXMDataSonifier *)self maximumPlaybackFrequency];
  double v19 = AXMClampDouble(v15, v17, v18);

  return v19;
}

- (double)volumeForVolumeEncodingValue:(double)a3
{
  long double v5 = [(AXMDataSonifier *)self currentChartDescriptor];
  double v6 = [v5 volumeAxisDescriptor];

  if (v6)
  {
    [(AXMDataSonifier *)self maximumToneVolume];
    double v8 = v7;
    [(AXMDataSonifier *)self minimumToneVolume];
    double v10 = v9;
    [v6 lowerBound];
    double v12 = v11;
    [v6 upperBound];
    [(AXMDataSonifier *)self normalizedValueForValue:a3 min:v12 max:v13];
    double v15 = v14;
    [(AXMDataSonifier *)self minimumToneVolume];
    double v17 = v16;
    [(AXMDataSonifier *)self minimumToneVolume];
    double v19 = v18;
    [(AXMDataSonifier *)self maximumToneVolume];
    double v21 = AXMClampDouble(v17 + v15 * (v8 - v10), v19, v20);
  }
  else
  {
    double v21 = 1.0;
  }

  return v21;
}

- (double)durationForDurationEncodingValue:(double)a3
{
  long double v5 = [(AXMDataSonifier *)self currentChartDescriptor];
  double v6 = [v5 durationAxisDescriptor];

  [v6 lowerBound];
  double v8 = v7;
  [v6 upperBound];
  [(AXMDataSonifier *)self normalizedValueForValue:a3 min:v8 max:v9];
  double v11 = v10;
  [(AXMDataSonifier *)self maximumDiscreteToneLength];
  double v13 = v12;
  [(AXMDataSonifier *)self minimumDiscreteToneLength];
  double v15 = v14;
  [(AXMDataSonifier *)self minimumDiscreteToneLength];
  double v17 = v16;
  [(AXMDataSonifier *)self minimumDiscreteToneLength];
  double v19 = v18;
  [(AXMDataSonifier *)self maximumDiscreteToneLength];
  double v21 = AXMClampDouble(v11 * ((v13 - v15) * 1000.0) + v17 * 1000.0, v19 * 1000.0, v20 * 1000.0);

  return v21;
}

- (BOOL)series:(id)a3 hasContinuousPitchDataForTimePosition:(double)a4
{
  id v6 = a3;
  double v7 = [(AXMDataSonifier *)self currentChartDescriptor];
  double v8 = [v7 timeAxisDescriptor];

  if ([v8 isCategoricalAxis])
  {
    BOOL v9 = 1;
  }
  else
  {
    [v8 lowerBound];
    double v11 = v10;
    [v8 upperBound];
    [(AXMDataSonifier *)self valueFromNormalizedValue:a4 min:v11 max:v12];
    double v14 = v13;
    if ([v6 isContinuous])
    {
      [v6 minimumDataValueOnTimeAxis];
      double v16 = v15;
      [v6 maximumDataValueOnTimeAxis];
      BOOL v9 = v14 <= v17 && v16 <= v14;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)beginLiveContinuousToneSession
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "error starting audio output: %@", buf, 0xCu);
}

- (void)endLiveContinuousToneSession
{
  double v3 = [(AXMDataSonifier *)self liveContinuousMixerDataSource];
  [v3 removeAllDataSources];

  self->_isInLiveContinuousToneSession = 0;
  engine = self->_engine;

  [(AVAudioEngine *)engine stop];
}

- (void)setLiveContinuousToneNormalizedFrequency:(double)a3
{
  [(AXMDataSonifier *)self minimumPlaybackFrequency];
  double v6 = log2(v5);
  [(AXMDataSonifier *)self maximumPlaybackFrequency];
  long double v8 = log2(v7);
  double v9 = exp2(v6 + a3 * (v8 - v6));
  id v10 = [(AXMDataSonifier *)self liveContinuousDataTone];
  [v10 setBaseFrequency:v9];
}

- (void)_peakNormalizeBuffer:(void *)a3 length:(unint64_t)a4 level:(double)a5
{
  long double v5 = *(int **)a3;
  uint64_t v6 = *((void *)a3 + 1) - *(void *)a3;
  if (v6)
  {
    int v7 = 0;
    unint64_t v8 = v6 >> 2;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    double v9 = *(int **)a3;
    unint64_t v10 = v8;
    do
    {
      int v12 = *v9++;
      int v11 = v12;
      if (v12 > v7) {
        int v7 = v11;
      }
      --v10;
    }
    while (v10);
    do
    {
      int *v5 = (int)((double)(int)((double)*v5 / ((double)v7 / 32500.0)) * a5);
      ++v5;
      --v8;
    }
    while (v8);
  }
}

- (id)_newContinuousToneEnvelope
{
  double v2 = [AXMADSREnvelope alloc];

  return [(AXMADSREnvelope *)v2 initWithAttackDuration:500.0 attackLevel:1.0 decayDuration:0.0 sustainDuration:1.0 sustainLevel:1.0 releaseDuration:50.0];
}

- (void)_regenerateTimeEncodingValuesForDataPoints
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  double v3 = [(AXMDataSonifier *)self currentChartDescriptor];
  id v4 = [v3 timeCategoricalAxisDescriptor];

  long double v5 = [(AXMDataSonifier *)self currentChartDescriptor];
  uint64_t v37 = [v5 timeNumericAxisDescriptor];

  uint64_t v6 = [v4 categoryOrder];
  uint64_t v7 = [v6 count];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  unint64_t v8 = [(AXMDataSonifier *)self currentChartDescriptor];
  double v9 = [v8 series];

  obuint64_t j = v9;
  uint64_t v34 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v43;
    double v10 = (double)v7;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v36 = [v11 dataPoints];
        uint64_t v12 = [v36 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v39 != v13) {
                objc_enumerationMutation(v36);
              }
              double v15 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              if (v4)
              {
                double v16 = [v4 categoryOrder];
                double v17 = [v15 timeEncodingValue];
                double v18 = [v17 category];
                uint64_t v19 = [v16 indexOfObject:v18];

                if (v19 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  [(AXMDataSonifier *)self normalizedValueForValue:(double)v19 min:0.0 max:v10];
                  double v21 = v20;
                  [(AXMDataSonifier *)self playbackDuration];
                  [v15 setPlaybackTimeOffsetMS:v21 * v22];
                }
              }
              else
              {
                double v23 = [*(id *)(*((void *)&v38 + 1) + 8 * j) timeEncodingValue];
                [v23 number];
                double v25 = v24;

                [v37 lowerBound];
                double v27 = v26;
                [v37 upperBound];
                [(AXMDataSonifier *)self normalizedValueForValue:v25 min:v27 max:v28];
                double v30 = v29;
                [(AXMDataSonifier *)self playbackDuration];
                [v15 setPlaybackTimeOffsetMS:v30 * v31];
              }
            }
            uint64_t v12 = [v36 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v12);
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v34);
  }
}

- (AXMDataSeriesDescriptor)currentSeries
{
  if ([(AXMDataSonifier *)self currentSeriesIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_2;
  }
  unint64_t v4 = [(AXMDataSonifier *)self currentSeriesIndex];
  long double v5 = [(AXMDataSonifier *)self currentChartDescriptor];
  uint64_t v6 = [v5 series];
  unint64_t v7 = [v6 count];

  if (v4 >= v7)
  {
    int64_t v11 = [(AXMDataSonifier *)self currentSeriesIndex];
    uint64_t v12 = [(AXMDataSonifier *)self currentChartDescriptor];
    uint64_t v13 = [v12 series];
    uint64_t v14 = [v13 count];

    if (v11 != v14)
    {
LABEL_2:
      double v3 = 0;
      goto LABEL_8;
    }
    unint64_t v8 = [(AXMDataSonifier *)self currentChartDescriptor];
    double v9 = [v8 series];
    uint64_t v10 = [v9 lastObject];
  }
  else
  {
    unint64_t v8 = [(AXMDataSonifier *)self currentChartDescriptor];
    double v9 = [v8 series];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex"));
  }
  double v3 = (void *)v10;

LABEL_8:

  return (AXMDataSeriesDescriptor *)v3;
}

- (BOOL)containsMultipleSeries
{
  double v2 = [(AXMDataSonifier *)self currentChartDescriptor];
  double v3 = [v2 series];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)shouldIncrementToPitch:(double)a3 by:(double)a4
{
  [(AVAudioUnitTimePitch *)self->_pitchShifter pitch];
  double v7 = v6 + a4;
  if (a4 >= 0.0) {
    return v7 < a3 + a4;
  }
  else {
    return v7 > a3 + a4;
  }
}

- (double)minimumPlaybackFrequency
{
  return self->_minimumPlaybackFrequency;
}

- (void)setMinimumPlaybackFrequency:(double)a3
{
  self->_minimumPlaybackFrequency = a3;
}

- (double)maximumPlaybackFrequency
{
  return self->_maximumPlaybackFrequency;
}

- (void)setMaximumPlaybackFrequency:(double)a3
{
  self->_maximumPlaybackFrequency = a3;
}

- (BOOL)usesBinauralPanning
{
  return self->_usesBinauralPanning;
}

- (void)setUsesBinauralPanning:(BOOL)a3
{
  self->_usesBinauralPanning = a3;
}

- (int)dataMode
{
  return self->_dataMode;
}

- (id)function
{
  return self->_function;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)isEndingScrubbing
{
  return self->_isEndingScrubbing;
}

- (int)interpolationMode
{
  return self->_interpolationMode;
}

- (AXMLiveContinuousSynth)continuousScrubbingTone
{
  return self->_continuousScrubbingTone;
}

- (BOOL)isInLiveContinuousToneSession
{
  return self->_isInLiveContinuousToneSession;
}

- (AXMChartDescriptor)currentChartDescriptor
{
  return self->_currentChartDescriptor;
}

- (int64_t)currentSeriesIndex
{
  return self->_currentSeriesIndex;
}

- (NSTimer)playbackObserverUpdateTimer
{
  return self->_playbackObserverUpdateTimer;
}

- (void)setPlaybackObserverUpdateTimer:(id)a3
{
}

- (AXMAudioDataSourceMixer)playbackMixerDataSource
{
  return self->_playbackMixerDataSource;
}

- (void)setPlaybackMixerDataSource:(id)a3
{
}

- (AXMAudioDataSource)playbackChartDataAudioDataSource
{
  return self->_playbackChartDataAudioDataSource;
}

- (void)setPlaybackChartDataAudioDataSource:(id)a3
{
}

- (AXMAudioDataSource)playbackTrendlineAudioDataSource
{
  return self->_playbackTrendlineAudioDataSource;
}

- (void)setPlaybackTrendlineAudioDataSource:(id)a3
{
}

- (AXMAudioDataSourceMixer)scrubbingMixerDataSource
{
  return self->_scrubbingMixerDataSource;
}

- (void)setScrubbingMixerDataSource:(id)a3
{
}

- (AXMAudioDataSource)scrubbingDiscreteAudioDataSource
{
  return self->_scrubbingDiscreteAudioDataSource;
}

- (void)setScrubbingDiscreteAudioDataSource:(id)a3
{
}

- (AXMAudioDataSource)scrubbingContinuousAudioDataSource
{
  return self->_scrubbingContinuousAudioDataSource;
}

- (void)setScrubbingContinuousAudioDataSource:(id)a3
{
}

- (AXMAudioDataSource)scrubbingTrendlineAudioDataSource
{
  return self->_scrubbingTrendlineAudioDataSource;
}

- (void)setScrubbingTrendlineAudioDataSource:(id)a3
{
}

- (AXMAudioDataSourceMixer)liveContinuousMixerDataSource
{
  return self->_liveContinuousMixerDataSource;
}

- (void)setLiveContinuousMixerDataSource:(id)a3
{
}

- (AXMAudioDataSource)liveContinuousAudioDataSource
{
  return self->_liveContinuousAudioDataSource;
}

- (void)setLiveContinuousAudioDataSource:(id)a3
{
}

- (NSPointerArray)playbackObservers
{
  return self->_playbackObservers;
}

- (void)setPlaybackObservers:(id)a3
{
}

- (AXMLiveContinuousSynth)trendlineScrubbingTone
{
  return self->_trendlineScrubbingTone;
}

- (AXMLiveContinuousSynth)liveContinuousDataTone
{
  return self->_liveContinuousDataTone;
}

- (id)trendlineFunction
{
  return self->_trendlineFunction;
}

- (void)setTrendlineFunction:(id)a3
{
}

- (void)scrubbingDiscreteDataRenderingContext
{
  return self->_scrubbingDiscreteDataRenderingContext;
}

- (void)scrubbingPlaybackCallbackRenderingContext
{
  return self->_scrubbingPlaybackCallbackRenderingContext;
}

- (void)liveTonePlaybackCallbackRenderingContext
{
  return self->_liveTonePlaybackCallbackRenderingContext;
}

- (unint64_t)playbackSampleCount
{
  return self->_playbackSampleCount;
}

- (NSMutableOrderedSet)dataCategories
{
  return self->_dataCategories;
}

- (double)minimumDiscreteToneLength
{
  return self->_minimumDiscreteToneLength;
}

- (void)setMinimumDiscreteToneLength:(double)a3
{
  self->_minimumDiscreteToneLength = a3;
}

- (double)maximumDiscreteToneLength
{
  return self->_maximumDiscreteToneLength;
}

- (void)setMaximumDiscreteToneLength:(double)a3
{
  self->_maximumDiscreteToneLength = a3;
}

- (double)minimumToneVolume
{
  return self->_minimumToneVolume;
}

- (void)setMinimumToneVolume:(double)a3
{
  self->_minimumToneVolume = a3;
}

- (double)maximumToneVolume
{
  return self->_maximumToneVolume;
}

- (void)setMaximumToneVolume:(double)a3
{
  self->_maximumToneVolume = a3;
}

- (AVAudioSourceNode)audioSourceNode
{
  return self->_audioSourceNode;
}

- (void)setAudioSourceNode:(id)a3
{
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVAudioEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (AVAudioUnitEffect)compressor
{
  return self->_compressor;
}

- (void)setCompressor:(id)a3
{
}

- (AVAudioUnitEffect)limiter
{
  return self->_limiter;
}

- (void)setLimiter:(id)a3
{
}

- (AVAudioEnvironmentNode)stereoPanner
{
  return self->_stereoPanner;
}

- (void)setStereoPanner:(id)a3
{
}

- (AVAudioUnitEQ)lowpassFilter
{
  return self->_lowpassFilter;
}

- (void)setLowpassFilter:(id)a3
{
}

- (AVAudioUnitTimePitch)pitchShifter
{
  return self->_pitchShifter;
}

- (void)setPitchShifter:(id)a3
{
}

- (NSTimer)keyPitchUpdateTimer
{
  return self->_keyPitchUpdateTimer;
}

- (void)setKeyPitchUpdateTimer:(id)a3
{
}

- (NSArray)keyPitches
{
  return self->_keyPitches;
}

- (void)setKeyPitches:(id)a3
{
}

- (double)currentPlaybackTime
{
  return self->_currentPlaybackTime;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  self->_double currentPlaybackTime = a3;
}

- (BOOL)needsRenderSonification
{
  return self->_needsRenderSonification;
}

- (void)setNeedsRenderSonification:(BOOL)a3
{
  self->_needsRenderSonification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPitches, 0);
  objc_storeStrong((id *)&self->_keyPitchUpdateTimer, 0);
  objc_storeStrong((id *)&self->_pitchShifter, 0);
  objc_storeStrong((id *)&self->_lowpassFilter, 0);
  objc_storeStrong((id *)&self->_stereoPanner, 0);
  objc_storeStrong((id *)&self->_limiter, 0);
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_audioSourceNode, 0);
  objc_storeStrong((id *)&self->_dataCategories, 0);
  objc_storeStrong(&self->_trendlineFunction, 0);
  objc_storeStrong((id *)&self->_liveContinuousDataTone, 0);
  objc_storeStrong((id *)&self->_trendlineScrubbingTone, 0);
  objc_storeStrong((id *)&self->_playbackObservers, 0);
  objc_storeStrong((id *)&self->_liveContinuousAudioDataSource, 0);
  objc_storeStrong((id *)&self->_liveContinuousMixerDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingTrendlineAudioDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingContinuousAudioDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingDiscreteAudioDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingMixerDataSource, 0);
  objc_storeStrong((id *)&self->_playbackTrendlineAudioDataSource, 0);
  objc_storeStrong((id *)&self->_playbackChartDataAudioDataSource, 0);
  objc_storeStrong((id *)&self->_playbackMixerDataSource, 0);
  objc_storeStrong((id *)&self->_playbackObserverUpdateTimer, 0);
  objc_storeStrong((id *)&self->_currentChartDescriptor, 0);
  objc_storeStrong((id *)&self->_continuousScrubbingTone, 0);
  objc_storeStrong(&self->_function, 0);

  objc_storeStrong((id *)&self->buffer, 0);
}

@end