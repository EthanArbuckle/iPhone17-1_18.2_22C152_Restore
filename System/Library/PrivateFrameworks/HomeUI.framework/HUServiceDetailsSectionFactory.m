@interface HUServiceDetailsSectionFactory
- (id)_serviceDetailsItemComparatorForSectionIdentifier:(id)a3;
- (id)buildServiceDetailsItemSectionForSourceItem:(id)a3 sectionIdentifier:(id)a4 items:(id)a5;
- (id)customComparator;
- (void)setCustomComparator:(id)a3;
@end

@implementation HUServiceDetailsSectionFactory

- (id)buildServiceDetailsItemSectionForSourceItem:(id)a3 sectionIdentifier:(id)a4 items:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v11 = v8;
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    v14 = [v13 accessory];
    int v15 = objc_msgSend(v14, "hf_isVisibleAsBridge");

    int v16 = v15 ^ 1;
  }
  else
  {
    int v16 = 1;
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v9];
  if ([v9 isEqualToString:@"HUServiceDetailsGroupSectionIdentifier"])
  {
    v18 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_150);
    v19 = v18;
    if (v18)
    {
      v20 = [v18 latestResults];
      v21 = [v20 objectForKeyedSubscript:@"HUServiceDetailsAddGroupSectionHeaderResultKey"];

      v22 = [v19 latestResults];
      v23 = [v22 objectForKeyedSubscript:@"HUServiceDetailsAddGroupSectionFooterResultKey"];
    }
    else
    {
      v23 = 0;
      v21 = 0;
    }
    v27 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_68_0);
    v28 = v27;
    if (v27)
    {
      [v27 latestResults];
      id v51 = v9;
      v29 = v21;
      v30 = v17;
      id v31 = v10;
      v32 = self;
      v34 = id v33 = v8;
      uint64_t v35 = [v34 objectForKeyedSubscript:@"HUServiceDetailsSeparateTileSectionFooterResultKey"];

      id v8 = v33;
      self = v32;
      id v10 = v31;
      v17 = v30;
      v21 = v29;
      id v9 = v51;
      v23 = (void *)v35;
    }
  }
  else
  {
    if ([v9 isEqualToString:@"HUServiceDetailsIdentifyHomePodSectionIdentifier"])
    {
      v24 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_71_0);
      v25 = v24;
      if (v24)
      {
        v26 = [v24 latestResults];
        v23 = [v26 objectForKeyedSubscript:@"HUServiceDetailsIdentifyHomePodFooterResultKey"];
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      if ([v9 isEqualToString:@"HUServiceDetailsLinkedApplicationSectionIdentifier"])
      {
        v21 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsManufacturerTitle", @"HUServiceDetailsManufacturerTitle", 1);
        v23 = 0;
        goto LABEL_25;
      }
      if (([v9 isEqualToString:@"HUServiceDetailsRemoveSectionIdentifier"] ^ 1 | v16))
      {
        v23 = 0;
      }
      else
      {
        v23 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveBridgeFooter", @"HUServiceDetailsRemoveBridgeFooter", 1);
      }
    }
    v21 = 0;
  }
LABEL_25:
  if (![v9 isEqualToString:@"HUServiceDetailsPrimaryInfoSectionIdentifier"]) {
    goto LABEL_40;
  }
  id v36 = v8;
  if ([v36 conformsToProtocol:&unk_1F1A3D190]) {
    v37 = v36;
  }
  else {
    v37 = 0;
  }
  id v38 = v37;

  v39 = [v38 accessoryRepresentableObject];

  if ([v39 conformsToProtocol:&unk_1F1AD9450]) {
    v40 = v39;
  }
  else {
    v40 = 0;
  }
  id v41 = v40;

  char v42 = objc_msgSend(v41, "hf_shouldHideForContextType:", 2);
  char v43 = objc_msgSend(v41, "hf_shouldHideForContextType:", 3);

  if (v42 & 1) != 0 || (v43)
  {
    if (v42)
    {
      if (v43) {
        goto LABEL_40;
      }
      v44 = @"HUServiceDetailsShowInHomeDashboardFooterTitle";
    }
    else
    {
      v44 = @"HUServiceDetailsFavoritesFooterTitle";
    }
  }
  else
  {
    v44 = @"HUServiceDetailsShowInHomeDashboardAndFavoritesFooterTitle";
  }
  uint64_t v45 = _HULocalizedStringWithDefaultValue(v44, v44, 1);

  v23 = (void *)v45;
LABEL_40:
  if (v21) {
    [v17 setHeaderTitle:v21];
  }
  if (v23) {
    [v17 setFooterTitle:v23];
  }
  v46 = [(HUServiceDetailsSectionFactory *)self _serviceDetailsItemComparatorForSectionIdentifier:v9];
  v47 = [v10 allObjects];
  v48 = v47;
  if (v46)
  {
    v49 = (void *)[v47 mutableCopy];

    [v49 sortUsingComparator:v46];
    v48 = v49;
  }
  [v17 setItems:v48];

  return v17;
}

uint64_t __102__HUServiceDetailsSectionFactory_buildServiceDetailsItemSectionForSourceItem_sectionIdentifier_items___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __102__HUServiceDetailsSectionFactory_buildServiceDetailsItemSectionForSourceItem_sectionIdentifier_items___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __102__HUServiceDetailsSectionFactory_buildServiceDetailsItemSectionForSourceItem_sectionIdentifier_items___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_serviceDetailsItemComparatorForSectionIdentifier:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"HUServiceDetailsFirmwareUpdateSectionPromptIdentifier"] & 1) != 0
    || [v4 isEqualToString:@"HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier"])
  {
    uint64_t v5 = +[HUFirmwareUpdateItemProvider itemComparator];
  }
  else
  {
    if (![v4 isEqualToString:@"HUServiceDetailsAccessoryInfoSectionIdentifier"])
    {
      id v8 = [(HUServiceDetailsSectionFactory *)self customComparator];
      id v9 = v8;
      if (v8)
      {
        v6 = _Block_copy(v8);
      }
      else
      {
        id v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
        v6 = _Block_copy(v10);
      }
      goto LABEL_5;
    }
    uint64_t v5 = [MEMORY[0x1E4F68E00] accessoryInfoServiceDetailComparator];
  }
  v6 = (void *)v5;
LABEL_5:

  return v6;
}

- (id)customComparator
{
  return self->_customComparator;
}

- (void)setCustomComparator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end