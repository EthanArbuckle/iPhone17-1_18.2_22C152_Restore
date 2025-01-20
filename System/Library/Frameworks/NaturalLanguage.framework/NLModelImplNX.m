@interface NLModelImplNX
- (NLModelImplNX)initWithModelContainer:(void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9;
- (NLModelImplNX)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplNX)initWithModelTrainer:(id)a3 error:(id *)a4;
- (id)configuration;
- (id)labelMap;
- (id)modelData;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelHypothesesDictionaryForString:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelsDictionaryForString:(id)a3;
- (id)predictedLabelsForTokens:(id)a3;
- (id)trainingInfo;
- (unint64_t)numberOfTrainingInstances;
- (unint64_t)systemVersion;
- (void)dealloc;
@end

@implementation NLModelImplNX

- (NLModelImplNX)initWithModelContainer:(void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a9;
  uint64_t v15 = NLModelCreateWithContainer();
  v16 = stringForKey(v14, 0x1EFB30610, 0);
  v17 = stringForKeyWithDefault(v14, @"TrainingEmbeddingType", 0);
  v18 = stringForKeyWithDefault(v14, @"EmbeddingModelIdentifier", 0);
  unint64_t v19 = unsignedIntegerForKey(v14, 0x1EFB30650, 0);

  if (v15)
  {
    v26.receiver = self;
    v26.super_class = (Class)NLModelImplNX;
    v20 = [(NLModelImplNX *)&v26 init];
    self = v20;
    if (v20)
    {
      v20->_nlModel = (void *)v15;
      v20->_modelContainer = (void *)CFRetain(a3);
      v21 = (NLModelConfiguration *)[v12 copy];
      configuration = self->_configuration;
      self->_configuration = v21;

      v23 = (NSDictionary *)[v13 copy];
      labelMap = self->_labelMap;
      self->_labelMap = v23;

      self->_numberOfTrainingInstances = v19;
      objc_storeStrong((id *)&self->_trainingLanguage, v16);
      objc_storeStrong((id *)&self->_trainingEmbeddingType, v17);
      objc_storeStrong((id *)&self->_embeddingModelIdentifier, v18);
    }
  }

  return self;
}

- (NLModelImplNX)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  unint64_t v19 = stringForKeyWithDefault(v18, @"TrainingEmbeddingType", 0);
  v20 = stringForKeyWithDefault(v18, @"EmbeddingModelIdentifier", 0);
  v21 = stringForKey(v18, 0x1EFB30610, 0);
  if ([v19 isEqualToString:@"Contextual"])
  {
    if (v20)
    {
      v22 = +[NLContextualEmbedding contextualEmbeddingWithIdentifier:v20];
      if (!v22)
      {
        NSLog(&cfstr_FailedToLoadCo_0.isa, v20);
LABEL_16:
        if (a10)
        {
          v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v40 = *MEMORY[0x1E4F28568];
          v41[0] = @"Failed to load model file, could not find contextual embedding";
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
          *a10 = [v31 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v32];
        }
        v28 = 0;
        v23 = v15;
LABEL_19:
        v27 = self;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v21) {
        goto LABEL_16;
      }
      v22 = +[NLContextualEmbedding contextualEmbeddingWithLanguage:v21];
      if (!v22)
      {
        NSLog(&cfstr_FailedToLoadCo_1.isa, v21);
        goto LABEL_16;
      }
    }
    if (([v22 hasAvailableAssets] & 1) == 0)
    {
      NSLog(&cfstr_AssetsNotAvail.isa, v22);
      requestContextualEmbeddingAssetsForEmbedding(v22);
    }
  }
  v23 = v15;
  uint64_t v24 = NLModelContainerCreateWithContainerData();
  if (!v24)
  {
    if (a10)
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v39 = @"Failed to load model file, invalid Transfer model data";
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      *a10 = [v29 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v30];
    }
    v28 = 0;
    goto LABEL_19;
  }
  v25 = (const void *)v24;
  objc_super v26 = [(NLModelImplNX *)self initWithModelContainer:v24 configuration:v37 labelMap:v36 vocabularyMap:v35 documentFrequencyMap:v16 customEmbeddingData:v17 trainingInfo:v18];
  CFRelease(v25);
  v27 = v26;
  v28 = v27;
