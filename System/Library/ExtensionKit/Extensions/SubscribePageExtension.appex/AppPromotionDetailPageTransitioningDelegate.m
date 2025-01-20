@interface AppPromotionDetailPageTransitioningDelegate
- (_TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation AppPromotionDetailPageTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_10004B6B0(v8, a4, v10);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_10004D954();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_10004C440(v4);

  return v6;
}

- (_TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate)init
{
  result = (_TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_originatingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_detailPageViewController));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_10000FED8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_sourceIndexPath, &qword_100934780);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_sourceCell);
}

@end