@interface HFActionNaturalLanguageUtilities
+ (BOOL)_shouldIgnoreActions:(id)a3 withCharacteristicType:(id)a4 execution:(id)a5;
+ (BOOL)actionTypesMissingDescriptionShouldCauseFailure:(id)a3;
+ (id)_actionTypeDescriptionPriority;
+ (id)_actionTypeForAction:(id)a3;
+ (id)_actionValue:(id)a3 forCharacteristicType:(id)a4;
+ (id)_characteristicTypesFailingMismatch;
+ (id)_relativePercentValueInActions:(id)a3 characteristics:(id)a4 characteristicType:(id)a5;
+ (id)_valueForAction:(id)a3 withActionType:(id)a4;
+ (id)actionValuesByTypeForActions:(id)a3 execution:(id)a4;
+ (id)genericStringKeyWithNumberOfAccessories:(unint64_t)a3 named:(BOOL)a4 inContext:(BOOL)a5 options:(id)a6;
+ (id)hf_naturalLanguageDescriptionForActions:(id)a3 withOptions:(id)a4;
+ (id)lightbulbStringKeyWithExecution:(id)a3;
+ (id)selectHighestPriorityStringsFromStrings:(id)a3;
+ (id)shortcutsStringKeyWithExecution:(id)a3;
+ (id)stringKeyForCharacteristicType:(id)a3 targetValue:(id)a4 named:(BOOL)a5 options:(id)a6;
+ (id)stringKeyForMediaPlaybackAction:(id)a3 named:(BOOL)a4 options:(id)a5;
+ (id)stringKeyForSpecialCasesWithValuesByType:(id)a3 execution:(id)a4 characteristics:(id)a5;
+ (id)stringKeyWithType:(id)a3 values:(id)a4 execution:(id)a5;
+ (id)stringKeysForActions:(id)a3 withServiceType:(id)a4 execution:(id)a5;
+ (id)temperatureStringKeyForActions:(id)a3 execution:(id)a4 characteristics:(id)a5;
+ (void)characteristicCaseClassification:(id *)a3 valueKey:(id *)a4 argumentKeys:(id *)a5 fromCharacteristicType:(id)a6 targetValue:(id)a7;
@end

@implementation HFActionNaturalLanguageUtilities

+ (id)hf_naturalLanguageDescriptionForActions:(id)a3 withOptions:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HFActionNaturalLanguageExecution executionWithActions:v6 options:v7];
  v9 = [v8 singularInvolvedObject];
  v10 = objc_msgSend(v9, "hf_serviceNameComponents");
  v11 = [v10 composedString];

  v12 = [v8 singularInvolvedObject];
  v13 = objc_msgSend(v12, "hf_serviceNameComponents");
  v14 = [v13 serviceName];

  unsigned int v15 = [v8 named];
  if (v14) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  [v8 setNamed:v16];
  v17 = [v8 actions];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = [v8 allInvolvedObjects];
    v20 = objc_msgSend(v19, "na_flatMap:", &__block_literal_global_132);

    v21 = [v8 actions];
    v22 = objc_msgSend(v21, "na_map:", &__block_literal_global_25_9);
    v23 = [v20 setByAddingObjectsFromSet:v22];

    id v72 = a1;
    v73 = v23;
    if ((unint64_t)[v8 accessoryCount] > 1) {
      goto LABEL_44;
    }
    v24 = [v8 actions];
    v25 = objc_msgSend(v24, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_30_7);

    v26 = [MEMORY[0x263EFF9C0] set];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_5;
    v79[3] = &unk_264097258;
    id v82 = a1;
    id v27 = v8;
    id v80 = v27;
    id v28 = a1;
    id v29 = v26;
    id v81 = v29;
    [v25 enumerateKeysAndObjectsUsingBlock:v79];
    if ([v29 count] != 1) {
      goto LABEL_8;
    }
    v30 = [v27 indescribableActionTypes];
    char v31 = [v28 actionTypesMissingDescriptionShouldCauseFailure:v30];

    if ((v31 & 1) == 0)
    {
      v32 = [v29 anyObject];
    }
    else
    {
LABEL_8:
      v32 = 0;
    }
    v23 = v73;

    a1 = v72;
    if (!v32)
    {
LABEL_44:
      if ([v23 count] == 1)
      {
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        int v38 = [v23 containsObject:v37];

        if (v38)
        {
          v39 = [MEMORY[0x263EFFA08] setWithArray:v6];
          v40 = [v8 stringKeysForMatterActions:v39];

          if ([v40 count] == 1)
          {
            v32 = [v40 anyObject];

            if (v32) {
              goto LABEL_26;
            }
          }
          else
          {
          }
        }
      }
      if ([v23 count] != 1
        || ![v23 containsObject:*MEMORY[0x263F0D780]]
        || ([a1 lightbulbStringKeyWithExecution:v8],
            (v32 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v41 = [v8 actions];
        int v42 = objc_msgSend(v41, "na_allObjectsPassTest:", &__block_literal_global_39_1);

        if (!v42
          || ([a1 shortcutsStringKeyWithExecution:v8],
              (v32 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v43 = [v7 objectsInContext];
          v44 = [v8 allInvolvedObjects];
          uint64_t v45 = [v43 intersectsSet:v44];

          v32 = objc_msgSend((id)objc_opt_class(), "genericStringKeyWithNumberOfAccessories:named:inContext:options:", objc_msgSend(v8, "accessoryCount"), objc_msgSend(v8, "named"), v45, v7);
        }
      }
    }
LABEL_26:
    v46 = v11;
    uint64_t v47 = [v8 singularInvolvedObject];
    if (!v47) {
      goto LABEL_34;
    }
    v48 = (void *)v47;
    int v49 = [v8 named];

    if (!v49) {
      goto LABEL_34;
    }
    v50 = [v32 argumentMap];
    [v50 setObject:v11 forKeyedSubscript:@"name"];

    v51 = [v8 involvedServices];
    if ([v51 count] == 1)
    {
      v52 = [v8 singularInvolvedObject];
      v53 = [v8 involvedServices];
      [v53 anyObject];
      v54 = id v71 = v6;
      int v55 = [v52 isEqual:v54];

      id v6 = v71;
      if (!v55) {
        goto LABEL_34;
      }
      v56 = [v8 involvedServices];
      v57 = [v56 anyObject];
      v58 = [v57 accessory];
      int v70 = objc_msgSend(v58, "hf_showAsAccessoryTile");

      v59 = [v7 objectsInContext];
      v60 = [v8 involvedServices];
      v61 = [v60 anyObject];
      v62 = [v61 accessory];
      int v63 = [v59 containsObject:v62];

      id v6 = v71;
      if (!v70 || !v63) {
        goto LABEL_34;
      }
      v51 = [v32 argumentMap];
      [v51 setObject:v14 forKeyedSubscript:@"name"];
    }

LABEL_34:
    v64 = [MEMORY[0x263EFF9C0] set];
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_8;
    v74[3] = &unk_264097280;
    v33 = v32;
    v75 = v33;
    id v65 = v64;
    id v76 = v65;
    v11 = v46;
    id v77 = v46;
    id v66 = v8;
    id v78 = v66;
    v67 = [v33 localizedStringWithArgumentBlock:v74];
    if ([v65 count] && !+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    {
      v68 = objc_msgSend((id)objc_opt_class(), "genericStringKeyWithNumberOfAccessories:named:inContext:options:", objc_msgSend(v66, "accessoryCount"), 0, 0, v7);
      id v35 = [v68 localizedStringWithArgumentBlock:&__block_literal_global_53_2];

      v11 = v46;
    }
    else
    {
      id v35 = v67;
    }

    goto LABEL_39;
  }
  v33 = HFLogForCategory(0x2FuLL);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = NSStringFromClass((Class)a1);
    *(_DWORD *)buf = 138412290;
    v84 = v34;
    _os_log_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEFAULT, "%@: natural language requested but no actions were supplied!", buf, 0xCu);
  }
  id v35 = 0;
LABEL_39:

  return v35;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_containedServices");
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_22_7);

  return v3;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 associatedServiceType];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 serviceType];
  }
  id v6 = v5;

  return v6;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(v2, "hf_affectedCharacteristic");

  if (v3)
  {
    v4 = objc_msgSend(v2, "hf_affectedCharacteristic");

    id v5 = [v4 service];
    id v6 = [v5 serviceType];
  }
  else
  {
    id v7 = (objc_class *)objc_opt_class();

    id v6 = NSStringFromClass(v7);
  }
  return v6;
}

