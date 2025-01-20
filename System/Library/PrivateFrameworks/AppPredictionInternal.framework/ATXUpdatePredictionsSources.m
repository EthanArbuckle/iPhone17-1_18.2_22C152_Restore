@interface ATXUpdatePredictionsSources
- (ATXTimeBucketedRateLimiter)rateLimiter;
- (ATXUpdatePredictionsSources)init;
- (ATXUpdatePredictionsSources)initWithUpdateSources:(id)a3 rateLimiter:(id)a4;
- (NSArray)updateSources;
- (void)forceUpdatePredictionsImmediatelyWithReason:(unint64_t)a3;
- (void)forwardUpdatePredictionsDefaultIntervalWithReason:(unint64_t)a3;
- (void)forwardUpdatePredictionsImmediatelyWithReason:(unint64_t)a3;
- (void)setRateLimiter:(id)a3;
- (void)setUpdateSources:(id)a3;
- (void)tryUpdatePredictionsDefaultIntervalWithReason:(unint64_t)a3;
- (void)tryUpdatePredictionsImmediatelyWithReason:(unint64_t)a3;
@end

@implementation ATXUpdatePredictionsSources

- (void)tryUpdatePredictionsDefaultIntervalWithReason:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(ATXTimeBucketedRateLimiter *)self->_rateLimiter tryToIncrementCountAndReturnSuccess];
  v6 = __atxlog_handle_default();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:a3];
      int v14 = 138412802;
      v15 = v9;
      __int16 v16 = 2080;
      v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsDefaultIntervalWithReason:]";
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ successful", (uint8_t *)&v14, 0x20u);
    }
    [(ATXUpdatePredictionsSources *)self forwardUpdatePredictionsDefaultIntervalWithReason:a3];
  }
  else
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:a3];
      int v14 = 138412802;
      v15 = v12;
      __int16 v16 = 2080;
      v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsDefaultIntervalWithReason:]";
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ rate limited", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (ATXUpdatePredictionsSources)init
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v11[0] = v3;
  v4 = objc_opt_new();
  v11[1] = v4;
  BOOL v5 = objc_opt_new();
  v11[2] = v5;
  v6 = objc_opt_new();
  v11[3] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];

  v8 = [[ATXTimeBucketedRateLimiter alloc] initWithMaxCount:2 perPeriod:27000.0];
  v9 = [(ATXUpdatePredictionsSources *)self initWithUpdateSources:v7 rateLimiter:v8];

  return v9;
}

- (ATXUpdatePredictionsSources)initWithUpdateSources:(id)a3 rateLimiter:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ATXUpdatePredictionsSources;
  v9 = [(ATXUpdatePredictionsSources *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updateSources, a3);
    objc_storeStrong((id *)&v10->_rateLimiter, a4);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15++), "setDelegate:", v10, (void)v17);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (void)tryUpdatePredictionsImmediatelyWithReason:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(ATXTimeBucketedRateLimiter *)self->_rateLimiter tryToIncrementCountAndReturnSuccess];
  v6 = __atxlog_handle_default();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:a3];
      int v14 = 138412802;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      long long v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsImmediatelyWithReason:]";
      __int16 v18 = 2112;
      long long v19 = v10;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ successful", (uint8_t *)&v14, 0x20u);
    }
    [(ATXUpdatePredictionsSources *)self forwardUpdatePredictionsImmediatelyWithReason:a3];
  }
  else
  {
    if (v7)
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      uint64_t v13 = +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:a3];
      int v14 = 138412802;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      long long v17 = "-[ATXUpdatePredictionsSources tryUpdatePredictionsImmediatelyWithReason:]";
      __int16 v18 = 2112;
      long long v19 = v13;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - %s: prediction update with reason: %@ rate limited", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)forceUpdatePredictionsImmediatelyWithReason:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    id v8 = +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:a3];
    int v9 = 138412802;
    v10 = v7;
    __int16 v11 = 2080;
    uint64_t v12 = "-[ATXUpdatePredictionsSources forceUpdatePredictionsImmediatelyWithReason:]";
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "%@ - %s: forced prediction update with reason: %@", (uint8_t *)&v9, 0x20u);
  }
  [(ATXUpdatePredictionsSources *)self forwardUpdatePredictionsImmediatelyWithReason:a3];
  [(ATXTimeBucketedRateLimiter *)self->_rateLimiter tryToIncrementCountAndReturnSuccess];
}

- (void)forwardUpdatePredictionsDefaultIntervalWithReason:(unint64_t)a3
{
}

- (void)forwardUpdatePredictionsImmediatelyWithReason:(unint64_t)a3
{
}

- (NSArray)updateSources
{
  return self->_updateSources;
}

- (void)setUpdateSources:(id)a3
{
}

- (ATXTimeBucketedRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_updateSources, 0);
}

@end