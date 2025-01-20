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
    uint64_t v15 = +[NSUUID UUID];
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
    NSLog(@"SELF Logging object created successfully: dodmlId=%@, experimentName=%@, trialExperimentId=%@, trialTreatmentId=%@, trialDeploymentId=%llu", v17, experimentName, trialExperimentId, v20, v14->_trialDeploymentId);
  }
  return v14;
}

- (void)logUserEditExperimentStartedOrChanged
{
  id v4 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentStarted);
  [v4 setExists:1];
  id v3 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentContext);
  [v3 setStartedOrChanged:v4];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v3];
}

- (void)logUserEditExperimentEndedAndTier1WithResultsDict:(id)a3
{
  id v4 = a3;
  id v51 = objc_alloc_init((Class)NSMutableArray);
  id v48 = objc_alloc_init((Class)NSMutableArray);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v56 = v4;
  id obj = [v4 objectForKeyedSubscript:@"audioResults"];
  id v52 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
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
        id v7 = objc_alloc_init((Class)NSMutableArray);
        id v8 = objc_alloc_init((Class)NSMutableArray);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v53 = v6;
        id v55 = [v6 objectForKeyedSubscript:@"confusionPairs"];
        id v9 = [v55 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v62;
          do
          {
            id v12 = 0;
            do
            {
              if (*(void *)v62 != v11) {
                objc_enumerationMutation(v55);
              }
              id v13 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v12);
              id v14 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRConfusionPair);
              [v14 setErrorCode:0];
              uint64_t v15 = [v13 objectForKeyedSubscript:@"editMethod"];
              id v16 = [v15 intValue];

              [v14 setEditMethod:v16];
              v17 = [v13 objectForKeyedSubscript:@"errorType"];
              id v18 = [v17 intValue];

              [v14 setEditReason:v18];
              v19 = [v13 objectForKeyedSubscript:@"index"];
              objc_msgSend(v14, "setRecognizedTextStartIndex:", objc_msgSend(v19, "intValue"));

              id v20 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRConfusionPairTier1);
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

              id v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v55 countByEnumeratingWithState:&v61 objects:v70 count:16];
          }
          while (v10);
        }

        id v26 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults);
        self = v50;
        [v26 setDatapackVersion:v50->_datapackVersion];
        id v27 = objc_alloc((Class)SISchemaUUID);
        id v28 = objc_alloc((Class)NSUUID);
        v29 = [v53 objectForKeyedSubscript:@"asrId"];
        id v30 = [v28 initWithUUIDString:v29];
        id v31 = [v27 initWithNSUUID:v30];
        [v26 setAsrId:v31];

        v32 = [v53 objectForKeyedSubscript:@"errorCode"];
        objc_msgSend(v26, "setErrorCode:", objc_msgSend(v32, "intValue"));

        if ([v7 count])
        {
          [v26 setConfusionPairs:v7];
          id v33 = objc_alloc((Class)SISchemaUUID);
          v34 = +[NSUUID UUID];
          id v35 = [v33 initWithNSUUID:v34];

          [v26 setLinkId:v35];
          id v36 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1);
          [v36 setLinkId:v35];
          [v36 setConfusionPairs:v8];
          [v48 addObject:v36];
        }
        [v51 addObject:v26];

        uint64_t v5 = v54 + 1;
      }
      while ((id)(v54 + 1) != v52);
      id v52 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v52);
  }

  id v37 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentEnded);
  v38 = [v56 objectForKeyedSubscript:@"numAudioAvailable"];
  objc_msgSend(v37, "setNumAudioFilesAvailable:", objc_msgSend(v38, "unsignedIntValue"));

  v39 = [v56 objectForKeyedSubscript:@"numSelectedAudio"];
  objc_msgSend(v37, "setNumAudioFilesSelected:", objc_msgSend(v39, "unsignedIntValue"));

  v40 = [v56 objectForKeyedSubscript:@"errorCode"];
  objc_msgSend(v37, "setErrorCode:", objc_msgSend(v40, "intValue"));

  [v37 setRedecodingResults:v51];
  id v41 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentContext);
  [v41 setEnded:v37];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v41];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v42 = v48;
  id v43 = [v42 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v58;
    do
    {
      v46 = 0;
      do
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(v42);
        }
        [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:*(void *)(*((void *)&v57 + 1) + 8 * (void)v46)];
        v46 = (char *)v46 + 1;
      }
      while (v44 != v46);
      id v44 = [v42 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v44);
  }
}

