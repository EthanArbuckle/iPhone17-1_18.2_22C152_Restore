@interface BRCEventMetric
- (BOOL)isCKMetric;
- (BRCEventMetric)initWithEventName:(id)a3;
- (CKEventMetric)associatedCKEventMetricIfAvailable;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)eventName;
- (double)duration;
- (id)additionalPayload;
- (id)associatedAppTelemetryEvent;
- (id)description;
- (id)subDescription;
- (void)associateWithCompletedOperation:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setIsCKMetric:(BOOL)a3;
- (void)setStartTime:(id)a3;
@end

@implementation BRCEventMetric

- (BRCEventMetric)initWithEventName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCEventMetric;
  v6 = [(BRCEventMetric *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    v7->_isCKMetric = 1;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  eventName = self->_eventName;
  [(BRCEventMetric *)self duration];
  uint64_t v6 = v5;
  v7 = [(BRCEventMetric *)self subDescription];
  v8 = [v3 stringWithFormat:@"<%@ t:%.2fs%@>", eventName, v6, v7];

  return v8;
}

- (double)duration
{
  endTime = self->_endTime;
  if (endTime)
  {
    startTime = self->_startTime;
    [(NSDate *)endTime timeIntervalSinceDate:startTime];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:self->_startTime];
    double v8 = v7;

    return v8;
  }
  return result;
}

- (id)subDescription
{
  return &stru_1F2AC7720;
}

- (id)additionalPayload
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)associatedAppTelemetryEvent
{
  return 0;
}

- (void)associateWithCompletedOperation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isCKMetric)
  {
    associatedCKEventMetricIfAvailable = self->_associatedCKEventMetricIfAvailable;
    if (!associatedCKEventMetricIfAvailable)
    {
      uint64_t v6 = (CKEventMetric *)[objc_alloc(MEMORY[0x1E4F1A010]) initWithEventName:self->_eventName];
      double v7 = self->_associatedCKEventMetricIfAvailable;
      self->_associatedCKEventMetricIfAvailable = v6;

      associatedCKEventMetricIfAvailable = self->_associatedCKEventMetricIfAvailable;
    }
    [associatedCKEventMetricIfAvailable associateWithCompletedOperation:v4];
    double v8 = brc_bread_crumbs();
    objc_super v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412802;
      uint64_t v11 = objc_opt_class();
      __int16 v12 = 2112;
      v13 = self;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] associated %@ to event metric %@%@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (BOOL)isCKMetric
{
  return self->_isCKMetric;
}

- (void)setIsCKMetric:(BOOL)a3
{
  self->_isCKMetric = a3;
}

- (CKEventMetric)associatedCKEventMetricIfAvailable
{
  return self->_associatedCKEventMetricIfAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedCKEventMetricIfAvailable, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end