@interface CSKeywordAnalyzerNDAPI
- (CSKeywordAnalyzerNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4;
- (float)getLoggingThreshold;
- (float)getRejectLoggingThreshold;
- (float)getThreshold;
- (id)_keywordAnalyzerNDAPIResultFromNovDetectorResult:(id)a3 phId:(unint64_t)a4;
- (id)getAnalyzedResults;
- (id)getAnalyzedResultsFromAudioChunk:(id)a3;
- (id)getBestAnalyzedResults;
- (id)getBestAnalyzedResultsFromAudioChunk:(id)a3;
- (id)getSuperVectorWithEndPoint:(unint64_t)a3;
- (unint64_t)activeChannel;
- (unsigned)activePhId;
- (void)_processAudioChunk:(id)a3;
- (void)_resetStartAnalyzeTime;
- (void)_setStartAnalyzeTime:(unint64_t)a3;
- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4;
- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4;
- (void)processAudioChunk:(id)a3;
- (void)reset;
- (void)resetBest;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setActivePhId:(unsigned int)a3;
@end

@implementation CSKeywordAnalyzerNDAPI

- (void).cxx_destruct
{
}

- (void)setActivePhId:(unsigned int)a3
{
  self->_activePhId = a3;
}

- (unsigned)activePhId
{
  return self->_activePhId;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (float)getRejectLoggingThreshold
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(CSNovDetector *)self->_novDetector getOptionValue:@"threshold_reject_logging"];
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[CSKeywordAnalyzerNDAPI getRejectLoggingThreshold]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s NDAPI config doesn't contain threshold_reject_logging", (uint8_t *)&v8, 0xCu);
    }
    float v5 = INFINITY;
  }

  return v5;
}

- (float)getLoggingThreshold
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(CSNovDetector *)self->_novDetector getOptionValue:@"threshold_logging"];
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[CSKeywordAnalyzerNDAPI getLoggingThreshold]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s NDAPI config doesn't contain threshold_logging", (uint8_t *)&v8, 0xCu);
    }
    float v5 = INFINITY;
  }

  return v5;
}

- (float)getThreshold
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(CSNovDetector *)self->_novDetector getOptionValue:@"threshold_normal"];
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "-[CSKeywordAnalyzerNDAPI getThreshold]";
      _os_log_fault_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_FAULT, "%s NDAPI config doesn't contain threshold_normal", (uint8_t *)&v8, 0xCu);
    }
    float v5 = INFINITY;
  }

  return v5;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  return [(CSNovDetector *)self->_novDetector getSuperVectorWithEndPoint:a3 - (self->_startAnalyzeSampleCount + self->_sampleFedWrapAroundOffset)];
}

- (id)getBestAnalyzedResults
{
  v3 = [(CSNovDetector *)self->_novDetector getBestAnalyzedResult];
  float v4 = -[CSKeywordAnalyzerNDAPI _keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:](self, "_keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:", v3, [v3 bestPhrase]);

  return v4;
}

- (id)getAnalyzedResults
{
  unsigned int v3 = [(CSNovDetector *)self->_novDetector numResultsAvailable];
  if (v3)
  {
    unsigned int v4 = v3;
    float v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = 0;
    uint64_t v7 = v4;
    do
    {
      int v8 = [(CSNovDetector *)self->_novDetector getAnalyzedResultForPhId:v6];
      v9 = [(CSKeywordAnalyzerNDAPI *)self _keywordAnalyzerNDAPIResultFromNovDetectorResult:v8 phId:v6];
      [v5 addObject:v9];

      ++v6;
    }
    while (v7 != v6);
  }
  else
  {
    float v5 = 0;
  }
  return v5;
}

