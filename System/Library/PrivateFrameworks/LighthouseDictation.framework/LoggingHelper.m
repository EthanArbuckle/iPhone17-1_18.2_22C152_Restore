@interface LoggingHelper
- (LoggingHelper)initWithExperimentName:(id)a3;
- (LoggingHelper)initWithExperimentName:(id)a3 trialExperimentId:(id)a4 trialTreatmentId:(id)a5 trialDeploymentId:(int64_t)a6;
- (NSString)datapackVersion;
- (id)_alignmentInfosFromAlignmentDict:(id)a3;
- (id)_audioFileResultsFromResultDict:(id)a3 privateAudioFileResultsOut:(id *)a4;
- (id)_choiceInfosFromChoiceInfoDicts:(id)a3 privateTokens:(id)a4;
- (id)_decodingMetricsFromMetricsDict:(id)a3;
- (id)_decodingResultsWithAudioDict:(id)a3 privateTokensOut:(id *)a4;
- (id)_lmMetricsFromEvalDict:(id)a3 perplexityName:(id)a4 timesDict:(id)a5;
- (id)_plmMetricsFromPlmDict:(id)a3;
- (id)_resultInfosFromResultInfoDict:(id)a3 privateTokens:(id)a4;
- (id)_tokensFromTokenDict:(id)a3 privateTokens:(id)a4;
- (id)_tokensFromTokensArray:(id)a3 privateTokens:(id)a4;
- (id)_transcriptMetadataFromPopDict:(id)a3;
- (id)_utteranceInfosFromUtteranceInfoDict:(id)a3 privateTokens:(id)a4;
- (void)_wrapAndEmitTopLevelEvent:(id)a3;
- (void)logDictationPersonalizationExperimentEndedAndTier1WithResultsDict:(id)a3;
- (void)logDictationPersonalizationExperimentStartedOrChanged;
- (void)logUserEditExperimentEndedAndTier1WithResultsDict:(id)a3;
- (void)logUserEditExperimentStartedOrChanged;
- (void)setDatapackVersion:(id)a3;
@end

@implementation LoggingHelper

- (LoggingHelper)initWithExperimentName:(id)a3
{
  return [(LoggingHelper *)self initWithExperimentName:a3 trialExperimentId:0 trialTreatmentId:0 trialDeploymentId:0];
}

- (LoggingHelper)initWithExperimentName:(id)a3 trialExperimentId:(id)a4 trialTreatmentId:(id)a5 trialDeploymentId:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)LoggingHelper;
  v14 = [(LoggingHelper *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x263F08C38] UUID];
    dodmlId = v14->_dodmlId;
    v14->_dodmlId = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_experimentName, a3);
    objc_storeStrong((id *)&v14->_trialExperimentId, a4);
    objc_storeStrong((id *)&v14->_trialTreatmentId, a5);
    v14->_trialDeploymentId = a6;
    v17 = [(NSUUID *)v14->_dodmlId UUIDString];
    experimentName = v14->_experimentName;
    trialExperimentId = v14->_trialExperimentId;
    v20 = [(NSUUID *)v14->_trialTreatmentId UUIDString];
    NSLog(&cfstr_SelfLoggingObj.isa, v17, experimentName, trialExperimentId, v20, v14->_trialDeploymentId);
  }
  return v14;
}

- (void)logUserEditExperimentStartedOrChanged
{
  id v4 = objc_alloc_init(MEMORY[0x263F6DB98]);
  [v4 setExists:1];
  id v3 = objc_alloc_init(MEMORY[0x263F6DB78]);
  [v3 setStartedOrChanged:v4];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v3];
}

