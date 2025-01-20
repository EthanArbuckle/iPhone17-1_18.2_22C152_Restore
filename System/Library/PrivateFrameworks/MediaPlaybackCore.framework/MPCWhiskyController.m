@interface MPCWhiskyController
- (BOOL)shouldAttachAudioTapToItem:(id)a3;
- (MPCRecordingSession)recordingSession;
- (MPCVocalAttenuationModelProvider)modelProvider;
- (MPCVocalAttenuationPolicyController)policyController;
- (MPCVocalAttenuationProcessor)processor;
- (MPCWhiskyController)initWithPlaybackEngine:(id)a3;
- (MPCWhiskyController)initWithPlaybackEngine:(id)a3 modelProvider:(id)a4 processor:(id)a5;
- (MSVTimer)shutdownTimer;
- (NSString)description;
- (NSString)modelID;
- (double)renderingTimeLimit;
- (float)_processorLevelForVocalLevel:(float)a3;
- (float)_vocalLevelForProcessorLevel:(float)a3;
- (id)blockingPolicy;
- (unsigned)creationFlags;
- (void)_emitStatisticsEvent;
- (void)_loadModel;
- (void)_tearDownTapData;
- (void)_updateShutdownSequence;
- (void)_updateState:(int64_t)a3;
- (void)dealloc;
- (void)engine:(id)a3 didChangeToState:(unint64_t)a4;
- (void)engine:(id)a3 willChangeToItem:(id)a4 fromItem:(id)a5;
- (void)engineDidReceiveMediaServicesPurge:(id)a3;
- (void)engineDidResetMediaServices:(id)a3;
- (void)finalizeTap:(opaqueMTAudioProcessingTap *)a3;
- (void)isEnabled;
- (void)isVocalAttenuationAvailable;
- (void)prepareForProcessing;
- (void)prepareTap:(opaqueMTAudioProcessingTap *)a3 maxFrames:(int64_t)a4 processingFormat:(const AudioStreamBasicDescription *)a5;
- (void)processTap:(opaqueMTAudioProcessingTap *)a3 sampleIndex:(int64_t)a4 numberFrames:(int64_t)a5 flags:(unsigned int)a6 audioBufferList:(AudioBufferList *)a7 numberFramesOut:(int64_t *)a8 flagsOut:(unsigned int *)a9;
- (void)setEnabled:(void *)a1;
- (void)setShutdownTimer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)unprepareTap:(opaqueMTAudioProcessingTap *)a3;
- (void)vocalAttenuationPolicyControllerDidChange:(id)a3;
@end

@implementation MPCWhiskyController

uint64_t __70__MPCWhiskyController_initWithPlaybackEngine_modelProvider_processor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadModel];
}

- (void)isVocalAttenuationAvailable
{
  if (result)
  {
    v1 = [result processor];
    uint64_t v2 = [v1 isAvailable];

    return (void *)v2;
  }
  return result;
}

- (MPCWhiskyController)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(MPCWhiskyController *)self initWithPlaybackEngine:v4 modelProvider:v5 processor:v6];

  return v7;
}

