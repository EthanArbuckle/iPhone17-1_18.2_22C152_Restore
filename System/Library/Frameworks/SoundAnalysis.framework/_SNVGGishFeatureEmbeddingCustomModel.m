@interface _SNVGGishFeatureEmbeddingCustomModel
- (_SNVGGishFeatureEmbeddingCustomModel)init;
- (_SNVGGishFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _SNVGGishFeatureEmbeddingCustomModel

- (_SNVGGishFeatureEmbeddingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  return (_SNVGGishFeatureEmbeddingCustomModel *)sub_1DC923788(a3);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1DC923954((uint64_t)a3, (uint64_t)v8);

  swift_unknownObjectRelease();

  return v10;
}

- (_SNVGGishFeatureEmbeddingCustomModel)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end