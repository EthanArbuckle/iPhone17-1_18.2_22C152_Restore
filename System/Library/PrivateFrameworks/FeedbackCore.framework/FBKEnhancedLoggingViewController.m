@interface FBKEnhancedLoggingViewController
- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)init;
- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)initWithCoder:(id)a3;
- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation FBKEnhancedLoggingViewController

- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_matcherPredicatesUsed) = 0;
  id v5 = a3;

  result = (_TtC12FeedbackCore32FBKEnhancedLoggingViewController *)sub_22A4B3BF8();
  __break(1u);
  return result;
}

- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_matcherPredicatesUsed) = 0;
  id v6 = a4;

  result = (_TtC12FeedbackCore32FBKEnhancedLoggingViewController *)sub_22A4B3BF8();
  __break(1u);
  return result;
}

- (_TtC12FeedbackCore32FBKEnhancedLoggingViewController)init
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_matcherPredicatesUsed) = 0;

  result = (_TtC12FeedbackCore32FBKEnhancedLoggingViewController *)sub_22A4B3BF8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22A4840AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_modalQuestion));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_devicesController));
  sub_22A432A10((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore32FBKEnhancedLoggingViewController_delegate);

  swift_bridgeObjectRelease();
}

@end