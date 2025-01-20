@interface ATXFaceSuggestionScorer
- (ATXFaceSuggestionScorer)initWithParameters:(id)a3 descriptors:(id)a4;
- (NSSet)signals;
- (double)featuredScoreForDescriptor:(id)a3;
- (id)_mockScoreForDescriptor:(id)a3;
- (void)_loadAppLaunchData;
- (void)_loadSignals;
@end

@implementation ATXFaceSuggestionScorer

- (ATXFaceSuggestionScorer)initWithParameters:(id)a3 descriptors:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXFaceSuggestionScorer;
  v9 = [(ATXFaceSuggestionScorer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameters, a3);
    objc_storeStrong((id *)&v10->_descriptors, a4);
    [(ATXFaceSuggestionScorer *)v10 _loadSignals];
  }

  return v10;
}

- (NSSet)signals
{
  v2 = (void *)[(NSSet *)self->_signals copy];
  return (NSSet *)v2;
}

- (double)featuredScoreForDescriptor:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double v4 = COERCE_DOUBLE(a3);
  v5 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
    __int16 v33 = 2112;
    double v34 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v6 = [(ATXFaceSuggestionScorer *)self _mockScoreForDescriptor:*(void *)&v4];
  if (v6)
  {
    id v7 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [v6 doubleValue];
      *(_DWORD *)buf = 136315650;
      v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
      __int16 v33 = 2048;
      double v34 = v8;
      __int16 v35 = 2112;
      double v36 = v4;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%s: using mocked score of %f for descriptor %@", buf, 0x20u);
    }

    [v6 doubleValue];
    double v10 = v9;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v11 = self->_signals;
    uint64_t v12 = [(NSSet *)v11 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v16 weight];
          double v18 = v17;
          [v16 valueForDescriptor:*(void *)&v4];
          double v20 = v19;
          double v21 = v18 * v19;
          v22 = __atxlog_handle_lock_screen();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            double v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136316162;
            v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
            __int16 v33 = 2112;
            double v34 = v24;
            __int16 v35 = 2048;
            double v36 = v18;
            __int16 v37 = 2048;
            double v38 = v20;
            __int16 v39 = 2048;
            double v40 = v21;
            _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "%s: [%@] weight: %f, value: %f = product: %f", buf, 0x34u);
          }
          double v10 = v10 + v21;
        }
        uint64_t v13 = [(NSSet *)v11 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v13);
    }
    else
    {
      double v10 = 0.0;
    }

    v25 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[ATXFaceSuggestionScorer featuredScoreForDescriptor:]";
      __int16 v33 = 2048;
      double v34 = v10;
      _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "%s: score: %f", buf, 0x16u);
    }

    v6 = 0;
  }

  return v10;
}

- (void)_loadSignals
{
  v16[9] = *MEMORY[0x1E4F143B8];
  [(ATXFaceSuggestionScorer *)self _loadAppLaunchData];
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v15 = [[ATXFaceSuggestionAppLaunchSignal alloc] initWithAppLaunchDictionary:self->_appLaunchDictionary];
  v16[0] = v15;
  v3 = [[ATXFaceSuggestionAppLaunchUniqueDaysSignal alloc] initWithAppLaunchDictionary:self->_appLaunchDictionary];
  v16[1] = v3;
  double v4 = objc_opt_new();
  v16[2] = v4;
  v5 = objc_opt_new();
  v16[3] = v5;
  v6 = [[ATXFaceSuggestionUprankedDateIntervalSignal alloc] initWithParameters:self->_parameters];
  v16[4] = v6;
  id v7 = [[ATXFaceSuggestionGlobalPopularitySignal alloc] initWithParameters:self->_parameters];
  v16[5] = v7;
  double v8 = objc_opt_new();
  v16[6] = v8;
  double v9 = objc_opt_new();
  v16[7] = v9;
  double v10 = objc_opt_new();
  v16[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:9];
  uint64_t v12 = (NSSet *)[v14 initWithArray:v11];
  signals = self->_signals;
  self->_signals = v12;
}

- (void)_loadAppLaunchData
{
  id v6 = [(NSSet *)self->_descriptors _pas_mappedSetWithTransform:&__block_literal_global_207];
  v3 = objc_opt_new();
  double v4 = [v3 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v6];
  appLaunchDictionary = self->_appLaunchDictionary;
  self->_appLaunchDictionary = v4;
}

uint64_t __45__ATXFaceSuggestionScorer__loadAppLaunchData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containerBundleIdentifier];
}

- (id)_mockScoreForDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  id v6 = [v5 dictionaryForKey:*MEMORY[0x1E4F4B750]];
  if (v6)
  {
    id v7 = [NSString alloc];
    double v8 = [v3 extensionBundleIdentifier];
    double v9 = [v3 identifier];
    double v10 = (void *)[v7 initWithFormat:@"%@-%@", v8, v9];

    v11 = [v6 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_appLaunchDictionary, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end