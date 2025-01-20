@interface MapBridgingMarker
- (CLLocationCoordinate2D)coordinate;
- (NSString)subtitle;
- (NSString)title;
- (_TtC15_MapKit_SwiftUI17MapBridgingMarker)init;
- (id)_representedMapItem;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapBridgingMarker

- (NSString)title
{
  return (NSString *)sub_228B2A1BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_228B2A1BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_subtitle);
}

- (void)setSubtitle:(id)a3
{
}

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_coordinate);
  double v3 = *(double *)&self->title[OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_coordinate) = a3;
}

- (id)_representedMapItem
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_mapItem));
}

- (_TtC15_MapKit_SwiftUI17MapBridgingMarker)init
{
  CLLocationCoordinate2D result = (_TtC15_MapKit_SwiftUI17MapBridgingMarker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end