LABEL_20:

  return v28;
}

- (NLModelImplNX)initWithModelTrainer:(id)a3 error:(id *)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  v65 = [v68 configuration];
  v64 = [v65 language];
  v4 = [v65 options];
  v63 = stringForKeyWithDefault(v4, @"EmbeddingType", @"Dynamic");

  v66 = [v68 dataSet];
  long long v89 = xmmword_1A646D4D0;
  int64x2_t v90 = vdupq_n_s64(0x400uLL);
  long long v91 = xmmword_1A646D8C0;
  v67 = +[NLDataSet dataSetWithDataSet:v66 constraintParameters:&v89 modelTrainer:v68];
  v59 = [v67 inverseLabelMap];
  uint64_t v53 = [v66 numberOfTrainingInstances];
  v5 = [v68 options];
  uint64_t v58 = unsignedIntegerForKey(v5, @"MaximumIterations", 25);

  if (initWithModelTrainer_error__onceToken_0 != -1) {
    dispatch_once(&initWithModelTrainer_error__onceToken_0, &__block_literal_global_6);
  }
  if (!v64)
  {
    v6 = [v66 dataProviderOfType:0];
    v64 = [v6 recognizedLanguage];
  }
  if ([v67 numberOfTrainingInstances])
  {
    id v57 = v68;
    id v62 = v64;
    id v61 = v63;
    v7 = (void *)MEMORY[0x1E4F1CA60];
    v8 = [NSNumber numberWithInteger:9];
    v9 = [v7 dictionaryWithObject:v8 forKey:*MEMORY[0x1E4F5C850]];

    v10 = [NSNumber numberWithInteger:v58];
    [v9 setObject:v10 forKey:*MEMORY[0x1E4F5C848]];

    if (v62)
    {
      [v9 setObject:v62 forKey:*MEMORY[0x1E4F5C840]];
      if ([v61 isEqualToString:@"Contextual"])
      {
        v11 = +[NLContextualEmbedding contextualEmbeddingWithLanguage:v62];
        if ([v11 hasAvailableAssets])
        {
          id v12 = [v11 assetLocaleIdentifier];
        }
        else
        {
          id v12 = 0;
        }
        id v15 = [v11 identifier];
        if (v11 && ([v11 hasAvailableAssets] & 1) == 0) {
          requestContextualEmbeddingAssetsForEmbedding(v11);
        }

        if (v12)
        {
          [v9 setObject:*MEMORY[0x1E4F5C838] forKey:*MEMORY[0x1E4F5C830]];
          [v9 setObject:v12 forKey:*MEMORY[0x1E4F5C858]];
          id v16 = v15;

          goto LABEL_23;
        }
        goto LABEL_24;
      }
    }
    else if ([v61 isEqualToString:@"Contextual"])
    {
      id v15 = 0;
LABEL_24:
      unint64_t v19 = [NSString stringWithFormat:@"Failed to load contextual embedding for language %@", v62];
      NSLog(&stru_1EFB32910.isa, v19);
      [v57 logMessage:v19];
      if (a4)
      {
        v20 = (void *)MEMORY[0x1E4F28C58];
        v88[0] = *MEMORY[0x1E4F28568];
        *(void *)&long long v89 = v19;
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:v88 count:1];
        *a4 = [v20 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v21];
      }
      goto LABEL_27;
    }
    if ([v61 isEqualToString:@"Dynamic"])
    {
      [v9 setObject:*MEMORY[0x1E4F5C828] forKey:*MEMORY[0x1E4F5C830]];
      id v16 = 0;
LABEL_23:
      id v55 = v9;
      goto LABEL_28;
    }
    NSLog(&stru_1EFB32910.isa, @"Unsupported embedding type");
    [v57 logMessage:@"Unsupported embedding type"];
    if (a4)
    {
      id v17 = (void *)MEMORY[0x1E4F28C58];
      v88[0] = *MEMORY[0x1E4F28568];
      *(void *)&long long v89 = @"Unsupported embedding type";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:v88 count:1];
      *a4 = [v17 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v18];
    }
