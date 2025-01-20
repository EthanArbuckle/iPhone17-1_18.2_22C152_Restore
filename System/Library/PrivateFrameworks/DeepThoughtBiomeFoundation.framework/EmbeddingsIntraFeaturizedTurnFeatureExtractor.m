@interface EmbeddingsIntraFeaturizedTurnFeatureExtractor
- (_TtC26DeepThoughtBiomeFoundation45EmbeddingsIntraFeaturizedTurnFeatureExtractor)init;
@end

@implementation EmbeddingsIntraFeaturizedTurnFeatureExtractor

- (_TtC26DeepThoughtBiomeFoundation45EmbeddingsIntraFeaturizedTurnFeatureExtractor)init
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation45EmbeddingsIntraFeaturizedTurnFeatureExtractor_defaultModelVersion);
  void *v2 = 0x3030322E30303333;
  v2[1] = 0xEB00000000302E30;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC26DeepThoughtBiomeFoundation45EmbeddingsIntraFeaturizedTurnFeatureExtractor_defaultLocale);
  void *v3 = 0x53552D6E65;
  v3[1] = 0xE500000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmbeddingsIntraFeaturizedTurnFeatureExtractor();
  return [(IntraFeaturizedTurnFeatureExtractor *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end