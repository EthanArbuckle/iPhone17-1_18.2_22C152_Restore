@interface HMDResidentStatusChannelObserveLogEvent
+ (id)denominatorEvent:(id)a3;
- (BOOL)didAddStatuses;
- (BOOL)didFindPrimary;
- (BOOL)didLoseStatuses;
- (BOOL)didPrimaryChange;
- (BOOL)didUpdateStatuses;
- (BOOL)isStatusesEmpty;
- (HMDResidentStatusChannelObserveLogEvent)initWithHomeUUID:(id)a3 didLoseStatuses:(BOOL)a4 didAddStatuses:(BOOL)a5 didUpdateStatuses:(BOOL)a6 didFindPrimary:(BOOL)a7 didPrimaryChange:(BOOL)a8 isStatusesEmpty:(BOOL)a9;
- (HMDResidentStatusChannelObserveLogEvent)initWithHomeUUID:(id)a3 didLoseStatuses:(BOOL)a4 didAddStatuses:(BOOL)a5 didUpdateStatuses:(BOOL)a6 didFindPrimary:(BOOL)a7 didPrimaryChange:(BOOL)a8 isStatusesEmpty:(BOOL)a9 count:(int64_t)a10;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)count;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDResidentStatusChannelObserveLogEvent

- (int64_t)count
{
  return self->_count;
}

- (BOOL)isStatusesEmpty
{
  return self->_isStatusesEmpty;
}

- (BOOL)didPrimaryChange
{
  return self->_didPrimaryChange;
}

- (BOOL)didFindPrimary
{
  return self->_didFindPrimary;
}

- (BOOL)didUpdateStatuses
{
  return self->_didUpdateStatuses;
}

- (BOOL)didAddStatuses
{
  return self->_didAddStatuses;
}

- (BOOL)didLoseStatuses
{
  return self->_didLoseStatuses;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDResidentStatusChannelObserveLogEvent count](self, "count"));
  [v3 setObject:v4 forKeyedSubscript:@"countObserveAny"];

  if ([(HMDResidentStatusChannelObserveLogEvent *)self count])
  {
    if ([(HMDResidentStatusChannelObserveLogEvent *)self didLoseStatuses]) {
      v5 = &unk_26E4738D0;
    }
    else {
      v5 = &unk_26E4738E8;
    }
    [v3 setObject:v5 forKeyedSubscript:@"countLostStatuses"];
    if ([(HMDResidentStatusChannelObserveLogEvent *)self didAddStatuses]) {
      v6 = &unk_26E4738D0;
    }
    else {
      v6 = &unk_26E4738E8;
    }
    [v3 setObject:v6 forKeyedSubscript:@"countAddedStatuses"];
    if ([(HMDResidentStatusChannelObserveLogEvent *)self didUpdateStatuses]) {
      v7 = &unk_26E4738D0;
    }
    else {
      v7 = &unk_26E4738E8;
    }
    [v3 setObject:v7 forKeyedSubscript:@"countUpdatedStatuses"];
    if ([(HMDResidentStatusChannelObserveLogEvent *)self didFindPrimary]) {
      v8 = &unk_26E4738E8;
    }
    else {
      v8 = &unk_26E4738D0;
    }
    [v3 setObject:v8 forKeyedSubscript:@"countPrimaryNotFound"];
    if ([(HMDResidentStatusChannelObserveLogEvent *)self didPrimaryChange]) {
      v9 = &unk_26E4738D0;
    }
    else {
      v9 = &unk_26E4738E8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"countPrimaryChanged"];
    if ([(HMDResidentStatusChannelObserveLogEvent *)self isStatusesEmpty]) {
      v10 = &unk_26E4738D0;
    }
    else {
      v10 = &unk_26E4738E8;
    }
    [v3 setObject:v10 forKeyedSubscript:@"countEmptyStatuses"];
  }
  v11 = (void *)[v3 copy];

  return (NSDictionary *)v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.statuskit.channel.residentStatus.observe";
}

- (HMDResidentStatusChannelObserveLogEvent)initWithHomeUUID:(id)a3 didLoseStatuses:(BOOL)a4 didAddStatuses:(BOOL)a5 didUpdateStatuses:(BOOL)a6 didFindPrimary:(BOOL)a7 didPrimaryChange:(BOOL)a8 isStatusesEmpty:(BOOL)a9 count:(int64_t)a10
{
  v16.receiver = self;
  v16.super_class = (Class)HMDResidentStatusChannelObserveLogEvent;
  result = [(HMMHomeLogEvent *)&v16 initWithHomeUUID:a3];
  if (result)
  {
    result->_didLoseStatuses = a4;
    result->_didAddStatuses = a5;
    result->_didUpdateStatuses = a6;
    result->_didFindPrimary = a7;
    result->_didPrimaryChange = a8;
    result->_isStatusesEmpty = a9;
    result->_count = a10;
  }
  return result;
}

- (HMDResidentStatusChannelObserveLogEvent)initWithHomeUUID:(id)a3 didLoseStatuses:(BOOL)a4 didAddStatuses:(BOOL)a5 didUpdateStatuses:(BOOL)a6 didFindPrimary:(BOOL)a7 didPrimaryChange:(BOOL)a8 isStatusesEmpty:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(HMDResidentStatusChannelObserveLogEvent *)self initWithHomeUUID:a3 didLoseStatuses:a4 didAddStatuses:a5 didUpdateStatuses:a6 didFindPrimary:a7 didPrimaryChange:a8 isStatusesEmpty:v10 count:1];
}

+ (id)denominatorEvent:(id)a3
{
  id v3 = a3;
  LOBYTE(v6) = 0;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHomeUUID:v3 didLoseStatuses:0 didAddStatuses:0 didUpdateStatuses:0 didFindPrimary:0 didPrimaryChange:0 isStatusesEmpty:v6 count:0];

  return v4;
}

@end