- (void)logUserEditExperimentEndedAndTier1WithResultsDict:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v56 = v4;
  id obj = [v4 objectForKeyedSubscript:@"audioResults"];
  uint64_t v52 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v52)
  {
    uint64_t v49 = *(void *)v66;
    v50 = self;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v66 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = v5;
        v6 = *(void **)(*((void *)&v65 + 1) + 8 * v5);
        id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v53 = v6;
        id v55 = [v6 objectForKeyedSubscript:@"confusionPairs"];
        uint64_t v9 = [v55 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v62;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v62 != v11) {
                objc_enumerationMutation(v55);
              }
              id v13 = *(void **)(*((void *)&v61 + 1) + 8 * v12);
              id v14 = objc_alloc_init(MEMORY[0x263F6DAF0]);
              [v14 setErrorCode:0];
              uint64_t v15 = [v13 objectForKeyedSubscript:@"editMethod"];
              uint64_t v16 = [v15 intValue];

              [v14 setEditMethod:v16];
              v17 = [v13 objectForKeyedSubscript:@"errorType"];
              uint64_t v18 = [v17 intValue];

              [v14 setEditReason:v18];
              v19 = [v13 objectForKeyedSubscript:@"index"];
              objc_msgSend(v14, "setRecognizedTextStartIndex:", objc_msgSend(v19, "intValue"));

              id v20 = objc_alloc_init(MEMORY[0x263F6DAF8]);
              v21 = [v13 objectForKeyedSubscript:@"recognizedTokens"];
              [v20 setRecognizedTokens:v21];

              if ((v18 & 0xFFFFFFFD) != 0)
              {
                objc_super v22 = [v13 objectForKeyedSubscript:@"correctedTokens"];
                [v20 setCorrectedTokens:v22];

                v23 = [v56 objectForKeyedSubscript:@"logContext"];

                if (v23)
                {
                  v24 = [v13 objectForKeyedSubscript:@"leftContext"];
                  [v20 setLeftContextToken:v24];

                  v25 = [v13 objectForKeyedSubscript:@"rightContext"];
                  [v20 setRightContextToken:v25];
                }
              }
              [v7 addObject:v14];
              [v8 addObject:v20];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v55 countByEnumeratingWithState:&v61 objects:v70 count:16];
          }
          while (v10);
        }

        id v26 = objc_alloc_init(MEMORY[0x263F6DB90]);
        self = v50;
        [v26 setDatapackVersion:v50->_datapackVersion];
        id v27 = objc_alloc(MEMORY[0x263F6EEE0]);
        id v28 = objc_alloc(MEMORY[0x263F08C38]);
        v29 = [v53 objectForKeyedSubscript:@"asrId"];
        v30 = (void *)[v28 initWithUUIDString:v29];
        v31 = (void *)[v27 initWithNSUUID:v30];
        [v26 setAsrId:v31];

        v32 = [v53 objectForKeyedSubscript:@"errorCode"];
        objc_msgSend(v26, "setErrorCode:", objc_msgSend(v32, "intValue"));

        if ([v7 count])
        {
          [v26 setConfusionPairs:v7];
          id v33 = objc_alloc(MEMORY[0x263F6EEE0]);
          v34 = [MEMORY[0x263F08C38] UUID];
          v35 = (void *)[v33 initWithNSUUID:v34];

          [v26 setLinkId:v35];
          id v36 = objc_alloc_init(MEMORY[0x263F6DB88]);
          [v36 setLinkId:v35];
          [v36 setConfusionPairs:v8];
          [v48 addObject:v36];
        }
        [v51 addObject:v26];

        uint64_t v5 = v54 + 1;
      }
      while (v54 + 1 != v52);
      uint64_t v52 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v52);
  }

  id v37 = objc_alloc_init(MEMORY[0x263F6DB80]);
  v38 = [v56 objectForKeyedSubscript:@"numAudioAvailable"];
  objc_msgSend(v37, "setNumAudioFilesAvailable:", objc_msgSend(v38, "unsignedIntValue"));

  v39 = [v56 objectForKeyedSubscript:@"numSelectedAudio"];
  objc_msgSend(v37, "setNumAudioFilesSelected:", objc_msgSend(v39, "unsignedIntValue"));

  v40 = [v56 objectForKeyedSubscript:@"errorCode"];
  objc_msgSend(v37, "setErrorCode:", objc_msgSend(v40, "intValue"));

  [v37 setRedecodingResults:v51];
  id v41 = objc_alloc_init(MEMORY[0x263F6DB78]);
  [v41 setEnded:v37];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v41];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v42 = v48;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v58;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(v42);
        }
        [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:*(void *)(*((void *)&v57 + 1) + 8 * v46++)];
      }
      while (v44 != v46);
      uint64_t v44 = [v42 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v44);
  }
}

- (void)logDictationPersonalizationExperimentStartedOrChanged
{
  id v5 = objc_alloc_init(MEMORY[0x263F6DB48]);
  [v5 setExists:1];
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v3, "thermalState"));

  id v4 = objc_alloc_init(MEMORY[0x263F6DB38]);
  [v4 setStartedOrChanged:v5];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v4];
}

- (void)logDictationPersonalizationExperimentEndedAndTier1WithResultsDict:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F6DB40]);
  [v4 objectForKeyedSubscript:@"languageMetadata"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v30 = v4;
    uint64_t v9 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v36 + 1) + 8 * i) objectForKeyedSubscript:@"status"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v11 isEqualToString:@"Required Personalized LM not found"])
        {

          uint64_t v12 = &unk_2703F92A0;
          id v4 = v30;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    id v4 = v30;
  }
  uint64_t v12 = &unk_2703F9288;
LABEL_13:

  objc_msgSend(v5, "setExperimentStatusCode:", objc_msgSend(v12, "intValue"));
  [v5 setDatapackVersion:self->_datapackVersion];
  id v13 = [v4 objectForKeyedSubscript:@"numAudio"];
  objc_msgSend(v5, "setNumAudioFilesAvailable:", objc_msgSend(v13, "unsignedIntValue"));

  id v14 = [v4 objectForKeyedSubscript:@"numSelectedAudio"];
  objc_msgSend(v5, "setNumAudioFilesSelected:", objc_msgSend(v14, "unsignedIntValue"));

  uint64_t v15 = [v4 objectForKeyedSubscript:@"textProcessingDuration"];
  uint64_t v16 = NSNumber;
  [v15 doubleValue];
  uint64_t v18 = [v16 numberWithDouble:v17 * 1000000000.0];
  objc_msgSend(v5, "setTextProcessingDurationInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

  v19 = [MEMORY[0x263F08AB0] processInfo];
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v19, "thermalState"));

  id v35 = 0;
  id v20 = [(LoggingHelper *)self _audioFileResultsFromResultDict:v4 privateAudioFileResultsOut:&v35];
  id v21 = v35;
  [v5 setAudioFileResults:v20];

  objc_super v22 = [v4 objectForKeyedSubscript:@"personalizedLM"];
  v23 = [(LoggingHelper *)self _plmMetricsFromPlmDict:v22];
  [v5 setPersonalizedLanguageModelMetrics:v23];

  id v24 = objc_alloc_init(MEMORY[0x263F6DB38]);
  [v24 setEnded:v5];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v24];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v25);
        }
        [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:*(void *)(*((void *)&v31 + 1) + 8 * j)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v27);
  }
}

