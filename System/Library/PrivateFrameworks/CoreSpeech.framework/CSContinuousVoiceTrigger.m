@interface CSContinuousVoiceTrigger
- (BOOL)hasResetShotAnalyzerBestScore;
- (BOOL)pendingTwoShotDetection;
- (CSAsset)currentAsset;
- (CSAudioRecordContext)audioRecordContext;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSContinuousVoiceTrigger)init;
- (CSContinuousVoiceTriggerConfig)cvtConfig;
- (CSContinuousVoiceTriggerDelegate)delegate;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzer;
- (NSMutableDictionary)lastVoiceTriggerScores;
- (OS_dispatch_queue)queue;
- (float)keywordThreshold;
- (float)twoShotThreshold;
- (int64_t)mode;
- (unint64_t)activeChannel;
- (unint64_t)analyzedSampleCount;
- (unint64_t)heartbeatFactor;
- (unint64_t)triggerEndSampleCount;
- (unint64_t)twoShotDecisionWaitSamples;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5 lastVoiceTriggerScore:(float)a6 phId:(unint64_t)a7;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_shotAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_startDetectTwoShot:(id)a3;
- (void)processAudioSamples:(id)a3;
- (void)resetWithAudioRecordContext:(id)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnalyzedSampleCount:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCvtConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasResetShotAnalyzerBestScore:(BOOL)a3;
- (void)setHeartbeatFactor:(unint64_t)a3;
- (void)setKeywordAnalyzer:(id)a3;
- (void)setKeywordThreshold:(float)a3;
- (void)setLastVoiceTriggerScores:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPendingTwoShotDetection:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTriggerEndSampleCount:(unint64_t)a3;
- (void)setTwoShotDecisionWaitSamples:(unint64_t)a3;
- (void)setTwoShotThreshold:(float)a3;
- (void)startDetectTwoShot:(id)a3;
@end

