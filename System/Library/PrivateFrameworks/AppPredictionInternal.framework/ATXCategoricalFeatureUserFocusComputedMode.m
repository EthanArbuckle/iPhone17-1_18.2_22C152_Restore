@interface ATXCategoricalFeatureUserFocusComputedMode
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
- (id)featureNameForBMUserFocusComputedModeSemanticType:(int)a3;
@end

@implementation ATXCategoricalFeatureUserFocusComputedMode

- (id)featureNameForBMUserFocusComputedModeSemanticType:(int)a3
{
  if ((a3 - 1) < 0xB) {
    return off_1E68B66D8[a3 - 1];
  }
  v4 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ATXCategoricalFeatureUserFocusComputedMode featureNameForBMUserFocusComputedModeSemanticType:]();
  }

  return @"<Unexpected Category Value>";
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  v6 = [v5 userFocusComputedModeEvent];

  if (v6)
  {
    v7 = [v5 userFocusComputedModeEvent];
    uint64_t v8 = [v7 semanticType];

    v9 = [(ATXCategoricalFeatureUserFocusComputedMode *)self featureNameForBMUserFocusComputedModeSemanticType:v8];
  }
  else
  {
    v9 = @"Mode NA";
  }

  return v9;
}

- (void)featureNameForBMUserFocusComputedModeSemanticType:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v2, v3, "%@ - Invalid modeSemanticType attempted to be featurized: %ld", v4, v5, v6, v7, v8);
}

@end