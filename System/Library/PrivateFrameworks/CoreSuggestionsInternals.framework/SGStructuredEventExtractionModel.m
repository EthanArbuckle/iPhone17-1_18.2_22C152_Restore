@interface SGStructuredEventExtractionModel
+ (id)inputFromTaggedCharacterRanges:(id)a3 usingInputMapping:(id)a4 forModel:(id)a5 pflTraining:(BOOL)a6 hasEvent:(BOOL)a7;
+ (id)sharedInstance;
- (BOOL)isSenderSupportedForExtraction:(id)a3;
- (BOOL)isSenderSupportedForMLDefaultExtraction:(id)a3;
- (BOOL)isSenderSupportedForMLHybridExtraction:(id)a3;
- (BOOL)isSenderSupportedForPFLTraining:(id)a3;
- (BOOL)isSenderSupportedForShadowExtraction:(id)a3;
- (id)_init;
- (id)engineConfig;
- (id)gazetteer;
- (id)inputMapping;
- (id)loadModel;
- (id)modelInferences:(id)a3;
- (id)modelInferences:(id)a3 pflTraining:(BOOL)a4 hasEvent:(BOOL)a5;
- (id)outputMapping;
- (id)supportedProviders;
- (unint64_t)addressComponentThreshold;
- (unint64_t)maxMergeDistanceForSection:(id)a3 label:(id)a4;
- (unint64_t)stripRepeatedContentForSectionLength:(id)a3 label:(id)a4;
- (void)updateAll;
@end

@implementation SGStructuredEventExtractionModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineConfig, 0);
  objc_storeStrong((id *)&self->_supportedProviders, 0);
  objc_storeStrong((id *)&self->_outputMapping, 0);
  objc_storeStrong((id *)&self->_inputMapping, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
}

- (id)gazetteer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(SGExtractionModel *)self currentModelURLForModelName:@"structuredEventGazetteer"];
  if (v2)
  {
    id v8 = 0;
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F388D0]) initWithContentsOfURL:v2 error:&v8];
    v4 = v8;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      v6 = sgEventsLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGPOSTagger: Unable to create gazetteer %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v4 = sgEventsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: Unable to get URL for Gazetteer", buf, 2u);
    }
    v3 = 0;
  }

  return v3;
}

- (unint64_t)addressComponentThreshold
{
  v2 = [(SGStructuredEventExtractionModel *)self engineConfig];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKeyedSubscript:@"addressComponentThreshold"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v5 = [v4 unsignedIntegerValue];

        goto LABEL_9;
      }
    }
  }
  v6 = sgEventsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: No configuration loaded", v8, 2u);
  }

  unint64_t v5 = 0;
LABEL_9:

  return v5;
}

- (unint64_t)stripRepeatedContentForSectionLength:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SGStructuredEventExtractionModel *)self engineConfig];
  if (v8)
  {
    v9 = (void *)[[NSString alloc] initWithFormat:@"%@.%@.%@", @"stripRepeatedContentInSections", v6, v7];
    v10 = [v8 valueForKeyPath:v9];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v11 = [v10 unsignedIntegerValue];

        goto LABEL_9;
      }
    }
  }
  v12 = sgEventsLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: No configuration loaded", buf, 2u);
  }

  unint64_t v11 = 0;
LABEL_9:

  return v11;
}

- (unint64_t)maxMergeDistanceForSection:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SGStructuredEventExtractionModel *)self engineConfig];
  if (v8)
  {
    v9 = (void *)[[NSString alloc] initWithFormat:@"%@.%@.%@", @"sectionLabelTokenMergeDistance", v6, v7];
    v10 = [v8 valueForKeyPath:v9];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v11 = [v10 unsignedIntegerValue];
LABEL_8:

        goto LABEL_13;
      }
    }
    v12 = [v8 objectForKeyedSubscript:@"defaultLabelTokenMergeDistance"];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v11 = [v12 unsignedIntegerValue];

        goto LABEL_8;
      }
    }
  }
  v13 = sgEventsLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA650000, v13, OS_LOG_TYPE_FAULT, "SGStructuredEventExtractionModel: No configuration loaded", buf, 2u);
  }

  unint64_t v11 = 0;
LABEL_13:

  return v11;
}

