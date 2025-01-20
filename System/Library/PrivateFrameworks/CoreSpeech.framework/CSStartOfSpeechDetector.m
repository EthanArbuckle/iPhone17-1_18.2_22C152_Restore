@interface CSStartOfSpeechDetector
- (BOOL)startDetected;
- (CSStartOfSpeechDetector)initWithConfig:(id)a3 samplingRate:(unint64_t)a4 minSpeechFrames:(unint64_t)a5 numLeadingFrames:(unint64_t)a6 delegate:(id)a7;
- (CSStartOfSpeechDetectorDelegate)delegate;
- (EARCaesuraSilencePosteriorGenerator)caesuraSPG;
- (NSString)configFile;
- (OS_dispatch_queue)sosQueue;
- (OS_dispatch_queue)spgQueue;
- (float)prevAudioProcessedMs;
- (unint64_t)curSpeechFrames;
- (unint64_t)minSpeechFrames;
- (unint64_t)numLeadingFrames;
- (unint64_t)samplingRate;
- (void)addAudio:(id)a3 numSamples:(unint64_t)a4;
- (void)clientSilenceFeaturesAvailable:(id)a3;
- (void)endAudio;
- (void)resetForNewRequest;
- (void)setCaesuraSPG:(id)a3;
- (void)setConfigFile:(id)a3;
- (void)setCurSpeechFrames:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMinSpeechFrames:(unint64_t)a3;
- (void)setNumLeadingFrames:(unint64_t)a3;
- (void)setPrevAudioProcessedMs:(float)a3;
- (void)setSamplingRate:(unint64_t)a3;
- (void)setSosQueue:(id)a3;
- (void)setSpgQueue:(id)a3;
- (void)setStartDetected:(BOOL)a3;
@end

@implementation CSStartOfSpeechDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosQueue, 0);
  objc_storeStrong((id *)&self->_spgQueue, 0);
  objc_storeStrong((id *)&self->_configFile, 0);
  objc_storeStrong((id *)&self->_caesuraSPG, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSosQueue:(id)a3
{
}

- (OS_dispatch_queue)sosQueue
{
  return self->_sosQueue;
}

- (void)setSpgQueue:(id)a3
{
}

- (OS_dispatch_queue)spgQueue
{
  return self->_spgQueue;
}

- (void)setSamplingRate:(unint64_t)a3
{
  self->_samplingRate = a3;
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (void)setPrevAudioProcessedMs:(float)a3
{
  self->_prevAudioProcessedMs = a3;
}

- (float)prevAudioProcessedMs
{
  return self->_prevAudioProcessedMs;
}

- (void)setNumLeadingFrames:(unint64_t)a3
{
  self->_numLeadingFrames = a3;
}

- (unint64_t)numLeadingFrames
{
  return self->_numLeadingFrames;
}

- (void)setCurSpeechFrames:(unint64_t)a3
{
  self->_curSpeechFrames = a3;
}

- (unint64_t)curSpeechFrames
{
  return self->_curSpeechFrames;
}

- (void)setMinSpeechFrames:(unint64_t)a3
{
  self->_minSpeechFrames = a3;
}

- (unint64_t)minSpeechFrames
{
  return self->_minSpeechFrames;
}

- (void)setStartDetected:(BOOL)a3
{
  self->_startDetected = a3;
}

- (BOOL)startDetected
{
  return self->_startDetected;
}

- (void)setConfigFile:(id)a3
{
}

- (NSString)configFile
{
  return self->_configFile;
}

- (void)setCaesuraSPG:(id)a3
{
}

- (EARCaesuraSilencePosteriorGenerator)caesuraSPG
{
  return self->_caesuraSPG;
}

- (void)setDelegate:(id)a3
{
}

- (CSStartOfSpeechDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSStartOfSpeechDetectorDelegate *)WeakRetained;
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4 = a3;
  sosQueue = self->_sosQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__CSStartOfSpeechDetector_clientSilenceFeaturesAvailable___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sosQueue, v7);
}