LABEL_27:
    id v16 = 0;
    id v55 = 0;
LABEL_28:

    id v54 = v16;
    v22 = v55;
    if (!v55)
    {
      id v14 = 0;
      goto LABEL_53;
    }
    CFTypeRef cf = (CFTypeRef)NLModelTrainerCreate();
    if (!cf)
    {
      id v14 = 0;
      v22 = v55;
      goto LABEL_53;
    }
    v23 = [NLDataEnumerator alloc];
    uint64_t v24 = [v67 dataProviderOfType:0];
    v51 = [(NLDataEnumerator *)v23 initWithDataProvider:v24];

    *(void *)&long long v89 = 0;
    *((void *)&v89 + 1) = &v89;
    int64x2_t v90 = (int64x2_t)0x2020000000uLL;
    v90.i64[1] = CFAbsoluteTimeGetCurrent();
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v88[3] = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x2020000000;
    v77[3] = 0;
    v76[0] = 0;
    v76[1] = v76;
    v76[2] = 0x2020000000;
    v76[3] = 0;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x2020000000;
    v75[3] = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2020000000;
    char v74 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    char v72 = 0;
    if ([v67 numberOfValidationInstances])
    {
      v25 = [NLDataEnumerator alloc];
      objc_super v26 = [v67 dataProviderOfType:1];
      v50 = [(NLDataEnumerator *)v25 initWithDataProvider:v26];
    }
    else
    {
      v50 = 0;
    }
    v27 = (void *)MEMORY[0x1AD0BB930]();
    v28 = NLGetLogCategory(0);
    v29 = [v28 internal];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v83 = 0;
      _os_log_impl(&dword_1A6419000, v29, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    for (unint64_t i = 0; i < [&unk_1EFB3AA90 count]; ++i)
    {
      v31 = (void *)MEMORY[0x1AD0BB930]();
      v32 = NLGetLogCategory(0);
      v33 = [v32 internal];

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = [&unk_1EFB3AA90 objectAtIndexedSubscript:i];
        uint64_t v35 = [v34 UTF8String];
        *(_DWORD *)buf = 134218498;
        uint64_t v83 = 1;
        __int16 v84 = 2048;
        unint64_t v85 = i;
        __int16 v86 = 2082;
        uint64_t v87 = v35;
        _os_log_impl(&dword_1A6419000, v33, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);
      }
    }
    id v36 = v57;
    id v37 = (const void *)NLModelTrainerTrainAndCopyContainer();
    uint64_t v38 = (void *)MEMORY[0x1AD0BB930]();
    v39 = NLGetLogCategory(0);
    uint64_t v40 = [v39 internal];

    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v83 = 3;
      _os_log_impl(&dword_1A6419000, v40, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    if (v37)
    {
      v41 = [NSString stringWithFormat:@"Finished transfer training in %.2f seconds", CFAbsoluteTimeGetCurrent() - *(double *)(*((void *)&v89 + 1) + 24)];
      [v36 logMessage:v41];
    }
    else if (*((unsigned char *)v70 + 24))
    {
      v41 = [NSString stringWithFormat:@"Failed to load dynamic embedding for language %@", v62];
      NSLog(&stru_1EFB32910.isa, v41);
      [v36 logMessage:v41];
      if (a4)
      {
        v47 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        v81 = v41;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        *a4 = [v47 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v48];
      }
    }
    else
    {
      NSLog(&stru_1EFB32910.isa, @"Transfer training failed");
      [v36 logMessage:@"Transfer training failed"];
      if (!a4) {
        goto LABEL_47;
      }
      v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      v79 = @"Transfer training failed";
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      *a4 = [v49 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:9 userInfo:v41];
    }

LABEL_47:
    CFRelease(cf);

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(v73, 8);
    _Block_object_dispose(v75, 8);
    _Block_object_dispose(v76, 8);
    _Block_object_dispose(v77, 8);
    _Block_object_dispose(v88, 8);
    _Block_object_dispose(&v89, 8);

    if (!v37)
    {
      id v14 = 0;
      goto LABEL_54;
    }
    v42 = (void *)MEMORY[0x1E4F1CA60];
    v43 = [NSNumber numberWithUnsignedInteger:v53];
    v44 = objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v43, 0x1EFB30650, v61, 0x1EFB30690, 0);

    if (v62) {
      [v44 setObject:v62 forKey:0x1EFB30610];
    }
    if (v54) {
      [v44 setObject:v54 forKey:0x1EFB306B0];
    }
    v45 = [(NLModelImplNX *)self initWithModelContainer:v37 configuration:v65 labelMap:v59 vocabularyMap:0 documentFrequencyMap:0 customEmbeddingData:0 trainingInfo:v44];
    CFRelease(v37);
    id v14 = v45;
    self = v14;
    v22 = v44;
