@interface HUInputSourceItemModule
+ (id)_serviceItemComparatorForTelevisionProfile:(id)a3;
+ (id)supportedServiceTypes;
- (BOOL)canToggleConfigurationStateForItem:(id)a3;
- (HFItem)chooseInputsSelectionItem;
- (id)buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation HUInputSourceItemModule

+ (id)supportedServiceTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2DE58];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)_serviceItemComparatorForTelevisionProfile:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HUInputSourceItemModule__serviceItemComparatorForTelevisionProfile___block_invoke;
  v8[3] = &unk_1E6389360;
  id v9 = v4;
  id v10 = a1;
  id v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

uint64_t __70__HUInputSourceItemModule__serviceItemComparatorForTelevisionProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hf_mediaSourceComparator");
  v7 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  v8 = [v5 service];
  id v9 = [v8 mediaSourceIdentifier];
  id v10 = [v6 service];
  v11 = [v10 mediaSourceIdentifier];
  uint64_t v12 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v9, v11);

  if (!v12)
  {
    v15.receiver = *(id *)(a1 + 40);
    v15.super_class = (Class)&OBJC_METACLASS___HUInputSourceItemModule;
    objc_msgSendSuper2(&v15, sel_childItemComparator);
    v13 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v12 = ((uint64_t (**)(void, id, id))v13)[2](v13, v5, v6);
  }
  return v12;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUChildServiceEditorItemModule *)self childServiceItemProvider];
  id v6 = [v5 items];

  if ([v6 intersectsSet:v4])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUInputSourceItemSectionIdentifier"];
    v8 = [(HUChildServiceEditorItemModule *)self accessory];
    id v9 = [v8 televisionProfiles];
    id v10 = [v9 firstObject];

    v11 = [(id)objc_opt_class() _serviceItemComparatorForTelevisionProfile:v10];
    uint64_t v12 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
    v13 = [v12 allObjects];
    v14 = [v13 sortedArrayUsingComparator:v11];

    [v7 setItems:v14];
    objc_super v15 = _HULocalizedStringWithDefaultValue(@"HUTelevisionSettingsInputHeaderTitle", @"HUTelevisionSettingsInputHeaderTitle", 1);
    [v7 setHeaderTitle:v15];

    v18[0] = v7;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (BOOL)canToggleConfigurationStateForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F686A8]];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)HUInputSourceItemModule;
    BOOL v8 = [(HUChildServiceEditorItemModule *)&v10 canToggleConfigurationStateForItem:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (HFItem)chooseInputsSelectionItem
{
  return self->_chooseInputsSelectionItem;
}

- (void).cxx_destruct
{
}

@end