@implementation CSContinuousVoiceTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVoiceTriggerScores, 0);
  objc_storeStrong((id *)&self->_cvtConfig, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setPendingTwoShotDetection:(BOOL)a3
{
  self->_pendingTwoShotDetection = a3;
}

- (BOOL)pendingTwoShotDetection
{
  return self->_pendingTwoShotDetection;
}

- (void)setHasResetShotAnalyzerBestScore:(BOOL)a3
{
  self->_hasResetShotAnalyzerBestScore = a3;
}

- (BOOL)hasResetShotAnalyzerBestScore
{
  return self->_hasResetShotAnalyzerBestScore;
}

- (void)setLastVoiceTriggerScores:(id)a3
{
}

- (NSMutableDictionary)lastVoiceTriggerScores
{
  return self->_lastVoiceTriggerScores;
}

- (void)setCvtConfig:(id)a3
{
}

- (CSContinuousVoiceTriggerConfig)cvtConfig
{
  return self->_cvtConfig;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setTwoShotThreshold:(float)a3
{
  self->_twoShotThreshold = a3;
}

- (float)twoShotThreshold
{
  return self->_twoShotThreshold;
}

- (void)setTwoShotDecisionWaitSamples:(unint64_t)a3
{
  self->_twoShotDecisionWaitSamples = a3;
}

- (unint64_t)twoShotDecisionWaitSamples
{
  return self->_twoShotDecisionWaitSamples;
}

- (void)setTriggerEndSampleCount:(unint64_t)a3
{
  self->_triggerEndSampleCount = a3;
}

- (unint64_t)triggerEndSampleCount
{
  return self->_triggerEndSampleCount;
}

- (void)setAnalyzedSampleCount:(unint64_t)a3
{
  self->_analyzedSampleCount = a3;
}

- (unint64_t)analyzedSampleCount
{
  return self->_analyzedSampleCount;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setKeywordThreshold:(float)a3
{
  self->_keywordThreshold = a3;
}

- (float)keywordThreshold
{
  return self->_keywordThreshold;
}

- (void)setKeywordAnalyzer:(id)a3
{
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setDelegate:(id)a3
{
}

- (CSContinuousVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSContinuousVoiceTriggerDelegate *)WeakRetained;
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5 lastVoiceTriggerScore:(float)a6 phId:(unint64_t)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  [v13 bestScore];
  float v15 = v14;
  uint64_t v16 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat;
  if (!(_keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat
       % self->_heartbeatFactor))
  {
    v17 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
      __int16 v49 = 2050;
      *(double *)&unint64_t v50 = v15;
      __int16 v51 = 2050;
      double v52 = *(double *)&a5;
      __int16 v53 = 2050;
      unint64_t v54 = a7;
      __int16 v55 = 2050;
      uint64_t v56 = v16;
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s NDAPI continuous voicetrigger best score = %{public}f for channel = %{public}tu,  phId: %{public}tu, heartbeat = %{public}lld", buf, 0x34u);
      uint64_t v16 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat;
    }
  }
  _keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat = v16 + 1;
  if (v15 <= a6 && v15 >= self->_keywordThreshold)
  {
    v18 = (os_log_t *)MEMORY[0x1E4F5D180];
    v19 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
      __int16 v49 = 2048;
      unint64_t v50 = a7;
      __int16 v51 = 2050;
      double v52 = v15;
      _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s Continuous VoiceTrigger detected with %tu! (score = %{public}f)", buf, 0x20u);
    }
    uint64_t v20 = [v13 bestStart];
    uint64_t v21 = [v13 bestEnd];
    uint64_t v22 = [(CSAudioTimeConverter *)self->_audioTimeConverter hostTimeFromSampleCount:v20];
    uint64_t v23 = [(CSAudioTimeConverter *)self->_audioTimeConverter hostTimeFromSampleCount:v21];
    v42 = v12;
    if (!self->_audioTimeConverter)
    {
      v24 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
        _os_log_error_impl(&dword_1C9338000, v24, OS_LOG_TYPE_ERROR, "%s Warning: audioTimeConverter not existing, override triggerEndMachTime as NOW", buf, 0xCu);
      }
      uint64_t v23 = mach_absolute_time();
    }
    uint64_t v25 = v23;
    v45[0] = *MEMORY[0x1E4F5D988];
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "bestStart"));
    v46[0] = v26;
    v45[1] = *MEMORY[0x1E4F5D930];
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "bestEnd"));
    v46[1] = v27;
    v45[2] = *MEMORY[0x1E4F5D978];
    *(float *)&double v28 = v15;
    v29 = [NSNumber numberWithFloat:v28];
    uint64_t v30 = *MEMORY[0x1E4F5D870];
    v46[2] = v29;
    v46[3] = MEMORY[0x1E4F1CC38];
    uint64_t v31 = *MEMORY[0x1E4F5D7A8];
    v45[3] = v30;
    v45[4] = v31;
    v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F5D278], "channelForProcessedInput"));
    v46[4] = v32;
    v45[5] = *MEMORY[0x1E4F5D980];
    v33 = [NSNumber numberWithUnsignedLongLong:v22];
    v46[5] = v33;
    v45[6] = *MEMORY[0x1E4F5D928];
    v34 = [NSNumber numberWithUnsignedLongLong:v25];
    v46[6] = v34;
    v45[7] = *MEMORY[0x1E4F5D958];
    v35 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    v46[7] = v35;
    double v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:8];

    v37 = (os_log_t *)MEMORY[0x1E4F5D180];
    v38 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
      __int16 v49 = 2114;
      *(double *)&unint64_t v50 = v36;
      _os_log_impl(&dword_1C9338000, v38, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
    }
    id v12 = v42;
    if (!self->_pendingTwoShotDetection || v36 == 0.0)
    {
      [v42 reset];
    }
    else
    {
      v39 = *v37;
      if (os_log_type_enabled(*v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
        _os_log_impl(&dword_1C9338000, v39, OS_LOG_TYPE_DEFAULT, "%s Starting pending two shot detection", buf, 0xCu);
      }
      [v42 resetBest];
      self->_pendingTwoShotDetection = 0;
      [(CSContinuousVoiceTrigger *)self _startDetectTwoShot:*(void *)&v36];
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__CSContinuousVoiceTrigger__keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId___block_invoke;
    block[3] = &unk_1E658D4B0;
    block[4] = self;
    double v44 = v36;
    id v41 = *(id *)&v36;
    dispatch_async(queue, block);
  }
}

void __107__CSContinuousVoiceTrigger__keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId___block_invoke(uint64_t a1)
{
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [v4 continuousVoiceTrigger:*(void *)(a1 + 32) detectedVoiceTriggerResult:*(void *)(a1 + 40)];
  }
}

