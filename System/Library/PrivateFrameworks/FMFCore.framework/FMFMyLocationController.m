@interface FMFMyLocationController
- (_TtC7FMFCore23FMFMyLocationController)init;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation FMFMyLocationController

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  v7 = self;
  sub_21CA0E428(a4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_21CA05908(0, &qword_267C97588);
  unint64_t v6 = sub_21CB88510();
  id v7 = a3;
  v8 = self;
  sub_21CA26C7C(v6);

  swift_bridgeObjectRelease();
}

- (_TtC7FMFCore23FMFMyLocationController)init
{
  result = (_TtC7FMFCore23FMFMyLocationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21CA640FC((uint64_t)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_delegate);

  sub_21CA19240((uint64_t)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_myLocation);
  sub_21CA19240((uint64_t)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_myUnshiftedLocation);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_myLocationUpdatingQueue));
  v3 = (char *)self + OBJC_IVAR____TtC7FMFCore23FMFMyLocationController_interactionController;

  sub_21CA2B0D0((uint64_t)v3);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_21CB33644(v8);
}

@end