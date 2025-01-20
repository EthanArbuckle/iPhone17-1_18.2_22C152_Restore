@interface DESDodMLTaskSchedulingPolicy
- (BOOL)dediscoReturnRouteEnabled;
- (BOOL)originReturnRouteEnabled;
- (BOOL)parsecReturnRouteEnabled;
- (DESDodMLTaskSchedulingPolicy)init;
- (DESDodMLTaskSchedulingPolicy)initWithAssetURL:(id)a3 error:(id *)a4;
- (DESDodMLTaskSchedulingPolicy)initWithPolicyDict:(id)a3;
- (NSArray)allRecipeIDs;
- (NSNumber)telemetrySamplingRate;
- (NSURL)postbackBaseURL;
- (NSURL)telemetryURL;
- (double)period;
- (double)timeLimit;
- (id)_policyForRecipeID:(id)a3 error:(id *)a4;
- (id)predicateForRecipeID:(id)a3 error:(id *)a4;
- (id)samplingRateForRecipeID:(id)a3 error:(id *)a4;
- (unint64_t)recipeCountLimit;
@end

@implementation DESDodMLTaskSchedulingPolicy

- (DESDodMLTaskSchedulingPolicy)init
{
  return [(DESDodMLTaskSchedulingPolicy *)self initWithPolicyDict:0];
}

- (DESDodMLTaskSchedulingPolicy)initWithAssetURL:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v20 = 0;
    v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:8 error:&v20];
    id v8 = v20;
    if (v7)
    {
      id v19 = v8;
      v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v19];
      id v10 = v19;

      if (v9)
      {
        self = [(DESDodMLTaskSchedulingPolicy *)self initWithPolicyDict:v9];
        id v8 = v10;
        v11 = self;
      }
      else
      {
        if (a4)
        {
          v15 = (void *)MEMORY[0x1E4F28C58];
          v21[0] = *MEMORY[0x1E4F28568];
          v16 = [NSString stringWithFormat:@"Fail to decode JSON object from URL = (%@)", v6];
          v21[1] = *MEMORY[0x1E4F28A50];
          v22[0] = v16;
          v22[1] = v10;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
          *a4 = [v15 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:5005 userInfo:v17];
        }
        v11 = 0;
        id v8 = v10;
      }
    }
    else
    {
      if (!a4)
      {
        v11 = 0;
        goto LABEL_13;
      }
      v13 = (void *)MEMORY[0x1E4F28C58];
      v23[0] = *MEMORY[0x1E4F28568];
      v9 = [NSString stringWithFormat:@"Fail to read URL = (%@)", v6];
      v23[1] = *MEMORY[0x1E4F28A50];
      v24[0] = v9;
      v24[1] = v8;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      *a4 = [v13 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:5005 userInfo:v14];

      v11 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_15;
  }
  v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v26[0] = @"Nil policy URL";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  [v12 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:5002 userInfo:v8];
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
  return v11;
}

