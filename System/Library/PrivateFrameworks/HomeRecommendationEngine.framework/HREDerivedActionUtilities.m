@interface HREDerivedActionUtilities
+ (id)_derivedActionForActionableObject:(id)a3 actionType:(id)a4 actions:(id)a5;
+ (id)_derivedActionForCharacteristic:(id)a3 withExistingValues:(id)a4;
+ (id)_derivedActionForMediaProfiles:(id)a3 withExistingValues:(id)a4;
+ (id)_filterActions:(id)a3 withAccessoriesPassingTest:(id)a4;
+ (id)_filterActions:(id)a3 withUnmatchedCharacteristicTypes:(id)a4;
+ (id)_serviceTypesExtrapolatingFromWholeHome;
+ (id)_serviceTypesExtrapolatingFromZones;
+ (id)actionType:(id)a3;
+ (id)actionTypeAlias;
+ (id)actionTypeForActionClass:(Class)a3;
+ (id)actionTypeForCharacteristic:(id)a3;
+ (id)actionTypeForServiceType:(id)a3 characteristicType:(id)a4;
+ (id)actionTypesForProfile:(id)a3;
+ (id)characteristicTypeAlias;
+ (id)characteristicTypeForActionType:(id)a3 serviceType:(id)a4;
+ (id)derivedActionsForActionableObjects:(id)a3 fromActions:(id)a4;
+ (id)serviceTypeAlias;
@end

@implementation HREDerivedActionUtilities

+ (id)actionType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v7 characteristic];
    v9 = [a1 actionTypeForCharacteristic:v8];
  }
  else
  {
    v9 = [a1 actionTypeForActionClass:objc_opt_class()];
  }

  return v9;
}

+ (id)actionTypeForActionClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [a1 actionTypeAlias];
  v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = v6;
  if (!v6) {
    v6 = v4;
  }
  id v8 = v6;

  return v8;
}

+ (id)actionTypeForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [v4 service];
  v6 = [v5 associatedServiceType];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [v4 service];
    id v8 = [v9 serviceType];
  }
  v10 = [v4 characteristicType];
  v11 = [a1 actionTypeForServiceType:v8 characteristicType:v10];

  return v11;
}

+ (id)actionTypeForServiceType:(id)a3 characteristicType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 serviceTypeAlias];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = v7;
  }
  id v12 = v11;

  v13 = [a1 characteristicTypeAlias];
  uint64_t v14 = [v13 objectForKeyedSubscript:v6];
  v15 = (void *)v14;
  if (v14) {
    v16 = (void *)v14;
  }
  else {
    v16 = v6;
  }
  id v17 = v16;

  if (v12 && v17)
  {
    v18 = [NSString stringWithFormat:@"%@:%@", v12, v17];
    v19 = [a1 actionTypeAlias];
    uint64_t v20 = [v19 objectForKeyedSubscript:v18];
    v21 = (void *)v20;
    if (v20) {
      v22 = (void *)v20;
    }
    else {
      v22 = v18;
    }
    id v23 = v22;
  }
  else
  {
    if (_MergedGlobals_27 != -1) {
      dispatch_once(&_MergedGlobals_27, &__block_literal_global_3_9);
    }
    id v23 = (id)qword_268944CD8;
  }

  return v23;
}

void __73__HREDerivedActionUtilities_actionTypeForServiceType_characteristicType___block_invoke_2()
{
  v0 = (void *)qword_268944CD8;
  qword_268944CD8 = (uint64_t)&stru_26EAB1AB0;
}