- (MPCWhiskyController)initWithPlaybackEngine:(id)a3 modelProvider:(id)a4 processor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)MPCWhiskyController;
  v11 = [(MPCSingleTrackAudioProcessor *)&v39 initWithPlaybackEngine:v8];
  v12 = v11;
  if (v11)
  {
    v11->_state = 0;
    p_modelProvider = (void **)&v11->_modelProvider;
    objc_storeStrong((id *)&v11->_modelProvider, a4);
    p_processor = (id *)&v12->_processor;
    objc_storeStrong((id *)&v12->_processor, a5);
    [v8 addEngineObserver:v12];
    v15 = [MEMORY[0x263F12178] standardUserDefaults];
    [v15 minVocalLevel];
    v12->_minVocalLevel = v16;

    v12->_maxVocalLevel = 100.0;
    v17 = [MEMORY[0x263F12178] standardUserDefaults];
    [v17 defaultVocalLevel];
    v12->_vocalLevel = v18;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAControllerSetupQueue", 0);
    setupQueue = v12->_setupQueue;
    v12->_setupQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = objc_opt_new();
    v22 = *p_modelProvider;
    *p_modelProvider = (void *)v21;

    v23 = [MPCVocalAttenuationProcessorImplementation alloc];
    if (v23)
    {
      float v24 = 100.0 - v12->_minVocalLevel;
      v25 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:1 sampleRate:2 channels:0 interleaved:44100.0];
      uint64_t v26 = [v25 streamDescription];
      long long v27 = *(_OWORD *)v26;
      long long v28 = *(_OWORD *)(v26 + 16);
      uint64_t v41 = *(void *)(v26 + 32);
      v40[0] = v27;
      v40[1] = v28;
      *(float *)&long long v27 = v24;
      v23 = [(MPCVocalAttenuationProcessorImplementation *)v23 initWithMaxAttenuationLevel:v40 audioFormat:0x2000 maxFrames:*(double *)&v27];
    }
    id v29 = *p_processor;
    id *p_processor = v23;

    v30 = objc_opt_new();
    v31 = [MEMORY[0x263F89110] sharedMonitor];
    [v30 setThermalMonitor:v31];

    v32 = [MEMORY[0x263F08AB0] processInfo];
    [v30 setLowPowerModeMonitor:v32];

    [*p_processor renderingLimit];
    objc_msgSend(v30, "setRenderingTimeLimit:");
    v33 = [[MPCVocalAttenuationPolicyController alloc] initWithDelegate:v12 parameters:v30];
    policyController = v12->_policyController;
    v12->_policyController = v33;

    v35 = v12->_setupQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__MPCWhiskyController_initWithPlaybackEngine_modelProvider_processor___block_invoke;
    block[3] = &unk_2643C5FC8;
    v38 = v12;
    dispatch_async(v35, block);
  }
  return v12;
}

- (void)engine:(id)a3 willChangeToItem:(id)a4 fromItem:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && ([v8 isPlaceholder] & 1) == 0)
  {
    id v10 = [(MPCWhiskyController *)self processor];
    [v10 resetAudioUnit];

    v11 = [(MPCWhiskyController *)self recordingSession];
    [v11 save];

    [(MPCWhiskyController *)self _emitStatisticsEvent];
  }
}

- (void)_emitStatisticsEvent
{
  v25[6] = *MEMORY[0x263EF8340];
  v3 = [(MPCWhiskyController *)self recordingSession];
  id v4 = [v3 currentRecorder];
  int v5 = [v4 numberOfSamples];

  if (v5)
  {
    v6 = [(MPCWhiskyController *)self recordingSession];
    v7 = [v6 currentRecorder];
    id v8 = [v7 dictionaryRepresentation];

    v23 = [(MPCSingleTrackAudioProcessor *)self playbackEngine];
    id v9 = [v23 eventStream];
    v24[0] = @"vocal-attenuation-statistics-mean";
    v22 = [v8 objectForKeyedSubscript:@"mean"];
    v25[0] = v22;
    v24[1] = @"vocal-attenuation-statistics-max";
    uint64_t v21 = [v8 objectForKeyedSubscript:@"max"];
    v25[1] = v21;
    v24[2] = @"vocal-attenuation-statistics-stdev";
    v20 = [v8 objectForKeyedSubscript:@"sigma"];
    v25[2] = v20;
    v24[3] = @"vocal-attenuation-statistics-glitches";
    id v10 = [v8 objectForKeyedSubscript:@"glitches"];
    v25[3] = v10;
    v24[4] = @"vocal-attenuation-statistics-samples";
    v11 = NSNumber;
    id v12 = [(MPCWhiskyController *)self recordingSession];
    v13 = [v12 currentRecorder];
    v14 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "numberOfSamples"));
    v25[4] = v14;
    v24[5] = @"vocal-attenuation-statistics-thermal";
    v15 = NSNumber;
    float v16 = [(MPCWhiskyController *)self recordingSession];
    v17 = [v16 currentRecorder];
    float v18 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v17, "thermalLevel"));
    v25[5] = v18;
    dispatch_queue_t v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6];
    [v9 emitEventType:@"vocal-attenuation-statistics" payload:v19];
  }
}

