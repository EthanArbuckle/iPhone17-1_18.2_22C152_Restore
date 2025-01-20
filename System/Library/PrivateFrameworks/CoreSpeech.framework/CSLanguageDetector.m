@interface CSLanguageDetector
- (BOOL)needsToUpdateModel;
- (BOOL)startOfSpeechDetected;
- (CSAsset)currentAsset;
- (CSAudioCircularBuffer)circBuffer;
- (CSLanguageDetector)init;
- (CSLanguageDetector)initWithModelURL:(id)a3;
- (CSLanguageDetectorDelegate)delegate;
- (CSStartOfSpeechDetector)startOfSpeechDetector;
- (NSMutableArray)latestDetectedLanguages;
- (NSString)interactionID;
- (NSString)languageDetectorAssetHash;
- (OS_dispatch_queue)queue;
- (_EARLanguageDetector)languageDetector;
- (_EARLanguageDetectorAudioBuffer)audioBuffer;
- (id)_constructLangPriors;
- (id)_getDefaultValues;
- (id)_readJsonDictionaryAt:(id)a3;
- (int)notifyToken;
- (int64_t)currentState;
- (unint64_t)numLatestLanguages;
- (void)_initializeStartOfSpeechDetector:(id)a3 samplingRate:(float)a4;
- (void)_logLanguageDetectorMetricsForLoggingInfo:(id)a3;
- (void)_logSoSResult:(id)a3 toPath:(id)a4;
- (void)_recordRecognitionLanguage:(id)a3;
- (void)_resetStartOfSpeechDetector;
- (void)_setNumLatestLangFromConfigFile:(id)a3;
- (void)_setupLanguageDetectorWithOption:(id)a3;
- (void)_startMonitorLanguageDetectorAssetDownload;
- (void)addSamples:(id)a3 numSamples:(unint64_t)a4;
- (void)cancelCurrentRequest;
- (void)dealloc;
- (void)endAudio;
- (void)languageDetector:(id)a3 result:(id)a4;
- (void)languageDetectorDidCompleteProcessing:(id)a3 loggingInfo:(id)a4;
- (void)recordRecognitionLanguage:(id)a3;
- (void)resetForNewRequest:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setCircBuffer:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInteractionID:(id)a3;
- (void)setInteractionIDforCurrentRequest:(id)a3;
- (void)setLanguageDetector:(id)a3;
- (void)setLanguageDetectorAssetHash:(id)a3;
- (void)setLatestDetectedLanguages:(id)a3;
- (void)setMostRecentRecognitionLanguage:(id)a3;
- (void)setNeedsToUpdateModel:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setNumLatestLanguages:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setStartOfSpeechDetected:(BOOL)a3;
- (void)setStartOfSpeechDetector:(id)a3;
- (void)startOfSpeechDetector:(id)a3 foundStartSampleAt:(unint64_t)a4;
@end

