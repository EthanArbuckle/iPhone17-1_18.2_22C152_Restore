@interface CSPhraseDetector
- (BOOL)_isSecondChanceCandidateWithScore:(float)a3 effectiveThreshold:(float)a4 secondChanceThreshold:(float)a5;
- (BOOL)isSecondChance;
- (CSKeywordAnalyzerNDAPI)syncKeywordAnalyzerNDAPI;
- (CSPhraseDetector)init;
- (CSSyncKeywordAnalyzerQuasar)syncKeywordAnalyzerQuasar;
- (NSArray)quasarCheckerResultAtCutOff;
- (NSMutableArray)phraseDetectorInfos;
- (NSMutableArray)phraseResult;
- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 ndapiResult:(id)a5 quasarResult:(id)a6 forceMaximized:(BOOL)a7;
- (id)_phraseDetectorResultFromNDAPIResults:(id)a3 quasarResult:(id)a4 forceMaximized:(BOOL)a5;
- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 bestPhId:(unint64_t)a4 phraseResult:(id)a5;
- (id)getAnalyzedResultFromAudioChunk:(id)a3;
- (id)getAnalyzedResultFromFlushedAudio;
- (id)getLosingPhraseResultsWithDetectedPhId:(unint64_t)a3;
- (id)phraseDetectorInfoFromPhId:(unint64_t)a3;
- (unint64_t)nearMissCandidateDetectedSamples;
- (unint64_t)nearMissDelayTimeout;
- (unint64_t)processedSampleCount;
- (unint64_t)quasarCheckerCutOffSamplesCount;
- (void)dealloc;
- (void)reset;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setConfig:(id)a3;
- (void)setIsSecondChance:(BOOL)a3;
- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3;
- (void)setNearMissDelayTimeout:(unint64_t)a3;
- (void)setPhraseDetectorInfos:(id)a3;
- (void)setPhraseResult:(id)a3;
- (void)setProcessedSampleCount:(unint64_t)a3;
- (void)setQuasarCheckerCutOffSamplesCount:(unint64_t)a3;
- (void)setQuasarCheckerResultAtCutOff:(id)a3;
- (void)setRunAsSecondChance:(BOOL)a3;
- (void)setSyncKeywordAnalyzerNDAPI:(id)a3;
- (void)setSyncKeywordAnalyzerQuasar:(id)a3;
@end

@implementation CSPhraseDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quasarCheckerResultAtCutOff, 0);
  objc_storeStrong((id *)&self->_phraseResult, 0);
  objc_storeStrong((id *)&self->_phraseDetectorInfos, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerNDAPI, 0);
}

- (void)setProcessedSampleCount:(unint64_t)a3
{
  self->_processedSampleCount = a3;
}

- (unint64_t)processedSampleCount
{
  return self->_processedSampleCount;
}

- (void)setQuasarCheckerCutOffSamplesCount:(unint64_t)a3
{
  self->_quasarCheckerCutOffSamplesCount = a3;
}

- (unint64_t)quasarCheckerCutOffSamplesCount
{
  return self->_quasarCheckerCutOffSamplesCount;
}

- (void)setQuasarCheckerResultAtCutOff:(id)a3
{
}

- (NSArray)quasarCheckerResultAtCutOff
{
  return self->_quasarCheckerResultAtCutOff;
}

- (void)setPhraseResult:(id)a3
{
}

- (NSMutableArray)phraseResult
{
  return self->_phraseResult;
}

