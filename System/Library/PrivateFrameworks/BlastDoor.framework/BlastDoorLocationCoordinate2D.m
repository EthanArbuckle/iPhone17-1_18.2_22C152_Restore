@interface BlastDoorLocationCoordinate2D
- (BlastDoorLocationCoordinate2D)init;
- (NSString)description;
- (double)latitude;
- (double)longitude;
@end

@implementation BlastDoorLocationCoordinate2D

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)latitude
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorLocationCoordinate2D_locationCoordinate2D);
}

- (double)longitude
{
  return *(double *)&self->locationCoordinate2D[OBJC_IVAR___BlastDoorLocationCoordinate2D_locationCoordinate2D];
}

- (BlastDoorLocationCoordinate2D)init
{
  result = (BlastDoorLocationCoordinate2D *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end