- (id)_audioFileResultsFromResultDict:(id)a3 privateAudioFileResultsOut:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v24 = v4;
  [v4 objectForKeyedSubscript:@"audioResults"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x263F6DAD8]);
        [v29 addObject:v9];
        id v10 = objc_alloc(MEMORY[0x263F6EEE0]);
        id v11 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v12 = [v8 objectForKeyedSubscript:@"asrSelfComponentId"];
        id v13 = (void *)[v11 initWithUUIDString:v12];
        id v14 = (void *)[v10 initWithNSUUID:v13];

        [v9 setAsrId:v14];
        id v15 = objc_alloc(MEMORY[0x263F6EEE0]);
        uint64_t v16 = [MEMORY[0x263F08C38] UUID];
        double v17 = (void *)[v15 initWithNSUUID:v16];

        [v9 setLinkId:v17];
        id v30 = 0;
        uint64_t v18 = [(LoggingHelper *)self _decodingResultsWithAudioDict:v8 privateTokensOut:&v30];
        id v19 = v30;
        [v9 setDecodingResults:v18];

        id v20 = objc_alloc_init(MEMORY[0x263F6DAE0]);
        [v28 addObject:v20];
        id v21 = objc_alloc_init(MEMORY[0x263F6D9E0]);
        [v21 setLinkId:v17];
        [v21 setTokens:v19];

        [v20 setRecognitionResult:v21];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }
  if (a4) {
    *a4 = v28;
  }

  return v29;
}