+ (id)characteristicTypeForActionType:(id)a3 serviceType:(id)a4
{
  id v5 = a3;
  if ([v5 containsString:a4])
  {
    id v6 = [v5 componentsSeparatedByString:@":"];
    if ([v6 count] == 2)
    {
      id v7 = [v6 objectAtIndexedSubscript:1];
      if ([v7 length]) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)actionTypesForProfile:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 set];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v16[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    uint64_t v12 = [v8 setWithArray:v11];

    id v6 = (void *)v12;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__HREDerivedActionUtilities_actionTypesForProfile___block_invoke;
  v15[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v15[4] = a1;
  v13 = objc_msgSend(v6, "na_map:", v15);

  return v13;
}

id __51__HREDerivedActionUtilities_actionTypesForProfile___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 actionTypeAlias];
  id v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = v5;
  if (!v5) {
    id v5 = v3;
  }
  id v7 = v5;

  return v7;
}

+ (id)derivedActionsForActionableObjects:(id)a3 fromActions:(id)a4
{
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke;
  v20[3] = &__block_descriptor_40_e38____NSCopying__16__0__HFActionBuilder_8l;
  v20[4] = a1;
  id v6 = a3;
  id v7 = objc_msgSend(a4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v20);
  id v8 = [MEMORY[0x263EFF9C0] set];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_2;
  v16 = &unk_264CF49B8;
  id v18 = v8;
  id v19 = a1;
  id v17 = v7;
  id v9 = v8;
  id v10 = v7;
  objc_msgSend(v6, "na_each:", &v13);

  v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

uint64_t __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) actionType:a2];
}

void __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9C0] set];
  id v5 = [MEMORY[0x263EFF9C0] set];
  id v6 = objc_msgSend(v3, "hre_actionTypes");
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = [*(id *)(a1 + 32) allKeys];
  id v9 = [v7 setWithArray:v8];
  id v10 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v9);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_3;
  v18[3] = &unk_264CF4990;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  id v22 = v5;
  uint64_t v23 = v12;
  id v19 = v11;
  id v20 = v3;
  id v21 = v4;
  id v13 = v5;
  id v14 = v4;
  id v15 = v3;
  objc_msgSend(v10, "na_each:", v18);
  v16 = *(void **)(a1 + 40);
  id v17 = [*(id *)(a1 + 48) _filterActions:v14 withUnmatchedCharacteristicTypes:v13];
  [v16 unionSet:v17];
}

void __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_3(id *a1, void *a2)
{
  id v7 = a2;
  id v3 = [a1[4] objectForKeyedSubscript:v7];
  id v4 = [a1[8] _derivedActionForActionableObject:a1[5] actionType:v7 actions:v3];
  if (v4)
  {
    [a1[6] addObject:v4];
  }
  else
  {
    id v5 = objc_msgSend(a1[5], "hre_characteristicTypeForActionType:", v7);
    if (v5) {
      id v6 = v5;
    }
    else {
      id v6 = v7;
    }
    [a1[7] addObject:v6];
  }
}

+ (id)_derivedActionForActionableObject:(id)a3 actionType:(id)a4 actions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_msgSend(v8, "hre_parentRoom");
  id v13 = objc_msgSend(v12, "hf_allZones");
  id v14 = [v11 setWithArray:v13];

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke;
  v43[3] = &unk_264CF49E0;
  id v15 = v8;
  id v44 = v15;
  v16 = [a1 _filterActions:v10 withAccessoriesPassingTest:v43];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_2;
  v41[3] = &unk_264CF49E0;
  id v17 = v14;
  id v42 = v17;
  id v18 = [a1 _filterActions:v10 withAccessoriesPassingTest:v41];
  id v19 = v16;
  id v20 = [a1 _serviceTypesExtrapolatingFromZones];
  id v21 = objc_msgSend(v15, "hre_matchingTypes");
  if ([v20 intersectsSet:v21])
  {
    uint64_t v22 = [v19 count];

    id v23 = v19;
    if (v22) {
      goto LABEL_6;
    }
    id v23 = v18;
    id v20 = v19;
  }
  else
  {

    id v23 = v19;
  }

LABEL_6:
  v24 = objc_msgSend(a1, "_serviceTypesExtrapolatingFromWholeHome", v18);
  v25 = objc_msgSend(v15, "hre_matchingTypes");
  if ([v24 intersectsSet:v25])
  {
    uint64_t v26 = [v23 count];

    if (v26) {
      goto LABEL_11;
    }
    v24 = v23;
    id v23 = v10;
  }
  else
  {
  }