- (void)logDictationPersonalizationExperimentStartedOrChanged
{
  id v5 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRPersonalizationExperimentStarted);
  [v5 setExists:1];
  id v3 = +[NSProcessInfo processInfo];
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v3, "thermalState"));

  id v4 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRPersonalizationExperimentContext);
  [v4 setStartedOrChanged:v5];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v4];
}

- (void)logDictationPersonalizationExperimentEndedAndTier1WithResultsDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRPersonalizationExperimentEnded);
  [v4 objectForKeyedSubscript:@"languageMetadata"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    id v29 = v4;
    uint64_t v9 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) objectForKeyedSubscript:@"status"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v11 isEqualToString:@"Required Personalized LM not found"])
        {

          id v12 = &off_1000162D8;
          id v4 = v29;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    id v4 = v29;
  }
  id v12 = &off_1000162C0;
LABEL_13:

  objc_msgSend(v5, "setExperimentStatusCode:", objc_msgSend(v12, "intValue"));
  [v5 setDatapackVersion:self->_datapackVersion];
  id v13 = [v4 objectForKeyedSubscript:@"numAudio"];
  objc_msgSend(v5, "setNumAudioFilesAvailable:", objc_msgSend(v13, "unsignedIntValue"));

  id v14 = [v4 objectForKeyedSubscript:@"numSelectedAudio"];
  objc_msgSend(v5, "setNumAudioFilesSelected:", objc_msgSend(v14, "unsignedIntValue"));

  uint64_t v15 = [v4 objectForKeyedSubscript:@"textProcessingDuration"];
  [v15 doubleValue];
  v17 = +[NSNumber numberWithDouble:v16 * 1000000000.0];
  objc_msgSend(v5, "setTextProcessingDurationInNs:", objc_msgSend(v17, "unsignedLongLongValue"));

  id v18 = +[NSProcessInfo processInfo];
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v18, "thermalState"));

  id v34 = 0;
  v19 = [(LoggingHelper *)self _audioFileResultsFromResultDict:v4 privateAudioFileResultsOut:&v34];
  id v20 = v34;
  [v5 setAudioFileResults:v19];

  v21 = [v4 objectForKeyedSubscript:@"personalizedLM"];
  objc_super v22 = [(LoggingHelper *)self _plmMetricsFromPlmDict:v21];
  [v5 setPersonalizedLanguageModelMetrics:v22];

  id v23 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRPersonalizationExperimentContext);
  [v23 setEnded:v5];
  [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:v23];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v24 = v20;
  id v25 = [v24 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v31;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(v24);
        }
        [(LoggingHelper *)self _wrapAndEmitTopLevelEvent:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
      }
      id v26 = [v24 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v26);
  }
}

