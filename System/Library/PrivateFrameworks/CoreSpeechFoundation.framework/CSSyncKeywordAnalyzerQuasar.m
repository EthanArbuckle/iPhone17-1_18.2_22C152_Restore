@interface CSSyncKeywordAnalyzerQuasar
+ (id)_phToPhIdMapFromTriggerTokensArray:(id)a3;
+ (void)dumpEARSpeechRecognitionResults:(id)a3;
- (CSSyncKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokensArray:(id)a4 preventDuplicatedReset:(BOOL)a5 memoryLock:(BOOL)a6;
- (id)_getAnalyzedResults:(id)a3;
- (id)getAnalyzedResultsFromAudioChunk:(id)a3;
- (id)getResultsFromFlushedAudio;
- (unint64_t)activeChannel;
- (void)flushAudio;
- (void)processAudioChunk:(id)a3;
- (void)reset;
- (void)setActiveChannel:(unint64_t)a3;
@end

@implementation CSSyncKeywordAnalyzerQuasar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phToPhIdMap, 0);
  objc_storeStrong((id *)&self->_syncRecognizer, 0);
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (id)_getAnalyzedResults:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  if (self->_numPhrases)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [[CSSyncKeywordAnalyzerQuasarResult alloc] initWithDefaultConfidence];
      [v4 addObject:v6];

      ++v5;
    }
    while (v5 < self->_numPhrases);
  }
  v35 = self;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v34;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v36 + 1) + 8 * i) tokens];
        v12 = [v11 lastObject];

        if (!v12
          || ([v12 tokenName],
              v13 = objc_claimAutoreleasedReturnValue(),
              BOOL v14 = v13 == 0,
              v13,
              v14))
        {
          uint64_t v28 = CSLogContextFacilityCoreSpeech;
          if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 136315394;
          v41 = "-[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:]";
          __int16 v42 = 2114;
          unint64_t v43 = (unint64_t)v12;
          v29 = v28;
          v30 = "%s Invalid token : %{public}@";
          uint32_t v31 = 22;
LABEL_22:
          _os_log_error_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_ERROR, v30, buf, v31);
          goto LABEL_23;
        }
        phToPhIdMap = v35->_phToPhIdMap;
        v16 = [v12 tokenName];
        v17 = [(NSDictionary *)phToPhIdMap objectForKeyedSubscript:v16];
        unint64_t v18 = [v17 unsignedIntegerValue];

        v19 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v41 = "-[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:]";
          __int16 v42 = 2048;
          unint64_t v43 = v18;
          __int16 v44 = 2114;
          v45 = v12;
          _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s %tu, token = %{public}@", buf, 0x20u);
        }
        if (v18 >= [v4 count])
        {
          uint64_t v32 = CSLogContextFacilityCoreSpeech;
          if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 136315394;
          v41 = "-[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:]";
          __int16 v42 = 1024;
          LODWORD(v43) = v18;
          v29 = v32;
          v30 = "%s Unable to handle: %d";
          uint32_t v31 = 18;
          goto LABEL_22;
        }
        v20 = [v4 objectAtIndex:v18];
        [v20 triggerConfidence];
        double v22 = v21;

        [v12 confidence];
        double v24 = v23;
        v25 = [v4 objectAtIndexedSubscript:v18];
        v26 = v25;
        if (v24 >= v22) {
          double v27 = v24;
        }
        else {
          double v27 = v22;
        }
        [v25 setTriggerConfidence:v27];

LABEL_23:
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)getAnalyzedResultsFromAudioChunk:(id)a3
{
  id v4 = a3;
  self->_requireReset = 1;
  unint64_t v5 = [v4 dataForChannel:self->_activeChannel];
  unint64_t v6 = [v5 length];
  BOOL v7 = +[CSConfig inputRecordingIsFloat];
  unint64_t v8 = v6 >> 1;
  syncRecognizer = self->_syncRecognizer;
  if (v7) {
    [(_EARSyncSpeechRecognizer *)syncRecognizer resultsWithAddedFloatAudio:v5 numberOfSamples:v8 taskName:&stru_1F13A10B0];
  }
  else {
  v10 = [(_EARSyncSpeechRecognizer *)syncRecognizer resultsWithAddedAudio:v5 numberOfSamples:v8 taskName:&stru_1F13A10B0];
  }
  v11 = [(CSSyncKeywordAnalyzerQuasar *)self _getAnalyzedResults:v10];

  return v11;
}

- (void)processAudioChunk:(id)a3
{
  id v3 = [(CSSyncKeywordAnalyzerQuasar *)self getAnalyzedResultsFromAudioChunk:a3];
}

