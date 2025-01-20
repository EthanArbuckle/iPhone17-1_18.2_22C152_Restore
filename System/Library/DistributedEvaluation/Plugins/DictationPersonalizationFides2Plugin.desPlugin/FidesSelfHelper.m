@interface FidesSelfHelper
- (FidesSelfHelper)initWithExperimentId:(id)a3;
- (NSString)datapackVersion;
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

@implementation FidesSelfHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datapackVersion, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);

  objc_storeStrong((id *)&self->_dodmlId, 0);
}

- (void)setDatapackVersion:(id)a3
{
}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (void)_wrapAndEmitTopLevelEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)DODMLSchemaDODMLClientEventMetadata);
  id v6 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_dodmlId];
  [v5 setDodMlId:v6];
  [v5 setExperimentName:self->_experimentId];
  id v7 = objc_alloc_init((Class)DODMLSchemaDODMLClientEvent);
  [v7 setEventMetadata:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setPersonalizationExperimentContext:v4];
LABEL_9:
    v8 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      v11 = v8;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      int v14 = 136315394;
      v15 = "-[FidesSelfHelper _wrapAndEmitTopLevelEvent:]";
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "%s Fides SELF: Wrapping and logging an event of type %@", (uint8_t *)&v14, 0x16u);
    }
    v9 = +[AssistantSiriAnalytics sharedStream];
    [v9 emitMessage:v7];

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setUserEditExperimentContext:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setUserEditExperimentEndedTier1:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setAudioFileResultTier1:v4];
    goto LABEL_9;
  }
  v10 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315138;
    v15 = "-[FidesSelfHelper _wrapAndEmitTopLevelEvent:]";
    _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%s Fides SELF: Failed trying to wrap and emit top-level ASR event because event type was not mapped to loggable message type in the DODML ASR SELF schema.", (uint8_t *)&v14, 0xCu);
  }
LABEL_12:
}

