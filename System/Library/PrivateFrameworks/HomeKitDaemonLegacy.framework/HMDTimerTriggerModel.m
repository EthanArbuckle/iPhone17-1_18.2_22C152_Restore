@interface HMDTimerTriggerModel
+ (id)properties;
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMDTimerTriggerModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_27625 != -1) {
    dispatch_once(&properties_onceToken_27625, block);
  }
  v2 = (void *)properties__properties_27626;
  return v2;
}

void __34__HMDTimerTriggerModel_properties__block_invoke(uint64_t a1)
{
  v15[6] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___HMDTimerTriggerModel;
  v2 = objc_msgSendSuper2(&v13, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_27626;
  properties__properties_27626 = v3;

  v5 = (void *)properties__properties_27626;
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
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:6];
  [v5 addEntriesFromDictionary:v12];
}

@end