- (void)_shotAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [a4 bestScore];
  float v10 = v9;
  v11 = (os_log_t *)MEMORY[0x1E4F5D180];
  id v12 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
    __int16 v28 = 2050;
    double v29 = v10;
    __int16 v30 = 2050;
    double v31 = *(double *)&a5;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s Shot: best score = %{public}f for channel = %{public}tu", buf, 0x20u);
    id v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    unint64_t analyzedSampleCount = self->_analyzedSampleCount;
    unint64_t v14 = self->_twoShotDecisionWaitSamples + self->_triggerEndSampleCount;
    *(_DWORD *)buf = 136315650;
    v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
    __int16 v28 = 2050;
    double v29 = *(double *)&analyzedSampleCount;
    __int16 v30 = 2050;
    double v31 = *(double *)&v14;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s analyzedSampleCount: %{public}tu, checkTime: %{public}lu", buf, 0x20u);
  }
  if (CSIsWatch()) {
    char v15 = [(CSAudioRecordContext *)self->_audioRecordContext isRTSTriggered];
  }
  else {
    char v15 = 0;
  }
  if (!self->_hasResetShotAnalyzerBestScore && (v15 & 1) == 0)
  {
    unint64_t v16 = self->_analyzedSampleCount;
    if (v16 >= self->_triggerEndSampleCount)
    {
      v17 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v28 = 2050;
        double v29 = *(double *)&v16;
        _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_INFO, "%s Reset bestScore at analyzedSampleCount: %{public}tu", buf, 0x16u);
      }
      self->_hasResetShotAnalyzerBestScore = 1;
      [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzer resetBest];
    }
  }
  unint64_t v18 = self->_analyzedSampleCount;
  if (v18 >= self->_twoShotDecisionWaitSamples + self->_triggerEndSampleCount)
  {
    float twoShotThreshold = self->_twoShotThreshold;
    if (v10 >= twoShotThreshold)
    {
      [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
      float v22 = v21;
      if ((v15 & 1) != 0
        || [MEMORY[0x1E4F5D450] supportCSTwoShotDecision] && (CSIsOSX() & 1) == 0)
      {
        queue = self->_queue;
        block[1] = 3221225472;
        block[0] = MEMORY[0x1E4F143A8];
        block[2] = __77__CSContinuousVoiceTrigger__shotAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke;
        block[3] = &unk_1E658C3A8;
        block[4] = self;
        *(double *)&void block[5] = (double)v18 / v22;
        float v25 = v10;
        dispatch_async(queue, block);
      }
    }
    else
    {
      uint64_t v20 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v28 = 2050;
        double v29 = v10;
        __int16 v30 = 2050;
        double v31 = twoShotThreshold;
        _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_DEFAULT, "%s Not entering two shot: [score: %{public}.3f < threshold: %{public}.3f]", buf, 0x20u);
      }
    }
    self->_mode = 0;
    [v8 reset];
  }
}

double __77__CSContinuousVoiceTrigger__shotAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    kdebug_trace();
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [v5 continuousVoiceTrigger:*(void *)(a1 + 32) detectedSilenceAfterVoiceTriggerAt:*(double *)(a1 + 40)];

    v6 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      double v7 = *(float *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 40);
      double v9 = *(float *)(*(void *)(a1 + 32) + 16);
      int v10 = 136315906;
      v11 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]_block_invoke";
      __int16 v12 = 2050;
      uint64_t v13 = v8;
      __int16 v14 = 2050;
      double v15 = v7;
      __int16 v16 = 2050;
      double v17 = v9;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Entering two shot at %{public}.2f with [score: %{public}.3f > threshold: %{public}.3f]", (uint8_t *)&v10, 0x2Au);
    }
  }
  return result;
}

