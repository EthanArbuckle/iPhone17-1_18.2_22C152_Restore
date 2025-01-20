@interface HFControlItem(HUQuickControlsAdditions)
+ (HUQuickControlContext)_hu_quickControlContextOfClass:()HUQuickControlsAdditions controlItems:configuration:;
+ (HUQuickControlGroupContext)hu_preferredQuickControlGroupContextForControlItems:()HUQuickControlsAdditions configuration:ignoringGrid:;
+ (id)_hu_prioritizedViewControllerClasses;
+ (id)_hu_quickControlContextForControlItemWithPreferredPurposes:()HUQuickControlsAdditions inControlItems:configuration:;
+ (id)hf_controlItemComparator;
+ (id)hu_preferredToggleableControlItemInControlItems:()HUQuickControlsAdditions;
+ (uint64_t)hu_preferredQuickControlGroupContextForControlItems:()HUQuickControlsAdditions configuration:;
@end

@implementation HFControlItem(HUQuickControlsAdditions)

+ (id)hu_preferredToggleableControlItemInControlItems:()HUQuickControlsAdditions
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_79_0);
  if (!v4)
  {
    v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_125_3);
    if (!v4)
    {
      v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_128_2);
    }
  }

  return v4;
}

+ (id)_hu_prioritizedViewControllerClasses
{
  if (_MergedGlobals_643 != -1) {
    dispatch_once(&_MergedGlobals_643, &__block_literal_global_39_6);
  }
  v0 = (void *)qword_1EBA47B58;

  return v0;
}

+ (HUQuickControlContext)_hu_quickControlContextOfClass:()HUQuickControlsAdditions controlItems:configuration:
{
  id v7 = a5;
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:a4];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextOfClass_controlItems_configuration___block_invoke;
  v16[3] = &unk_1E63921A8;
  id v17 = v7;
  id v9 = v7;
  v10 = objc_msgSend(v8, "na_map:", v16);

  v11 = [HUQuickControlContext alloc];
  v12 = [v9 home];
  v13 = [v9 itemUpdater];
  v14 = [(HUQuickControlContext *)v11 initWithQuickControlClass:a3 controlItems:v10 home:v12 itemUpdater:v13];

  return v14;
}

+ (id)_hu_quickControlContextForControlItemWithPreferredPurposes:()HUQuickControlsAdditions inControlItems:configuration:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __131__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextForControlItemWithPreferredPurposes_inControlItems_configuration___block_invoke;
  v24[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8l;
  v24[4] = a3;
  id v9 = objc_msgSend(a4, "na_filter:", v24);
  if ([v9 count])
  {
    if ([v9 count] != 1) {
      NSLog(&cfstr_MultipleContro_0.isa, a3, v9);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = objc_msgSend(a1, "_hu_prioritizedViewControllerClasses");
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v16 = [v15 controlItemPredicate];
          id v17 = [v16 matchingControlItemsForControlItems:v9];

          if ([v17 count])
          {
            v18 = objc_msgSend(a1, "_hu_quickControlContextOfClass:controlItems:configuration:", v15, v17, v8);

            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    v18 = 0;
LABEL_14:
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (uint64_t)hu_preferredQuickControlGroupContextForControlItems:()HUQuickControlsAdditions configuration:
{
  return objc_msgSend(a1, "hu_preferredQuickControlGroupContextForControlItems:configuration:ignoringGrid:", a3, a4, 0);
}

+ (HUQuickControlGroupContext)hu_preferredQuickControlGroupContextForControlItems:()HUQuickControlsAdditions configuration:ignoringGrid:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(v8, "na_filter:", &__block_literal_global_64_2);
  uint64_t v11 = [v10 allObjects];
  uint64_t v12 = objc_msgSend(a1, "hf_controlItemComparator");
  uint64_t v13 = [v11 sortedArrayUsingComparator:v12];

  v38 = v13;
  v14 = (void *)[v13 mutableCopy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_66;
  aBlock[3] = &unk_1E63919F0;
  id v15 = v14;
  id v54 = v15;
  v16 = _Block_copy(aBlock);
  id v17 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v15, "count"));
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_75;
  v47[3] = &unk_1E6392218;
  id v18 = v15;
  id v48 = v18;
  v52 = a1;
  id v19 = v9;
  id v49 = v19;
  id v20 = v16;
  id v51 = v20;
  id v21 = v17;
  id v50 = v21;
  long long v22 = (void (**)(void))_Block_copy(v47);
  v41 = v19;
  v42 = v18;
  objc_msgSend((id)objc_opt_class(), "_hu_quickControlContextForControlItemWithPreferredPurposes:inControlItems:configuration:", 2, v18, v19);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))v20 + 2))(v20, v23);
  if (!v23 || (v22[2](v22), ![v21 count]))
  {
    v40 = v21;
    v36 = v10;
    id v37 = v8;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v24 = objc_msgSend((id)objc_opt_class(), "_hu_prioritizedViewControllerClasses");
    uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
    v39 = v22;
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (!a5 || ([v29 isEqual:objc_opt_class()] & 1) == 0)
          {
            v30 = objc_msgSend(v29, "controlItemPredicate", v36, v37);
            v31 = [v30 matchingControlItemsForControlItems:v42];

            if ([v31 count])
            {
              objc_msgSend((id)objc_opt_class(), "_hu_quickControlContextOfClass:controlItems:configuration:", v29, v31, v41);
              id v32 = (id)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, id))v20 + 2))(v20, v32);
              if (v23)
              {
                if (v32) {
                  BOOL v33 = v32 == v23;
                }
                else {
                  BOOL v33 = 1;
                }
                if (v33)
                {

                  goto LABEL_24;
                }
                [v40 addObject:v32];
              }
              else
              {
                id v23 = v32;
                ((void (*)(void))v39[2])();
              }
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_24:

    v10 = v36;
    id v8 = v37;
    long long v22 = v39;
    id v21 = v40;
  }
  v34 = [[HUQuickControlGroupContext alloc] initWithPrimaryQuickControlContext:v23 alternateQuickControlContexts:v21];

  return v34;
}

+ (id)hf_controlItemComparator
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __HFReversedComparator_block_invoke;
  v2[3] = &unk_1E638C420;
  id v3 = &__block_literal_global_131_1;
  v0 = (void *)[v2 copy];

  return v0;
}

@end