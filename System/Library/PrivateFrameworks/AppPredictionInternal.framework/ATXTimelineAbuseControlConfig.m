@interface ATXTimelineAbuseControlConfig
- (ATXTimelineAbuseControlConfig)init;
- (BOOL)randomizationDisabledForWidgetWithIdentifier:(id)a3 kind:(id)a4;
- (BOOL)shouldUsePersonalizedBudgets;
- (BOOL)stalenessDisabledForWidgetWithIdentifier:(id)a3 kind:(id)a4;
- (NSArray)denyList;
- (NSArray)widgetsExcludedFromPersonalizedQuotaUpdate;
- (NSString)timelineRelevanceABGroup;
- (double)coolDownIntervalForWidgetWithIdentifier:(id)a3 kind:(id)a4;
- (double)durationLimitForWidgetWithIdentifier:(id)a3 kind:(id)a4;
- (int64_t)defaultDurationLimit;
- (int64_t)defaultDurationLimitForDiverseSchemas;
- (int64_t)defaultDurationLimitForLikelyDiverseSchemas;
- (int64_t)defaultDurationLimitForSingleScoreSchemas;
- (int64_t)defaultHardRotationQuota;
- (int64_t)defaultHardRotationQuotaForDiverseSchemas;
- (int64_t)defaultHardRotationQuotaForLikelyDiverseSchemas;
- (int64_t)defaultHardRotationQuotaForSingleScoreSchemas;
- (int64_t)defaultSoftRotationQuota;
- (int64_t)defaultSoftRotationQuotaForDiverseSchemas;
- (int64_t)defaultSoftRotationQuotaForLikelyDiverseSchemas;
- (int64_t)defaultSoftRotationQuotaForSingleScoreSchemas;
- (int64_t)hardRotationQuotaForWidgetWithIdentifier:(id)a3 kind:(id)a4;
- (int64_t)resolvedValueForConfigWithKey:(id)a3 forWidgetWithIdentifier:(id)a4 kind:(id)a5;
- (int64_t)softRotationQuotaForWidgetWithIdentifier:(id)a3 kind:(id)a4;
- (unint64_t)defaultDurationForFallbackTimelineSuggestions;
- (unint64_t)defaultDurationForTimelineSuggestions;
- (unint64_t)minimumSecondsBetweenMetadataUpdatesPerSource;
- (unint64_t)timelineUpdateLimitPerAppBundleId;
- (unint64_t)timelineUpdateLimitPerSource;
- (void)setDefaultHardRotationQuotaForDiverseSchemas:(int64_t)a3;
- (void)setDefaultSoftRotationQuotaForDiverseSchemas:(int64_t)a3;
- (void)setTimelineRelevanceABGroup:(id)a3;
- (void)setWidgetsExcludedFromPersonalizedQuotaUpdate:(id)a3;
@end

@implementation ATXTimelineAbuseControlConfig