LABEL_53:

LABEL_54:
    id v13 = v54;
    goto LABEL_55;
  }
  id v13 = 0;
  id v14 = 0;
LABEL_55:

  return v14;
}

uint64_t __44__NLModelImplNX_initWithModelTrainer_error___block_invoke()
{
  initWithModelTrainer_error__whitespaceAndNewlineCharacterSet_0 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];

  return MEMORY[0x1F41817F8]();
}

void __44__NLModelImplNX_initWithModelTrainer_error___block_invoke_25(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 hasPrefix:@"Average Tag Accuracy"])
  {
    uint64_t v6 = [v5 rangeOfString:@"="];
    uint64_t v8 = v7;
    unint64_t v9 = [v5 rangeOfString:@","];
    if (v8 && v10 && v9 > v6 + v8)
    {
      v11 = objc_msgSend(v5, "substringWithRange:", v6 + v8, v9 - (v6 + v8));
      [v11 doubleValue];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
    }
    id v13 = (void *)MEMORY[0x1AD0BB930](v9);
    id v14 = NLGetLogCategory(0);
    id v15 = [v14 internal];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 96) - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218496;
      uint64_t v33 = 2;
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2048;
      uint64_t v37 = v16;
      _os_log_impl(&dword_1A6419000, v15, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %lu", buf, 0x20u);
    }

    id v17 = (void *)MEMORY[0x1AD0BB930]();
    id v18 = NLGetLogCategory(0);
    unint64_t v19 = [v18 internal];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 134218496;
      uint64_t v33 = 2;
      __int16 v34 = 2048;
      uint64_t v35 = 1;
      __int16 v36 = 2048;
      uint64_t v37 = v20;
      _os_log_impl(&dword_1A6419000, v19, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
    }

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    v21 = *(void **)(a1 + 32);
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"Iteration %llu validation accuracy %.6f", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v21 logMessage:v22];

    goto LABEL_23;
  }
  if ([v5 hasPrefix:@"Embedding Creation Failed"])
  {
    uint64_t v23 = *(void *)(a1 + 56);
LABEL_13:
    *(unsigned char *)(*(void *)(v23 + 8) + 24) = 1;
    goto LABEL_23;
  }
  [v5 rangeOfString:@"failed" options:1];
  if (v24)
  {
    NSLog(&stru_1EFB32910.isa, v5);
    goto LABEL_23;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
    unint64_t v26 = *(void *)(v25 + 24);
    if (v26 <= 1)
    {
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      uint64_t v28 = *(void *)(a1 + 104);
      while (1)
      {
        unint64_t v29 = v26 + 1;
        if (v29 * v28 <= 2 * v27) {
          break;
        }
        reportInstanceCompletionToTrainer(*(void **)(a1 + 32), v27, v28, 2);
        uint64_t v27 = ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        uint64_t v28 = *(void *)(a1 + 104);
        uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
        unint64_t v26 = *(void *)(v25 + 24);
      }
      *(void *)(v25 + 24) = v29;
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 2)
      {
        v30 = *(void **)(a1 + 32);
        v31 = objc_msgSend(NSString, "stringWithFormat:", @"Starting transfer training with %llu samples", *(void *)(a1 + 104));
        [v30 logMessage:v31];

        *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = CFAbsoluteTimeGetCurrent();
        uint64_t v23 = *(void *)(a1 + 64);
        goto LABEL_13;
      }
    }
  }
