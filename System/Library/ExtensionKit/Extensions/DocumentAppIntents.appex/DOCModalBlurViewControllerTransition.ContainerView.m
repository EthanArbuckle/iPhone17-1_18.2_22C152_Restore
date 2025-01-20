@interface DOCModalBlurViewControllerTransition.ContainerView
- (_TtCC18DocumentAppIntents36DOCModalBlurViewControllerTransitionP33_73D09C8A78D72C4F75E5B90684464E5713ContainerView)initWithCoder:(id)a3;
- (_TtCC18DocumentAppIntents36DOCModalBlurViewControllerTransitionP33_73D09C8A78D72C4F75E5B90684464E5713ContainerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation DOCModalBlurViewControllerTransition.ContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.ContainerView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[DOCModalBlurViewControllerTransition.ContainerView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_100032070(0, (unint64_t *)&qword_10065B230);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = sub_1004F5970();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (void)didMoveToWindow
{
  v3 = self;
  id v2 = [(DOCModalBlurViewControllerTransition.ContainerView *)v3 window];

  if (!v2) {
    sub_1003279B8();
  }
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_100327B84();
}

- (_TtCC18DocumentAppIntents36DOCModalBlurViewControllerTransitionP33_73D09C8A78D72C4F75E5B90684464E5713ContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC18DocumentAppIntents36DOCModalBlurViewControllerTransitionP33_73D09C8A78D72C4F75E5B90684464E5713ContainerView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.ContainerView();
  return -[DOCModalBlurViewControllerTransition.ContainerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtCC18DocumentAppIntents36DOCModalBlurViewControllerTransitionP33_73D09C8A78D72C4F75E5B90684464E5713ContainerView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC18DocumentAppIntents36DOCModalBlurViewControllerTransitionP33_73D09C8A78D72C4F75E5B90684464E5713ContainerView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.ContainerView();
  return [(DOCModalBlurViewControllerTransition.ContainerView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end