@interface MapPolyline.CocoaWrapper
- ($764D331F295A58AE6A687D38444EB1E5)boundingMapRect;
- ($F24F406B2B787EFB06265DBA3D28CBD5)points;
- (BOOL)_requiresModernMap;
- (BOOL)intersectsMapRect:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (NSString)subtitle;
- (NSString)title;
- (_TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper)init;
- (double)elevations;
- (double)locationAtPointIndex:(int64_t)a3;
- (id)locationsAtPointIndexes:(id)a3;
- (int64_t)pointCount;
- (void)getCoordinates:(CLLocationCoordinate2D *)a3 range:(_NSRange)a4;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapPolyline.CocoaWrapper

- (CLLocationCoordinate2D)coordinate
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_coordinate);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSString)title
{
  return (NSString *)sub_228B9B1A8((char *)self, (uint64_t)a2, (SEL *)&selRef_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_228B9B1A8((char *)self, (uint64_t)a2, (SEL *)&selRef_subtitle);
}

- (void)setSubtitle:(id)a3
{
}

- ($764D331F295A58AE6A687D38444EB1E5)boundingMapRect
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_boundingMapRect);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_intersectsMapRect_, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)points
{
  double v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped);
  double v3 = self;
  double v4 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)objc_msgSend(v2, sel_points);

  return v4;
}

- (int64_t)pointCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_pointCount);
}

- (void)getCoordinates:(CLLocationCoordinate2D *)a3 range:(_NSRange)a4
{
}

- (double)locationAtPointIndex:(int64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_locationAtPointIndex_, a3);
  return result;
}

- (id)locationsAtPointIndexes:(id)a3
{
  uint64_t v4 = sub_228BAC448();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228BAC438();
  v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped);
  v9 = self;
  v10 = (void *)sub_228BAC428();
  id v11 = objc_msgSend(v8, sel_locationsAtPointIndexes_, v10);

  sub_228AD25BC(0, &qword_268292B10);
  sub_228BAD4A8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = (void *)sub_228BAD498();
  swift_bridgeObjectRelease();

  return v12;
}

- (BOOL)_requiresModernMap
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel__requiresModernMap);
}

- (double)elevations
{
  return (double *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped), sel_elevations);
}

- (_TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper)init
{
  double result = (_TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCV15_MapKit_SwiftUI11MapPolyline12CocoaWrapper_wrapped));
}

@end