- (void)setIsSecondChance:(BOOL)a3
{
  self->_isSecondChance = a3;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3
{
  self->_nearMissCandidateDetectedSamples = a3;
}

- (unint64_t)nearMissCandidateDetectedSamples
{
  return self->_nearMissCandidateDetectedSamples;
}

- (void)setNearMissDelayTimeout:(unint64_t)a3
{
  self->_nearMissDelayTimeout = a3;
}

- (unint64_t)nearMissDelayTimeout
{
  return self->_nearMissDelayTimeout;
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

- (void)setSyncKeywordAnalyzerNDAPI:(id)a3
{
}

- (CSKeywordAnalyzerNDAPI)syncKeywordAnalyzerNDAPI
{
  return self->_syncKeywordAnalyzerNDAPI;
}

- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 bestPhId:(unint64_t)a4 phraseResult:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = [v7 objectAtIndexedSubscript:a4];
  uint64_t v9 = [v8 decision];

  if (v9 == a3)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[CSPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:]";
      __int16 v29 = 2048;
      unint64_t v30 = a3;
      __int16 v31 = 2048;
      unint64_t v32 = a4;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Reporting decision (%tu) from (%tu)", buf, 0x20u);
    }
    v11 = [v7 objectAtIndexedSubscript:a4];
    id v12 = v11;
LABEL_16:
    v17 = (void *)[v11 copy];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v11, "decision", (void)v22) == a3)
          {
            v18 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              uint64_t v20 = [v11 phId];
              *(_DWORD *)buf = 136315650;
              v28 = "-[CSPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:]";
              __int16 v29 = 2048;
              unint64_t v30 = a3;
              __int16 v31 = 2048;
              unint64_t v32 = v20;
              _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Reporting decision (%tu) from (%tu)", buf, 0x20u);
            }
            goto LABEL_16;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isSecondChanceCandidateWithScore:(float)a3 effectiveThreshold:(float)a4 secondChanceThreshold:(float)a5
{
  BOOL v5 = a3 < a4;
  if (a3 < a5) {
    BOOL v5 = 0;
  }
  return !self->_isSecondChance && v5;
}

- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 ndapiResult:(id)a5 quasarResult:(id)a6 forceMaximized:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(NSMutableArray *)self->_phraseResult count] <= a3)
  {
    v19 = 0;
    goto LABEL_37;
  }
  BOOL v67 = v7;
  uint64_t v15 = [(NSMutableArray *)self->_phraseResult objectAtIndex:a3];
  v16 = [v12 phraseConfig];
  if (v15)
  {
    [v15 ndapiScore];
    float v18 = v17;
  }
  else
  {
    float v18 = -INFINITY;
  }
  uint64_t v20 = [v12 hasPendingNearMiss];
  [v12 effectiveKeywordThreshold];
  float v22 = v21;
  [v16 loggingThreshold];
  float v24 = v23;
  [v16 ndapiScaleFactor];
  float v26 = v25;
  [v16 recognizerScoreScaleFactor];
  float v28 = v27;
  if (v14)
  {
    [v14 triggerConfidence];
    double v30 = v29;
  }
  else
  {
    double v30 = -1000.0;
  }
  v69 = v15;
  [v13 bestScore];
  float v32 = v31;
  uint64_t v33 = v13;
  unint64_t v34 = [v13 samplesFed];
  uint64_t v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
  if (0xCCCCCCCCCCCCCCCDLL * _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat <= 0x3333333333333333)
  {
    log = CSLogContextFacilityCoreSpeech;
    double v36 = *(double *)&v34;
    BOOL v37 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO);
    unint64_t v34 = *(void *)&v36;
    if (v37)
    {
      *(_DWORD *)buf = 136316674;
      v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
      __int16 v72 = 2048;
      unint64_t v73 = a3;
      __int16 v74 = 2050;
      double v75 = v32;
      __int16 v76 = 2050;
      double v77 = v36;
      __int16 v78 = 2050;
      double v79 = v30;
      __int16 v80 = 2050;
      double v81 = v26;
      __int16 v82 = 2050;
      double v83 = v28;
      _os_log_impl(&dword_1BA1A5000, log, OS_LOG_TYPE_INFO, "%s [(%lu)] : NDAPI second pass best score = %{public}f with analyzed samples:                   %{public}tu with quasar score = %{public}f, ndapi scale factor = %{public}f, quasar scale factor = %{public}f", buf, 0x48u);
      unint64_t v34 = *(void *)&v36;
      uint64_t v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
    }
  }
  uint64_t v38 = v35 + 1;
  _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat = v35 + 1;
  float v39 = v32;
  if (self->_syncKeywordAnalyzerQuasar) {
    float v39 = (float)(v26 * v32) + v30 * v28;
  }
  uint64_t v40 = v20;
  id v13 = v33;
  if (v18 < v32 && !v67) {
    goto LABEL_16;
  }
  if (v39 >= v22)
  {
    v44 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      *(double *)&uint64_t v46 = COERCE_DOUBLE([v33 samplesFed]);
      *(_DWORD *)buf = 136316162;
      v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
      __int16 v72 = 2048;
      unint64_t v73 = a3;
      __int16 v74 = 2050;
      double v75 = *(double *)&v46;
      __int16 v76 = 2050;
      double v77 = v39;
      __int16 v78 = 2050;
      double v79 = v22;
      _os_log_impl(&dword_1BA1A5000, v45, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Trigger detected with %{public}tu analyzed samples in NDAPI,                   combined score = %{public}lf, effective threshold = %{public}f", buf, 0x34u);
    }
    uint64_t v41 = 1;
    goto LABEL_36;
  }
  if (v39 < v24)
  {
    if (v67)
    {
      double v42 = *(double *)&v34;
      v43 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
        __int16 v72 = 2048;
        unint64_t v73 = a3;
        __int16 v74 = 2050;
        double v75 = v42;
        __int16 v76 = 2050;
        double v77 = v39;
        _os_log_impl(&dword_1BA1A5000, v43, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Notify second pass reject at: %{public}tu                   with best score up to: %{public}.3f", buf, 0x2Au);
      }
      uint64_t v41 = 3;
      goto LABEL_36;
    }
    goto LABEL_16;
  }
  if (v67)
  {
LABEL_29:
    double v49 = *(double *)&v34;
    v50 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
      __int16 v72 = 2048;
      unint64_t v73 = a3;
      __int16 v74 = 2050;
      double v75 = v49;
      __int16 v76 = 2050;
      double v77 = v39;
      _os_log_impl(&dword_1BA1A5000, v50, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Detected near miss at %{public}lu samples                       with best score up to: %{public}.3f", buf, 0x2Au);
    }
    uint64_t v41 = 2;
    goto LABEL_36;
  }
  if (!v20)
  {
    self->_unint64_t nearMissCandidateDetectedSamples = v34;
    v51 = CSLogContextFacilityCoreSpeech;
    double v52 = *(double *)&v34;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t nearMissDelayTimeout = self->_nearMissDelayTimeout;
      *(_DWORD *)buf = 136315906;
      v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
      __int16 v72 = 2048;
      unint64_t v73 = a3;
      __int16 v74 = 2050;
      double v75 = v52;
      __int16 v76 = 2050;
      double v77 = *(double *)&nearMissDelayTimeout;
      _os_log_impl(&dword_1BA1A5000, v51, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Detected near miss candidate at %{public}tu,                       let's wait %{public}tu samples to log", buf, 0x2Au);
    }
    goto LABEL_35;
  }
  unint64_t v47 = self->_nearMissDelayTimeout;
  unint64_t nearMissCandidateDetectedSamples = self->_nearMissCandidateDetectedSamples;
  if (v47 + nearMissCandidateDetectedSamples < v34) {
    goto LABEL_29;
  }
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v38, 1) > 0x1999999999999999uLL)
  {
LABEL_35:
    uint64_t v41 = 0;
    uint64_t v40 = 1;
    goto LABEL_36;
  }
  unint64_t v68 = v34;
  v65 = CSLogContextFacilityCoreSpeech;
  uint64_t v40 = 1;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
    __int16 v72 = 2048;
    unint64_t v73 = a3;
    __int16 v74 = 2050;
    *(void *)&double v75 = v68 - nearMissCandidateDetectedSamples + v47;
    _os_log_impl(&dword_1BA1A5000, v65, OS_LOG_TYPE_INFO, "%s [(%tu)] : Waiting for logging near miss                               until timeout %{public}lu samples", buf, 0x20u);
  }
LABEL_16:
  uint64_t v41 = 0;
LABEL_36:
  [v12 setHasPendingNearMiss:v40];
  v54 = [v12 phraseConfig];
  [v54 secondChanceThreshold];
  LODWORD(v56) = v55;
  *(float *)&double v57 = v39;
  *(float *)&double v58 = v22;
  BOOL v59 = [(CSPhraseDetector *)self _isSecondChanceCandidateWithScore:v57 effectiveThreshold:v58 secondChanceThreshold:v56];

  v60 = [CSSinglePhraseResult alloc];
  *(float *)&double v61 = v30;
  *(float *)&double v62 = v39;
  *(float *)&double v63 = v32;
  v19 = [(CSSinglePhraseResult *)v60 initWithPhId:a3 keywordDetectorDecision:v41 combinedScore:v13 ndapiScore:self->_isSecondChance ndapiResult:v59 recognizerScore:self->_syncKeywordAnalyzerQuasar != 0 isSecondChance:v62 isSecondChanceCandidate:v63 isRunningQuasar:v61];

