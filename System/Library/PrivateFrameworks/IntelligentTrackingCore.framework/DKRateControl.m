@interface DKRateControl
- (_TtC23IntelligentTrackingCore13DKRateControl)init;
@end

@implementation DKRateControl

- (_TtC23IntelligentTrackingCore13DKRateControl)init
{
  return (_TtC23IntelligentTrackingCore13DKRateControl *)DKRateControl.init()();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC23IntelligentTrackingCore13DKRateControl_logger;
  uint64_t v3 = sub_25436C9F0();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end