LABEL_11:
  v27 = objc_msgSend(v23, "na_map:", &__block_literal_global_25_0);
  v28 = [a1 actionTypeForActionClass:objc_opt_class()];
  int v29 = [v9 isEqualToString:v28];

  if (v29)
  {
    v30 = objc_msgSend(v15, "hf_containedProfiles");
    v31 = objc_msgSend(v30, "na_map:", &__block_literal_global_28);

    v32 = [a1 _derivedActionForMediaProfiles:v31 withExistingValues:v27];
  }
  else
  {
    v33 = objc_msgSend(v15, "hre_characteristics");
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_5;
    v38[3] = &unk_264CF4A08;
    id v39 = v9;
    id v40 = a1;
    v34 = objc_msgSend(v33, "na_filter:", v38);

    v35 = [v34 anyObject];
    v32 = [a1 _derivedActionForCharacteristic:v35 withExistingValues:v27];

    v31 = v39;
  }

  return v32;
}

uint64_t __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 room];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "hre_parentRoom");
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [a2 room];
  uint64_t v5 = objc_msgSend(v4, "hf_allZones");
  id v6 = [v3 setWithArray:v5];
  uint64_t v7 = [v2 intersectsSet:v6];

  return v7;
}

id __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 targetValue];
  }
  else
  {
    objc_opt_class();
    id v6 = v3;
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (v8) {
      id v9 = v8;
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

id __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26EAC9D48]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) actionTypeForCharacteristic:a2];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

+ (id)_derivedActionForMediaProfiles:(id)a3 withExistingValues:(id)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(a4, "na_firstObjectPassingTest:", &__block_literal_global_279);
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F47BA8]);
    id v8 = [v5 anyObject];
    id v9 = objc_msgSend(v8, "hf_home");
    id v10 = (void *)[v7 initWithHome:v9];

    [v10 setMediaProfiles:v5];
    objc_msgSend(v10, "setTargetPlayState:", objc_msgSend(v6, "targetPlayState"));
    id v11 = [v6 targetVolume];
    [v10 setTargetVolume:v11];

    uint64_t v12 = [v6 playbackArchive];
    [v10 setPlaybackArchive:v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

BOOL __79__HREDerivedActionUtilities__derivedActionForMediaProfiles_withExistingValues___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5 != 0;
}

+ (id)_derivedActionForCharacteristic:(id)a3 withExistingValues:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5 || ![v6 count])
  {
    id v11 = 0;
    goto LABEL_25;
  }
  if ([v7 count] == 1)
  {
    id v8 = [v7 anyObject];
    goto LABEL_5;
  }
  if ((unint64_t)[v7 count] < 2)
  {
LABEL_22:
    id v8 = 0;
    goto LABEL_23;
  }
  uint64_t v12 = objc_msgSend(v7, "na_map:", &__block_literal_global_282_0);
  uint64_t v13 = [v12 count];
  if (v13 != [v7 count])
  {

    goto LABEL_22;
  }
  id v14 = [v5 metadata];
  id v15 = [v14 minimumValue];
  uint64_t v16 = [v14 maximumValue];
  id v17 = (void *)v16;
  int v18 = 0;
  id v8 = 0;
  if (v15 && v16)
  {
    id v19 = [v14 format];
    id v20 = (void *)*MEMORY[0x263F0BE38];

    if (v19 == v20)
    {
      id v8 = 0;
      int v18 = 0;
    }
    else
    {
      [v15 doubleValue];
      unint64_t v22 = (unint64_t)v21;
      [v17 doubleValue];
      double v24 = v23;
      [v15 doubleValue];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_2;
      v41[3] = &__block_descriptor_48_e18__16__0__NSNumber_8l;
      unint64_t v34 = (unint64_t)(v24 - v25);
      unint64_t v35 = v22;
      void v41[4] = v22;
      v41[5] = v34;
      uint64_t v26 = objc_msgSend(v12, "na_map:", v41);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v38;
        double v30 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v38 != v29) {
              objc_enumerationMutation(v26);
            }
            [*(id *)(*((void *)&v37 + 1) + 8 * i) doubleValue];
            double v30 = v30 + v32 / (double)(unint64_t)[v26 count];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v28);
      }
      else
      {
        double v30 = 0.0;
      }
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_3;
      v36[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
      *(double *)&v36[4] = v30;
      if (objc_msgSend(v26, "na_all:", v36))
      {
        id v8 = [NSNumber numberWithInt:(int)((double)v35 + v30 * (double)v34)];
      }
      else
      {
        id v8 = 0;
      }

      int v18 = 1;
    }
  }

  if (!v18) {
    goto LABEL_23;
  }