void __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v8 = [a1[6] stringKeysForActions:a3 withServiceType:a2 execution:a1[4]];
  if (v8) {
    [a1[5] unionSet:v8];
  }
  id v6 = a1[6];
  id v7 = [a1[4] indescribableActionTypes];
  *a4 = [v6 actionTypesMissingDescriptionShouldCauseFailure:v7];
}

uint64_t __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HFLogForCategory(0x2FuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ argument key requested for which no value was given for string key: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) addObject:v3];
  if ([v3 isEqualToString:@"name"])
  {
    id v6 = *(void **)(a1 + 48);
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_41;
      v9[3] = &unk_26408D648;
      id v10 = *(id *)(a1 + 56);
      __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_41((uint64_t)v9);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_41(uint64_t a1)
{
  if ([*(id *)(a1 + 32) accessoryCount] == 1) {
    v1 = @"HFNaturalLanguageFailedAccessoryNamePlaceholder";
  }
  else {
    v1 = @"HFNaturalLanguageFailedAccessoryNamePlaceholder_Plural";
  }
  id v2 = _HFLocalizedStringWithDefaultValue(v1, v1, 1);
  return v2;
}

uint64_t __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_2_51()
{
  return 0;
}

+ (id)stringKeysForActions:(id)a3 withServiceType:(id)a4 execution:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  int v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = [v9 stringKeysForMatterActions:v8];
  }
  else
  {
    uint64_t v15 = [a1 actionValuesByTypeForActions:v8 execution:v9];
    uint64_t v16 = objc_msgSend(v8, "na_map:", &__block_literal_global_56_1);
    v17 = [a1 stringKeyForSpecialCasesWithValuesByType:v15 execution:v9 characteristics:v16];
    if (v17)
    {
      uint64_t v14 = [MEMORY[0x263EFFA08] setWithObject:v17];
    }
    else
    {
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __83__HFActionNaturalLanguageUtilities_stringKeysForActions_withServiceType_execution___block_invoke_2;
      v23 = &unk_2640972A8;
      id v25 = a1;
      id v24 = v9;
      uint64_t v18 = objc_msgSend(v15, "na_dictionaryByMappingValues:", &v20);
      uint64_t v14 = objc_msgSend(a1, "selectHighestPriorityStringsFromStrings:", v18, v20, v21, v22, v23);
    }
  }

  return v14;
}

id __83__HFActionNaturalLanguageUtilities_stringKeysForActions_withServiceType_execution___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 characteristic];

  return v6;
}

id __83__HFActionNaturalLanguageUtilities_stringKeysForActions_withServiceType_execution___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 40) stringKeyWithType:v5 values:a3 execution:*(void *)(a1 + 32)];
  if (!v6)
  {
    id v7 = [*(id *)(a1 + 32) indescribableActionTypes];
    [v7 addObject:v5];
  }
  return v6;
}

+ (id)actionValuesByTypeForActions:(id)a3 execution:(id)a4
{
  id v6 = a4;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke;
  v23[3] = &__block_descriptor_40_e31____NSCopying__16__0__HMAction_8l;
  v23[4] = a1;
  id v7 = objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v23);
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_2;
  v20[3] = &unk_2640972F0;
  id v21 = v6;
  id v22 = a1;
  id v11 = v6;
  id v12 = objc_msgSend(v7, "na_filter:", v20);

  int v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = [v12 allKeys];
  uint64_t v15 = [v13 setWithArray:v14];
  [v10 minusSet:v15];

  uint64_t v16 = [v11 indescribableActionTypes];
  [v16 unionSet:v10];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_3;
  v19[3] = &__block_descriptor_40_e35___NSSet_24__0__NSString_8__NSSet_16l;
  v19[4] = a1;
  v17 = objc_msgSend(v12, "na_dictionaryByMappingValues:", v19);

  return v17;
}

