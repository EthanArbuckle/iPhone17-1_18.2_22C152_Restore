@interface NLModelImplN
- (NLModelImplN)initWithModelContainer:(void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9;
- (NLModelImplN)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplN)initWithModelTrainer:(id)a3 error:(id *)a4;
- (id)configuration;
- (id)labelMap;
- (id)modelData;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelHypothesesDictionaryForString:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelsDictionaryForString:(id)a3;
- (id)predictedLabelsForTokens:(id)a3;
- (unint64_t)numberOfTrainingInstances;
- (void)dealloc;
@end

@implementation NLModelImplN

- (NLModelImplN)initWithModelContainer:(void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a9;
  uint64_t v15 = NLModelCreateWithContainer();
  unint64_t v16 = unsignedIntegerForKey(v14, 0x1EFB30650, 0);

  if (v15)
  {
    v23.receiver = self;
    v23.super_class = (Class)NLModelImplN;
    v17 = [(NLModelImplN *)&v23 init];
    self = v17;
    if (v17)
    {
      v17->_nlModel = (void *)v15;
      v17->_modelContainer = (void *)CFRetain(a3);
      v18 = (NLModelConfiguration *)[v12 copy];
      configuration = self->_configuration;
      self->_configuration = v18;

      v20 = (NSDictionary *)[v13 copy];
      labelMap = self->_labelMap;
      self->_labelMap = v20;

      self->_numberOfTrainingInstances = v16;
    }
  }

  return self;
}

- (NLModelImplN)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v32[0] = v16;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  uint64_t v23 = NLModelContainerCreate();
  if (v23)
  {
    v24 = (const void *)v23;
    v25 = [(NLModelImplN *)self initWithModelContainer:v23 configuration:v17 labelMap:v18 vocabularyMap:v19 documentFrequencyMap:v20 customEmbeddingData:v21 trainingInfo:v22];
    CFRelease(v24);
    self = v25;
    v26 = self;
  }
  else
  {
    if (a10)
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31 = @"Failed to load model file, invalid CRF model data";
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a10 = [v29 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v27];
    }
    v26 = 0;
  }

  return v26;
}