- (DESDodMLTaskSchedulingPolicy)initWithPolicyDict:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)DESDodMLTaskSchedulingPolicy;
  v5 = [(DESDodMLTaskSchedulingPolicy *)&v55 init];
  id v6 = v5;
  if (v5)
  {
    v5->_recipeCountLimit = 1;
    *(_OWORD *)&v5->_timeLimit = xmmword_1BECF6200;
    if (v4)
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"recipes"];
      recipes = v6->_recipes;
      v6->_recipes = (NSDictionary *)v7;

      v9 = [v4 objectForKeyedSubscript:@"evaluation_limits"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 objectForKeyedSubscript:@"time_seconds"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 doubleValue];
          double v12 = v11;
          uint64_t v13 = 0x4072C00000000000;
          if (v12 < 300.0) {
            [v10 doubleValue];
          }
          *(void *)&v6->_timeLimit = v13;
        }
        v14 = [v9 objectForKeyedSubscript:@"recipe_count"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v6->_recipeCountLimit = [v14 unsignedIntegerValue];
        }
        v15 = [v9 objectForKeyedSubscript:@"period_in_seconds"];
        if (allowCustomWakeUpPeriod())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:](v15, v16);
            }

            v6->_period = (double)(unint64_t)[v15 unsignedIntegerValue];
          }
        }
      }
      v17 = [v4 objectForKeyedSubscript:@"return_routes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v50 = v9;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v58 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          v48 = v17;
          id v49 = v4;
          uint64_t v21 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v52 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(NSObject **)(*((void *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v23 isEqualToString:@"parsec"])
                {
                  v24 = +[DESLogging coreChannel];
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BECCB000, v24, OS_LOG_TYPE_INFO, "Enabling Parsec return route", buf, 2u);
                  }

                  v6->_parsecReturnRouteEnabled = 1;
                }
                else if ([v23 isEqualToString:@"origin"])
                {
                  v26 = +[DESLogging coreChannel];
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BECCB000, v26, OS_LOG_TYPE_INFO, "Enabling Origin return route", buf, 2u);
                  }

                  v6->_originReturnRouteEnabled = 1;
                }
                else if ([v23 isEqualToString:@"dedisco"])
                {
                  v27 = +[DESLogging coreChannel];
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BECCB000, v27, OS_LOG_TYPE_INFO, "Enabling Dedisco return route", buf, 2u);
                  }

                  v6->_dediscoReturnRouteEnabled = 1;
                }
              }
              else
              {
                uint64_t v25 = +[DESLogging coreChannel];
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v57 = v23;
                  _os_log_impl(&dword_1BECCB000, v25, OS_LOG_TYPE_INFO, "Ignoring invalid return route: %@", buf, 0xCu);
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v58 count:16];
          }
          while (v20);
          id v4 = v49;
          v9 = v50;
          v17 = v48;
        }
      }
      else
      {
        v18 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v17;
          _os_log_impl(&dword_1BECCB000, v18, OS_LOG_TYPE_INFO, "Ignoring invalid or blank return routes: %@", buf, 0xCu);
        }
      }

      if (!v6->_originReturnRouteEnabled && !v6->_parsecReturnRouteEnabled && !v6->_dediscoReturnRouteEnabled) {
        v6->_originReturnRouteEnabled = 1;
      }
      v29 = [v4 objectForKeyedSubscript:@"host"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = (void *)MEMORY[0x1E4F1CB10];
        v31 = [NSString stringWithFormat:@"https://%@", v29];
        v32 = [v30 URLWithString:v31];

        if (v32)
        {
          v33 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v32;
            _os_log_impl(&dword_1BECCB000, v33, OS_LOG_TYPE_INFO, "Setting _postback base URL to %@", buf, 0xCu);
          }

          objc_storeStrong((id *)&v6->_postbackBaseURL, v32);
        }
      }
      else
      {
        v32 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v29;
          _os_log_impl(&dword_1BECCB000, v32, OS_LOG_TYPE_INFO, "Ignoring invalid policy host: %@", buf, 0xCu);
        }
      }

      v34 = [v4 objectForKeyedSubscript:@"telemetry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = v9;
        v36 = [v34 objectForKeyedSubscript:@"href"];
        v37 = [v34 objectForKeyedSubscript:@"sampling_rate"];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          v38 = v17;
          v39 = [MEMORY[0x1E4F1CB10] URLWithString:v36];
          objc_storeStrong((id *)&v6->_telemetryURL, v39);
          if (v37 && ([v37 doubleValue], v40 <= 1.0) && (objc_msgSend(v37, "doubleValue"), v41 > 0.0))
          {
            v42 = v37;
            v43 = v6;
            p_super = &v6->_telemetrySamplingRate->super.super;
            v45 = v43;
            v43->_telemetrySamplingRate = v42;
          }
          else
          {
            v45 = v6;
            p_super = +[DESLogging coreChannel];
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
              -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:]((uint64_t)v34, p_super);
            }
          }

          id v6 = v45;
          v17 = v38;
        }
        else
        {
          v39 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:]((uint64_t)v34, v39);
          }
        }

        v9 = v35;
      }
      else
      {
        v36 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BECCB000, v36, OS_LOG_TYPE_INFO, "Skipping telemetry because none was specified in the policy", buf, 2u);
        }
      }

      v46 = v6;
    }
    else
    {
      v28 = v5;
    }
  }

  return v6;
}