LABEL_23:
  if ([*(id *)(a1 + 32) shouldStop]) {
    *a3 = 1;
  }
}

- (void)dealloc
{
  modelContainer = self->_modelContainer;
  if (modelContainer) {
    CFRelease(modelContainer);
  }
  nlModel = self->_nlModel;
  if (nlModel) {
    CFRelease(nlModel);
  }
  v5.receiver = self;
  v5.super_class = (Class)NLModelImplNX;
  [(NLModelImplNX *)&v5 dealloc];
}

- (id)modelData
{
  if (self->_nlModel && (uint64_t v2 = NLModelCopyContainer()) != 0)
  {
    v3 = (const void *)v2;
    v4 = (void *)NLModelContainerCopyContainerData();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)configuration
{
  return self->_configuration;
}

- (unint64_t)systemVersion
{
  v3 = [(NLModelImplNX *)self configuration];
  v4 = [v3 options];

  objc_super v5 = stringForKeyWithDefault(v4, @"EmbeddingType", 0);
  if ([v5 isEqualToString:@"Contextual"])
  {
    uint64_t v6 = [(NLModelImplNX *)self configuration];
    uint64_t v7 = [v6 language];

    unint64_t v8 = +[NLContextualEmbedding systemVersionForLanguage:v7];
  }
  else
  {
    unint64_t v8 = 3;
  }

  return v8;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)trainingInfo
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v4 = [NSNumber numberWithUnsignedInteger:self->_numberOfTrainingInstances];
  objc_super v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, 0x1EFB30650, self->_trainingEmbeddingType, 0x1EFB30690, 0);

  trainingLanguage = self->_trainingLanguage;
  if (trainingLanguage) {
    [v5 setObject:trainingLanguage forKey:0x1EFB30610];
  }
  embeddingModelIdentifier = self->_embeddingModelIdentifier;
  if (embeddingModelIdentifier) {
    [v5 setObject:embeddingModelIdentifier forKey:0x1EFB306B0];
  }

  return v5;
}

- (id)predictedLabelsDictionaryForString:(id)a3
{
  v3 = (void *)NLModelCopyPredictedLabels();

  return v3;
}