@implementation CSLanguageDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interactionID, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_languageDetectorAssetHash, 0);
  objc_storeStrong((id *)&self->_latestDetectedLanguages, 0);
  objc_storeStrong((id *)&self->_circBuffer, 0);
  objc_storeStrong((id *)&self->_startOfSpeechDetector, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_languageDetector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setInteractionID:(id)a3
{
}

- (NSString)interactionID
{
  return self->_interactionID;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setLanguageDetectorAssetHash:(id)a3
{
}

- (NSString)languageDetectorAssetHash
{
  return self->_languageDetectorAssetHash;
}

- (void)setNumLatestLanguages:(unint64_t)a3
{
  self->_numLatestLanguages = a3;
}

- (unint64_t)numLatestLanguages
{
  return self->_numLatestLanguages;
}

- (void)setLatestDetectedLanguages:(id)a3
{
}

- (NSMutableArray)latestDetectedLanguages
{
  return self->_latestDetectedLanguages;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setNeedsToUpdateModel:(BOOL)a3
{
  self->_needsToUpdateModel = a3;
}

- (BOOL)needsToUpdateModel
{
  return self->_needsToUpdateModel;
}

- (void)setStartOfSpeechDetected:(BOOL)a3
{
  self->_startOfSpeechDetected = a3;
}

- (BOOL)startOfSpeechDetected
{
  return self->_startOfSpeechDetected;
}

- (void)setCircBuffer:(id)a3
{
}

- (CSAudioCircularBuffer)circBuffer
{
  return self->_circBuffer;
}

- (void)setStartOfSpeechDetector:(id)a3
{
}

- (CSStartOfSpeechDetector)startOfSpeechDetector
{
  return self->_startOfSpeechDetector;
}

- (void)setAudioBuffer:(id)a3
{
}

- (_EARLanguageDetectorAudioBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setLanguageDetector:(id)a3
{
}

- (_EARLanguageDetector)languageDetector
{
  return self->_languageDetector;
}

- (void)setDelegate:(id)a3
{
}

- (CSLanguageDetectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLanguageDetectorDelegate *)WeakRetained;
}

- (void)startOfSpeechDetector:(id)a3 foundStartSampleAt:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke;
  v5[3] = &unk_1E658D3C8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

void __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke(uint64_t a1)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) sampleCount];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(NSObject **)(v3 + 104);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke_2;
  v24[3] = &unk_1E658D3C8;
  v24[4] = v3;
  v24[5] = v4;
  dispatch_async(v5, v24);
  unint64_t v6 = v2 - *(void *)(a1 + 40);
  if (v6 > [*(id *)(*(void *)(a1 + 32) + 48) bufferLength]) {
    uint64_t v4 = v2 - [*(id *)(*(void *)(a1 + 32) + 48) bufferLength];
  }
  v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copySamplesFrom:v4 to:v2];
  v8 = *(void **)(*(void *)(a1 + 32) + 32);
  id v9 = [v7 data];
  objc_msgSend(v8, "addAudioSamples:count:", objc_msgSend(v9, "bytes"), objc_msgSend(v7, "numSamples"));

  v10 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  LODWORD(v9) = [v10 startOfSpeechAudioLoggingEnabled];

  if (v9)
  {
    v11 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
    v12 = [v11 getStartOfSpeechAudioLogFilePath];

    v31[0] = @"SpgRegportedStartSampleId";
    v13 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    v32[0] = v13;
    v31[1] = @"EffectiveStartSampleId";
    v14 = [NSNumber numberWithUnsignedInteger:v4];
    v32[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

    v16 = *(void **)(a1 + 32);
    v17 = [v12 stringByAppendingString:@"-result.json"];
    [v16 _logSoSResult:v15 toPath:v17];

    v18 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copySamplesFrom:v4 to:v2];
    if (v18)
    {
      v19 = *MEMORY[0x1E4F5D180];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[CSLanguageDetector startOfSpeechDetector:foundStartSampleAt:]_block_invoke";
        __int16 v27 = 2050;
        uint64_t v28 = v4;
        __int16 v29 = 2050;
        uint64_t v30 = v2;
        _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s Saving circular buffer from %{public}lu to %{public}lu", buf, 0x20u);
      }
      v20 = (void *)MEMORY[0x1E4F5D398];
      v21 = (void *)MEMORY[0x1E4F1CB10];
      v22 = [v12 stringByAppendingString:@"-result.wav"];
      v23 = [v21 URLWithString:v22];
      [v20 saveAudioChunck:v18 toURL:v23];
    }
  }
}

void __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 56) != 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      [v5 startOfSpeechDetectedAtFrame:*(void *)(a1 + 40)];
    }
  }
}

- (void)languageDetectorDidCompleteProcessing:(id)a3 loggingInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CSLanguageDetector_languageDetectorDidCompleteProcessing_loggingInfo___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void *__72__CSLanguageDetector_languageDetectorDidCompleteProcessing_loggingInfo___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
    int v13 = 136315394;
    v14 = "-[CSLanguageDetector languageDetectorDidCompleteProcessing:loggingInfo:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s LanguageDetector State: %ld", (uint8_t *)&v13, 0x16u);
  }
  result = *(void **)(a1 + 32);
  uint64_t v5 = result[7];
  if ((unint64_t)(v5 - 1) < 2)
  {
    [result _logLanguageDetectorMetricsForLoggingInfo:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 40) endAudio];
    [*(id *)(*(void *)(a1 + 32) + 32) endAudio];
    result = *(void **)(a1 + 32);
LABEL_6:
    unint64_t v6 = (void *)result[6];
    result[6] = 0;

    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;

    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    result = *(void **)(a1 + 32);
    goto LABEL_7;
  }
  if (v5 == 3) {
    goto LABEL_6;
  }
LABEL_7:
  result[7] = 0;
  return result;
}

