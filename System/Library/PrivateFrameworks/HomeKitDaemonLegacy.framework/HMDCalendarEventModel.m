@interface HMDCalendarEventModel
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDCalendarEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_9753 != -1) {
    dispatch_once(&properties_onceToken_9753, block);
  }
  v2 = (void *)properties__properties_9754;
  return v2;
}

void __35__HMDCalendarEventModel_properties__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDCalendarEventModel;
  v2 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_9754;
  properties__properties_9754 = v3;

  v5 = (void *)properties__properties_9754;
  id v9 = @"fireDateComponents";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];
}

@end