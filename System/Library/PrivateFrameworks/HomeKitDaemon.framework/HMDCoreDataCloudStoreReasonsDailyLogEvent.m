@interface HMDCoreDataCloudStoreReasonsDailyLogEvent
- (HMDCoreDataCloudStoreReasonsDailyLogEvent)initWithReason:(id)a3 reasonCount:(unint64_t)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)reason;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)reasonCount;
@end

@implementation HMDCoreDataCloudStoreReasonsDailyLogEvent

- (void).cxx_destruct
{
}

- (unint64_t)reasonCount
{
  return self->_reasonCount;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"changeReason";
  v3 = [(HMDCoreDataCloudStoreReasonsDailyLogEvent *)self reason];
  v7[1] = @"reasonCount";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCoreDataCloudStoreReasonsDailyLogEvent reasonCount](self, "reasonCount"));
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.daemon.cloudStoreReasonsDailyTotal";
}

- (HMDCoreDataCloudStoreReasonsDailyLogEvent)initWithReason:(id)a3 reasonCount:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCoreDataCloudStoreReasonsDailyLogEvent;
  v8 = [(HMMLogEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_reason, a3);
    v9->_reasonCount = a4;
  }

  return v9;
}

@end