- (void)languageDetector:(id)a3 result:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 confidences];
  uint64_t v9 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 136315650;
    v39 = "-[CSLanguageDetector languageDetector:result:]";
    __int16 v40 = 2114;
    v41 = v8;
    __int16 v42 = 1026;
    int v43 = [v7 isConfident];
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@ isConfident %{public}d", buf, 0x1Cu);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = 0;
    uint64_t v15 = *(void *)v34;
    float v16 = -1.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v19 = [v11 objectForKeyedSubscript:v18];
        [v19 floatValue];
        float v21 = v20;

        if (v21 >= v16)
        {
          v22 = [v11 objectForKeyedSubscript:v18];
          [v22 floatValue];
          float v16 = v23;

          id v24 = v18;
          v14 = v24;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  queue = self->_queue;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__CSLanguageDetector_languageDetector_result___block_invoke;
  v29[3] = &unk_1E658C308;
  v29[4] = self;
  id v30 = v14;
  id v31 = v11;
  id v32 = v7;
  id v26 = v7;
  id v27 = v11;
  id v28 = v14;
  dispatch_async(queue, v29);
}

void __46__CSLanguageDetector_languageDetector_result___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 56) != 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v5 + 8))
      {
        [(id)v5 _recordRecognitionLanguage:*(void *)(a1 + 40)];
        uint64_t v5 = *(void *)(a1 + 32);
      }
      id v6 = objc_loadWeakRetained((id *)(v5 + 16));
      objc_msgSend(v6, "languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:", *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isConfident"));
    }
  }
}

- (void)_logLanguageDetectorMetricsForLoggingInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F5D180];
  id v6 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v8 = [v4 loggingDict];
    int v17 = 136315394;
    v18 = "-[CSLanguageDetector _logLanguageDetectorMetricsForLoggingInfo:]";
    __int16 v19 = 2114;
    float v20 = v8;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s _EARLanguageDetectorLoggingInfo = %{public}@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = [(CSLanguageDetector *)self _constructLangPriors];
  [v9 setObject:v10 forKey:@"dictationPriors"];

  id v11 = [v4 loggingDict];

  if (v11)
  {
    uint64_t v12 = [v4 loggingDict];
    [v9 setObject:v12 forKey:@"earLoggingInfo"];
  }
  languageDetectorAssetHash = self->_languageDetectorAssetHash;
  if (languageDetectorAssetHash) {
    [v9 setObject:languageDetectorAssetHash forKey:@"modelHash"];
  }
  interactionID = self->_interactionID;
  if (interactionID) {
    [v9 setObject:interactionID forKey:@"interactionId"];
  }
  uint64_t v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    v18 = "-[CSLanguageDetector _logLanguageDetectorMetricsForLoggingInfo:]";
    __int16 v19 = 2114;
    float v20 = v9;
    _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s _EARLanguageDetectorLoggingInfo analytics context %{public}@", (uint8_t *)&v17, 0x16u);
  }
  float v16 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v16 logEventWithType:4703 context:v9 contextNoCopy:0];
}

- (void)_logSoSResult:(id)a3 toPath:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v11 = 0;
  id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:3 error:&v11];
  id v7 = v11;
  if (v7)
  {
    v8 = (void *)*MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      v10 = [v7 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[CSLanguageDetector _logSoSResult:toPath:]";
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Error writing out SoS info meta: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [v6 writeToFile:v5 atomically:0];
  }
}

- (id)_getDefaultValues
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:&unk_1F23C5368 forKey:@"HistBufferSizeinSecs"];
  [v2 setObject:&unk_1F23C47A8 forKey:@"NumLeadingFrames"];
  [v2 setObject:&unk_1F23C47C0 forKey:@"MinSpeechFrames"];
  return v2;
}

