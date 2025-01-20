@interface CSSingleCheckerPhraseDetector
- (CSSingleCheckerPhraseDetector)init;
- (CSSyncKeywordAnalyzerQuasar)syncKeywordAnalyzerQuasar;
- (NSMutableArray)phraseDetectorInfos;
- (NSMutableArray)phraseResult;
- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 quasarResult:(id)a5;
- (id)_phraseDetectorResultFromQuasarResult:(id)a3;
- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 phraseResult:(id)a4;
- (id)getAnalyzedResultFromAudioChunk:(id)a3;
- (id)getAnalyzedResultFromFlushedAudio;
- (id)phraseDetectorInfoFromPhId:(unint64_t)a3;
- (unint64_t)processedSampleCount;
- (void)dealloc;
- (void)reset;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setConfig:(id)a3;
- (void)setPhraseDetectorInfos:(id)a3;
- (void)setPhraseResult:(id)a3;
- (void)setProcessedSampleCount:(unint64_t)a3;
- (void)setSyncKeywordAnalyzerQuasar:(id)a3;
@end

@implementation CSSingleCheckerPhraseDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseResult, 0);
  objc_storeStrong((id *)&self->_phraseDetectorInfos, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, 0);
}

- (void)setProcessedSampleCount:(unint64_t)a3
{
  self->_processedSampleCount = a3;
}

- (unint64_t)processedSampleCount
{
  return self->_processedSampleCount;
}

- (void)setPhraseResult:(id)a3
{
}

- (NSMutableArray)phraseResult
{
  return self->_phraseResult;
}

- (void)setPhraseDetectorInfos:(id)a3
{
}

- (NSMutableArray)phraseDetectorInfos
{
  return self->_phraseDetectorInfos;
}

- (void)setSyncKeywordAnalyzerQuasar:(id)a3
{
}

- (CSSyncKeywordAnalyzerQuasar)syncKeywordAnalyzerQuasar
{
  return self->_syncKeywordAnalyzerQuasar;
}

- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 phraseResult:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "decision", (void)v16) == a3)
        {
          v12 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v12;
            uint64_t v14 = [v10 phId];
            *(_DWORD *)buf = 136315650;
            v21 = "-[CSSingleCheckerPhraseDetector _resultCopyWithKeywordDetectorDecision:phraseResult:]";
            __int16 v22 = 2048;
            unint64_t v23 = a3;
            __int16 v24 = 2048;
            uint64_t v25 = v14;
            _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Reporting decision (%tu) from (%tu)", buf, 0x20u);
          }
          v11 = (void *)[v10 copy];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 quasarResult:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([(NSMutableArray *)self->_phraseResult count] <= a3)
  {
    long long v17 = 0;
  }
  else
  {
    v10 = [v8 phraseConfig];
    [v8 effectiveKeywordThreshold];
    float v12 = v11;
    [v10 recognizerScoreScaleFactor];
    float v14 = v13;
    if (v9)
    {
      [v9 triggerConfidence];
      double v16 = v15;
    }
    else
    {
      double v16 = -1000.0;
    }
    uint64_t v18 = _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat;
    if (0xEEEEEEEEEEEEEEEFLL * _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat <= 0x1111111111111111)
    {
      long long v19 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        double v20 = v14;
        v21 = v19;
        int v22 = [v9 isValidResult];
        *(void *)&v33[4] = "-[CSSingleCheckerPhraseDetector _getResultWithPhId:phraseDetectorInfo:quasarResult:]";
        *(_WORD *)&v33[12] = 2048;
        unint64_t v23 = @"NO";
        *(_DWORD *)v33 = 136316162;
        *(void *)&v33[14] = a3;
        *(_WORD *)&v33[22] = 2050;
        if (v22) {
          unint64_t v23 = @"YES";
        }
        double v34 = v16;
        __int16 v35 = 2050;
        double v36 = v20;
        __int16 v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1BA1A5000, v21, OS_LOG_TYPE_INFO, "%s [(%lu)] : second pass best quasar score = %{public}f, quasar scale factor = %{public}f, quasarResult is valid? %@", v33, 0x34u);

        uint64_t v18 = _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat;
      }
    }
    _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat = v18 + 1;
    if (objc_msgSend(v9, "isValidResult", *(_OWORD *)v33, *(void *)&v33[16]))
    {
      double v24 = v12;
      uint64_t v25 = CSLogContextFacilityCoreSpeech;
      BOOL v26 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      if (v16 >= v24)
      {
        if (v26)
        {
          *(_DWORD *)v33 = 136315906;
          *(void *)&v33[4] = "-[CSSingleCheckerPhraseDetector _getResultWithPhId:phraseDetectorInfo:quasarResult:]";
          *(_WORD *)&v33[12] = 2048;
          *(void *)&v33[14] = a3;
          *(_WORD *)&v33[22] = 2050;
          double v34 = v16;
          __int16 v35 = 2050;
          double v36 = v24;
          _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Trigger detected in Quasar,                   recognizerScore = %{public}lf, effective threshold = %{public}f", v33, 0x2Au);
        }
        uint64_t v27 = 1;
      }
      else
      {
        if (v26)
        {
          *(_DWORD *)v33 = 136315906;
          *(void *)&v33[4] = "-[CSSingleCheckerPhraseDetector _getResultWithPhId:phraseDetectorInfo:quasarResult:]";
          *(_WORD *)&v33[12] = 2048;
          *(void *)&v33[14] = a3;
          *(_WORD *)&v33[22] = 2050;
          double v34 = v16;
          __int16 v35 = 2050;
          double v36 = v24;
          _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Notify second pass reject               with best quasar score up to: %{public}.3f, effective threshold = %{public}f", v33, 0x2Au);
        }
        uint64_t v27 = 3;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
    v28 = [CSSinglePhraseResult alloc];
    *(float *)&double v29 = v16;
    LODWORD(v30) = -8388608;
    *(float *)&double v31 = v16;
    long long v17 = [(CSSinglePhraseResult *)v28 initWithPhId:a3 keywordDetectorDecision:v27 combinedScore:0 ndapiScore:0 ndapiResult:0 recognizerScore:self->_syncKeywordAnalyzerQuasar != 0 isSecondChance:v29 isSecondChanceCandidate:v30 isRunningQuasar:v31];
  }
  return v17;
}

