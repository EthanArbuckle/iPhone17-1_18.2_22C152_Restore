@interface HMDApplicationDataModel
+ (id)properties;
+ (id)schemaHashRoot;
@end

@implementation HMDApplicationDataModel

+ (id)properties
{
  if (properties_onceToken_11655 != -1) {
    dispatch_once(&properties_onceToken_11655, &__block_literal_global_127);
  }
  v2 = (void *)properties__properties_11656;
  return v2;
}

void __37__HMDApplicationDataModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"appDataDictionary";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_11656;
  properties__properties_11656 = v1;
}

+ (id)schemaHashRoot
{
  return @"3510B4A9-09DF-435C-B6C8-2B7A90888CE7";
}

@end