- (id)_readJsonDictionaryAt:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v19 = 0;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5 isDirectory:&v19];

  if (v19)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CSLanguageDetector.m", 269, @"Unexpected!! Received dir for: %@", v5 object file lineNumber description];

    if (v7)
    {
LABEL_3:
      id v18 = 0;
      v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5 options:0 error:&v18];
      id v9 = v18;
      if (v9 || !v8)
      {
        uint64_t v12 = *MEMORY[0x1E4F5D180];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v21 = "-[CSLanguageDetector _readJsonDictionaryAt:]";
          __int16 v22 = 2114;
          id v23 = v5;
          __int16 v24 = 2114;
          id v25 = v9;
          _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s Could not read Json file at: %{public}@, err: %{public}@", buf, 0x20u);
        }
        id v11 = 0;
      }
      else
      {
        id v17 = 0;
        v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v17];
        id v9 = v17;
        if (v9 || !v10)
        {
          uint64_t v13 = *MEMORY[0x1E4F5D180];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v21 = "-[CSLanguageDetector _readJsonDictionaryAt:]";
            __int16 v22 = 2114;
            id v23 = v5;
            __int16 v24 = 2114;
            id v25 = v9;
            _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to parse json at: %{public}@, err: %{public}@", buf, 0x20u);
          }
          id v11 = 0;
        }
        else
        {
          id v11 = v10;
        }
      }
      goto LABEL_20;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  uint64_t v15 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[CSLanguageDetector _readJsonDictionaryAt:]";
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s Json file doesnt exist at: %{public}@", buf, 0x16u);
  }
  id v11 = 0;
LABEL_20:

  return v11;
}

- (void)_setNumLatestLangFromConfigFile:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [(CSLanguageDetector *)self _readJsonDictionaryAt:a3];
  id v5 = [v4 objectForKeyedSubscript:@"NumLatestLanguages"];

  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"NumLatestLanguages"];
    self->_unint64_t numLatestLanguages = [v6 integerValue];
  }
  else
  {
    self->_unint64_t numLatestLanguages = 10;
  }
  char v7 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numLatestLanguages = self->_numLatestLanguages;
    int v9 = 136315394;
    v10 = "-[CSLanguageDetector _setNumLatestLangFromConfigFile:]";
    __int16 v11 = 2050;
    unint64_t v12 = numLatestLanguages;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting NumLatestLanguages to %{public}lu ", (uint8_t *)&v9, 0x16u);
  }
}

- (id)_constructLangPriors
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_latestDetectedLanguages;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v12 = objc_msgSend(v4, "objectForKey:", v11, (void)v18);

        if (v12)
        {
          [v12 floatValue];
          float v14 = (float)(v13 * (float)(unint64_t)[(NSMutableArray *)self->_latestDetectedLanguages count])
              + 1.0;
        }
        else
        {
          float v14 = 1.0;
        }
        *(float *)&double v15 = v14 / (float)(unint64_t)[(NSMutableArray *)self->_latestDetectedLanguages count];
        v8 = [NSNumber numberWithFloat:v15];

        [v4 setObject:v8 forKey:v11];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v7);
  }
  uint64_t v16 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v23 = "-[CSLanguageDetector _constructLangPriors]";
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Recoreded language array: %@ Language Prior Dictionary: %@", buf, 0x20u);
  }

  return v4;
}

- (void)setMostRecentRecognitionLanguage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CSLanguageDetector_setMostRecentRecognitionLanguage___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __55__CSLanguageDetector_setMostRecentRecognitionLanguage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 count] - 1;
  return [v2 setObject:v1 atIndexedSubscript:v3];
}

- (void)_recordRecognitionLanguage:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_latestDetectedLanguages count] >= self->_numLatestLanguages) {
    [(NSMutableArray *)self->_latestDetectedLanguages removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_latestDetectedLanguages addObject:v4];
}

- (void)recordRecognitionLanguage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CSLanguageDetector_recordRecognitionLanguage___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __48__CSLanguageDetector_recordRecognitionLanguage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recordRecognitionLanguage:*(void *)(a1 + 40)];
}

