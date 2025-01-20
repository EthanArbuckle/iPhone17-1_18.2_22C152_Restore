@interface ATXLockscreenMetricsCollector
- (id)_configurationMetricFromPosterConfiguration:(id)a3 lockscreenId:(id)a4 modeClient:(id)a5;
- (id)_dailyMetricsDescriptionGivenConfigurationMetrics:(id)a3 widgetMetrics:(id)a4 summaryMetric:(id)a5;
- (id)_dailyMetricsDescription_shouldPost:(BOOL)a3;
- (id)_weeklyRollingIdFromLockscreenId:(id)a3;
- (id)_widgetMetricFromComplication:(id)a3 lockscreenId:(id)a4 isLandscape:(BOOL)a5;
- (id)dailyMetricsDescription;
- (void)_fillSummaryMetric:(id)a3 configurations:(id)a4;
- (void)_postConfigurationMetrics:(id)a3 widgetMetrics:(id)a4 summaryMetric:(id)a5;
- (void)postDailyMetrics;
- (void)postEditMetricWithEvent:(id)a3;
- (void)postSwitchMetricWithEvent:(id)a3;
@end

@implementation ATXLockscreenMetricsCollector

- (void)postDailyMetrics
{
  id v2 = [(ATXLockscreenMetricsCollector *)self _dailyMetricsDescription_shouldPost:1];
}

- (id)dailyMetricsDescription
{
  return [(ATXLockscreenMetricsCollector *)self _dailyMetricsDescription_shouldPost:0];
}

- (void)postSwitchMetricWithEvent:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_opt_new();
  v5 = [v4 lockscreenId];
  v6 = [(ATXLockscreenMetricsCollector *)self _weeklyRollingIdFromLockscreenId:v5];
  [v10 setLockscreenId:v6];

  v7 = [v4 switchMechanism];
  [v10 setSwitchMechanism:v7];

  v8 = [v4 outcome];
  [v10 setOutcome:v8];

  uint64_t v9 = [v4 duration];
  [v10 setDuration:v9];
  [v10 logToCoreAnalytics];
}

- (void)postEditMetricWithEvent:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_opt_new();
  v5 = [v4 lockscreenId];
  v6 = [(ATXLockscreenMetricsCollector *)self _weeklyRollingIdFromLockscreenId:v5];
  [v10 setLockscreenId:v6];

  v7 = [v4 entryPoint];
  [v10 setEntryPoint:v7];

  objc_msgSend(v10, "setIsNew:", objc_msgSend(v4, "isNewlyCreated"));
  objc_msgSend(v10, "setSecondsSinceLastEdit:", objc_msgSend(v4, "secondsSinceLastEdit"));
  v8 = [v4 outcome];
  [v10 setOutcome:v8];

  objc_msgSend(v10, "setDuration:", objc_msgSend(v4, "duration"));
  objc_msgSend(v10, "setUserChangedColor:", objc_msgSend(v4, "userChangedColor"));
  objc_msgSend(v10, "setUserChangedFont:", objc_msgSend(v4, "userChangedFont"));
  objc_msgSend(v10, "setUserChangedNumberingSystem:", objc_msgSend(v4, "userChangedNumberingSystem"));
  objc_msgSend(v10, "setUserChangedPosterContent:", objc_msgSend(v4, "userChangedPosterContent"));
  objc_msgSend(v10, "setUserChangedWidgets:", objc_msgSend(v4, "userChangedWidgets"));
  uint64_t v9 = [v4 didLockscreenHaveWidgetsBeforeEdit];

  [v10 setDidLockscreenHaveWidgetsBeforeEdit:v9];
  [v10 logToCoreAnalytics];
}

