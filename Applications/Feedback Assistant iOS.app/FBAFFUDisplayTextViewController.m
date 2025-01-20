@interface FBAFFUDisplayTextViewController
- (UITextView)textView;
- (_TtC18Feedback_Assistant31FBAFFUDisplayTextViewController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant31FBAFFUDisplayTextViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDone;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
@end

@implementation FBAFFUDisplayTextViewController

- (UITextView)textView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTextView:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10007AF50();
}

- (void)didTapDone
{
}

- (_TtC18Feedback_Assistant31FBAFFUDisplayTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_unknownObjectWeakInit();
    v6 = (Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_displayText);
    void *v6 = 0;
    v6[1] = 0xE000000000000000;
    id v7 = a4;
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    v9 = (Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_displayText);
    void *v9 = 0;
    v9[1] = 0xE000000000000000;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FBAFFUDisplayTextViewController();
  v11 = [(FBAFFUDisplayTextViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC18Feedback_Assistant31FBAFFUDisplayTextViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_displayText);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAFFUDisplayTextViewController();
  return [(FBAFFUDisplayTextViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end