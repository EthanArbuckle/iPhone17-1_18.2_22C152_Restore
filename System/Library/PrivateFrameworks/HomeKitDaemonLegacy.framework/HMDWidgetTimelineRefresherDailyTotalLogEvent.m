@interface HMDWidgetTimelineRefresherDailyTotalLogEvent
- (HMDWidgetTimelineRefresherDailyTotalLogEvent)initWithKind:(id)a3 reason:(id)a4 count:(unint64_t)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)kind;
- (NSString)reason;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)count;
@end

@implementation HMDWidgetTimelineRefresherDailyTotalLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

- (unint64_t)count
{
  return self->_count;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)kind
{
  return self->_kind;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"widgetKind";
  v3 = [(HMDWidgetTimelineRefresherDailyTotalLogEvent *)self kind];
  v9[0] = v3;
  v8[1] = @"refreshReason";
  v4 = [(HMDWidgetTimelineRefresherDailyTotalLogEvent *)self reason];
  v9[1] = v4;
  v8[2] = @"refreshCount";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDWidgetTimelineRefresherDailyTotalLogEvent count](self, "count"));
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.daemon.widgetTimelineRefresherDailyTotal";
}

- (HMDWidgetTimelineRefresherDailyTotalLogEvent)initWithKind:(id)a3 reason:(id)a4 count:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMDCameraAnalysisStatePublisher *)_HMFPreconditionFailure();
    [(HMDCameraAnalysisStatePublisher *)v17 .cxx_destruct];
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDWidgetTimelineRefresherDailyTotalLogEvent;
  v11 = [(HMMLogEvent *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    kind = v11->_kind;
    v11->_kind = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    v11->_count = a5;
  }

  return v11;
}

@end