- (id)_phraseDetectorResultFromQuasarResult:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_phraseDetectorInfos;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v31;
    *(void *)&long long v6 = 136315394;
    long long v24 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v4, "count", v24) <= (unint64_t)(v8 + i))
        {
          float v12 = 0;
        }
        else
        {
          float v12 = [v4 objectAtIndex:v8 + i];
        }
        float v13 = [(CSSingleCheckerPhraseDetector *)self _getResultWithPhId:v8 + i phraseDetectorInfo:v11 quasarResult:v12];
        if (v13 && [(NSMutableArray *)self->_phraseResult count] > (unint64_t)(v8 + i))
        {
          [(NSMutableArray *)self->_phraseResult setObject:v13 atIndexedSubscript:v8 + i];
        }
        else
        {
          float v14 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            double v36 = "-[CSSingleCheckerPhraseDetector _phraseDetectorResultFromQuasarResult:]";
            __int16 v37 = 2048;
            uint64_t v38 = v8 + i;
            _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s Received invalid result with %tu", buf, 0x16u);
          }
        }
      }
      v8 += i;
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v7);
  }

  double v15 = [(CSSingleCheckerPhraseDetector *)self _resultCopyWithKeywordDetectorDecision:1 phraseResult:self->_phraseResult];
  if (!v15)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v16 = self->_phraseResult;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
LABEL_19:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(NSMutableArray **)(*((void *)&v26 + 1) + 8 * v20);
        if (![(NSMutableArray *)v21 decision]) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v18) {
            goto LABEL_19;
          }
          goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:

      double v15 = [(CSSingleCheckerPhraseDetector *)self _resultCopyWithKeywordDetectorDecision:3 phraseResult:self->_phraseResult];
      if (v15) {
        goto LABEL_30;
      }
      int v22 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v36 = "-[CSSingleCheckerPhraseDetector _phraseDetectorResultFromQuasarResult:]";
        _os_log_fault_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_FAULT, "%s Phrase detector results fall-into unexpected use case, we return the first phrase result", buf, 0xCu);
      }
      v21 = [(NSMutableArray *)self->_phraseResult objectAtIndexedSubscript:0];
      double v16 = v21;
    }
    double v15 = (void *)[(NSMutableArray *)v21 copy];
  }
LABEL_30:

  return v15;
}

- (id)phraseDetectorInfoFromPhId:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_phraseDetectorInfos count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_phraseDetectorInfos objectAtIndex:a3];
  }
  return v5;
}

