@interface HMDResidentUserModel
+ (id)properties;
- (NSString)displayName;
- (void)setDisplayName:(id)a3;
@end

@implementation HMDResidentUserModel

- (void).cxx_destruct
{
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMDResidentUserModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_1351 != -1) {
    dispatch_once(&properties_onceToken_1351, block);
  }
  v2 = (void *)properties__properties_1352;
  return v2;
}

void __34__HMDResidentUserModel_properties__block_invoke(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)&OBJC_METACLASS___HMDResidentUserModel;
  v2 = objc_msgSendSuper2(&v11, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_1352;
  properties__properties_1352 = v3;

  v5 = (void *)properties__properties_1352;
  v12[0] = @"device";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v13[0] = v6;
  v12[1] = @"configState";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v13[1] = v7;
  v12[2] = @"displayName";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v13[2] = v8;
  v12[3] = @"deviceIdentifier";
  v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  [v5 addEntriesFromDictionary:v10];
}

@end