uint64_t __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _actionTypeForAction:a2];
}

uint64_t __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) _shouldIgnoreActions:a3 withCharacteristicType:a2 execution:*(void *)(a1 + 32)] ^ 1;
}

id __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_4;
  v10[3] = &unk_264097318;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v5;
  id v8 = objc_msgSend(a3, "na_map:", v10);

  return v8;
}

uint64_t __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _valueForAction:a2 withActionType:*(void *)(a1 + 32)];
}

+ (id)stringKeyForSpecialCasesWithValuesByType:(id)a3 execution:(id)a4 characteristics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_MergedGlobals_273 != -1) {
    dispatch_once(&_MergedGlobals_273, &__block_literal_global_67_1);
  }
  id v11 = (id)qword_26AB2F2F8;
  uint64_t v12 = (void *)MEMORY[0x263EFFA08];
  int v13 = [v8 allKeys];
  uint64_t v14 = [v12 setWithArray:v13];
  int v15 = [v11 intersectsSet:v14];

  if (v15)
  {
    uint64_t v16 = [a1 temperatureStringKeyForActions:v8 execution:v9 characteristics:v10];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

void __103__HFActionNaturalLanguageUtilities_stringKeyForSpecialCasesWithValuesByType_execution_characteristics___block_invoke_2()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C4D0];
  v5[0] = *MEMORY[0x263F0C4D8];
  v5[1] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)qword_26AB2F2F8;
  qword_26AB2F2F8 = v3;
}

+ (id)stringKeyWithType:(id)a3 values:(id)a4 execution:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] != 1)
  {
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  id v11 = [v9 anyObject];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    uint64_t v15 = [v10 named];
    uint64_t v16 = [v10 options];
    uint64_t v17 = [a1 stringKeyForMediaPlaybackAction:v14 named:v15 options:v16];
  }
  else
  {
    if (![v12 conformsToProtocol:&unk_26C0FBE80])
    {
      uint64_t v18 = 0;
      goto LABEL_12;
    }
    uint64_t v19 = [v10 named];
    uint64_t v16 = [v10 options];
    uint64_t v17 = [a1 stringKeyForCharacteristicType:v8 targetValue:v12 named:v19 options:v16];
  }
  uint64_t v18 = (void *)v17;

LABEL_12:
LABEL_13:

  return v18;
}

+ (id)selectHighestPriorityStringsFromStrings:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v14, 0, sizeof(v14));
  id v5 = [a1 _actionTypeDescriptionPriority];
  if ([v5 countByEnumeratingWithState:v14 objects:v15 count:16])
  {
    uint64_t v6 = (void *)**((void **)&v14[0] + 1);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__HFActionNaturalLanguageUtilities_selectHighestPriorityStringsFromStrings___block_invoke;
    v12[3] = &unk_26408F2F8;
    id v13 = v4;
    id v7 = objc_msgSend(v6, "na_map:", v12);
  }
  else
  {
    id v7 = 0;
  }

  if ([v7 count])
  {
    id v8 = v7;
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFFA08];
    id v10 = [v4 allValues];
    id v8 = [v9 setWithArray:v10];
  }
  return v8;
}

uint64_t __76__HFActionNaturalLanguageUtilities_selectHighestPriorityStringsFromStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

