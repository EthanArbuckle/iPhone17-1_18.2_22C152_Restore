@interface _SNVGGishFrontEndProcessingCustomModel
- (_SNVGGishFrontEndProcessingCustomModel)init;
- (_SNVGGishFrontEndProcessingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _SNVGGishFrontEndProcessingCustomModel

- (_SNVGGishFrontEndProcessingCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  return (_SNVGGishFrontEndProcessingCustomModel *)sub_1DCABF460(a3);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  id v10 = sub_1DCABFD3C(a3);

  swift_unknownObjectRelease();

  return v10;
}

- (_SNVGGishFrontEndProcessingCustomModel)init
{
}

- (void).cxx_destruct
{
}

@end