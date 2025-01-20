@interface DESGaussianAlgorithmParameters
- (BOOL)calculateAndVerifyPerChunkClippingBoundsIn:(id)a3 withOverallClippingBound:(double)a4;
- (DESGaussianAlgorithmParameters)initWith:(id)a3 epsilon:(double)a4 delta:(double)a5 clippingBound:(double)a6;
- (DESGaussianAlgorithmParameters)initWith:(id)a3 epsilon:(double)a4 delta:(double)a5 clippingBound:(double)a6 momentsAccountantParameters:(id)a7;
- (DESGaussianAlgorithmParameters)initWith:(id)a3 recipe:(id)a4;
- (NSDictionary)parameters;
- (NSString)key;
- (double)clippingBound;
- (double)sigma;
- (void)addPerChunkParametersWith:(double)a3 numChunks:(unint64_t)a4;
@end

@implementation DESGaussianAlgorithmParameters

- (DESGaussianAlgorithmParameters)initWith:(id)a3 recipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 recipeUserInfo];
  v9 = [v8 objectForKeyedSubscript:@"maxNorm"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v21 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[DESGaussianAlgorithmParameters initWith:recipe:].cold.5(v7);
    }
    goto LABEL_25;
  }
  v11 = [v7 recipeUserInfo];
  v12 = [v11 objectForKeyedSubscript:@"maxNorm"];
  [v12 doubleValue];
  double v14 = v13;

  v15 = [v7 recipeUserInfo];
  v16 = [v15 objectForKeyedSubscript:@"DifferentialPrivacyParameters"];
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  v18 = [v7 recipeUserInfo];
  v19 = v18;
  if (v17)
  {
    v20 = @"DifferentialPrivacyParameters";
  }
  else
  {
    v22 = [v18 objectForKeyedSubscript:@"LocalDifferentialPrivacyParameters"];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) == 0)
    {
      v21 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[DESGaussianAlgorithmParameters initWith:recipe:].cold.4(v7);
      }
      goto LABEL_25;
    }
    v18 = [v7 recipeUserInfo];
    v19 = v18;
    v20 = @"LocalDifferentialPrivacyParameters";
  }
  v21 = [v18 objectForKeyedSubscript:v20];

  v24 = [v21 objectForKeyedSubscript:@"mechanism"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [v21 objectForKeyedSubscript:@"mechanism"];
    char v26 = [v25 isEqualToString:@"gaussian"];

    if (v26)
    {
      v27 = [v21 objectForKeyedSubscript:@"epsilon"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [v21 objectForKeyedSubscript:@"delta"];
        objc_opt_class();
        char v29 = objc_opt_isKindOfClass();

        if (v29)
        {
          v30 = [v21 objectForKeyedSubscript:@"MomentsAccountantParameters"];

          if (v30)
          {
            v31 = [v21 objectForKeyedSubscript:@"MomentsAccountantParameters"];
            objc_opt_class();
            char v32 = objc_opt_isKindOfClass();

            if ((v32 & 1) == 0)
            {
              v30 = +[DESLogging coreChannel];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                -[DESGaussianAlgorithmParameters initWith:recipe:](v7);
              }
              v39 = 0;
              goto LABEL_30;
            }
            v30 = [v21 objectForKeyedSubscript:@"MomentsAccountantParameters"];
          }
          v33 = [v21 objectForKeyedSubscript:@"epsilon"];
          [v33 doubleValue];
          double v35 = v34;

          v36 = [v21 objectForKeyedSubscript:@"delta"];
          [v36 doubleValue];
          double v38 = v37;

          self = [(DESGaussianAlgorithmParameters *)self initWith:v6 epsilon:v30 delta:v35 clippingBound:v38 momentsAccountantParameters:v14];
          v39 = self;
LABEL_30:

          goto LABEL_26;
        }
      }
      else
      {
      }
      v40 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[DESGaussianAlgorithmParameters initWith:recipe:](v7);
      }
      goto LABEL_24;
    }
  }
  else
  {
  }
  v40 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    -[DESGaussianAlgorithmParameters initWith:recipe:](v7);
  }
LABEL_24:

LABEL_25:
  v39 = 0;
LABEL_26:

  return v39;
}

- (DESGaussianAlgorithmParameters)initWith:(id)a3 epsilon:(double)a4 delta:(double)a5 clippingBound:(double)a6
{
  return [(DESGaussianAlgorithmParameters *)self initWith:a3 epsilon:0 delta:a4 clippingBound:a5 momentsAccountantParameters:a6];
}