- (void)processAudioSamples:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CSContinuousVoiceTrigger_processAudioSamples___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __48__CSContinuousVoiceTrigger_processAudioSamples___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 40) numSamples];
    if (v2 >= 1)
    {
      uint64_t v3 = v2;
      uint64_t v4 = 0;
      do
      {
        context = (void *)MEMORY[0x1CB784FE0]();
        uint64_t v39 = v4;
        uint64_t v40 = v3;
        if (v3 >= 640) {
          uint64_t v5 = 640;
        }
        else {
          uint64_t v5 = v3;
        }
        id v6 = [*(id *)(a1 + 40) subChunkFrom:v4 numSamples:v5];
        uint64_t v36 = [v6 numSamples];
        uint64_t v35 = [v6 numSamples];
        *(void *)(*(void *)(a1 + 32) + 72) += [v6 numSamples];
        v37 = v6;
        double v7 = [*(id *)(*(void *)(a1 + 32) + 56) getAnalyzedResultsFromAudioChunk:v6];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        unint64_t v8 = 0x1E4F28000uLL;
        uint64_t v43 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v43)
        {
          uint64_t v9 = 0;
          uint64_t v42 = *(void *)v45;
          do
          {
            uint64_t v10 = 0;
            uint64_t v41 = v9;
            do
            {
              if (*(void *)v45 != v42) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = v9 + v10;
              __int16 v12 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
              uint64_t v13 = *(void *)(a1 + 32);
              __int16 v14 = *(void **)(v13 + 112);
              if (*(void *)(v13 + 64) == 1)
              {
                double v15 = [v14 silencePhIds];
                __int16 v16 = [*(id *)(v8 + 3792) numberWithUnsignedInteger:v9 + v10];
                int v17 = [v15 containsObject:v16];

                if (v17) {
                  objc_msgSend(*(id *)(a1 + 32), "_shotAnalyzerNDAPI:hasResultAvailable:forChannel:", *(void *)(*(void *)(a1 + 32) + 56), v12, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "activeChannel"));
                }
              }
              else
              {
                uint64_t v18 = [v14 voiceTriggerPhIds];
                v19 = [*(id *)(v8 + 3792) numberWithUnsignedInteger:v9 + v10];
                int v20 = [v18 containsObject:v19];

                if (v20)
                {
                  float v21 = *(void **)(a1 + 32);
                  float v22 = (void *)v21[7];
                  uint64_t v23 = [v22 activeChannel];
                  v24 = v7;
                  float v25 = *(void **)(*(void *)(a1 + 32) + 120);
                  v26 = [*(id *)(v8 + 3792) numberWithUnsignedInteger:v11];
                  v27 = [v25 objectForKeyedSubscript:v26];
                  [v27 floatValue];
                  objc_msgSend(v21, "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:", v22, v12, v23, v11);

                  __int16 v28 = *(void **)(*(void *)(a1 + 32) + 120);
                  double v29 = NSNumber;
                  [v12 bestScore];
                  __int16 v30 = objc_msgSend(v29, "numberWithFloat:");
                  double v31 = [NSNumber numberWithUnsignedInteger:v11];
                  uint64_t v32 = v28;
                  unint64_t v8 = 0x1E4F28000;
                  [v32 setObject:v30 forKey:v31];

                  double v7 = v24;
                  uint64_t v9 = v41;
                }
              }
              ++v10;
            }
            while (v43 != v10);
            v9 += v10;
            uint64_t v43 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v43);
        }
        uint64_t v3 = v40 - v36;
        v33 = v7;
        uint64_t v4 = v35 + v39;
      }
      while (v40 - v36 > 0);
    }
  }
  else
  {
    v34 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v50 = "-[CSContinuousVoiceTrigger processAudioSamples:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v34, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", buf, 0xCu);
    }
  }
}

- (void)_startDetectTwoShot:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CSAudioRecordContext *)self->_audioRecordContext isRTSTriggered];
  if (v4 || !v5)
  {
    self->_mode = 1;
    double v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5D930]];
    uint64_t v8 = [v7 unsignedIntegerValue];
    uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5D7C8]];
    self->_unint64_t triggerEndSampleCount = v8 - [v9 unsignedIntegerValue];

    self->_hasResetShotAnalyzerBestScore = 0;
    [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
    float v11 = v10;
    [(CSContinuousVoiceTriggerConfig *)self->_cvtConfig twoShotDecisionWaitTime];
    self->_unint64_t twoShotDecisionWaitSamples = (unint64_t)(float)(v11 * v12);
    uint64_t v13 = (NSObject **)MEMORY[0x1E4F5D180];
    __int16 v14 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t triggerEndSampleCount = self->_triggerEndSampleCount;
      __int16 v16 = (void *)MEMORY[0x1E4F5D278];
      int v17 = v14;
      [v16 inputRecordingSampleRate];
      double v19 = (float)((float)triggerEndSampleCount / v18);
      double twoShotThreshold = self->_twoShotThreshold;
      unint64_t twoShotDecisionWaitSamples = self->_twoShotDecisionWaitSamples;
      [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
      int v25 = 136316418;
      v26 = "-[CSContinuousVoiceTrigger _startDetectTwoShot:]";
      __int16 v27 = 2050;
      unint64_t v28 = triggerEndSampleCount;
      __int16 v29 = 2050;
      double v30 = v19;
      __int16 v31 = 2050;
      double v32 = twoShotThreshold;
      __int16 v33 = 2050;
      unint64_t v34 = twoShotDecisionWaitSamples;
      __int16 v35 = 2050;
      double v36 = (float)((float)twoShotDecisionWaitSamples / v22);
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s Setting two shot decision mode triggerEndSampleCount = %{public}tu (%{public}.3f), double twoShotThreshold = %{public}.3f, twoShotDecisionWaitSamples = %{public}tu (%{public}.3f)", (uint8_t *)&v25, 0x3Eu);

      __int16 v14 = *v13;
    }
    self->_unint64_t activeChannel = 0;
    BOOL v23 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    unint64_t activeChannel = 0;
    if (v23)
    {
      int v25 = 136315394;
      v26 = "-[CSContinuousVoiceTrigger _startDetectTwoShot:]";
      __int16 v27 = 2050;
      unint64_t v28 = 0;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s Setting active channel of continuous voice trigger to %{public}tu according to VTEI", (uint8_t *)&v25, 0x16u);
      unint64_t activeChannel = self->_activeChannel;
    }
    [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzer setActiveChannel:activeChannel];
  }
  else
  {
    id v6 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      v26 = "-[CSContinuousVoiceTrigger _startDetectTwoShot:]";
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s RTS triggered with nil voicetrigger info. Falling back to CVT pending two shot detection", (uint8_t *)&v25, 0xCu);
    }
    self->_mode = 0;
    self->_pendingTwoShotDetection = 1;
  }
}

