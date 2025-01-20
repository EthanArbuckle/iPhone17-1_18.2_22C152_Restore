@interface HMDCharacteristicEventModel
+ (Class)cd_entityClass;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 checkForSupport:(BOOL)a7 error:(id *)a8;
+ (id)properties;
@end

@implementation HMDCharacteristicEventModel

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 checkForSupport:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v25 = 0;
  v17 = +[HMDCharacteristicEventBaseModel eventModelWithDictionary:v16 home:v15 eventTriggerUUID:v14 className:objc_opt_class() message:v13 checkForSupport:v9 outCharateristic:&v25];

  id v18 = v25;
  v19 = [v16 objectForKeyedSubscript:@"kCharacteristicValue"];

  id v24 = v19;
  v20 = [v18 validateValueForNotify:v19 outValue:&v24];
  id v21 = v24;
  if (v20)
  {
    id v22 = 0;
    if (a8) {
      *a8 = v20;
    }
  }
  else
  {
    [v17 setEventValue:v21];
    id v22 = v17;
  }

  return v22;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HMDCharacteristicEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_213833 != -1) {
    dispatch_once(&properties_onceToken_213833, block);
  }
  v2 = (void *)properties__properties_213834;
  return v2;
}

void __41__HMDCharacteristicEventModel_properties__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicEventModel;
  v2 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_213834;
  properties__properties_213834 = v3;

  v5 = (void *)properties__properties_213834;
  BOOL v9 = @"eventValue";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];
}

@end