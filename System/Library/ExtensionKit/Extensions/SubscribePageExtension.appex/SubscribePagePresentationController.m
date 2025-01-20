@interface SubscribePagePresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (_TtC22SubscribePageExtension35SubscribePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
@end

@implementation SubscribePagePresentationController

- (_TtC22SubscribePageExtension35SubscribePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC22SubscribePageExtension35SubscribePagePresentationController *)sub_1004C63B4(v5, a4);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  double v3 = sub_1004C6788();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  swift_unknownObjectRetain();
  double v7 = self;
  id v8 = [(SubscribePagePresentationController *)v7 traitCollection];
  id v9 = [v8 userInterfaceIdiom];

  if (v9) {
    double v10 = 624.0;
  }
  else {
    double v10 = 372.0;
  }
  if (v9) {
    double v11 = 540.0;
  }
  else {
    double v11 = 295.0;
  }
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v12 = CGRectGetWidth(v17) + -80.0;
  if (v12 < v11) {
    double v11 = v12;
  }
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v13 = CGRectGetHeight(v18);
  swift_unknownObjectRelease();

  if (v13 + -80.0 >= v10) {
    double v14 = v10;
  }
  else {
    double v14 = v13 + -80.0;
  }
  double v15 = v11;
  result.CGFloat height = v14;
  result.CGFloat width = v15;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  v2 = self;
  sub_1004C6AB8();
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_1004C6C20();
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_1004C6E98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35SubscribePagePresentationController_dimmingView));
  double v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension35SubscribePagePresentationController_shadowView);
}

@end