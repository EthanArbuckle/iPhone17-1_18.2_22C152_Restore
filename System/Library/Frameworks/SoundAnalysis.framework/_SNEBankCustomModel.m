@interface _SNEBankCustomModel
- (_SNEBankCustomModel)init;
- (_SNEBankCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _SNEBankCustomModel

- (_SNEBankCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1DCB877B8();
  return (_SNEBankCustomModel *)sub_1DCA411B4(a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1DCA41574(a3);

  swift_unknownObjectRelease();

  return v10;
}

- (_SNEBankCustomModel)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end