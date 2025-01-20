@interface MUEVChargingViewModel
- (_TtC6MapsUI21MUEVChargingViewModel)init;
- (void)dealloc;
- (void)evChargerAvailabilityProvider:(id)a3 didUpdateAvailability:(id)a4;
@end

@implementation MUEVChargingViewModel

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_availabilityProvider);
  v5 = self;
  id v6 = v4;
  MUEVChargerAvailabilityProvider.unregisterObserver(_:)((uint64_t)v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(MUEVChargingViewModel *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_observer);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_availability);
}

- (_TtC6MapsUI21MUEVChargingViewModel)init
{
  result = (_TtC6MapsUI21MUEVChargingViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)evChargerAvailabilityProvider:(id)a3 didUpdateAvailability:(id)a4
{
  id v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_availability);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_availability) = (Class)a4;
  id v7 = a4;
  id v8 = a3;
  v9 = self;

  sub_1931EFDD4();
}

@end