LABEL_37:
  return v19;
}

- (id)getLosingPhraseResultsWithDetectedPhId:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_phraseResult;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "phId", (void)v13) != a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_phraseDetectorResultFromNDAPIResults:(id)a3 quasarResult:(id)a4 forceMaximized:(BOOL)a5
{
  BOOL v45 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v47 = v7;
  unint64_t v9 = [v7 count];
  if (v9 >= [(NSMutableArray *)self->_phraseDetectorInfos count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v46 = self;
    obuint64_t j = self->_phraseDetectorInfos;
    uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v57;
      *(void *)&long long v13 = 136315394;
      long long v43 = v13;
      id v17 = v8;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v8, "count", v43) <= (unint64_t)(v15 + i))
          {
            uint64_t v20 = 0;
          }
          else
          {
            uint64_t v20 = [v8 objectAtIndex:v15 + i];
          }
          float v21 = [v47 objectAtIndex:v15 + i];
          float v22 = [(CSPhraseDetector *)v46 _getResultWithPhId:v15 + i phraseDetectorInfo:v19 ndapiResult:v21 quasarResult:v20 forceMaximized:v45];

          if (v22 && [(NSMutableArray *)v46->_phraseResult count] > (unint64_t)(v15 + i))
          {
            [(NSMutableArray *)v46->_phraseResult setObject:v22 atIndexedSubscript:v15 + i];
          }
          else
          {
            float v23 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              double v63 = "-[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:]";
              __int16 v64 = 2048;
              uint64_t v65 = v15 + i;
              _os_log_error_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_ERROR, "%s Received invalid result with %tu", buf, 0x16u);
            }
          }

          id v8 = v17;
        }
        v15 += i;
        uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v14);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    float v24 = v46->_phraseResult;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = 0;
      uint64_t v28 = *(void *)v53;
      float v29 = -INFINITY;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v24);
          }
          float v31 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          [v31 ndapiScore];
          if (v32 > v29)
          {
            [v31 ndapiScore];
            float v29 = v33;
            uint64_t v27 = [v31 phId];
          }
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v26);
    }
    else
    {
      uint64_t v27 = 0;
    }

    v11 = [(CSPhraseDetector *)v46 _resultCopyWithKeywordDetectorDecision:1 bestPhId:v27 phraseResult:v46->_phraseResult];
    if (!v11)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      unint64_t v34 = v46->_phraseResult;
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v49;
LABEL_34:
        uint64_t v38 = 0;
        while (1)
        {
          if (*(void *)v49 != v37) {
            objc_enumerationMutation(v34);
          }
          float v39 = *(NSMutableArray **)(*((void *)&v48 + 1) + 8 * v38);
          if (![(NSMutableArray *)v39 decision]) {
            break;
          }
          if (v36 == ++v38)
          {
            uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
            if (v36) {
              goto LABEL_34;
            }
            goto LABEL_40;
          }
        }
      }
      else
      {
LABEL_40:

        v11 = [(CSPhraseDetector *)v46 _resultCopyWithKeywordDetectorDecision:2 bestPhId:v27 phraseResult:v46->_phraseResult];
        if (v11) {
          goto LABEL_46;
        }
        v11 = [(CSPhraseDetector *)v46 _resultCopyWithKeywordDetectorDecision:3 bestPhId:v27 phraseResult:v46->_phraseResult];
        if (v11) {
          goto LABEL_46;
        }
        uint64_t v40 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          double v63 = "-[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:]";
          _os_log_fault_impl(&dword_1BA1A5000, v40, OS_LOG_TYPE_FAULT, "%s Phrase detector results fall-into unexpected use case", buf, 0xCu);
        }
        float v39 = [(NSMutableArray *)v46->_phraseResult objectAtIndexedSubscript:v27];
        unint64_t v34 = v39;
      }
      v11 = (void *)[(NSMutableArray *)v39 copy];
    }
  }
  else
  {
    v10 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      double v42 = v10;
      *(_DWORD *)buf = 136315394;
      double v63 = "-[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:]";
      __int16 v64 = 1024;
      LODWORD(v65) = [v7 count];
      _os_log_error_impl(&dword_1BA1A5000, v42, OS_LOG_TYPE_ERROR, "%s Unable to process due to number of result mismatch, ndapiResults number = %d", buf, 0x12u);
    }
    v11 = 0;
  }
