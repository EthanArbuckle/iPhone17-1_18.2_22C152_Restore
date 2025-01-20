@interface HUValveItemModule
+ (id)supportedServiceTypes;
- (id)buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation HUValveItemModule

+ (id)supportedServiceTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2DF08];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(HUChildServiceEditorItemModule *)self childServiceItemProvider];
  v7 = [v6 items];

  if ((unint64_t)[v7 count] <= 1) {
    char v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_141) ^ 1;
  }
  else {
    char v8 = 0;
  }
  if ([v7 intersectsSet:v4] && (v8 & 1) == 0)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUValveItemSectionIdentifier"];
    if ([(HUChildServiceEditorItemModule *)self editingMode] == 1) {
      [(id)objc_opt_class() childItemComparator];
    }
    else {
    v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
    }
    v11 = _Block_copy(v10);

    v12 = objc_msgSend(v7, "na_setByIntersectingWithSet:", v4);
    v13 = [v12 allObjects];
    v14 = [v13 sortedArrayUsingComparator:v11];

    [v9 setItems:v14];
    id v15 = objc_alloc(MEMORY[0x1E4F28BD0]);
    v16 = objc_msgSend(v14, "na_map:", &__block_literal_global_8_0);
    v17 = (void *)[v15 initWithArray:v16];

    v18 = objc_msgSend(v17, "na_mostCommonObject");
    if ([v18 isEqualToString:*MEMORY[0x1E4F2DD90]])
    {
      v19 = @"HUValveModuleSectionHeaderTitleIrrigation";
    }
    else if ([v18 isEqualToString:*MEMORY[0x1E4F2DDA8]])
    {
      v19 = @"HUValveModuleSectionHeaderTitleFaucet";
    }
    else if ([v18 isEqualToString:*MEMORY[0x1E4F2DD98]])
    {
      v19 = @"HUValveModuleSectionHeaderTitleShower";
    }
    else
    {
      v19 = @"HUValveModuleSectionHeaderTitleGeneric";
    }
    v20 = _HULocalizedStringWithDefaultValue(v19, v19, 1);
    [v9 setHeaderTitle:v20];
    [v5 addObject:v9];
  }

  return v5;
}

uint64_t __53__HUValveItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  v3 = objc_msgSend(v2, "hf_parentService");
  id v4 = [v3 serviceType];
  uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F2DE60]];

  return v5;
}

id __53__HUValveItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  v3 = [v2 serviceSubtype];

  return v3;
}

@end