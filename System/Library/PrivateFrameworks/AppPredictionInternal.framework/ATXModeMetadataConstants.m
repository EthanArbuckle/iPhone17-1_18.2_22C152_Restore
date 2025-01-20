@interface ATXModeMetadataConstants
+ (id)sharedInstance;
- (ATXModeMetadataConstants)init;
- (id)_invertDictionary:(id)a3;
- (id)defaultAppGenreModeAffinities;
- (id)defaultAppGenreModeAffinities_v2;
- (id)getCategoryScoresV1;
- (id)getCategoryScoresV2;
- (void)_populateDefaultAppGenreModeAffinities;
- (void)_populateDefaultAppGenreModeAffinities_v2;
@end

@implementation ATXModeMetadataConstants

- (ATXModeMetadataConstants)init
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)ATXModeMetadataConstants;
  v2 = [(ATXModeMetadataConstants *)&v23 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4B180] sharedInstance];
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v3;

    v5 = [(ATXModeEntityTrialClientWrapper *)v2->_modeEntityTrialClientWrapper modeAffinityAppCategoryScores];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = __atxlog_handle_modes();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeMetadataConstants: Loaded mode affinity app category scores from Trial", v22, 2u);
      }

      uint64_t v8 = [(ATXModeEntityTrialClientWrapper *)v2->_modeEntityTrialClientWrapper modeAffinityAppCategoryScores];
      appCategoryScores_V2 = v2->_appCategoryScores_V2;
      v2->_appCategoryScores_V2 = (NSDictionary *)v8;
    }
    else
    {
      appCategoryScores_V2 = [MEMORY[0x1E4F4AF08] rawDictionaryForResource:@"ATXAppCategoryScoresV2" ofType:@"plist"];
      uint64_t v10 = [appCategoryScores_V2 objectForKeyedSubscript:@"Modes"];
      v11 = v2->_appCategoryScores_V2;
      v2->_appCategoryScores_V2 = (NSDictionary *)v10;
    }
    v12 = [MEMORY[0x1E4F4AF08] rawDictionaryForResource:@"ATXAppCategoryScoresV1" ofType:@"plist"];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"Modes"];
    appCategoryScores_V1 = v2->_appCategoryScores_V1;
    v2->_appCategoryScores_V1 = (NSDictionary *)v13;

    v24[0] = @"DefaultAppGenreModeAffinities";
    v15 = [(ATXModeMetadataConstants *)v2 getCategoryScoresV1];
    v24[1] = @"DefaultAppGenreModeAffinities_v2";
    v25[0] = v15;
    v16 = [(ATXModeMetadataConstants *)v2 getCategoryScoresV2];
    v25[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v17;

    defaultAppGenreModeAffinities = v2->_defaultAppGenreModeAffinities;
    v2->_defaultAppGenreModeAffinities = 0;

    defaultAppGenreModeAffinities_v2 = v2->_defaultAppGenreModeAffinities_v2;
    v2->_defaultAppGenreModeAffinities_v2 = 0;
  }
  return v2;
}

- (id)getCategoryScoresV2
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v19 = (id)objc_opt_new();
  uint64_t v3 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = self;
  obj = self->_appCategoryScores_V2;
  uint64_t v20 = [(NSDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      v5 = v3;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v7 = [(NSDictionary *)v22->_appCategoryScores_V2 objectForKeyedSubscript:v6];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v13 = [(NSDictionary *)v22->_appCategoryScores_V2 objectForKeyedSubscript:v6];
              v14 = [v13 objectForKeyedSubscript:v12];
              v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F4AEB0], "appDirectoryCategoryStringToAppDirectoryCategoryID:", v12));
              [v5 setObject:v14 forKey:v15];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }

        [v19 setObject:v5 forKey:v6];
        uint64_t v3 = objc_opt_new();

        uint64_t v4 = v21 + 1;
        v5 = v3;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [(NSDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  return v19;
}

- (id)getCategoryScoresV1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v19 = (id)objc_opt_new();
  uint64_t v3 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = self;
  obj = self->_appCategoryScores_V1;
  uint64_t v20 = [(NSDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      v5 = v3;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v7 = [(NSDictionary *)v22->_appCategoryScores_V1 objectForKeyedSubscript:v6];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v13 = [(NSDictionary *)v22->_appCategoryScores_V1 objectForKeyedSubscript:v6];
              v14 = [v13 objectForKeyedSubscript:v12];
              v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F4AEB0], "appDirectoryCategoryStringToAppDirectoryCategoryID:", v12));
              [v5 setObject:v14 forKey:v15];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }

        [v19 setObject:v5 forKey:v6];
        uint64_t v3 = objc_opt_new();

        uint64_t v4 = v21 + 1;
        v5 = v3;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [(NSDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  return v19;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken7 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken7, &__block_literal_global_102);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_20;
  return v2;
}