- (id)_decodingResultsWithAudioDict:(id)a3 privateTokensOut:(id *)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v62 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = [v5 objectForKeyedSubscript:@"tokens"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"metrics"];
  long long v60 = [v5 objectForKeyedSubscript:@"alignments"];
  long long v61 = v7;
  id v9 = [v7 allKeys];
  id v10 = [v5 objectForKeyedSubscript:@"uttInfos"];

  v56 = v5;
  if (v10)
  {
    long long v59 = [v5 objectForKeyedSubscript:@"uttInfos"];
  }
  else
  {
    id v11 = [v5 objectForKeyedSubscript:@"uttInfosCompressed"];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v13 = [v5 objectForKeyedSubscript:@"uttInfosCompressed"];
      id v14 = (void *)[v12 initWithBase64EncodedString:v13 options:0];

      id v68 = 0;
      id v15 = [v14 decompressedDataUsingAlgorithm:3 error:&v68];
      id v16 = v68;
      id v67 = 0;
      long long v59 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:&v67];
      id v17 = v67;
      uint64_t v18 = v17;
      if (v16)
      {
        id v19 = *MEMORY[0x263F28368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28368], OS_LOG_TYPE_ERROR)) {
          -[LoggingHelper _decodingResultsWithAudioDict:privateTokensOut:](v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      else if (v17)
      {
        uint64_t v27 = *MEMORY[0x263F28368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28368], OS_LOG_TYPE_ERROR)) {
          -[LoggingHelper _decodingResultsWithAudioDict:privateTokensOut:](v27, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    else
    {
      long long v59 = 0;
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v9;
  uint64_t v35 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v58 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v64 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        id v39 = objc_alloc_init(MEMORY[0x263F6DB08]);
        [v62 addObject:v39];
        [v39 setConfigName:v38];
        v40 = [v8 objectForKeyedSubscript:v38];
        id v41 = [(LoggingHelper *)self _decodingMetricsFromMetricsDict:v40];
        [v39 setDecodingMetrics:v41];

        uint64_t v42 = [v61 objectForKeyedSubscript:v38];
        uint64_t v43 = [(LoggingHelper *)self _tokensFromTokenDict:v42 privateTokens:v6];
        [v39 setTokens:v43];

        uint64_t v44 = [v59 objectForKeyedSubscript:v38];
        uint64_t v45 = [(LoggingHelper *)self _utteranceInfosFromUtteranceInfoDict:v44 privateTokens:v6];
        [v39 setUtterances:v45];

        uint64_t v46 = [v8 objectForKeyedSubscript:v38];
        v47 = [v46 objectForKeyedSubscript:@"DecodeDuration"];
        id v48 = v6;
        uint64_t v49 = NSNumber;
        [v47 doubleValue];
        id v51 = [v49 numberWithDouble:v50 * 1000000000.0];
        objc_msgSend(v39, "setDecodeDurationInNs:", objc_msgSend(v51, "unsignedLongLongValue"));

        id v6 = v48;
        uint64_t v52 = [v60 objectForKeyedSubscript:v38];
        v53 = [(LoggingHelper *)self _alignmentInfosFromAlignmentDict:v52];
        [v39 setAlignments:v53];
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v36);
  }

  if (a4) {
    *a4 = v6;
  }

  return v62;
}

- (id)_decodingMetricsFromMetricsDict:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F6DB00]);
  long long v37 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"WallRTF"];
  [v5 floatValue];
  objc_msgSend(v4, "setWallRealTimeFactor:");

  id v6 = [v37 objectForKeyedSubscript:@"AverageActiveTokensPerFrame"];
  [v6 floatValue];
  objc_msgSend(v4, "setAverageActiveTokensPerFrame:");

  uint64_t v7 = [v37 objectForKeyedSubscript:@"jitQueryDurationInMs"];
  objc_msgSend(v4, "setJitQueryDurationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));

  uint64_t v8 = [v37 objectForKeyedSubscript:@"jitLmeDurationInMs"];
  objc_msgSend(v4, "setJitLanguageModelEnrollmentDurationInMs:", objc_msgSend(v8, "unsignedLongLongValue"));

  id v9 = [v37 valueForKeyPath:@"jitDataStats.preprocessingCategoryCounts"];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke;
  v46[3] = &unk_2653B3888;
  id v10 = v4;
  id v47 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v46];

  id v11 = [v37 valueForKeyPath:@"jitDataStats.postprocessingCategoryCounts"];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke_2;
  v44[3] = &unk_2653B3888;
  id v35 = v10;
  id v45 = v35;
  [v11 enumerateKeysAndObjectsUsingBlock:v44];

  uint64_t v36 = [v37 objectForKeyedSubscript:@"lm_interp_weights"];
  if (v36)
  {
    id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v36 componentsSeparatedByString:@";"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v41;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
          id v16 = objc_alloc_init(MEMORY[0x263F6D9C0]);
          id v17 = [v15 componentsSeparatedByString:@":"];
          uint64_t v18 = NSNumber;
          id v19 = [v17 objectAtIndexedSubscript:1];
          [v19 doubleValue];
          uint64_t v20 = objc_msgSend(v18, "numberWithDouble:");

          uint64_t v21 = NSNumber;
          uint64_t v22 = [v17 objectAtIndexedSubscript:2];
          [v22 doubleValue];
          uint64_t v23 = objc_msgSend(v21, "numberWithDouble:");

          uint64_t v24 = NSNumber;
          [v20 doubleValue];
          uint64_t v26 = [v24 numberWithDouble:v25 * 1000000.0];
          objc_msgSend(v16, "setStartTimeInNs:", objc_msgSend(v26, "unsignedLongLongValue"));

          uint64_t v27 = NSNumber;
          [v23 doubleValue];
          uint64_t v29 = [v27 numberWithDouble:v28 * 1000000.0];
          objc_msgSend(v16, "setEndTimeInNs:", objc_msgSend(v29, "unsignedLongLongValue"));

          uint64_t v30 = [v17 objectAtIndexedSubscript:0];
          uint64_t v31 = [v30 componentsSeparatedByString:@","];

          uint64_t v32 = [v31 valueForKey:@"floatValue"];
          [v16 setWeights:v32];

          [v39 addObject:v16];
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v12);
    }

    [v35 setLanguageModelInterpolationWeights:v39];
  }
  id v33 = v35;

  return v33;
}

void __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263F6DB10];
  id v6 = a3;
  id v7 = a2;
  id v9 = objc_alloc_init(v5);
  [v9 setEntityCategory:v7];

  uint64_t v8 = [v6 unsignedLongValue];
  [v9 setCount:v8];
  [*(id *)(a1 + 32) addPreprocessingEntityCategoryCounts:v9];
}

void __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263F6DB10];
  id v6 = a3;
  id v7 = a2;
  id v9 = objc_alloc_init(v5);
  [v9 setEntityCategory:v7];

  uint64_t v8 = [v6 unsignedLongValue];
  [v9 setCount:v8];
  [*(id *)(a1 + 32) addPostprocessingEntityCategoryCounts:v9];
}