- (id)_audioFileResultsFromResultDict:(id)a3 privateAudioFileResultsOut:(id *)a4
{
  id v4 = a3;
  id v28 = objc_alloc_init((Class)NSMutableArray);
  id v29 = objc_alloc_init((Class)NSMutableArray);
  id v24 = v4;
  [v4 objectForKeyedSubscript:@"audioResults"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v9 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRAudioFileResult);
        [v29 addObject:v9];
        id v10 = objc_alloc((Class)SISchemaUUID);
        id v11 = objc_alloc((Class)NSUUID);
        id v12 = [v8 objectForKeyedSubscript:@"asrSelfComponentId"];
        id v13 = [v11 initWithUUIDString:v12];
        id v14 = [v10 initWithNSUUID:v13];

        [v9 setAsrId:v14];
        id v15 = objc_alloc((Class)SISchemaUUID);
        double v16 = +[NSUUID UUID];
        id v17 = [v15 initWithNSUUID:v16];

        [v9 setLinkId:v17];
        id v30 = 0;
        id v18 = [(LoggingHelper *)self _decodingResultsWithAudioDict:v8 privateTokensOut:&v30];
        id v19 = v30;
        [v9 setDecodingResults:v18];

        id v20 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRAudioFileResultTier1);
        [v28 addObject:v20];
        id v21 = objc_alloc_init((Class)ASRSchemaASRRecognitionResultTier1);
        [v21 setLinkId:v17];
        [v21 setTokens:v19];

        [v20 setRecognitionResult:v21];
      }
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
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
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v61 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 objectForKeyedSubscript:@"tokens"];
  id v8 = [v5 objectForKeyedSubscript:@"metrics"];
  long long v59 = [v5 objectForKeyedSubscript:@"alignments"];
  long long v60 = v7;
  id v9 = [v7 allKeys];
  id v10 = [v5 objectForKeyedSubscript:@"uttInfos"];

  id v55 = v5;
  if (v10)
  {
    long long v58 = [v5 objectForKeyedSubscript:@"uttInfos"];
  }
  else
  {
    id v11 = [v5 objectForKeyedSubscript:@"uttInfosCompressed"];

    if (v11)
    {
      id v12 = objc_alloc((Class)NSData);
      id v13 = [v5 objectForKeyedSubscript:@"uttInfosCompressed"];
      id v14 = [v12 initWithBase64EncodedString:v13 options:0];

      id v67 = 0;
      id v15 = [v14 decompressedDataUsingAlgorithm:3 error:&v67];
      id v16 = v67;
      id v66 = 0;
      long long v58 = +[NSJSONSerialization JSONObjectWithData:v15 options:0 error:&v66];
      id v17 = v66;
      id v18 = v17;
      if (v16)
      {
        id v19 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR)) {
          -[LoggingHelper _decodingResultsWithAudioDict:privateTokensOut:](v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      else if (v17)
      {
        uint64_t v27 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR)) {
          -[LoggingHelper _decodingResultsWithAudioDict:privateTokensOut:](v27, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    else
    {
      long long v58 = 0;
    }
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v9;
  id v35 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v57 = *(void *)v63;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v63 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        id v39 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRDecodingResult);
        [v61 addObject:v39];
        [v39 setConfigName:v38];
        v40 = [v8 objectForKeyedSubscript:v38];
        id v41 = [(LoggingHelper *)self _decodingMetricsFromMetricsDict:v40];
        [v39 setDecodingMetrics:v41];

        id v42 = [v60 objectForKeyedSubscript:v38];
        id v43 = [(LoggingHelper *)self _tokensFromTokenDict:v42 privateTokens:v6];
        [v39 setTokens:v43];

        id v44 = [v58 objectForKeyedSubscript:v38];
        uint64_t v45 = [(LoggingHelper *)self _utteranceInfosFromUtteranceInfoDict:v44 privateTokens:v6];
        [v39 setUtterances:v45];

        v46 = [v8 objectForKeyedSubscript:v38];
        v47 = [v46 objectForKeyedSubscript:@"DecodeDuration"];
        id v48 = v6;
        [v47 doubleValue];
        v50 = +[NSNumber numberWithDouble:v49 * 1000000000.0];
        objc_msgSend(v39, "setDecodeDurationInNs:", objc_msgSend(v50, "unsignedLongLongValue"));

        id v6 = v48;
        id v51 = [v59 objectForKeyedSubscript:v38];
        id v52 = [(LoggingHelper *)self _alignmentInfosFromAlignmentDict:v51];
        [v39 setAlignments:v52];
      }
      id v36 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v36);
  }

  if (a4) {
    *a4 = v6;
  }

  return v61;
}

- (id)_decodingMetricsFromMetricsDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRDecodingMetrics);
  uint64_t v33 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"WallRTF"];
  [v5 floatValue];
  objc_msgSend(v4, "setWallRealTimeFactor:");

  id v6 = [v33 objectForKeyedSubscript:@"AverageActiveTokensPerFrame"];
  [v6 floatValue];
  objc_msgSend(v4, "setAverageActiveTokensPerFrame:");

  id v7 = [v33 objectForKeyedSubscript:@"jitQueryDurationInMs"];
  objc_msgSend(v4, "setJitQueryDurationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));

  id v8 = [v33 objectForKeyedSubscript:@"jitLmeDurationInMs"];
  objc_msgSend(v4, "setJitLanguageModelEnrollmentDurationInMs:", objc_msgSend(v8, "unsignedLongLongValue"));

  id v9 = [v33 valueForKeyPath:@"jitDataStats.preprocessingCategoryCounts"];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke;
  v42[3] = &unk_1000146D0;
  id v10 = v4;
  id v43 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v42];

  id v11 = [v33 valueForKeyPath:@"jitDataStats.postprocessingCategoryCounts"];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke_2;
  v40[3] = &unk_1000146D0;
  id v31 = v10;
  id v41 = v31;
  [v11 enumerateKeysAndObjectsUsingBlock:v40];

  uint64_t v32 = [v33 objectForKeyedSubscript:@"lm_interp_weights"];
  if (v32)
  {
    id v35 = objc_alloc_init((Class)NSMutableArray);
    [v32 componentsSeparatedByString:@";"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v37;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v14);
          id v16 = objc_alloc_init((Class)ASRSchemaASRInterpolationWeightBundle);
          id v17 = [v15 componentsSeparatedByString:@":"];
          id v18 = [v17 objectAtIndexedSubscript:1];
          [v18 doubleValue];
          id v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

          uint64_t v20 = [v17 objectAtIndexedSubscript:2];
          [v20 doubleValue];
          uint64_t v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

          [v19 doubleValue];
          uint64_t v23 = +[NSNumber numberWithDouble:v22 * 1000000.0];
          objc_msgSend(v16, "setStartTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));

          [v21 doubleValue];
          uint64_t v25 = +[NSNumber numberWithDouble:v24 * 1000000.0];
          objc_msgSend(v16, "setEndTimeInNs:", objc_msgSend(v25, "unsignedLongLongValue"));

          uint64_t v26 = [v17 objectAtIndexedSubscript:0];
          uint64_t v27 = [v26 componentsSeparatedByString:@","];

          uint64_t v28 = [v27 valueForKey:@"floatValue"];
          [v16 setWeights:v28];

          [v35 addObject:v16];
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v12);
    }

    [v31 setLanguageModelInterpolationWeights:v35];
  }
  id v29 = v31;

  return v29;
}

void __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init((Class)DODMLASRSchemaDODMLASREntityCategoryCount);
  [v8 setEntityCategory:v6];

  id v7 = [v5 unsignedLongValue];
  [v8 setCount:v7];
  [*(id *)(a1 + 32) addPreprocessingEntityCategoryCounts:v8];
}

void __49__LoggingHelper__decodingMetricsFromMetricsDict___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init((Class)DODMLASRSchemaDODMLASREntityCategoryCount);
  [v8 setEntityCategory:v6];

  id v7 = [v5 unsignedLongValue];
  [v8 setCount:v7];
  [*(id *)(a1 + 32) addPostprocessingEntityCategoryCounts:v8];
}

- (id)_utteranceInfosFromUtteranceInfoDict:(id)a3 privateTokens:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v6;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v13 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUtteranceInfo);
          [v7 addObject:v13];
          id v14 = [v12 objectForKeyedSubscript:@"results"];
          id v15 = [(LoggingHelper *)self _resultInfosFromResultInfoDict:v14 privateTokens:v25];
          [v13 setResults:v15];

          id v16 = [v12 objectForKeyedSubscript:@"startMillis"];
          [v16 doubleValue];
          id v18 = +[NSNumber numberWithDouble:v17 * 1000000.0];
          objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

          id v19 = [v12 objectForKeyedSubscript:@"endMillis"];
          [v19 doubleValue];
          uint64_t v21 = +[NSNumber numberWithDouble:v20 * 1000000.0];
          objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));
        }
        id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    id v6 = v23;
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
    id v3 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __50__LoggingHelper__alignmentInfosFromAlignmentDict___block_invoke;
    v6[3] = &unk_1000146F8;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v7 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __50__LoggingHelper__alignmentInfosFromAlignmentDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v12 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRAlignmentInfo);
  [*(id *)(a1 + 32) addObject:v12];
  [v12 setReferenceName:v6];

  id v7 = [v5 objectForKeyedSubscript:@"Deletions"];
  objc_msgSend(v12, "setNumDeletions:", objc_msgSend(v7, "unsignedIntValue"));

  id v8 = [v5 objectForKeyedSubscript:@"Insertions"];
  objc_msgSend(v12, "setNumInsertions:", objc_msgSend(v8, "unsignedIntValue"));

  id v9 = [v5 objectForKeyedSubscript:@"Substitutions"];
  objc_msgSend(v12, "setNumSubstitutions:", objc_msgSend(v9, "unsignedIntValue"));

  uint64_t v10 = [v5 objectForKeyedSubscript:@"EditDistance"];
  objc_msgSend(v12, "setEditDistance:", objc_msgSend(v10, "unsignedIntValue"));

  id v11 = [v5 objectForKeyedSubscript:@"ReferenceSize"];

  objc_msgSend(v12, "setReferenceSize:", objc_msgSend(v11, "unsignedIntValue"));
}

