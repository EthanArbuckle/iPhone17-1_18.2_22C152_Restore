@interface FMNearbyInteractionManagerSubscription
- (_TtC11FMFindingUI38FMNearbyInteractionManagerSubscription)init;
- (void)dealloc;
@end

@implementation FMNearbyInteractionManagerSubscription

- (void)dealloc
{
  v2 = self;
  sub_24D2DFEE4();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI38FMNearbyInteractionManagerSubscription_identifier;
  uint64_t v4 = sub_24D39C8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24D2C6E6C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI38FMNearbyInteractionManagerSubscription_subscriber);
  sub_24D2B6E58((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI38FMNearbyInteractionManagerSubscription_findable);
  swift_unknownObjectWeakDestroy();
}

- (_TtC11FMFindingUI38FMNearbyInteractionManagerSubscription)init
{
  result = (_TtC11FMFindingUI38FMNearbyInteractionManagerSubscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end