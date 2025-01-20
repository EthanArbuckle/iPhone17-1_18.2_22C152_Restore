@interface B389MapAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSString)title;
- (_TtC18SharingViewService17B389MapAnnotation)init;
@end

@implementation B389MapAnnotation

- (_TtC18SharingViewService17B389MapAnnotation)init
{
  result = (_TtC18SharingViewService17B389MapAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_pairingLocation);
}

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_region);
  double v3 = *(double *)&self->roleEmoji[OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_region];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end