+ (id)stringKeyForCharacteristicType:(id)a3 targetValue:(id)a4 named:(BOOL)a5 options:(id)a6
{
  BOOL v6 = a5;
  v53[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  aSelector = a2;
  if (qword_26AB2F300 != -1) {
    dispatch_once(&qword_26AB2F300, &__block_literal_global_74);
  }
  id v12 = (id)qword_26AB2F308;
  id v43 = 0;
  id v44 = 0;
  id v42 = 0;
  [a1 characteristicCaseClassification:&v44 valueKey:&v43 argumentKeys:&v42 fromCharacteristicType:v10 targetValue:v11];
  id v13 = v44;
  id v14 = v43;
  id v15 = v42;
  if (v13)
  {
    if (v6)
    {
      if (qword_26AB2F310 != -1) {
        dispatch_once(&qword_26AB2F310, &__block_literal_global_83_0);
      }
      id v16 = (id)qword_26AB2F318;
      uint64_t v17 = [v12 stringByAppendingString:v16];

      id v18 = (id)MEMORY[0x263EFFA68];
      if (v15) {
        id v18 = v15;
      }
      v53[0] = @"name";
      v53[1] = v18;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
      uint64_t v20 = objc_msgSend(v19, "na_arrayByFlattening");

      id v15 = (id)v20;
      id v12 = (id)v17;
    }
    id v39 = v10;
    if (v14)
    {
      uint64_t v41 = 0;
      id v21 = (id *)&v41;
      [NSString stringWithValidatedFormat:v12, @"%@%@", &v41, v13, v14 validFormatSpecifiers error];
    }
    else
    {
      uint64_t v40 = 0;
      id v21 = (id *)&v40;
      [NSString stringWithValidatedFormat:v12, @"%@", &v40, v13, v35 validFormatSpecifiers error];
    id v22 = };
    id v36 = a1;
    id v37 = v14;
    id v25 = *v21;
    v26 = v25;
    if (!v22) {
      NSLog(&cfstr_CouldnTLocaliz_0.isa, v12, v25);
    }
    id v27 = v11;
    id v24 = +[HFLocalizableStringKey stringKeyWithKey:v22 argumentKeys:v15];
    if ([v15 containsObject:@"targetValuePercent"])
    {
      id v28 = +[HFFormatterManager sharedInstance];
      id v29 = [v28 percentFormatter];

      v30 = [v29 stringForObjectValue:v27];
      char v31 = [v24 argumentMap];
      [v31 setObject:v30 forKeyedSubscript:@"targetValuePercent"];
    }
    v32 = HFLogForCategory(0x2FuLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138413058;
      id v46 = v36;
      __int16 v47 = 2112;
      v48 = v33;
      __int16 v49 = 2112;
      id v50 = v24;
      __int16 v51 = 2112;
      id v52 = v39;
      _os_log_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@ for characteristic type %@", buf, 0x2Au);
    }
    id v10 = v39;
    id v11 = v27;
    id v14 = v37;
  }
  else
  {
    id v22 = HFLogForCategory(0x2FuLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      id v46 = a1;
      __int16 v47 = 2112;
      v48 = v23;
      __int16 v49 = 2112;
      id v50 = v10;
      _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to produce classification for characteristic type %@", buf, 0x20u);
    }
    id v24 = 0;
  }

  return v24;
}

void __93__HFActionNaturalLanguageUtilities_stringKeyForCharacteristicType_targetValue_named_options___block_invoke_2()
{
  v0 = (void *)qword_26AB2F308;
  qword_26AB2F308 = @"HFNaturalLanguage_Action_%@_%@";
}

void __93__HFActionNaturalLanguageUtilities_stringKeyForCharacteristicType_targetValue_named_options___block_invoke_2_81()
{
  v0 = (void *)qword_26AB2F318;
  qword_26AB2F318 = @"_Named";
}

+ (void)characteristicCaseClassification:(id *)a3 valueKey:(id *)a4 argumentKeys:(id *)a5 fromCharacteristicType:(id)a6 targetValue:(id)a7
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id v12 = a7;
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  if (qword_26AB2F320 != -1) {
    dispatch_once(&qword_26AB2F320, &__block_literal_global_103_0);
  }
  id v16 = (id)qword_26AB2F328;
  uint64_t v17 = [v16 objectForKeyedSubscript:v11];

  if (v17)
  {
    objc_opt_class();
    id v18 = [v16 objectForKeyedSubscript:v11];
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      *a3 = [v20 first];
      id v21 = [v20 second];
      *a4 = [v21 objectForKeyedSubscript:v13];
    }
    else
    {
      objc_opt_class();
      id v22 = [v16 objectForKeyedSubscript:v11];
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      *a3 = v23;

      if (v15) {
        id v24 = v15;
      }
      else {
        id v24 = v13;
      }
      *a4 = [NSString stringWithFormat:@"%@", v24];
    }
  }
  if (!*a3)
  {
    id v52 = a4;
    if (qword_26AB2F330 != -1) {
      dispatch_once(&qword_26AB2F330, &__block_literal_global_142_1);
    }
    id v25 = (id)qword_26AB2F338;
    v26 = [v25 objectForKeyedSubscript:v11];

    if (v26)
    {
      id v47 = v16;
      id v48 = v13;
      id v50 = v11;
      __int16 v51 = a3;
      __int16 v49 = a5;
      id v46 = v25;
      [v25 objectForKeyedSubscript:v11];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v56;
        id v54 = v15;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v56 != v29) {
              objc_enumerationMutation(obj);
            }
            char v31 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            v32 = [v31 first];
            v33 = [v31 second];
            v34 = v33;
            if (v15)
            {
              uint64_t v35 = [v33 maxValue];
              if (v35)
              {
                id v36 = [v34 maxValue];
                BOOL v37 = [v36 compare:v15] != -1;
              }
              else
              {
                BOOL v37 = 1;
              }

              int v38 = [v34 minValue];
              if (v38)
              {
                id v39 = [v34 minValue];
                BOOL v40 = [v39 compare:v15] != 1;
              }
              else
              {
                BOOL v40 = 1;
              }

              int v41 = v37 && v40;
              id v15 = v54;
              if (v41 == 1)
              {
                id v42 = v32;
                id *v51 = v42;
                id *v52 = [v31 third];

                goto LABEL_41;
              }
            }
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }
LABEL_41:

      a5 = v49;
      id v11 = v50;
      id v16 = v47;
      id v13 = v48;
      a3 = v51;
      id v25 = v46;
    }
    if (!*a3)
    {
      id v43 = v25;
      if (qword_26AB2F340 != -1) {
        dispatch_once(&qword_26AB2F340, &__block_literal_global_160);
      }
      id v44 = (id)qword_26AB2F348;
      uint64_t v45 = [v44 objectForKeyedSubscript:v11];

      if (v45)
      {
        *a3 = [v44 objectForKeyedSubscript:v11];
        if (qword_26AB2F350 != -1) {
          dispatch_once(&qword_26AB2F350, &__block_literal_global_173_1);
        }
        id *v52 = (id) qword_26AB2F358;
        if (qword_26AB2F360 != -1) {
          dispatch_once(&qword_26AB2F360, &__block_literal_global_177_1);
        }
        *a5 = (id) qword_26AB2F368;
      }

      id v25 = v43;
    }
  }
}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_2()
{
  v9[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0BEF8];
  v8[0] = *MEMORY[0x263F0C4A8];
  v8[1] = v0;
  v9[0] = @"Open";
  v9[1] = @"Power";
  uint64_t v1 = *MEMORY[0x263F0C510];
  v8[2] = *MEMORY[0x263F0C328];
  v8[3] = v1;
  v9[2] = @"Power";
  v9[3] = @"Lock";
  v8[4] = *MEMORY[0x263F0C548];
  v6[0] = &unk_26C0F6D38;
  v6[1] = &unk_26C0F6D50;
  v7[0] = @"Home";
  v7[1] = @"Away";
  v6[2] = &unk_26C0F6D68;
  v6[3] = &unk_26C0F6D80;
  v7[2] = @"Night";
  v7[3] = @"Off";
  id v2 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  uint64_t v3 = +[HFActionNaturalLanguageExecutionTuple tuple:@"Security" second:v2];
  void v9[4] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  id v5 = (void *)qword_26AB2F328;
  qword_26AB2F328 = v4;
}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_2_140()
{
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = *MEMORY[0x263F0BF68];
  id v12 = [MEMORY[0x263F0E600] numberRangeWithMaxValue:&unk_26C0F6D98];
  id v11 = +[HFActionNaturalLanguageExecutionTuple tuple:@"Power" second:v12 third:@"0"];
  id v15 = v11;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v17[0] = v10;
  v16[1] = *MEMORY[0x263F0C378];
  uint64_t v0 = [MEMORY[0x263F0E600] numberRangeWithMaxValue:&unk_26C0F6D98];
  uint64_t v1 = +[HFActionNaturalLanguageExecutionTuple tuple:@"Power" second:v0 third:@"0"];
  id v14 = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v17[1] = v2;
  v16[2] = *MEMORY[0x263F0C520];
  uint64_t v3 = [MEMORY[0x263F0E600] numberRangeWithMaxValue:&unk_26C0F6D98];
  uint64_t v4 = +[HFActionNaturalLanguageExecutionTuple tuple:@"Open" second:v3 third:@"1"];
  v13[0] = v4;
  id v5 = [MEMORY[0x263F0E600] numberRangeWithMinValue:&unk_26C0F6DB0];
  BOOL v6 = +[HFActionNaturalLanguageExecutionTuple tuple:@"Open" second:v5 third:@"0"];
  v13[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v17[2] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  id v9 = (void *)qword_26AB2F338;
  qword_26AB2F338 = v8;
}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_2_158()
{
  v4[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0C378];
  v3[0] = *MEMORY[0x263F0BF68];
  v3[1] = v0;
  v4[0] = @"Brightness";
  v4[1] = @"FanSpeed";
  v3[2] = *MEMORY[0x263F0C520];
  v4[2] = @"Position";
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  id v2 = (void *)qword_26AB2F348;
  qword_26AB2F348 = v1;
}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_4()
{
  uint64_t v0 = (void *)qword_26AB2F358;
  qword_26AB2F358 = @"0";
}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_6()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"targetValuePercent";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)qword_26AB2F368;
  qword_26AB2F368 = v0;
}