- (id)predictedLabelHypothesesDictionaryForString:(id)a3 maximumCount:(unint64_t)a4
{
  v4 = (void *)NLModelCopyPredictedLabelsAndProbabilities();

  return v4;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  v41 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v8 = [MEMORY[0x1E4F28E78] string];
  unint64_t v44 = v5;
  if (v5)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v4 objectAtIndex:v9];
      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      [v6 addObject:v11];

      uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
      [v7 addObject:v12];

      uint64_t v5 = v44;
      [v8 appendString:v10];
      if (++v9 < v44) {
        [v8 appendString:@" "];
      }
    }
    while (v44 != v9);
  }
  id v13 = [(NLModelImplNX *)self predictedLabelsDictionaryForString:v8];
  id v14 = v13;
  uint64_t v38 = v8;
  v39 = v4;
  v42 = v7;
  if (v13)
  {
    id v15 = [v13 objectForKey:*MEMORY[0x1E4F5C7F8]];
    uint64_t v16 = [v14 objectForKey:*MEMORY[0x1E4F5C818]];
    uint64_t v37 = v14;
    id v17 = [v14 objectForKey:*MEMORY[0x1E4F5C810]];
    v45 = v15;
    uint64_t v18 = [v15 count];
    unint64_t i = v41;
    if (v5)
    {
      unint64_t v20 = v18;
      uint64_t v21 = 0;
      uint64_t v40 = v6;
      do
      {
        v22 = [v6 objectAtIndex:v21];
        unint64_t v23 = [v22 unsignedIntegerValue];
        uint64_t v43 = v21;
        uint64_t v24 = [v42 objectAtIndex:v21];
        uint64_t v25 = [v24 unsignedIntegerValue];

        if (v20)
        {
          unint64_t v26 = 0;
          unint64_t v27 = v25 + v23;
          do
          {
            uint64_t v28 = [v16 objectAtIndex:v26];
            unint64_t v29 = [v28 unsignedIntegerValue];
            v30 = [v17 objectAtIndex:v26];
            uint64_t v31 = [v30 unsignedIntegerValue];

            v32 = 0;
            if (v29 < v27 && v23 < v31 + v29)
            {
              v32 = [v45 objectAtIndex:v26];
            }
            if (v32) {
              break;
            }
            ++v26;
          }
          while (v26 < v20);
          uint64_t v33 = v32;
          uint64_t v6 = v40;
          unint64_t i = v41;
          uint64_t v34 = v43;
          if (v32) {
            goto LABEL_20;
          }
        }
        else
        {
          v32 = 0;
          uint64_t v34 = v43;
        }
        uint64_t v33 = &stru_1EFB303D0;
LABEL_20:
        [i addObject:v33];

        uint64_t v21 = v34 + 1;
      }
      while (v21 != v44);
    }
    id v14 = v37;
    uint64_t v35 = v45;
  }
  else
  {
    for (unint64_t i = v41; v5; --v5)
      [v41 addObject:&stru_1EFB303D0];
    uint64_t v35 = 0;
    uint64_t v16 = 0;
    id v17 = 0;
  }

  return i;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v5 count];
  unint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  v50 = [MEMORY[0x1E4F1CA48] array];
  v48 = [MEMORY[0x1E4F28E78] string];
  unint64_t v49 = v7;
  if (v7)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v5 objectAtIndex:v9];
      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v48, "length"));
      [v8 addObject:v11];

      uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
      [v50 addObject:v12];

      uint64_t v7 = v49;
      [v48 appendString:v10];
      if (++v9 < v49) {
        [v48 appendString:@" "];
      }
    }
    while (v49 != v9);
  }
  id v13 = [(NLModelImplNX *)self predictedLabelHypothesesDictionaryForString:v48 maximumCount:a4];
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 objectForKey:*MEMORY[0x1E4F5C800]];
    uint64_t v16 = [v14 objectForKey:*MEMORY[0x1E4F5C808]];
    id v17 = [v14 objectForKey:*MEMORY[0x1E4F5C818]];
    uint64_t v18 = [v14 objectForKey:*MEMORY[0x1E4F5C810]];
    uint64_t v19 = [v15 count];
    if (v7)
    {
      uint64_t v20 = v19;
      v41 = v16;
      v42 = v15;
      v39 = v14;
      id v40 = v5;
      uint64_t v21 = 0;
      uint64_t v43 = v8;
      unint64_t v44 = v6;
      do
      {
        v47 = [MEMORY[0x1E4F1CA60] dictionary];
        v22 = [v8 objectAtIndex:v21];
        unint64_t v23 = [v22 unsignedIntegerValue];
        uint64_t v45 = v21;
        uint64_t v24 = [v50 objectAtIndex:v21];
        uint64_t v25 = [v24 unsignedIntegerValue];

        if (v20)
        {
          uint64_t v26 = 0;
          unint64_t v27 = v25 + v23;
          while (1)
          {
            uint64_t v28 = [v17 objectAtIndex:v26];
            unint64_t v29 = [v28 unsignedIntegerValue];
            v30 = [v18 objectAtIndex:v26];
            uint64_t v31 = [v30 unsignedIntegerValue];

            if (v29 < v27 && v23 < v31 + v29) {
              break;
            }
            if (v20 == ++v26) {
              goto LABEL_20;
            }
          }
          v32 = [v42 objectAtIndex:v26];
          uint64_t v33 = [v41 objectAtIndex:v26];
          if ([v32 count])
          {
            unint64_t v34 = 0;
            do
            {
              if (v34 >= [v33 count]) {
                break;
              }
              uint64_t v35 = [v33 objectAtIndex:v34];
              __int16 v36 = [v32 objectAtIndex:v34];
              [v47 setObject:v35 forKey:v36];

              ++v34;
            }
            while (v34 < [v32 count]);
          }
        }
LABEL_20:
        uint64_t v6 = v44;
        [v44 addObject:v47];

        uint64_t v21 = v45 + 1;
        unint64_t v8 = v43;
      }
      while (v45 + 1 != v49);
      id v14 = v39;
      id v5 = v40;
      uint64_t v16 = v41;
      id v15 = v42;
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v37 = MEMORY[0x1E4F1CC08];
      do
      {
        [v6 addObject:v37];
        --v7;
      }
      while (v7);
    }
    id v15 = 0;
    uint64_t v16 = 0;
    id v17 = 0;
    uint64_t v18 = 0;
  }

  return v6;
}