- (MPCRecordingSession)recordingSession
{
  return self->_recordingSession;
}

void __36__MPCWhiskyController__updateState___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) playbackEngine];
  [v3 setVocalAttenuationEnabled:-[MPCWhiskyController isEnabled](*(void **)(a1 + 32))];
  uint64_t v2 = [v3 eventObserver];
  [v2 engineDidChangeVocalAttenuationState:v3];
}

- (void)isEnabled
{
  if (result)
  {
    v1 = [result processor];
    uint64_t v2 = [v1 isEnabled];

    return (void *)v2;
  }
  return result;
}

- (NSString)description
{
  uint64_t v2 = (uint64_t)self;
  if (self)
  {
    switch(self->_state)
    {
      case 0:
      case 1:
        id v3 = NSString;
        uint64_t v4 = objc_opt_class();
        v7 = @"not loaded";
        switch(*(void *)(v2 + 72))
        {
          case 0:
            goto LABEL_38;
          case 1:
            v7 = @"loading model";
            break;
          case 2:
            v7 = @"model ready";
            break;
          case 3:
            v7 = @"loading processor";
            break;
          case 4:
            v7 = @"ready";
            break;
          case 5:
            v7 = @"enabled";
            break;
          case 6:
            v7 = @"disabled";
            break;
          case 7:
            v7 = @"unloading";
            break;
          case 8:
            v7 = @"unavailable";
            break;
          default:
            objc_msgSend(cfstr_PublisherHasNo.isa, "stringWithFormat:", @"undefined/%ld", *(void *)(v2 + 72));
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        goto LABEL_38;
      case 2:
      case 3:
      case 7:
        id v3 = NSString;
        uint64_t v4 = objc_opt_class();
        unint64_t v5 = *(void *)(v2 + 72);
        BOOL v6 = v5 >= 9;
        goto LABEL_4;
      case 4:
      case 5:
      case 6:
        id v8 = NSString;
        uint64_t v9 = objc_opt_class();
        unint64_t v10 = *(void *)(v2 + 72);
        if (v10 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", *(void *)(v2 + 72));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = off_2643BF190[v10];
        }
        v11 = [(id)v2 modelProvider];
        unint64_t v18 = [v11 state];
        if (v18 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v18);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_2643BF1D8[v18];
        }
        v14 = [(id)v2 processor];
        unint64_t v19 = [v14 state];
        if (v19 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v19);
          float v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          float v16 = off_2643BF1F8[v19];
        }
        v17 = [*(id *)(v2 + 96) modelName];
        [v8 stringWithFormat:@"<%p - %@> - %@ [M:%@ P:%@] - model: %@ - level: %3.2f", v2, v9, v7, v13, v16, v17, *(float *)(v2 + 40)];
        goto LABEL_26;
      case 8:
        v20 = [(MPCWhiskyController *)self modelProvider];
        uint64_t v21 = [v20 model];

        id v3 = NSString;
        uint64_t v4 = objc_opt_class();
        unint64_t v5 = *(void *)(v2 + 72);
        BOOL v6 = v5 >= 9;
        if (v21)
        {
LABEL_4:
          if (v6)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v5);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = off_2643BF190[v5];
          }
          v11 = [(id)v2 modelProvider];
          unint64_t v12 = [v11 state];
          if (v12 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v12);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = off_2643BF1D8[v12];
          }
          v14 = [(id)v2 processor];
          unint64_t v15 = [v14 state];
          if (v15 >= 6)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v15);
            float v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            float v16 = off_2643BF1F8[v15];
          }
          v17 = [*(id *)(v2 + 96) modelName];
          [v3 stringWithFormat:@"<%p - %@> - %@ [M:%@ P:%@] - model: %@", v2, v4, v7, v13, v16, v17, v27];
          uint64_t v2 = LABEL_26:;

          goto LABEL_46;
        }
        if (v5 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", *(void *)(v2 + 72));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = off_2643BF190[v5];
        }
        v11 = [(id)v2 modelProvider];
        unint64_t v26 = [v11 state];
        if (v26 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v26);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_2643BF1D8[v26];
        }
        v14 = [(id)v2 processor];
        unint64_t v23 = [v14 state];
        if (v23 >= 6)
        {
          float v24 = NSString;
          goto LABEL_44;
        }
        break;
      default:
        goto LABEL_47;
    }
  }
  else
  {
    id v3 = NSString;
    uint64_t v4 = objc_opt_class();
    v7 = @"not loaded";
LABEL_38:
    v11 = [(id)v2 modelProvider];
    unint64_t v22 = [v11 state];
    if (v22 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", v22);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_2643BF1D8[v22];
    }
    v14 = [(id)v2 processor];
    unint64_t v23 = [v14 state];
    if (v23 >= 6)
    {
      float v24 = NSString;
LABEL_44:
      objc_msgSend(v24, "stringWithFormat:", @"undefined/%ld", v23);
      float v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
  }
  float v16 = off_2643BF1F8[v23];
LABEL_45:
  uint64_t v2 = [v3 stringWithFormat:@"<%p - %@> - %@ [M:%@ P:%@]", v2, v4, v7, v13, v16];
LABEL_46:

LABEL_47:

  return (NSString *)(id)v2;
}

