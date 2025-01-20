@interface FMIPLocationController
- (_TtC8FMIPCore22FMIPLocationController)init;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation FMIPLocationController

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  v7 = self;
  sub_1D428896C(a4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1D4275AD0(0, (unint64_t *)&qword_1EA6CA358);
  unint64_t v6 = sub_1D4469D78();
  id v7 = a3;
  v8 = self;
  sub_1D42B6AD8(v6);

  swift_bridgeObjectRelease();
}

- (_TtC8FMIPCore22FMIPLocationController)init
{
  return (_TtC8FMIPCore22FMIPLocationController *)sub_1D42915A4();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1D4407B8C(v8);
}

- (void).cxx_destruct
{
  swift_release();
  sub_1D42F9538((uint64_t)self + OBJC_IVAR____TtC8FMIPCore22FMIPLocationController_delegate);

  v3 = *(void **)&self->locationManager[OBJC_IVAR____TtC8FMIPCore22FMIPLocationController_currentLocation];
}

@end