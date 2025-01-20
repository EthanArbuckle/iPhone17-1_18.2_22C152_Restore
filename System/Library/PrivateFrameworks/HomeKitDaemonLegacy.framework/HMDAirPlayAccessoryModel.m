@interface HMDAirPlayAccessoryModel
+ (id)properties;
@end

@implementation HMDAirPlayAccessoryModel

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HMDAirPlayAccessoryModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_88686 != -1) {
    dispatch_once(&properties_onceToken_88686, block);
  }
  v2 = (void *)properties__properties_88687;
  return v2;
}

void __38__HMDAirPlayAccessoryModel_properties__block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v14.receiver = *(id *)(a1 + 32);
  v14.super_class = (Class)&OBJC_METACLASS___HMDAirPlayAccessoryModel;
  v2 = objc_msgSendSuper2(&v14, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_88687;
  properties__properties_88687 = v3;

  v5 = (void *)properties__properties_88687;
  v19 = @"pairingIdentity";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v20[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v5 addEntriesFromDictionary:v7];

  v8 = (void *)properties__properties_88687;
  v17 = @"password";
  v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v18 = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v8 addEntriesFromDictionary:v10];

  v11 = (void *)properties__properties_88687;
  v15 = @"minimumUserPriviledge";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v16 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v11 addEntriesFromDictionary:v13];
}

@end