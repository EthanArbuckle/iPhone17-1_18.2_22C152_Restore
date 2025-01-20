@interface SGContactSharingModel
+ (id)newTransformerInstanceForLanguage:(id)a3;
+ (int64_t)labelForProbabilities:(id)a3;
@end

@implementation SGContactSharingModel

+ (int64_t)labelForProbabilities:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] != 7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGContactSharingModel.m", 71, @"SGContactSharingModel - Provided probabilities (count %ld) do not match valid SGContactSharingLabels (count %ld).", objc_msgSend(v5, "count"), 7);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v14 doubleValue];
        if (v15 > v12)
        {
          int64_t v10 = v9 + i;
          [v14 doubleValue];
          double v12 = v16;
        }
      }
      v9 += v8;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F5DFA8] asset];
  id v5 = [v4 filesystemPathForAssetDataRelativePath:@"PQT_ContactSharing_TrainingTransformers.plist"];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v5];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v6 objectForKeyedSubscript:v3];
      if (!v8)
      {
        int64_t v10 = sgLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v22 = 138412290;
          id v23 = v3;
          _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGContactSharingModel - Could not find transformer instance for language: %@", (uint8_t *)&v22, 0xCu);
        }
        v18 = 0;
        goto LABEL_19;
      }
      id v9 = objc_alloc(MEMORY[0x1E4F93838]);
      int64_t v10 = [v9 initWithClassNameKey:*MEMORY[0x1E4F93868]];
      uint64_t v11 = [v8 objectForKeyedSubscript:@"MODEL_FEATURIZER"];
      uint64_t v12 = MEMORY[0x1E4F1CBF0];
      uint64_t v13 = MEMORY[0x1E4F1CC08];
      v14 = [v10 readObjectWithPlist:v11 chunks:MEMORY[0x1E4F1CBF0] context:MEMORY[0x1E4F1CC08]];

      id v15 = objc_alloc(MEMORY[0x1E4F93840]);
      double v16 = [v8 objectForKeyedSubscript:@"MODEL_SOURCE_SESSION_DESCRIPTOR"];
      v17 = (void *)[v15 initWithPlist:v16 chunks:v12 context:v13];

      if (v14 && v17)
      {
        v18 = [[SGTransformerInstance alloc] initWithTransformer:v14 sessionDescriptor:v17 modelClass:objc_opt_class()];
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      long long v20 = sgLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        _os_log_fault_impl(&dword_1CA650000, v20, OS_LOG_TYPE_FAULT, "SGContactSharing Model - Could not initialize featurizer and sessionDescriptor from config.", (uint8_t *)&v22, 2u);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v18 = 0;
        goto LABEL_18;
      }
LABEL_21:
      abort();
    }
  }
  long long v19 = sgLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_fault_impl(&dword_1CA650000, v19, OS_LOG_TYPE_FAULT, "SGContactSharingModel - Invalid model config for path: %@", (uint8_t *)&v22, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_21;
  }
  v18 = 0;
LABEL_20:

  return v18;
}

@end