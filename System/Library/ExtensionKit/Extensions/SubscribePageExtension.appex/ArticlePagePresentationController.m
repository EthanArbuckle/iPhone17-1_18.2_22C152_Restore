@interface ArticlePagePresentationController
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)presentedView;
- (_TtC22SubscribePageExtension33ArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (int64_t)adaptivePresentationStyle;
- (int64_t)presentationStyle;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)containerViewWillLayoutSubviews;
- (void)dismissTapDidChange:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)edgePanDidChange:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)scrollPanDidChange:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ArticlePagePresentationController

- (int64_t)presentationStyle
{
  return 5;
}

- (int64_t)adaptivePresentationStyle
{
  return 0;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  sub_100449A44();
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

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  double v7 = self;
  sub_100449F38(v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_10044A2C8(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)containerViewWillLayoutSubviews
{
  v2 = self;
  sub_10044A47C();
}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_10044A5F4();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  double v4 = self;
  sub_10044AB0C(a3);
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_10044ACF0();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    double v3 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayTintView);
    double v4 = self;
    [v3 removeFromSuperview];
    [*(id *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayBlurView) removeFromSuperview];
  }
}

- (void)dismissTapDidChange:(id)a3
{
  double v4 = (_TtC22SubscribePageExtension33ArticlePagePresentationController *)a3;
  id v6 = self;
  if ([(ArticlePagePresentationController *)v4 state] == (id)3)
  {
    double v5 = (_TtC22SubscribePageExtension33ArticlePagePresentationController *)[(ArticlePagePresentationController *)v6 presentedViewController];
    [(ArticlePagePresentationController *)v5 dismissViewControllerAnimated:1 completion:0];

    double v4 = v6;
    id v6 = v5;
  }
}

- (void)edgePanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10044B3A0(v4);
}

- (void)scrollPanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10044B880(v4);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_isScrollDismissActive) == 1)
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

- (_TtC22SubscribePageExtension33ArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGRect result = (_TtC22SubscribePageExtension33ArticlePagePresentationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayBlurView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayTintView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_dismissSwipeGestureRecognizer));
  sub_10000FB1C((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_transitioningViewProvider);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_interactiveDismissal, (uint64_t *)&unk_1009589F0);

  swift_unknownObjectWeakDestroy();
}

@end