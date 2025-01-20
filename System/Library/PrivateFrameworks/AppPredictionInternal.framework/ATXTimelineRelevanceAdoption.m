@interface ATXTimelineRelevanceAdoption
- (ATXTimelineRelevanceAdoption)init;
- (ATXTimelineRelevanceAdoption)initWithGlobalAdoptionPlist:(id)a3 informationStore:(id)a4 abuseControlConfig:(id)a5;
- (BOOL)_hasDiverseSchemaGlobally:(id)a3 kind:(id)a4;
- (id)globalDiverseSchemaRawNumber:(id)a3 kind:(id)a4;
- (unint64_t)adoptionTypeForWidgetBundleId:(id)a3 kind:(id)a4;
- (void)_updateQuotasDictionary:(id)a3 forWidgetBundleId:(id)a4 widgetKind:(id)a5 parameterName:(id)a6 withValue:(int64_t)a7;
- (void)_updateQuotasForWidgetBundleId:(id)a3 widgetKind:(id)a4 quotasDictionary:(id)a5;
- (void)persistQuotasWithActivity:(id)a3;
- (void)trainWidgetPredictionModelWithActivity:(id)a3;
@end

@implementation ATXTimelineRelevanceAdoption

- (ATXTimelineRelevanceAdoption)init
{
  v3 = [MEMORY[0x1E4F4AF08] dictionaryFromLazyPlistForClass:objc_opt_class()];
  v4 = [MEMORY[0x1E4F4B0E8] sharedInstance];
  v5 = objc_opt_new();
  v6 = [(ATXTimelineRelevanceAdoption *)self initWithGlobalAdoptionPlist:v3 informationStore:v4 abuseControlConfig:v5];

  return v6;
}

- (ATXTimelineRelevanceAdoption)initWithGlobalAdoptionPlist:(id)a3 informationStore:(id)a4 abuseControlConfig:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXTimelineRelevanceAdoption;
  v12 = [(ATXTimelineRelevanceAdoption *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_globalAdoptionPlist, a3);
    if (v11)
    {
      objc_storeStrong((id *)&v13->_abuseControlConfig, a5);
      v14 = [[ATXAdoptionTypeToBudgetMapper alloc] initWithAbuseControlConfig:v11];
      budgetMapper = v13->_budgetMapper;
      v13->_budgetMapper = v14;
    }
    objc_storeStrong((id *)&v13->_informationStore, a4);
    uint64_t v16 = [(ATXInformationStore *)v13->_informationStore fetchDistinctScoreCountForWidgets];
    distinctScoreCounts = v13->_distinctScoreCounts;
    v13->_distinctScoreCounts = (NSDictionary *)v16;
  }
  return v13;
}

- (unint64_t)adoptionTypeForWidgetBundleId:(id)a3 kind:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(ATXTimelineRelevanceAdoption *)self _hasDiverseSchemaGlobally:v7 kind:v6];
  id v9 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v7 second:v6];

  id v10 = [(NSDictionary *)self->_distinctScoreCounts objectForKeyedSubscript:v9];
  id v11 = v10;
  if (v10 && [v10 integerValue])
  {
    uint64_t v12 = [v11 integerValue];
    char v13 = v12 > 1 || v8;
    if (v12 <= 1) {
      unint64_t v14 = 2;
    }
    else {
      unint64_t v14 = 3;
    }
    if ((v13 & 1) == 0) {
      unint64_t v14 = [v11 integerValue] == 1;
    }
  }
  else if (v8)
  {
    unint64_t v14 = 2;
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)_hasDiverseSchemaGlobally:(id)a3 kind:(id)a4
{
  v4 = [(ATXTimelineRelevanceAdoption *)self globalDiverseSchemaRawNumber:a3 kind:a4];
  BOOL v5 = [v4 integerValue] == 1;

  return v5;
}

