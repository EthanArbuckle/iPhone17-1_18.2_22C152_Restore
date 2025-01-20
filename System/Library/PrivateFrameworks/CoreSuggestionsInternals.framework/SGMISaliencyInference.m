@interface SGMISaliencyInference
+ (id)evaluate:(id)a3 enablePreFiltering:(BOOL)a4 config:(id)a5 error:(id *)a6;
+ (id)read:(id)a3 fromStore:(id)a4;
@end

@implementation SGMISaliencyInference

+ (id)read:(id)a3 fromStore:(id)a4
{
  id v5 = a4;
  v6 = [a3 messageId];
  v7 = [v5 saliencyForMessageId:v6];

  return v7;
}

+ (id)evaluate:(id)a3 enablePreFiltering:(BOOL)a4 config:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [v9 mailMessage];
  if ([v10 isSent])
  {
    v11 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v10 messageId];
      int v28 = 138412290;
      v29 = v12;
      _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGMISaliencyInference: Mail %@ is a sent mail", (uint8_t *)&v28, 0xCu);
    }
    if (!a6) {
      goto LABEL_17;
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 1;
LABEL_16:
    *a6 = [v13 errorWithDomain:@"SGMIError" code:v14 userInfo:0];
LABEL_17:
    uint64_t v20 = [v9 defaultSaliencyOnError];
    goto LABEL_18;
  }
  if (!a5)
  {
    v19 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGMISaliencyInference: Error - config shouldn't be nil when inferencing saliency", (uint8_t *)&v28, 2u);
    }

    if (!a6) {
      goto LABEL_17;
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 2;
    goto LABEL_16;
  }
  v15 = [v9 store];
  int v16 = [v15 areSubModelsEmpty];

  if (v16)
  {
    v17 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v10 messageId];
      int v28 = 138412290;
      v29 = v18;
      _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "SGMISaliencyInference: No submodels for message ID: %@", (uint8_t *)&v28, 0xCu);
    }
    if (!a6) {
      goto LABEL_17;
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 3;
    goto LABEL_16;
  }
  if (v8
    && (int64_t v23 = +[SGMISaliencyModel ruleBasedInferenceFor:v9],
        v23 != 2))
  {
    int64_t v25 = v23;
    v26 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v10 messageId];
      int v28 = 138412290;
      v29 = v27;
      _os_log_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEFAULT, "SGMISaliencyInference: rule based inference for message ID: %@", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v20 = [v9 defaultSaliencyOnOverrideFor:v25];
  }
  else
  {
    v24 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v28) = 0;
      _os_log_debug_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEBUG, "SGMISaliencyInference: Performing saliency inference for e-mail message.", (uint8_t *)&v28, 2u);
    }

    uint64_t v20 = +[SGMISaliencyModel saliencyForFeatureVector:v9];
  }
LABEL_18:
  v21 = (void *)v20;

  return v21;
}

@end