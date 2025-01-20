@interface HMDRestrictedGuestInfoLogEvent
- (BOOL)hasHomeKey;
- (BOOL)hasPinCode;
- (BOOL)isChildWatch;
- (HMDRestrictedGuestInfoLogEvent)initWithHomeUUID:(id)a3;
- (HMDRestrictedGuestInfoLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)numberOfAccessories;
- (int64_t)numberOfSchedules;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)scheduleType;
- (void)setCoreAnalyticsEventName:(id)a3;
- (void)setCoreAnalyticsEventOptions:(unint64_t)a3;
- (void)setHasHomeKey:(BOOL)a3;
- (void)setHasPinCode:(BOOL)a3;
- (void)setIsChildWatch:(BOOL)a3;
- (void)setNumberOfAccessories:(int64_t)a3;
- (void)setNumberOfSchedules:(int64_t)a3;
- (void)setScheduleType:(unint64_t)a3;
@end

@implementation HMDRestrictedGuestInfoLogEvent

- (BOOL)hasHomeKey
{
  v2 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_hasHomeKey;
  swift_beginAccess();
  return *v2;
}

- (void)setHasHomeKey:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_hasHomeKey;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasPinCode
{
  v2 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_hasPinCode;
  swift_beginAccess();
  return *v2;
}

- (void)setHasPinCode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_hasPinCode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isChildWatch
{
  v2 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_isChildWatch;
  swift_beginAccess();
  return *v2;
}

- (void)setIsChildWatch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_isChildWatch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)numberOfAccessories
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_numberOfAccessories);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfAccessories:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_numberOfAccessories);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfSchedules
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_numberOfSchedules);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfSchedules:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_numberOfSchedules);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (unint64_t)scheduleType
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_scheduleType);
  swift_beginAccess();
  return *v2;
}

- (void)setScheduleType:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_scheduleType);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (NSString)coreAnalyticsEventName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2302DDB90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setCoreAnalyticsEventName:(id)a3
{
  uint64_t v4 = sub_2302DDBB0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_coreAnalyticsEventName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  RestrictedGuestInfoLogEvent.coreAnalyticsEventDictionary.getter();

  sub_22F5357F8();
  v3 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_coreAnalyticsEventOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestInfoLogEvent_coreAnalyticsEventOptions);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (HMDRestrictedGuestInfoLogEvent)initWithHomeUUID:(id)a3
{
  uint64_t v3 = sub_2302DD2B0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD270();
  return (HMDRestrictedGuestInfoLogEvent *)RestrictedGuestInfoLogEvent.init(homeUUID:)((uint64_t)v5);
}

- (HMDRestrictedGuestInfoLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  uint64_t v5 = sub_2302DD2B0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD270();
  return (HMDRestrictedGuestInfoLogEvent *)RestrictedGuestInfoLogEvent.init(startTime:homeUUID:)((uint64_t)v7, a3);
}

- (void).cxx_destruct
{
}

@end