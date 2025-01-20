@interface AppStoreComponent.AppStoreCoordinator
- (_TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator)init;
- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4;
- (id)presentingViewControllerForLockupView:(id)a3;
- (id)productDetailsPresentationContextForLockupView:(id)a3;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
@end

@implementation AppStoreComponent.AppStoreCoordinator

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (id)productDetailsPresentationContextForLockupView:(id)a3
{
  id v3 = [objc_allocWithZone((Class)ASCLockupProductDetailsPresentationContext) initWithPresentationStyle:1];

  return v3;
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10013C19C(v6, (uint64_t)v7);
}

- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = sub_10013CAB0();

  swift_unknownObjectRelease();

  return v7;
}

- (_TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator)init
{
  result = (_TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000271A0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator_onOpen));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV15ShazamEventsApp17AppStoreComponent19AppStoreCoordinator_onStateChange);

  sub_1000271A0(v3);
}

@end