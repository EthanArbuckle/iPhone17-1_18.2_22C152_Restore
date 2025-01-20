@interface HMDEventTriggerModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)createPayload;
- (id)createPayloadWithCondition:(id)a3;
@end

@implementation HMDEventTriggerModel

- (id)createPayloadWithCondition:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDEventTriggerModel;
  v5 = [(HMDTriggerModel *)&v12 createPayload];
  v6 = (void *)[v5 mutableCopy];

  if (v4)
  {
    v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    [v6 setObject:v7 forKeyedSubscript:@"kEventTriggerConditionKey"];
  }
  v8 = [(HMDEventTriggerModel *)self recurrences];
  [v6 setObject:v8 forKeyedSubscript:@"kEventTriggerRecurrencesKey"];

  v9 = [(HMDEventTriggerModel *)self executeOnce];
  [v6 setObject:v9 forKeyedSubscript:@"kEventTriggerExecuteOnce"];

  v10 = (void *)[v6 copy];
  return v10;
}

- (id)createPayload
{
  v12.receiver = self;
  v12.super_class = (Class)HMDEventTriggerModel;
  v3 = [(HMDTriggerModel *)&v12 createPayload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDEventTriggerModel *)self evaluationCondition];

  if (v5)
  {
    v6 = [(HMDEventTriggerModel *)self evaluationCondition];
    [v4 setObject:v6 forKeyedSubscript:@"kEventTriggerConditionKey"];
  }
  v7 = [(HMDEventTriggerModel *)self recurrences];

  if (v7)
  {
    v8 = [(HMDEventTriggerModel *)self recurrences];
    [v4 setObject:v8 forKeyedSubscript:@"kEventTriggerRecurrencesKey"];
  }
  v9 = [(HMDEventTriggerModel *)self executeOnce];
  [v4 setObject:v9 forKeyedSubscript:@"kEventTriggerExecuteOnce"];

  v10 = (void *)[v4 copy];
  return v10;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMDEventTriggerModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_44855 != -1) {
    dispatch_once(&properties_onceToken_44855, block);
  }
  v2 = (void *)properties__properties_44856;
  return v2;
}

void __34__HMDEventTriggerModel_properties__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDEventTriggerModel;
  v2 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  id v4 = (void *)properties__properties_44856;
  properties__properties_44856 = v3;

  v5 = (void *)properties__properties_44856;
  v11[0] = @"evaluationCondition";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v6;
  v11[1] = @"recurrences";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v7;
  v11[2] = @"executeOnce";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 addEntriesFromDictionary:v9];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"evaluationCondition"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"evaluationCondition"])
    {
      v11 = [(HMDEventTriggerModel *)self evaluationCondition];
      if (v11) {
        +[HMDPredicateUtilities unarchiveFromData:v11 error:0];
      }
      else {
      v16 = [MEMORY[0x263EFF9D0] null];
      }

      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"recurrences"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"recurrences"])
    {
LABEL_11:
      v16 = 0;
      goto LABEL_16;
    }
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    if ([v9 isEqualToString:@"recurrenceDays"])
    {
      if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"recurrences"])
      {
        v13 = NSNumber;
        v14 = [(HMDEventTriggerModel *)self recurrences];
        v15 = [v14 decodeArrayOfDateComponents];
        v16 = [v13 numberWithUnsignedInteger:HMDaysOfTheWeekFromDateComponents()];

        goto LABEL_16;
      }
      goto LABEL_11;
    }
    v18.receiver = self;
    v18.super_class = (Class)HMDEventTriggerModel;
    uint64_t v12 = [(HMDTriggerModel *)&v18 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }
  v16 = (void *)v12;
LABEL_16:

  return v16;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"evaluationCondition"])
  {
    v11 = [v8 evaluationCondition];
    if (v11) {
      [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
    }
    else {
    v16 = [MEMORY[0x263EFF9D0] null];
    }

    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"recurrences"])
  {
    uint64_t v12 = [v8 recurrenceDays];
    uint64_t v13 = [v12 unsignedIntegerValue];

    if (v13)
    {
      v14 = (void *)MEMORY[0x263F08910];
      v15 = HMDaysOfTheWeekToDateComponents();
      v16 = [v14 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];

      goto LABEL_12;
    }
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDEventTriggerModel;
    uint64_t v17 = [(HMDTriggerModel *)&v19 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }
  v16 = (void *)v17;
LABEL_12:

  return v16;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

@end