- (id)_dailyMetricsDescription_shouldPost:(BOOL)a3
{
  BOOL v28 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = +[ATXPosterConfigurationCache sharedInstance];
  v5 = [v4 configurations];

  v32 = objc_opt_new();
  v6 = objc_opt_new();
  v27 = objc_opt_new();
  -[ATXLockscreenMetricsCollector _fillSummaryMetric:configurations:](self, "_fillSummaryMetric:configurations:");
  v31 = [MEMORY[0x1E4F4AF78] sharedInstance];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v5;
  uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v33)
  {
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v9 = [v8 posterUUID];
        id v10 = [(ATXLockscreenMetricsCollector *)self _weeklyRollingIdFromLockscreenId:v9];

        v35 = [(ATXLockscreenMetricsCollector *)self _configurationMetricFromPosterConfiguration:v8 lockscreenId:v10 modeClient:v31];
        objc_msgSend(v32, "addObject:");
        v11 = [v8 inlineComplication];
        uint64_t v12 = [(ATXLockscreenMetricsCollector *)self _widgetMetricFromComplication:v11 lockscreenId:v10 isLandscape:0];

        if (v12) {
          [v6 addObject:v12];
        }
        v34 = (void *)v12;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v13 = [v8 complications];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v41 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = [(ATXLockscreenMetricsCollector *)self _widgetMetricFromComplication:*(void *)(*((void *)&v40 + 1) + 8 * j) lockscreenId:v10 isLandscape:0];
              if (v18) {
                [v6 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v15);
        }

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v19 = [v8 landscapeComplications];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if (*(void *)v37 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = [(ATXLockscreenMetricsCollector *)self _widgetMetricFromComplication:*(void *)(*((void *)&v36 + 1) + 8 * k) lockscreenId:v10 isLandscape:1];
              if (v24) {
                [v6 addObject:v24];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v21);
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v33);
  }

  if (v28) {
    [(ATXLockscreenMetricsCollector *)self _postConfigurationMetrics:v32 widgetMetrics:v6 summaryMetric:v27];
  }
  v25 = [(ATXLockscreenMetricsCollector *)self _dailyMetricsDescriptionGivenConfigurationMetrics:v32 widgetMetrics:v6 summaryMetric:v27];

  return v25;
}

- (id)_configurationMetricFromPosterConfiguration:(id)a3 lockscreenId:(id)a4 modeClient:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new();
  [v10 setLockscreenId:v9];

  v11 = [v7 font];
  [v10 setFont:v11];

  uint64_t v12 = [v7 color];
  [v10 setColor:v12];

  v13 = [v7 numberingSystem];
  [v10 setNumberingSystem:v13];

  uint64_t v14 = [v7 complications];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    uint64_t v16 = [v7 complications];
    objc_msgSend(v10, "setNumWidgets:", objc_msgSend(v16, "count"));
  }
  v17 = [v7 landscapeComplications];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = [v7 landscapeComplications];
    objc_msgSend(v10, "setNumLandscapeWidgets:", objc_msgSend(v19, "count"));
  }
  [v10 setHasCustomInlineComplication:0];
  uint64_t v20 = [v7 inlineComplication];

  if (v20) {
    [v10 setHasCustomInlineComplication:1];
  }
  uint64_t v21 = [v7 galleryItem];
  objc_msgSend(v10, "setSource:", objc_msgSend(v21, "source"));

  uint64_t v22 = [v7 extensionBundleIdentifier];
  [v10 setExtensionBundleId:v22];

  if ([v7 isActive])
  {
    [v10 setIsSelected:1];
  }
  else
  {
    id v23 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v24 = (void *)[v23 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    v25 = [v24 dictionaryForKey:*MEMORY[0x1E4F4B760]];
    v26 = [v7 posterUUID];
    v27 = [v25 objectForKeyedSubscript:v26];

    if (v27)
    {
      BOOL v28 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v29 = objc_opt_new();
      uint64_t v30 = [v28 dateByAddingUnit:16 value:-7 toDate:v29 options:0];

      if ([v30 compare:v27] == -1) {
        [v10 setIsSelected:1];
      }
    }
  }
  v31 = [v7 modeUUID];
  if (v31)
  {
    v32 = [v8 modeConfigurationForDNDModeWithUUID:v31];
    uint64_t v33 = v32;
    if (v32)
    {
      v34 = [v32 mode];

      if (v34)
      {
        v35 = [v33 mode];
        [v35 semanticType];
        long long v36 = DNDModeSemanticTypeToString();
        [v10 setRelatedFocus:v36];
      }
    }
  }
  return v10;
}

