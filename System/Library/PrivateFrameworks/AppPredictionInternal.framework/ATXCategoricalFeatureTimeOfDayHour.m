@interface ATXCategoricalFeatureTimeOfDayHour
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXCategoricalFeatureTimeOfDayHour

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v4 = a3;
  v5 = [v4 timeContext];

  if (v5)
  {
    v6 = NSNumber;
    v7 = [v4 timeContext];
    v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "timeOfDay"));
    v9 = [v8 stringValue];
  }
  else
  {
    v10 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXCategoricalFeatureTimeOfDayHour categoricalFeatureValueForContext:candidate:]();
    }

    v9 = @"<Unexpected Category Value>";
  }

  return v9;
}

- (void)categoricalFeatureValueForContext:candidate:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "%@ - Nil timeContext passed in. Returning unexpected category value.", v4, v5, v6, v7, v8);
}

@end