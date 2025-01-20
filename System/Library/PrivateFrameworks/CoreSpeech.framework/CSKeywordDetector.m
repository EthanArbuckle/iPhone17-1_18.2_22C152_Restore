@interface CSKeywordDetector
- (BOOL)isRunningRecognizer;
- (CSAsset)currentAsset;
- (CSKeywordAnalyzerQuasar)keywordAnalyzer;
- (CSKeywordDetector)initWithManager:(id)a3 asset:(id)a4;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerDelegate)delegate;
- (OS_dispatch_queue)queue;
- (float)keywordThreshold;
- (unint64_t)analyzedSampleCount;
- (unint64_t)decisionWaitSampleCount;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)keywordAnalyzerQuasar:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)reset;
- (void)setAnalyzedSampleCount:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDecisionWaitSampleCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsRunningRecognizer:(BOOL)a3;
- (void)setKeywordAnalyzer:(id)a3;
- (void)setKeywordThreshold:(float)a3;
- (void)setQueue:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)speechManagerDidStartForwarding:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)speechManagerDidStopForwarding:(id)a3 forReason:(int64_t)a4;
- (void)speechManagerLPCMRecordBufferAvailable:(id)a3 chunk:(id)a4;
- (void)startDetectKeyword:(id)a3;
@end

@implementation CSKeywordDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_speechManager);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setIsRunningRecognizer:(BOOL)a3
{
  self->_isRunningRecognizer = a3;
}

- (BOOL)isRunningRecognizer
{
  return self->_isRunningRecognizer;
}

- (void)setDecisionWaitSampleCount:(unint64_t)a3
{
  self->_decisionWaitSampleCount = a3;
}

- (unint64_t)decisionWaitSampleCount
{
  return self->_decisionWaitSampleCount;
}

- (void)setAnalyzedSampleCount:(unint64_t)a3
{
  self->_analyzedSampleCount = a3;
}

- (unint64_t)analyzedSampleCount
{
  return self->_analyzedSampleCount;
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

- (CSKeywordAnalyzerQuasar)keywordAnalyzer
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

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_speechManager);
  return (CSSpeechManager *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerDelegate *)WeakRetained;
}

- (void)keywordAnalyzerQuasar:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a3 triggerConfidence];
  float v7 = v6;
  float keywordThreshold = self->_keywordThreshold;
  v9 = *MEMORY[0x1E4F5D180];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT);
  if (keywordThreshold >= v7)
  {
    if (v10)
    {
      unint64_t analyzedSampleCount = self->_analyzedSampleCount;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSKeywordDetector keywordAnalyzerQuasar:hasResultAvailable:forChannel:]";
      __int16 v17 = 2048;
      unint64_t v18 = analyzedSampleCount;
      __int16 v19 = 2050;
      double v20 = v7;
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Keyword NOT detected at %tu with %{public}.3f confidence", buf, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      unint64_t v11 = self->_analyzedSampleCount;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSKeywordDetector keywordAnalyzerQuasar:hasResultAvailable:forChannel:]";
      __int16 v17 = 2050;
      unint64_t v18 = v11;
      __int16 v19 = 2050;
      double v20 = v7;
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Keyword detected at %{public}tu with %{public}.3f confidence", buf, 0x20u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__CSKeywordDetector_keywordAnalyzerQuasar_hasResultAvailable_forChannel___block_invoke;
    block[3] = &unk_1E658D4D8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __73__CSKeywordDetector_keywordAnalyzerQuasar_hasResultAvailable_forChannel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v4 keywordDetectorDidDetectKeyword];
  }
}

- (void)speechManagerDidStopForwarding:(id)a3 forReason:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSKeywordDetector speechManagerDidStopForwarding:forReason:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CSKeywordDetector_speechManagerDidStopForwarding_forReason___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__CSKeywordDetector_speechManagerDidStopForwarding_forReason___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    result = [*(id *)(v1 + 48) endAudio];
    *(unsigned char *)(*(void *)(v2 + 32) + 8) = 0;
  }
  return result;
}

- (void)speechManagerDidStartForwarding:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v6 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[CSKeywordDetector speechManagerDidStartForwarding:successfully:error:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CSKeywordDetector_speechManagerDidStartForwarding_successfully_error___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __72__CSKeywordDetector_speechManagerDidStartForwarding_successfully_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) runRecognition];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return result;
}

