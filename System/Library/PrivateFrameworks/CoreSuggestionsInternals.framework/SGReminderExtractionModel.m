@interface SGReminderExtractionModel
+ (id)enrichTaggedCharacterRangesWithModelOutput:(id)a3 usingInputCharacterRanges:(id)a4;
+ (id)inputFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5;
+ (id)sharedInstance;
- (BOOL)hasWhitelistedVerbInContent:(id)a3;
- (_NSRange)_whitelistedVerbRangeInContent:(id)a3;
- (id)_init;
- (id)enrichments;
- (id)inputTokenMapping;
- (id)loadModel;
- (id)modelDescription;
- (id)modelInferences:(id)a3;
- (id)outputConfig;
- (id)reminderOverrides;
- (id)whitelistedRangesInContent:(id)a3;
- (id)whitelistedVerbInContent:(id)a3;
- (void)dealloc;
- (void)setReminderOverridesForTesting:(id)a3;
- (void)updateAll;
@end

@implementation SGReminderExtractionModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_reminderOverrides, 0);
  objc_storeStrong((id *)&self->_outputConfig, 0);
  objc_storeStrong((id *)&self->_inputTokenMapping, 0);
  objc_storeStrong((id *)&self->_enrichments, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
}

- (void)setReminderOverridesForTesting:(id)a3
{
}

- (id)modelDescription
{
  v2 = [(SGReminderExtractionModel *)self loadModel];
  v3 = [v2 modelDescription];
  v4 = [v3 metadata];

  if (v4)
  {
    v5 = [v2 modelDescription];
    v6 = [v5 metadata];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1E8A0]];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)whitelistedRangesInContent:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__13492;
  v24 = __Block_byref_object_dispose__13493;
  id v25 = 0;
  id v25 = (id)objc_opt_new();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13492;
  v18 = __Block_byref_object_dispose__13493;
  id v19 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke;
  v13[3] = &unk_1E65B7BD0;
  v13[4] = &v14;
  [(_PASLock *)lock runWithLockAcquired:v13];
  id v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (v6 && [v4 length])
  {
    uint64_t v7 = [v4 length];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke_2;
    v10[3] = &unk_1E65B8998;
    id v11 = v4;
    v12 = &v20;
    objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, 0, v7, v10);
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v8;
}

void __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke_2(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = a2;
    unint64_t v4 = [v3 range];
    uint64_t v5 = 50;
    if (v4 > 0x32) {
      uint64_t v5 = v4;
    }
    uint64_t v6 = v5 - 50;
    unint64_t v7 = [*(id *)(v2 + 32) length];
    uint64_t v8 = [v3 range];
    uint64_t v10 = v9;

    unint64_t v11 = v10 + v8 + 50;
    if (v7 < v11) {
      unint64_t v11 = v7;
    }
    v12 = *(void **)(*(void *)(*(void *)(v2 + 40) + 8) + 40);
    return objc_msgSend(v12, "addIndexesInRange:", v6, v11 - v6);
  }
  return result;
}

- (_NSRange)_whitelistedVerbRangeInContent:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__13492;
  v17 = __Block_byref_object_dispose__13493;
  id v18 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__SGReminderExtractionModel__whitelistedVerbRangeInContent___block_invoke;
  v12[3] = &unk_1E65B7BD0;
  v12[4] = &v13;
  [(_PASLock *)lock runWithLockAcquired:v12];
  id v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  if (v6)
  {
    uint64_t v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    NSUInteger v9 = v8;
  }
  else
  {
    NSUInteger v9 = 0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

void __60__SGReminderExtractionModel__whitelistedVerbRangeInContent___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)whitelistedVerbInContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SGReminderExtractionModel *)self _whitelistedVerbRangeInContent:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL && v6 == 0)
  {
    NSUInteger v9 = 0;
  }
  else
  {
    NSUInteger v8 = objc_msgSend(v4, "substringWithRange:", v5, v6);
    NSUInteger v9 = [v8 lowercaseString];
  }
  return v9;
}

- (BOOL)hasWhitelistedVerbInContent:(id)a3
{
  return [(SGReminderExtractionModel *)self _whitelistedVerbRangeInContent:a3] != 0x7FFFFFFFFFFFFFFFLL
      || v3 != 0;
}

- (id)outputConfig
{
  uint64_t v3 = +[SGReminderTrialClientWrapper sharedInstance];
  id v4 = [v3 reminderOutputMapping];

  outputConfig = v4;
  if (!v4) {
    outputConfig = self->_outputConfig;
  }
  uint64_t v6 = outputConfig;

  return v6;
}

- (id)inputTokenMapping
{
  uint64_t v3 = +[SGReminderTrialClientWrapper sharedInstance];
  id v4 = [v3 reminderInputMapping];

  inputTokenMapping = v4;
  if (!v4) {
    inputTokenMapping = self->_inputTokenMapping;
  }
  uint64_t v6 = inputTokenMapping;

  return v6;
}