- (void)startDetectTwoShot:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v11 = "-[CSContinuousVoiceTrigger startDetectTwoShot:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__CSContinuousVoiceTrigger_startDetectTwoShot___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

uint64_t __47__CSContinuousVoiceTrigger_startDetectTwoShot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDetectTwoShot:*(void *)(a1 + 40)];
}

- (void)_setAsset:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v6 = [MEMORY[0x1E4F5D280] decodeConfigFrom:self->_currentAsset];
    cvtConfig = self->_cvtConfig;
    self->_cvtConfig = v6;

    uint64_t v8 = [(CSAsset *)self->_currentAsset resourcePath];
    id v9 = [(CSContinuousVoiceTriggerConfig *)self->_cvtConfig configPathNDAPI];
    float v10 = (CSKeywordAnalyzerNDAPI *)[objc_alloc(MEMORY[0x1E4F5D320]) initWithConfigPath:v9 resourcePath:v8];
    keywordAnalyzer = self->_keywordAnalyzer;
    self->_keywordAnalyzer = v10;

    [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzer setActiveChannel:self->_activeChannel];
    [(CSContinuousVoiceTriggerConfig *)self->_cvtConfig threshold];
    self->_keywordThreshold = v12;
    [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
    float v14 = v13;
    [(CSContinuousVoiceTriggerConfig *)self->_cvtConfig twoShotDecisionWaitTime];
    self->_unint64_t twoShotDecisionWaitSamples = (unint64_t)(float)(v14 * v15);
    [(CSContinuousVoiceTriggerConfig *)self->_cvtConfig twoShotThreshold];
    self->_double twoShotThreshold = v16;
  }
  else
  {
    int v17 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      double v19 = "-[CSContinuousVoiceTrigger _setAsset:]";
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CSContinuousVoiceTrigger_setAsset___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __37__CSContinuousVoiceTrigger_setAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAsset:*(void *)(a1 + 40)];
}

- (void)_reset
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_pendingTwoShotDetection = 0;
  *(_OWORD *)&self->_mode = 0u;
  *(_OWORD *)&self->_unint64_t triggerEndSampleCount = 0u;
  [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzer reset];
  unint64_t v3 = [MEMORY[0x1E4F5D278] channelForProcessedInput];
  self->_unint64_t activeChannel = v3;
  [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzer setActiveChannel:v3];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  lastVoiceTriggerScores = self->_lastVoiceTriggerScores;
  self->_lastVoiceTriggerScores = v4;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(CSContinuousVoiceTriggerConfig *)self->_cvtConfig voiceTriggerPhIds];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NSMutableDictionary *)self->_lastVoiceTriggerScores setObject:&unk_1F23C5358 forKey:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)resetWithAudioRecordContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CSContinuousVoiceTrigger_resetWithAudioRecordContext___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__CSContinuousVoiceTrigger_resetWithAudioRecordContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAudioRecordContext:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _reset];
}

- (CSContinuousVoiceTrigger)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSContinuousVoiceTrigger;
  uint64_t v2 = [(CSContinuousVoiceTrigger *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSContinuousVoiceTrigger Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    id v5 = v2->_queue;
    id v6 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v5, v6);

    [MEMORY[0x1E4F5D278] inputRecordingBufferDuration];
    v2->_heartbeatFactor = (unint64_t)(2.0 / v7);
    [(CSContinuousVoiceTrigger *)v2 _reset];
  }
  return v2;
}

@end