- (DESGaussianAlgorithmParameters)initWith:(id)a3 epsilon:(double)a4 delta:(double)a5 clippingBound:(double)a6 momentsAccountantParameters:(id)a7
{
  id v11 = a3;
  v65[6] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  v61.receiver = self;
  v61.super_class = (Class)DESGaussianAlgorithmParameters;
  v15 = [(DESGaussianAlgorithmParameters *)&v61 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_24;
  }
  v15->_epsilon = a4;
  v15->_delta = a5;
  v15->_clippingBound = a6;
  momentsAccountantParameters = v15->_momentsAccountantParameters;
  v15->_momentsAccountantParameters = 0;

  if (!v14)
  {
    calculateSigmaFromEpsilonAndDeltaForUnitL2Norm(a4, a5);
    v16->_double sigma = sigma;
LABEL_20:
    double v35 = 0;
    if (fabs(sigma) == INFINITY) {
      goto LABEL_25;
    }
    objc_storeStrong((id *)&v16->_key, v11);
    v63[0] = @"GaussianFromSigma";
    v62[0] = @"Mechanism";
    v62[1] = @"OverallEpsilon";
    double v37 = [NSNumber numberWithDouble:a4];
    v63[1] = v37;
    v62[2] = @"OverallDelta";
    double v38 = [NSNumber numberWithDouble:a5];
    v63[2] = v38;
    v62[3] = @"OverallClippingBound";
    v39 = [NSNumber numberWithDouble:a6];
    v63[3] = v39;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:4];

    uint64_t v41 = [v40 mutableCopy];
    parameters = v16->_parameters;
    v16->_parameters = (NSMutableDictionary *)v41;

    if (v16->_momentsAccountantParameters) {
      -[NSMutableDictionary addEntriesFromDictionary:](v16->_parameters, "addEntriesFromDictionary:");
    }

LABEL_24:
    double v35 = v16;
    goto LABEL_25;
  }
  id v54 = v11;
  v65[0] = @"RenyiOrder";
  v65[1] = @"CohortSigma";
  v65[2] = @"NumIterations";
  v65[3] = @"MaxCohortSize";
  v65[4] = @"CurrentCohortSize";
  v65[5] = @"PopulationSize";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:6];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v58;
    v55 = v16;
    id v56 = v13;
    while (2)
    {
      v22 = v18;
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v22);
        }
        uint64_t v24 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v25 = [v14 objectForKeyedSubscript:v24];
        if (v25)
        {
          char v26 = (void *)v25;
          v27 = [v14 objectForKeyedSubscript:v24];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            continue;
          }
        }
        double v34 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:].cold.4(v24, v34);
        }

        v18 = v22;
        v33 = v22;
        v16 = v55;
        id v13 = v56;
        goto LABEL_18;
      }
      v18 = v22;
      uint64_t v20 = [v22 countByEnumeratingWithState:&v57 objects:v64 count:16];
      v16 = v55;
      id v13 = v56;
      if (v20) {
        continue;
      }
      break;
    }
  }

  uint64_t v29 = [v14 dictionaryWithValuesForKeys:v18];
  v30 = v16->_momentsAccountantParameters;
  v16->_momentsAccountantParameters = (NSDictionary *)v29;

  v31 = [(NSDictionary *)v16->_momentsAccountantParameters objectForKeyedSubscript:@"RenyiOrder"];
  int v32 = [v31 intValue];

  if ((v32 - 33) > 0xFFFFFFE0)
  {
    v44 = [(NSDictionary *)v16->_momentsAccountantParameters objectForKeyedSubscript:@"NumIterations"];
    uint64_t v45 = [v44 longLongValue];

    if (v45 <= 0)
    {
      v33 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:](v33);
      }
      goto LABEL_18;
    }
    v46 = [(NSDictionary *)v16->_momentsAccountantParameters objectForKeyedSubscript:@"MaxCohortSize"];
    uint64_t v47 = [v46 longLongValue];

    v48 = [(NSDictionary *)v16->_momentsAccountantParameters objectForKeyedSubscript:@"CurrentCohortSize"];
    uint64_t v49 = [v48 longLongValue];

    v50 = [(NSDictionary *)v16->_momentsAccountantParameters objectForKeyedSubscript:@"PopulationSize"];
    uint64_t v51 = [v50 longLongValue];

    if (v47 < 1 || v49 < 1 || v51 < 1 || v49 > v47 || v47 > v51)
    {
      v33 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:](v33);
      }
      goto LABEL_18;
    }
    v52 = [(NSDictionary *)v16->_momentsAccountantParameters objectForKeyedSubscript:@"CohortSigma"];
    [v52 doubleValue];
    v16->_double sigma = v53;

    double sigma = v16->_sigma;
    id v11 = v54;
    goto LABEL_20;
  }
  v33 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:](v33);
  }
LABEL_18:

  double v35 = 0;
LABEL_25:

  return v35;
}

- (void)addPerChunkParametersWith:(double)a3 numChunks:(unint64_t)a4
{
  [(DESGaussianAlgorithmParameters *)self sigma];
  if (a4 != 1) {
    double v7 = v7 * self->_clippingBound / a3;
  }
  v8 = [NSNumber numberWithDouble:v7];
  [(NSMutableDictionary *)self->_parameters setObject:v8 forKeyedSubscript:@"SigmaAfterNormalizing"];

  v9 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_parameters setObject:v9 forKeyedSubscript:@"ClippingBound"];

  id v10 = [NSNumber numberWithUnsignedLong:a4];
  [(NSMutableDictionary *)self->_parameters setObject:v10 forKeyedSubscript:@"NumChunks"];
}

