@interface DOCModalBlurViewControllerTransition.BackgroundView
- (_TtCC17RecentsAppPopover36DOCModalBlurViewControllerTransitionP33_53B45AF28C5151482DBEB10077B8776314BackgroundView)initWithCoder:(id)a3;
- (_TtCC17RecentsAppPopover36DOCModalBlurViewControllerTransitionP33_53B45AF28C5151482DBEB10077B8776314BackgroundView)initWithFrame:(CGRect)a3;
- (void)dismissPresentedViewController:(id)a3;
@end

@implementation DOCModalBlurViewControllerTransition.BackgroundView

- (void)dismissPresentedViewController:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (id)Strong;
    id v6 = a3;
    v7 = self;
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
}

- (_TtCC17RecentsAppPopover36DOCModalBlurViewControllerTransitionP33_53B45AF28C5151482DBEB10077B8776314BackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.BackgroundView();
  return -[DOCModalBlurViewControllerTransition.BackgroundView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtCC17RecentsAppPopover36DOCModalBlurViewControllerTransitionP33_53B45AF28C5151482DBEB10077B8776314BackgroundView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.BackgroundView();
  return [(DOCModalBlurViewControllerTransition.BackgroundView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end