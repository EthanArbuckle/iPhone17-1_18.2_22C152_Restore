@interface FMFindingLocalizer
- (NSString)description;
- (_TtC11FMFindingUI18FMFindingLocalizer)init;
- (void)dealloc;
@end

@implementation FMFindingLocalizer

- (void)dealloc
{
  v2 = self;
  sub_24D2C9C30();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_nearbyInteractionManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_proximityManagerSubscription));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_nearbyInteractionManagerSubscription));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24D2B6DE8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement), *(void *)&self->findingTechnology[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement], *(void **)&self->localizer[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void **)&self->poseProvider[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void *)&self->proximityManager[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void *)&self->nearbyInteractionManager[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void *)&self->proximityManagerSubscription[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void *)&self->nearbyInteractionManagerSubscription[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement+ 6], *(void *)&self->preciseDistancesByUUID[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void *)&self->findableStatesByUUID[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void *)&self->productUUIDsByFindableUUID[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(void *)&self->measurement[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 6], *(_WORD *)&self->measurement[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 14], self->measurement[OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_measurement + 16]);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI18FMFindingLocalizer_delegateTrampoline);
}

- (NSString)description
{
  v2 = self;
  sub_24D2C9FD0();

  v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI18FMFindingLocalizer)init
{
  result = (_TtC11FMFindingUI18FMFindingLocalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end