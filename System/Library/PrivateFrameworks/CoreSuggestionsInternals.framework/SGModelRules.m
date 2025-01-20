@interface SGModelRules
+ (BOOL)shouldCollectTrainingDataForObjective:(unint64_t)a3 language:(id)a4;
+ (id)_modelsAvailabeForMode:(unint64_t)a3 objective:(unint64_t)a4 language:(id)a5;
+ (void)loadBinaryClassificationModelFromMobileAssetForObjective:(unint64_t)a3 language:(id)a4 withBlock:(id)a5;
@end

@implementation SGModelRules

+ (BOOL)shouldCollectTrainingDataForObjective:(unint64_t)a3 language:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a1 _modelsAvailabeForMode:0 objective:a3 language:v6];
  uint64_t v8 = [v7 count];
  if (v8 && (unint64_t)[v7 count] >= 2)
  {
    v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v11 = 134218498;
      unint64_t v12 = a3;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_fault_impl(&dword_1CA650000, v9, OS_LOG_TYPE_FAULT, "Multiple model names specified to turn on data collection (objective: %lu, language: %@, models: %@.", (uint8_t *)&v11, 0x20u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }

  return v8 != 0;
}

+ (id)_modelsAvailabeForMode:(unint64_t)a3 objective:(unint64_t)a4 language:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F5DFA8];
  id v8 = a5;
  v9 = [v7 rules];
  v10 = [v9 objectForKeyedSubscript:@"SGDetectedAttributeDissector"];
  int v11 = [v10 objectForKeyedSubscript:v8];

  if (a4 >= 8)
  {
    unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v13 = [NSString stringWithUTF8String:"NSString *rulesKeyForObjective(SGModelObjective)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"SGModels.m", 351, @"Unknown SGModelObjective = %lu", a4);
  }
  else
  {
    a4 = (unint64_t)off_1E65B5438[a4];
  }
  if (a3 >= 3)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"NSString *rulesKeyForMode(SGModelMode)"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"SGModels.m", 361, @"Unknown SGModelMode = %lu", a3);

    __break(1u);
  }
  else
  {
    id v14 = [v11 objectForKeyedSubscript:off_1E65B5478[a3]];
    __int16 v15 = [v14 objectForKeyedSubscript:a4];

    return v15;
  }
  return result;
}

+ (void)loadBinaryClassificationModelFromMobileAssetForObjective:(unint64_t)a3 language:(id)a4 withBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)MEMORY[0x1CB79B230]();
  int v11 = [a1 _modelsAvailabeForMode:1 objective:a3 language:v8];
  if ((unint64_t)[v11 count] < 2)
  {
    if ([v11 count] == 1)
    {
      __int16 v13 = [v11 firstObject];
      id v14 = +[SGBinaryClassificationModel modelFromMobileAssetForName:v13 language:v8];
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9[2](v9, v14);
      }
      else
      {
        __int16 v15 = sgLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          int v16 = 134218498;
          unint64_t v17 = a3;
          __int16 v18 = 2112;
          id v19 = v8;
          __int16 v20 = 2112;
          v21 = v13;
          _os_log_fault_impl(&dword_1CA650000, v15, OS_LOG_TYPE_FAULT, "Failed to load model (objective: %lu, langauge: %@, name: %@)", (uint8_t *)&v16, 0x20u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
LABEL_18:
        }
          abort();
      }
    }
    else
    {
      __int16 v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 134218242;
        unint64_t v17 = a3;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "No prediction model specified for objective %lu, language: %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    unint64_t v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v16 = 134218498;
      unint64_t v17 = a3;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_fault_impl(&dword_1CA650000, v12, OS_LOG_TYPE_FAULT, "More than one prediction model specified for objective %lu, language: %@, models: %@", (uint8_t *)&v16, 0x20u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      goto LABEL_18;
    }
  }
}

@end