- (id)_resultInfosFromResultInfoDict:(id)a3 privateTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v8 objectForKeyedSubscript:v13];
        id v15 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRResultInfo);
        [v7 addObject:v15];
        [v15 setStageName:v13];
        id v16 = [v14 objectForKeyedSubscript:@"aligned"];
        [v15 setIsAligned:v16 != 0];

        double v17 = [v14 objectForKeyedSubscript:@"choices"];
        id v18 = [(LoggingHelper *)self _choiceInfosFromChoiceInfoDicts:v17 privateTokens:v6];
        [v15 setChoices:v18];
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_choiceInfosFromChoiceInfoDicts:(id)a3 privateTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRChoiceInfo);
        [v8 addObject:v14];
        id v15 = [v13 objectForKeyedSubscript:@"tokens"];
        id v16 = [(LoggingHelper *)self _tokensFromTokensArray:v15 privateTokens:v7];
        [v14 setTokens:v16];

        double v17 = [v13 objectForKeyedSubscript:@"graphCost"];
        [v17 floatValue];
        objc_msgSend(v14, "setGraphCost:");

        id v18 = [v13 objectForKeyedSubscript:@"acousticCost"];
        [v18 floatValue];
        objc_msgSend(v14, "setAcousticCost:");
      }
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)_tokensFromTokensArray:(id)a3 privateTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v32 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v12 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRTokenInfo);
        [v32 addObject:v12];
        id v13 = objc_alloc_init((Class)ASRSchemaASRToken);
        id v14 = [v11 objectAtIndexedSubscript:1];
        [v14 doubleValue];
        id v16 = +[NSNumber numberWithDouble:v15 * 1000000.0];
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));

        double v17 = [v11 objectAtIndexedSubscript:2];
        [v17 doubleValue];
        id v19 = +[NSNumber numberWithDouble:v18 * 1000000.0];
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

        double v20 = [v11 objectAtIndexedSubscript:3];
        [v20 doubleValue];
        long long v22 = +[NSNumber numberWithDouble:v21 * 1000000.0];
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v22, "unsignedLongLongValue"));

        [v12 setToken:v13];
        long long v23 = [v11 objectAtIndexedSubscript:5];
        [v23 floatValue];
        objc_msgSend(v12, "setAcousticCost:");

        long long v24 = [v11 objectAtIndexedSubscript:6];
        [v24 floatValue];
        objc_msgSend(v12, "setSilenceAcousticCost:");

        id v25 = [v11 objectAtIndexedSubscript:7];
        [v12 setNumBackoffs:v25];

        long long v26 = [v11 objectAtIndexedSubscript:8];
        [v12 setLanguageModelCosts:v26];

        id v27 = objc_alloc_init((Class)ASRSchemaASRTokenTier1);
        long long v28 = [v11 objectAtIndexedSubscript:0];
        [v27 setText:v28];

        long long v29 = [v11 objectAtIndexedSubscript:4];
        [v27 setPhoneSequence:v29];

        if ([v6 containsObject:v27])
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v27));
        }
        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          [v6 addObject:v27];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }

  return v32;
}

