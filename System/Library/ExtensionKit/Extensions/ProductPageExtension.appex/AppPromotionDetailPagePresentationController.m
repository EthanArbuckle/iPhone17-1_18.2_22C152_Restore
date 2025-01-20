@interface AppPromotionDetailPagePresentationController
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)presentedView;
- (_TtC20ProductPageExtension44AppPromotionDetailPagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (int64_t)adaptivePresentationStyle;
- (int64_t)presentationStyle;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)containerViewWillLayoutSubviews;
- (void)didTapOverlayView:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)edgePanDidChange:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)scrollPanDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AppPromotionDetailPagePresentationController

- (_TtC20ProductPageExtension44AppPromotionDetailPagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_10003326C(v5, a4);
  return result;
}

- (int64_t)presentationStyle
{
  return 5;
}

- (int64_t)adaptivePresentationStyle
{
  return 0;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_presentedContainerView));
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  sub_100033904();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  v2 = self;
  sub_100033CBC();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  double v7 = self;
  sub_100033E04((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_100033FC4(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_100034178();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  double v4 = self;
  sub_1000345A8(a3);
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_1000346F8();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3) {
    [*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_overlayView) removeFromSuperview];
  }
}

- (void)didTapOverlayView:(id)a3
{
  double v4 = (_TtC20ProductPageExtension44AppPromotionDetailPagePresentationController *)a3;
  id v6 = self;
  if ([(AppPromotionDetailPagePresentationController *)v4 state] == (id)3)
  {
    double v5 = (_TtC20ProductPageExtension44AppPromotionDetailPagePresentationController *)[(AppPromotionDetailPagePresentationController *)v6 presentedViewController];
    [(AppPromotionDetailPagePresentationController *)v5 dismissViewControllerAnimated:1 completion:0];

    double v4 = v6;
    id v6 = v5;
  }
}

- (void)edgePanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100034AE4(v4);
}

- (void)scrollPanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100034F60(v4);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_isScrollDismissActive) == 1)
  {
    if (a3)
    {
      id v4 = a3;
      double v5 = self;
      [v4 adjustedContentInset];
      [v4 contentOffset];
      objc_msgSend(v4, "setContentOffset:");
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1000355F0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_dismissScreenEdgePanGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_blurOverlayView));
  sub_100035A00((uint64_t)self+ OBJC_IVAR____TtC20ProductPageExtension44AppPromotionDetailPagePresentationController_interactiveDismissal);

  swift_unknownObjectWeakDestroy();
}

@end