+ (id)shortcutsStringKeyWithExecution:(id)a3
{
  uint64_t v3 = [[HFLocalizableStringKey alloc] initWithKey:@"HFNaturalLanguage_Action_Shortcut" argumentKeys:0];
  return v3;
}

+ (id)lightbulbStringKeyWithExecution:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 actions];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_182);

  if ([v5 count] == 1)
  {
    BOOL v6 = [v5 anyObject];
    id v7 = [NSString stringWithFormat:@"HFNaturalLanguage_Action_MultiLightbulb_%@", v6];
    uint64_t v8 = [[HFNumberDependentLocalizableStringKey alloc] initWithKey:v7];
    -[HFNumberDependentLocalizableStringKey setIntegerArgument:](v8, "setIntegerArgument:", [v3 accessoryCount]);
    id v9 = [v3 allInvolvedObjects];
    id v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_189_1);

    if ([v10 count] == 1)
    {
      id v11 = [v10 anyObject];
      id v12 = objc_msgSend(v11, "hf_allVisibleServices");
      id v13 = objc_msgSend(v12, "na_filter:", &__block_literal_global_192_0);

      v33 = v13;
      id v14 = (void *)[v13 mutableCopy];
      id v15 = [v3 allInvolvedObjects];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_4;
      v35[3] = &unk_264090B60;
      id v16 = v14;
      id v36 = v16;
      objc_msgSend(v15, "na_each:", v35);

      v34 = v6;
      if ([v16 count])
      {
        uint64_t v17 = [v7 stringByAppendingString:@"_WithRoom"];

        uint64_t v18 = [(HFNumberDependentLocalizableStringKey *)v8 integerArgument];
        v32 = objc_msgSend(v11, "hf_displayName");
        HFLocalizedStringWithFormat(v17, @"%lu %@", v19, v20, v21, v22, v23, v24, v18);
        id v25 = (id)objc_claimAutoreleasedReturnValue();

        v26 = [[HFLiteralLocalizableStringKey alloc] initWithLocalizedString:v25];
      }
      else
      {
        uint64_t v17 = [v7 stringByAppendingString:@"_AllInRoom"];

        uint64_t v28 = [HFLocalizableStringKey alloc];
        if (qword_26AB2F370 != -1) {
          dispatch_once(&qword_26AB2F370, &__block_literal_global_200_0);
        }
        id v25 = (id)qword_26AB2F378;
        v26 = [(HFLocalizableStringKey *)v28 initWithKey:v17 argumentKeys:v25];
      }
      uint64_t v27 = (HFNumberDependentLocalizableStringKey *)v26;

      uint64_t v29 = objc_msgSend(v11, "hf_displayName");
      v30 = [(HFLocalizableStringKey *)v27 argumentMap];
      [v30 setObject:v29 forKeyedSubscript:@"room"];

      id v7 = v17;
      BOOL v6 = v34;
    }
    else
    {
      uint64_t v27 = v8;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

id __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke(uint64_t a1, void *a2)
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

  if (v5
    && ([v5 characteristic],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        [v6 characteristicType],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:*MEMORY[0x263F0C328]],
        v7,
        v6,
        v8))
  {
    id v9 = [v5 targetValue];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_associatedAccessories");
  id v3 = [v2 anyObject];
  uint64_t v4 = [v3 room];

  return v4;
}

uint64_t __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 serviceType];
  uint64_t v4 = *MEMORY[0x263F0D780];
  if ([v3 isEqualToString:*MEMORY[0x263F0D780]])
  {
    uint64_t v5 = 1;
  }
  else
  {
    BOOL v6 = [v2 associatedServiceType];
    uint64_t v5 = [v6 isEqualToString:v4];
  }
  return v5;
}

void __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_containedServices");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 minusSet:v3];
}

void __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_6()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"room";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)qword_26AB2F378;
  qword_26AB2F378 = v0;
}

