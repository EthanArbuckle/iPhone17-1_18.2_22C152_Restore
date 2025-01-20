@interface ATXInterruptedAppSessionAccumulator
- (ATXInterruptedAppSessionAccumulator)init;
- (BOOL)_doesLaunchInterruptPreviousLaunch:(id)a3;
- (id)_getSummaryMetricForDimensions:(id)a3;
- (id)countedSetContainingInterruptingAppBundleIds;
- (unint64_t)numberOfInterruptingAppSessions;
- (void)handleEndOfStream;
- (void)handleNextAppLaunch:(id)a3 dimensionSet:(id)a4;
- (void)handleNotificationEvent:(id)a3;
- (void)logToCoreAnalytics;
@end

@implementation ATXInterruptedAppSessionAccumulator

- (ATXInterruptedAppSessionAccumulator)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXInterruptedAppSessionAccumulator;
  v2 = [(ATXInterruptedAppSessionAccumulator *)&v12 init];
  v3 = v2;
  if (v2)
  {
    previousDimensions = v2->_previousDimensions;
    v2->_previousDimensions = 0;

    uint64_t v5 = objc_opt_new();
    appSessions = v3->_appSessions;
    v3->_appSessions = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    summaryMetrics = v3->_summaryMetrics;
    v3->_summaryMetrics = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    recentNotifications = v3->_recentNotifications;
    v3->_recentNotifications = (NSMutableDictionary *)v9;
  }
  return v3;
}

- (void)handleNotificationEvent:(id)a3
{
  id v10 = a3;
  v4 = [v10 notification];
  uint64_t v5 = [v4 bundleID];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = (void *)v5;
  if (![v10 eventType])
  {

    goto LABEL_6;
  }
  uint64_t v7 = [v10 eventType];

  if (v7 == 16)
  {
LABEL_6:
    recentNotifications = self->_recentNotifications;
    v4 = [v10 notification];
    uint64_t v9 = [v4 bundleID];
    [(NSMutableDictionary *)recentNotifications setObject:v10 forKeyedSubscript:v9];

LABEL_7:
  }
}

- (void)handleNextAppLaunch:(id)a3 dimensionSet:(id)a4
{
  id v22 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_previousLaunch && self->_previousDimensions)
  {
    id v21 = v7;
    uint64_t v9 = -[ATXInterruptedAppSessionAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:");
    objc_msgSend(v9, "setTotalAppSessions:", objc_msgSend(v9, "totalAppSessions") + 1);
    if ([(ATXInterruptedAppSessionAccumulator *)self _doesLaunchInterruptPreviousLaunch:v22])
    {
      objc_msgSend(v9, "setInterruptedAppSessions:", objc_msgSend(v9, "interruptedAppSessions") + 1);
    }
    id v10 = [(_ATXAppLaunch *)self->_previousLaunch endDate];
    v11 = [(_ATXAppLaunch *)self->_previousLaunch startDate];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    BOOL v14 = [(ATXInterruptedAppSessionAccumulator *)self _doesLaunchInterruptPreviousLaunch:v22];
    v15 = [ATXAppSessionEventMetric alloc];
    previousDimensions = self->_previousDimensions;
    v17 = [(_ATXAppLaunch *)self->_previousLaunch bundleId];
    if (v14)
    {
      v18 = [v22 bundleId];
      v19 = [(ATXAppSessionEventMetric *)v15 initWithDimensions:previousDimensions bundleId:v17 interruptingAppBundleId:v18 duration:v13];
    }
    else
    {
      v19 = [(ATXAppSessionEventMetric *)v15 initWithDimensions:previousDimensions bundleId:v17 interruptingAppBundleId:0 duration:v13];
    }
    v8 = v21;

    [(NSMutableArray *)self->_appSessions addObject:v19];
    objc_storeStrong((id *)&self->_previousLaunch, a3);
    objc_storeStrong((id *)&self->_previousDimensions, a4);
    [(NSMutableDictionary *)self->_recentNotifications removeAllObjects];
  }
  else
  {
    objc_storeStrong((id *)&self->_previousLaunch, a3);
    v20 = v8;
    uint64_t v9 = self->_previousDimensions;
    self->_previousDimensions = v20;
  }
}