- (id)_tokensFromTokenDict:(id)a3 privateTokens:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = objc_alloc_init((Class)ASRSchemaASRToken);
        [v7 addObject:v13];
        id v14 = [v12 objectForKeyedSubscript:@"startTime"];
        [v14 doubleValue];
        id v16 = +[NSNumber numberWithDouble:v15 * 1000000000.0];
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));

        double v17 = [v12 objectForKeyedSubscript:@"endTime"];
        [v17 doubleValue];
        id v19 = +[NSNumber numberWithDouble:v18 * 1000000000.0];
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

        double v20 = [v12 objectForKeyedSubscript:@"removeSpaceAfter"];
        objc_msgSend(v13, "setAppendSpaceAfter:", objc_msgSend(v20, "BOOLValue") ^ 1);

        double v21 = [v12 objectForKeyedSubscript:@"silenceStartTime"];
        [v21 doubleValue];
        long long v23 = +[NSNumber numberWithDouble:v22 * 1000000000.0];
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));

        long long v24 = [v12 objectForKeyedSubscript:@"confidence"];
        objc_msgSend(v13, "setConfidence:", objc_msgSend(v24, "intValue"));

        id v25 = objc_alloc_init((Class)ASRSchemaASRTokenTier1);
        long long v26 = [v12 objectForKeyedSubscript:@"text"];
        [v25 setText:v26];

        id v27 = [v12 objectForKeyedSubscript:@"phoneSequence"];
        [v25 setPhoneSequence:v27];

        if ([v6 containsObject:v25])
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "indexOfObject:", v25));
        }
        else
        {
          objc_msgSend(v13, "setLinkIndex:", objc_msgSend(v6, "count"));
          [v6 addObject:v25];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)_plmMetricsFromPlmDict:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"train"];
  id v6 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRTranscriptionMetrics);
  id v7 = [v5 objectForKeyedSubscript:@"data"];
  id v8 = [v7 objectForKeyedSubscript:@"train"];
  id v9 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v8];
  [v6 setTrain:v9];

  uint64_t v10 = [v5 objectForKeyedSubscript:@"data"];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"test"];
  id v12 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v11];
  [v6 setTest:v12];

  id v13 = [v5 objectForKeyedSubscript:@"data"];
  id v14 = [v13 objectForKeyedSubscript:@"dev"];
  double v15 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v14];
  [v6 setDev:v15];

  id v16 = [v5 objectForKeyedSubscript:@"data"];
  double v17 = [v16 objectForKeyedSubscript:@"external"];
  double v18 = [(LoggingHelper *)self _transcriptMetadataFromPopDict:v17];
  [v6 setExternal:v18];

  id v19 = objc_alloc_init((Class)DODMLASRSchemaDODMLASREvaluationMetrics);
  long long v60 = v5;
  double v20 = [v5 objectForKeyedSubscript:@"eval"];
  double v21 = [v20 objectForKeyedSubscript:@"model-selection"];
  double v22 = [v21 objectForKeyedSubscript:@"best-weight"];
  [v22 floatValue];
  objc_msgSend(v19, "setBestWeight:");

  long long v23 = [v20 objectForKeyedSubscript:@"totalTime"];
  [v23 doubleValue];
  id v25 = +[NSNumber numberWithDouble:v24 * 1000.0];
  objc_msgSend(v19, "setTotalDurationInMs:", objc_msgSend(v25, "unsignedLongLongValue"));

  long long v26 = [v20 objectForKeyedSubscript:@"times"];
  id v27 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"train-ppl" timesDict:v26];
  [v19 setTrains:v27];

  long long v28 = [v20 objectForKeyedSubscript:@"times"];
  long long v29 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"test-ppl" timesDict:v28];
  [v19 setTests:v29];

  long long v30 = [v20 objectForKeyedSubscript:@"times"];
  long long v31 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"dev-ppl" timesDict:v30];
  [v19 setDevs:v31];

  long long v32 = [v20 objectForKeyedSubscript:@"times"];
  long long v33 = [(LoggingHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"external-ppl" timesDict:v32];
  [v19 setExternals:v33];

  id v34 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRModelMetrics);
  long long v35 = [v5 objectForKeyedSubscript:@"model"];
  long long v36 = [v35 objectForKeyedSubscript:@"times"];
  [v34 setConfigName:0];
  long long v37 = [v35 objectForKeyedSubscript:@"order"];
  objc_msgSend(v34, "setNgramOrder:", objc_msgSend(v37, "unsignedIntValue"));

  long long v38 = [v35 objectForKeyedSubscript:@"residualAdaptationWeight"];
  [v38 floatValue];
  objc_msgSend(v34, "setResidualAdaptationWeight:");

  long long v39 = [v35 objectForKeyedSubscript:@"totalTime"];
  [v39 doubleValue];
  id v41 = +[NSNumber numberWithDouble:v40 * 1000.0];
  objc_msgSend(v34, "setTotalDurationInMs:", objc_msgSend(v41, "unsignedLongLongValue"));

  id v42 = [v36 objectForKeyedSubscript:@"training"];
  [v42 doubleValue];
  id v44 = +[NSNumber numberWithDouble:v43 * 1000.0];
  objc_msgSend(v34, "setTrainingDurationInMs:", objc_msgSend(v44, "unsignedLongLongValue"));

  uint64_t v45 = [v36 objectForKeyedSubscript:@"conversion"];
  [v45 doubleValue];
  v47 = +[NSNumber numberWithDouble:v46 * 1000.0];
  objc_msgSend(v34, "setConversionDurationInMs:", objc_msgSend(v47, "unsignedLongLongValue"));

  id v48 = [v36 objectForKeyedSubscript:@"optimization"];
  [v48 doubleValue];
  v50 = +[NSNumber numberWithDouble:v49 * 1000.0];
  objc_msgSend(v34, "setOptimizationDurationInMs:", objc_msgSend(v50, "unsignedLongLongValue"));

  id v51 = [v35 objectForKeyedSubscript:@"numStates"];
  objc_msgSend(v34, "setNumFiniteStateTransducerStates:", objc_msgSend(v51, "unsignedIntValue"));

  id v52 = [v35 objectForKeyedSubscript:@"numArcs"];
  objc_msgSend(v34, "setNumFiniteStateTransducerArcs:", objc_msgSend(v52, "unsignedIntValue"));

  v53 = [v4 objectForKeyedSubscript:@"trainErrorCode"];
  objc_msgSend(v34, "setModelTrainingStatusCode:", objc_msgSend(v53, "unsignedIntValue"));

  id v54 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics);
  id v55 = v6;
  [v54 setTranscriptionMetrics:v6];
  [v54 setEvaluationMetrics:v19];
  v56 = v4;
  uint64_t v57 = [v4 objectForKeyedSubscript:@"userLanguage"];

  long long v58 = [v57 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  objc_msgSend(v54, "setUserLocale:", +[SIUtilities convertLanguageCodeToSchemaLocale:](SIUtilities, "convertLanguageCodeToSchemaLocale:", v58));

  [v54 setModelMetrics:v34];
  return v54;
}

- (id)_transcriptMetadataFromPopDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRTranscriptMetadata);
  id v5 = [v3 objectForKeyedSubscript:@"numDocumentsRejected"];
  objc_msgSend(v4, "setNumDocumentsRejected:", objc_msgSend(v5, "unsignedIntValue"));

  id v6 = [v3 objectForKeyedSubscript:@"numSentencesRejected"];
  objc_msgSend(v4, "setNumSentencesRejected:", objc_msgSend(v6, "unsignedIntValue"));

  id v7 = [v3 objectForKeyedSubscript:@"numDocuments"];
  objc_msgSend(v4, "setNumDocumentsAccepted:", objc_msgSend(v7, "unsignedIntValue"));

  id v8 = [v3 objectForKeyedSubscript:@"numSentences"];
  objc_msgSend(v4, "setNumSentencesAccepted:", objc_msgSend(v8, "unsignedIntValue"));

  id v9 = [v3 objectForKeyedSubscript:@"numTokens"];
  objc_msgSend(v4, "setNumTokensAccepted:", objc_msgSend(v9, "unsignedIntValue"));

  uint64_t v10 = [v3 objectForKeyedSubscript:@"numTokensOOV"];
  objc_msgSend(v4, "setNumTokensOutOfVocabularyAccepted:", objc_msgSend(v10, "unsignedIntValue"));

  uint64_t v11 = [v3 objectForKeyedSubscript:@"numDocumentsDictated"];
  objc_msgSend(v4, "setNumDocumentsDictated:", objc_msgSend(v11, "unsignedIntValue"));

  id v12 = [v3 objectForKeyedSubscript:@"numDocumentsTyped"];
  objc_msgSend(v4, "setNumDocumentsTyped:", objc_msgSend(v12, "unsignedIntValue"));

  id v13 = [v3 objectForKeyedSubscript:@"numTokensDictated"];
  objc_msgSend(v4, "setNumTokensDictated:", objc_msgSend(v13, "unsignedIntValue"));

  id v14 = [v3 objectForKeyedSubscript:@"numTokensTyped"];
  objc_msgSend(v4, "setNumTokensTyped:", objc_msgSend(v14, "unsignedIntValue"));

  double v15 = [v3 objectForKeyedSubscript:@"numSentencesMungeRejected"];
  objc_msgSend(v4, "setNumSentencesMungeRejected:", objc_msgSend(v15, "unsignedIntValue"));

  id v16 = [v3 objectForKeyedSubscript:@"numSentencesMungeChanged"];
  objc_msgSend(v4, "setNumSentencesMungeChanged:", objc_msgSend(v16, "unsignedIntValue"));

  double v17 = [v3 objectForKeyedSubscript:@"numTokensEstimatedExamined"];

  objc_msgSend(v4, "setNumTokensEstimatedExamined:", objc_msgSend(v17, "unsignedIntValue"));
  return v4;
}

