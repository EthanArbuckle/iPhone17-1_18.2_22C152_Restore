@interface SGMultiHeadInference
+ (id)predictForMessage:(id)a3 conversationTurns:(id)a4 localeIdentifier:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9;
+ (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 localeIdentifier:(id)a6 plistPath:(id)a7 espressoModelPath:(id)a8 vocabPath:(id)a9;
- (SGMultiHeadInference)initWithLanguage:(id)a3 inputName:(id)a4 plistPath:(id)a5 espressoModelPath:(id)a6 vocabPath:(id)a7;
- (id)_getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4;
- (id)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 heads:(id)a6;
- (id)predictForMessage:(id)a3 heads:(id)a4;
- (id)predictForVector:(id)a3 heads:(id)a4;
- (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 language:(id)a6;
@end

@implementation SGMultiHeadInference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 language:(id)a6
{
  v41[2] = *MEMORY[0x263EF8340];
  id v10 = a6;
  v41[0] = @"outputLabels";
  v41[1] = @"PREDICTION_REPLIES";
  v11 = (void *)MEMORY[0x263EFF8C0];
  id v12 = a4;
  id v13 = a3;
  v14 = [v11 arrayWithObjects:v41 count:2];
  v15 = [(SGMultiHeadInference *)self predictForMessage:v13 conversationTurns:v12 language:v10 heads:v14];

  if (v15)
  {
    v16 = [(SGQuickResponsesConfig *)self->_config modelHeads];
    v17 = [v16 objectForKeyedSubscript:@"outputLabels"];
    if (v17) {
      v18 = @"outputLabels";
    }
    else {
      v18 = @"PREDICTION_REPLIES";
    }
    v19 = v18;

    v20 = [(SGQuickResponsesConfig *)self->_config modelHeads];
    v21 = [v20 objectForKeyedSubscript:v19];
    v22 = [v21 labels];

    v23 = [v15 objectForKeyedSubscript:v19];
    uint64_t v24 = [v23 count];
    uint64_t v25 = [v22 count];

    if (v24 == v25)
    {
      v26 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"score" ascending:0];
      v27 = [v15 objectForKeyedSubscript:v19];
      v36 = v26;
      v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      v29 = [v27 sortedArrayUsingDescriptors:v28];

      v30 = objc_msgSend(v29, "subarrayWithRange:", 0, a5);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __89__SGMultiHeadInference_quickResponsesForMessage_conversationTurns_maxResponses_language___block_invoke;
      v34[3] = &unk_2647EADD8;
      id v35 = v10;
      v31 = objc_msgSend(v30, "_pas_mappedArrayWithTransform:", v34);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        v33 = [v15 objectForKeyedSubscript:v19];
        *(_DWORD *)buf = 134218240;
        uint64_t v38 = [v33 count];
        __int16 v39 = 2048;
        uint64_t v40 = [v22 count];
        _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Predicted output space does not match number of labels for output space %lu != %lu", buf, 0x16u);
      }
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

SGQuickResponse *__89__SGMultiHeadInference_quickResponsesForMessage_conversationTurns_maxResponses_language___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [SGQuickResponse alloc];
  v5 = [v3 label];

  BYTE2(v8) = 0;
  LOWORD(v8) = 0;
  v6 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:](v4, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v5, *(void *)(a1 + 32), 0, 0, 0, 0, 0, v8);

  return v6;
}

- (id)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 heads:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(SGQuickResponsesConfig *)self->_config predictionParams];
  unint64_t v13 = [v12 maxPromptLength];

  if ([v9 length] <= v13)
  {
    v15 = [(SGMultiHeadInference *)self _getMergedPromptForMessage:v9 conversationTurns:v10];
    if ([v15 length] <= v13)
    {
      v14 = [(SGMultiHeadInference *)self predictForMessage:v15 heads:v11];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        int v17 = 134217984;
        unint64_t v18 = v13;
        _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "Returning nil because merged message length exceeds maximum length %ld", (uint8_t *)&v17, 0xCu);
      }
      v14 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v17 = 134217984;
      unint64_t v18 = v13;
      _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "Returning nil because message length exceeds maximum length %ld", (uint8_t *)&v17, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (id)_getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4
{
  config = self->_config;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SGQuickResponsesConfig *)config predictionParams];
  uint64_t v9 = [v8 maxPromptLength];
  [v8 maxPromptWindowSeconds];
  double v11 = v10;
  id v12 = [v8 promptJoiningString];
  unint64_t v13 = +[SGConversationTracker getMergedPromptForMessage:v7 conversationTurns:v6 maxPromptLength:v9 maxPromptWindowSeconds:v12 promptJoiningString:v11];

  return v13;
}