- (id)_utteranceInfosFromUtteranceInfoDict:(id)a3 privateTokens:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v27 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v13 = objc_alloc_init(MEMORY[0x263F6DBA0]);
          [v7 addObject:v13];
          uint64_t v14 = [v12 objectForKeyedSubscript:@"results"];
          id v15 = [(LoggingHelper *)self _resultInfosFromResultInfoDict:v14 privateTokens:v27];
          [v13 setResults:v15];

          id v16 = [v12 objectForKeyedSubscript:@"startMillis"];
          id v17 = NSNumber;
          [v16 doubleValue];
          id v19 = [v17 numberWithDouble:v18 * 1000000.0];
          objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

          uint64_t v20 = [v12 objectForKeyedSubscript:@"endMillis"];
          uint64_t v21 = NSNumber;
          [v20 doubleValue];
          uint64_t v23 = [v21 numberWithDouble:v22 * 1000000.0];
          objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }

    id v6 = v25;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_alignmentInfosFromAlignmentDict:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263EFF980];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__LoggingHelper__alignmentInfosFromAlignmentDict___block_invoke;
    v8[3] = &unk_2653B38B0;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __50__LoggingHelper__alignmentInfosFromAlignmentDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263F6DAD0];
  id v6 = a3;
  id v7 = a2;
  id v13 = objc_alloc_init(v5);
  [*(id *)(a1 + 32) addObject:v13];
  [v13 setReferenceName:v7];

  uint64_t v8 = [v6 objectForKeyedSubscript:@"Deletions"];
  objc_msgSend(v13, "setNumDeletions:", objc_msgSend(v8, "unsignedIntValue"));

  id v9 = [v6 objectForKeyedSubscript:@"Insertions"];
  objc_msgSend(v13, "setNumInsertions:", objc_msgSend(v9, "unsignedIntValue"));

  uint64_t v10 = [v6 objectForKeyedSubscript:@"Substitutions"];
  objc_msgSend(v13, "setNumSubstitutions:", objc_msgSend(v10, "unsignedIntValue"));

  id v11 = [v6 objectForKeyedSubscript:@"EditDistance"];
  objc_msgSend(v13, "setEditDistance:", objc_msgSend(v11, "unsignedIntValue"));

  uint64_t v12 = [v6 objectForKeyedSubscript:@"ReferenceSize"];

  objc_msgSend(v13, "setReferenceSize:", objc_msgSend(v12, "unsignedIntValue"));
}

- (id)_resultInfosFromResultInfoDict:(id)a3 privateTokens:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKeyedSubscript:v13];
        id v15 = objc_alloc_init(MEMORY[0x263F6DB58]);
        [v7 addObject:v15];
        [v15 setStageName:v13];
        id v16 = [v14 objectForKeyedSubscript:@"aligned"];
        [v15 setIsAligned:v16 != 0];

        id v17 = [v14 objectForKeyedSubscript:@"choices"];
        double v18 = [(LoggingHelper *)self _choiceInfosFromChoiceInfoDicts:v17 privateTokens:v6];
        [v15 setChoices:v18];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_choiceInfosFromChoiceInfoDicts:(id)a3 privateTokens:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_alloc_init(MEMORY[0x263F6DAE8]);
        [v8 addObject:v14];
        id v15 = [v13 objectForKeyedSubscript:@"tokens"];
        id v16 = [(LoggingHelper *)self _tokensFromTokensArray:v15 privateTokens:v7];
        [v14 setTokens:v16];

        id v17 = [v13 objectForKeyedSubscript:@"graphCost"];
        [v17 floatValue];
        objc_msgSend(v14, "setGraphCost:");

        double v18 = [v13 objectForKeyedSubscript:@"acousticCost"];
        [v18 floatValue];
        objc_msgSend(v14, "setAcousticCost:");
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)_tokensFromTokensArray:(id)a3 privateTokens:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v12 = objc_alloc_init(MEMORY[0x263F6DB60]);
        [v35 addObject:v12];
        id v13 = objc_alloc_init(MEMORY[0x263F6D9E8]);
        id v14 = [v11 objectAtIndexedSubscript:1];
        id v15 = NSNumber;
        [v14 doubleValue];
        id v17 = [v15 numberWithDouble:v16 * 1000000.0];
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v17, "unsignedLongLongValue"));

        double v18 = [v11 objectAtIndexedSubscript:2];
        id v19 = NSNumber;
        [v18 doubleValue];
        long long v21 = [v19 numberWithDouble:v20 * 1000000.0];
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));

        long long v22 = [v11 objectAtIndexedSubscript:3];
        long long v23 = NSNumber;
        [v22 doubleValue];
        id v25 = [v23 numberWithDouble:v24 * 1000000.0];
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v25, "unsignedLongLongValue"));

        [v12 setToken:v13];
        uint64_t v26 = [v11 objectAtIndexedSubscript:5];
        [v26 floatValue];
        objc_msgSend(v12, "setAcousticCost:");

        id v27 = [v11 objectAtIndexedSubscript:6];
        [v27 floatValue];
        objc_msgSend(v12, "setSilenceAcousticCost:");

        long long v28 = [v11 objectAtIndexedSubscript:7];
        [v12 setNumBackoffs:v28];

        long long v29 = [v11 objectAtIndexedSubscript:8];
        [v12 setLanguageModelCosts:v29];

        id v30 = objc_alloc_init(MEMORY[0x263F6D9F0]);
        long long v31 = [v11 objectAtIndexedSubscript:0];
        [v30 setText:v31];

        uint64_t v32 = [v11 objectAtIndexedSubscript:4];
        [v30 setPhoneSequence:v32];

        if ([v6 containsObject:v30])
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v30));
        }
        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          [v6 addObject:v30];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v8);
  }

  return v35;
}