- (ATXTimelineAbuseControlConfig)init
{
  v70.receiver = self;
  v70.super_class = (Class)ATXTimelineAbuseControlConfig;
  v2 = [(ATXTimelineAbuseControlConfig *)&v70 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryForClass:objc_opt_class()];
    config = v2->_config;
    v2->_config = (NSDictionary *)v3;

    v5 = v2->_config;
    if (v5)
    {
      uint64_t v6 = [(NSDictionary *)v5 objectForKeyedSubscript:@"DenyList"];
      v7 = (void *)v6;
      v8 = (void *)MEMORY[0x1E4F1CBF0];
      if (v6) {
        v9 = (void *)v6;
      }
      else {
        v9 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&v2->_denyList, v9);

      uint64_t v10 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"WidgetsExcludedFromPersonalizedQuotaUpdate"];
      v11 = (void *)v10;
      if (v10) {
        v12 = (void *)v10;
      }
      else {
        v12 = v8;
      }
      objc_storeStrong((id *)&v2->_widgetsExcludedFromPersonalizedQuotaUpdate, v12);

      uint64_t v13 = [(NSDictionary *)v2->_config objectForKey:@"abGroup"];
      v14 = (void *)v13;
      if (v13) {
        v15 = (__CFString *)v13;
      }
      else {
        v15 = @"default";
      }
      objc_storeStrong((id *)&v2->_timelineRelevanceABGroup, v15);

      v16 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"MinimumSecondsBetweenMetadataUpdatesPerSource"];
      uint64_t v17 = [v16 unsignedIntegerValue];
      uint64_t v18 = 60;
      if (v17) {
        uint64_t v18 = v17;
      }
      v2->_minimumSecondsBetweenMetadataUpdatesPerSource = v18;

      v19 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"TimelineUpdateLimitPerSource"];
      uint64_t v20 = [v19 unsignedIntegerValue];
      uint64_t v21 = 100;
      if (v20) {
        uint64_t v21 = v20;
      }
      v2->_timelineUpdateLimitPerSource = v21;

      v22 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"TimelineUpdateLimitPerAppBundleId"];
      uint64_t v23 = [v22 unsignedIntegerValue];
      uint64_t v24 = 300;
      if (v23) {
        uint64_t v24 = v23;
      }
      v2->_timelineUpdateLimitPerAppBundleId = v24;

      v25 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"DefaultDurationForTimelineSuggestions"];
      uint64_t v26 = [v25 unsignedIntegerValue];
      uint64_t v27 = 3600;
      if (v26) {
        uint64_t v27 = v26;
      }
      v2->_defaultDurationForTimelineSuggestions = v27;

      v28 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"DefaultDurationForFallbackTimelineSuggestions"];
      uint64_t v29 = [v28 unsignedIntegerValue];
      uint64_t v30 = 86400;
      if (v29) {
        uint64_t v30 = v29;
      }
      v2->_defaultDurationForFallbackTimelineSuggestions = v30;

      v31 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"SoftRotationQuota"];
      unint64_t v32 = [v31 integerValue];
      if (v32 <= 1) {
        uint64_t v33 = 1;
      }
      else {
        uint64_t v33 = v32;
      }
      v2->_defaultSoftRotationQuota = v33;

      v34 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"HardRotationQuota"];
      uint64_t v35 = [v34 integerValue];
      if (v35) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = 2;
      }
      v2->_defaultHardRotationQuota = v36;

      v37 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"SoftRotationQuotaForSingleScoreSchemas"];
      unint64_t v38 = [v37 integerValue];
      if (v38 <= 1) {
        uint64_t v39 = 1;
      }
      else {
        uint64_t v39 = v38;
      }
      v2->_defaultSoftRotationQuotaForSingleScoreSchemas = v39;

      v40 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"HardRotationQuotaForSingleScoreSchemas"];
      uint64_t v41 = [v40 integerValue];
      if (v41) {
        uint64_t v42 = v41;
      }
      else {
        uint64_t v42 = 2;
      }
      v2->_defaultHardRotationQuotaForSingleScoreSchemas = v42;

      v43 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"SoftRotationQuotaForLikelyDiverseSchemas"];
      uint64_t v44 = [v43 integerValue];
      uint64_t v45 = 3;
      if (v44) {
        uint64_t v45 = v44;
      }
      v2->_defaultSoftRotationQuotaForLikelyDiverseSchemas = v45;

      v46 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"HardRotationQuotaForLikelyDiverseSchemas"];
      uint64_t v47 = [v46 integerValue];
      uint64_t v48 = 4;
      if (v47) {
        uint64_t v48 = v47;
      }
      v2->_defaultHardRotationQuotaForLikelyDiverseSchemas = v48;

      v49 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"SoftRotationQuotaForDiverseSchemas"];
      uint64_t v50 = [v49 integerValue];
      uint64_t v51 = 5;
      if (v50) {
        uint64_t v51 = v50;
      }
      v2->_defaultSoftRotationQuotaForDiverseSchemas = v51;

      v52 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"HardRotationQuotaForDiverseSchemas"];
      uint64_t v53 = [v52 integerValue];
      uint64_t v54 = 6;
      if (v53) {
        uint64_t v54 = v53;
      }
      v2->_defaultHardRotationQuotaForDiverseSchemas = v54;

      v55 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"Duration"];
      uint64_t v56 = [v55 integerValue];
      if (v56) {
        uint64_t v57 = v56;
      }
      else {
        uint64_t v57 = 900;
      }
      v2->_defaultDurationLimit = v57;

      v58 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"DurationLimitForSingleScoreSchemas"];
      uint64_t v59 = [v58 integerValue];
      if (v59) {
        uint64_t v60 = v59;
      }
      else {
        uint64_t v60 = 900;
      }
      v2->_defaultDurationLimitForSingleScoreSchemas = v60;

      v61 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"DurationLimitForLikelyDiverseSchemas"];
      uint64_t v62 = [v61 integerValue];
      if (v62) {
        uint64_t v63 = v62;
      }
      else {
        uint64_t v63 = 1800;
      }
      v2->_defaultDurationLimitForLikelyDiverseSchemas = v63;

      v64 = [(NSDictionary *)v2->_config objectForKeyedSubscript:@"DurationLimitForDiverseSchemas"];
      uint64_t v65 = [v64 integerValue];
      if (v65) {
        uint64_t v66 = v65;
      }
      else {
        uint64_t v66 = 1800;
      }
      v2->_defaultDurationLimitForDiverseSchemas = v66;

      uint64_t v67 = objc_opt_new();
      personalizedConfig = v2->_personalizedConfig;
      v2->_personalizedConfig = (ATXTimelineRelevancePersonalizedConfig *)v67;
    }
  }
  return v2;
}

