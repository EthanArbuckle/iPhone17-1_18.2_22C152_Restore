@interface HMDWidgetTimelineRefresherLogEvent
- (HMDWidgetTimelineRefresherLogEvent)initWithKind:(id)a3 reason:(id)a4;
- (NSString)kind;
- (NSString)reason;
@end

@implementation HMDWidgetTimelineRefresherLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)kind
{
  return self->_kind;
}

- (HMDWidgetTimelineRefresherLogEvent)initWithKind:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (HMDWidgetTimelineRefresherDailyTotalLogEvent *)_HMFPreconditionFailure();
    [(HMDWidgetTimelineRefresherDailyTotalLogEvent *)v15 .cxx_destruct];
    return result;
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDWidgetTimelineRefresherLogEvent;
  v9 = [(HMMLogEvent *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    kind = v9->_kind;
    v9->_kind = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v12;
  }
  return v9;
}

@end