- (id)_tokensFromTokenDict:(id)a3 privateTokens:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v13 = objc_alloc_init(MEMORY[0x263F6D9E8]);
        [v7 addObject:v13];
        id v14 = [v12 objectForKeyedSubscript:@"startTime"];
        id v15 = NSNumber;
        [v14 doubleValue];
        id v17 = [v15 numberWithDouble:v16 * 1000000000.0];
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v17, "unsignedLongLongValue"));

        double v18 = [v12 objectForKeyedSubscript:@"endTime"];
        id v19 = NSNumber;
        [v18 doubleValue];
        long long v21 = [v19 numberWithDouble:v20 * 1000000000.0];
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));

        long long v22 = [v12 objectForKeyedSubscript:@"removeSpaceAfter"];
        objc_msgSend(v13, "setAppendSpaceAfter:", objc_msgSend(v22, "BOOLValue") ^ 1);

        long long v23 = [v12 objectForKeyedSubscript:@"silenceStartTime"];
        double v24 = NSNumber;
        [v23 doubleValue];
        uint64_t v26 = [v24 numberWithDouble:v25 * 1000000000.0];
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v26, "unsignedLongLongValue"));

        id v27 = [v12 objectForKeyedSubscript:@"confidence"];
        objc_msgSend(v13, "setConfidence:", objc_msgSend(v27, "intValue"));

        id v28 = objc_alloc_init(MEMORY[0x263F6D9F0]);
        long long v29 = [v12 objectForKeyedSubscript:@"text"];
        [v28 setText:v29];

        id v30 = [v12 objectForKeyedSubscript:@"phoneSequence"];
        [v28 setPhoneSequence:v30];

        if ([v6 containsObject:v28])
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v28));
        }
        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          [v6 addObject:v28];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)_plmMetricsFromPlmDict:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"train"];
  id v6 = objc_alloc_init(MEMORY[0x263F6DB70]);
  id v7 = [v5 objectForKeyedSubscript:@"data"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"train"];
  uint64_t v9 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v8];
  [v6 setTrain:v9];

  uint64_t v10 = [v5 objectForKeyedSubscript:@"data"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"test"];
  id v12 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v11];
  [v6 setTest:v12];

  id v13 = [v5 objectForKeyedSubscript:@"data"];
  id v14 = [v13 objectForKeyedSubscript:@"dev"];
  id v15 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v14];
  [v6 setDev:v15];

  double v16 = [v5 objectForKeyedSubscript:@"data"];
  id v17 = [v16 objectForKeyedSubscript:@"external"];
  double v18 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v17];
  [v6 setExternal:v18];

  id v19 = objc_alloc_init(MEMORY[0x263F6DB18]);
  long long v66 = v5;
  double v20 = [v5 objectForKeyedSubscript:@"eval"];
  long long v21 = [v20 objectForKeyedSubscript:@"model-selection"];
  long long v22 = [v21 objectForKeyedSubscript:@"best-weight"];
  [v22 floatValue];
  objc_msgSend(v19, "setBestWeight:");

  long long v23 = [v20 objectForKeyedSubscript:@"totalTime"];
  double v24 = NSNumber;
  [v23 doubleValue];
  uint64_t v26 = [v24 numberWithDouble:v25 * 1000.0];
  objc_msgSend(v19, "setTotalDurationInMs:", objc_msgSend(v26, "unsignedLongLongValue"));

  id v27 = [v20 objectForKeyedSubscript:@"times"];
  id v28 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"train-ppl" timesDict:v27];
  [v19 setTrains:v28];

  long long v29 = [v20 objectForKeyedSubscript:@"times"];
  id v30 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"test-ppl" timesDict:v29];
  [v19 setTests:v30];

  long long v31 = [v20 objectForKeyedSubscript:@"times"];
  uint64_t v32 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"dev-ppl" timesDict:v31];
  [v19 setDevs:v32];

  long long v33 = [v20 objectForKeyedSubscript:@"times"];
  long long v34 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"external-ppl" timesDict:v33];
  [v19 setExternals:v34];

  id v35 = objc_alloc_init(MEMORY[0x263F6DB28]);
  long long v36 = [v5 objectForKeyedSubscript:@"model"];
  long long v37 = [v36 objectForKeyedSubscript:@"times"];
  [v35 setConfigName:0];
  uint64_t v38 = [v36 objectForKeyedSubscript:@"order"];
  objc_msgSend(v35, "setNgramOrder:", objc_msgSend(v38, "unsignedIntValue"));

  long long v39 = [v36 objectForKeyedSubscript:@"residualAdaptationWeight"];
  [v39 floatValue];
  objc_msgSend(v35, "setResidualAdaptationWeight:");

  long long v40 = [v36 objectForKeyedSubscript:@"totalTime"];
  uint64_t v41 = NSNumber;
  [v40 doubleValue];
  long long v43 = [v41 numberWithDouble:v42 * 1000.0];
  objc_msgSend(v35, "setTotalDurationInMs:", objc_msgSend(v43, "unsignedLongLongValue"));

  uint64_t v44 = [v37 objectForKeyedSubscript:@"training"];
  id v45 = NSNumber;
  [v44 doubleValue];
  id v47 = [v45 numberWithDouble:v46 * 1000.0];
  objc_msgSend(v35, "setTrainingDurationInMs:", objc_msgSend(v47, "unsignedLongLongValue"));

  id v48 = [v37 objectForKeyedSubscript:@"conversion"];
  uint64_t v49 = NSNumber;
  [v48 doubleValue];
  id v51 = [v49 numberWithDouble:v50 * 1000.0];
  objc_msgSend(v35, "setConversionDurationInMs:", objc_msgSend(v51, "unsignedLongLongValue"));

  uint64_t v52 = [v37 objectForKeyedSubscript:@"optimization"];
  v53 = NSNumber;
  [v52 doubleValue];
  id v55 = [v53 numberWithDouble:v54 * 1000.0];
  objc_msgSend(v35, "setOptimizationDurationInMs:", objc_msgSend(v55, "unsignedLongLongValue"));

  v56 = [v36 objectForKeyedSubscript:@"numStates"];
  objc_msgSend(v35, "setNumFiniteStateTransducerStates:", objc_msgSend(v56, "unsignedIntValue"));

  long long v57 = [v36 objectForKeyedSubscript:@"numArcs"];
  objc_msgSend(v35, "setNumFiniteStateTransducerArcs:", objc_msgSend(v57, "unsignedIntValue"));

  uint64_t v58 = [v4 objectForKeyedSubscript:@"trainErrorCode"];
  objc_msgSend(v35, "setModelTrainingStatusCode:", objc_msgSend(v58, "unsignedIntValue"));

  id v59 = objc_alloc_init(MEMORY[0x263F6DB50]);
  long long v60 = v6;
  [v59 setTranscriptionMetrics:v6];
  [v59 setEvaluationMetrics:v19];
  long long v61 = (void *)MEMORY[0x263F6EF10];
  id v62 = v4;
  long long v63 = [v4 objectForKeyedSubscript:@"userLanguage"];

  long long v64 = [v63 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  objc_msgSend(v59, "setUserLocale:", objc_msgSend(v61, "convertLanguageCodeToSchemaLocale:", v64));

  [v59 setModelMetrics:v35];
  return v59;
}

