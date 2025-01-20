@interface MapsSuggestionsFeatureFlagCondition
- (BOOL)isTrue;
- (MapsSuggestionsFeatureFlagCondition)initWithFeatureFlag:(id)a3;
@end

@implementation MapsSuggestionsFeatureFlagCondition

- (MapsSuggestionsFeatureFlagCondition)initWithFeatureFlag:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"MapsSuggestionsFeatureFlagCondition_%@", v5];
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsFeatureFlagCondition;
    v7 = [(MapsSuggestionsBaseCondition *)&v11 initWithName:v6];

    if (v7) {
      objc_storeStrong((id *)&v7->_featureFlag, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFeatureFlagCondition.m";
      __int16 v14 = 1024;
      int v15 = 53;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsFeatureFlagCondition initWithFeatureFlag:]";
      __int16 v18 = 2082;
      v19 = "nil == (featureFlag)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a feature flag", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)isTrue
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = GEOIsFeatureActive();
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    featureFlag = self->_featureFlag;
    int v7 = 138412546;
    v8 = featureFlag;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Checking featureFlag %@: %d", (uint8_t *)&v7, 0x12u);
  }

  if (v3) {
    return GEOConfigGetBOOL();
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end