- (id)_lmMetricsFromEvalDict:(id)a3 perplexityName:(id)a4 timesDict:(id)a5
{
  id v7 = a4;
  id v36 = a5;
  v37 = v7;
  v8 = [a3 objectForKeyedSubscript:v7];
  if (v8)
  {
    id v35 = objc_alloc_init((Class)NSMutableArray);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v33 = v8;
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
          v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
          v11 = objc_msgSend(obj, "objectForKeyedSubscript:", v10, v33);
          id v12 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRLanguageModelMetrics);
          [v35 addObject:v12];
          [v10 floatValue];
          objc_msgSend(v12, "setLinearInterpolationWeight:");
          v13 = [v36 objectForKeyedSubscript:v37];
          int v14 = [v13 objectForKeyedSubscript:v10];
          [v14 doubleValue];
          __int16 v16 = +[NSNumber numberWithDouble:v15 * 1000.0];
          objc_msgSend(v12, "setTotalDurationInMs:", objc_msgSend(v16, "unsignedLongLongValue"));

          v17 = [v11 objectForKeyedSubscript:@"utterances"];
          objc_msgSend(v12, "setNumUtterances:", objc_msgSend(v17, "unsignedIntValue"));

          v18 = [v11 objectForKeyedSubscript:@"words"];
          objc_msgSend(v12, "setNumWords:", objc_msgSend(v18, "unsignedIntValue"));

          v19 = [v11 objectForKeyedSubscript:@"OOVs"];
          objc_msgSend(v12, "setNumOutOfVocabularyWords:", objc_msgSend(v19, "unsignedIntValue"));

          v20 = [v11 objectForKeyedSubscript:@"invalidTokens"];
          objc_msgSend(v12, "setNumInvalidTokens:", objc_msgSend(v20, "unsignedIntValue"));

          v21 = [v11 objectForKeyedSubscript:@"invalidUtterances"];
          objc_msgSend(v12, "setNumInvalidUtterances:", objc_msgSend(v21, "unsignedIntValue"));

          v22 = [v11 objectForKeyedSubscript:@"PPL"];
          [v22 floatValue];
          objc_msgSend(v12, "setPerplexity:");

          v23 = [v11 objectForKeyedSubscript:@"PPL1"];
          [v23 floatValue];
          objc_msgSend(v12, "setPerplexityOne:");

          id v24 = objc_alloc_init((Class)NSMutableArray);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v25 = [v11 objectForKeyedSubscript:@"ngramHits"];
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

    v8 = v33;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
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

  v8 = [v3 objectForKeyedSubscript:@"numSentences"];
  objc_msgSend(v4, "setNumSentencesAccepted:", objc_msgSend(v8, "unsignedIntValue"));

  uint64_t v9 = [v3 objectForKeyedSubscript:@"numTokens"];
  objc_msgSend(v4, "setNumTokensAccepted:", objc_msgSend(v9, "unsignedIntValue"));

  v10 = [v3 objectForKeyedSubscript:@"numTokensOOV"];
  objc_msgSend(v4, "setNumTokensOutOfVocabularyAccepted:", objc_msgSend(v10, "unsignedIntValue"));

  v11 = [v3 objectForKeyedSubscript:@"numDocumentsDictated"];
  objc_msgSend(v4, "setNumDocumentsDictated:", objc_msgSend(v11, "unsignedIntValue"));

  id v12 = [v3 objectForKeyedSubscript:@"numDocumentsTyped"];
  objc_msgSend(v4, "setNumDocumentsTyped:", objc_msgSend(v12, "unsignedIntValue"));

  v13 = [v3 objectForKeyedSubscript:@"numTokensDictated"];
  objc_msgSend(v4, "setNumTokensDictated:", objc_msgSend(v13, "unsignedIntValue"));

  int v14 = [v3 objectForKeyedSubscript:@"numTokensTyped"];
  objc_msgSend(v4, "setNumTokensTyped:", objc_msgSend(v14, "unsignedIntValue"));

  double v15 = [v3 objectForKeyedSubscript:@"numSentencesMungeRejected"];
  objc_msgSend(v4, "setNumSentencesMungeRejected:", objc_msgSend(v15, "unsignedIntValue"));

  __int16 v16 = [v3 objectForKeyedSubscript:@"numSentencesMungeChanged"];
  objc_msgSend(v4, "setNumSentencesMungeChanged:", objc_msgSend(v16, "unsignedIntValue"));

  v17 = [v3 objectForKeyedSubscript:@"numTokensEstimatedExamined"];
  objc_msgSend(v4, "setNumTokensEstimatedExamined:", objc_msgSend(v17, "unsignedIntValue"));

  [v3 removeObjectForKey:@"numTokensEstimatedExamined"];

  return v4;
}