- (id)predictForMessage:(id)a3 heads:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = sgLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  double v10 = sgLogHandle();
  double v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "QuickResponsesForMessageFeaturization", " enableTelemetry=YES ", buf, 2u);
  }

  id v12 = [(SGQuickResponsesTransformerInstance *)self->_transformer featurizer];
  unint64_t v13 = [(SGQuickResponsesTransformerInstance *)self->_transformer source];
  v14 = +[SGQuickResponsesModel featuresOf:v7 withFeaturizer:v12 source:v13];

  v15 = sgLogHandle();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v16, OS_SIGNPOST_INTERVAL_END, v9, "QuickResponsesForMessageFeaturization", (const char *)&unk_226E6BA6D, v21, 2u);
  }

  if (v14)
  {
    int v17 = [v14 vector];
    unint64_t v18 = [(SGMultiHeadInference *)self predictForVector:v17 heads:v6];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "Could not featurize", v20, 2u);
    }
    unint64_t v18 = 0;
  }

  return v18;
}

- (id)predictForVector:(id)a3 heads:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sgLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  double v10 = sgLogHandle();
  double v11 = v10;
  unint64_t v35 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "QuickResponsesForMessagePrediction", " enableTelemetry=YES ", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  id v38 = (id)objc_opt_new();
  context = (void *)MEMORY[0x22A66BDC0]();
  v36 = v7;
  v37 = v6;
  id v12 = [(SGMultiHeadEspressoModel *)self->_model predict:v6 heads:v7];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * v16);
        unint64_t v18 = [(SGQuickResponsesConfig *)self->_config modelHeads];
        uint64_t v19 = [v18 objectForKeyedSubscript:v17];
        v20 = [v19 labels];

        if (v20
          && (uint64_t v21 = [v20 count],
              [v12 objectForKeyedSubscript:v17],
              v22 = objc_claimAutoreleasedReturnValue(),
              uint64_t v23 = [v22 count],
              v22,
              v21 != v23))
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
          {
            v26 = NSNumber;
            v27 = [v12 objectForKeyedSubscript:v17];
            v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
            v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
            *(_DWORD *)buf = 138412802;
            uint64_t v46 = v17;
            __int16 v47 = 2112;
            v48 = v28;
            __int16 v49 = 2112;
            v50 = v29;
            _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "MultiHead output head %@ has mismatching number of scores (%@) and labels (%@)", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v24 = [v12 objectForKeyedSubscript:v17];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __47__SGMultiHeadInference_predictForVector_heads___block_invoke;
          v39[3] = &unk_2647EADB0;
          id v40 = v20;
          uint64_t v25 = objc_msgSend(v24, "_pas_mappedArrayWithIndexedTransform:", v39);
          [v38 setObject:v25 forKeyedSubscript:v17];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v14);
  }

  v30 = sgLogHandle();
  v31 = v30;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v31, OS_SIGNPOST_INTERVAL_END, spid, "QuickResponsesForMessagePrediction", (const char *)&unk_226E6BA6D, buf, 2u);
  }

  return v38;
}

SGMultiHeadPredictionItem *__47__SGMultiHeadInference_predictForVector_heads___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v7 = [SGMultiHeadPredictionItem alloc];
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    double v10 = [(SGMultiHeadPredictionItem *)v8 initWithScore:v6 label:v9];

    id v6 = (id)v9;
  }
  else
  {
    double v10 = [(SGMultiHeadPredictionItem *)v7 initWithScore:v6 label:0];
  }

  return v10;
}

