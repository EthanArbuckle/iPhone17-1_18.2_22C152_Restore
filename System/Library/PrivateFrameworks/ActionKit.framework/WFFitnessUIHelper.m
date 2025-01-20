@interface WFFitnessUIHelper
+ (BOOL)isWheelchairUser;
+ (id)activityTypeForLocalizedActivityName:(id)a3;
+ (id)allActivityTypes;
+ (id)allActivityTypesIncludingWheelchairWorkouts:(BOOL)a3 includingSwimmingWorkouts:(BOOL)a4;
+ (id)quantityTypesForActivityType:(id)a3;
+ (id)timeUnits;
+ (void)preferredUnitsForActivityType:(id)a3 completion:(id)a4;
@end

@implementation WFFitnessUIHelper

+ (id)quantityTypesForActivityType:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09BC0]];
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v4, 0);
  if ([v3 identifier] != 13 || (objc_msgSend(v3, "isIndoor") & 1) == 0)
  {
    uint64_t v6 = [v3 identifier];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v7 = (void (*)(uint64_t))get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr;
    v16 = get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr;
    if (!get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_block_invoke;
      v12[3] = &unk_264E5EC88;
      v12[4] = &v13;
      __get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_block_invoke(v12);
      v7 = (void (*)(uint64_t))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v7)
    {
      v10 = [MEMORY[0x263F08690] currentHandler];
      v11 = [NSString stringWithUTF8String:"HKQuantityType *WFHKWorkoutDistanceTypeForActivityType(HKWorkoutActivityType)"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"WFFitnessUIHelper.m", 22, @"%s", dlerror());

      __break(1u);
      return result;
    }
    v8 = v7(v6);
    if (v8) {
      [v5 addObject:v8];
    }
  }
  return v5;
}

+ (id)timeUnits
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A830] minuteUnit];
  v6[0] = v2;
  id v3 = [MEMORY[0x263F0A830] hourUnit];
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (void)preferredUnitsForActivityType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F0A410];
  id v8 = a3;
  v9 = objc_msgSend(v7, "wf_shortcutsAppHealthStore");
  v10 = [a1 quantityTypesForActivityType:v8];

  v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__WFFitnessUIHelper_preferredUnitsForActivityType_completion___block_invoke;
  v14[3] = &unk_264E58758;
  id v16 = v6;
  id v17 = a1;
  id v15 = v10;
  id v12 = v6;
  id v13 = v10;
  [v9 preferredUnitsForQuantityTypes:v11 completion:v14];
}

void __62__WFFitnessUIHelper_preferredUnitsForActivityType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[WFFitnessUIHelper preferredUnitsForActivityType:completion:]_block_invoke";
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch preferred units for quantity types: %{public}@", buf, 0x16u);
    }
  }
  id v8 = (void *)MEMORY[0x263EFF980];
  v9 = [*(id *)(a1 + 48) timeUnits];
  v10 = [v8 arrayWithArray:v9];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * v15), (void)v17);
        if (v16) {
          [v10 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)isWheelchairUser
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263F0A410], "wf_shortcutsAppHealthStore");
  id v8 = 0;
  id v3 = [v2 wheelchairUseWithError:&v8];
  id v4 = v8;
  if (v3)
  {
    BOOL v5 = [v3 wheelchairUse] == 2;
  }
  else
  {
    id v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "+[WFFitnessUIHelper isWheelchairUser]";
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch wheelchair use: %{public}@", buf, 0x16u);
    }

    BOOL v5 = 0;
  }

  return v5;
}

+ (id)activityTypeForLocalizedActivityName:(id)a3
{
  id v3 = a3;
  id v4 = +[WFFitnessUIHelper allActivityTypesIncludingWheelchairWorkouts:1 includingSwimmingWorkouts:1];
  BOOL v5 = NSDictionary;
  id v6 = [v4 valueForKey:@"localizedName"];
  v7 = [v5 dictionaryWithObjects:v4 forKeys:v6];

  id v8 = [v7 objectForKey:v3];

  return v8;
}

+ (id)allActivityTypesIncludingWheelchairWorkouts:(BOOL)a3 includingSwimmingWorkouts:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v20[3] = *MEMORY[0x263EF8340];
  id v6 = objc_opt_new();
  v7 = [getFIUIWorkoutActivityTypeClass() optimizedActivityTypesWithIsWheelchairUser:v5 isSwimmingSupported:v4];
  id v8 = [getFIUIWorkoutActivityTypeClass() nonOptimizedActivityTypes];
  v9 = (void *)[objc_alloc((Class)getFIUIWorkoutActivityTypeClass()) initWithActivityTypeIdentifier:53 isIndoor:0];
  v20[0] = v9;
  v10 = (void *)[objc_alloc((Class)getFIUIWorkoutActivityTypeClass()) initWithActivityTypeIdentifier:54 isIndoor:0];
  v20[1] = v10;
  __int16 v11 = (void *)[objc_alloc((Class)getFIUIWorkoutActivityTypeClass()) initWithActivityTypeIdentifier:55 isIndoor:0];
  v20[2] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];

  if (v4)
  {
    id v13 = [v8 arrayByAddingObjectsFromArray:v12];
  }
  else
  {
    id v13 = v8;
  }
  uint64_t v14 = v13;
  [v6 addObjectsFromArray:v7];
  [v6 addObjectsFromArray:v14];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"localizedName" ascending:1];
  long long v19 = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  long long v17 = [v6 sortedArrayUsingDescriptors:v16];

  return v17;
}

+ (id)allActivityTypes
{
  BOOL v2 = +[WFFitnessUIHelper isWheelchairUser];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v3 = (uint64_t (*)(void))getFIUIDeviceSupportsSwimmingSymbolLoc_ptr;
  id v12 = getFIUIDeviceSupportsSwimmingSymbolLoc_ptr;
  if (!getFIUIDeviceSupportsSwimmingSymbolLoc_ptr)
  {
    BOOL v4 = FitnessUILibrary();
    v10[3] = (uint64_t)dlsym(v4, "FIUIDeviceSupportsSwimming");
    getFIUIDeviceSupportsSwimmingSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    id v3 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    BOOL v5 = +[WFFitnessUIHelper allActivityTypesIncludingWheelchairWorkouts:v2 includingSwimmingWorkouts:v3()];
    return v5;
  }
  else
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = [NSString stringWithUTF8String:"BOOL WFFIUIDeviceSupportsSwimming(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"WFFitnessUIHelper.m", 19, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

@end