- (id)_widgetMetricFromComplication:(id)a3 lockscreenId:(id)a4 isLandscape:(BOOL)a5
{
  v5 = a3;
  if (a3)
  {
    BOOL v6 = a5;
    id v7 = a4;
    id v8 = v5;
    v5 = objc_opt_new();
    [v5 setLockscreenId:v7];

    id v9 = [v8 extensionBundleIdentifier];
    [v5 setExtensionBundleId:v9];

    id v10 = [v8 kind];
    [v5 setKind:v10];

    objc_msgSend(v5, "setFamily:", objc_msgSend(v8, "widgetFamily"));
    LODWORD(v10) = [v8 source];

    [v5 setSource:(int)v10];
    [v5 setIsLandscape:v6];
  }
  return v5;
}

- (void)_postConfigurationMetrics:(id)a3 widgetMetrics:(id)a4 summaryMetric:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v13++) logToCoreAnalytics];
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "logToCoreAnalytics", (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  [v9 logToCoreAnalytics];
}

- (id)_dailyMetricsDescriptionGivenConfigurationMetrics:(id)a3 widgetMetrics:(id)a4 summaryMetric:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  if ([v7 count])
  {
    [v10 appendString:@"\n------------------------------------------------------\n"];
    uint64_t v11 = [v7 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 metricName];
    [v10 appendString:v12];

    [v10 appendString:@"\n"];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v37 + 1) + 8 * i) coreAnalyticsDictionary];
        long long v19 = [v18 description];
        [v10 appendString:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v15);
  }

  if ([v8 count])
  {
    [v10 appendString:@"\n------------------------------------------------------\n"];
    long long v20 = [v8 objectAtIndexedSubscript:0];
    long long v21 = [v20 metricName];
    [v10 appendString:v21];

    [v10 appendString:@"\n"];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v8;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "coreAnalyticsDictionary", (void)v33);
        BOOL v28 = [v27 description];
        [v10 appendString:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v24);
  }

  [v10 appendString:@"\n------------------------------------------------------\n"];
  uint64_t v29 = [v9 metricName];
  [v10 appendString:v29];

  [v10 appendString:@"\n"];
  uint64_t v30 = [v9 coreAnalyticsDictionary];
  v31 = [v30 description];
  [v10 appendString:v31];

  return v10;
}

- (void)_fillSummaryMetric:(id)a3 configurations:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  if (([v7 BOOLForKey:*MEMORY[0x1E4F4B740]] & 1) == 0)
  {
    uint64_t v10 = v16;
    uint64_t v11 = 0;
LABEL_8:
    [v10 setEditingUiExperienced:v11];
    goto LABEL_9;
  }
  [v16 setEditingUiExperienced:2];
  if (![v5 count])
  {
    uint64_t v10 = v16;
    uint64_t v11 = 1;
    goto LABEL_8;
  }
  if ([v5 count] != 1) {
    goto LABEL_9;
  }
  id v8 = [v5 objectAtIndexedSubscript:0];
  id v9 = [v8 extensionBundleIdentifier];
  if ([v9 isEqualToString:@"com.apple.PaperBoard.LegacyPoster"])
  {

    goto LABEL_13;
  }
  uint64_t v12 = [v8 extensionBundleIdentifier];
  int v13 = [v12 isEqualToString:@"com.apple.WallpaperKit.CollectionsPoster"];

  if (v13)
  {
LABEL_13:
    uint64_t v14 = [v8 complications];
    if ([v14 count])
    {
    }
    else
    {
      uint64_t v15 = [v8 inlineComplication];

      if (!v15) {
        [v16 setEditingUiExperienced:1];
      }
    }
  }

LABEL_9:
}

- (id)_weeklyRollingIdFromLockscreenId:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = 0;
  [v5 rangeOfUnit:0x2000 startDate:&v12 interval:0 forDate:v6];
  id v7 = v12;
  uint64_t v8 = [v4 hash];

  uint64_t v9 = [v7 hash];
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v9 - v8 + 32 * v8);

  return v10;
}

@end