- (id)_transcriptMetadataFromPopDict:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F6DB68];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 objectForKeyedSubscript:@"numDocumentsRejected"];
  objc_msgSend(v5, "setNumDocumentsRejected:", objc_msgSend(v6, "unsignedIntValue"));

  id v7 = [v4 objectForKeyedSubscript:@"numSentencesRejected"];
  objc_msgSend(v5, "setNumSentencesRejected:", objc_msgSend(v7, "unsignedIntValue"));

  uint64_t v8 = [v4 objectForKeyedSubscript:@"numDocuments"];
  objc_msgSend(v5, "setNumDocumentsAccepted:", objc_msgSend(v8, "unsignedIntValue"));

  uint64_t v9 = [v4 objectForKeyedSubscript:@"numSentences"];
  objc_msgSend(v5, "setNumSentencesAccepted:", objc_msgSend(v9, "unsignedIntValue"));

  uint64_t v10 = [v4 objectForKeyedSubscript:@"numTokens"];
  objc_msgSend(v5, "setNumTokensAccepted:", objc_msgSend(v10, "unsignedIntValue"));

  uint64_t v11 = [v4 objectForKeyedSubscript:@"numTokensOOV"];
  objc_msgSend(v5, "setNumTokensOutOfVocabularyAccepted:", objc_msgSend(v11, "unsignedIntValue"));

  id v12 = [v4 objectForKeyedSubscript:@"numDocumentsDictated"];
  objc_msgSend(v5, "setNumDocumentsDictated:", objc_msgSend(v12, "unsignedIntValue"));

  id v13 = [v4 objectForKeyedSubscript:@"numDocumentsTyped"];
  objc_msgSend(v5, "setNumDocumentsTyped:", objc_msgSend(v13, "unsignedIntValue"));

  id v14 = [v4 objectForKeyedSubscript:@"numTokensDictated"];
  objc_msgSend(v5, "setNumTokensDictated:", objc_msgSend(v14, "unsignedIntValue"));

  id v15 = [v4 objectForKeyedSubscript:@"numTokensTyped"];
  objc_msgSend(v5, "setNumTokensTyped:", objc_msgSend(v15, "unsignedIntValue"));

  double v16 = [v4 objectForKeyedSubscript:@"numSentencesMungeRejected"];
  objc_msgSend(v5, "setNumSentencesMungeRejected:", objc_msgSend(v16, "unsignedIntValue"));

  id v17 = [v4 objectForKeyedSubscript:@"numSentencesMungeChanged"];
  objc_msgSend(v5, "setNumSentencesMungeChanged:", objc_msgSend(v17, "unsignedIntValue"));

  double v18 = [v4 objectForKeyedSubscript:@"numTokensEstimatedExamined"];

  objc_msgSend(v5, "setNumTokensEstimatedExamined:", objc_msgSend(v18, "unsignedIntValue"));
  return v5;
}

