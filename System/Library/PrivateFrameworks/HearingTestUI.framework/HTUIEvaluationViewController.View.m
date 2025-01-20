@interface HTUIEvaluationViewController.View
- (_TtCC13HearingTestUI28HTUIEvaluationViewController4View)init;
- (_TtCC13HearingTestUI28HTUIEvaluationViewController4View)initWithCoder:(id)a3;
- (_TtCC13HearingTestUI28HTUIEvaluationViewController4View)initWithFrame:(CGRect)a3;
- (void)didTapHear;
- (void)layoutSubviews;
- (void)setupSubviews;
- (void)transitionToNextState;
- (void)updateConstraints;
- (void)updateProgressTo:(double)a3 immediately:(BOOL)a4;
@end

@implementation HTUIEvaluationViewController.View

- (_TtCC13HearingTestUI28HTUIEvaluationViewController4View)init
{
  return (_TtCC13HearingTestUI28HTUIEvaluationViewController4View *)HTUIEvaluationViewController.View.init()();
}

- (_TtCC13HearingTestUI28HTUIEvaluationViewController4View)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2513D02C8();
}

- (void)setupSubviews
{
  v2 = self;
  sub_2513CC510();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2513CDF84();
}

- (void)updateConstraints
{
  v2 = self;
  sub_2513CE0D8();
}

- (void)transitionToNextState
{
  v2 = self;
  sub_2513CE2D0();
}

- (void)updateProgressTo:(double)a3 immediately:(BOOL)a4
{
  v5 = self;
  sub_2513E85C4(a4);
}

- (void)didTapHear
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_didTapHearHandler);
  id v3 = self;
  if (v2)
  {
    uint64_t v4 = sub_2513AF7F4((uint64_t)v2);
    v2(v4);
    sub_2513AF804((uint64_t)v2);
  }
  sub_2513D5DD8();
}

- (_TtCC13HearingTestUI28HTUIEvaluationViewController4View)initWithFrame:(CGRect)a3
{
  result = (_TtCC13HearingTestUI28HTUIEvaluationViewController4View *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2513AF804(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_didTapHearHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View____lazy_storage___progressView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_metalAnimation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_stageTitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_stageBody));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_stageStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_guidanceTitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_completionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_captionLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingTestUI28HTUIEvaluationViewController4View_tapHearButton));

  swift_bridgeObjectRelease();
}

@end