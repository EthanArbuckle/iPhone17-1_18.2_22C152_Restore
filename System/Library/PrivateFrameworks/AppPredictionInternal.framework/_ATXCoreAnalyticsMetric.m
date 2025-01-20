@interface _ATXCoreAnalyticsMetric
- (_ATXCoreAnalyticsDimensionSet)dimensionSet;
- (_ATXCoreAnalyticsMetric)init;
- (_ATXCoreAnalyticsMetric)initWithDimensions:(id)a3;
- (id)coreAnalyticsDictionary;
- (id)coreAnalyticsDictionaryWithDimensions;
- (id)metricName;
- (void)coreAnalyticsDictionary;
- (void)logToCoreAnalytics;
- (void)metricName;
@end

@implementation _ATXCoreAnalyticsMetric

- (id)metricName
{
  v2 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[_ATXCoreAnalyticsMetric metricName]();
  }

  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Attempted to call metricName on %@ without overriding in a subclass", v6 format];

  return 0;
}

- (_ATXCoreAnalyticsMetric)init
{
  v3 = objc_opt_new();
  uint64_t v4 = [(_ATXCoreAnalyticsMetric *)self initWithDimensions:v3];

  return v4;
}

- (_ATXCoreAnalyticsMetric)initWithDimensions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXCoreAnalyticsMetric;
  v6 = [(_ATXCoreAnalyticsMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dimensionSet, a3);
  }

  return v7;
}

- (id)coreAnalyticsDictionary
{
  v2 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[_ATXCoreAnalyticsMetric coreAnalyticsDictionary]();
  }

  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Attempted to call coreAnalyticsDictionary on %@ without overriding in a subclass", v6 format];

  return (id)MEMORY[0x1E4F1CC08];
}

- (id)coreAnalyticsDictionaryWithDimensions
{
  v3 = objc_opt_new();
  uint64_t v4 = [(_ATXCoreAnalyticsDimensionSet *)self->_dimensionSet coreAnalyticsDictionary];
  [v3 addEntriesFromDictionary:v4];

  id v5 = [(_ATXCoreAnalyticsMetric *)self coreAnalyticsDictionary];
  [v3 addEntriesFromDictionary:v5];

  return v3;
}

- (void)logToCoreAnalytics
{
  id v4 = [(_ATXCoreAnalyticsMetric *)self metricName];
  v3 = [(_ATXCoreAnalyticsMetric *)self coreAnalyticsDictionaryWithDimensions];
  AnalyticsSendEvent();
}

- (_ATXCoreAnalyticsDimensionSet)dimensionSet
{
  return self->_dimensionSet;
}

- (void).cxx_destruct
{
}

- (void)metricName
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Attempted to call metricName on %@ without overriding in a subclass", v4, v5, v6, v7, 2u);
}

- (void)coreAnalyticsDictionary
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "Attempted to call coreAnalyticsDictionary on %@ without overriding in a subclass", v4, v5, v6, v7, 2u);
}

@end