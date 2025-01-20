@interface CNPropertySocialProfileEditingCell
- (CNSocialProfile)profile;
- (void)labelButtonClicked:(id)a3;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
@end

@implementation CNPropertySocialProfileEditingCell

- (void)pickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = [(CNPropertyCell *)self presentingDelegate];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CNPropertySocialProfileEditingCell_pickerDidCancel___block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v5 sender:self dismissViewController:v4 completionHandler:v6];
}

uint64_t __54__CNPropertySocialProfileEditingCell_pickerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNPropertyCell *)self propertyItem];
  v9 = [v8 labeledValue];
  v10 = [v9 value];
  v11 = (void *)[v10 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    v13 = [v12 name];
    [v11 setService:v13];

    v14 = [v12 teamIdentifier];
    [v11 setTeamIdentifier:v14];

    v15 = [v11 bundleIdentifiers];

    if (v15)
    {
      v16 = [v11 bundleIdentifiers];
      v17 = [v12 bundleIdentifier];
      char v18 = [v16 containsObject:v17];

      if (v18)
      {
LABEL_8:

        goto LABEL_9;
      }
      v19 = [v11 bundleIdentifiers];
      v20 = [v12 bundleIdentifier];
      v21 = [v19 arrayByAddingObject:v20];
      [v11 setBundleIdentifiers:v21];
    }
    else
    {
      v19 = [v12 bundleIdentifier];
      v29[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      [v11 setBundleIdentifiers:v20];
    }

    goto LABEL_8;
  }
  [v11 setService:v6];
  [v11 setBundleIdentifiers:0];
  [v11 setTeamIdentifier:0];
LABEL_9:
  [v11 setUrlString:0];
  [v11 setUserIdentifier:0];
  [v11 setDisplayname:0];
  v22 = [(CNPropertyCell *)self delegate];
  v23 = [(CNPropertyCell *)self propertyItem];
  v24 = [v11 service];
  [v22 propertyCell:self didUpdateItem:v23 withNewLabel:v24];

  v25 = [(CNPropertyCell *)self delegate];
  v26 = [(CNPropertyCell *)self propertyItem];
  [v25 propertyCell:self didUpdateItem:v26 withNewValue:v11];

  v27 = [(CNPropertyCell *)self presentingDelegate];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__CNPropertySocialProfileEditingCell_picker_didPickItem___block_invoke;
  v28[3] = &unk_1E549B488;
  v28[4] = self;
  [v27 sender:self dismissViewController:v7 completionHandler:v28];
}

uint64_t __57__CNPropertySocialProfileEditingCell_picker_didPickItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (void)labelButtonClicked:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNPropertyCell *)self propertyItem];
  id v6 = [v5 extendedLabels];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    v8 = [[CNSocialProfileServicePickerController alloc] initWithStyle:1];
    [(CNPickerController *)v8 setDelegate:self];
    v9 = [(CNPropertyCell *)self delegate];
    v10 = [v9 sharedActionsDataSource];
    uint64_t v11 = *MEMORY[0x1E4F1AD78];
    v27[0] = *MEMORY[0x1E4F1AD20];
    v27[1] = v11;
    v27[2] = *MEMORY[0x1E4F1AD48];
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    v13 = [v10 thirdPartyTargetsForActionTypes:v12];
    id v26 = 0;
    v14 = [v13 result:&v26];
    id v15 = v26;

    if ([v14 count])
    {
      [(CNPickerController *)v8 setDiscoveredItems:v14];
      [(CNPickerController *)v8 setAllowsDiscoveredItems:1];
      v16 = [(CNPropertySocialProfileEditingCell *)self profile];
      v17 = [v16 bundleIdentifiers];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __57__CNPropertySocialProfileEditingCell_labelButtonClicked___block_invoke;
        v25[3] = &unk_1E5499B28;
        v25[4] = self;
        v19 = objc_msgSend(v14, "_cn_firstObjectPassingTest:", v25);
        [(CNPickerController *)v8 setSelectedItem:v19];
      }
    }
    v20 = [(CNPickerController *)v8 selectedItem];

    if (!v20)
    {
      v21 = [(CNPropertySocialProfileEditingCell *)self profile];
      v22 = [v21 service];
      [(CNPickerController *)v8 setSelectedItem:v22];
    }
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
    [v23 setDelegate:self];
    v24 = [(CNPropertyCell *)self presentingDelegate];
    [v24 sender:v4 presentViewController:v23];
  }
}

uint64_t __57__CNPropertySocialProfileEditingCell_labelButtonClicked___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 profile];
  v5 = [v4 bundleIdentifiers];
  id v6 = [v3 bundleIdentifier];

  uint64_t v7 = [v5 containsObject:v6];
  return v7;
}

- (CNSocialProfile)profile
{
  id v4 = [(CNPropertyCell *)self propertyItem];
  v5 = [v4 labeledValue];
  id v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"CNPropertySocialProfileCell.m" lineNumber:38 description:@"Unexpected social profile value"];
  }
  v8 = [(CNPropertyCell *)self propertyItem];
  v9 = [v8 labeledValue];
  v10 = [v9 value];

  return (CNSocialProfile *)v10;
}

@end