- (void)_initializeStartOfSpeechDetector:(id)a3 samplingRate:(float)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 startOfSpeechDetectorConfigFile];
  id v8 = [(CSLanguageDetector *)self _readJsonDictionaryAt:v7];

  if (!v8)
  {
    id v8 = [(CSLanguageDetector *)self _getDefaultValues];
  }
  if (!self->_circBuffer)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F5D1B8]);
    v10 = [v8 objectForKeyedSubscript:@"HistBufferSizeinSecs"];
    [v10 floatValue];
    uint64_t v11 = (CSAudioCircularBuffer *)objc_msgSend(v9, "initWithNumChannels:recordingDuration:samplingRate:", 1);
    circBuffer = self->_circBuffer;
    self->_circBuffer = v11;
  }
  float v13 = [CSStartOfSpeechDetector alloc];
  float v14 = [v6 spgConfigFile];

  double v15 = [v8 objectForKeyedSubscript:@"MinSpeechFrames"];
  uint64_t v16 = [v15 integerValue];
  id v17 = [v8 objectForKeyedSubscript:@"NumLeadingFrames"];
  long long v18 = -[CSStartOfSpeechDetector initWithConfig:samplingRate:minSpeechFrames:numLeadingFrames:delegate:](v13, "initWithConfig:samplingRate:minSpeechFrames:numLeadingFrames:delegate:", v14, (unint64_t)a4, v16, [v17 integerValue], self);
  startOfSpeechDetector = self->_startOfSpeechDetector;
  self->_startOfSpeechDetector = v18;

  if (!self->_circBuffer || !self->_startOfSpeechDetector)
  {
    long long v20 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      __int16 v22 = "-[CSLanguageDetector _initializeStartOfSpeechDetector:samplingRate:]";
      _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_DEFAULT, "%s Failed to initialize StartOfSpeechDetector !", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)setInteractionIDforCurrentRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CSLanguageDetector_setInteractionIDforCurrentRequest___block_invoke;
  v7[3] = &unk_1E658D4B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__CSLanguageDetector_setInteractionIDforCurrentRequest___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 136315394;
    id v8 = "-[CSLanguageDetector setInteractionIDforCurrentRequest:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Setting interaction ID for current request: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) copy];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v4;
}

- (void)cancelCurrentRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CSLanguageDetector_cancelCurrentRequest__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __42__CSLanguageDetector_cancelCurrentRequest__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 56) = 3;
  [*(id *)(*(void *)(a1 + 32) + 40) endAudio];
  [*(id *)(*(void *)(a1 + 32) + 32) endAudio];
  id v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[CSLanguageDetector cancelCurrentRequest]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Current LanguageDetector request cancelled", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_resetStartOfSpeechDetector
{
  self->_startOfSpeechDetected = 0;
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CSLanguageDetector_endAudio__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__CSLanguageDetector_endAudio__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = 2;
  [*(id *)(*(void *)(a1 + 32) + 40) endAudio];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v2 endAudio];
}

- (void)addSamples:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CSLanguageDetector_addSamples_numSamples___block_invoke;
  block[3] = &unk_1E658CEC8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __44__CSLanguageDetector_addSamples_numSamples___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  if (*(unsigned char *)(v3 + 8))
  {
    uint64_t v4 = *(void **)(v3 + 32);
    uint64_t v5 = [v2 bytes];
    uint64_t v6 = a1[6];
    return [v4 addAudioSamples:v5 count:v6];
  }
  else
  {
    objc_msgSend(*(id *)(v3 + 48), "addSamples:numSamples:", objc_msgSend(v2, "bytes"), a1[6]);
    uint64_t v8 = a1[5];
    __int16 v9 = *(void **)(a1[4] + 40);
    uint64_t v10 = a1[6];
    return [v9 addAudio:v8 numSamples:v10];
  }
}

- (void)resetForNewRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CSLanguageDetector_resetForNewRequest___block_invoke;
  v7[3] = &unk_1E658D4B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __41__CSLanguageDetector_resetForNewRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = 0;

  unint64_t v12 = *(unsigned char **)(a1 + 32);
  if (v12[9])
  {
    float v13 = +[CSAssetControllerFactory defaultController];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__CSLanguageDetector_resetForNewRequest___block_invoke_2;
    v16[3] = &unk_1E658B528;
    float v14 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v14;
    [v13 assetOfType:2 language:@"en-US" completion:v16];

    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    [v12 _setupLanguageDetectorWithOption:v15];
  }
}

