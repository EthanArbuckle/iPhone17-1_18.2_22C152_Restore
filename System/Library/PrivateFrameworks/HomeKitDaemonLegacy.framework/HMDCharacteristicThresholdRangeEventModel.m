@interface HMDCharacteristicThresholdRangeEventModel
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 checkForSupport:(BOOL)a7;
+ (id)properties;
@end

@implementation HMDCharacteristicThresholdRangeEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 checkForSupport:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[HMDCharacteristicEventBaseModel eventModelWithDictionary:v14 home:v13 eventTriggerUUID:v12 className:objc_opt_class() message:v11 checkForSupport:v7 outCharateristic:0];

  v16 = objc_msgSend(v14, "hmf_numberForKey:", @"kCharacteristicThresholdRangeEventThresholdRangeMin");
  [v15 setMin:v16];

  v17 = objc_msgSend(v14, "hmf_numberForKey:", @"kCharacteristicThresholdRangeEventThresholdRangeMax");

  [v15 setMax:v17];
  return v15;
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDCharacteristicThresholdRangeEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_107180 != -1) {
    dispatch_once(&properties_onceToken_107180, block);
  }
  v2 = (void *)properties__properties_107181;
  return v2;
}

void __55__HMDCharacteristicThresholdRangeEventModel_properties__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicThresholdRangeEventModel;
  v2 = objc_msgSendSuper2(&v9, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_107181;
  properties__properties_107181 = v3;

  v5 = (void *)properties__properties_107181;
  v10[0] = @"min";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = @"max";
  v11[0] = v6;
  BOOL v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v5 addEntriesFromDictionary:v8];
}

@end