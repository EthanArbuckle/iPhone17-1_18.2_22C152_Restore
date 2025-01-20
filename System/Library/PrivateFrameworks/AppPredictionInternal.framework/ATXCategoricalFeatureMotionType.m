@interface ATXCategoricalFeatureMotionType
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
- (id)featureNameForATXMotionType:(int64_t)a3;
@end

@implementation ATXCategoricalFeatureMotionType

- (id)featureNameForATXMotionType:(int64_t)a3
{
  if ((unint64_t)a3 < 5) {
    return off_1E68B6790[a3];
  }
  v4 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ATXCategoricalFeatureMotionType featureNameForATXMotionType:]();
  }

  return @"<Unexpected Category Value>";
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  v6 = [v5 locationMotionContext];

  if (v6)
  {
    v7 = [v5 locationMotionContext];
    -[ATXCategoricalFeatureMotionType featureNameForATXMotionType:](self, "featureNameForATXMotionType:", [v7 motionType]);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXCategoricalFeatureMotionType categoricalFeatureValueForContext:candidate:]();
    }

    v8 = @"<Unexpected Category Value>";
  }

  return v8;
}

- (void)featureNameForATXMotionType:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v2, v3, "%@ - Invalid motionType attempted to be featurized: %ld", v4, v5, v6, v7, v8);
}

- (void)categoricalFeatureValueForContext:candidate:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "%@ - Nil locationMotionContext passed in. Returning unexpected category value.", v4, v5, v6, v7, v8);
}

@end