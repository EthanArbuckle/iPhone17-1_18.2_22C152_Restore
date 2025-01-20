@interface HMDCalendarEventModel
+ (Class)cd_entityClass;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDCalendarEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 dateComponentsFromDataForKey:@"kCalendarTimeEventFireDateComponents"];
  if (+[HMDTimeEvent isValidAbsoluteDateComponents:v13])
  {
    v14 = +[HMDEventModel eventModelWithDictionary:v9 home:v10 eventTriggerUUID:v11 className:objc_opt_class() message:v12];
    v15 = objc_msgSend(v9, "hmf_dataForKey:", @"kCalendarTimeEventFireDateComponents");
    [v14 setFireDateComponents:v15];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDCalendarEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_13778 != -1) {
    dispatch_once(&properties_onceToken_13778, block);
  }
  v2 = (void *)properties__properties_13779;
  return v2;
}

void __35__HMDCalendarEventModel_properties__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDCalendarEventModel;
  v2 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_13779;
  properties__properties_13779 = v3;

  v5 = (void *)properties__properties_13779;
  id v9 = @"fireDateComponents";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"fireDateComponents"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"fireDateComponents"])
    {
      id v11 = [(HMDCalendarEventModel *)self fireDateComponents];
      id v12 = v11;
      if (v11) {
        [v11 decodeDateComponents];
      }
      else {
      v13 = [MEMORY[0x263EFF9D0] null];
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDCalendarEventModel;
    v13 = [(HMDBackingStoreModelObject *)&v15 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v13;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"fireDateComponents"])
  {
    id v11 = [v10 fireDateComponents];

    if (v11) {
      [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
    }
    else {
    id v12 = [MEMORY[0x263EFF9D0] null];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDCalendarEventModel;
    id v12 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end