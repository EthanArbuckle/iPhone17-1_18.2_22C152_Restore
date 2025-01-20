@interface SOSFeedbackController
- (_TtC11SOSSettings21SOSFeedbackController)init;
- (_TtC11SOSSettings21SOSFeedbackController)initWithDelegate:(id)a3 legalText:(id)a4;
- (id)getFeedbackViewController;
@end

@implementation SOSFeedbackController

- (_TtC11SOSSettings21SOSFeedbackController)initWithDelegate:(id)a3 legalText:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_F760();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = swift_unknownObjectRetain();
  v8 = sub_F118(v7, v4, v6);
  swift_unknownObjectRelease();
  return (_TtC11SOSSettings21SOSFeedbackController *)v8;
}

- (id)getFeedbackViewController
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC11SOSSettings21SOSFeedbackController_feedbackViewController)
                                         + 184);
  v3 = self;
  uint64_t v4 = swift_retain();
  uint64_t v5 = (void *)v2(v4);

  swift_release();

  return v5;
}

- (_TtC11SOSSettings21SOSFeedbackController)init
{
  result = (_TtC11SOSSettings21SOSFeedbackController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC11SOSSettings21SOSFeedbackController_delegate;

  sub_F22C((uint64_t)v3);
}

@end