- (id)predictedLabelForString:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  uint64_t v19 = -[NLModelImplNX predictedLabelsDictionaryForString:](self, "predictedLabelsDictionaryForString:");
  id v4 = [v19 objectForKey:*MEMORY[0x1E4F5C7F8]];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v5 objectForKey:v12];
        uint64_t v14 = [v13 unsignedIntegerValue];

        unint64_t v15 = v14 + 1;
        uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14 + 1];
        [v5 setObject:v16 forKey:v12];

        if (v15 > v8)
        {
          id v17 = v12;

          unint64_t v8 = v15;
          uint64_t v9 = v17;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = -[NLModelImplNX predictedLabelHypothesesDictionaryForString:maximumCount:](self, "predictedLabelHypothesesDictionaryForString:maximumCount:", a3);
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F5C800]];
  id v40 = v4;
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F5C808]];
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v41 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v43 = v6;
  if ([v5 count])
  {
    unint64_t v8 = 0;
    v42 = v5;
    do
    {
      if (v8 >= [v6 count]) {
        break;
      }
      uint64_t v9 = [v5 objectAtIndex:v8];
      uint64_t v10 = [v6 objectAtIndex:v8];
      if ([v9 count])
      {
        unint64_t v11 = 0;
        do
        {
          if (v11 >= [v10 count]) {
            break;
          }
          uint64_t v12 = [v9 objectAtIndex:v11];
          id v13 = [v7 objectForKey:v12];
          uint64_t v14 = [v10 objectAtIndex:v11];
          unint64_t v15 = NSNumber;
          [v13 doubleValue];
          double v17 = v16;
          [v14 doubleValue];
          uint64_t v19 = [v15 numberWithDouble:v17 + v18];
          [v7 setObject:v19 forKey:v12];

          ++v11;
        }
        while (v11 < [v9 count]);
      }

      ++v8;
      id v5 = v42;
      uint64_t v6 = v43;
    }
    while (v8 < [v42 count]);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = v7;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
  long long v22 = v20;
  if (!v21) {
    goto LABEL_22;
  }
  uint64_t v23 = v21;
  uint64_t v24 = *(void *)v47;
  double v25 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v47 != v24) {
        objc_enumerationMutation(v20);
      }
      uint64_t v27 = [v20 objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * i)];
      [v27 doubleValue];
      double v25 = v25 + v28;
    }
    uint64_t v23 = [v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v23);

  if (a4 && v25 > 0.0)
  {
    unint64_t v29 = [v20 allKeys];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __64__NLModelImplNX_predictedLabelHypothesesForString_maximumCount___block_invoke;
    v44[3] = &unk_1E5C53768;
    id v30 = v20;
    id v45 = v30;
    uint64_t v31 = [v29 sortedArrayUsingComparator:v44];

    unint64_t v32 = 0;
    do
    {
      if (v32 >= [v31 count]) {
        break;
      }
      uint64_t v33 = [v31 objectAtIndex:v32];
      unint64_t v34 = [v30 objectForKey:v33];
      uint64_t v35 = NSNumber;
      [v34 doubleValue];
      uint64_t v37 = [v35 numberWithDouble:v36 / v25];
      [v41 setObject:v37 forKey:v33];

      ++v32;
    }
    while (a4 != v32);

    long long v22 = v45;
    uint64_t v6 = v43;
LABEL_22:
  }

  return v41;
}

uint64_t __64__NLModelImplNX_predictedLabelHypothesesForString_maximumCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = [*(id *)(a1 + 32) objectForKey:v6];

  [v10 doubleValue];
  double v12 = v11;

  if (v9 > v12) {
    return -1;
  }
  else {
    return v9 < v12;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingModelIdentifier, 0);
  objc_storeStrong((id *)&self->_trainingEmbeddingType, 0);
  objc_storeStrong((id *)&self->_trainingLanguage, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end