@interface FMR1ProximityManagerSubscription
- (_TtC11FMFindingUI32FMR1ProximityManagerSubscription)init;
- (void)dealloc;
@end

@implementation FMR1ProximityManagerSubscription

- (void)dealloc
{
  v2 = self;
  sub_24D2F0EF0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_identifier;
  uint64_t v4 = sub_24D39C8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24D2C6E6C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_subscriber);
  sub_24D2B6E58((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_findable);
  swift_unknownObjectWeakDestroy();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI32FMR1ProximityManagerSubscription_poseProvider);
}

- (_TtC11FMFindingUI32FMR1ProximityManagerSubscription)init
{
  result = (_TtC11FMFindingUI32FMR1ProximityManagerSubscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end