@interface SGEspressoModel
+ (id)modelWithConfigPath:(id)a3 binPath:(id)a4;
@end

@implementation SGEspressoModel

+ (id)modelWithConfigPath:(id)a3 binPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v6];
  v9 = v8;
  if (!v8)
  {
    v26 = sgLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_fault_impl(&dword_1CA650000, v26, OS_LOG_TYPE_FAULT, "SGEspressoModel - Invalid model config: %@", buf, 0xCu);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v25 = 0;
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  v10 = [v8 objectForKeyedSubscript:@"PREDICTION_PARAMETERS"];
  v11 = [v10 objectForKeyedSubscript:@"SUB_MODEL_KEY_STRING"];

  v12 = (void *)[[NSString alloc] initWithFormat:@"%@:%@", v7, v11];
  v13 = [MEMORY[0x1E4F93828] classifierWithEspressoModelFile:v12];
  if (v13)
  {
    id v30 = v7;
    v32 = v11;
    id v14 = objc_alloc(MEMORY[0x1E4F93838]);
    v15 = (void *)[v14 initWithClassNameKey:*MEMORY[0x1E4F93868]];
    v16 = [v9 objectForKeyedSubscript:@"MODEL_FEATURIZER"];
    uint64_t v17 = MEMORY[0x1E4F1CBF0];
    uint64_t v18 = MEMORY[0x1E4F1CC08];
    v31 = v15;
    v19 = [v15 readObjectWithPlist:v16 chunks:MEMORY[0x1E4F1CBF0] context:MEMORY[0x1E4F1CC08]];

    id v20 = objc_alloc(MEMORY[0x1E4F93840]);
    v21 = [v9 objectForKeyedSubscript:@"MODEL_SOURCE_SESSION_DESCRIPTOR"];
    v22 = (void *)[v20 initWithPlist:v21 chunks:v17 context:v18];

    if (v22)
    {
      v23 = [v22 locale];
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F5DFB8]) initWithSessionDescriptor:v22 modelClass:objc_opt_class()];
      v25 = (void *)[objc_alloc((Class)a1) initWithModel:v13 locale:v23 featurizer:v19 modelSource:v24];

LABEL_17:
      v11 = v32;
      id v7 = v30;
      goto LABEL_18;
    }
    v28 = sgLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_fault_impl(&dword_1CA650000, v28, OS_LOG_TYPE_FAULT, "SGEspressoModel - Invalid sessionDescriptor in config: %@", buf, 0xCu);
    }

    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v25 = 0;
      goto LABEL_17;
    }
LABEL_22:
    abort();
  }
  v27 = sgLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v12;
    _os_log_fault_impl(&dword_1CA650000, v27, OS_LOG_TYPE_FAULT, "SGEspressoModel - Could not initialize PMLMultiLabelEspressoClassifier: %@", buf, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_22;
  }
  v25 = 0;
LABEL_18:

LABEL_19:
  return v25;
}

@end