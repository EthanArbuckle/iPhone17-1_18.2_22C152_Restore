@interface HFCharacteristicEventBuilder(HREAdditions)
- (id)recommendableObjectsInvolved;
@end

@implementation HFCharacteristicEventBuilder(HREAdditions)

- (id)recommendableObjectsInvolved
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a1 characteristic];
  v4 = [v3 service];
  v12[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v6 = [v2 setWithArray:v5];
  v7 = +[HRERecommendableObjectUtilities recommendableObjectsFromHomeKitObjects:v6];
  v8 = [a1 characteristic];
  v9 = [v8 service];
  v10 = [v7 setByAddingObject:v9];

  return v10;
}

@end