- (id)globalDiverseSchemaRawNumber:(id)a3 kind:(id)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    globalAdoptionPlist = self->_globalAdoptionPlist;
    id v7 = a4;
    BOOL v8 = [(NSDictionary *)globalAdoptionPlist objectForKeyedSubscript:a3];
    id v9 = [v8 objectForKeyedSubscript:v7];

    if (v9)
    {
      v4 = [v9 objectForKeyedSubscript:@"diverseScores"];
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (void)_updateQuotasForWidgetBundleId:(id)a3 widgetKind:(id)a4 quotasDictionary:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ATXTimelineAbuseControlConfig *)self->_abuseControlConfig widgetsExcludedFromPersonalizedQuotaUpdate];
  char v11 = [v10 containsObject:v22];

  if ((v11 & 1) == 0)
  {
    int64_t v12 = [(ATXTimelineAbuseControlConfig *)self->_abuseControlConfig softRotationQuotaForWidgetWithIdentifier:v22 kind:v8];
    int64_t v13 = [(ATXTimelineAbuseControlConfig *)self->_abuseControlConfig hardRotationQuotaForWidgetWithIdentifier:v22 kind:v8];
    [(ATXTimelineAbuseControlConfig *)self->_abuseControlConfig durationLimitForWidgetWithIdentifier:v22 kind:v8];
    double v15 = v14;
    unint64_t v16 = [(ATXTimelineRelevanceAdoption *)self adoptionTypeForWidgetBundleId:v22 kind:v8];
    int64_t v17 = [(ATXAdoptionTypeToBudgetMapper *)self->_budgetMapper softQuotaForAdoptionType:v16];
    int64_t v18 = [(ATXAdoptionTypeToBudgetMapper *)self->_budgetMapper hardQuotaForAdoptionType:v16];
    int64_t v19 = [(ATXAdoptionTypeToBudgetMapper *)self->_budgetMapper durationLimitForAdoptionType:v16];
    if (v12 != -1 && v12 < v17) {
      [(ATXTimelineRelevanceAdoption *)self _updateQuotasDictionary:v9 forWidgetBundleId:v22 widgetKind:v8 parameterName:@"SoftRotationQuota" withValue:v17];
    }
    uint64_t v20 = (uint64_t)v15;
    if (v13 != -1 && v13 < v18) {
      [(ATXTimelineRelevanceAdoption *)self _updateQuotasDictionary:v9 forWidgetBundleId:v22 widgetKind:v8 parameterName:@"HardRotationQuota" withValue:v18];
    }
    if (v20 != -1 && v19 > v20) {
      [(ATXTimelineRelevanceAdoption *)self _updateQuotasDictionary:v9 forWidgetBundleId:v22 widgetKind:v8 parameterName:@"Duration" withValue:v19];
    }
  }
}

- (void)_updateQuotasDictionary:(id)a3 forWidgetBundleId:(id)a4 widgetKind:(id)a5 parameterName:(id)a6 withValue:(int64_t)a7
{
  id v24 = a3;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = v12;
  if (v11 && v12)
  {
    id v14 = a6;
    double v15 = [v24 objectForKeyedSubscript:v11];

    if (!v15)
    {
      unint64_t v16 = objc_opt_new();
      [v24 setObject:v16 forKeyedSubscript:v11];
    }
    int64_t v17 = [v24 objectForKeyedSubscript:v11];
    int64_t v18 = [v17 objectForKeyedSubscript:v13];

    if (!v18)
    {
      int64_t v19 = objc_opt_new();
      uint64_t v20 = [v24 objectForKeyedSubscript:v11];
      [v20 setObject:v19 forKeyedSubscript:v13];
    }
    v21 = [NSNumber numberWithInteger:a7];
    id v22 = [v24 objectForKeyedSubscript:v11];
    v23 = [v22 objectForKeyedSubscript:v13];
    [v23 setObject:v21 forKeyedSubscript:v14];
  }
}

- (void)persistQuotasWithActivity:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_distinctScoreCounts)
  {
    id v6 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = self->_distinctScoreCounts;
    uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          int64_t v13 = [v12 first];
          id v14 = [v12 second];
          [(ATXTimelineRelevanceAdoption *)self _updateQuotasForWidgetBundleId:v13 widgetKind:v14 quotasDictionary:v6];
        }
        uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    if ([v5 didDefer])
    {
      double v15 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevanceAdoption: Deferring persisting personalized quotas", buf, 2u);
      }
    }
    else
    {
      unint64_t v16 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXTimelineRelevancePersonalizedConfig"];
      int64_t v17 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v16;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceAdoption: persisting updated quotas at path: %{public}@", buf, 0xCu);
      }

      int64_t v18 = (void *)MEMORY[0x1D25F6CC0]();
      id v29 = 0;
      int64_t v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v29];
      id v20 = v29;
      if (!v19)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2, self, @"ATXTimelineRelevanceAdoption.m", 163, @"Archiver error while attempting to persist updated quotas at path %@: %@", v16, v20 object file lineNumber description];
      }
      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_BACKGROUND, 0);
      v23 = dispatch_queue_create("timeline-relevance-budget-update", v22);

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke;
      block[3] = &unk_1E68AB870;
      id v27 = v19;
      double v15 = v16;
      v28 = v15;
      id v24 = v19;
      dispatch_async(v23, block);
    }
  }
  else
  {
    id v6 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXTimelineRelevanceAdoption persistQuotasWithActivity:](v6);
    }
  }
}

void __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  id v8 = 0;
  char v4 = [v3 writeToFile:v1 options:1073741825 error:&v8];
  id v5 = v8;
  if (v4)
  {
    id v6 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *v2;
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Successfully updated budgets at path %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke_cold_1(v2, (uint64_t)v5, v6);
    }
  }
}

- (void)trainWidgetPredictionModelWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXWidgetPredictionTrainer alloc] initWithInformationStore:self->_informationStore distinctScoreCounts:self->_distinctScoreCounts];
  [(ATXWidgetPredictionTrainer *)v5 trainWidgetPredictionModelWithActivity:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetMapper, 0);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_distinctScoreCounts, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_globalAdoptionPlist, 0);
}

- (void)persistQuotasWithActivity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXTimelineRelevanceAdoption: Unable to calculate updated quotas since there was a problem fetching distinct count of timeline relevance scores", v1, 2u);
}

void __58__ATXTimelineRelevanceAdoption_persistQuotasWithActivity___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Could not write updated budgets to path: %{public}@. Error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end