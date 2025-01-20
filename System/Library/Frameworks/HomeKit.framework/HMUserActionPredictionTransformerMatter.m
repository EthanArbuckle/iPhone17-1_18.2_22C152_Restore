@interface HMUserActionPredictionTransformerMatter
+ (id)matchingMatterAccessoryForTargetIdentifier:(id)a3 home:(id)a4;
- (HMUserActionPredictionTransformerMatter)init;
@end

@implementation HMUserActionPredictionTransformerMatter

+ (id)matchingMatterAccessoryForTargetIdentifier:(id)a3 home:(id)a4
{
  uint64_t v5 = sub_19D457278();
  unint64_t v7 = v6;
  id v8 = a4;
  v9 = (void *)sub_19D1F5A90(v5, v7, (unint64_t)v8);

  swift_bridgeObjectRelease();

  return v9;
}

- (HMUserActionPredictionTransformerMatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HMUserActionPredictionTransformerMatter();
  return [(HMUserActionPredictionTransformerMatter *)&v3 init];
}

@end