- (NLModelImplN)initWithModelTrainer:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  v39 = [v45 configuration];
  v43 = [v45 dataSet];
  long long v53 = xmmword_1A646D4D0;
  int64x2_t v54 = vdupq_n_s64(0x400uLL);
  long long v55 = xmmword_1A646D8C0;
  v44 = +[NLDataSet dataSetWithDataSet:v43 constraintParameters:&v53 modelTrainer:v45];
  v38 = [v44 inverseLabelMap];
  uint64_t v36 = [v43 numberOfTrainingInstances];
  v4 = [v45 options];
  uint64_t v5 = unsignedIntegerForKey(v4, @"MaximumIterations", 25);

  if (initWithModelTrainer_error__onceToken != -1) {
    dispatch_once(&initWithModelTrainer_error__onceToken, &__block_literal_global_4);
  }
  if ([v44 numberOfTrainingInstances])
  {
    v6 = (void *)MEMORY[0x1E4F1CA60];
    v7 = NSNumber;
    id v40 = v45;
    v8 = [v7 numberWithInteger:1];
    v42 = [v6 dictionaryWithObject:v8 forKey:*MEMORY[0x1E4F5C850]];

    v9 = [v40 configuration];

    v10 = [v9 language];

    v11 = [NSNumber numberWithInteger:20 * v5];
    [v42 setObject:v11 forKey:*MEMORY[0x1E4F5C848]];

    if (v10) {
      [v42 setObject:v10 forKey:*MEMORY[0x1E4F5C840]];
    }

    CFTypeRef cf = (CFTypeRef)NLModelTrainerCreate();
    if (cf)
    {
      id v12 = [NLDataEnumerator alloc];
      id v13 = [v44 dataProviderOfType:0];
      v35 = [(NLDataEnumerator *)v12 initWithDataProvider:v13];

      *(void *)&long long v53 = 0;
      *((void *)&v53 + 1) = &v53;
      int64x2_t v54 = (int64x2_t)0x2020000000uLL;
      v54.i64[1] = CFAbsoluteTimeGetCurrent();
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      v52[3] = 0;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v51[3] = 0;
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x2020000000;
      v50[3] = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v49[3] = 0;
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v48[3] = 0;
      v46[0] = 0;
      v46[1] = v46;
      v46[2] = 0x2020000000;
      char v47 = 0;
      [v44 numberOfTrainingInstances];
      if ([v44 numberOfValidationInstances])
      {
        id v14 = [NLDataEnumerator alloc];
        uint64_t v15 = [v44 dataProviderOfType:1];
        v34 = [(NLDataEnumerator *)v14 initWithDataProvider:v15];
      }
      else
      {
        v34 = 0;
      }
      id v16 = (void *)MEMORY[0x1AD0BB930]();
      id v17 = NLGetLogCategory(0);
      id v18 = [v17 internal];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v59 = 0;
        _os_log_impl(&dword_1A6419000, v18, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
      }

      for (unint64_t i = 0; i < [&unk_1EFB3AA78 count]; ++i)
      {
        id v20 = (void *)MEMORY[0x1AD0BB930]();
        id v21 = NLGetLogCategory(0);
        id v22 = [v21 internal];

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = [&unk_1EFB3AA78 objectAtIndexedSubscript:i];
          uint64_t v24 = [v23 UTF8String];
          *(_DWORD *)buf = 134218498;
          uint64_t v59 = 1;
          __int16 v60 = 2048;
          unint64_t v61 = i;
          __int16 v62 = 2082;
          uint64_t v63 = v24;
          _os_log_impl(&dword_1A6419000, v22, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);
        }
      }
      id v25 = v40;
      v26 = (const void *)NLModelTrainerTrainAndCopyContainer();
      v27 = (void *)MEMORY[0x1AD0BB930]();
      v28 = NLGetLogCategory(0);
      v29 = [v28 internal];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v59 = 3;
        _os_log_impl(&dword_1A6419000, v29, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
      }

      uint64_t v30 = [NSString stringWithFormat:@"Finished CRF training in %.2f seconds", CFAbsoluteTimeGetCurrent() - *(double *)(*((void *)&v53 + 1) + 24)];
      [v25 logMessage:v30];

      CFRelease(cf);
      _Block_object_dispose(v46, 8);
      _Block_object_dispose(v48, 8);
      _Block_object_dispose(v49, 8);
      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v51, 8);
      _Block_object_dispose(v52, 8);
      _Block_object_dispose(&v53, 8);

      if (v26)
      {
        uint64_t v56 = 0x1EFB30650;
        v31 = [NSNumber numberWithUnsignedInteger:v36];
        v57 = v31;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        self = [(NLModelImplN *)self initWithModelContainer:v26 configuration:v39 labelMap:v38 vocabularyMap:0 documentFrequencyMap:0 customEmbeddingData:0 trainingInfo:v32];

        CFRelease(v26);
      }
    }
    else
    {
    }
  }

  return self;
}

uint64_t __43__NLModelImplN_initWithModelTrainer_error___block_invoke()
{
  initWithModelTrainer_error__whitespaceAndNewlineCharacterSet = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];

  return MEMORY[0x1F41817F8]();
}

void __43__NLModelImplN_initWithModelTrainer_error___block_invoke_13(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 hasPrefix:@"***** Iteration #"])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t i = *(void *)(v8 + 24) + 1;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * i, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      v10 = (void *)MEMORY[0x1AD0BB930]();
      v11 = NLGetLogCategory(0);
      id v12 = [v11 internal];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 96) - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134218496;
        uint64_t v34 = 2;
        __int16 v35 = 2048;
        uint64_t v36 = 0;
        __int16 v37 = 2048;
        uint64_t v38 = v13;
        _os_log_impl(&dword_1A6419000, v12, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %ld", buf, 0x20u);
      }

      id v14 = (void *)MEMORY[0x1AD0BB930]();
      uint64_t v15 = NLGetLogCategory(0);
      id v16 = [v15 internal];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(_DWORD *)buf = 134218496;
        uint64_t v34 = 2;
        __int16 v35 = 2048;
        uint64_t v36 = 1;
        __int16 v37 = 2048;
        uint64_t v38 = v17;
        _os_log_impl(&dword_1A6419000, v16, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
      }

      id v18 = *(void **)(a1 + 32);
      id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Iteration %llu validation accuracy %.6f", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 1, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      [v18 logMessage:v19];

      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t i = *(void *)(v8 + 24) + 1;
    }