- (id)_lmMetricsFromEvalDict:(id)a3 perplexityName:(id)a4 timesDict:(id)a5
{
  id v7 = a4;
  id v36 = a5;
  long long v37 = v7;
  id v8 = [a3 objectForKeyedSubscript:v7];
  if (v8)
  {
    id v35 = objc_alloc_init((Class)NSMutableArray);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v33 = v8;
    id obj = v8;
    id v38 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v38)
    {
      uint64_t v34 = *(void *)v46;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v9;
          uint64_t v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
          uint64_t v11 = objc_msgSend(obj, "objectForKeyedSubscript:", v10, v33);
          id v12 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRLanguageModelMetrics);
          [v35 addObject:v12];
          [v10 floatValue];
          objc_msgSend(v12, "setLinearInterpolationWeight:");
          id v13 = [v36 objectForKeyedSubscript:v37];
          id v14 = [v13 objectForKeyedSubscript:v10];
          [v14 doubleValue];
          id v16 = +[NSNumber numberWithDouble:v15 * 1000.0];
          objc_msgSend(v12, "setTotalDurationInMs:", objc_msgSend(v16, "unsignedLongLongValue"));

          double v17 = [v11 objectForKeyedSubscript:@"utterances"];
          objc_msgSend(v12, "setNumUtterances:", objc_msgSend(v17, "unsignedIntValue"));

          double v18 = [v11 objectForKeyedSubscript:@"words"];
          objc_msgSend(v12, "setNumWords:", objc_msgSend(v18, "unsignedIntValue"));

          id v19 = [v11 objectForKeyedSubscript:@"OOVs"];
          objc_msgSend(v12, "setNumOutOfVocabularyWords:", objc_msgSend(v19, "unsignedIntValue"));

          double v20 = [v11 objectForKeyedSubscript:@"invalidTokens"];
          objc_msgSend(v12, "setNumInvalidTokens:", objc_msgSend(v20, "unsignedIntValue"));

          double v21 = [v11 objectForKeyedSubscript:@"invalidUtterances"];
          objc_msgSend(v12, "setNumInvalidUtterances:", objc_msgSend(v21, "unsignedIntValue"));

          double v22 = [v11 objectForKeyedSubscript:@"PPL"];
          [v22 floatValue];
          objc_msgSend(v12, "setPerplexity:");

          long long v23 = [v11 objectForKeyedSubscript:@"PPL1"];
          [v23 floatValue];
          objc_msgSend(v12, "setPerplexityOne:");

          id v24 = objc_alloc_init((Class)NSMutableArray);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v25 = [v11 objectForKeyedSubscript:@"ngramHits"];
          id v26 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v42;
            do
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v42 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                id v31 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRNgramHits);
                [v24 addObject:v31];
                [v31 setHits:v30];
              }
              id v27 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }
            while (v27);
          }

          [v12 setNgramHits:v24];
          uint64_t v9 = v40 + 1;
        }
        while ((id)(v40 + 1) != v38);
        id v38 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v38);
    }

    id v8 = v33;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

- (void)_wrapAndEmitTopLevelEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)DODMLSchemaDODMLClientEventMetadata);
  id v6 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_dodmlId];
  [v5 setDodMlId:v6];
  [v5 setExperimentName:self->_experimentName];
  [v5 setTrialExperimentId:self->_trialExperimentId];
  id v7 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_trialTreatmentId];
  [v5 setTrialTreatmentId:v7];
  [v5 setTrialDeploymentId:self->_trialDeploymentId];
  id v8 = objc_alloc_init((Class)DODMLSchemaDODMLClientEvent);
  [v8 setEventMetadata:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setPersonalizationExperimentContext:v4];
LABEL_9:
    uint64_t v9 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG)) {
      -[LoggingHelper _wrapAndEmitTopLevelEvent:](v9);
    }
    uint64_t v10 = +[AssistantSiriAnalytics sharedStream];
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
  uint64_t v11 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
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
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Fides SELF: Encountered malformed string during SELF logging for interpolation weights in speech results from recognizer. String: %@", (uint8_t *)v1, 0x16u);
}

- (void)_wrapAndEmitTopLevelEvent:(void *)a1 .cold.1(void *a1)
{
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "%s Fides SELF: Wrapping and logging an event of type %@", (uint8_t *)v4, 0x16u);
}

- (void)_wrapAndEmitTopLevelEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end