- (id)reminderOverrides
{
  uint64_t v3 = +[SGReminderTrialClientWrapper sharedInstance];
  id v4 = [v3 reminderOverrides];

  reminderOverrides = v4;
  if (!v4) {
    reminderOverrides = self->_reminderOverrides;
  }
  uint64_t v6 = reminderOverrides;

  return v6;
}

- (id)enrichments
{
  uint64_t v3 = +[SGReminderTrialClientWrapper sharedInstance];
  id v4 = [v3 reminderEnrichments];

  enrichments = v4;
  if (!v4) {
    enrichments = self->_enrichments;
  }
  uint64_t v6 = enrichments;

  return v6;
}

- (id)modelInferences:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (!self->_inputTokenMapping)
  {
    v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "No inputTokenMapping found", v27, 2u);
    }
    goto LABEL_14;
  }
  if (!self->_outputConfig)
  {
    v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "No output configuration found.", v27, 2u);
    }
LABEL_14:

    id v13 = v5;
    goto LABEL_37;
  }
  uint64_t v29 = 0;
  *(void *)v27 = @"ReminderDissector model inference";
  uint64_t v6 = mach_absolute_time();
  uint64_t v28 = v6;
  uint64_t v7 = sgRemindersLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "Preparing model inference", buf, 2u);
  }

  NSUInteger v8 = [(SGReminderExtractionModel *)self loadModel];
  if (v8)
  {
    NSUInteger v9 = [(id)objc_opt_class() inputFromTaggedCharacterRanges:v4 usingTokenMapping:self->_inputTokenMapping forModel:v8];
    if (v9)
    {
      id v26 = 0;
      NSUInteger v10 = [v8 predictionFromFeatures:v9 error:&v26];
      id v25 = v26;
      if (v10)
      {
        NSUInteger v11 = [[SGExtractionModelCoreMLFeatureWrapper alloc] initWithFeatureProvider:v10];
      }
      else
      {
        uint64_t v16 = sgRemindersLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v31 = *(double *)&v25;
          _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "Model inference failed: %@", buf, 0xCu);
        }

        NSUInteger v11 = 0;
      }
      v17 = sgRemindersLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = mach_absolute_time();
        unint64_t v24 = SGMachTimeToNanoseconds(v23 - v6);
        *(_DWORD *)buf = 134217984;
        double v31 = (double)v24 * 0.000000001;
        _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "Model inference done in %f", buf, 0xCu);
      }

      if (v11)
      {
        uint64_t v18 = [(id)objc_opt_class() modelOutputFromOutputMapping:self->_outputConfig modelOutput:v11 modelInput:v9];
        id v19 = (void *)v18;
        if (v18) {
          uint64_t v20 = (void *)v18;
        }
        else {
          uint64_t v20 = v5;
        }
        id v13 = v20;
      }
      else
      {
        v21 = sgRemindersLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "Unable to convert to instantiate SGExtractionModelCoreMLFeatureWrapper", buf, 2u);
        }

        id v13 = v5;
      }
    }
    else
    {
      uint64_t v15 = sgRemindersLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "Unable to load model features.", buf, 2u);
      }

      id v13 = v5;
    }
  }
  else
  {
    uint64_t v14 = sgRemindersLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "Model initialization failed", buf, 2u);
    }

    id v13 = v5;
  }

  SGRecordMeasurementState(v27);
LABEL_37:

  return v13;
}

- (id)loadModel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  [v3 setComputeUnits:0];
  id v4 = +[SGReminderTrialClientWrapper sharedInstance];
  uint64_t v5 = [v4 modelPath];
  uint64_t v6 = v5;
  if (v5 && [v5 length])
  {
    uint64_t v7 = sgRemindersLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "SGReminderExtractionModel: Loading model from trial override at path: %@", buf, 0xCu);
    }

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6];
  }
  else
  {
    uint64_t v8 = [(SGExtractionModel *)self currentModelURLForModelName:@"ReminderModel"];
  }
  NSUInteger v9 = (void *)v8;
  if (v8)
  {
    id v15 = 0;
    NSUInteger v10 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v3 error:&v15];
    id v11 = v15;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v13 = sgRemindersLogHandle();
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
    NSUInteger v10 = 0;
    id v11 = 0;
  }

  return v10;
}

- (void)updateAll
{
  uint64_t v3 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"ReminderPreprocessor"];
  enrichments = self->_enrichments;
  self->_enrichments = v3;

  uint64_t v5 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"ReminderInputMapping"];
  inputTokenMapping = self->_inputTokenMapping;
  self->_inputTokenMapping = v5;

  uint64_t v7 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"ReminderOutputMapping"];
  outputConfig = self->_outputConfig;
  self->_outputConfig = v7;

  NSUInteger v9 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"ReminderOverrides"];
  reminderOverrides = self->_reminderOverrides;
  self->_reminderOverrides = v9;

  id v11 = self->_enrichments;
  if (v11)
  {
    id v12 = [(NSDictionary *)v11 objectForKeyedSubscript:@"config"];

    if (v12)
    {
      id v13 = [(NSDictionary *)self->_enrichments objectForKeyedSubscript:@"config"];
      id v12 = [v13 objectForKeyedSubscript:@"wordBoundary"];
    }
    lock = self->_lock;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__SGReminderExtractionModel_updateAll__block_invoke;
    v16[3] = &unk_1E65B7BA0;
    v16[4] = self;
    id v17 = v12;
    id v15 = v12;
    [(_PASLock *)lock runWithLockAcquired:v16];
  }
}