- (MPCVocalAttenuationProcessor)processor
{
  return self->_processor;
}

- (MPCVocalAttenuationModelProvider)modelProvider
{
  return self->_modelProvider;
}

void __33__MPCWhiskyController__loadModel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if (a2 == 2)
  {
    id v6 = v5;
    v7 = *(void **)(a1 + 32);
    if (!v6)
    {
      uint64_t v8 = 2;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
  }
  uint64_t v8 = 8;
LABEL_6:
  [v7 _updateState:v8];
}

- (void)_loadModel
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Loading model", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_setupQueue);
  [(MPCWhiskyController *)self _updateState:1];
  uint64_t v4 = [(MPCWhiskyController *)self modelProvider];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__MPCWhiskyController__loadModel__block_invoke;
  v5[3] = &unk_2643BF170;
  v5[4] = self;
  [v4 prepareWithCompletion:v5];
}

- (void)_updateState:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t state = self->_state;
  if (state == a3) {
    return;
  }
  self->_unint64_t state = a3;
  if (a3 == 6)
  {
    if (self->_recordingSession)
    {
      unint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        if (state >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", state);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = off_2643BF190[state];
        }
        unint64_t v22 = [(MPCRecordingSession *)self->_recordingSession sessionID];
        *(_DWORD *)buf = 138544130;
        long long v28 = self;
        __int16 v29 = 2114;
        v30 = v20;
        __int16 v31 = 2114;
        v32 = @"disabled";
        __int16 v33 = 2114;
        v34 = v22;
        _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - State changed: %{public}@ -> %{public}@ - Flushing recording session: %{public}@", buf, 0x2Au);
      }
      [(MPCWhiskyController *)self _emitStatisticsEvent];
      [(MPCRecordingSession *)self->_recordingSession flush];
      recordingSession = self->_recordingSession;
      self->_recordingSession = 0;
      goto LABEL_16;
    }
  }
  else if (a3 == 5)
  {
    id v6 = [MPCRecordingSession alloc];
    v7 = [(MPCWhiskyController *)self modelID];
    uint64_t v8 = [(MPCWhiskyController *)self processor];
    [v8 sampleTime];
    double v10 = v9;
    v11 = [(MPCWhiskyController *)self processor];
    [v11 renderingLimit];
    double v13 = v12;
    v14 = [MEMORY[0x263F12178] standardUserDefaults];
    unint64_t v15 = -[MPCRecordingSession initWithModelID:samplingTime:renderingLimit:shouldRecordSamples:](v6, "initWithModelID:samplingTime:renderingLimit:shouldRecordSamples:", v7, [v14 shouldRecordVocalAttenuationStatistics], v10, v13);
    float v16 = self->_recordingSession;
    self->_recordingSession = v15;

    recordingSession = (MPCRecordingSession *)os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(&recordingSession->super, OS_LOG_TYPE_INFO))
    {
      if (state >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", state);
        unint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v18 = off_2643BF190[state];
      }
      uint64_t v21 = [(MPCRecordingSession *)self->_recordingSession sessionID];
      *(_DWORD *)buf = 138544130;
      long long v28 = self;
      __int16 v29 = 2114;
      v30 = v18;
      __int16 v31 = 2114;
      v32 = @"enabled";
      __int16 v33 = 2114;
      v34 = v21;
      _os_log_impl(&dword_21BB87000, &recordingSession->super, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - State changed: %{public}@ -> %{public}@ - New recording session: %{public}@", buf, 0x2Au);
    }
LABEL_16:
  }
  unint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    if (state >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", state);
      float v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      float v24 = off_2643BF190[state];
    }
    v25 = v24;
    if ((unint64_t)a3 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"undefined/%ld", a3);
      unint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v26 = off_2643BF190[a3];
    }
    *(_DWORD *)buf = 138543874;
    long long v28 = self;
    __int16 v29 = 2114;
    v30 = v25;
    __int16 v31 = 2114;
    v32 = v26;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - State changed: %{public}@ -> %{public}@", buf, 0x20u);
  }
  msv_dispatch_on_main_queue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownTimer, 0);
  objc_storeStrong((id *)&self->_policyController, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_modelProvider, 0);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_disabledState, 0);
  objc_storeStrong((id *)&self->_shutdownSequenceStartDate, 0);

  objc_storeStrong((id *)&self->_setupQueue, 0);
}

