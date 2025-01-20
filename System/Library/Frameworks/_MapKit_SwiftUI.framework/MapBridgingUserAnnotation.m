@interface MapBridgingUserAnnotation
- (CLLocationCoordinate2D)coordinate;
- (_TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation)init;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation MapBridgingUserAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate);
  double v3 = *(double *)&self->coordinate[OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa
                            + OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate) = a3;
}

- (_TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation)init
{
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate) = *MEMORY[0x263F00B58];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapBridgingUserAnnotation();
  return [(MapBridgingUserAnnotation *)&v3 init];
}

@end