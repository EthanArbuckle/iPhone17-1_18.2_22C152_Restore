@interface ATXDeviceUsageAccumulator
- (ATXDeviceUsageAccumulator)init;
- (id)_getSummaryMetricForDimensions:(id)a3;
- (void)handleEndOfStream:(id)a3;
- (void)handleModeDimensionSetChange:(id)a3 changeTime:(id)a4;
- (void)handleNextOnInterval:(id)a3 dimensionSet:(id)a4;
- (void)logToCoreAnalytics;
@end

@implementation ATXDeviceUsageAccumulator

- (ATXDeviceUsageAccumulator)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXDeviceUsageAccumulator;
  v2 = [(ATXDeviceUsageAccumulator *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    summaryMetrics = v2->_summaryMetrics;
    v2->_summaryMetrics = (NSMutableDictionary *)v3;

    lastDimensionSet = v2->_lastDimensionSet;
    v2->_lastDimensionSet = 0;
  }
  return v2;
}

- (void)handleEndOfStream:(id)a3
{
  lastDimensionSet = self->_lastDimensionSet;
  if (lastDimensionSet)
  {
    id v5 = a3;
    id v6 = [(ATXDeviceUsageAccumulator *)self _getSummaryMetricForDimensions:lastDimensionSet];
    [v6 handleConfigurationExit:v5];
  }
}

- (void)handleModeDimensionSetChange:(id)a3 changeTime:(id)a4
{
  id v6 = (ATXModeDimensionSet *)a3;
  id v10 = a4;
  if (self->_lastDimensionSet)
  {
    objc_super v7 = -[ATXDeviceUsageAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:");
    [v7 handleConfigurationExit:v10];
  }
  v8 = [(ATXDeviceUsageAccumulator *)self _getSummaryMetricForDimensions:v6];
  [v8 handleConfigurationEntry:v10];
  lastDimensionSet = self->_lastDimensionSet;
  self->_lastDimensionSet = v6;
}

- (void)handleNextOnInterval:(id)a3 dimensionSet:(id)a4
{
  id v6 = a3;
  id v7 = [(ATXDeviceUsageAccumulator *)self _getSummaryMetricForDimensions:a4];
  [v7 handleOnInterval:v6];
}

- (id)_getSummaryMetricForDimensions:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_summaryMetrics objectForKeyedSubscript:v4];

  if (!v5)
  {
    id v6 = [[ATXDeviceUsageSummaryMetrics alloc] initWithDimensions:v4];
    [(NSMutableDictionary *)self->_summaryMetrics setObject:v6 forKeyedSubscript:v4];
  }
  id v7 = [(NSMutableDictionary *)self->_summaryMetrics objectForKeyedSubscript:v4];

  return v7;
}

- (void)logToCoreAnalytics
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_summaryMetrics;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 logToCoreAnalytics];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDimensionSet, 0);
  objc_storeStrong((id *)&self->_summaryMetrics, 0);
}

@end