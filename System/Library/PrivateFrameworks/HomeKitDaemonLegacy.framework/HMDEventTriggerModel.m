@interface HMDEventTriggerModel
+ (id)properties;
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
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMDEventTriggerModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_31208 != -1) {
    dispatch_once(&properties_onceToken_31208, block);
  }
  v2 = (void *)properties__properties_31209;
  return v2;
}

void __34__HMDEventTriggerModel_properties__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDEventTriggerModel;
  v2 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  id v4 = (void *)properties__properties_31209;
  properties__properties_31209 = v3;

  v5 = (void *)properties__properties_31209;
  v11[0] = @"evaluationCondition";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v6;
  v11[1] = @"recurrences";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v7;
  v11[2] = @"executeOnce";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 addEntriesFromDictionary:v9];
}

@end