@interface HMDTimerTriggerModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)createPayload;
@end

@implementation HMDTimerTriggerModel

- (id)createPayload
{
  v18.receiver = self;
  v18.super_class = (Class)HMDTimerTriggerModel;
  v3 = [(HMDTriggerModel *)&v18 createPayload];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDTimerTriggerModel *)self fireDate];

  if (v5)
  {
    v6 = [(HMDTimerTriggerModel *)self fireDate];
    [v4 setObject:v6 forKeyedSubscript:@"kTimerTriggerInitialFireDateKey"];
  }
  v7 = [(HMDTimerTriggerModel *)self fireDateTimeZone];

  if (v7)
  {
    v8 = [(HMDTimerTriggerModel *)self fireDateTimeZone];
    [v4 setObject:v8 forKeyedSubscript:@"kTimerTriggerTimeZoneDataKey"];
  }
  v9 = [(HMDTimerTriggerModel *)self fireRepeatInterval];

  if (v9)
  {
    v10 = [(HMDTimerTriggerModel *)self fireRepeatInterval];
    [v4 setObject:v10 forKeyedSubscript:@"kTimerTriggerRecurrenceDataKey"];
  }
  v11 = [(HMDTimerTriggerModel *)self recurrences];

  if (v11)
  {
    v12 = [(HMDTimerTriggerModel *)self recurrences];
    [v4 setObject:v12 forKeyedSubscript:@"kTimerTriggerRecurrencesKey"];
  }
  v13 = [(HMDTimerTriggerModel *)self significantEvent];

  if (v13)
  {
    v14 = [(HMDTimerTriggerModel *)self significantEvent];
    [v4 setObject:v14 forKeyedSubscript:@"kTimerTriggerSignificantEventKey"];
  }
  v15 = [(HMDTimerTriggerModel *)self significantEventOffset];

  if (v15)
  {
    v16 = [(HMDTimerTriggerModel *)self significantEventOffset];
    [v4 setObject:v16 forKeyedSubscript:@"kTimerTriggerSignificantEventOffsetKey"];
  }
  return v4;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMDTimerTriggerModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_40160 != -1) {
    dispatch_once(&properties_onceToken_40160, block);
  }
  v2 = (void *)properties__properties_40161;
  return v2;
}

void __34__HMDTimerTriggerModel_properties__block_invoke(uint64_t a1)
{
  v15[6] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___HMDTimerTriggerModel;
  v2 = objc_msgSendSuper2(&v13, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_40161;
  properties__properties_40161 = v3;

  v5 = (void *)properties__properties_40161;
  v14[0] = @"fireDate";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[0] = v6;
  v14[1] = @"fireDateTimeZone";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[1] = v7;
  v14[2] = @"significantEvent";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[2] = v8;
  v14[3] = @"significantEventOffset";
  v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[3] = v9;
  v14[4] = @"fireRepeatInterval";
  v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[4] = v10;
  v14[5] = @"recurrences";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v15[5] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:6];
  [v5 addEntriesFromDictionary:v12];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"fireDateTimeZone"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"fireDateTimeZone"])
    {
      v11 = [(HMDTimerTriggerModel *)self fireDateTimeZone];
      v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 decodeTimeZone];
LABEL_15:
        v17 = (void *)v13;

        goto LABEL_26;
      }
      goto LABEL_14;
    }
    goto LABEL_25;
  }
  if ([v9 isEqualToString:@"fireRepeatInterval"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"fireRepeatInterval"])
    {
      v14 = [(HMDTimerTriggerModel *)self fireRepeatInterval];
      v12 = v14;
      if (v14)
      {
        uint64_t v13 = [v14 decodeDateComponents];
        goto LABEL_15;
      }
LABEL_14:
      uint64_t v13 = [MEMORY[0x263EFF9D0] null];
      goto LABEL_15;
    }
    goto LABEL_25;
  }
  if ([v9 isEqualToString:@"recurrences"])
  {
    v15 = @"recurrences";
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"recurrenceDays"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"recurrences"]) {
      goto LABEL_25;
    }
    objc_super v18 = NSNumber;
    v19 = [(HMDTimerTriggerModel *)self recurrences];
    v20 = [v19 decodeArrayOfDateComponents];
    uint64_t v21 = [v18 numberWithUnsignedInteger:HMDaysOfTheWeekFromDateComponents()];
LABEL_24:
    v17 = (void *)v21;

    goto LABEL_26;
  }
  if ([v9 isEqualToString:@"significantEventOffset"])
  {
    v15 = @"significantEventOffset";
LABEL_11:
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:v15])
    {
      uint64_t v16 = [MEMORY[0x263EFF9D0] null];
LABEL_13:
      v17 = (void *)v16;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (![v9 isEqualToString:@"significantEventOffsetSeconds"])
  {
    v24.receiver = self;
    v24.super_class = (Class)HMDTimerTriggerModel;
    uint64_t v16 = [(HMDTriggerModel *)&v24 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
    goto LABEL_13;
  }
  if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"significantEventOffset"])
  {
    v22 = NSNumber;
    v19 = [(HMDTimerTriggerModel *)self significantEventOffset];
    v20 = [v19 decodeDateComponents];
    uint64_t v21 = objc_msgSend(v22, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v20, 0));
    goto LABEL_24;
  }
LABEL_25:
  v17 = 0;
LABEL_26:

  return v17;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"fireDateTimeZone"])
  {
    uint64_t v11 = [v8 fireDateTimeZone];
    goto LABEL_5;
  }
  if ([v9 isEqualToString:@"fireRepeatInterval"])
  {
    uint64_t v11 = [v8 fireRepeatInterval];
LABEL_5:
    v12 = (void *)v11;
    if (v11)
    {
LABEL_6:
      uint64_t v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
LABEL_13:
      objc_super v18 = (void *)v13;

      goto LABEL_14;
    }
LABEL_12:
    uint64_t v13 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_13;
  }
  if ([v9 isEqualToString:@"recurrences"])
  {
    v14 = [v8 recurrenceDays];
    uint64_t v15 = [v14 unsignedIntegerValue];

    if (v15)
    {
      uint64_t v16 = (void *)MEMORY[0x263F08910];
      v17 = HMDaysOfTheWeekToDateComponents();
      objc_super v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];

      goto LABEL_14;
    }
    uint64_t v21 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    if ([v9 isEqualToString:@"significantEventOffset"])
    {
      v19 = [v8 significantEventOffsetSeconds];
      v12 = HMDTimeOffsetToDateComponents([v19 integerValue], 0);

      if (v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
    v22.receiver = self;
    v22.super_class = (Class)HMDTimerTriggerModel;
    uint64_t v21 = [(HMDTriggerModel *)&v22 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }
  objc_super v18 = (void *)v21;
LABEL_14:

  return v18;
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