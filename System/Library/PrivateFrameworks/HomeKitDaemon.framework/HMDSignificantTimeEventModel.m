@interface HMDSignificantTimeEventModel
+ (Class)cd_entityClass;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDSignificantTimeEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 dateComponentsFromDataForKey:@"kSignificantTimeEventOffset"];
  if (+[HMDTimeEvent isValidOffsetDateComponents:v13])
  {
    id v14 = +[HMDEventModel eventModelWithDictionary:v9 home:v10 eventTriggerUUID:v11 className:objc_opt_class() message:v12];
    v15 = objc_msgSend(v9, "hmf_stringForKey:", @"kSignificantTimeEventSignificantEvent");
    if (HMIsValidSignificantEvent())
    {
      [v14 setSignificantEvent:v15];
      v16 = objc_msgSend(v9, "hmf_dataForKey:", @"kSignificantTimeEventOffset");
      [v14 setOffset:v16];

      id v14 = v14;
      v17 = v14;
LABEL_8:

      goto LABEL_10;
    }
    v19 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v12 respondWithError:v19];

LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v18 = [v12 responseHandler];

  if (v18)
  {
    id v14 = [v12 responseHandler];
    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    (*((void (**)(id, void *, void))v14 + 2))(v14, v15, 0);
    goto LABEL_7;
  }
  v17 = 0;
LABEL_10:

  return v17;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HMDSignificantTimeEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_98106 != -1) {
    dispatch_once(&properties_onceToken_98106, block);
  }
  v2 = (void *)properties__properties_98107;
  return v2;
}

void __42__HMDSignificantTimeEventModel_properties__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDSignificantTimeEventModel;
  v2 = objc_msgSendSuper2(&v9, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_98107;
  properties__properties_98107 = v3;

  v5 = (void *)properties__properties_98107;
  v10[0] = @"significantEvent";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = @"offset";
  v11[0] = v6;
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v5 addEntriesFromDictionary:v8];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"offset"])
  {
    if (![v9 isEqualToString:@"offsetSeconds"])
    {
      v17.receiver = self;
      v17.super_class = (Class)HMDSignificantTimeEventModel;
      uint64_t v11 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
      goto LABEL_9;
    }
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"offset"])
    {
      id v12 = NSNumber;
      v13 = [(HMDSignificantTimeEventModel *)self offset];
      id v14 = [v13 decodeDateComponents];
      v15 = objc_msgSend(v12, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v14, 0));

      goto LABEL_10;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_10;
  }
  if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"offset"]) {
    goto LABEL_7;
  }
  uint64_t v11 = [MEMORY[0x263EFF9D0] null];
LABEL_9:
  v15 = (void *)v11;
LABEL_10:

  return v15;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"offset"])
  {
    uint64_t v11 = [v10 offsetSeconds];

    HMDTimeOffsetToDateComponents([v11 integerValue], 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10) {
      [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
    }
    else {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDSignificantTimeEventModel;
    uint64_t v12 = [(HMDBackingStoreModelObject *)&v15 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  v13 = (void *)v12;

  return v13;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end