- (BOOL)calculateAndVerifyPerChunkClippingBoundsIn:(id)a3 withOverallClippingBound:(double)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 count];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    double v12 = a4 / sqrt((double)v7);
    double v13 = 0.0;
    char v14 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        char v17 = objc_msgSend(v16, "clippingBound", (void)v27);
        v18 = v17;
        if (v17 && ([v17 doubleValue], v19 != 0.0))
        {
          [v18 doubleValue];
          [v18 doubleValue];
        }
        else
        {
          char v14 = 0;
          double v20 = v12;
        }
        double v13 = v13 + v20 * v20;
        uint64_t v21 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v16 setClippingBound:v21];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v10);

    if ((v14 & 1) == 0) {
      goto LABEL_16;
    }
    double v22 = sqrt(v13);
  }
  else
  {

    double v22 = 0.0;
  }
  if (almostEqualDBLWithAccuracy(v22, a4, 0.0001))
  {
LABEL_16:
    BOOL v23 = 1;
    goto LABEL_20;
  }
  uint64_t v24 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    char v26 = [(DESGaussianAlgorithmParameters *)self key];
    *(_DWORD *)buf = 134218498;
    double v32 = v22;
    __int16 v33 = 2048;
    double v34 = a4;
    __int16 v35 = 2112;
    v36 = v26;
    _os_log_error_impl(&dword_1BECCB000, v24, OS_LOG_TYPE_ERROR, "Per chunk clipping bound root sum squared does not match overall clipping bound: %f vs. %f, for %@", buf, 0x20u);
  }
  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (NSDictionary)parameters
{
  v2 = (void *)[(NSMutableDictionary *)self->_parameters copy];

  return (NSDictionary *)v2;
}

- (NSString)key
{
  return self->_key;
}

- (double)sigma
{
  return self->_sigma;
}

- (double)clippingBound
{
  return self->_clippingBound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_momentsAccountantParameters, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)initWith:(void *)a1 recipe:.cold.1(void *a1)
{
  v1 = [a1 recipeID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v2, v3, "Recipe content '%@' is malformed for Dedisco, for recipe: %@", v4, v5, v6, v7, 2u);
}

- (void)initWith:(void *)a1 recipe:.cold.2(void *a1)
{
  uint64_t v7 = [a1 recipeID];
  OUTLINED_FUNCTION_2_1(&dword_1BECCB000, v1, v2, "Recipe content %@ or %@ is malformed for recipe: %@", v3, v4, v5, v6, 2u);
}

- (void)initWith:(void *)a1 recipe:.cold.3(void *a1)
{
  uint64_t v1 = [a1 recipeID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v2, v3, "Recipe content '%@' malformed for Dedisco, for recipe: %@, only Gaussian is supported as local DP mechanism.", v4, v5, v6, v7, 2u);
}

- (void)initWith:(void *)a1 recipe:.cold.4(void *a1)
{
  uint64_t v7 = [a1 recipeID];
  OUTLINED_FUNCTION_2_1(&dword_1BECCB000, v1, v2, "Recipe content '%@' or '%@' malformed for Dedisco, for recipe: %@", v3, v4, v5, v6, 2u);
}

- (void)initWith:(void *)a1 recipe:.cold.5(void *a1)
{
  uint64_t v1 = [a1 recipeID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v2, v3, "Recipe content '%@' malformed for Dedisco, for recipe: %@", v4, v5, v6, v7, 2u);
}

- (void)initWith:(os_log_t)log epsilon:delta:clippingBound:momentsAccountantParameters:.cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 138412802;
  uint64_t v2 = @"RenyiOrder";
  __int16 v3 = 1024;
  int v4 = 2;
  __int16 v5 = 1024;
  int v6 = 32;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Moments accountant parameter '%@' must be between %d and %d.", (uint8_t *)&v1, 0x18u);
}

- (void)initWith:(os_log_t)log epsilon:delta:clippingBound:momentsAccountantParameters:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = @"NumIterations";
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Moments accountant parameter '%@' must be greater than 0.", (uint8_t *)&v1, 0xCu);
}

- (void)initWith:(os_log_t)log epsilon:delta:clippingBound:momentsAccountantParameters:.cold.3(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 138412802;
  uint64_t v2 = @"CurrentCohortSize";
  __int16 v3 = 2112;
  int v4 = @"MaxCohortSize";
  __int16 v5 = 2112;
  int v6 = @"PopulationSize";
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Moments accountant parameters require 0 <= %@ <= %@ <= %@.", (uint8_t *)&v1, 0x20u);
}

- (void)initWith:(uint64_t)a1 epsilon:(NSObject *)a2 delta:clippingBound:momentsAccountantParameters:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Moments accountant parameter '%@' is malformed.", (uint8_t *)&v2, 0xCu);
}

@end