@interface ScreenContinuityActivity
- (_TtC21ScreenContinuityShell24ScreenContinuityActivity)init;
@end

@implementation ScreenContinuityActivity

- (_TtC21ScreenContinuityShell24ScreenContinuityActivity)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_activity) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScreenContinuityActivity();
  return [(ScreenContinuityActivity *)&v3 init];
}

- (void).cxx_destruct
{
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21ScreenContinuityShell24ScreenContinuityActivity_prominenceAssertion);
}

@end