- (id)getAnalyzedResultFromFlushedAudio
{
  v3 = [(CSSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar getResultsFromFlushedAudio];
  id v4 = [(CSSingleCheckerPhraseDetector *)self _phraseDetectorResultFromQuasarResult:v3];

  return v4;
}

- (id)getAnalyzedResultFromAudioChunk:(id)a3
{
  if (a3)
  {
    syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
    id v5 = a3;
    long long v6 = [(CSSyncKeywordAnalyzerQuasar *)syncKeywordAnalyzerQuasar getAnalyzedResultsFromAudioChunk:v5];
    uint64_t v7 = [v5 numSamples];

    self->_processedSampleCount += v7;
    uint64_t v8 = [(CSSingleCheckerPhraseDetector *)self _phraseDetectorResultFromQuasarResult:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (void)setConfig:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 phraseConfigs];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(NSMutableArray *)self->_phraseDetectorInfos removeAllObjects];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v7 = [v4 phraseConfigs];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          float v12 = [[CSPhraseDetectorInfo alloc] initWithPhraseConfig:*(void *)(*((void *)&v53 + 1) + 8 * i)];
          if (v12) {
            [(NSMutableArray *)self->_phraseDetectorInfos addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v9);
    }

    float v13 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    float v14 = self->_phraseDetectorInfos;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v49 + 1) + 8 * j) phraseConfig];
          uint64_t v20 = [v19 recognizerToken];
          [v13 addObject:v20];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v16);
    }

    v21 = [CSSyncKeywordAnalyzerQuasar alloc];
    id v44 = v4;
    int v22 = [v4 configPathRecognizer];
    unint64_t v23 = [(CSSyncKeywordAnalyzerQuasar *)v21 initWithConfigPath:v22 triggerTokensArray:v13 preventDuplicatedReset:0 memoryLock:0];
    syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
    self->_syncKeywordAnalyzerQuasar = v23;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v25 = self->_phraseDetectorInfos;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(void **)(*((void *)&v45 + 1) + 8 * k);
          long long v31 = [v30 phraseConfig];
          [v31 threshold];
          float v37 = *(float *)&v32;
          if (self->_syncKeywordAnalyzerQuasar)
          {
            [v31 recognizerScoreOffset];
            float v39 = v38;
            float v37 = v37 + v38;
            [v31 recognizerScoreScaleFactor];
            LODWORD(v40) = LODWORD(v32);
          }
          else
          {
            float v39 = 0.0;
            double v40 = 0.0;
          }
          LODWORD(v33) = 2139095040;
          *(float *)&double v32 = v37;
          LODWORD(v34) = 2139095040;
          *(float *)&double v35 = v39;
          LODWORD(v36) = 2139095040;
          v41 = (void *)[v31 copyWithThreshold:v32 secondChanceThreshold:v33 loggingThreshold:v34 ndapiScaleFactor:0.0 recognizerScoreOffset:v35 recognizerScoreScaleFactor:v40 keywordRejectLoggingThreshold:v36];
          [v30 setPhraseConfig:v41];
          *(float *)&double v42 = v37;
          [v30 setEffectiveKeywordThreshold:v42];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v27);
    }

    [(CSSingleCheckerPhraseDetector *)self reset];
    id v4 = v44;
  }
  else
  {
    v43 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v61 = "-[CSSingleCheckerPhraseDetector setConfig:]";
      _os_log_error_impl(&dword_1BA1A5000, v43, OS_LOG_TYPE_ERROR, "%s Invalid assets config!", buf, 0xCu);
    }
  }
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[CSSingleCheckerPhraseDetector reset]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  [(CSSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar reset];
  [(NSMutableArray *)self->_phraseResult removeAllObjects];
  if ([(NSMutableArray *)self->_phraseDetectorInfos count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [CSSinglePhraseResult alloc];
      LODWORD(v6) = -8388608;
      LODWORD(v7) = -998637568;
      LODWORD(v8) = -8388608;
      uint64_t v9 = [(CSSinglePhraseResult *)v5 initWithPhId:v4 keywordDetectorDecision:0 combinedScore:0 ndapiScore:0 ndapiResult:0 recognizerScore:self->_syncKeywordAnalyzerQuasar != 0 isSecondChance:v6 isSecondChanceCandidate:v8 isRunningQuasar:v7];
      [(NSMutableArray *)self->_phraseResult addObject:v9];

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_phraseDetectorInfos count]);
  }
  self->_processedSampleCount = 0;
}

- (void)setActiveChannel:(unint64_t)a3
{
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v6 = "-[CSSingleCheckerPhraseDetector dealloc]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CSPhraseDetector Deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSingleCheckerPhraseDetector;
  [(CSSingleCheckerPhraseDetector *)&v4 dealloc];
}

- (CSSingleCheckerPhraseDetector)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSSingleCheckerPhraseDetector;
  v2 = [(CSSingleCheckerPhraseDetector *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    phraseDetectorInfos = v2->_phraseDetectorInfos;
    v2->_phraseDetectorInfos = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    phraseResult = v2->_phraseResult;
    v2->_phraseResult = (NSMutableArray *)v5;

    v2->_processedSampleCount = 0;
  }
  return v2;
}

@end