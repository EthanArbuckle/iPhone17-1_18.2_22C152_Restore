@interface HMDEventModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
@end

@implementation HMDEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7
{
  id v9 = a5;
  id v10 = a3;
  v11 = objc_msgSend(v10, "hmf_UUIDForKey:", @"kEventUUIDKey");
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x263F08C38] UUID];
  }
  v14 = v13;

  v15 = (void *)[[a6 alloc] initWithObjectChangeType:1 uuid:v14 parentUUID:v9];
  v16 = objc_msgSend(v10, "hmf_numberForKey:", @"kEventTriggerEndEvent");

  [v15 setEndEvent:v16];
  return v15;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  return 0;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HMDEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_160073 != -1) {
    dispatch_once(&properties_onceToken_160073, block);
  }
  v2 = (void *)properties__properties_160074;
  return v2;
}

void __27__HMDEventModel_properties__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDEventModel;
  v2 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_160074;
  properties__properties_160074 = v3;

  v5 = (void *)properties__properties_160074;
  id v9 = @"endEvent";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"trigger";
}

@end