void __58__CSStartOfSpeechDetector_clientSilenceFeaturesAvailable___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
  v3 = (os_log_t *)MEMORY[0x1E4F5D180];
  id v4 = *MEMORY[0x1E4F5D180];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      int v35 = 136315138;
      v36 = "-[CSStartOfSpeechDetector clientSilenceFeaturesAvailable:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Start of speech already reported, ignoring !", (uint8_t *)&v35, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      id v6 = *(void **)(a1 + 40);
      v7 = v4;
      [v6 silencePosterior];
      unint64_t v9 = v8;
      [*(id *)(a1 + 40) silenceFramesCountMs];
      unint64_t v11 = v10;
      [*(id *)(a1 + 40) processedAudioMs];
      double v12 = *(double *)(*(void *)(a1 + 32) + 48);
      int v35 = 136316162;
      v36 = "-[CSStartOfSpeechDetector clientSilenceFeaturesAvailable:]_block_invoke";
      __int16 v37 = 2050;
      unint64_t v38 = v9;
      __int16 v39 = 2050;
      unint64_t v40 = v11;
      __int16 v41 = 2050;
      unint64_t v42 = v13;
      __int16 v43 = 2050;
      double v44 = v12;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s silProb= %{public}f, silnfcnt=%{public}f, clientProcessedAudioMs=%{public}f curSpeechFrmCnt=%{public}lu", (uint8_t *)&v35, 0x34u);
    }
    [*(id *)(a1 + 40) silenceFramesCountMs];
    if (v14 == 0.0)
    {
      [*(id *)(a1 + 40) processedAudioMs];
      uint64_t v15 = *(void *)(a1 + 32);
      float v17 = v16 - *(float *)(v15 + 12);
      *(void *)(v15 + 48) = (unint64_t)(float)((float)(v17
                                                              / (float)[*(id *)(v15 + 24) getFrameDurationMs])+ (float)*(unint64_t *)(v15 + 48));
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 48) = 0;
    }
    [*(id *)(a1 + 40) processedAudioMs];
    *(float *)&double v18 = v18;
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = LODWORD(v18);
    if (*(void *)(*(void *)(a1 + 32) + 48) >= *(void *)(*(void *)(a1 + 32) + 40))
    {
      [*(id *)(a1 + 40) processedAudioMs];
      uint64_t v20 = *(void *)(a1 + 32);
      double v21 = v19 / 1000.0 * (double)*(unint64_t *)(v20 + 64);
      uint64_t v22 = *(void *)(v20 + 48);
      uint64_t v23 = [*(id *)(v20 + 24) getFrameDurationMs] * v22;
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(v24 + 56);
      unint64_t v26 = (unint64_t)((double)(unint64_t)v21
                             - (double)(unint64_t)(v23 * *(void *)(v24 + 64)) / 1000.0);
      uint64_t v27 = [*(id *)(v24 + 24) getFrameDurationMs];
      uint64_t v28 = *(void *)(a1 + 32);
      unint64_t v29 = *(void *)(v28 + 64);
      unint64_t v30 = (unint64_t)((float)(unint64_t)(v27 * v25) / 1000.0 * (double)v29);
      if (v26 <= v30) {
        unint64_t v30 = 0;
      }
      unint64_t v31 = v26 - v30;
      v32 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 136316162;
        v36 = "-[CSStartOfSpeechDetector clientSilenceFeaturesAvailable:]_block_invoke";
        __int16 v37 = 2050;
        unint64_t v38 = (unint64_t)v21;
        __int16 v39 = 2050;
        unint64_t v40 = v31;
        __int16 v41 = 2048;
        unint64_t v42 = (unint64_t)v21 - v31;
        __int16 v43 = 2050;
        double v44 = (float)((float)v42 / (float)v29);
        _os_log_impl(&dword_1C9338000, v32, OS_LOG_TYPE_DEFAULT, "%s Speech prob target reached at %{public}lu from %{public}lu, #samples=%lu, secs=%{public}f", (uint8_t *)&v35, 0x34u);
        uint64_t v28 = *(void *)(a1 + 32);
      }
      *(unsigned char *)(v28 + 8) = 1;
      [*(id *)(*(void *)(a1 + 32) + 24) endAudio];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

      if (WeakRetained)
      {
        id v34 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
        [v34 startOfSpeechDetector:*(void *)(a1 + 32) foundStartSampleAt:v31];
      }
    }
  }
}

- (void)endAudio
{
  sosQueue = self->_sosQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CSStartOfSpeechDetector_endAudio__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(sosQueue, block);
}

uint64_t __35__CSStartOfSpeechDetector_endAudio__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v4 endAudio];
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  sosQueue = self->_sosQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CSStartOfSpeechDetector_addAudio_numSamples___block_invoke;
  block[3] = &unk_1E658CEC8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(sosQueue, block);
}

uint64_t __47__CSStartOfSpeechDetector_addAudio_numSamples___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) addAudio:a1[5] numSamples:a1[6]];
}

- (void)resetForNewRequest
{
  sosQueue = self->_sosQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSStartOfSpeechDetector_resetForNewRequest__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(sosQueue, block);
}

void __45__CSStartOfSpeechDetector_resetForNewRequest__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F60F70]) initWithConfigFile:*(void *)(*(void *)(a1 + 32) + 32) samplingRate:*(void *)(*(void *)(a1 + 32) + 64) queue:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
  BOOL v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
    int v7 = 136315394;
    id v8 = "-[CSStartOfSpeechDetector resetForNewRequest]_block_invoke";
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Reset: Created EARCaesuraSilencePosteriorGenerator: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
}

- (CSStartOfSpeechDetector)initWithConfig:(id)a3 samplingRate:(unint64_t)a4 minSpeechFrames:(unint64_t)a5 numLeadingFrames:(unint64_t)a6 delegate:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CSStartOfSpeechDetector;
  uint64_t v15 = [(CSStartOfSpeechDetector *)&v23 init];
  double v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    v16->_samplingRate = a4;
    objc_storeStrong((id *)&v16->_configFile, a3);
    v16->_minSpeechFrames = a5;
    v16->_numLeadingFrames = a6;
    dispatch_queue_t v17 = dispatch_queue_create("StartOfSpeech SPG queue", 0);
    spgQueue = v16->_spgQueue;
    v16->_spgQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("StartOfSpeech queue", 0);
    sosQueue = v16->_sosQueue;
    v16->_sosQueue = (OS_dispatch_queue *)v19;

    double v21 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[CSStartOfSpeechDetector initWithConfig:samplingRate:minSpeechFrames:numLeadingFrames:delegate:]";
      __int16 v26 = 2114;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_DEFAULT, "%s Created CSStartOfSpeechDetector: %{public}@ ", buf, 0x16u);
    }
  }

  return v16;
}

@end