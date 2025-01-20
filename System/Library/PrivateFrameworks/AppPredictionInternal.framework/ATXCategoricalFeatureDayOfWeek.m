@interface ATXCategoricalFeatureDayOfWeek
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
- (id)featureNameForDayOfWeek:(int)a3;
@end

@implementation ATXCategoricalFeatureDayOfWeek

- (id)featureNameForDayOfWeek:(int)a3
{
  if (a3 < 7) {
    return off_1E68B6730[a3];
  }
  v4 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ATXCategoricalFeatureDayOfWeek featureNameForDayOfWeek:]();
  }

  return @"<Unexpected Category Value>";
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  v6 = [v5 timeContext];

  if (v6)
  {
    v7 = [v5 timeContext];
    -[ATXCategoricalFeatureDayOfWeek featureNameForDayOfWeek:](self, "featureNameForDayOfWeek:", [v7 dayOfWeek]);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXCategoricalFeatureTimeOfDayHour categoricalFeatureValueForContext:candidate:]();
    }

    v8 = @"<Unexpected Category Value>";
  }

  return v8;
}

- (void)featureNameForDayOfWeek:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_6_3(&dword_1D0FA3000, v2, v3, "%@ - Invalid day of week attempted to be featurized: %d", v4, v5, v6, v7, v8);
}

@end