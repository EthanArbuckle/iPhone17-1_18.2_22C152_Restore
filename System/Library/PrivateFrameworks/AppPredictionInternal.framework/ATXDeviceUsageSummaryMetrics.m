@interface ATXDeviceUsageSummaryMetrics
- (ATXDeviceUsageSummaryMetrics)initWithDimensions:(id)a3;
- (double)averagePickupDuration;
- (double)totalDeviceOnTime;
- (double)totalTime;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)devicePickupCount;
- (void)handleConfigurationEntry:(id)a3;
- (void)handleConfigurationExit:(id)a3;
- (void)handleOnInterval:(id)a3;
@end

@implementation ATXDeviceUsageSummaryMetrics

- (id)metricName
{
  return @"com.apple.ModeActivity.DeviceUsage.summary";
}

- (ATXDeviceUsageSummaryMetrics)initWithDimensions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ATXDeviceUsageSummaryMetrics;
  v3 = [(_ATXCoreAnalyticsMetric *)&v7 initWithDimensions:a3];
  v4 = v3;
  if (v3)
  {
    v3->_devicePickupCount = 0;
    v3->_totalDeviceOnTime = 0.0;
    v3->_totalTime = 0.0;
    lastEntryTime = v3->_lastEntryTime;
    v3->_lastEntryTime = 0;
  }
  return v4;
}

- (double)averagePickupDuration
{
  unint64_t devicePickupCount = self->_devicePickupCount;
  if (devicePickupCount) {
    return self->_totalDeviceOnTime / (double)devicePickupCount;
  }
  else {
    return 0.0;
  }
}

- (void)handleConfigurationEntry:(id)a3
{
}

- (void)handleConfigurationExit:(id)a3
{
  lastEntryTime = self->_lastEntryTime;
  if (lastEntryTime)
  {
    [a3 timeIntervalSinceDate:lastEntryTime];
    self->_totalTime = v5 + self->_totalTime;
    v6 = self->_lastEntryTime;
    self->_lastEntryTime = 0;
  }
  else
  {
    objc_super v7 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXDeviceUsageSummaryMetrics handleConfigurationExit:](v7);
    }
  }
}

- (void)handleOnInterval:(id)a3
{
  ++self->_devicePickupCount;
  id v5 = [a3 onInterval];
  [v5 duration];
  self->_totalDeviceOnTime = v4 + self->_totalDeviceOnTime;
}

- (id)coreAnalyticsDictionary
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"devicePickupCount";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDeviceUsageSummaryMetrics devicePickupCount](self, "devicePickupCount"));
  v13[0] = v3;
  v12[1] = @"averagePickupDuration";
  double v4 = NSNumber;
  [(ATXDeviceUsageSummaryMetrics *)self averagePickupDuration];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  v13[1] = v5;
  v12[2] = @"totalTime";
  v6 = NSNumber;
  [(ATXDeviceUsageSummaryMetrics *)self totalTime];
  objc_super v7 = objc_msgSend(v6, "numberWithDouble:");
  v13[2] = v7;
  v12[3] = @"totalDeviceOnTime";
  v8 = NSNumber;
  [(ATXDeviceUsageSummaryMetrics *)self totalDeviceOnTime];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

- (unint64_t)devicePickupCount
{
  return self->_devicePickupCount;
}

- (double)totalDeviceOnTime
{
  return self->_totalDeviceOnTime;
}

- (double)totalTime
{
  return self->_totalTime;
}

- (void).cxx_destruct
{
}

- (void)handleConfigurationExit:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Unexpectedly received exit event prior to entry", v1, 2u);
}

@end