- (void)setShutdownTimer:(id)a3
{
}

- (MSVTimer)shutdownTimer
{
  return self->_shutdownTimer;
}

- (MPCVocalAttenuationPolicyController)policyController
{
  return self->_policyController;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (void)engineDidReceiveMediaServicesPurge:(id)a3
{
  [(MPCWhiskyController *)self _tearDownTapData];

  [(MPCSingleTrackAudioProcessor *)self recreateAudioTap];
}

- (void)engineDidResetMediaServices:(id)a3
{
  [(MPCWhiskyController *)self _tearDownTapData];

  [(MPCSingleTrackAudioProcessor *)self recreateAudioTap];
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  if (a4 <= 4 && ((1 << a4) & 0x15) != 0)
  {
    id v5 = [(MPCWhiskyController *)self recordingSession];
    [v5 save];
  }

  [(MPCWhiskyController *)self _updateShutdownSequence];
}

- (void)vocalAttenuationPolicyControllerDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [MPCWhiskyControllerDisabledState alloc];
  id v6 = [v4 blockingEvaluation];

  v7 = [(MPCWhiskyControllerDisabledState *)v5 initWithPolicyEvaluation:v6];
  disabledState = self->_disabledState;
  self->_disabledState = v7;

  double v9 = [(MPCSingleTrackAudioProcessor *)self playbackEngine];
  double v10 = self->_disabledState;
  id v13 = v9;
  v11 = [v9 eventObserver];
  double v12 = v11;
  if (v10) {
    [v11 engineDidBlockVocalAttenuation:v13];
  }
  else {
    [v11 engineDidUnblockVocalAttenuation:v13];
  }
}

