@interface NSArray(INIntentResolutionResultDataProviding)
- (id)_JSONDictionaryRepresentationForIntent:()INIntentResolutionResultDataProviding parameterName:;
- (id)resolutionResultDataForIntent:()INIntentResolutionResultDataProviding intentSlotDescription:error:;
- (void)transformResolutionResultForIntent:()INIntentResolutionResultDataProviding intentSlotDescription:withOptionsProvider:completion:;
@end

@implementation NSArray(INIntentResolutionResultDataProviding)

- (id)_JSONDictionaryRepresentationForIntent:()INIntentResolutionResultDataProviding parameterName:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "_JSONDictionaryRepresentationForIntent:parameterName:", v6, v7, (void)v18);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }

  v22 = @"resolutionResults";
  v15 = (void *)[v8 copy];
  v23 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  return v16;
}

- (id)resolutionResultDataForIntent:()INIntentResolutionResultDataProviding intentSlotDescription:error:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 facadePropertyName];
  uint64_t v11 = [v8 valueForKeyPath:v10];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v11 = 0;
  }
  uint64_t v12 = objc_alloc_init(_INPBIntentSlotResolutionMulticardinalResult);
  uint64_t v13 = [v11 count];
  if ([a1 count] || !v13)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = a1;
    uint64_t v21 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v17);
          }
          uint64_t v25 = [*(id *)(*((void *)&v31 + 1) + 8 * i) _buildIntentSlotResolutionResultWithIntentSlotDescription:v9];
          [(_INPBIntentSlotResolutionMulticardinalResult *)v12 addResolutionResults:v25];
        }
        uint64_t v22 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v22);
    }
    goto LABEL_15;
  }
  v14 = (void *)INSiriLogContextIntents;
  if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_7;
  }
  v28 = v14;
  v29 = [v9 facadePropertyName];
  v30 = [v8 description];
  *(_DWORD *)buf = 136315650;
  v39 = "-[NSArray(INIntentResolutionResultDataProviding) resolutionResultDataForIntent:intentSlotDescription:error:]";
  __int16 v40 = 2114;
  v41 = v29;
  __int16 v42 = 2114;
  v43 = v30;
  _os_log_error_impl(&dword_18CB2F000, v28, OS_LOG_TYPE_ERROR, "%s There should be at least 1 resolution result returned for the .%{public}@ property of %{public}@, since there was at least 1 input value.", buf, 0x20u);

  if (a5)
  {
LABEL_7:
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v16 = NSString;
    id v17 = [v9 facadePropertyName];
    long long v18 = [v8 description];
    long long v19 = [v16 stringWithFormat:@"There should be at least 1 resolution result returned for the .%@ property of %@, since there was at least 1 input value.", v17, v18];
    v37 = v19;
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    *a5 = [v15 errorWithDomain:@"INIntentResolutionResultErrorDomain" code:1000 userInfo:v20];

LABEL_15:
  }
LABEL_16:
  v26 = [(_INPBIntentSlotResolutionMulticardinalResult *)v12 data];

  return v26;
}

- (void)transformResolutionResultForIntent:()INIntentResolutionResultDataProviding intentSlotDescription:withOptionsProvider:completion:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v23 = a6;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  id v11 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v11 setMaxConcurrentOperationCount:1];
  [v11 setSuspended:1];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a1;
  uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = 0;
    uint64_t v15 = *(void *)v34;
    do
    {
      uint64_t v16 = 0;
      id v17 = v14;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        v14 = [[INResolutionResultTransformationOperation alloc] initWithResult:*(void *)(*((void *)&v33 + 1) + 8 * v16) intent:v27 intentSlotDescription:v26 optionsProvider:v25];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __138__NSArray_INIntentResolutionResultDataProviding__transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke;
        v31[3] = &unk_1E551C690;
        id v32 = v10;
        [(INResolutionResultTransformationOperation *)v14 setReturnBlock:v31];
        if (v17) {
          [(INResolutionResultTransformationOperation *)v14 addDependency:v17];
        }
        [v11 addOperation:v14];

        ++v16;
        id v17 = v14;
      }
      while (v13 != v16);
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  long long v18 = (void *)MEMORY[0x1E4F28B48];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __138__NSArray_INIntentResolutionResultDataProviding__transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion___block_invoke_2;
  v28[3] = &unk_1E551F740;
  id v29 = v10;
  id v30 = v23;
  id v19 = v10;
  id v20 = v23;
  uint64_t v21 = [v18 blockOperationWithBlock:v28];
  uint64_t v22 = v21;
  if (v14) {
    [v21 addDependency:v14];
  }
  [v11 addOperation:v22];
  [v11 setSuspended:0];
}

@end