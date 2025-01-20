@interface ComponentViewOverflowTransitioning
- (_TtC22SubscribePageExtension34ComponentViewOverflowTransitioning)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation ComponentViewOverflowTransitioning

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  swift_unknownObjectWeakAssign();
  self;
  if (swift_dynamicCastObjCClass()) {
    swift_unknownObjectWeakAssign();
  }
  id v7 = [objc_allocWithZone((Class)type metadata accessor for ComponentViewOverflowPresentationController()) initWithPresentedViewController:a3 presentingViewController:a4];

  return v7;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = sub_10067BF90(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_10067B6C4(v4);

  return v6;
}

- (_TtC22SubscribePageExtension34ComponentViewOverflowTransitioning)init
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension34ComponentViewOverflowTransitioning_isTransitioningFromContainer) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension34ComponentViewOverflowTransitioning_selectedIndexPath;
  uint64_t v4 = sub_100756440();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ComponentViewOverflowTransitioning();
  return [(ComponentViewOverflowTransitioning *)&v6 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension34ComponentViewOverflowTransitioning_selectedIndexPath;

  sub_100106A20((uint64_t)v3);
}

@end