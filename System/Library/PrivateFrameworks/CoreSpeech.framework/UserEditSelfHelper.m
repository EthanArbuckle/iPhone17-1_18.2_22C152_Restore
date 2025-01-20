@interface UserEditSelfHelper
- (UserEditSelfHelper)initWithAsrId:(id)a3;
- (void)_wrapAndEmitTopLevelEvent:(id)a3;
- (void)logEditMetricEndedAndTier1WithMetric:(id)a3;
- (void)logEditMetricsStartedOrChanged;
- (void)logEditTextEndedAndTier1WithText:(id)a3;
@end

@implementation UserEditSelfHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomAsrId, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)_wrapAndEmitTopLevelEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ASRSchemaASRClientEventMetadata);
  id v6 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:self->_randomAsrId];
  [v5 setAsrId:v6];

  id v7 = objc_alloc_init((Class)ASRSchemaASRClientEvent);
  [v7 setEventMetadata:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setManualEditTextClassified:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 setManualEditMetricClassified:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v7 setManualEditClassificationContext:v4];
      }
    }
  }
  v8 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    int v15 = 136315394;
    v16 = "-[UserEditSelfHelper _wrapAndEmitTopLevelEvent:]";
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s SELF: Wrapping and logging an event of type %@", (uint8_t *)&v15, 0x16u);
  }
  v12 = +[AssistantSiriAnalytics sharedAnalytics];
  v13 = [v12 defaultMessageStream];
  v14 = +[NSUUID UUID];
  [v13 emitMessage:v7 isolatedStreamUUID:v14];
}

- (void)logEditTextEndedAndTier1WithText:(id)a3
{
  id v4 = a3;
  if (DiagnosticLogSubmissionEnabled())
  {
    v21 = self;
    v22 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"confusionPairs"];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v12 = [v11 objectForKeyedSubscript:@"correctedTokens"];
          v13 = [v11 objectForKeyedSubscript:@"recognizedTokens"];
          if ([v13 count] || objc_msgSend(v12, "count"))
          {
            id v14 = objc_alloc_init((Class)ASRSchemaASRConfusionPairToken);
            [v14 setCorrectedTokens:v12];
            [v14 setRecognizedTokens:v13];
            int v15 = [v11 objectForKeyedSubscript:@"index"];
            objc_msgSend(v14, "setRecognizedTokensStartIndex:", objc_msgSend(v15, "intValue"));

            [v6 addObject:v14];
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    id v4 = v22;
    if ([v6 count])
    {
      id v16 = objc_alloc_init((Class)ASRSchemaASRManualEditTextClassified);
      [v16 setManualEdits:v6];
      __int16 v17 = [v22 objectForKeyedSubscript:@"correctedText"];
      [v16 setFullCorrectedText:v17];

      id v18 = objc_alloc((Class)SISchemaUUID);
      id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:v21->_asrId];
      id v20 = [v18 initWithNSUUID:v19];
      [v16 setOriginalAsrId:v20];

      [(UserEditSelfHelper *)v21 _wrapAndEmitTopLevelEvent:v16];
    }
  }
}

- (void)logEditMetricEndedAndTier1WithMetric:(id)a3
{
  id v18 = a3;
  id v4 = [v18 objectForKeyedSubscript:@"confusionPairs"];
  id v5 = [v18 objectForKeyedSubscript:@"errorCode"];
  id v6 = objc_alloc_init((Class)ASRSchemaASRManualEditClassificationContext);
  id v7 = objc_alloc((Class)SISchemaUUID);
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_asrId];
  id v9 = [v7 initWithNSUUID:v8];
  [v6 setOriginalAsrId:v9];

  if ([v4 count])
  {
    id v10 = objc_alloc_init((Class)ASRSchemaASRManualEditClassificationEnded);
    [v10 setExists:1];
    [v6 setEnded:v10];
    id v11 = objc_alloc_init((Class)ASRSchemaASRManualEditMetricClassified);
    id v12 = objc_alloc((Class)SISchemaUUID);
    id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_asrId];
    id v14 = [v12 initWithNSUUID:v13];
    [v11 setOriginalAsrId:v14];

    int v15 = [v18 objectForKeyedSubscript:@"numDeletion"];
    objc_msgSend(v11, "setNumDeletions:", objc_msgSend(v15, "intValue"));

    id v16 = [v18 objectForKeyedSubscript:@"numInsertion"];
    objc_msgSend(v11, "setNumInsertions:", objc_msgSend(v16, "intValue"));

    __int16 v17 = [v18 objectForKeyedSubscript:@"numSubstitution"];
    objc_msgSend(v11, "setNumSubstitutions:", objc_msgSend(v17, "intValue"));

    [(UserEditSelfHelper *)self _wrapAndEmitTopLevelEvent:v11];
  }
  else
  {
    id v10 = objc_alloc_init((Class)ASRSchemaASRManualEditClassificationFailed);
    [v10 setExists:1];
    objc_msgSend(v10, "setErrorCode:", objc_msgSend(v5, "intValue"));
    [v6 setFailed:v10];
  }

  [(UserEditSelfHelper *)self _wrapAndEmitTopLevelEvent:v6];
}

- (void)logEditMetricsStartedOrChanged
{
  id v7 = objc_alloc_init((Class)ASRSchemaASRManualEditClassificationStarted);
  [v7 setExists:1];
  id v3 = objc_alloc_init((Class)ASRSchemaASRManualEditClassificationContext);
  [v3 setStartedOrChanged:v7];
  id v4 = objc_alloc((Class)SISchemaUUID);
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_asrId];
  id v6 = [v4 initWithNSUUID:v5];
  [v3 setOriginalAsrId:v6];

  [(UserEditSelfHelper *)self _wrapAndEmitTopLevelEvent:v3];
}

- (UserEditSelfHelper)initWithAsrId:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UserEditSelfHelper;
  id v6 = [(UserEditSelfHelper *)&v11 init];
  if (v6)
  {
    if (![v5 length])
    {
      id v9 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_asrId, a3);
    uint64_t v7 = +[NSUUID UUID];
    randomAsrId = v6->_randomAsrId;
    v6->_randomAsrId = (NSUUID *)v7;
  }
  id v9 = v6;
LABEL_6:

  return v9;
}

@end