- (id)_lmMetricsFromEvalDict:(id)a3 perplexityName:(id)a4 timesDict:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v37 = a5;
  uint64_t v38 = v7;
  uint64_t v8 = [a3 objectForKeyedSubscript:v7];
  if (v8)
  {
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v34 = v8;
    id obj = v8;
    uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v39)
    {
      uint64_t v35 = *(void *)v47;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v9;
          uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
          uint64_t v11 = objc_msgSend(obj, "objectForKeyedSubscript:", v10, v34);
          id v12 = objc_alloc_init(MEMORY[0x263F6DB20]);
          [v36 addObject:v12];
          [v10 floatValue];
          objc_msgSend(v12, "setLinearInterpolationWeight:");
          id v13 = [v37 objectForKeyedSubscript:v38];
          id v14 = [v13 objectForKeyedSubscript:v10];
          id v15 = NSNumber;
          [v14 doubleValue];
          id v17 = [v15 numberWithDouble:v16 * 1000.0];
          objc_msgSend(v12, "setTotalDurationInMs:", objc_msgSend(v17, "unsignedLongLongValue"));

          double v18 = [v11 objectForKeyedSubscript:@"utterances"];
          objc_msgSend(v12, "setNumUtterances:", objc_msgSend(v18, "unsignedIntValue"));

          id v19 = [v11 objectForKeyedSubscript:@"words"];
          objc_msgSend(v12, "setNumWords:", objc_msgSend(v19, "unsignedIntValue"));

          double v20 = [v11 objectForKeyedSubscript:@"OOVs"];
          objc_msgSend(v12, "setNumOutOfVocabularyWords:", objc_msgSend(v20, "unsignedIntValue"));

          long long v21 = [v11 objectForKeyedSubscript:@"invalidTokens"];
          objc_msgSend(v12, "setNumInvalidTokens:", objc_msgSend(v21, "unsignedIntValue"));

          long long v22 = [v11 objectForKeyedSubscript:@"invalidUtterances"];
          objc_msgSend(v12, "setNumInvalidUtterances:", objc_msgSend(v22, "unsignedIntValue"));

          long long v23 = [v11 objectForKeyedSubscript:@"PPL"];
          [v23 floatValue];
          objc_msgSend(v12, "setPerplexity:");

          double v24 = [v11 objectForKeyedSubscript:@"PPL1"];
          [v24 floatValue];
          objc_msgSend(v12, "setPerplexityOne:");

          id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          uint64_t v26 = [v11 objectForKeyedSubscript:@"ngramHits"];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v43;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v43 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                id v32 = objc_alloc_init(MEMORY[0x263F6DB30]);
                [v25 addObject:v32];
                [v32 setHits:v31];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v28);
          }

          [v12 setNgramHits:v25];
          uint64_t v9 = v41 + 1;
        }
        while (v41 + 1 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v39);
    }

    uint64_t v8 = v34;
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

- (void)_wrapAndEmitTopLevelEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F6DBB0]);
  id v6 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:self->_dodmlId];
  [v5 setDodMlId:v6];
  [v5 setExperimentName:self->_experimentName];
  [v5 setTrialExperimentId:self->_trialExperimentId];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:self->_trialTreatmentId];
  [v5 setTrialTreatmentId:v7];
  [v5 setTrialDeploymentId:self->_trialDeploymentId];
  id v8 = objc_alloc_init(MEMORY[0x263F6DBA8]);
  [v8 setEventMetadata:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setPersonalizationExperimentContext:v4];
LABEL_9:
    uint64_t v9 = (void *)*MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEBUG)) {
      -[LoggingHelper _wrapAndEmitTopLevelEvent:](v9);
    }
    uint64_t v10 = [MEMORY[0x263F6C818] sharedStream];
    [v10 emitMessage:v8];

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setUserEditExperimentContext:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setUserEditExperimentEndedTier1:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setAudioFileResultTier1:v4];
    goto LABEL_9;
  }
  uint64_t v11 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_ERROR)) {
    -[LoggingHelper _wrapAndEmitTopLevelEvent:](v11, v12, v13, v14, v15, v16, v17, v18);
  }
LABEL_12:
}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (void)setDatapackVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datapackVersion, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_dodmlId, 0);
}

- (void)_decodingResultsWithAudioDict:(uint64_t)a3 privateTokensOut:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_decodingResultsWithAudioDict:(uint64_t)a3 privateTokensOut:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_decodingMetricsFromMetricsDict:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)_decodingMetricsFromMetricsDict:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_254EAC000, v0, OS_LOG_TYPE_ERROR, "%s Fides SELF: Encountered malformed string during SELF logging for interpolation weights in speech results from recognizer. String: %@", (uint8_t *)v1, 0x16u);
}

- (void)_wrapAndEmitTopLevelEvent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_254EAC000, v1, OS_LOG_TYPE_DEBUG, "%s Fides SELF: Wrapping and logging an event of type %@", (uint8_t *)v4, 0x16u);
}

- (void)_wrapAndEmitTopLevelEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end