LABEL_5:
  if (!v8)
  {
LABEL_23:
    id v11 = 0;
    goto LABEL_24;
  }
  id v9 = objc_alloc(MEMORY[0x263F47B18]);
  id v10 = objc_msgSend(v5, "hf_home");
  id v11 = (void *)[v9 initWithHome:v10];

  [v11 setCharacteristic:v5];
  [v11 setTargetValue:v8];
LABEL_24:

LABEL_25:

  return v11;
}

id __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

id __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 doubleValue];
  unint64_t v5 = *(void *)(a1 + 32);
  if ((unint64_t)v4 < v5 || (unint64_t)v4 - v5 >= *(void *)(a1 + 40))
  {
    id v9 = 0;
  }
  else
  {
    id v7 = NSNumber;
    [v3 doubleValue];
    id v9 = [v7 numberWithDouble:(v8 - (double)*(unint64_t *)(a1 + 32)) / (double)*(unint64_t *)(a1 + 40)];
  }

  return v9;
}

BOOL __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 doubleValue];
  if (v4 >= *(double *)(a1 + 32) + -0.1)
  {
    [v3 doubleValue];
    BOOL v5 = v6 <= *(double *)(a1 + 32) + 0.1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_filterActions:(id)a3 withUnmatchedCharacteristicTypes:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = *MEMORY[0x263F0BEF8];
  v22[0] = *MEMORY[0x263F0C328];
  v22[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  id v10 = [v7 setWithArray:v9];

  if ([v6 intersectsSet:v10])
  {
    id v11 = [MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = *MEMORY[0x263F0C398];
    v21[0] = *MEMORY[0x263F0C1C0];
    v21[1] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    uint64_t v16 = [v13 setWithArray:v15];

    if ([v6 intersectsSet:v16]) {
      [v12 unionSet:v16];
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __77__HREDerivedActionUtilities__filterActions_withUnmatchedCharacteristicTypes___block_invoke;
    v19[3] = &unk_264CF3CA0;
    id v20 = v12;
    id v17 = v12;
    id v11 = objc_msgSend(v5, "na_filter:", v19);
  }

  return v11;
}

uint64_t __77__HREDerivedActionUtilities__filterActions_withUnmatchedCharacteristicTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 characteristic];
    id v9 = [v8 characteristicType];
    uint64_t v10 = [v7 containsObject:v9] ^ 1;
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

+ (id)_filterActions:(id)a3 withAccessoriesPassingTest:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke;
  v9[3] = &unk_264CF4B00;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "na_map:", v9);

  return v7;
}