LABEL_46:

  return v11;
}

- (id)phraseDetectorInfoFromPhId:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_phraseDetectorInfos count] <= a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_phraseDetectorInfos objectAtIndex:a3];
  }
  return v5;
}

- (id)getAnalyzedResultFromFlushedAudio
{
  v3 = [(CSKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getAnalyzedResults];
  quasarCheckerResultAtCutOff = self->_quasarCheckerResultAtCutOff;
  if (quasarCheckerResultAtCutOff)
  {
    BOOL v5 = quasarCheckerResultAtCutOff;
  }
  else
  {
    BOOL v5 = [(CSSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar getResultsFromFlushedAudio];
  }
  v6 = v5;
  id v7 = [(CSPhraseDetector *)self _phraseDetectorResultFromNDAPIResults:v3 quasarResult:v5 forceMaximized:1];

  return v7;
}

- (id)getAnalyzedResultFromAudioChunk:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_10;
  }
  BOOL v5 = [(CSKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getAnalyzedResultsFromAudioChunk:v4];
  quasarCheckerResultAtCutOff = self->_quasarCheckerResultAtCutOff;
  if (quasarCheckerResultAtCutOff)
  {
    id v7 = quasarCheckerResultAtCutOff;
  }
  else
  {
    syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
    if (self->_processedSampleCount >= self->_quasarCheckerCutOffSamplesCount)
    {
      v10 = [(CSSyncKeywordAnalyzerQuasar *)syncKeywordAnalyzerQuasar getResultsFromFlushedAudio];
      objc_storeStrong((id *)&self->_quasarCheckerResultAtCutOff, v10);
      goto LABEL_9;
    }
    id v7 = [(CSSyncKeywordAnalyzerQuasar *)syncKeywordAnalyzerQuasar getAnalyzedResultsFromAudioChunk:v4];
  }
  v10 = v7;
LABEL_9:
  self->_processedSampleCount += [v4 numSamples];
  id v8 = [(CSPhraseDetector *)self _phraseDetectorResultFromNDAPIResults:v5 quasarResult:v10 forceMaximized:0];

LABEL_10:
  return v8;
}

- (void)setConfig:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 phraseConfigs];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(NSMutableArray *)self->_phraseDetectorInfos removeAllObjects];
    id v7 = [v4 quasarCheckerResultCutOffCount];
    self->_quasarCheckerCutOffSamplesCount = [v7 unsignedIntegerValue];

    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = *(double *)&self->_quasarCheckerCutOffSamplesCount;
      *(_DWORD *)buf = 136315394;
      v88 = "-[CSPhraseDetector setConfig:]";
      __int16 v89 = 2048;
      double v90 = v9;
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s setting quasar checker model processed sample count cut off: %lu", buf, 0x16u);
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v10 = [v4 phraseConfigs];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v83 objects:v95 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v84 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [[CSPhraseDetectorInfo alloc] initWithPhraseConfig:*(void *)(*((void *)&v83 + 1) + 8 * i)];
          if (v15) {
            [(NSMutableArray *)self->_phraseDetectorInfos addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v83 objects:v95 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [CSKeywordAnalyzerNDAPI alloc];
    id v17 = [v4 configPathNDAPI];
    uint64_t v18 = [v4 resourcePath];
    uint64_t v19 = [(CSKeywordAnalyzerNDAPI *)v16 initWithConfigPath:v17 resourcePath:v18];
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    self->_syncKeywordAnalyzerNDAPI = v19;

    __int16 v74 = v4;
    if (self->_syncKeywordAnalyzerNDAPI
      && +[CSUtils supportPremiumModel]
      && [v4 useRecognizerCombination])
    {
      float v21 = [MEMORY[0x1E4F1CA48] array];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      float v22 = self->_phraseDetectorInfos;
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v79 objects:v94 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v80;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v80 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = [*(id *)(*((void *)&v79 + 1) + 8 * j) phraseConfig];
            uint64_t v28 = [v27 recognizerToken];
            [v21 addObject:v28];
          }
          uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v79 objects:v94 count:16];
        }
        while (v24);
      }

      uint64_t v29 = +[CSUtils horsemanDeviceType] == 3;
      double v30 = +[CSFPreferences sharedPreferences];
      int v31 = [v30 shouldOverwriteVoiceTriggerMLock];

      if (v31)
      {
        float v32 = +[CSFPreferences sharedPreferences];
        uint64_t v29 = [v32 overwritingVoiceTriggerMLock];
      }
      float v33 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&unint64_t v34 = COERCE_DOUBLE(@"disabled");
        if (v29) {
          *(double *)&unint64_t v34 = COERCE_DOUBLE(@"enabled");
        }
        *(_DWORD *)buf = 136315394;
        v88 = "-[CSPhraseDetector setConfig:]";
        __int16 v89 = 2112;
        double v90 = *(double *)&v34;
        _os_log_impl(&dword_1BA1A5000, v33, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger memory lock %@", buf, 0x16u);
      }
      uint64_t v35 = [CSSyncKeywordAnalyzerQuasar alloc];
      uint64_t v36 = [v74 configPathRecognizer];
      if (CSIsHorseman_onceToken != -1) {
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
      }
      uint64_t v37 = [(CSSyncKeywordAnalyzerQuasar *)v35 initWithConfigPath:v36 triggerTokensArray:v21 preventDuplicatedReset:CSIsHorseman_isHorseman memoryLock:v29];
      syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = v37;
    }
    else
    {
      float v21 = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = 0;
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    float v39 = self->_phraseDetectorInfos;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v75 objects:v93 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v76;
      uint64_t v73 = 136315650;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v76 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v75 + 1) + 8 * k);
          BOOL v45 = objc_msgSend(v44, "phraseConfig", v73);
          [v45 threshold];
          float v47 = v46;
          [v45 secondChanceThreshold];
          float v49 = v48;
          [v45 loggingThreshold];
          float v51 = v50;
          [v45 ndapiScaleFactor];
          int v59 = LODWORD(v52);
          if (!self->_syncKeywordAnalyzerNDAPI)
          {
            v60 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v88 = "-[CSPhraseDetector setConfig:]";
              _os_log_impl(&dword_1BA1A5000, v60, OS_LOG_TYPE_DEFAULT, "%s Reset all thresholds to HUGE_VALF since NDAPI is nil", buf, 0xCu);
            }
            float v47 = INFINITY;
            float v49 = INFINITY;
            float v51 = INFINITY;
          }
          if (self->_syncKeywordAnalyzerQuasar)
          {
            [v45 recognizerScoreOffset];
            float v62 = v61;
            float v47 = v47 + v61;
            float v49 = v49 + v61;
            [v45 recognizerScoreScaleFactor];
            int v64 = v63;
            [v45 keywordRejectLoggingThreshold];
            int v65 = LODWORD(v52);
          }
          else
          {
            float v62 = 0.0;
            int v65 = 2139095040;
            int v64 = 0;
          }
          if (self->_syncKeywordAnalyzerNDAPI)
          {
            if (!self->_syncKeywordAnalyzerQuasar)
            {
              if ([v74 useRecognizerCombination])
              {
                [(CSKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getThreshold];
                float v47 = v66;
                [(CSKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getLoggingThreshold];
                float v51 = v67;
                [(CSKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getRejectLoggingThreshold];
                int v65 = v68;
                v69 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v73;
                  v88 = "-[CSPhraseDetector setConfig:]";
                  __int16 v89 = 2050;
                  double v90 = v47;
                  __int16 v91 = 2050;
                  double v92 = v51;
                  _os_log_impl(&dword_1BA1A5000, v69, OS_LOG_TYPE_DEFAULT, "%s Using threshold from NDAPI since we are not able to use Quasar, threshold = %{public}f, logging threshold = %{public}f", buf, 0x20u);
                }
              }
            }
          }
          *(float *)&double v52 = v47;
          *(float *)&double v53 = v49;
          *(float *)&double v54 = v51;
          LODWORD(v55) = v59;
          *(float *)&double v56 = v62;
          LODWORD(v57) = v64;
          LODWORD(v58) = v65;
          v70 = (void *)[v45 copyWithThreshold:v52 secondChanceThreshold:v53 loggingThreshold:v54 ndapiScaleFactor:v55 recognizerScoreOffset:v56 recognizerScoreScaleFactor:v57 keywordRejectLoggingThreshold:v58];
          [v44 setPhraseConfig:v70];
          *(float *)&double v71 = v47;
          [v44 setEffectiveKeywordThreshold:v71];
        }
        uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v75 objects:v93 count:16];
      }
      while (v41);
    }

    [(CSPhraseDetector *)self reset];
    id v4 = v74;
  }
  else
  {
    __int16 v72 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v88 = "-[CSPhraseDetector setConfig:]";
      _os_log_error_impl(&dword_1BA1A5000, v72, OS_LOG_TYPE_ERROR, "%s Invalid assets config!", buf, 0xCu);
    }
  }
}

