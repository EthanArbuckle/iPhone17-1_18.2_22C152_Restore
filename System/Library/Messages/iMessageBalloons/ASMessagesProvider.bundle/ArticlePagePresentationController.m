@interface ArticlePagePresentationController
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)presentedView;
- (_TtC18ASMessagesProvider33ArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
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
  sub_64C42C();
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
  sub_64C920(v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_64CCB0(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)containerViewWillLayoutSubviews
{
  v2 = self;
  sub_64CE64();
}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_64CFDC();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  double v4 = self;
  sub_64D4F4(a3);
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_64D6D8();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    double v3 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_overlayTintView);
    double v4 = self;
    [v3 removeFromSuperview];
    [*(id *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_overlayBlurView) removeFromSuperview];
  }
}

- (void)dismissTapDidChange:(id)a3
{
  double v4 = (_TtC18ASMessagesProvider33ArticlePagePresentationController *)a3;
  id v6 = self;
  if ([(ArticlePagePresentationController *)v4 state] == (char *)&def_270DE0 + 3)
  {
    double v5 = (_TtC18ASMessagesProvider33ArticlePagePresentationController *)[(ArticlePagePresentationController *)v6 presentedViewController];
    [(ArticlePagePresentationController *)v5 dismissViewControllerAnimated:1 completion:0];

    double v4 = v6;
    id v6 = v5;
  }
}

- (void)edgePanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_64DD88(v4);
}

- (void)scrollPanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_64E268(v4);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa
       + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_isScrollDismissActive) == 1)
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

- (_TtC18ASMessagesProvider33ArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGRect result = (_TtC18ASMessagesProvider33ArticlePagePresentationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_overlayBlurView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_overlayTintView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_dismissSwipeGestureRecognizer));
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_transitioningViewProvider);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider33ArticlePagePresentationController_interactiveDismissal, (uint64_t *)&unk_969010);

  swift_unknownObjectWeakDestroy();
}

@end