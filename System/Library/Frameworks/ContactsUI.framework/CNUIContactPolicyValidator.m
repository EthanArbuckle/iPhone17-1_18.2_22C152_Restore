@interface CNUIContactPolicyValidator
+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5;
@end

@implementation CNUIContactPolicyValidator

+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5
{
  return (id)[MEMORY[0x1E4F1B948] contactFromContact:a3 conformingToPolicy:a4 options:a5 valueToStringTransform:&__block_literal_global_39433];
}

id __76__CNUIContactPolicyValidator_contactFromContact_conformingToPolicy_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  id v32 = [MEMORY[0x1E4F28E78] string];
  v9 = [v6 key];
  v10 = CNUILocalizedStringForPropertyWithFormatKey(@"LOWERCASE_LABEL", v9);

  v31 = v6;
  if ([v6 isMultiValue])
  {
    id v29 = v7;
    id v11 = v7;
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
    {
      v12 = [NSString stringWithFormat:@"\n%@:", v10];
      [v32 appendString:v12];
    }
    v28 = v10;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v11;
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v18 = [v31 key];
          v19 = +[CNCardPropertyGroup groupForProperty:v18 contact:v8 store:0 policy:0 linkedPolicies:0];

          v20 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v17 group:v19 contact:v8];
          v21 = NSString;
          v22 = [v20 displayLabel];
          v23 = [v20 displayValue];
          v24 = [v21 stringWithFormat:@"\n%@: %@", v22, v23];

          [v32 appendString:v24];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v14);
    }

    v10 = v28;
    id v7 = v29;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v7;
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
      {
        v26 = [NSString stringWithFormat:@"\n%@: %@", v10, v25];
        [v32 appendString:v26];
      }
    }
  }

  return v32;
}

@end