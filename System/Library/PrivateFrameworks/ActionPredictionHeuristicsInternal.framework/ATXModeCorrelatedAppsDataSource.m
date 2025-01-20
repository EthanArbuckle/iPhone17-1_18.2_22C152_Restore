@interface ATXModeCorrelatedAppsDataSource
- (ATXModeCorrelatedAppsDataSource)initWithDevice:(id)a3;
- (void)modeCorrelatedAppsInCurrentModeWithCallback:(id)a3;
@end

@implementation ATXModeCorrelatedAppsDataSource

- (ATXModeCorrelatedAppsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeCorrelatedAppsDataSource;
  v6 = [(ATXModeCorrelatedAppsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)modeCorrelatedAppsInCurrentModeWithCallback:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F93650] currentModeEvent];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 eventBody];
    objc_msgSend(v6, "atx_dndModeSemanticType");

    v7 = [NSNumber numberWithUnsignedInteger:DNDModeSemanticTypeToATXActivityType()];
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 timestamp];
    objc_super v9 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_super v9 = 0;
    v7 = 0;
  }
  v10 = [MEMORY[0x1E4F93658] currentModeEvent];
  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v10 timestamp];
    v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    v13 = v12;
    if (v9)
    {
      [v12 timeIntervalSinceDate:v9];
      if (v14 <= 0.0)
      {
LABEL_13:

        goto LABEL_14;
      }
      v15 = NSNumber;
      v16 = [v10 eventBody];
      [v16 modeType];
      uint64_t v17 = [v15 numberWithUnsignedInteger:BMUserFocusInferredModeTypeToActivity()];

      id v18 = v13;
      v19 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v20 = "ATXModeCorrelatedAppsDataSource: using more recent mode event from inferred stream instead";
LABEL_11:
        _os_log_impl(&dword_1D0F43000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
      }
    }
    else
    {
      v21 = NSNumber;
      v22 = [v10 eventBody];
      [v22 modeType];
      uint64_t v17 = [v21 numberWithUnsignedInteger:BMUserFocusInferredModeTypeToActivity()];

      id v23 = v13;
      v19 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v20 = "ATXModeCorrelatedAppsDataSource: using latest mode event from inferred stream";
        goto LABEL_11;
      }
    }

    objc_super v9 = v13;
    v7 = (void *)v17;
    goto LABEL_13;
  }
LABEL_14:
  if (!v7)
  {
    v27 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = 0;
      _os_log_impl(&dword_1D0F43000, v27, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: user not currently in a mode: %@", buf, 0xCu);
    }

    goto LABEL_22;
  }
  [v7 integerValue];
  uint64_t v24 = ATXModeFromActivityType();
  v25 = __atxlog_handle_heuristic();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24 == 12)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v25, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: user currently in custom mode, returning no apps", buf, 2u);
    }

LABEL_22:
    (*((void (**)(id, void, void, void))v3 + 2))(v3, 0, 0, 0);
    goto LABEL_29;
  }
  if (v26)
  {
    v28 = ATXModeToString();
    *(_DWORD *)buf = 138412290;
    v39 = v28;
    _os_log_impl(&dword_1D0F43000, v25, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: user currently in %@ mode", buf, 0xCu);
  }
  id v29 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v30 = (void *)[v29 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v31 = [v30 objectForKey:@"ATXModeRelevanceScoreThresholdOverride"];

  if (v31)
  {
    [v30 doubleForKey:@"ATXModeRelevanceScoreThresholdOverride"];
    uint64_t v33 = v32;
  }
  else
  {
    uint64_t v33 = 0x3FE4CCCCCCCCCCCDLL;
  }
  v34 = objc_opt_new();
  v35 = [v34 rankedAppsForMode:v24];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __79__ATXModeCorrelatedAppsDataSource_modeCorrelatedAppsInCurrentModeWithCallback___block_invoke;
  v37[3] = &__block_descriptor_40_e36___NSString_16__0__ATXAppModeEntity_8l;
  v37[4] = v33;
  v36 = objc_msgSend(v35, "_pas_mappedArrayWithTransform:", v37);

  (*((void (**)(id, void *, void *, void))v3 + 2))(v3, v36, v9, 0);
LABEL_29:
}

id __79__ATXModeCorrelatedAppsDataSource_modeCorrelatedAppsInCurrentModeWithCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 scoreMetadata];
  [v4 score];
  double v6 = v5;
  double v7 = *(double *)(a1 + 32);

  if (v6 <= v7)
  {
    v12 = 0;
  }
  else
  {
    id v8 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = [v3 bundleId];
      v10 = [v3 scoreMetadata];
      [v10 score];
      int v14 = 138412546;
      v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeCorrelatedAppsDataSource: %@ passes threshold with score: %f", (uint8_t *)&v14, 0x16u);
    }
    v12 = [v3 bundleId];
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end