void __42__ATXModeMetadataConstants_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_20;
  sharedInstance__pasExprOnceResult_20 = v1;
}

- (id)defaultAppGenreModeAffinities
{
  defaultAppGenreModeAffinities = self->_defaultAppGenreModeAffinities;
  if (!defaultAppGenreModeAffinities)
  {
    [(ATXModeMetadataConstants *)self _populateDefaultAppGenreModeAffinities];
    defaultAppGenreModeAffinities = self->_defaultAppGenreModeAffinities;
  }
  return defaultAppGenreModeAffinities;
}

- (void)_populateDefaultAppGenreModeAffinities
{
  uint64_t v3 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DefaultAppGenreModeAffinities"];

  if (v3)
  {
    uint64_t v7 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DefaultAppGenreModeAffinities"];
    uint64_t v4 = [(ATXModeMetadataConstants *)self _invertDictionary:v7];
    defaultAppGenreModeAffinities = self->_defaultAppGenreModeAffinities;
    self->_defaultAppGenreModeAffinities = v4;

    uint64_t v6 = (NSDictionary *)v7;
  }
  else
  {
    uint64_t v6 = self->_defaultAppGenreModeAffinities;
    self->_defaultAppGenreModeAffinities = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (id)defaultAppGenreModeAffinities_v2
{
  defaultAppGenreModeAffinities_v2 = self->_defaultAppGenreModeAffinities_v2;
  if (!defaultAppGenreModeAffinities_v2)
  {
    [(ATXModeMetadataConstants *)self _populateDefaultAppGenreModeAffinities_v2];
    defaultAppGenreModeAffinities_v2 = self->_defaultAppGenreModeAffinities_v2;
  }
  return defaultAppGenreModeAffinities_v2;
}

- (void)_populateDefaultAppGenreModeAffinities_v2
{
  uint64_t v3 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DefaultAppGenreModeAffinities_v2"];

  if (v3)
  {
    uint64_t v7 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DefaultAppGenreModeAffinities_v2"];
    uint64_t v4 = [(ATXModeMetadataConstants *)self _invertDictionary:v7];
    defaultAppGenreModeAffinities_v2 = self->_defaultAppGenreModeAffinities_v2;
    self->_defaultAppGenreModeAffinities_v2 = v4;

    uint64_t v6 = (NSDictionary *)v7;
  }
  else
  {
    uint64_t v6 = self->_defaultAppGenreModeAffinities_v2;
    self->_defaultAppGenreModeAffinities_v2 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (id)_invertDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v5);
        }
        uint64_t v22 = v6;
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * v6);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v8 = [v5 objectForKeyedSubscript:v7];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              v14 = [v4 objectForKeyedSubscript:v13];

              if (!v14)
              {
                v15 = objc_opt_new();
                [v4 setObject:v15 forKeyedSubscript:v13];
              }
              v16 = [v5 objectForKeyedSubscript:v7];
              uint64_t v17 = [v16 objectForKeyedSubscript:v13];
              uint64_t v18 = [v4 objectForKeyedSubscript:v13];
              [v18 setObject:v17 forKeyedSubscript:v7];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppGenreModeAffinities_v2, 0);
  objc_storeStrong((id *)&self->_defaultAppGenreModeAffinities, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_appCategoryScores_V2, 0);
  objc_storeStrong((id *)&self->_appCategoryScores_V1, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
}

@end