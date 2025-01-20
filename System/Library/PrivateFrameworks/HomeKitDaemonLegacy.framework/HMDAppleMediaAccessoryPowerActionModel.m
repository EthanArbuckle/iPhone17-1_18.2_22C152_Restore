@interface HMDAppleMediaAccessoryPowerActionModel
+ (id)properties;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDAppleMediaAccessoryPowerActionModel

- (void)loadModelWithActionInformation:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
  id v4 = a3;
  [(HMDActionModel *)&v7 loadModelWithActionInformation:v4];
  v5 = objc_msgSend(v4, "hmf_UUIDForKey:", *MEMORY[0x1E4F2C9A8], v7.receiver, v7.super_class);
  [(HMDAppleMediaAccessoryPowerActionModel *)self setAccessoryUUID:v5];

  v6 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x1E4F2C9B8]);

  [(HMDAppleMediaAccessoryPowerActionModel *)self setTargetSleepWakeState:v6];
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HMDAppleMediaAccessoryPowerActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_40227 != -1) {
    dispatch_once(&properties_onceToken_40227, block);
  }
  v2 = (void *)properties__properties_40228;
  return v2;
}

void __52__HMDAppleMediaAccessoryPowerActionModel_properties__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDAppleMediaAccessoryPowerActionModel;
  v1 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)properties__properties_40228;
  properties__properties_40228 = v2;

  id v4 = (void *)properties__properties_40228;
  v9[0] = @"accessoryUUID";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[1] = @"targetSleepWakeState";
  v10[0] = v5;
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addEntriesFromDictionary:v7];
}

@end