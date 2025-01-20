@interface HMDAppleMediaAccessoryPowerActionModel
+ (Class)cd_entityClass;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDAppleMediaAccessoryPowerActionModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"accessory"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"accessoryUUID"])
    {
      v11 = [(HMDAppleMediaAccessoryPowerActionModel *)self accessoryUUID];
      v12 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v11 ofManagedObjectType:objc_opt_class() error:0];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
    v12 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v12;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"accessoryUUID"])
  {
    v11 = [v10 accessory];

    v12 = [v11 modelID];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
    v12 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

- (void)loadModelWithActionInformation:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
  id v4 = a3;
  [(HMDActionModel *)&v7 loadModelWithActionInformation:v4];
  v5 = objc_msgSend(v4, "hmf_UUIDForKey:", *MEMORY[0x263F0B9B0], v7.receiver, v7.super_class);
  [(HMDAppleMediaAccessoryPowerActionModel *)self setAccessoryUUID:v5];

  v6 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x263F0B9C0]);

  [(HMDAppleMediaAccessoryPowerActionModel *)self setTargetSleepWakeState:v6];
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDAppleMediaAccessoryPowerActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_236438 != -1) {
    dispatch_once(&properties_onceToken_236438, block);
  }
  v2 = (void *)properties__properties_236439;
  return v2;
}

void __52__HMDAppleMediaAccessoryPowerActionModel_properties__block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x263EF8340];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDAppleMediaAccessoryPowerActionModel;
  v1 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)properties__properties_236439;
  properties__properties_236439 = v2;

  id v4 = (void *)properties__properties_236439;
  v9[0] = @"accessoryUUID";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[1] = @"targetSleepWakeState";
  v10[0] = v5;
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = v6;
  objc_super v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addEntriesFromDictionary:v7];
}

@end