- (id)_plmMetricsFromPlmDict:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"train"];
  id v6 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRTranscriptionMetrics);
  id v7 = [v5 objectForKeyedSubscript:@"data"];
  v8 = [v7 objectForKeyedSubscript:@"train"];
  uint64_t v9 = [(FidesSelfHelper *)self _transcriptMetadataFromPopDict:v8];
  [v6 setTrain:v9];

  v10 = [v5 objectForKeyedSubscript:@"data"];
  v11 = [v10 objectForKeyedSubscript:@"test"];
  id v12 = [(FidesSelfHelper *)self _transcriptMetadataFromPopDict:v11];
  [v6 setTest:v12];

  v13 = [v5 objectForKeyedSubscript:@"data"];
  int v14 = [v13 objectForKeyedSubscript:@"dev"];
  double v15 = [(FidesSelfHelper *)self _transcriptMetadataFromPopDict:v14];
  v59 = v6;
  [v6 setDev:v15];

  __int16 v16 = [v5 objectForKeyedSubscript:@"data"];
  v17 = [v16 objectForKeyedSubscript:@"external"];
  v18 = [(FidesSelfHelper *)self _transcriptMetadataFromPopDict:v17];
  [v6 setExternal:v18];

  id v19 = objc_alloc_init((Class)DODMLASRSchemaDODMLASREvaluationMetrics);
  v20 = [v5 objectForKeyedSubscript:@"eval"];
  v21 = [v20 objectForKeyedSubscript:@"model-selection"];
  v22 = [v21 objectForKeyedSubscript:@"best-weight"];
  [v22 floatValue];
  objc_msgSend(v19, "setBestWeight:");

  v23 = [v20 objectForKeyedSubscript:@"totalTime"];
  [v23 doubleValue];
  v25 = +[NSNumber numberWithDouble:v24 * 1000.0];
  objc_msgSend(v19, "setTotalDurationInMs:", objc_msgSend(v25, "unsignedLongLongValue"));

  id v26 = [v20 objectForKeyedSubscript:@"times"];
  id v27 = [(FidesSelfHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"train-ppl" timesDict:v26];
  [v19 setTrains:v27];

  uint64_t v28 = [v20 objectForKeyedSubscript:@"times"];
  v29 = [(FidesSelfHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"test-ppl" timesDict:v28];
  [v19 setTests:v29];

  uint64_t v30 = [v20 objectForKeyedSubscript:@"times"];
  id v31 = [(FidesSelfHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"dev-ppl" timesDict:v30];
  [v19 setDevs:v31];

  v32 = [v20 objectForKeyedSubscript:@"times"];
  v33 = [(FidesSelfHelper *)self _lmMetricsFromEvalDict:v20 perplexityName:@"external-ppl" timesDict:v32];
  [v19 setExternals:v33];

  id v34 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRModelMetrics);
  id v35 = [v5 objectForKeyedSubscript:@"model"];
  id v36 = [v35 objectForKeyedSubscript:@"times"];
  [v34 setConfigName:0];
  v37 = [v35 objectForKeyedSubscript:@"order"];
  objc_msgSend(v34, "setNgramOrder:", objc_msgSend(v37, "unsignedIntValue"));

  id v38 = [v35 objectForKeyedSubscript:@"residualAdaptationWeight"];
  [v38 floatValue];
  objc_msgSend(v34, "setResidualAdaptationWeight:");

  v39 = [v35 objectForKeyedSubscript:@"totalTime"];
  [v39 doubleValue];
  long long v41 = +[NSNumber numberWithDouble:v40 * 1000.0];
  objc_msgSend(v34, "setTotalDurationInMs:", objc_msgSend(v41, "unsignedLongLongValue"));

  long long v42 = [v36 objectForKeyedSubscript:@"training"];
  [v42 doubleValue];
  long long v44 = +[NSNumber numberWithDouble:v43 * 1000.0];
  objc_msgSend(v34, "setTrainingDurationInMs:", objc_msgSend(v44, "unsignedLongLongValue"));

  long long v45 = [v36 objectForKeyedSubscript:@"conversion"];
  [v45 doubleValue];
  long long v47 = +[NSNumber numberWithDouble:v46 * 1000.0];
  objc_msgSend(v34, "setConversionDurationInMs:", objc_msgSend(v47, "unsignedLongLongValue"));

  long long v48 = [v36 objectForKeyedSubscript:@"optimization"];
  [v48 doubleValue];
  v50 = +[NSNumber numberWithDouble:v49 * 1000.0];
  objc_msgSend(v34, "setOptimizationDurationInMs:", objc_msgSend(v50, "unsignedLongLongValue"));

  v51 = [v35 objectForKeyedSubscript:@"numStates"];
  objc_msgSend(v34, "setNumFiniteStateTransducerStates:", objc_msgSend(v51, "unsignedIntValue"));

  [v35 removeObjectForKey:@"numStates"];
  v52 = [v35 objectForKeyedSubscript:@"numArcs"];
  objc_msgSend(v34, "setNumFiniteStateTransducerArcs:", objc_msgSend(v52, "unsignedIntValue"));

  [v35 removeObjectForKey:@"numArcs"];
  v53 = v4;
  v54 = [v4 objectForKeyedSubscript:@"trainErrorCode"];
  objc_msgSend(v34, "setModelTrainingStatusCode:", objc_msgSend(v54, "unsignedIntValue"));

  [v4 removeObjectForKey:@"trainErrorCode"];
  id v55 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics);
  [v55 setTranscriptionMetrics:v59];
  [v55 setEvaluationMetrics:v19];
  v56 = [v4 objectForKeyedSubscript:@"userLanguage"];

  v57 = [v56 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  objc_msgSend(v55, "setUserLocale:", +[SIUtilities convertLanguageCodeToSchemaLocale:](SIUtilities, "convertLanguageCodeToSchemaLocale:", v57));

  [v55 setModelMetrics:v34];

  return v55;
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
        int v14 = [v12 objectForKeyedSubscript:@"startTime"];
        [v14 doubleValue];
        __int16 v16 = +[NSNumber numberWithDouble:v15 * 1000000000.0];
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));

        v17 = [v12 objectForKeyedSubscript:@"endTime"];
        [v17 doubleValue];
        id v19 = +[NSNumber numberWithDouble:v18 * 1000000000.0];
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

        v20 = [v12 objectForKeyedSubscript:@"removeSpaceAfter"];
        objc_msgSend(v13, "setAppendSpaceAfter:", objc_msgSend(v20, "BOOLValue") ^ 1);

        v21 = [v12 objectForKeyedSubscript:@"silenceStartTime"];
        [v21 doubleValue];
        v23 = +[NSNumber numberWithDouble:v22 * 1000000000.0];
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));

        double v24 = [v12 objectForKeyedSubscript:@"confidence"];
        objc_msgSend(v13, "setConfidence:", objc_msgSend(v24, "intValue"));

        id v25 = objc_alloc_init((Class)ASRSchemaASRTokenTier1);
        id v26 = [v12 objectForKeyedSubscript:@"text"];
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
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v12 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRTokenInfo);
        [v32 addObject:v12];
        id v13 = objc_alloc_init((Class)ASRSchemaASRToken);
        int v14 = [v11 objectAtIndexedSubscript:1];
        [v14 doubleValue];
        __int16 v16 = +[NSNumber numberWithDouble:v15 * 1000000.0];
        objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v16, "unsignedLongLongValue"));

        v17 = [v11 objectAtIndexedSubscript:2];
        [v17 doubleValue];
        id v19 = +[NSNumber numberWithDouble:v18 * 1000000.0];
        objc_msgSend(v13, "setEndTimeInNs:", objc_msgSend(v19, "unsignedLongLongValue"));

        v20 = [v11 objectAtIndexedSubscript:3];
        [v20 doubleValue];
        double v22 = +[NSNumber numberWithDouble:v21 * 1000000.0];
        objc_msgSend(v13, "setSilenceStartTimeInNs:", objc_msgSend(v22, "unsignedLongLongValue"));

        [v12 setToken:v13];
        v23 = [v11 objectAtIndexedSubscript:5];
        [v23 floatValue];
        objc_msgSend(v12, "setAcousticCost:");

        double v24 = [v11 objectAtIndexedSubscript:6];
        [v24 floatValue];
        objc_msgSend(v12, "setSilenceAcousticCost:");

        id v25 = [v11 objectAtIndexedSubscript:7];
        [v12 setNumBackoffs:v25];

        id v26 = [v11 objectAtIndexedSubscript:8];
        [v12 setLanguageModelCosts:v26];

        id v27 = objc_alloc_init((Class)ASRSchemaASRTokenTier1);
        uint64_t v28 = [v11 objectAtIndexedSubscript:0];
        [v27 setText:v28];

        v29 = [v11 objectAtIndexedSubscript:4];
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
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRChoiceInfo);
        [v8 addObject:v14];
        double v15 = [v13 objectForKeyedSubscript:@"tokens"];
        __int16 v16 = [(FidesSelfHelper *)self _tokensFromTokensArray:v15 privateTokens:v7];
        [v14 setTokens:v16];

        v17 = [v13 objectForKeyedSubscript:@"graphCost"];
        [v17 floatValue];
        objc_msgSend(v14, "setGraphCost:");

        double v18 = [v13 objectForKeyedSubscript:@"acousticCost"];
        [v18 floatValue];
        objc_msgSend(v14, "setAcousticCost:");
      }
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v8;
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
        __int16 v16 = [v14 objectForKeyedSubscript:@"aligned"];
        [v15 setIsAligned:v16 != 0];

        v17 = [v14 objectForKeyedSubscript:@"choices"];
        double v18 = [(FidesSelfHelper *)self _choiceInfosFromChoiceInfoDicts:v17 privateTokens:v6];
        [v15 setChoices:v18];
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
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
          id v15 = [(FidesSelfHelper *)self _resultInfosFromResultInfoDict:v14 privateTokens:v25];
          [v13 setResults:v15];

          __int16 v16 = [v12 objectForKeyedSubscript:@"startMillis"];
          [v16 doubleValue];
          double v18 = +[NSNumber numberWithDouble:v17 * 1000000.0];
          objc_msgSend(v13, "setStartTimeInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

          id v19 = [v12 objectForKeyedSubscript:@"endMillis"];
          [v19 doubleValue];
          long long v21 = +[NSNumber numberWithDouble:v20 * 1000000.0];
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

- (id)_decodingMetricsFromMetricsDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRDecodingMetrics);
  long long v33 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"WallRTF"];
  [v5 floatValue];
  objc_msgSend(v4, "setWallRealTimeFactor:");

  id v6 = [v33 objectForKeyedSubscript:@"AverageActiveTokensPerFrame"];
  [v6 floatValue];
  objc_msgSend(v4, "setAverageActiveTokensPerFrame:");

  id v7 = [v33 objectForKeyedSubscript:@"jitQueryDurationInMs"];
  objc_msgSend(v4, "setJitQueryDurationInMs:", objc_msgSend(v7, "unsignedLongLongValue"));

  [v33 removeObjectForKey:@"jitQueryDurationInMs"];
  id v8 = [v33 objectForKeyedSubscript:@"jitLmeDurationInMs"];
  objc_msgSend(v4, "setJitLanguageModelEnrollmentDurationInMs:", objc_msgSend(v8, "unsignedLongLongValue"));

  [v33 removeObjectForKey:@"jitLmeDurationInMs"];
  id v9 = [v33 valueForKeyPath:@"jitDataStats.preprocessingCategoryCounts"];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_3F10;
  v42[3] = &unk_10480;
  id v10 = v4;
  id v43 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v42];

  uint64_t v11 = [v33 valueForKeyPath:@"jitDataStats.postprocessingCategoryCounts"];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_3FB0;
  v40[3] = &unk_10480;
  id v31 = v10;
  id v41 = v31;
  [v11 enumerateKeysAndObjectsUsingBlock:v40];

  [v33 removeObjectForKey:@"jitDataStats"];
  id v32 = [v33 objectForKeyedSubscript:@"lm_interp_weights"];
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
          double v17 = [v15 componentsSeparatedByString:@":"];
          double v18 = [v17 objectAtIndexedSubscript:1];
          [v18 doubleValue];
          id v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

          double v20 = [v17 objectAtIndexedSubscript:2];
          [v20 doubleValue];
          long long v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

          [v19 doubleValue];
          id v23 = +[NSNumber numberWithDouble:v22 * 1000000.0];
          objc_msgSend(v16, "setStartTimeInNs:", objc_msgSend(v23, "unsignedLongLongValue"));

          [v21 doubleValue];
          id v25 = +[NSNumber numberWithDouble:v24 * 1000000.0];
          objc_msgSend(v16, "setEndTimeInNs:", objc_msgSend(v25, "unsignedLongLongValue"));

          long long v26 = [v17 objectAtIndexedSubscript:0];
          long long v27 = [v26 componentsSeparatedByString:@","];

          long long v28 = [v27 valueForKey:@"floatValue"];
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

