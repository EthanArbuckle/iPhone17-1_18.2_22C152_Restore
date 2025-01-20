@interface HMDDurationEventModel
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
@end

@implementation HMDDurationEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[HMDEventModel eventModelWithDictionary:v12 home:v11 eventTriggerUUID:v10 className:objc_opt_class() message:v9];

  v14 = objc_msgSend(v12, "hmf_numberForKey:", @"kDurationEventDuration");

  [v13 setDuration:v14];
  return v13;
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDDurationEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_178944 != -1) {
    dispatch_once(&properties_onceToken_178944, block);
  }
  v2 = (void *)properties__properties_178945;
  return v2;
}

void __35__HMDDurationEventModel_properties__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDDurationEventModel;
  v2 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_178945;
  properties__properties_178945 = v3;

  v5 = (void *)properties__properties_178945;
  id v9 = @"duration";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];
}

@end