id __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
LABEL_9:
    objc_opt_class();
    id v13 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v8 = v14;

    if (v8)
    {
      id v15 = [v8 mediaProfiles];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_2;
      void v22[3] = &unk_264CF4AD8;
      id v23 = *(id *)(a1 + 32);
      uint64_t v16 = objc_msgSend(v15, "na_filter:", v22);

      if ([v16 count])
      {
        id v17 = objc_alloc(MEMORY[0x263F47BA8]);
        int v18 = [v8 home];
        id v12 = (id)[v17 initWithHome:v18];

        [v12 setMediaProfiles:v16];
        objc_msgSend(v12, "setTargetPlayState:", objc_msgSend(v8, "targetPlayState"));
        id v19 = [v8 targetVolume];
        [v12 setTargetVolume:v19];

        id v20 = [v8 playbackArchive];
        [v12 setPlaybackArchive:v20];
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    goto LABEL_18;
  }
  id v7 = [v6 characteristic];
  id v8 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v7 service];
  id v11 = [v10 accessory];
  LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v11);

  if (!v9)
  {
LABEL_8:

    goto LABEL_9;
  }
  id v12 = v4;
LABEL_18:

  return v12;
}

uint64_t __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_3;
  v6[3] = &unk_264CF4AB0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serviceTypeAlias
{
  if (qword_268944CE8 != -1) {
    dispatch_once(&qword_268944CE8, &__block_literal_global_292);
  }
  id v2 = (void *)qword_268944CE0;

  return v2;
}

void __45__HREDerivedActionUtilities_serviceTypeAlias__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0D890];
  v3[0] = *MEMORY[0x263F0D6C8];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)qword_268944CE0;
  qword_268944CE0 = v0;
}

+ (id)characteristicTypeAlias
{
  if (qword_268944CF8 != -1) {
    dispatch_once(&qword_268944CF8, &__block_literal_global_295_0);
  }
  uint64_t v2 = (void *)qword_268944CF0;

  return v2;
}

void __52__HREDerivedActionUtilities_characteristicTypeAlias__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0BEF8];
  v3[0] = *MEMORY[0x263F0C328];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)qword_268944CF0;
  qword_268944CF0 = v0;
}

+ (id)actionTypeAlias
{
  if (qword_268944D08 != -1) {
    dispatch_once(&qword_268944D08, &__block_literal_global_297);
  }
  uint64_t v2 = (void *)qword_268944D00;

  return v2;
}

void __44__HREDerivedActionUtilities_actionTypeAlias__block_invoke()
{
  uint64_t v0 = (void *)qword_268944D00;
  qword_268944D00 = MEMORY[0x263EFFA78];
}

+ (id)_serviceTypesExtrapolatingFromWholeHome
{
  if (qword_268944D18 != -1) {
    dispatch_once(&qword_268944D18, &__block_literal_global_299_0);
  }
  uint64_t v2 = (void *)qword_268944D10;

  return v2;
}

void __68__HREDerivedActionUtilities__serviceTypesExtrapolatingFromWholeHome__block_invoke()
{
  void v6[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D798];
  v6[0] = *MEMORY[0x263F0D6A8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D740];
  v6[2] = *MEMORY[0x263F0D8A8];
  v6[3] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  id v5 = (void *)qword_268944D10;
  qword_268944D10 = v4;
}

+ (id)_serviceTypesExtrapolatingFromZones
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HREDerivedActionUtilities__serviceTypesExtrapolatingFromZones__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_268944D28 != -1) {
    dispatch_once(&qword_268944D28, block);
  }
  uint64_t v2 = (void *)qword_268944D20;

  return v2;
}

void __64__HREDerivedActionUtilities__serviceTypesExtrapolatingFromZones__block_invoke(uint64_t a1)
{
  v12[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F0D890];
  v12[0] = *MEMORY[0x263F0D6C8];
  v12[1] = v3;
  uint64_t v4 = *MEMORY[0x263F0D850];
  v12[2] = *MEMORY[0x263F0D8B8];
  v12[3] = v4;
  id v5 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
  v12[4] = v5;
  id v6 = HRETelevisionProfileType();
  v12[5] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
  id v8 = [v2 setWithArray:v7];

  uint64_t v9 = [*(id *)(a1 + 32) _serviceTypesExtrapolatingFromWholeHome];
  uint64_t v10 = [v9 setByAddingObjectsFromSet:v8];
  id v11 = (void *)qword_268944D20;
  qword_268944D20 = v10;
}

@end