- (int64_t)softRotationQuotaForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return [(ATXTimelineAbuseControlConfig *)self resolvedValueForConfigWithKey:@"SoftRotationQuota" forWidgetWithIdentifier:a3 kind:a4];
}

- (int64_t)hardRotationQuotaForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return [(ATXTimelineAbuseControlConfig *)self resolvedValueForConfigWithKey:@"HardRotationQuota" forWidgetWithIdentifier:a3 kind:a4];
}

- (double)durationLimitForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return (double)[(ATXTimelineAbuseControlConfig *)self resolvedValueForConfigWithKey:@"Duration" forWidgetWithIdentifier:a3 kind:a4];
}

- (double)coolDownIntervalForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return (double)[(ATXTimelineAbuseControlConfig *)self resolvedValueForConfigWithKey:@"CoolDown" forWidgetWithIdentifier:a3 kind:a4];
}

- (BOOL)randomizationDisabledForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return [(ATXTimelineAbuseControlConfig *)self resolvedValueForConfigWithKey:@"RandomizationDisabled" forWidgetWithIdentifier:a3 kind:a4] != 0;
}

- (BOOL)stalenessDisabledForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return [(ATXTimelineAbuseControlConfig *)self resolvedValueForConfigWithKey:@"StalenessDisabled" forWidgetWithIdentifier:a3 kind:a4] != 0;
}

- (BOOL)shouldUsePersonalizedBudgets
{
  return [(NSString *)self->_timelineRelevanceABGroup isEqualToString:@"default"];
}

- (int64_t)resolvedValueForConfigWithKey:(id)a3 forWidgetWithIdentifier:(id)a4 kind:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ATXTimelineRelevancePersonalizedConfig *)self->_personalizedConfig personalizedValueForParameter:v8 forWidgetBundleIdentifier:v9 kind:v10];
  if ([(ATXTimelineAbuseControlConfig *)self shouldUsePersonalizedBudgets] && v11)
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 138413058;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "Using personalized %@ for widgetBundleId: %@, widgetKind: %@: %@", (uint8_t *)&v19, 0x2Au);
    }

    int64_t v13 = [v11 integerValue];
  }
  else
  {
    v14 = [(NSDictionary *)self->_config objectForKeyedSubscript:v9];
    config = [v14 objectForKeyedSubscript:v10];
    v16 = config;
    if (!config)
    {
      if (v14) {
        config = v14;
      }
      else {
        config = self->_config;
      }
    }
    uint64_t v17 = [config objectForKeyedSubscript:v8];
    int64_t v13 = [v17 integerValue];
  }
  return v13;
}

