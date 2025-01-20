@interface _SNSoundPrintKFeatureEmbeddingCustomModel
- (_SNSoundPrintKFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _SNSoundPrintKFeatureEmbeddingCustomModel

- (_SNSoundPrintKFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  return (_SNSoundPrintKFeatureEmbeddingCustomModel *)sub_1DC9C79C8((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(void *, uint64_t))sub_1DC9C648C);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1DC9C8130(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, id))sub_1DC9C666C);
}

@end