LABEL_8:
    *(void *)(v8 + 24) = i;
    goto LABEL_22;
  }
  if ([v5 hasPrefix:@"Total seconds required for training:"])
  {
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 2) >= 0xCCCCCCCCCCCCCCDuLL)
    {
      id v20 = *(void **)(a1 + 32);
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Iteration %llu validation accuracy %.6f", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 1, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      [v20 logMessage:v21];
    }
    goto LABEL_22;
  }
  if ([v5 hasPrefix:@"Item accuracy: "])
  {
    uint64_t v22 = objc_msgSend(v5, "rangeOfString:", @"(");
    uint64_t v24 = v23;
    unint64_t v25 = [v5 rangeOfString:@""]);
    if (!v24) {
      goto LABEL_22;
    }
    if (!v26) {
      goto LABEL_22;
    }
    uint64_t v6 = v22 + v24;
    unint64_t v7 = v25 - (v22 + v24);
    if (v25 <= v22 + v24) {
      goto LABEL_22;
    }
    v27 = objc_msgSend(v5, "substringWithRange:", v6, v7);
    [v27 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v28;
LABEL_17:

    goto LABEL_22;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_22;
  }
  if ([v5 hasPrefix:@"Number of features"])
  {
    v29 = *(void **)(a1 + 32);
    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Starting CRF training with %llu samples", *(void *)(a1 + 104));
    [v29 logMessage:v30];

    *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    goto LABEL_22;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v27 = [v5 stringByTrimmingCharactersInSet:initWithModelTrainer_error__whitespaceAndNewlineCharacterSet];
    if ([v27 length] != 1) {
      goto LABEL_17;
    }
    unint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);

    if (v31 <= 0x31)
    {
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      uint64_t v6 = *(void *)(a1 + 104);
      uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
      for (uint64_t i = *(void *)(v8 + 24) + 1; 50 * v32 < (unint64_t)(i * v6); uint64_t i = *(void *)(v8 + 24) + 1)
      {
        reportInstanceCompletionToTrainer(*(void **)(a1 + 32), v32, v6, 2);
        uint64_t v32 = ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        uint64_t v6 = *(void *)(a1 + 104);
        uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
      }
      goto LABEL_8;
    }
  }
LABEL_22:
  if (objc_msgSend(*(id *)(a1 + 32), "shouldStop", v6, v7)) {
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
  v5.super_class = (Class)NLModelImplN;
  [(NLModelImplN *)&v5 dealloc];
}