- (NSArray)denyList
{
  return self->_denyList;
}

- (unint64_t)minimumSecondsBetweenMetadataUpdatesPerSource
{
  return self->_minimumSecondsBetweenMetadataUpdatesPerSource;
}

- (unint64_t)timelineUpdateLimitPerSource
{
  return self->_timelineUpdateLimitPerSource;
}

- (unint64_t)timelineUpdateLimitPerAppBundleId
{
  return self->_timelineUpdateLimitPerAppBundleId;
}

- (unint64_t)defaultDurationForTimelineSuggestions
{
  return self->_defaultDurationForTimelineSuggestions;
}

- (unint64_t)defaultDurationForFallbackTimelineSuggestions
{
  return self->_defaultDurationForFallbackTimelineSuggestions;
}

- (int64_t)defaultSoftRotationQuota
{
  return self->_defaultSoftRotationQuota;
}

- (int64_t)defaultHardRotationQuota
{
  return self->_defaultHardRotationQuota;
}

- (int64_t)defaultSoftRotationQuotaForSingleScoreSchemas
{
  return self->_defaultSoftRotationQuotaForSingleScoreSchemas;
}

- (int64_t)defaultHardRotationQuotaForSingleScoreSchemas
{
  return self->_defaultHardRotationQuotaForSingleScoreSchemas;
}

- (int64_t)defaultSoftRotationQuotaForLikelyDiverseSchemas
{
  return self->_defaultSoftRotationQuotaForLikelyDiverseSchemas;
}

- (int64_t)defaultHardRotationQuotaForLikelyDiverseSchemas
{
  return self->_defaultHardRotationQuotaForLikelyDiverseSchemas;
}

- (int64_t)defaultSoftRotationQuotaForDiverseSchemas
{
  return self->_defaultSoftRotationQuotaForDiverseSchemas;
}

- (void)setDefaultSoftRotationQuotaForDiverseSchemas:(int64_t)a3
{
  self->_defaultSoftRotationQuotaForDiverseSchemas = a3;
}

- (int64_t)defaultHardRotationQuotaForDiverseSchemas
{
  return self->_defaultHardRotationQuotaForDiverseSchemas;
}

- (void)setDefaultHardRotationQuotaForDiverseSchemas:(int64_t)a3
{
  self->_defaultHardRotationQuotaForDiverseSchemas = a3;
}

- (int64_t)defaultDurationLimit
{
  return self->_defaultDurationLimit;
}

- (int64_t)defaultDurationLimitForSingleScoreSchemas
{
  return self->_defaultDurationLimitForSingleScoreSchemas;
}

- (int64_t)defaultDurationLimitForLikelyDiverseSchemas
{
  return self->_defaultDurationLimitForLikelyDiverseSchemas;
}

- (int64_t)defaultDurationLimitForDiverseSchemas
{
  return self->_defaultDurationLimitForDiverseSchemas;
}

- (NSArray)widgetsExcludedFromPersonalizedQuotaUpdate
{
  return self->_widgetsExcludedFromPersonalizedQuotaUpdate;
}

- (void)setWidgetsExcludedFromPersonalizedQuotaUpdate:(id)a3
{
}

- (NSString)timelineRelevanceABGroup
{
  return self->_timelineRelevanceABGroup;
}

- (void)setTimelineRelevanceABGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyList, 0);
  objc_storeStrong((id *)&self->_personalizedConfig, 0);
  objc_storeStrong((id *)&self->_widgetsExcludedFromPersonalizedQuotaUpdate, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceABGroup, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end