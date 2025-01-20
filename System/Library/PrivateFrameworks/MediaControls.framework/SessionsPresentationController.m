@interface SessionsPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (_TtC13MediaControls30SessionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissalTransitionWillBegin;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionWillBegin;
@end

@implementation SessionsPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  id v3 = [(SessionsPresentationController *)v2 containerView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {

    double v6 = 0.0;
    double v8 = 0.0;
    double v10 = 0.0;
    double v12 = 0.0;
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_1AE8DEFC0();
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_1AE8DF2B4();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_1AE8DF538(a3);
  swift_unknownObjectRelease();
}

- (_TtC13MediaControls30SessionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  uint64_t v7 = OBJC_IVAR____TtC13MediaControls30SessionsPresentationController_blurView;
  type metadata accessor for BackgroundBlurView();
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = a3;
  id v10 = a4;
  double v11 = self;
  *(Class *)((char *)&self->super.super.isa + v7) = (Class)objc_msgSend(v8, sel_init);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for SessionsPresentationController();
  double v12 = [(SessionsPresentationController *)&v14 initWithPresentedViewController:v9 presentingViewController:v10];

  return v12;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13MediaControls30SessionsPresentationController_blurView));
}

@end