void __38__SGReminderExtractionModel_updateAll__block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v9 = a2;
  uint64_t v3 = (void *)MEMORY[0x1CB79B230]();
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"verbsMapping"];
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  uint64_t v7 = +[SGReminderMessage regexFromJoinedArray:v6 wordBoundary:*(void *)(a1 + 40)];
  uint64_t v8 = (void *)v9[1];
  v9[1] = v7;
}

- (void)dealloc
{
  uint64_t v3 = +[SGAsset localeAsset];
  [v3 deregisterUpdateHandlerWithToken:self->_assetUpdateToken];

  v4.receiver = self;
  v4.super_class = (Class)SGReminderExtractionModel;
  [(SGReminderExtractionModel *)&v4 dealloc];
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)SGReminderExtractionModel;
  uint64_t v2 = [(SGReminderExtractionModel *)&v15 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    objc_super v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    [(SGReminderExtractionModel *)v2 updateAll];
    uint64_t v7 = +[SGAsset localeAsset];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__SGReminderExtractionModel__init__block_invoke;
    v13[3] = &unk_1E65B7B78;
    uint64_t v8 = v2;
    uint64_t v14 = v8;
    uint64_t v9 = [v7 registerUpdateHandler:v13];
    assetUpdateToken = v8->_assetUpdateToken;
    v8->_assetUpdateToken = (_PASNotificationToken *)v9;
  }
  v12.receiver = v2;
  v12.super_class = (Class)SGReminderExtractionModel;
  return [(SGReminderExtractionModel *)&v12 init];
}

uint64_t __34__SGReminderExtractionModel__init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAll];
}

+ (id)enrichTaggedCharacterRangesWithModelOutput:(id)a3 usingInputCharacterRanges:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v31 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  uint64_t v8 = off_1E65B4000;
  uint64_t v9 = v6;
  uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        id v11 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        if ([v11 count])
        {
          unint64_t v12 = 0;
          do
          {
            if ([v7 count] <= v12)
            {
              id v13 = objc_opt_new();
              [v7 addObject:v13];
            }
            uint64_t v14 = [v11 objectAtIndexedSubscript:v12];
            char v15 = [v14 isEqualToString:@"NONE"];

            if ((v15 & 1) == 0)
            {
              uint64_t v16 = [v7 objectAtIndexedSubscript:v12];
              id v17 = [NSString alloc];
              uint64_t v18 = +[SGTaggedCharacterRange annotationTypeUniqueIdentifier:10];
              id v19 = [v11 objectAtIndexedSubscript:v12];
              uint64_t v20 = (void *)[v17 initWithFormat:@"%@_%@", v18, v19];
              [v16 addObject:v20];

              uint64_t v8 = off_1E65B4000;
              id v6 = v9;
            }
            ++v12;
          }
          while ([v11 count] > v12);
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v36);
  }

  if ([v7 count])
  {
    unint64_t v21 = 0;
    do
    {
      id v32 = objc_alloc(v8[305]);
      v37 = [v6 objectAtIndexedSubscript:v21];
      v35 = [v37 tags];
      v33 = [v7 objectAtIndexedSubscript:v21];
      uint64_t v22 = [v35 arrayByAddingObjectsFromArray:v33];
      uint64_t v23 = [v6 objectAtIndexedSubscript:v21];
      uint64_t v24 = [v23 range];
      uint64_t v26 = v25;
      v27 = [v9 objectAtIndexedSubscript:v21];
      uint64_t v28 = [v27 text];
      uint64_t v29 = objc_msgSend(v32, "initWithAnnotationType:tags:range:text:", 4, v22, v24, v26, v28);
      [v31 addObject:v29];

      uint64_t v8 = off_1E65B4000;
      id v6 = v9;

      ++v21;
    }
    while ([v7 count] > v21);
  }

  return v31;
}

+ (id)inputFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  NSUInteger v10 = [(id)objc_opt_class() inputDictFromTaggedCharacterRanges:v9 usingTokenMapping:v8 forModel:v7];

  if (v10) {
    id v11 = [[SGExtractionModelCoreMLFeatureWrapper alloc] initWithFeatureDict:v10];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_13558 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_13558, &__block_literal_global_13559);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_13560;
  return v2;
}

void __43__SGReminderExtractionModel_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = [[SGReminderExtractionModel alloc] _init];
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_13560;
  sharedInstance__pasExprOnceResult_13560 = (uint64_t)v1;
}

@end