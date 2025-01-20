@interface HMDErrorAggregationLogEvent
+ (id)createErrorEventForRequestGroup:(id)a3 errorString:(id)a4 errorCount:(id)a5;
+ (id)createSummaryEventForRequestGroup:(id)a3 totalErrorCount:(id)a4 totalEventCount:(id)a5;
- (HMDErrorAggregationLogEvent)initWithEventGroupName:(id)a3 errorString:(id)a4 errorCount:(id)a5 eventCount:(id)a6;
- (NSDictionary)coreAnalyticsSerializedEvent;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDErrorAggregationLogEvent

- (void).cxx_destruct
{
}

- (NSDictionary)coreAnalyticsSerializedEvent
{
  return self->_coreAnalyticsSerializedEvent;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.dailyErrorAggregation";
}

- (HMDErrorAggregationLogEvent)initWithEventGroupName:(id)a3 errorString:(id)a4 errorCount:(id)a5 eventCount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDErrorAggregationLogEvent;
  v14 = [(HMMLogEvent *)&v20 init];
  if (v14)
  {
    v15 = [MEMORY[0x263EFF9A0] dictionary];
    [v15 setObject:v11 forKeyedSubscript:@"errorString"];
    [v15 setObject:v10 forKeyedSubscript:@"eventGroupName"];
    [v15 setObject:v12 forKeyedSubscript:@"errorCount"];
    if (v13)
    {
      [v15 setObject:v13 forKeyedSubscript:@"eventCount"];
      if ((int)[v13 intValue] >= 1)
      {
        v16 = objc_msgSend(NSNumber, "numberWithInt:", ((int)(100 * (objc_msgSend(v13, "intValue") - objc_msgSend(v12, "intValue")))/ (int)objc_msgSend(v13, "intValue")));
        [v15 setObject:v16 forKeyedSubscript:@"successRate"];
      }
    }
    uint64_t v17 = [v15 copy];
    coreAnalyticsSerializedEvent = v14->_coreAnalyticsSerializedEvent;
    v14->_coreAnalyticsSerializedEvent = (NSDictionary *)v17;
  }
  return v14;
}

+ (id)createErrorEventForRequestGroup:(id)a3 errorString:(id)a4 errorCount:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HMDErrorAggregationLogEvent alloc] initWithEventGroupName:v9 errorString:v8 errorCount:v7 eventCount:0];

  return v10;
}

+ (id)createSummaryEventForRequestGroup:(id)a3 totalErrorCount:(id)a4 totalEventCount:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HMDErrorAggregationLogEvent alloc] initWithEventGroupName:v9 errorString:@"Summary" errorCount:v8 eventCount:v7];

  return v10;
}

@end