- (id)getResultsFromFlushedAudio
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v16, 0xCu);
  }
  kdebug_trace();
  uint64_t v4 = mach_absolute_time();
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)CSLogContextFacilityCoreSpeech);
  unint64_t v6 = (id)CSLogContextFacilityCoreSpeech;
  BOOL v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v16 = 134349570;
    v17 = (const char *)v4;
    __int16 v18 = 2080;
    double v19 = COERCE_DOUBLE("SiriX");
    __int16 v20 = 2080;
    double v21 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_1BA1A5000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SecondPassInferenceLatency", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v16, 0x20u);
  }

  unint64_t v8 = [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resultsWithEndedAudio];
  uint64_t v9 = [(CSSyncKeywordAnalyzerQuasar *)self _getAnalyzedResults:v8];

  uint64_t v10 = mach_absolute_time();
  v11 = (id)CSLogContextFacilityCoreSpeech;
  v12 = v11;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v16 = 134349570;
    v17 = (const char *)v10;
    __int16 v18 = 2080;
    double v19 = COERCE_DOUBLE("SiriX");
    __int16 v20 = 2080;
    double v21 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_1BA1A5000, v12, OS_SIGNPOST_INTERVAL_END, v5, "SecondPassInferenceLatency", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v16, 0x20u);
  }

  v13 = (id)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    +[CSFTimeUtils hostTimeToSeconds:v10 - v4];
    int v16 = 136315394;
    v17 = "-[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio]";
    __int16 v18 = 2048;
    double v19 = v14;
    _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Secondpass model inference took: %.3f seconds", (uint8_t *)&v16, 0x16u);
  }

  return v9;
}

- (void)flushAudio
{
  id v2 = [(CSSyncKeywordAnalyzerQuasar *)self getResultsFromFlushedAudio];
}

- (void)reset
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[CSSyncKeywordAnalyzerQuasar reset]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_requireReset)
  {
    syncRecognizer = self->_syncRecognizer;
    +[CSConfig inputRecordingSampleRate];
    LODWORD(v7) = 120;
    LOBYTE(v6) = 0;
    [(_EARSyncSpeechRecognizer *)syncRecognizer resetWithSamplingRate:v5 language:&stru_1F13A10B0 taskType:@"Dictation" userId:&stru_1F13A10B0 sessionId:&stru_1F13A10B0 deviceId:&stru_1F13A10B0 farField:v6 audioSource:&stru_1F13A10B0 maxAudioBufferSizeSeconds:v7];
    if (self->_preventDuplicatedReset) {
      self->_requireReset = 0;
    }
  }
}

- (CSSyncKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokensArray:(id)a4 preventDuplicatedReset:(BOOL)a5 memoryLock:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v10 = COERCE_DOUBLE(a3);
  id v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CSSyncKeywordAnalyzerQuasar;
  v12 = [(CSSyncKeywordAnalyzerQuasar *)&v27 init];
  if (v12)
  {
    uint64_t v13 = +[CSSyncKeywordAnalyzerQuasar _phToPhIdMapFromTriggerTokensArray:v11];
    phToPhIdMap = v12->_phToPhIdMap;
    v12->_phToPhIdMap = (NSDictionary *)v13;

    v12->_numPhrases = [v11 count];
    v12->_preventDuplicatedReset = a5;
    v15 = [MEMORY[0x1E4F28F80] processInfo];
    [v15 systemUptime];
    double v17 = v16;

    __int16 v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSSyncKeywordAnalyzerQuasar initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:]";
      __int16 v30 = 2114;
      double v31 = v10;
      _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Initializing Quasar with config: %{public}@", buf, 0x16u);
    }
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F61018]) initWithConfiguration:*(void *)&v10 memoryLock:v6];
    syncRecognizer = v12->_syncRecognizer;
    v12->_syncRecognizer = (_EARSyncSpeechRecognizer *)v19;

    double v21 = [MEMORY[0x1E4F28F80] processInfo];
    [v21 systemUptime];
    double v23 = v22;

    v12->_requireReset = 1;
    double v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSSyncKeywordAnalyzerQuasar initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:]";
      __int16 v30 = 2050;
      double v31 = (v23 - v17) * 1000.0;
      _os_log_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Speech model loading took %{public}.3fms", buf, 0x16u);
    }
  }
  v25 = v12;

  return v25;
}

+ (void)dumpEARSpeechRecognitionResults:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v3)
  {
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v4 = 0;
      uint64_t v16 = v3;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        float v5 = *(void **)(*((void *)&v22 + 1) + 8 * v4);
        BOOL v6 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v28 = "+[CSSyncKeywordAnalyzerQuasar dumpEARSpeechRecognitionResults:]";
          __int16 v29 = 2048;
          uint64_t v30 = v14;
          _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Res-%lu: ", buf, 0x16u);
          ++v14;
        }
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v7 = [v5 tokens];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
        uint64_t v17 = v4;
        if (v8)
        {
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v7);
              }
              id v11 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
                *(_DWORD *)buf = 136315394;
                uint64_t v28 = "+[CSSyncKeywordAnalyzerQuasar dumpEARSpeechRecognitionResults:]";
                __int16 v29 = 2112;
                uint64_t v30 = v12;
                _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s tok=%@", buf, 0x16u);
              }
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v3);
  }
}

+ (id)_phToPhIdMapFromTriggerTokensArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  for (unint64_t i = 0; i < [v3 count]; ++i)
  {
    BOOL v6 = [v3 objectAtIndexedSubscript:i];
    uint64_t v7 = [v6 componentsSeparatedByString:@"_"];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * j);
          uint64_t v13 = [NSNumber numberWithUnsignedInteger:i];
          [v4 setObject:v13 forKey:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return v4;
}

@end