+ (id)genericStringKeyWithNumberOfAccessories:(unint64_t)a3 named:(BOOL)a4 inContext:(BOOL)a5 options:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"HFNaturalLanguage_Action_Generic", a4, a5, a6);
  id v11 = (HFLiteralLocalizableStringKey *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (a3 == 1 && v7)
  {
    [(HFLiteralLocalizableStringKey *)v11 appendString:@"_Named"];
    if (qword_26AB2F380 != -1) {
      dispatch_once(&qword_26AB2F380, &__block_literal_global_215);
    }
    id v13 = (id)qword_26AB2F388;
    goto LABEL_9;
  }
  if (a3 == 1 && v6)
  {
    [(HFLiteralLocalizableStringKey *)v11 appendString:@"_Context"];
    id v13 = 0;
LABEL_9:
    id v14 = +[HFLocalizableStringKey stringKeyWithKey:v12 argumentKeys:v13];
    id v15 = HFLogForCategory(0x2FuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v28 = a1;
      __int16 v29 = 2112;
      v30 = v16;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@", buf, 0x20u);
    }
    goto LABEL_15;
  }
  uint64_t v17 = HFLogForCategory(0x2FuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v28 = a1;
    __int16 v29 = 2112;
    v30 = v18;
    __int16 v31 = 2112;
    v32 = v12;
    __int16 v33 = 2048;
    unint64_t v34 = a3;
    _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced generic fallback string with key: %@, numberOfAccessories: %lu", buf, 0x2Au);
  }
  uint64_t v19 = [HFLiteralLocalizableStringKey alloc];
  HFLocalizedStringWithFormat(v12, @"%lu", v20, v21, v22, v23, v24, v25, a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [(HFLiteralLocalizableStringKey *)v19 initWithLocalizedString:v13];
LABEL_15:

  return v14;
}

void __100__HFActionNaturalLanguageUtilities_genericStringKeyWithNumberOfAccessories_named_inContext_options___block_invoke_2()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"name";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)qword_26AB2F388;
  qword_26AB2F388 = v0;
}

+ (id)stringKeyForMediaPlaybackAction:(id)a3 named:(BOOL)a4 options:(id)a5
{
  BOOL v5 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (qword_26AB2F390 != -1) {
    dispatch_once(&qword_26AB2F390, &__block_literal_global_225_0);
  }
  id v9 = (id)qword_26AB2F398;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_3;
  v25[3] = &unk_26408D648;
  id v10 = v8;
  id v26 = v10;
  id v11 = __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_3((uint64_t)v25);
  if (v11)
  {
    if (v5)
    {
      if (qword_26AB2F3A0 != -1) {
        dispatch_once(&qword_26AB2F3A0, &__block_literal_global_243_0);
      }
      id v12 = (id)qword_26AB2F3A8;
      uint64_t v13 = [v9 stringByAppendingString:v12];

      if (qword_26AB2F3B0 != -1) {
        dispatch_once(&qword_26AB2F3B0, &__block_literal_global_248);
      }
      id v14 = (id)qword_26AB2F3B8;
      id v9 = (id)v13;
    }
    else
    {
      id v14 = 0;
    }
    id v24 = 0;
    uint64_t v18 = [NSString stringWithValidatedFormat:v9, @"%@", &v24, v11 validFormatSpecifiers error];
    id v19 = v24;
    uint64_t v20 = v19;
    if (!v18) {
      NSLog(&cfstr_CouldnTLocaliz_0.isa, v9, v19);
    }
    uint64_t v17 = +[HFLocalizableStringKey stringKeyWithKey:v18 argumentKeys:v14];
    uint64_t v21 = HFLogForCategory(0x2FuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v28 = a1;
      __int16 v29 = 2112;
      v30 = v22;
      __int16 v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@", buf, 0x20u);
    }
  }
  else
  {
    id v14 = HFLogForCategory(0x2FuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSStringFromSelector(a2);
      id v16 = NSStringFromHMMediaPlaybackState([v10 state]);
      *(_DWORD *)buf = 138412802;
      id v28 = a1;
      __int16 v29 = 2112;
      v30 = v15;
      __int16 v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to produce classification for playback state %@", buf, 0x20u);
    }
    uint64_t v17 = 0;
  }

  return v17;
}

void __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_2()
{
  uint64_t v0 = (void *)qword_26AB2F398;
  qword_26AB2F398 = @"HFNaturalLanguage_Action_%@";
}

__CFString *__82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) state] - 1;
  if (v2 < 5) {
    return off_264097450[v2];
  }
  result = [*(id *)(a1 + 32) volume];
  if (result)
  {
    uint64_t v4 = result;
    BOOL v5 = [*(id *)(a1 + 32) playbackArchive];

    if (v5) {
      return 0;
    }
    else {
      return @"ChangeVolume";
    }
  }
  return result;
}

void __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_2_241()
{
  uint64_t v0 = (void *)qword_26AB2F3A8;
  qword_26AB2F3A8 = @"_Named";
}

void __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_4()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"name";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)qword_26AB2F3B8;
  qword_26AB2F3B8 = v0;
}

