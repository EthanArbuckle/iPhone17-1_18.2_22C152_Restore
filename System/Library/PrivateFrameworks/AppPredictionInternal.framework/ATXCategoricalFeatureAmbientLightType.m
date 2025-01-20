@interface ATXCategoricalFeatureAmbientLightType
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
- (id)featureNameForAWDProactiveAppPredictionAmbientLightType:(int)a3;
@end

@implementation ATXCategoricalFeatureAmbientLightType

- (id)featureNameForAWDProactiveAppPredictionAmbientLightType:(int)a3
{
  if (a3 < 8) {
    return off_1E68B67B8[a3];
  }
  v4 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ATXCategoricalFeatureAmbientLightType featureNameForAWDProactiveAppPredictionAmbientLightType:]();
  }

  return @"<Unexpected Category Value>";
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  v6 = [v5 ambientLightContext];

  if (v6)
  {
    v7 = [v5 ambientLightContext];
    uint64_t v8 = [v7 ambientLightType];

    v9 = [(ATXCategoricalFeatureAmbientLightType *)self featureNameForAWDProactiveAppPredictionAmbientLightType:v8];
  }
  else
  {
    v10 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXCategoricalFeatureAmbientLightType categoricalFeatureValueForContext:candidate:]();
    }

    v9 = @"<Unexpected Category Value>";
  }

  return v9;
}

- (void)featureNameForAWDProactiveAppPredictionAmbientLightType:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_6_3(&dword_1D0FA3000, v2, v3, "%@ - Invalid ambientLightType attempted to be featurized: %d", v4, v5, v6, v7, v8);
}

- (void)categoricalFeatureValueForContext:candidate:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "%@ - Nil ambientLightContext passed in. Returning unexpected category value.", v4, v5, v6, v7, v8);
}

@end