@interface AppPromotionDetailPagePresentationController
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)presentedView;
- (_TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
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

- (_TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_45AA04(v5, a4);
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
                                                           + OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_presentedContainerView));
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  sub_45B09C();
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
  sub_45B454();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  double v7 = self;
  sub_45B59C((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_45B75C(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_45B910();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  double v4 = self;
  sub_45BD40(a3);
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_45BE90();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3) {
    [*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_overlayView) removeFromSuperview];
  }
}

- (void)didTapOverlayView:(id)a3
{
  double v4 = (_TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController *)a3;
  id v6 = self;
  if ([(AppPromotionDetailPagePresentationController *)v4 state] == (char *)&def_270DE0 + 3)
  {
    double v5 = (_TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController *)[(AppPromotionDetailPagePresentationController *)v6 presentedViewController];
    [(AppPromotionDetailPagePresentationController *)v5 dismissViewControllerAnimated:1 completion:0];

    double v4 = v6;
    id v6 = v5;
  }
}

- (void)edgePanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_45C27C(v4);
}

- (void)scrollPanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_45C6F8(v4);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa
       + OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_isScrollDismissActive) == 1)
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
  sub_45CD88(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_dismissScreenEdgePanGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_blurOverlayView));
  sub_45D198((uint64_t)self+ OBJC_IVAR____TtC18ASMessagesProvider44AppPromotionDetailPagePresentationController_interactiveDismissal);

  swift_unknownObjectWeakDestroy();
}

@end