- (SGMultiHeadInference)initWithLanguage:(id)a3 inputName:(id)a4 plistPath:(id)a5 espressoModelPath:(id)a6 vocabPath:(id)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = +[SGQuickResponsesConfig configWithLanguage:v12 mode:1 plistPath:v14 vocabPath:v16];
  if (v17)
  {
    id v41 = v16;
    long long v42 = self;
    id v38 = v15;
    id v39 = v13;
    id v40 = v12;
    unint64_t v18 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v19 = [v17 modelHeads];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v25 = [v17 modelHeads];
          v26 = [v25 objectForKeyedSubscript:v24];

          v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "numberOfDimensions"));
          [v18 setObject:v27 forKeyedSubscript:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v21);
    }

    id v15 = v38;
    if ([v38 hasSuffix:@".net"])
    {
      id v28 = v38;
    }
    else
    {
      id v30 = [NSString alloc];
      v31 = [v17 predictionParams];
      v32 = [v31 subModelKeyString];
      id v28 = (id)[v30 initWithFormat:@"%@:%@", v38, v32];
    }
    id v13 = v39;
    id v16 = v41;
    v33 = +[SGMultiHeadEspressoModelCached classifierWithEspressoModelFile:v28 inputName:v39 headDimensionality:v18];
    id v12 = v40;
    if (v33)
    {
      v34 = +[SGQuickResponsesModel transformerInstanceForLanguage:v40 mode:1 plistPath:v14 vocabPath:v41];
      if (v34)
      {
        v43.receiver = v42;
        v43.super_class = (Class)SGMultiHeadInference;
        unint64_t v35 = [(SGMultiHeadInference *)&v43 init];
        p_isa = (id *)&v35->super.isa;
        if (v35)
        {
          objc_storeStrong((id *)&v35->_config, v17);
          objc_storeStrong(p_isa + 4, v18);
          objc_storeStrong(p_isa + 2, v33);
          objc_storeStrong(p_isa + 3, v34);
        }
        v29 = p_isa;
        long long v42 = v29;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v50 = v40;
          __int16 v51 = 2112;
          id v52 = v14;
          _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to initialize transformer prerprocessor for language %@ and plist path %@", buf, 0x16u);
        }
        v29 = 0;
      }

      id v16 = v41;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v50 = v40;
        __int16 v51 = 2112;
        id v52 = v14;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to initialize multi head model for language %@ and plist path %@", buf, 0x16u);
      }
      v29 = 0;
    }

    self = v42;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v12;
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Config not found for language %@ and plist path %@", buf, 0x16u);
    }
    v29 = 0;
  }

  return v29;
}

+ (id)predictForMessage:(id)a3 conversationTurns:(id)a4 localeIdentifier:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (![v17 length])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v31 = 0;
    uint64_t v25 = &_os_log_internal;
    v26 = "Plist path not specified";
    v27 = (uint8_t *)&v31;
LABEL_12:
    _os_log_error_impl(&dword_226E32000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_13;
  }
  if (![v18 length])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v30 = 0;
    uint64_t v25 = &_os_log_internal;
    v26 = "Espresso model path not specified";
    v27 = (uint8_t *)&v30;
    goto LABEL_12;
  }
  if ([v14 length])
  {
    uint64_t v21 = +[SGLanguageDetection languageForLocaleIdentifier:v16];
    uint64_t v22 = [[SGMultiHeadInference alloc] initWithLanguage:v21 inputName:@"inputSequence" plistPath:v17 espressoBinPath:v18 vocabPath:v19];
    uint64_t v23 = v22;
    if (v22)
    {
      uint64_t v24 = [(SGMultiHeadInference *)v22 predictForMessage:v14 conversationTurns:v15 language:v21 heads:v20];
    }
    else
    {
      uint64_t v24 = 0;
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __int16 v29 = 0;
    uint64_t v25 = &_os_log_internal;
    v26 = "Message has no content to predict on";
    v27 = (uint8_t *)&v29;
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v24 = 0;
LABEL_16:

  return v24;
}

+ (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 localeIdentifier:(id)a6 plistPath:(id)a7 espressoModelPath:(id)a8 vocabPath:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (![v17 length])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v30 = 0;
    uint64_t v24 = &_os_log_internal;
    uint64_t v25 = "Plist path not specified";
    v26 = (uint8_t *)&v30;
LABEL_12:
    _os_log_error_impl(&dword_226E32000, v24, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_13;
  }
  if (![v18 length])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v29 = 0;
    uint64_t v24 = &_os_log_internal;
    uint64_t v25 = "Espresso model path not specified";
    v26 = (uint8_t *)&v29;
    goto LABEL_12;
  }
  if ([v14 length])
  {
    id v20 = +[SGLanguageDetection languageForLocaleIdentifier:v16];
    uint64_t v21 = [[SGMultiHeadInference alloc] initWithLanguage:v20 inputName:@"inputSequence" plistPath:v17 espressoModelPath:v18 vocabPath:v19];
    uint64_t v22 = v21;
    if (v21)
    {
      uint64_t v23 = [(SGMultiHeadInference *)v21 quickResponsesForMessage:v14 conversationTurns:v15 maxResponses:a5 language:v20];
    }
    else
    {
      uint64_t v23 = 0;
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __int16 v28 = 0;
    uint64_t v24 = &_os_log_internal;
    uint64_t v25 = "Message has no content to predict on";
    v26 = (uint8_t *)&v28;
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v23 = 0;
LABEL_16:

  return v23;
}

@end