- (id)modelData
{
  if (self->_modelContainer && NLModelContainerGetModelDataCount() >= 1)
  {
    CFDataRef v2 = (const __CFData *)NLModelContainerCopyModelDataAtIndex();
    v3 = (void *)MEMORY[0x1E4F1C9B8];
    BytePtr = CFDataGetBytePtr(v2);
    objc_super v5 = [v3 dataWithBytes:BytePtr length:CFDataGetLength(v2)];
    CFRelease(v2);
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
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
  unint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F28E78] string];
  unint64_t v44 = v5;
  if (v5)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [v4 objectAtIndex:v9];
      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      [v6 addObject:v11];

      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
      [v7 addObject:v12];

      uint64_t v5 = v44;
      [v8 appendString:v10];
      if (++v9 < v44) {
        [v8 appendString:@" "];
      }
    }
    while (v44 != v9);
  }
  uint64_t v13 = [(NLModelImplN *)self predictedLabelsDictionaryForString:v8];
  id v14 = v13;
  uint64_t v38 = v8;
  uint64_t v39 = v4;
  v42 = v7;
  if (v13)
  {
    uint64_t v15 = [v13 objectForKey:*MEMORY[0x1E4F5C7F8]];
    id v16 = [v14 objectForKey:*MEMORY[0x1E4F5C818]];
    __int16 v37 = v14;
    uint64_t v17 = [v14 objectForKey:*MEMORY[0x1E4F5C810]];
    id v45 = v15;
    uint64_t v18 = [v15 count];
    uint64_t i = v41;
    if (v5)
    {
      unint64_t v20 = v18;
      uint64_t v21 = 0;
      id v40 = v6;
      do
      {
        uint64_t v22 = [v6 objectAtIndex:v21];
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
            uint64_t v30 = [v17 objectAtIndex:v26];
            uint64_t v31 = [v30 unsignedIntegerValue];

            uint64_t v32 = 0;
            if (v29 < v27 && v23 < v31 + v29)
            {
              uint64_t v32 = [v45 objectAtIndex:v26];
            }
            if (v32) {
              break;
            }
            ++v26;
          }
          while (v26 < v20);
          v33 = v32;
          uint64_t v6 = v40;
          uint64_t i = v41;
          uint64_t v34 = v43;
          if (v32) {
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v32 = 0;
          uint64_t v34 = v43;
        }
        v33 = &stru_1EFB303D0;
LABEL_20:
        [i addObject:v33];

        uint64_t v21 = v34 + 1;
      }
      while (v21 != v44);
    }
    id v14 = v37;
    __int16 v35 = v45;
  }
  else
  {
    for (uint64_t i = v41; v5; --v5)
      [v41 addObject:&stru_1EFB303D0];
    __int16 v35 = 0;
    id v16 = 0;
    uint64_t v17 = 0;
  }

  return i;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [v5 count];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  v50 = [MEMORY[0x1E4F1CA48] array];
  v48 = [MEMORY[0x1E4F28E78] string];
  unint64_t v49 = v7;
  if (v7)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [v5 objectAtIndex:v9];
      v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v48, "length"));
      [v8 addObject:v11];

      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
      [v50 addObject:v12];

      uint64_t v7 = v49;
      [v48 appendString:v10];
      if (++v9 < v49) {
        [v48 appendString:@" "];
      }
    }
    while (v49 != v9);
  }
  uint64_t v13 = [(NLModelImplN *)self predictedLabelHypothesesDictionaryForString:v48 maximumCount:a4];
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 objectForKey:*MEMORY[0x1E4F5C800]];
    id v16 = [v14 objectForKey:*MEMORY[0x1E4F5C808]];
    uint64_t v17 = [v14 objectForKey:*MEMORY[0x1E4F5C818]];
    uint64_t v18 = [v14 objectForKey:*MEMORY[0x1E4F5C810]];
    uint64_t v19 = [v15 count];
    if (v7)
    {
      uint64_t v20 = v19;
      v41 = v16;
      v42 = v15;
      uint64_t v39 = v14;
      id v40 = v5;
      uint64_t v21 = 0;
      uint64_t v43 = v8;
      unint64_t v44 = v6;
      do
      {
        char v47 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v22 = [v8 objectAtIndex:v21];
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
            uint64_t v30 = [v18 objectAtIndex:v26];
            uint64_t v31 = [v30 unsignedIntegerValue];

            if (v29 < v27 && v23 < v31 + v29) {
              break;
            }
            if (v20 == ++v26) {
              goto LABEL_20;
            }
          }
          uint64_t v32 = [v42 objectAtIndex:v26];
          v33 = [v41 objectAtIndex:v26];
          if ([v32 count])
          {
            unint64_t v34 = 0;
            do
            {
              if (v34 >= [v33 count]) {
                break;
              }
              __int16 v35 = [v33 objectAtIndex:v34];
              uint64_t v36 = [v32 objectAtIndex:v34];
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
        uint64_t v8 = v43;
      }
      while (v45 + 1 != v49);
      id v14 = v39;
      id v5 = v40;
      id v16 = v41;
      uint64_t v15 = v42;
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
    uint64_t v15 = 0;
    id v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }

  return v6;
}

- (id)predictedLabelForString:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  uint64_t v19 = -[NLModelImplN predictedLabelsDictionaryForString:](self, "predictedLabelsDictionaryForString:");
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
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = [v5 objectForKey:v12];
        uint64_t v14 = [v13 unsignedIntegerValue];

        unint64_t v15 = v14 + 1;
        id v16 = [NSNumber numberWithUnsignedInteger:v14 + 1];
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
  id v4 = -[NLModelImplN predictedLabelHypothesesDictionaryForString:maximumCount:](self, "predictedLabelHypothesesDictionaryForString:maximumCount:", a3);
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
          id v12 = [v9 objectAtIndex:v11];
          uint64_t v13 = [v7 objectForKey:v12];
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
    v44[2] = __63__NLModelImplN_predictedLabelHypothesesForString_maximumCount___block_invoke;
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
      v33 = [v31 objectAtIndex:v32];
      unint64_t v34 = [v30 objectForKey:v33];
      __int16 v35 = NSNumber;
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

uint64_t __63__NLModelImplN_predictedLabelHypothesesForString_maximumCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  objc_storeStrong((id *)&self->_labelMap, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end