- (NSArray)allRecipeIDs
{
  return [(NSDictionary *)self->_recipes allKeys];
}

- (id)_policyForRecipeID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)self->_recipes objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = v7;
  }
  else if (a4)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28588];
    v9 = [NSString stringWithFormat:@"Invalid policy for recipeID=%@, policy=%@", v6, v7];
    v13[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a4 = [v8 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1513 userInfo:v10];

    a4 = 0;
  }

  return a4;
}

- (id)samplingRateForRecipeID:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(DESDodMLTaskSchedulingPolicy *)self _policyForRecipeID:v6 error:a4];
  id v8 = v7;
  if (!v7)
  {
    a4 = 0;
    goto LABEL_14;
  }
  v9 = [v7 objectForKeyedSubscript:@"sampling_rate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    [v10 doubleValue];
    if (v11 <= 1.0 && v11 > 0.0)
    {
      id v10 = v10;
      a4 = (id *)v10;
LABEL_12:

      goto LABEL_13;
    }
    if (!a4) {
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28588];
    uint64_t v13 = [NSString stringWithFormat:@"Invalid sampling rate=%f, recipeID=%@", *(void *)&v11, v6];
    v18 = v13;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    *a4 = [v14 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1513 userInfo:v15];

LABEL_11:
    a4 = 0;
    goto LABEL_12;
  }
  if (a4)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28588];
    id v10 = [NSString stringWithFormat:@"Invalid sampling rate in policy for recipeID: %@", v6];
    v20[0] = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a4 = [v12 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1513 userInfo:v13];
    goto LABEL_11;
  }
LABEL_13:

LABEL_14:

  return a4;
}

- (id)predicateForRecipeID:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(DESDodMLTaskSchedulingPolicy *)self _policyForRecipeID:v6 error:a4];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:@"predicate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a4 = v9;
    }
    else if (a4)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      double v11 = [NSString stringWithFormat:@"Invalid predicate in recipeID=%@", v6, *MEMORY[0x1E4F28588]];
      v15[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a4 = [v10 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1513 userInfo:v12];

      a4 = 0;
    }
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (unint64_t)recipeCountLimit
{
  return self->_recipeCountLimit;
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (double)period
{
  return self->_period;
}

- (BOOL)originReturnRouteEnabled
{
  return self->_originReturnRouteEnabled;
}

- (BOOL)parsecReturnRouteEnabled
{
  return self->_parsecReturnRouteEnabled;
}

- (BOOL)dediscoReturnRouteEnabled
{
  return self->_dediscoReturnRouteEnabled;
}

- (NSURL)postbackBaseURL
{
  return self->_postbackBaseURL;
}

- (NSURL)telemetryURL
{
  return self->_telemetryURL;
}

- (NSNumber)telemetrySamplingRate
{
  return self->_telemetrySamplingRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetrySamplingRate, 0);
  objc_storeStrong((id *)&self->_telemetryURL, 0);
  objc_storeStrong((id *)&self->_postbackBaseURL, 0);

  objc_storeStrong((id *)&self->_recipes, 0);
}

- (void)initWithPolicyDict:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Skipping never-valid telemetry %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithPolicyDict:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Ignoring malformed telemetry %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithPolicyDict:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 unsignedIntegerValue];
  _os_log_debug_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_DEBUG, "Custom period = %lu in policy.", (uint8_t *)&v3, 0xCu);
}

@end