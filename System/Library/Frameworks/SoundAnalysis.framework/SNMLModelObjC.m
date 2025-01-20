@interface SNMLModelObjC
- (MLModelDescription)modelDescription;
- (_TtC13SoundAnalysis13SNMLModelObjC)init;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation SNMLModelObjC

- (MLModelDescription)modelDescription
{
  v2 = self;
  v3 = (void *)sub_1DC9709B8();

  return (MLModelDescription *)v3;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_1DC970A04();

  swift_unknownObjectRelease();

  return v9;
}

- (_TtC13SoundAnalysis13SNMLModelObjC)init
{
}

- (void).cxx_destruct
{
}

@end