- (void)_updateShutdownSequence
{
  id v3 = [(MPCWhiskyController *)self shutdownTimer];

  if (v3)
  {
    id v4 = [(MPCWhiskyController *)self shutdownTimer];
    [v4 invalidate];

    [(MPCWhiskyController *)self setShutdownTimer:0];
  }
  if (-[MPCWhiskyController isEnabled](self))
  {
    id v5 = [(MPCSingleTrackAudioProcessor *)self playbackEngine];
    id v6 = [v5 player];
    unint64_t v7 = [v6 state];

    if (v7 <= 6 && ((1 << v7) & 0x43) != 0)
    {
      objc_initWeak(&location, self);
      uint64_t v8 = (void *)MEMORY[0x263F54F58];
      double v9 = [MEMORY[0x263F12178] standardUserDefaults];
      [v9 vocalAttenuationGracePeriodAfterPause];
      double v11 = v10;
      uint64_t v12 = MEMORY[0x263EF83A0];
      id v13 = MEMORY[0x263EF83A0];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __46__MPCWhiskyController__updateShutdownSequence__block_invoke;
      unint64_t v18 = &unk_2643C5FF0;
      objc_copyWeak(&v19, &location);
      v14 = [v8 timerWithInterval:0 repeats:v12 queue:&v15 block:v11];
      -[MPCWhiskyController setShutdownTimer:](self, "setShutdownTimer:", v14, v15, v16, v17, v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

void __46__MPCWhiskyController__updateShutdownSequence__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543362;
      id v4 = WeakRetained;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Disabling Vocal Attenuation [paused for a while]", (uint8_t *)&v3, 0xCu);
    }

    -[MPCWhiskyController setEnabled:](WeakRetained, 0);
  }
}

- (void)setEnabled:(void *)a1
{
  if (a1)
  {
    id v4 = [a1 processor];
    int v5 = [v4 isAvailable];

    if (v5)
    {
      id v6 = [a1 processor];
      [v6 setEnabled:a2];

      unint64_t v7 = [a1 processor];
      if ([v7 isEnabled]) {
        uint64_t v8 = 5;
      }
      else {
        uint64_t v8 = 6;
      }
      [a1 _updateState:v8];

      [a1 _updateShutdownSequence];
    }
  }
}

- (float)_vocalLevelForProcessorLevel:(float)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  float minVocalLevel = self->_minVocalLevel;
  float maxVocalLevel = self->_maxVocalLevel;
  [(MPCVocalAttenuationProcessor *)self->_processor minLevel];
  float v8 = 100.0 - v7;
  [(MPCVocalAttenuationProcessor *)self->_processor maxLevel];
  float v10 = log10f((float)(100.0 - v9) / 100.0) * 20.0;
  float v11 = log10f((float)(100.0 - a3) / v8) * 20.0;
  float v12 = minVocalLevel
      + (float)((float)((float)(maxVocalLevel - minVocalLevel) * (float)(v11 - v10)) / (float)(0.0 - v10));
  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 138544386;
    uint64_t v16 = self;
    __int16 v17 = 2048;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = (float)(100.0 - a3);
    __int16 v21 = 2048;
    double v22 = v11;
    __int16 v23 = 2048;
    double v24 = v12;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Mapping p->au->db->ui: %3.2fp -> %3.2fau -> %3.2fdB -> %3.2fui", (uint8_t *)&v15, 0x34u);
  }

  return v12;
}

- (float)_processorLevelForVocalLevel:(float)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  float minVocalLevel = self->_minVocalLevel;
  float maxVocalLevel = self->_maxVocalLevel;
  [(MPCVocalAttenuationProcessor *)self->_processor minLevel];
  float v8 = 100.0 - v7;
  [(MPCVocalAttenuationProcessor *)self->_processor maxLevel];
  float v10 = log10f((float)(100.0 - v9) / 100.0);
  float v11 = (float)(v10 * 20.0)
      + (float)((float)((float)(0.0 - (float)(v10 * 20.0)) / (float)(maxVocalLevel - minVocalLevel))
              * (float)(a3 - minVocalLevel));
  float v12 = v8 * __exp10f(v11 / 20.0);
  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 138544386;
    uint64_t v16 = self;
    __int16 v17 = 2048;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 2048;
    double v22 = v12;
    __int16 v23 = 2048;
    double v24 = (float)(100.0 - v12);
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Mapping ui->db->au->p: %3.2fui -> %3.2fdB -> %3.2fau -> %3.2fp", (uint8_t *)&v15, 0x34u);
  }

  return 100.0 - v12;
}

- (void)_tearDownTapData
{
  id v2 = [(MPCWhiskyController *)self processor];
  [v2 resetAudioUnit];
}

- (double)renderingTimeLimit
{
  id v2 = [(MPCWhiskyController *)self processor];
  [v2 renderingLimit];
  double v4 = v3;

  return v4;
}

- (id)blockingPolicy
{
  id v2 = [(MPCWhiskyController *)self policyController];
  double v3 = [v2 blockingEvaluation];

  return v3;
}

- (NSString)modelID
{
  id v2 = [(MPCWhiskyController *)self modelProvider];
  double v3 = [v2 modelName];

  return (NSString *)v3;
}

- (void)finalizeTap:(opaqueMTAudioProcessingTap *)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)MPCWhiskyController;
  [(MPCSingleTrackAudioProcessor *)&v5 finalizeTap:a3];
  double v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    float v7 = self;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Finalizing tap", buf, 0xCu);
  }
}

