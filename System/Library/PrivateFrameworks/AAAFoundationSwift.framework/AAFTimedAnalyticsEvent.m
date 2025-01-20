@interface AAFTimedAnalyticsEvent
- (_TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent)init;
@end

@implementation AAFTimedAnalyticsEvent

- (_TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent)init
{
  result = (_TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_startTime;
  uint64_t v4 = sub_1B8F57380();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime;
  sub_1B8F238A8((uint64_t)v5);
}

@end