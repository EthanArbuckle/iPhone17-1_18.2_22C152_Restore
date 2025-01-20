@interface ATXInterruptedAppSessionSummaryMetrics
- (ATXInterruptedAppSessionSummaryMetrics)initWithDimensions:(id)a3;
- (double)percentageInterruptedAppSessions;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)interruptedAppSessions;
- (unint64_t)totalAppSessions;
- (void)setInterruptedAppSessions:(unint64_t)a3;
- (void)setTotalAppSessions:(unint64_t)a3;
@end

@implementation ATXInterruptedAppSessionSummaryMetrics

- (id)metricName
{
  return @"com.apple.ModeActivity.InterruptedAppSessions.summary";
}

- (ATXInterruptedAppSessionSummaryMetrics)initWithDimensions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ATXInterruptedAppSessionSummaryMetrics;
  result = [(_ATXCoreAnalyticsMetric *)&v4 initWithDimensions:a3];
  if (result)
  {
    result->_totalAppSessions = 0;
    result->_interruptedAppSessions = 0;
  }
  return result;
}

- (double)percentageInterruptedAppSessions
{
  unint64_t totalAppSessions = self->_totalAppSessions;
  if (totalAppSessions) {
    return (double)self->_interruptedAppSessions / (double)totalAppSessions;
  }
  else {
    return 0.0;
  }
}

- (id)coreAnalyticsDictionary
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"totalAppSessions";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXInterruptedAppSessionSummaryMetrics totalAppSessions](self, "totalAppSessions"));
  v10[0] = v3;
  v9[1] = @"interruptedAppSessions";
  objc_super v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXInterruptedAppSessionSummaryMetrics interruptedAppSessions](self, "interruptedAppSessions"));
  v10[1] = v4;
  v9[2] = @"pctInterruptedAppSessions";
  v5 = NSNumber;
  [(ATXInterruptedAppSessionSummaryMetrics *)self percentageInterruptedAppSessions];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (unint64_t)totalAppSessions
{
  return self->_totalAppSessions;
}

- (void)setTotalAppSessions:(unint64_t)a3
{
  self->_unint64_t totalAppSessions = a3;
}

- (unint64_t)interruptedAppSessions
{
  return self->_interruptedAppSessions;
}

- (void)setInterruptedAppSessions:(unint64_t)a3
{
  self->_interruptedAppSessions = a3;
}

@end