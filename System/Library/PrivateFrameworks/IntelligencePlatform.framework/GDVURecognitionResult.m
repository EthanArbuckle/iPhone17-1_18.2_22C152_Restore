@interface GDVURecognitionResult
- (GDEntityIdentifier)entityIdentifier;
- (GDVURecognitionResult)init;
- (NSUUID)tag;
- (float)confidence;
- (void)setEntityIdentifier:(id)a3;
@end

@implementation GDVURecognitionResult

- (GDEntityIdentifier)entityIdentifier
{
  id v2 = GDVURecognitionResult.entityIdentifier.getter();

  return (GDEntityIdentifier *)v2;
}

- (void)setEntityIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  GDVURecognitionResult.entityIdentifier.setter(v4);
}

- (NSUUID)tag
{
  return (NSUUID *)sub_1B2E2F04C(self, (uint64_t)a2, (void (*)(void))GDVURecognitionResult.tag.getter);
}

- (float)confidence
{
  return GDVURecognitionResult.confidence.getter();
}

- (GDVURecognitionResult)init
{
}

- (void).cxx_destruct
{
  swift_release();
}

@end