void __41__CSLanguageDetector_resetForNewRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 104);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__CSLanguageDetector_resetForNewRequest___block_invoke_3;
  v11[3] = &unk_1E658C308;
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __41__CSLanguageDetector_resetForNewRequest___block_invoke_3(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    objc_storeStrong((id *)(a1[6] + 88), v2);
    uint64_t v3 = (void *)a1[6];
    uint64_t v4 = a1[7];
    [v3 _setupLanguageDetectorWithOption:v4];
  }
  else
  {
    id v5 = (void *)*MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)a1[5];
      uint64_t v7 = v5;
      uint64_t v8 = [v6 localizedDescription];
      int v9 = 136315394;
      id v10 = "-[CSLanguageDetector resetForNewRequest:]_block_invoke_3";
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s Cannot access asset : %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_setupLanguageDetectorWithOption:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CSAsset *)self->_currentAsset hashFromResourcePath];
  id v6 = (NSString *)[v5 copy];
  languageDetectorAssetHash = self->_languageDetectorAssetHash;
  self->_languageDetectorAssetHash = v6;

  uint64_t v8 = [(CSAsset *)self->_currentAsset languageDetectorConfigFile];
  int v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    [(CSLanguageDetector *)self _setNumLatestLangFromConfigFile:v8];
    __int16 v11 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      __int16 v24 = "-[CSLanguageDetector _setupLanguageDetectorWithOption:]";
      __int16 v25 = 2114;
      __int16 v26 = v8;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s Creating LanguageDetector with config: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    id v12 = (_EARLanguageDetector *)[objc_alloc(MEMORY[0x1E4F60FD8]) initWithConfigFile:v8];
    languageDetector = self->_languageDetector;
    self->_languageDetector = v12;

    uint64_t v14 = [(CSLanguageDetector *)self _constructLangPriors];
    [v4 setDictationLanguagePriors:v14];

    id v15 = self->_languageDetector;
    [v4 samplingRate];
    unint64_t v17 = (unint64_t)v16;
    long long v18 = [v4 languageDetectorRequestContext];
    long long v19 = [(_EARLanguageDetector *)v15 startRequestWith:v17 context:v18 delegate:self];
    audioBuffer = self->_audioBuffer;
    self->_audioBuffer = v19;

    currentAsset = self->_currentAsset;
    [v4 samplingRate];
    -[CSLanguageDetector _initializeStartOfSpeechDetector:samplingRate:](self, "_initializeStartOfSpeechDetector:samplingRate:", currentAsset);
    [(CSLanguageDetector *)self _resetStartOfSpeechDetector];
    self->_currentState = 1;
  }
  else
  {
    __int16 v22 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315138;
      __int16 v24 = "-[CSLanguageDetector _setupLanguageDetectorWithOption:]";
      _os_log_error_impl(&dword_1C9338000, v22, OS_LOG_TYPE_ERROR, "%s Cannot initialize language detector since model file is not exits", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)_startMonitorLanguageDetectorAssetDownload
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_notifyToken == -1)
  {
    queue = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __64__CSLanguageDetector__startMonitorLanguageDetectorAssetDownload__block_invoke;
    handler[3] = &unk_1E658D0D0;
    handler[4] = self;
    notify_register_dispatch("com.apple.MobileAsset.LanguageDetectorAssets.ma.new-asset-installed", &self->_notifyToken, queue, handler);
  }
  else
  {
    uint64_t v2 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[CSLanguageDetector _startMonitorLanguageDetectorAssetDownload]";
      _os_log_error_impl(&dword_1C9338000, v2, OS_LOG_TYPE_ERROR, "%s Cannot start monitoring language detector asset, since we already registered", buf, 0xCu);
    }
  }
}

uint64_t __64__CSLanguageDetector__startMonitorLanguageDetectorAssetDownload__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = 1;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CSLanguageDetector;
  [(CSLanguageDetector *)&v2 dealloc];
}

- (CSLanguageDetector)initWithModelURL:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSLanguageDetector;
  id v5 = [(CSLanguageDetector *)&v15 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F5D1A0];
    uint64_t v7 = [v4 path];
    uint64_t v8 = [v6 assetForAssetType:2 resourcePath:v7 configVersion:@"dummy-version"];
    currentAsset = v5->_currentAsset;
    v5->_currentAsset = (CSAsset *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("CSLanguageDetector", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v5->_needsToUpdateModel = 0;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    latestDetectedLanguages = v5->_latestDetectedLanguages;
    v5->_latestDetectedLanguages = (NSMutableArray *)v12;
  }
  return v5;
}

- (CSLanguageDetector)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSLanguageDetector;
  objc_super v2 = [(CSLanguageDetector *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    dispatch_queue_t v4 = dispatch_queue_create("CSLanguageDetector", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v3->_needsToUpdateModel = 1;
    [(CSLanguageDetector *)v3 _startMonitorLanguageDetectorAssetDownload];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    latestDetectedLanguages = v3->_latestDetectedLanguages;
    v3->_latestDetectedLanguages = (NSMutableArray *)v6;
  }
  return v3;
}

@end