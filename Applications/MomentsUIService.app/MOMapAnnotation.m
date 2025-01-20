@interface MOMapAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSString)title;
- (_TtC16MomentsUIService15MOMapAnnotation)init;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setTitle:(id)a3;
@end

@implementation MOMapAnnotation

- (CLLocationCoordinate2D)coordinate
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_coordinate);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  v5 = (CLLocationDegrees *)((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_coordinate);
  swift_beginAccess();
  CLLocationDegrees *v5 = latitude;
  v5[1] = longitude;
}

- (NSString)title
{
  v2 = (char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_title;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_title);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC16MomentsUIService15MOMapAnnotation)init
{
  CLLocationCoordinate2D result = (_TtC16MomentsUIService15MOMapAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end