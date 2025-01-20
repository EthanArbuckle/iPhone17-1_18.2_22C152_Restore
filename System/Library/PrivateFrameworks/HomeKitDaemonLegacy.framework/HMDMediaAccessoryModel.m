@interface HMDMediaAccessoryModel
+ (id)properties;
@end

@implementation HMDMediaAccessoryModel

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HMDMediaAccessoryModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_61199 != -1) {
    dispatch_once(&properties_onceToken_61199, block);
  }
  v2 = (void *)properties__properties_61200;
  return v2;
}

void __36__HMDMediaAccessoryModel_properties__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___HMDMediaAccessoryModel;
  v2 = objc_msgSendSuper2(&v5, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_61200;
  properties__properties_61200 = v3;
}

@end