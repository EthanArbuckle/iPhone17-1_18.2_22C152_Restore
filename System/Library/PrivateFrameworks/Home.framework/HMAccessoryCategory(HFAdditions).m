@interface HMAccessoryCategory(HFAdditions)
+ (id)hf_compatibleServiceTypesForCategoryType:()HFAdditions;
+ (id)hf_standardAccessoryCategoryTypes;
- (id)hf_compatibleServiceTypes;
- (uint64_t)hf_isMediaAccessory;
@end

@implementation HMAccessoryCategory(HFAdditions)

- (uint64_t)hf_isMediaAccessory
{
  if (qword_26AB2F8A8 != -1) {
    dispatch_once(&qword_26AB2F8A8, &__block_literal_global_155);
  }
  v2 = (void *)_MergedGlobals_286;
  v3 = [a1 categoryType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)hf_compatibleServiceTypes
{
  v1 = (void *)MEMORY[0x263F0DF40];
  v2 = [a1 categoryType];
  v3 = objc_msgSend(v1, "hf_compatibleServiceTypesForCategoryType:", v2);

  return v3;
}

+ (id)hf_compatibleServiceTypesForCategoryType:()HFAdditions
{
  id v3 = a3;
  if (![v3 length])
  {
    id v4 = (id)*MEMORY[0x263F0B0D0];

    id v3 = v4;
  }
  if (qword_26AB2F8B8 != -1) {
    dispatch_once(&qword_26AB2F8B8, &__block_literal_global_3_21);
  }
  v5 = [(id)qword_26AB2F8B0 objectForKeyedSubscript:v3];

  return v5;
}

+ (id)hf_standardAccessoryCategoryTypes
{
  if (qword_26AB2F8C8 != -1) {
    dispatch_once(&qword_26AB2F8C8, &__block_literal_global_7_6);
  }
  v0 = (void *)qword_26AB2F8C0;
  return v0;
}

@end