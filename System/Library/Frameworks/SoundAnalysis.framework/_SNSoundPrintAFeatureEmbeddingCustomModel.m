@interface _SNSoundPrintAFeatureEmbeddingCustomModel
- (_SNSoundPrintAFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _SNSoundPrintAFeatureEmbeddingCustomModel

- (_SNSoundPrintAFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  return (_SNSoundPrintAFeatureEmbeddingCustomModel *)sub_1DC9C79C8((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(void *, uint64_t))sub_1DC9C7528);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1DC9C8130(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, id))sub_1DC9C7A8C);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end