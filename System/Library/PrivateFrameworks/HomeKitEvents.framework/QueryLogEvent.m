@interface QueryLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtC13HomeKitEvents13QueryLogEvent)init;
- (_TtC13HomeKitEvents13QueryLogEvent)initWithStartTime:(double)a3;
- (double)startTime;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation QueryLogEvent

- (double)startTime
{
  if ((*((unsigned char *)&self->super._lock._os_unfair_lock_opaque
        + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryStartTime) & 1) == 0)
    return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryStartTime);
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QueryLogEvent();
  [(HMMLogEvent *)&v3 startTime];
  return result;
}

- (NSString)coreAnalyticsEventName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25247A830();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  sub_25246D3B0();

  sub_25246EED8();
  objc_super v3 = (void *)sub_25247A760();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3;
}

- (_TtC13HomeKitEvents13QueryLogEvent)init
{
  double result = (_TtC13HomeKitEvents13QueryLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HomeKitEvents13QueryLogEvent)initWithStartTime:(double)a3
{
  double result = (_TtC13HomeKitEvents13QueryLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryStartDate;
  uint64_t v4 = sub_25247A4B0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13HomeKitEvents13QueryLogEvent_queryEndDate, v4);

  swift_bridgeObjectRelease();
}

@end