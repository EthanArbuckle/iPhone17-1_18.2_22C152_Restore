@interface SNKShotSegmentationResult
- (MLMultiArray)exemplarEmbedding;
- (NSArray)segments;
- (NSNumber)exemplarIndex;
- (SNKShotSegmentationResult)init;
- (void)setExemplarEmbedding:(id)a3;
- (void)setExemplarIndex:(id)a3;
- (void)setSegments:(id)a3;
@end

@implementation SNKShotSegmentationResult

- (SNKShotSegmentationResult)init
{
  return (SNKShotSegmentationResult *)SNKShotSegmentationResult.init()();
}

- (MLMultiArray)exemplarEmbedding
{
  v2 = self;
  v3 = (void *)sub_1DC894DAC();

  return (MLMultiArray *)v3;
}

- (void)setExemplarEmbedding:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC894E38((uint64_t)v4);
}

- (NSArray)segments
{
  v2 = self;
  sub_1DC894FB0();

  type metadata accessor for SNKShotSegment(0);
  v3 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)setSegments:(id)a3
{
}

- (NSNumber)exemplarIndex
{
  v2 = self;
  id v3 = sub_1DC895450();

  return (NSNumber *)v3;
}

- (void)setExemplarIndex:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC895508(v4);
}

- (void).cxx_destruct
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SNKShotSegmentationResult_impl);
  swift_bridgeObjectRelease();
}

@end