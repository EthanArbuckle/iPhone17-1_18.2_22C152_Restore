@interface HKCategoryType(HKEnumeratedCategoryValues)
- (id)hk_enumeratedCategoryValueLabelsWithHealthStore:()HKEnumeratedCategoryValues;
@end

@implementation HKCategoryType(HKEnumeratedCategoryValues)

- (id)hk_enumeratedCategoryValueLabelsWithHealthStore:()HKEnumeratedCategoryValues
{
  v4 = (void *)MEMORY[0x1E4F2B2C0];
  id v5 = a3;
  v6 = [a1 identifier];
  v7 = [v4 categoryTypeForIdentifier:v6];

  v8 = +[HKDisplayTypeController sharedInstanceForHealthStore:v5];

  v9 = [v8 displayTypeForObjectType:v7];
  v10 = +[HKDisplayType hk_enumeratedValueLabelsWithDisplayTypeIdentifier:](HKDisplayType, "hk_enumeratedValueLabelsWithDisplayTypeIdentifier:", [v9 displayTypeIdentifier]);

  return v10;
}

@end