- (void)handleEndOfStream
{
  if (self->_previousLaunch)
  {
    id v9 = [(ATXInterruptedAppSessionAccumulator *)self _getSummaryMetricForDimensions:self->_previousDimensions];
    objc_msgSend(v9, "setTotalAppSessions:", objc_msgSend(v9, "totalAppSessions") + 1);
    v3 = [ATXAppSessionEventMetric alloc];
    previousDimensions = self->_previousDimensions;
    uint64_t v5 = [(_ATXAppLaunch *)self->_previousLaunch bundleId];
    v6 = [(_ATXAppLaunch *)self->_previousLaunch endDate];
    id v7 = [(_ATXAppLaunch *)self->_previousLaunch startDate];
    [v6 timeIntervalSinceDate:v7];
    v8 = -[ATXAppSessionEventMetric initWithDimensions:bundleId:interruptingAppBundleId:duration:](v3, "initWithDimensions:bundleId:interruptingAppBundleId:duration:", previousDimensions, v5, 0);

    [(NSMutableArray *)self->_appSessions addObject:v8];
  }
}

- (void)logToCoreAnalytics
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_appSessions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) logToCoreAnalytics];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = self->_summaryMetrics;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 logToCoreAnalytics];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

- (BOOL)_doesLaunchInterruptPreviousLaunch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_ATXAppLaunch *)self->_previousLaunch bundleId];
  uint64_t v6 = [v4 bundleId];
  char v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [v4 startDate];
    uint64_t v10 = [(_ATXAppLaunch *)self->_previousLaunch endDate];
    [v9 timeIntervalSinceDate:v10];
    BOOL v8 = v11 <= 5.0;
  }
  recentNotifications = self->_recentNotifications;
  double v13 = [v4 bundleId];
  long long v14 = [(NSMutableDictionary *)recentNotifications objectForKeyedSubscript:v13];

  char v15 = 0;
  if (v8 && v14)
  {
    long long v16 = [v4 startDate];
    long long v17 = (void *)MEMORY[0x1E4F1C9C8];
    [v14 timestamp];
    long long v18 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    [v16 timeIntervalSinceDate:v18];
    double v20 = v19;

    if (v20 <= 30.0)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v22 = [(_ATXAppLaunch *)self->_previousLaunch startDate];
      v23 = [(_ATXAppLaunch *)self->_previousLaunch endDate];
      uint64_t v24 = (void *)[v21 initWithStartDate:v22 endDate:v23];
      v25 = (void *)MEMORY[0x1E4F1C9C8];
      [v14 timestamp];
      v26 = objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
      char v15 = [v24 containsDate:v26];
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (id)_getSummaryMetricForDimensions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_summaryMetrics objectForKeyedSubscript:v4];

  if (!v5)
  {
    uint64_t v6 = [[ATXInterruptedAppSessionSummaryMetrics alloc] initWithDimensions:v4];
    [(NSMutableDictionary *)self->_summaryMetrics setObject:v6 forKeyedSubscript:v4];
  }
  char v7 = [(NSMutableDictionary *)self->_summaryMetrics objectForKeyedSubscript:v4];

  return v7;
}

- (unint64_t)numberOfInterruptingAppSessions
{
  v2 = [(NSMutableArray *)self->_appSessions _pas_filteredArrayWithTest:&__block_literal_global_0];
  unint64_t v3 = [v2 count];

  return v3;
}

BOOL __70__ATXInterruptedAppSessionAccumulator_numberOfInterruptingAppSessions__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 interruptingAppBundleId];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)countedSetContainingInterruptingAppBundleIds
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_appSessions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "interruptingAppBundleId", (void)v13);

        if (v10)
        {
          double v11 = [v9 interruptingAppBundleId];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentNotifications, 0);
  objc_storeStrong((id *)&self->_summaryMetrics, 0);
  objc_storeStrong((id *)&self->_appSessions, 0);
  objc_storeStrong((id *)&self->_previousDimensions, 0);
  objc_storeStrong((id *)&self->_previousLaunch, 0);
}

@end