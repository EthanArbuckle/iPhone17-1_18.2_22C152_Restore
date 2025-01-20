@interface HFControlItem
@end

@implementation HFControlItem

uint64_t __91__HFControlItem_HUQuickControlsAdditions__hu_preferredToggleableControlItemInControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 latestResults];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F683C0]];

  if (v4 && ([v4 integerValue] & 8) != 0) {
    uint64_t v5 = [v2 conformsToProtocol:&unk_1F1ABC058];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __91__HFControlItem_HUQuickControlsAdditions__hu_preferredToggleableControlItemInControlItems___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F1ABC058];
}

uint64_t __91__HFControlItem_HUQuickControlsAdditions__hu_preferredToggleableControlItemInControlItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __79__HFControlItem_HUQuickControlsAdditions___hu_prioritizedViewControllerClasses__block_invoke_2()
{
  v2[15] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:15];
  v1 = (void *)qword_1EBA47B58;
  qword_1EBA47B58 = v0;
}

id __101__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextOfClass_controlItems_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) copyItems])
  {
    v4 = [*(id *)(a1 + 32) valueSource];

    if (v4)
    {
      uint64_t v5 = [v3 valueSource];
      v6 = [*(id *)(a1 + 32) valueSource];
      v7 = (void *)[v5 copyWithValueSource:v6];

      v8 = (void *)[v3 copyWithValueSource:v7];
      goto LABEL_7;
    }
    id v9 = (id)[v3 copy];
  }
  else
  {
    id v9 = v3;
  }
  v8 = v9;
LABEL_7:

  return v8;
}

BOOL __131__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextForControlItemWithPreferredPurposes_inControlItems_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 latestResults];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F683C0]];

  if (v4) {
    BOOL v5 = (*(void *)(a1 + 32) & ~[v4 integerValue]) == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F683C0]];
  v4 = v3;
  if (!v3) {
    id v3 = &unk_1F19B53D8;
  }
  char v5 = [v3 unsignedIntegerValue];

  return (v5 & 0x10) == 0;
}

void __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 affectedCharacteristics];
    v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_69_1);

    v7 = *(void **)(a1 + 32);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_3;
    v13 = &unk_1E63921F0;
    id v14 = v4;
    id v15 = v6;
    id v8 = v6;
    id v9 = objc_msgSend(v7, "na_filter:", &v10);
    objc_msgSend(*(id *)(a1 + 32), "setArray:", v9, v10, v11, v12, v13);
  }
}

uint64_t __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

BOOL __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) controlItems];
  char v5 = [v4 containsObject:v3];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v3 characteristicOptions];
    id v8 = [v7 objectForKeyedSubscript:&unk_1F19B53F0];

    BOOL v6 = ![v8 count] || (objc_msgSend(v8, "isSubsetOfSet:", *(void *)(a1 + 40)) & 1) == 0;
  }

  return v6;
}

uint64_t __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_75(uint64_t a1)
{
  for (i = *(void **)(a1 + 32); ; i = *(void **)(a1 + 32))
  {
    uint64_t result = [i count];
    if (!result) {
      break;
    }
    uint64_t result = objc_msgSend((id)objc_opt_class(), "_hu_quickControlContextForControlItemWithPreferredPurposes:inControlItems:configuration:", 4, *(void *)(a1 + 32), *(void *)(a1 + 40));
    if (!result) {
      break;
    }
    v4 = (void *)result;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 48) addObject:v4];
  }
  return result;
}

uint64_t __67__HFControlItem_HUQuickControlsAdditions__hf_controlItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "sortPriority"));
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "sortPriority"));
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    id v9 = NSNumber;
    uint64_t v10 = [v4 characteristicOptions];
    uint64_t v11 = [v10 allCharacteristicTypes];
    v12 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v13 = NSNumber;
    id v14 = [v5 characteristicOptions];
    id v15 = [v14 allCharacteristicTypes];
    v16 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    uint64_t v8 = [v12 compare:v16];

    if (!v8)
    {
      if (qword_1EBA47B60 != -1) {
        dispatch_once(&qword_1EBA47B60, &__block_literal_global_136);
      }
      id v17 = (id)qword_1EBA47B68;
      v18 = [v4 latestResults];
      uint64_t v19 = *MEMORY[0x1E4F683C0];
      v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F683C0]];
      uint64_t v21 = [v20 unsignedIntegerValue];

      v22 = [v5 latestResults];
      v23 = [v22 objectForKeyedSubscript:v19];
      uint64_t v24 = [v23 unsignedIntegerValue];

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v25 = v17;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        id v34 = v5;
        id v35 = v4;
        uint64_t v28 = *(void *)v37;
LABEL_7:
        uint64_t v29 = 0;
        while (1)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v36 + 1) + 8 * v29);
          v31 = objc_msgSend(NSNumber, "numberWithBool:", (objc_msgSend(v30, "unsignedIntegerValue", v34, v35, (void)v36) & ~v21) == 0);
          v32 = objc_msgSend(NSNumber, "numberWithBool:", (objc_msgSend(v30, "unsignedIntegerValue") & ~v24) == 0);
          uint64_t v8 = [v31 compare:v32];

          if (v8) {
            break;
          }
          if (v27 == ++v29)
          {
            uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
            if (v27) {
              goto LABEL_7;
            }
            uint64_t v8 = 0;
            break;
          }
        }
        id v5 = v34;
        id v4 = v35;
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }

  return v8;
}

void __67__HFControlItem_HUQuickControlsAdditions__hf_controlItemComparator__block_invoke_3()
{
  uint64_t v0 = (void *)qword_1EBA47B68;
  qword_1EBA47B68 = (uint64_t)&unk_1F19B5A80;
}

@end