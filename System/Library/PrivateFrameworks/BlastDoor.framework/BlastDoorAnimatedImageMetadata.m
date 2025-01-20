@interface BlastDoorAnimatedImageMetadata
- (BlastDoorAnimatedImageMetadata)init;
- (CGSize)pixelSize;
- (NSArray)durations;
- (NSString)description;
- (NSString)utTypeString;
@end

@implementation BlastDoorAnimatedImageMetadata

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)durations
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196AAF0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (CGSize)pixelSize
{
  double v2 = *(double *)&self->animatedImageMetadata[OBJC_IVAR___BlastDoorAnimatedImageMetadata_animatedImageMetadata];
  double v3 = *(double *)&self->animatedImageMetadata[OBJC_IVAR___BlastDoorAnimatedImageMetadata_animatedImageMetadata + 8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)utTypeString
{
  return (NSString *)sub_1B1798358();
}

- (BlastDoorAnimatedImageMetadata)init
{
  CGSize result = (BlastDoorAnimatedImageMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end