+ (id)temperatureStringKeyForActions:(id)a3 execution:(id)a4 characteristics:(id)a5
{
  v87[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  aSelector = a2;
  if (qword_26AB2F3C0 != -1) {
    dispatch_once(&qword_26AB2F3C0, &__block_literal_global_255_0);
  }
  id v12 = (id)qword_26AB2F3C8;
  uint64_t v13 = [MEMORY[0x263EFF9C0] set];
  id v14 = [MEMORY[0x263EFF9C0] set];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_3;
  v77[3] = &unk_264097380;
  id v15 = v9;
  id v78 = v15;
  id v16 = v14;
  id v79 = v16;
  id v17 = v13;
  id v80 = v17;
  objc_msgSend(v12, "na_each:", v77);
  if (qword_26AB2F3D0 != -1) {
    dispatch_once(&qword_26AB2F3D0, &__block_literal_global_260_1);
  }
  id v18 = (id)qword_26AB2F3D8;
  if ([v18 isSubsetOfSet:v17])
  {
    id v19 = 0;
    uint64_t v20 = @"HFNaturalLanguage_Action_Thermostat_%@";
    goto LABEL_55;
  }
  id v64 = v18;
  id v65 = v17;
  uint64_t v21 = [v10 indescribableActionTypes];
  [v21 unionSet:v16];

  id v72 = [a1 _actionValue:v15 forCharacteristicType:*MEMORY[0x263F0BEF8]];
  uint64_t v22 = [a1 _actionValue:v15 forCharacteristicType:*MEMORY[0x263F0C4D8]];
  uint64_t v23 = [a1 _actionValue:v15 forCharacteristicType:*MEMORY[0x263F0C4D0]];
  id v68 = v12;
  id v66 = v16;
  int v63 = v22;
  id v71 = (void *)v23;
  if (v22)
  {
    unint64_t v24 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", [v22 integerValue]);
  }
  else
  {
    if (!v23 || ![v72 BOOLValue])
    {
LABEL_16:
      uint64_t v25 = 0;
      id v26 = 0;
      uint64_t v27 = @"Off";
      goto LABEL_24;
    }
    unint64_t v24 = +[HFTargetRangeUtilities rangeModeForTargetHeaterCoolerState:](HFTargetRangeUtilities, "rangeModeForTargetHeaterCoolerState:", [v71 integerValue]);
  }
  uint64_t v25 = v24;
  switch(v24)
  {
    case 0uLL:
      goto LABEL_16;
    case 1uLL:
      if (qword_26AB2F400 != -1) {
        dispatch_once(&qword_26AB2F400, &__block_literal_global_282);
      }
      id v26 = (id)qword_26AB2F408;
      uint64_t v27 = @"Heat";
      uint64_t v25 = 1;
      break;
    case 2uLL:
      if (qword_26AB2F3F0 != -1) {
        dispatch_once(&qword_26AB2F3F0, &__block_literal_global_275);
      }
      id v26 = (id)qword_26AB2F3F8;
      uint64_t v27 = @"Cool";
      uint64_t v25 = 2;
      break;
    case 3uLL:
      if (qword_26AB2F3E0 != -1) {
        dispatch_once(&qword_26AB2F3E0, &__block_literal_global_268_1);
      }
      id v26 = (id)qword_26AB2F3E8;
      uint64_t v27 = @"Auto";
      uint64_t v25 = 3;
      break;
    default:
      uint64_t v27 = 0;
      id v26 = 0;
      break;
  }
LABEL_24:
  uint64_t v28 = [a1 _relativePercentValueInActions:v15 characteristics:v11 characteristicType:*MEMORY[0x263F0C550]];
  __int16 v29 = [a1 _relativePercentValueInActions:v15 characteristics:v11 characteristicType:*MEMORY[0x263F0C1A0]];
  [a1 _relativePercentValueInActions:v15 characteristics:v11 characteristicType:*MEMORY[0x263F0C020]];
  v75 = v62 = (void *)v28;
  uint64_t v30 = +[HFTargetRangeUtilities targetRelativePercentValueWithTargetMode:currentMode:rawTargetRelativePercentValue:minimumThresholdRelativePercentValue:maximumThresholdRelativePercentValue:](HFTargetRangeUtilities, "targetRelativePercentValueWithTargetMode:currentMode:rawTargetRelativePercentValue:minimumThresholdRelativePercentValue:maximumThresholdRelativePercentValue:", v25, 0, v28, v29);
  if (v29) {
    int v31 = 0;
  }
  else {
    int v31 = [v26 containsObject:@"targetTemperatureHeat"];
  }
  if (v75)
  {
    int v32 = 0;
    if (v30)
    {
LABEL_29:
      int v33 = 0;
      goto LABEL_32;
    }
  }
  else
  {
    int v32 = [v26 containsObject:@"targetTemperatureCool"];
    if (v30) {
      goto LABEL_29;
    }
  }
  int v33 = [v26 containsObject:@"targetTemperatureTarget"];
LABEL_32:
  v74 = (void *)v30;
  if (((v31 | v32) & 1) != 0 || v33)
  {
    uint64_t v20 = [@"HFNaturalLanguage_Action_Thermostat_%@" stringByAppendingString:@"_NoTemp"];
    unint64_t v34 = (void *)[v26 mutableCopy];
    [v34 removeObject:@"targetTemperatureHeat"];
    [v34 removeObject:@"targetTemperatureCool"];
    [v34 removeObject:@"targetTemperatureTarget"];
    uint64_t v35 = [v34 copy];

    id v26 = (id)v35;
  }
  else
  {
    uint64_t v20 = @"HFNaturalLanguage_Action_Thermostat_%@";
  }
  id v70 = v10;
  if ([v10 named])
  {
    uint64_t v36 = [(__CFString *)v20 stringByAppendingString:@"_Named"];

    v87[0] = @"name";
    BOOL v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:1];
    int v38 = v37;
    if (v26) {
      id v39 = v26;
    }
    else {
      id v39 = (id)MEMORY[0x263EFFA68];
    }
    uint64_t v40 = [v37 arrayByAddingObjectsFromArray:v39];

    id v26 = (id)v40;
    uint64_t v20 = (__CFString *)v36;
  }
  id v59 = a1;
  id v76 = 0;
  int v41 = [NSString stringWithValidatedFormat:v20, @"%@", &v76, v27 validFormatSpecifiers error];
  id v42 = v76;
  id v43 = v42;
  if (!v41) {
    NSLog(&cfstr_CouldnTLocaliz_0.isa, v20, v42);
  }
  uint64_t v60 = v43;
  id v69 = v11;
  id v19 = +[HFLocalizableStringKey stringKeyWithKey:v41 argumentKeys:v26];
  id v44 = +[HFFormatterManager sharedInstance];
  uint64_t v45 = [v44 temperatureFormatter];

  [v45 setInputIsCelsius:1];
  id v46 = v75;
  if (v29)
  {
    id v47 = [v29 value];
    id v48 = [v45 stringForObjectValue:v47];
  }
  else
  {
    id v48 = 0;
  }
  v61 = v29;
  if (v75)
  {
    __int16 v49 = [v75 value];
    id v50 = [v45 stringForObjectValue:v49];
  }
  else
  {
    id v50 = 0;
  }
  id v67 = v15;
  if (v74)
  {
    __int16 v51 = [v74 value];
    id v52 = [v45 stringForObjectValue:v51];
  }
  else
  {
    id v52 = 0;
  }
  v53 = [v19 argumentMap];
  objc_msgSend(v53, "na_safeSetObject:forKey:", v48, @"targetTemperatureHeat");

  id v54 = [v19 argumentMap];
  objc_msgSend(v54, "na_safeSetObject:forKey:", v50, @"targetTemperatureCool");

  long long v55 = [v19 argumentMap];
  objc_msgSend(v55, "na_safeSetObject:forKey:", v52, @"targetTemperatureTarget");

  long long v56 = HFLogForCategory(0x2FuLL);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    long long v57 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138412802;
    id v82 = v59;
    __int16 v83 = 2112;
    v84 = v57;
    __int16 v85 = 2112;
    v86 = v19;
    _os_log_impl(&dword_20B986000, v56, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@", buf, 0x20u);

    id v46 = v75;
  }

  id v11 = v69;
  id v10 = v70;
  id v15 = v67;
  id v12 = v68;
  id v17 = v65;
  id v16 = v66;
  id v18 = v64;
LABEL_55:

  return v19;
}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_2()
{
  v7[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C4D0];
  v7[0] = *MEMORY[0x263F0C4D8];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C550];
  v7[2] = *MEMORY[0x263F0BEF8];
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0C020];
  void v7[4] = *MEMORY[0x263F0C1A0];
  v7[5] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
  uint64_t v5 = [v0 setWithArray:v4];
  BOOL v6 = (void *)qword_26AB2F3C8;
  qword_26AB2F3C8 = v5;
}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_3(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  uint64_t v4 = v3;
  if (v3 && [v3 count] != 1)
  {
    uint64_t v5 = a1 + 5;
  }
  else
  {
    if ([v4 count]) {
      goto LABEL_7;
    }
    uint64_t v5 = a1 + 6;
  }
  [*v5 addObject:v6];
LABEL_7:
}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_5()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C4D0];
  v5[0] = *MEMORY[0x263F0C4D8];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)qword_26AB2F3D8;
  qword_26AB2F3D8 = v3;
}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_7()
{
  void v2[2] = *MEMORY[0x263EF8340];
  v2[0] = @"targetTemperatureHeat";
  v2[1] = @"targetTemperatureCool";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  uint64_t v1 = (void *)qword_26AB2F3E8;
  qword_26AB2F3E8 = v0;
}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_9()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"targetTemperatureTarget";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)qword_26AB2F3F8;
  qword_26AB2F3F8 = v0;
}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_11()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"targetTemperatureTarget";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)qword_26AB2F408;
  qword_26AB2F408 = v0;
}