- (void)reset
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[CSPhraseDetector reset]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v11, 0xCu);
  }
  [(CSKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI reset];
  [(CSSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar reset];
  [(NSMutableArray *)self->_phraseResult removeAllObjects];
  if ([(NSMutableArray *)self->_phraseDetectorInfos count])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = [CSSinglePhraseResult alloc];
      LODWORD(v6) = -8388608;
      LODWORD(v7) = -998637568;
      LODWORD(v8) = -8388608;
      double v9 = [(CSSinglePhraseResult *)v5 initWithPhId:v4 keywordDetectorDecision:0 combinedScore:0 ndapiScore:0 ndapiResult:0 recognizerScore:self->_syncKeywordAnalyzerQuasar != 0 isSecondChance:v6 isSecondChanceCandidate:v8 isRunningQuasar:v7];
      [(NSMutableArray *)self->_phraseResult addObject:v9];

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_phraseDetectorInfos count]);
  }
  quasarCheckerResultAtCutOff = self->_quasarCheckerResultAtCutOff;
  self->_quasarCheckerResultAtCutOff = 0;

  self->_processedSampleCount = 0;
}

- (void)setRunAsSecondChance:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v4 = self->_phraseDetectorInfos;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [v9 phraseConfig];
        int v11 = v10;
        if (v10)
        {
          [v10 secondChanceThreshold];
          float v13 = v12;
          [v11 threshold];
          if (v3)
          {
            *(float *)&double v14 = v13;
            [v9 setEffectiveKeywordThreshold:v14];
            uint64_t v15 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v23 = "-[CSPhraseDetector setRunAsSecondChance:]";
              __int16 v24 = 2050;
              double v25 = v13;
              _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Using second chance threshold for voice trigger second pass: %{public}f", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(v9, "setEffectiveKeywordThreshold:");
          }
        }
        else
        {
          uint64_t v16 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v23 = "-[CSPhraseDetector setRunAsSecondChance:]";
            _os_log_error_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_ERROR, "%s Failed to fetch config", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }

  self->_isSecondChance = v3;
}

- (void)setActiveChannel:(unint64_t)a3
{
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_syncKeywordAnalyzerNDAPI, "setActiveChannel:");
  syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
  [(CSSyncKeywordAnalyzerQuasar *)syncKeywordAnalyzerQuasar setActiveChannel:a3];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[CSPhraseDetector dealloc]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CSPhraseDetector Deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSPhraseDetector;
  [(CSPhraseDetector *)&v4 dealloc];
}

- (CSPhraseDetector)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSPhraseDetector;
  v2 = [(CSPhraseDetector *)&v10 init];
  if (v2)
  {
    +[CSConfig inputRecordingSampleRate];
    *((void *)v2 + 5) = (unint64_t)(float)(v3 * 0.5);
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v6;

    double v8 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0;

    *(_OWORD *)(v2 + 72) = xmmword_1BA25E740;
  }
  return (CSPhraseDetector *)v2;
}

@end