- (id)_keywordAnalyzerNDAPIResultFromNovDetectorResult:(id)a3 phId:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = objc_alloc_init(CSKeywordAnalyzerNDAPIResult);
    [(CSKeywordAnalyzerNDAPIResult *)v7 setPhId:a4];
    -[CSKeywordAnalyzerNDAPIResult setSamplesFed:](v7, "setSamplesFed:", [v6 sampleFed]);
    -[CSKeywordAnalyzerNDAPIResult setBestPhrase:](v7, "setBestPhrase:", [v6 bestPhrase]);
    -[CSKeywordAnalyzerNDAPIResult setBestStart:](v7, "setBestStart:", self->_startAnalyzeSampleCount + [v6 bestStart] + self->_sampleFedWrapAroundOffset);
    -[CSKeywordAnalyzerNDAPIResult setBestEnd:](v7, "setBestEnd:", self->_startAnalyzeSampleCount + [v6 bestEnd] + self->_sampleFedWrapAroundOffset);
    [v6 bestScore];
    -[CSKeywordAnalyzerNDAPIResult setBestScore:](v7, "setBestScore:");
    -[CSKeywordAnalyzerNDAPIResult setIsEarlyWarning:](v7, "setIsEarlyWarning:", [v6 earlyWarning]);
    uint64_t v8 = [v6 sampleFed];

    [(CSKeywordAnalyzerNDAPIResult *)v7 setSamplesAtFire:self->_startAnalyzeSampleCount + v8 + self->_sampleFedWrapAroundOffset];
    [(CSKeywordAnalyzerNDAPIResult *)v7 setStartSampleCount:self->_startAnalyzeSampleCount];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4
{
}

- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
}

- (void)_processAudioChunk:(id)a3
{
  id v4 = a3;
  -[CSKeywordAnalyzerNDAPI _setStartAnalyzeTime:](self, "_setStartAnalyzeTime:", [v4 startSampleCount]);
  uint64_t v5 = [v4 numSamples];
  int v6 = [v4 isFloat];
  uint64_t v7 = [v4 dataForChannel:self->_activeChannel];

  if (v6) {
    [(CSKeywordAnalyzerNDAPI *)self analyzeWavFloatData:v7 numSamples:v5];
  }
  else {
    [(CSKeywordAnalyzerNDAPI *)self analyzeWavData:v7 numSamples:v5];
  }

  uint64_t v8 = [(CSNovDetector *)self->_novDetector getAnalyzedResultForPhId:self->_activePhId];
  if (v8)
  {
    id v9 = v8;
    if ([v8 sampleFed] < self->_lastSampleFed) {
      self->_sampleFedWrapAroundOffset += 0xFFFFFFFFLL;
    }
    self->_lastSampleFed = [v9 sampleFed];
    uint64_t v8 = v9;
  }
}

- (id)getBestAnalyzedResultsFromAudioChunk:(id)a3
{
  [(CSKeywordAnalyzerNDAPI *)self _processAudioChunk:a3];
  return [(CSKeywordAnalyzerNDAPI *)self getBestAnalyzedResults];
}

- (id)getAnalyzedResultsFromAudioChunk:(id)a3
{
  [(CSKeywordAnalyzerNDAPI *)self _processAudioChunk:a3];
  return [(CSKeywordAnalyzerNDAPI *)self getAnalyzedResults];
}

- (void)processAudioChunk:(id)a3
{
  id v3 = [(CSKeywordAnalyzerNDAPI *)self getAnalyzedResultsFromAudioChunk:a3];
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_startAnalyzeSampleCount = a3;
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      int v6 = "-[CSKeywordAnalyzerNDAPI _setStartAnalyzeTime:]";
      __int16 v7 = 2050;
      unint64_t v8 = a3;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s set StartAnalyzeSampleCount = %{public}lld", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_startAnalyzeSampleCount = 0;
}

- (void)resetBest
{
}

- (void)reset
{
  self->_lastSampleFed = 0;
  self->_sampleFedWrapAroundOffset = 0;
  [(CSNovDetector *)self->_novDetector reset];
  [(CSKeywordAnalyzerNDAPI *)self _resetStartAnalyzeTime];
}

- (CSKeywordAnalyzerNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSKeywordAnalyzerNDAPI;
  unint64_t v8 = [(CSKeywordAnalyzerNDAPI *)&v14 init];
  if (v8
    && (uint64_t v9 = [[CSNovDetector alloc] initWithConfigPath:v6 resourcePath:v7], novDetector = v8->_novDetector, v8->_novDetector = v9, novDetector, !v8->_novDetector))
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSKeywordAnalyzerNDAPI initWithConfigPath:resourcePath:]";
      _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s NDAPI initialization failed", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

@end