- (void)speechManagerLPCMRecordBufferAvailable:(id)a3 chunk:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CSKeywordDetector_speechManagerLPCMRecordBufferAvailable_chunk___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __66__CSKeywordDetector_speechManagerLPCMRecordBufferAvailable_chunk___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 40))
  {
    if (*(unsigned char *)(v1 + 8))
    {
      char v3 = *(void **)(v1 + 48);
      if (*(void *)(v1 + 56) >= *(void *)(v1 + 64))
      {
        [v3 endAudio];
        *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
      }
      else
      {
        [v3 processAudioChunk:*(void *)(a1 + 40)];
        *(void *)(*(void *)(a1 + 32) + 56) += [*(id *)(a1 + 40) numSamples];
      }
    }
  }
  else
  {
    id v4 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      double v6 = "-[CSKeywordDetector speechManagerLPCMRecordBufferAvailable:chunk:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_setAsset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentAsset, a3);
    double v6 = [(CSAsset *)self->_currentAsset keywordDetectorConfigPathRecognizer];
    uint64_t v7 = (CSKeywordAnalyzerQuasar *)[objc_alloc(MEMORY[0x1E4F5D338]) initWithConfigPath:v6 triggerTokens:0 useKeywordSpotting:1];
    keywordAnalyzer = self->_keywordAnalyzer;
    self->_keywordAnalyzer = v7;

    [(CSKeywordAnalyzerQuasar *)self->_keywordAnalyzer setDelegate:self];
    [(CSAsset *)self->_currentAsset keywordDetectorThreshold];
    self->_float keywordThreshold = v9;
    [(CSKeywordDetector *)self _reset];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "-[CSKeywordDetector _setAsset:]";
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CSKeywordDetector_setAsset___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __30__CSKeywordDetector_setAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAsset:*(void *)(a1 + 40)];
}

- (void)_reset
{
  self->_unint64_t analyzedSampleCount = 0;
  self->_decisionWaitSampleCount = 0;
  [(CSKeywordAnalyzerQuasar *)self->_keywordAnalyzer reset];
  self->_isRunningRecognizer = 0;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CSKeywordDetector_reset__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __26__CSKeywordDetector_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

- (void)startDetectKeyword:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v11 = "-[CSKeywordDetector startDetectKeyword:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__CSKeywordDetector_startDetectKeyword___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

void __40__CSKeywordDetector_startDetectKeyword___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  char v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F5D7A8]];
  objc_msgSend(v2, "setActiveChannel:", objc_msgSend(v3, "unsignedIntegerValue"));

  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F5D938]];
  [v4 doubleValue];
  double v6 = v5;

  [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
  unint64_t v8 = (unint64_t)(v6 * v7);
  [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
  float v10 = v9;
  [*(id *)(*(void *)(a1 + 32) + 40) keywordDetectorWaitTimeSinceVT];
  *(void *)(*(void *)(a1 + 32) + 64) = (unint64_t)(float)((float)v8 + (float)(v10 * v11));
  uint64_t v12 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = *(void *)(*(void *)(a1 + 32) + 64);
    v14 = (void *)MEMORY[0x1E4F5D278];
    v15 = v12;
    [v14 inputRecordingSampleRate];
    int v17 = 136316162;
    unint64_t v18 = "-[CSKeywordDetector startDetectKeyword:]_block_invoke";
    __int16 v19 = 2050;
    unint64_t v20 = v13;
    __int16 v21 = 2050;
    double v22 = (float)((float)v13 / v16);
    __int16 v23 = 2050;
    unint64_t v24 = v8;
    __int16 v25 = 2050;
    double v26 = v6;
    _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s Setting decisionWaitSampleCount at %{public}tu (%{public}.3f) given vtEndSampleCount at %{public}tu (%{public}.3f)", (uint8_t *)&v17, 0x34u);
  }
}

- (CSKeywordDetector)initWithManager:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSKeywordDetector;
  unint64_t v8 = [(CSKeywordDetector *)&v14 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("CSKeywordDetector Queue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    float v11 = v8->_queue;
    uint64_t v12 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v11, v12);

    objc_storeWeak((id *)&v8->_speechManager, v6);
    [(CSKeywordDetector *)v8 _setAsset:v7];
  }

  return v8;
}

@end