- (id)outputMapping
{
  v3 = +[SGStructuredEventTrialClientWrapper sharedInstance];
  v4 = [v3 structuredEventOutputMapping];

  outputMapping = v4;
  if (!v4) {
    outputMapping = self->_outputMapping;
  }
  id v6 = outputMapping;

  return v6;
}

- (id)inputMapping
{
  v3 = +[SGStructuredEventTrialClientWrapper sharedInstance];
  v4 = [v3 structuredEventInputMapping];

  inputMapping = v4;
  if (!v4) {
    inputMapping = self->_inputMapping;
  }
  id v6 = inputMapping;

  return v6;
}

- (id)engineConfig
{
  v3 = +[SGStructuredEventTrialClientWrapper sharedInstance];
  v4 = [v3 engineConfig];

  engineConfig = v4;
  if (!v4) {
    engineConfig = self->_engineConfig;
  }
  id v6 = engineConfig;

  return v6;
}

- (BOOL)isSenderSupportedForMLHybridExtraction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SGStructuredEventExtractionModel *)self supportedProviders];
  id v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  id v7 = [v5 objectForKeyedSubscript:@"mlHybridExtractionSenders"];

  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [v6 objectForKeyedSubscript:@"mlHybridExtractionSenders"];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForPFLTraining:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SGStructuredEventExtractionModel *)self supportedProviders];
  id v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  id v7 = [v5 objectForKeyedSubscript:@"schemaOrgSenders"];

  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [v6 objectForKeyedSubscript:@"schemaOrgSenders"];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForMLDefaultExtraction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SGStructuredEventExtractionModel *)self supportedProviders];
  id v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  id v7 = [v5 objectForKeyedSubscript:@"mlDefaultExtractionSenders"];

  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [v6 objectForKeyedSubscript:@"mlDefaultExtractionSenders"];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForShadowExtraction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SGStructuredEventExtractionModel *)self supportedProviders];
  id v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  id v7 = [v5 objectForKeyedSubscript:@"shadowSenders"];

  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [v6 objectForKeyedSubscript:@"shadowSenders"];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForExtraction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SGStructuredEventExtractionModel *)self supportedProviders];
  id v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  id v7 = [v5 objectForKeyedSubscript:@"extractionSenders"];

  if (!v7) {
    goto LABEL_5;
  }
  id v8 = [v6 objectForKeyedSubscript:@"extractionSenders"];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v10 = 0;

  return v10;
}

- (id)supportedProviders
{
  v3 = +[SGStructuredEventTrialClientWrapper sharedInstance];
  id v4 = [v3 supportedProviders];

  supportedProviders = v4;
  if (!v4) {
    supportedProviders = self->_supportedProviders;
  }
  id v6 = supportedProviders;

  return v6;
}

- (id)loadModel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 setComputeUnits:0];
  id v4 = +[SGStructuredEventTrialClientWrapper sharedInstance];
  unint64_t v5 = [v4 modelPath];
  id v6 = v5;
  if (v5 && [v5 length])
  {
    id v7 = sgEventsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "SGStructuredEventExtractionModel: Loading model from trial override at path: %@", buf, 0xCu);
    }

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6];
  }
  else
  {
    uint64_t v8 = [(SGExtractionModel *)self currentModelURLForModelName:@"StructuredEventModel"];
  }
  v9 = (void *)v8;
  if (v8)
  {
    id v15 = 0;
    BOOL v10 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v3 error:&v15];
    id v11 = v15;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      v13 = sgEventsLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "Unable to load model from URL: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v10 = 0;
    id v11 = 0;
  }

  return v10;
}

