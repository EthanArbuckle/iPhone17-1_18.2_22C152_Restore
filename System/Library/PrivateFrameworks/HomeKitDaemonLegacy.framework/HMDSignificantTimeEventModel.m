@interface HMDSignificantTimeEventModel
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
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
    v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v12 respondWithError:v19];

LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v18 = [v12 responseHandler];

  if (v18)
  {
    id v14 = [v12 responseHandler];
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    (*((void (**)(id, void *, void))v14 + 2))(v14, v15, 0);
    goto LABEL_7;
  }
  v17 = 0;
LABEL_10:

  return v17;
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HMDSignificantTimeEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_65739 != -1) {
    dispatch_once(&properties_onceToken_65739, block);
  }
  v2 = (void *)properties__properties_65740;
  return v2;
}

void __42__HMDSignificantTimeEventModel_properties__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDSignificantTimeEventModel;
  v2 = objc_msgSendSuper2(&v9, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_65740;
  properties__properties_65740 = v3;

  v5 = (void *)properties__properties_65740;
  v10[0] = @"significantEvent";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = @"offset";
  v11[0] = v6;
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v5 addEntriesFromDictionary:v8];
}

@end