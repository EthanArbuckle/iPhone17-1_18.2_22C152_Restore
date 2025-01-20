@interface MUEVChargerAvailabilityProvider
- (BOOL)isActive;
- (_TtC6MapsUI23MUEVChargerAvailability)availability;
- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)init;
- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)initWithPlaceItem:(id)a3 canAccessVirtualGarage:(BOOL)a4;
- (void)dealloc;
- (void)didDownloadEVChargerAvailabilityWithEvCharger:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setAvailability:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation MUEVChargerAvailabilityProvider

- (_TtC6MapsUI23MUEVChargerAvailability)availability
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_availability);
  swift_beginAccess();
  return (_TtC6MapsUI23MUEVChargerAvailability *)*v2;
}

- (void)setAvailability:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_availability);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)isActive
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_isActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsActive:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_isActive;
  swift_beginAccess();
  BOOL *v5 = a3;
  id v6 = self;
  EVChargerAvailabilityDownloader.isActive.setter(a3);
}

- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)initWithPlaceItem:(id)a3 canAccessVirtualGarage:(BOOL)a4
{
  return (_TtC6MapsUI31MUEVChargerAvailabilityProvider *)MUEVChargerAvailabilityProvider.init(placeItem:canAccessVirtualGarage:)(a3, a4);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_virtualGarageService);
  if (v4) {
    objc_msgSend(v4, sel_unregisterObserver_, self);
  }
  else {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(MUEVChargerAvailabilityProvider *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_availabilityRefresher));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_virtualGarageService));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31MUEVChargerAvailabilityProvider_virtualGarage);
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)init
{
  result = (_TtC6MapsUI31MUEVChargerAvailabilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didDownloadEVChargerAvailabilityWithEvCharger:(id)a3
{
  id v4 = a3;
  v5 = self;
  MUEVChargerAvailabilityProvider.didDownloadEVChargerAvailability(evCharger:)(v4);
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  MUEVChargerAvailabilityProvider.virtualGarageDidUpdate(_:)(v4);
}

@end