- (void)processTap:(opaqueMTAudioProcessingTap *)a3 sampleIndex:(int64_t)a4 numberFrames:(int64_t)a5 flags:(unsigned int)a6 audioBufferList:(AudioBufferList *)a7 numberFramesOut:(int64_t *)a8 flagsOut:(unsigned int *)a9
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v13 = objc_msgSend(MEMORY[0x263F12178], "standardUserDefaults", a3, a4, a5, *(void *)&a6, a7, a8);
  char v14 = [v13 disableAudioProcessing];

  if ((v14 & 1) == 0)
  {
    int v15 = [(MPCWhiskyController *)self processor];
    int v16 = [v15 isEnabled];

    if (v16)
    {
      __uint64_t v17 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      processor = self->_processor;
      id v29 = 0;
      char v19 = [(MPCVocalAttenuationProcessor *)processor processAudioBuffer:a7 sampleIndex:a4 numberFrames:a5 error:&v29];
      id v20 = v29;
      if ((v19 & 1) == 0)
      {
        __int16 v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          __int16 v31 = self;
          __int16 v32 = 2114;
          id v33 = v20;
          _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Rendering error: %{public}@", buf, 0x16u);
        }
      }
      double v22 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - v17) / 1000000000.0 * 1000.0;
      __int16 v23 = [MPCSample alloc];
      double vocalLevel = self->_vocalLevel;
      uint64_t v25 = [(MPCSingleTrackAudioProcessor *)self playbackEngine];
      unint64_t v26 = [v25 player];
      uint64_t v27 = -[MPCSample initWithLevel:time:state:](v23, "initWithLevel:time:state:", [v26 state], vocalLevel, v22);

      long long v28 = [(MPCWhiskyController *)self recordingSession];
      [v28 recordSample:v27];
    }
  }
}

- (void)unprepareTap:(opaqueMTAudioProcessingTap *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Unpreparing tap", (uint8_t *)&v5, 0xCu);
  }

  [(MPCWhiskyController *)self _tearDownTapData];
}

- (void)prepareTap:(opaqueMTAudioProcessingTap *)a3 maxFrames:(int64_t)a4 processingFormat:(const AudioStreamBasicDescription *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v18[0]) = 138543362;
    *(void *)((char *)v18 + 4) = self;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Preparing tap", (uint8_t *)v18, 0xCu);
  }

  float v9 = [MEMORY[0x263F12178] standardUserDefaults];
  int v10 = [v9 disableAudioProcessing];

  if (v10)
  {
    float v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18[0]) = 138543362;
      *(void *)((char *)v18 + 4) = self;
      float v12 = "[AP] - %{public}@ - Preparing tap - Canceling [audio processing disabled]";
LABEL_12:
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v18, 0xCu);
    }
  }
  else
  {
    id v13 = [(MPCWhiskyController *)self processor];
    int v14 = [v13 isAvailable];

    if (v14)
    {
      int v15 = [(MPCWhiskyController *)self processor];
      long long v16 = *(_OWORD *)&a5->mBytesPerPacket;
      v18[0] = *(_OWORD *)&a5->mSampleRate;
      v18[1] = v16;
      uint64_t v19 = *(void *)&a5->mBitsPerChannel;
      char v17 = [v15 isCompatibleWithAudioFormat:v18 maxFrames:a4];

      if (v17) {
        return;
      }
      float v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v18[0]) = 138543362;
        *(void *)((char *)v18 + 4) = self;
        float v12 = "[AP] - %{public}@ - Preparing tap - Canceling [audio format not compatible with processor]";
        goto LABEL_12;
      }
    }
    else
    {
      float v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v18[0]) = 138543362;
        *(void *)((char *)v18 + 4) = self;
        float v12 = "[AP] - %{public}@ - Preparing tap - Canceling [processor not ready]";
        goto LABEL_12;
      }
    }
  }
}

- (unsigned)creationFlags
{
  if (MSVDeviceIsROSDevice()) {
    return 1;
  }
  else {
    return 9;
  }
}

- (BOOL)shouldAttachAudioTapToItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((-[MPCWhiskyController isVocalAttenuationAvailable](self) & 1) == 0)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      int v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v8 = "[AP] - %{public}@ - Not attaching tap [VA is not available] - item: %{public}@";
      goto LABEL_16;
    }
LABEL_17:
    BOOL v11 = 0;
    goto LABEL_18;
  }
  int v5 = [(MPCWhiskyController *)self processor];
  char v6 = [v5 isAvailable];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      int v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v8 = "[AP] - %{public}@ - Not attaching tap [processor is not ready] - item: %{public}@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (([v4 supportsVocalAttenuation] & 1) == 0)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      int v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v8 = "[AP] - %{public}@ - Not attaching tap [VA not supported] - item: %{public}@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ([v4 loadedAudioAssetType] >= 3)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      int v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v8 = "[AP] - %{public}@ - Not attaching tap [hls playback] - item: %{public}@";
LABEL_16:
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  int v9 = [v4 isDownloadedAsset];
  uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      int v13 = 138543618;
      int v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      uint64_t v8 = "[AP] - %{public}@ - Not attaching tap [download playback] - item: %{public}@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v10)
  {
    int v13 = 138543618;
    int v14 = self;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Attaching tap to %{public}@", (uint8_t *)&v13, 0x16u);
  }
  BOOL v11 = 1;
LABEL_18:

  return v11;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPCWhiskyController;
  [(MPCSingleTrackAudioProcessor *)&v4 dealloc];
}

- (void)prepareForProcessing
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      char v6 = a1;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Preparing for processing", buf, 0xCu);
    }

    if (a1[9] == 2)
    {
      [a1 _updateState:3];
      double v3 = a1[4];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__MPCWhiskyController_prepareForProcessing__block_invoke;
      block[3] = &unk_2643C5FC8;
      void block[4] = a1;
      dispatch_async(v3, block);
    }
  }
}

void __43__MPCWhiskyController_prepareForProcessing__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) processor];
  double v3 = [*(id *)(a1 + 32) modelProvider];
  objc_super v4 = [v3 model];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__MPCWhiskyController_prepareForProcessing__block_invoke_2;
  v5[3] = &unk_2643BF170;
  v5[4] = *(void *)(a1 + 32);
  [v2 prepareWithModel:v4 completion:v5];
}

void __43__MPCWhiskyController_prepareForProcessing__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = v5;
  if (a2 != 2)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
LABEL_5:
    uint64_t v9 = 8;
    goto LABEL_6;
  }
  BOOL v10 = [*(id *)(a1 + 32) processor];
  [v10 maxLevel];
  objc_msgSend(v7, "_vocalLevelForProcessorLevel:");
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = v11;

  float v12 = *(void **)(a1 + 32);
  int v13 = [v12 processor];
  [v13 minLevel];
  objc_msgSend(v12, "_vocalLevelForProcessorLevel:");
  *(_DWORD *)(*(void *)(a1 + 32) + 60) = v14;

  __int16 v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    double v17 = *(float *)(v16 + 56);
    double v18 = *(float *)(v16 + 60);
    int v27 = 138543874;
    uint64_t v28 = v16;
    __int16 v29 = 2048;
    double v30 = v17;
    __int16 v31 = 2048;
    double v32 = v18;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Vocal level range: [%3.2f, %3.2f]", (uint8_t *)&v27, 0x20u);
  }

  uint64_t v19 = [MEMORY[0x263F12178] standardUserDefaults];
  [v19 defaultVocalLevel];
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = v20;

  __int16 v21 = *(_DWORD **)(a1 + 32);
  LODWORD(v22) = v21[10];
  [v21 _processorLevelForVocalLevel:v22];
  int v24 = v23;
  uint64_t v25 = [*(id *)(a1 + 32) processor];
  LODWORD(v26) = v24;
  [v25 setLevel:v26];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = 4;
LABEL_6:
  [v8 _updateState:v9];
}

void __37__MPCWhiskyController_setVocalLevel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackEngine];
  v1 = [v2 eventObserver];
  [v1 engineDidChangeVocalAttenuationLevel:v2];
}

@end