- (id)modelInferences:(id)a3 pflTraining:(BOOL)a4 hasEvent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_inputMapping && self->_outputMapping)
  {
    uint64_t v29 = 0;
    *(void *)buf = @"Structured Event model inference";
    uint64_t v9 = mach_absolute_time();
    uint64_t v28 = v9;
    BOOL v10 = sgEventsLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v30 = 0;
      _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "Preparing Structured Event model inference", v30, 2u);
    }

    id v11 = [(SGStructuredEventExtractionModel *)self loadModel];
    if (v11)
    {
      id v12 = [(id)objc_opt_class() inputFromTaggedCharacterRanges:v8 usingInputMapping:self->_inputMapping forModel:v11 pflTraining:v6 hasEvent:v5];
      if (v12)
      {
        id v26 = 0;
        v13 = [v11 predictionFromFeatures:v12 error:&v26];
        id v14 = v26;
        if (v13)
        {
          id v15 = [[SGExtractionModelCoreMLFeatureWrapper alloc] initWithFeatureProvider:v13];
        }
        else
        {
          uint64_t v18 = sgEventsLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v30 = 138412290;
            double v31 = *(double *)&v14;
            _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "Model inference failed: %@", v30, 0xCu);
          }

          id v15 = 0;
        }
        v19 = sgEventsLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = mach_absolute_time();
          unint64_t v25 = SGMachTimeToNanoseconds(v24 - v9);
          *(_DWORD *)v30 = 134217984;
          double v31 = (double)v25 * 0.000000001;
          _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "Model inference done in %f", v30, 0xCu);
        }

        if (v15)
        {
          uint64_t v20 = [(id)objc_opt_class() modelOutputFromOutputMapping:self->_outputMapping modelOutput:v15 modelInput:v12];
          v21 = v20;
          v22 = (void *)MEMORY[0x1E4F1CC08];
          if (v20) {
            v22 = (void *)v20;
          }
          id v17 = v22;
        }
        else
        {
          v21 = sgEventsLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "Unable to convert to instantiate SGExtractionModelCoreMLFeatureWrapper", v30, 2u);
          }
          id v17 = (id)MEMORY[0x1E4F1CC08];
        }
      }
      else
      {
        sgEventsLogHandle();
        id v15 = (SGExtractionModelCoreMLFeatureWrapper *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v30 = 0;
          _os_log_error_impl(&dword_1CA650000, &v15->super, OS_LOG_TYPE_ERROR, "Model input feature construction failed.", v30, 2u);
        }
        id v17 = (id)MEMORY[0x1E4F1CC08];
      }
    }
    else
    {
      id v12 = sgEventsLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: Model initialization failed", v30, 2u);
      }
      id v17 = (id)MEMORY[0x1E4F1CC08];
    }

    SGRecordMeasurementState(buf);
  }
  else
  {
    v16 = sgEventsLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: No input or output mapping", buf, 2u);
    }

    id v17 = (id)MEMORY[0x1E4F1CC08];
  }

  return v17;
}

- (id)modelInferences:(id)a3
{
  return [(SGStructuredEventExtractionModel *)self modelInferences:a3 pflTraining:0 hasEvent:0];
}

- (void)updateAll
{
  v3 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"StructuredEventInputMapping"];
  inputMapping = self->_inputMapping;
  self->_inputMapping = v3;

  BOOL v5 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"StructuredEventOutputMapping"];
  outputMapping = self->_outputMapping;
  self->_outputMapping = v5;

  id v7 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"SupportedProviders"];
  supportedProviders = self->_supportedProviders;
  self->_supportedProviders = v7;

  self->_engineConfig = [(id)objc_opt_class() loadLazyPlistWithBasename:@"StructuredEventEngineConfig"];
  MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)SGStructuredEventExtractionModel;
  v2 = [(SGStructuredEventExtractionModel *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(SGStructuredEventExtractionModel *)v2 updateAll];
    id v4 = +[SGAsset localeAsset];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__SGStructuredEventExtractionModel__init__block_invoke;
    v9[3] = &unk_1E65B7B78;
    BOOL v5 = v3;
    BOOL v10 = v5;
    uint64_t v6 = [v4 registerUpdateHandler:v9];
    assetUpdateToken = v5->_assetUpdateToken;
    v5->_assetUpdateToken = (_PASNotificationToken *)v6;
  }
  return v3;
}

uint64_t __41__SGStructuredEventExtractionModel__init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAll];
}

+ (id)inputFromTaggedCharacterRanges:(id)a3 usingInputMapping:(id)a4 forModel:(id)a5 pflTraining:(BOOL)a6 hasEvent:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() inputDictFromTaggedCharacterRanges:v13 usingTokenMapping:v12 forModel:v11 pflTraining:v8 hasEvent:v7];

  if (v14) {
    id v15 = [[SGExtractionModelCoreMLFeatureWrapper alloc] initWithFeatureDict:v14];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_4655 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_4655, &__block_literal_global_4656);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_4657;
  return v2;
}

void __50__SGStructuredEventExtractionModel_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = [[SGStructuredEventExtractionModel alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult_4657;
  sharedInstance__pasExprOnceResult_4657 = (uint64_t)v1;
}

@end