- (id)_decodingResultsWithAudioDict:(id)a3 privateTokensOut:(id *)a4
{
  id v5 = a3;
  id v41 = objc_alloc_init((Class)NSMutableArray);
  id v42 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [v5 objectForKeyedSubscript:@"tokens"];
  id v7 = [v5 objectForKeyedSubscript:@"metrics"];
  double v40 = v6;
  id v8 = [v6 allKeys];
  id v9 = [v5 objectForKeyedSubscript:@"uttInfos"];

  long long v36 = v5;
  if (v9)
  {
    long long v39 = [v5 objectForKeyedSubscript:@"uttInfos"];
    goto LABEL_11;
  }
  id v10 = [v5 objectForKeyedSubscript:@"uttInfosCompressed"];

  if (!v10)
  {
    long long v39 = 0;
    goto LABEL_11;
  }
  id v11 = objc_alloc((Class)NSData);
  id v12 = [v5 objectForKeyedSubscript:@"uttInfosCompressed"];
  id v13 = [v11 initWithBase64EncodedString:v12 options:0];

  id v48 = 0;
  id v14 = [v13 decompressedDataUsingAlgorithm:3 error:&v48];
  id v15 = v48;
  id v47 = 0;
  long long v39 = +[NSJSONSerialization JSONObjectWithData:v14 options:0 error:&v47];
  id v16 = v47;
  double v17 = v16;
  if (!v15)
  {
    if (!v16) {
      goto LABEL_10;
    }
    double v18 = AFSiriLogContextFides;
    if (!os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v51 = "-[FidesSelfHelper _decodingResultsWithAudioDict:privateTokensOut:]";
    id v19 = "%s Fides SELF: Utterance Info could not be deserialized - it will not be logged.";
    goto LABEL_24;
  }
  double v18 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[FidesSelfHelper _decodingResultsWithAudioDict:privateTokensOut:]";
    id v19 = "%s Fides SELF: Utterance Info could not be decompressed - it will not be logged.";
LABEL_24:
    _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
  }
LABEL_10:

LABEL_11:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v8;
  id v20 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v38 = *(void *)v44;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v44 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v24 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRDecodingResult);
        [v42 addObject:v24];
        [v24 setConfigName:v23];
        id v25 = [v7 objectForKeyedSubscript:v23];
        long long v26 = [(FidesSelfHelper *)self _decodingMetricsFromMetricsDict:v25];
        [v24 setDecodingMetrics:v26];

        long long v27 = [v40 objectForKeyedSubscript:v23];
        long long v28 = [(FidesSelfHelper *)self _tokensFromTokenDict:v27 privateTokens:v41];
        [v24 setTokens:v28];

        id v29 = [v39 objectForKeyedSubscript:v23];
        long long v30 = [(FidesSelfHelper *)self _utteranceInfosFromUtteranceInfoDict:v29 privateTokens:v41];
        [v24 setUtterances:v30];

        id v31 = [v7 objectForKeyedSubscript:@"DecodeDuration"];
        [v31 doubleValue];
        long long v33 = +[NSNumber numberWithDouble:v32 * 1000000000.0];
        objc_msgSend(v24, "setDecodeDurationInNs:", objc_msgSend(v33, "unsignedLongLongValue"));

        [v7 removeObjectForKey:@"DecodeDuration"];
      }
      id v21 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v21);
  }

  if (a4) {
    *a4 = v41;
  }

  return v42;
}

