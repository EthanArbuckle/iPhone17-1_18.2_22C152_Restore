@interface _SNLogMelSpectrogramCustomModel
- (_SNLogMelSpectrogramCustomModel)init;
- (_SNLogMelSpectrogramCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _SNLogMelSpectrogramCustomModel

- (_SNLogMelSpectrogramCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1DCB877B8();
  return (_SNLogMelSpectrogramCustomModel *)sub_1DCADD218((objc_class *)a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1DCADBDAC(a3);

  swift_unknownObjectRelease();

  return v10;
}

- (_SNLogMelSpectrogramCustomModel)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end