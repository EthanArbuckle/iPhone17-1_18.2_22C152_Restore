@interface SGNameInversionPredictor
+ (BOOL)shouldInvertFirst:(id)a3 last:(id)a4;
+ (id)sharedInstance;
- (BOOL)shouldInvertFirst:(id)a3 last:(id)a4;
- (BOOL)shouldInvertFirst:(id)a3 last:(id)a4 underNamingTradition:(id)a5;
- (SGNameInversionPredictor)init;
- (double)firstNameLikelihood:(id)a3 underNamingTradition:(id)a4 default:(double)a5;
- (double)inversionRateForNamingTradition:(id)a3;
@end

@implementation SGNameInversionPredictor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tradToInversionRate, 0);
  objc_storeStrong((id *)&self->_tradToTrie, 0);
}

- (BOOL)shouldInvertFirst:(id)a3 last:(id)a4 underNamingTradition:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(SGNameInversionPredictor *)self inversionRateForNamingTradition:v8];
  double v12 = v11;
  [(SGNameInversionPredictor *)self firstNameLikelihood:v10 underNamingTradition:v8 default:0.99];
  double v14 = v13;

  [(SGNameInversionPredictor *)self firstNameLikelihood:v9 underNamingTradition:v8 default:0.01];
  double v16 = v15;

  if (v12 > 1.0 || v12 < 0.0 || v16 > 1.0 || (v14 >= 0.0 ? (BOOL v17 = v14 > 1.0) : (BOOL v17 = 1), v17 || v16 < 0.0))
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = objc_msgSend(NSString, "stringWithUTF8String:", "double inversionProbabilityEstimate(double, double, double)");
    [v23 handleFailureInFunction:v24, @"SGNameInversionPredictor.m", 48, @"Probabilities must be in [0, 1]" file lineNumber description];
  }
  if (v14 == 1.0 && v16 == 1.0 || v14 == 0.0 && v16 == 0.0) {
    goto LABEL_22;
  }
  BOOL v18 = v14 == 0.0;
  if (v16 == 1.0) {
    BOOL v18 = 1;
  }
  if (v12 == 1.0 && v18) {
    goto LABEL_22;
  }
  BOOL v19 = v14 == 1.0;
  if (v16 == 0.0) {
    BOOL v19 = 1;
  }
  if (v12 == 0.0 && v19)
  {
LABEL_22:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = objc_msgSend(NSString, "stringWithUTF8String:", "double inversionProbabilityEstimate(double, double, double)");
    [v21 handleFailureInFunction:v22 file:@"SGNameInversionPredictor.m" lineNumber:55 description:@"Contradictory parameters."];
  }
  return v12 * ((1.0 - v14) * v16) / ((1.0 - v12) * (v14 * (1.0 - v16)) + (1.0 - v14) * v16 * v12) >= self->_confidenceThreshold;
}

- (double)inversionRateForNamingTradition:(id)a3
{
  v3 = [(NSDictionary *)self->_tradToInversionRate objectForKeyedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)firstNameLikelihood:(id)a3 underNamingTradition:(id)a4 default:(double)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 length] <= 0x20)
  {
    id v10 = [(NSDictionary *)self->_tradToTrie objectForKeyedSubscript:v9];
    double v11 = v10;
    if (v10)
    {
      LODWORD(v12) = [v10 payloadForString:v8];
      if (v12 != 0.0) {
        a5 = v12;
      }
    }
    else
    {
      double v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v9;
        _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "failed to load trie for naming tradition; tradKey: %@",
          (uint8_t *)&v15,
          0xCu);
      }
    }
  }

  return a5;
}

- (BOOL)shouldInvertFirst:(id)a3 last:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_tradToInversionRate;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (-[SGNameInversionPredictor shouldInvertFirst:last:underNamingTradition:](self, "shouldInvertFirst:last:underNamingTradition:", v6, v7, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (SGNameInversionPredictor)init
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)SGNameInversionPredictor;
  v2 = [(SGNameInversionPredictor *)&v34 init];
  if (v2)
  {
    v27 = (NSDictionary *)objc_opt_new();
    v29 = (NSDictionary *)objc_opt_new();
    v3 = v2;
    v26 = +[SGPatterns patternsForClass:objc_opt_class()];
    double v4 = [v26 rawValueForKey:@"config"];
    [v4 objectForKeyedSubscript:@"traditions"];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v31;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * v8);
          uint64_t v10 = [v4 objectForKeyedSubscript:@"traditions"];
          uint64_t v11 = [v10 objectForKeyedSubscript:v9];
          float v12 = [v11 objectForKeyedSubscript:@"inversionRate"];
          [(NSDictionary *)v29 setObject:v12 forKeyedSubscript:v9];

          BOOL v13 = [v4 objectForKeyedSubscript:@"traditions"];
          double v14 = [v13 objectForKeyedSubscript:v9];
          long long v15 = [v14 objectForKeyedSubscript:@"trieName"];

          long long v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          long long v17 = [v16 pathForResource:v15 ofType:@"trie" inDirectory:@"Tries"];

          if (v17 && (uint64_t v18 = [objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v17]) != 0)
          {
            BOOL v19 = v18;
            [(NSDictionary *)v27 setObject:v18 forKeyedSubscript:v9];
          }
          else
          {
            BOOL v19 = sgLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v36 = v9;
              __int16 v37 = 2112;
              v38 = v15;
              __int16 v39 = 2112;
              v40 = v17;
              _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "Failed to locate resource; tradition: %@, fname: %@, path: %@",
                buf,
                0x20u);
            }
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v6);
    }
    v2 = v3;
    tradToTrie = v3->_tradToTrie;
    v3->_tradToTrie = v27;
    v21 = v27;

    tradToInversionRate = v3->_tradToInversionRate;
    v3->_tradToInversionRate = v29;

    v23 = [v4 objectForKeyedSubscript:@"confidenceThreshold"];
    [v23 doubleValue];
    v3->_confidenceThreshold = v24;
  }
  return v2;
}

+ (BOOL)shouldInvertFirst:(id)a3 last:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 sharedInstance];
  char v9 = [v8 shouldInvertFirst:v7 last:v6];

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_33330 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3_33330, &__block_literal_global_33331);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_33332;
  return v2;
}

void __42__SGNameInversionPredictor_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_33332;
  sharedInstance__pasExprOnceResult_33332 = v1;
}

@end