- (id)_audioFileResultsFromResultDict:(id)a3 privateAudioFileResultsOut:(id *)a4
{
  id v4 = a3;
  id v26 = objc_alloc_init((Class)NSMutableArray);
  id v27 = objc_alloc_init((Class)NSMutableArray);
  double v22 = v4;
  [v4 objectForKeyedSubscript:@"audioResults"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v28)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v7 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRAudioFileResult);
        [v27 addObject:v7];
        id v8 = objc_alloc((Class)SISchemaUUID);
        id v9 = objc_alloc((Class)NSUUID);
        id v10 = [v6 objectForKeyedSubscript:@"asrSelfComponentId"];
        id v11 = [v9 initWithUUIDString:v10];
        id v12 = [v8 initWithNSUUID:v11];

        [v6 removeObjectForKey:@"asrSelfComponentId"];
        [v7 setAsrId:v12];
        id v13 = objc_alloc((Class)SISchemaUUID);
        id v14 = +[NSUUID UUID];
        id v15 = [v13 initWithNSUUID:v14];

        [v7 setLinkId:v15];
        id v29 = 0;
        id v16 = [(FidesSelfHelper *)self _decodingResultsWithAudioDict:v6 privateTokensOut:&v29];
        id v17 = v29;
        [v7 setDecodingResults:v16];

        id v18 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRAudioFileResultTier1);
        [v26 addObject:v18];
        id v19 = objc_alloc_init((Class)ASRSchemaASRRecognitionResultTier1);
        [v19 setLinkId:v15];
        [v19 setTokens:v17];

        [v18 setRecognitionResult:v19];
      }
      id v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v28);
  }
  if (a4) {
    *a4 = v26;
  }

  return v27;
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
        id v11 = [*(id *)(*((void *)&v35 + 1) + 8 * i) objectForKeyedSubscript:@"status"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v11 isEqualToString:@"Required Personalized LM not found"])
        {

          id v12 = &off_11620;
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
  id v12 = &off_11608;
LABEL_13:

  objc_msgSend(v5, "setExperimentStatusCode:", objc_msgSend(v12, "intValue"));
  [v5 setDatapackVersion:self->_datapackVersion];
  id v13 = [v4 objectForKeyedSubscript:@"numAudio"];
  objc_msgSend(v5, "setNumAudioFilesAvailable:", objc_msgSend(v13, "unsignedIntValue"));

  id v14 = [v4 objectForKeyedSubscript:@"numSelectedAudio"];
  objc_msgSend(v5, "setNumAudioFilesSelected:", objc_msgSend(v14, "unsignedIntValue"));

  id v15 = [v4 objectForKeyedSubscript:@"textProcessingDuration"];
  [v15 doubleValue];
  id v17 = +[NSNumber numberWithDouble:v16 * 1000000000.0];
  objc_msgSend(v5, "setTextProcessingDurationInNs:", objc_msgSend(v17, "unsignedLongLongValue"));

  [v4 removeObjectForKey:@"textProcessingDuration"];
  id v18 = +[NSProcessInfo processInfo];
  objc_msgSend(v5, "setDeviceThermalState:", objc_msgSend(v18, "thermalState"));

  id v34 = 0;
  id v19 = [(FidesSelfHelper *)self _audioFileResultsFromResultDict:v4 privateAudioFileResultsOut:&v34];
  id v20 = v34;
  [v5 setAudioFileResults:v19];

  id v21 = [v4 objectForKeyedSubscript:@"personalizedLM"];
  double v22 = [(FidesSelfHelper *)self _plmMetricsFromPlmDict:v21];
  [v5 setPersonalizedLanguageModelMetrics:v22];

  id v23 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRPersonalizationExperimentContext);
  [v23 setEnded:v5];
  [(FidesSelfHelper *)self _wrapAndEmitTopLevelEvent:v23];
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
        [(FidesSelfHelper *)self _wrapAndEmitTopLevelEvent:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
      }
      id v26 = [v24 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v26);
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
  [(FidesSelfHelper *)self _wrapAndEmitTopLevelEvent:v4];
}