+ (id)_actionTypeForAction:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "hf_affectedCharacteristic");

  if (v4)
  {
    uint64_t v5 = objc_msgSend(v3, "hf_affectedCharacteristic");

    id v6 = [v5 characteristicType];
  }
  else
  {
    BOOL v7 = (objc_class *)objc_opt_class();

    id v6 = NSStringFromClass(v7);
  }
  return v6;
}

+ (id)_valueForAction:(id)a3 withActionType:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 targetValue];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

+ (BOOL)_shouldIgnoreActions:(id)a3 withCharacteristicType:(id)a4 execution:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(a3, "na_map:", &__block_literal_global_287_0);
  if ([v9 count])
  {
    id v10 = [v8 allInvolvedObjects];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_2;
    id v19 = &unk_2640973A8;
    id v20 = v7;
    id v11 = v9;
    id v21 = v11;
    int v12 = objc_msgSend(v10, "na_all:", &v16) ^ 1;

    uint64_t v13 = objc_msgSend(v11, "count", v16, v17, v18, v19);
  }
  else
  {
    uint64_t v13 = [v9 count];
    LOBYTE(v12) = 1;
  }
  if (v13) {
    BOOL v14 = v12;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_affectedCharacteristic");
}

uint64_t __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_containedServices");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_3;
  v7[3] = &unk_264091C28;
  id v8 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_map:", v7);

  if ([v4 intersectsSet:*(void *)(a1 + 40)]) {
    uint64_t v5 = [v4 isEqualToSet:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_characteristicOfType:", *(void *)(a1 + 32));
}

+ (id)_relativePercentValueInActions:(id)a3 characteristics:(id)a4 characteristicType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _actionValue:a3 forCharacteristicType:v8];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__HFActionNaturalLanguageUtilities__relativePercentValueInActions_characteristics_characteristicType___block_invoke;
  v15[3] = &unk_2640903A0;
  id v11 = v8;
  id v16 = v11;
  int v12 = objc_msgSend(v9, "na_firstObjectPassingTest:", v15);

  if (v10) {
    uint64_t v13 = [[HFRelativePercentValue alloc] initWithValue:v10 forCharacteristic:v12];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __102__HFActionNaturalLanguageUtilities__relativePercentValueInActions_characteristics_characteristicType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)_actionValue:(id)a3 forCharacteristicType:(id)a4
{
  uint64_t v4 = [a3 objectForKeyedSubscript:a4];
  objc_opt_class();
  uint64_t v5 = [v4 count];
  if (v5 == 1)
  {
    id v6 = [v4 anyObject];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v5 == 1) {
  return v9;
  }
}

+ (BOOL)actionTypesMissingDescriptionShouldCauseFailure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _characteristicTypesFailingMismatch];
  char v6 = [v5 intersectsSet:v4];

  return v6;
}

+ (id)_characteristicTypesFailingMismatch
{
  if (qword_26AB2F410 != -1) {
    dispatch_once(&qword_26AB2F410, &__block_literal_global_295);
  }
  uint64_t v2 = (void *)qword_26AB2F418;
  return v2;
}

void __71__HFActionNaturalLanguageUtilities__characteristicTypesFailingMismatch__block_invoke_2()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0BEF8];
  uint64_t v8 = *MEMORY[0x263F0C328];
  uint64_t v9 = v1;
  uint64_t v2 = *MEMORY[0x263F0C4D8];
  uint64_t v10 = *MEMORY[0x263F0C4D0];
  uint64_t v11 = v2;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v12 = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:5];
  uint64_t v6 = objc_msgSend(v0, "setWithArray:", v5, v8, v9, v10, v11);
  id v7 = (void *)qword_26AB2F418;
  qword_26AB2F418 = v6;
}

+ (id)_actionTypeDescriptionPriority
{
  if (qword_26AB2F420 != -1) {
    dispatch_once(&qword_26AB2F420, &__block_literal_global_299_0);
  }
  uint64_t v2 = (void *)qword_26AB2F428;
  return v2;
}

void __66__HFActionNaturalLanguageUtilities__actionTypeDescriptionPriority__block_invoke_2()
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0BF68], *MEMORY[0x263F0C378], 0);
  v4[0] = v0;
  uint64_t v1 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C328], *MEMORY[0x263F0BEF8], 0);
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  id v3 = (void *)qword_26AB2F428;
  qword_26AB2F428 = v2;
}

@end