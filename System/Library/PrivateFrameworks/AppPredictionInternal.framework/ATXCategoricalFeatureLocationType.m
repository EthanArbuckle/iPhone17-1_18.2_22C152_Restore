@interface ATXCategoricalFeatureLocationType
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
- (id)featureNameForRTLocationOfInterestType:(int64_t)a3;
@end

@implementation ATXCategoricalFeatureLocationType

- (id)featureNameForRTLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 5) {
    return off_1E68B6768[a3 + 1];
  }
  v4 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ATXCategoricalFeatureLocationType featureNameForRTLocationOfInterestType:]();
  }

  return @"<Unexpected Category Value>";
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  v6 = [v5 locationMotionContext];
  v7 = [v6 currentLOI];

  if (v7)
  {
    v8 = [v5 locationMotionContext];
    v9 = [v8 currentLOI];
    uint64_t v10 = [v9 type];

    v11 = [(ATXCategoricalFeatureLocationType *)self featureNameForRTLocationOfInterestType:v10];
  }
  else
  {
    v11 = @"LOI Type NA";
  }

  return v11;
}

- (void)featureNameForRTLocationOfInterestType:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v2, v3, "%@ - Invalid loiType attempted to be featurized: %ld", v4, v5, v6, v7, v8);
}

@end