- (void)logUserEditExperimentEndedAndTier1WithResultsDict:(id)a3
{
  id v3 = a3;
  id v32 = objc_alloc_init((Class)NSMutableArray);
  id v31 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v29 = v3;
  id obj = [v3 objectForKeyedSubscript:@"confusionPairs"];
  id v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v7);
        id v9 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRConfusionPair);
        id v10 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRConfusionPairTier1);
        id v11 = objc_alloc((Class)SISchemaUUID);
        id v12 = objc_alloc((Class)NSUUID);
        id v13 = [v8 objectForKeyedSubscript:@"asrSelfComponentIdentifier"];
        id v14 = [v12 initWithUUIDString:v13];
        id v15 = [v11 initWithNSUUID:v14];
        [v9 setAsrId:v15];

        [v8 removeObjectForKey:@"asrSelfComponentIdentifier"];
        double v16 = [v8 objectForKeyedSubscript:@"errorCode"];
        id v17 = v16;
        if (v16) {
          objc_msgSend(v9, "setErrorCode:", objc_msgSend(v16, "intValue"));
        }
        id v18 = [v8 objectForKeyedSubscript:@"recognizedPair"];
        [v10 setRecognizedTokens:v18];

        id v19 = [v8 objectForKeyedSubscript:@"correctedPair"];
        [v10 setCorrectedTokens:v19];

        [v32 addObject:v9];
        [v31 addObject:v10];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v5);
  }

  id v20 = objc_alloc_init((Class)NSMutableArray);
  id v21 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults);
  [v21 setDatapackVersion:self->_datapackVersion];
  [v21 setConfusionPairs:v32];
  [v20 addObject:v21];
  id v22 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentEndedTier1);
  id v23 = objc_alloc((Class)SISchemaUUID);
  id v24 = +[NSUUID UUID];
  id v25 = [v23 initWithNSUUID:v24];

  [v22 setLinkId:v25];
  [v22 setConfusionPairs:v31];
  id v26 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentEnded);
  [v26 setRedecodingResults:v20];
  [v26 setLinkId:v25];
  id v27 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentContext);
  [v27 setEnded:v26];
  [(FidesSelfHelper *)self _wrapAndEmitTopLevelEvent:v27];
  [(FidesSelfHelper *)self _wrapAndEmitTopLevelEvent:v22];
}

- (void)logUserEditExperimentStartedOrChanged
{
  id v4 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentStarted);
  [v4 setExists:1];
  id v3 = objc_alloc_init((Class)DODMLASRSchemaDODMLASRUserEditExperimentContext);
  [v3 setStartedOrChanged:v4];
  [(FidesSelfHelper *)self _wrapAndEmitTopLevelEvent:v3];
}

- (FidesSelfHelper)initWithExperimentId:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FidesSelfHelper;
  uint64_t v6 = [(FidesSelfHelper *)&v15 init];
  if (v6)
  {
    uint64_t v7 = +[NSUUID UUID];
    dodmlId = v6->_dodmlId;
    v6->_dodmlId = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_experimentId, a3);
    id v9 = (void *)AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      id v10 = v6->_dodmlId;
      id v11 = v9;
      id v12 = [(NSUUID *)v10 UUIDString];
      experimentId = v6->_experimentId;
      *(_DWORD *)buf = 136315650;
      id v17 = "-[FidesSelfHelper initWithExperimentId:]";
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = experimentId;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s Fides SELF: Logging object created successfully: dodmlId=%@, experimentId=%@", buf, 0x20u);
    }
  }

  return v6;
}

@end