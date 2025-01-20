@interface ReportTouchOperation
- (_TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation)init;
- (void)main;
@end

@implementation ReportTouchOperation

- (void)main
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation_work);
  uint64_t v3 = *((unsigned __int8 *)&self->super.super.isa
       + OBJC_IVAR____TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation_hasTouch);
  v4 = self;
  swift_retain();
  v2(v3);

  swift_release();
}

- (_TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation)init
{
  result = (_TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end