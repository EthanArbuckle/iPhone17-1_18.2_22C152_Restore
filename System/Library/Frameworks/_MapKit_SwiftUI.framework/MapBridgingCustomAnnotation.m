@interface MapBridgingCustomAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSString)subtitle;
- (NSString)title;
- (_TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation)init;
- (id)_representedMapItem;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapBridgingCustomAnnotation

- (NSString)title
{
  return (NSString *)sub_228B2A1BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_228B2A1BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation_subtitle);
}

- (void)setSubtitle:(id)a3
{
}

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation_coordinate);
  double v3 = *(double *)&self->title[OBJC_IVAR____TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa
                            + OBJC_IVAR____TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation_coordinate) = a3;
}

- (id)_representedMapItem
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation_mapItem));
}

- (_TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation)init
{
  CLLocationCoordinate2D result = (_TtC15_MapKit_SwiftUI27MapBridgingCustomAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end