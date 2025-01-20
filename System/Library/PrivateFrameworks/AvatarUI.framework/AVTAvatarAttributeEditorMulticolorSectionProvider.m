@interface AVTAvatarAttributeEditorMulticolorSectionProvider
- (AVTAvatarAttributeEditorMulticolorPickerSection)pickerSection;
- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithIdentifier:(id)a3 localizedName:(id)a4 subpickers:(id)a5 nestedPresetPickers:(id)a6 supplementalPicker:(id)a7 pickerItems:(id)a8 editorState:(id)a9;
- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithIdentifier:(id)a3 localizedName:(id)a4 subpickers:(id)a5 subpickerRemovalUpdaters:(id)a6 nestedPresetPickers:(id)a7 supplementalPicker:(id)a8 pickerItems:(id)a9 editorState:(id)a10;
- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithLocalizedName:(id)a3 subpickers:(id)a4 nestedPresetPickers:(id)a5 supplementalPicker:(id)a6 pickerItems:(id)a7 editorState:(id)a8;
- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker;
- (AVTAvatarAttributeEditorState)editorState;
- (BOOL)allowsRemoval;
- (NSArray)pickerItems;
- (NSArray)sections;
- (NSArray)subpickerRemovalUpdaters;
- (NSArray)subpickers;
- (NSArray)subsections;
- (NSDictionary)nestedPresetPickers;
- (NSString)identifier;
- (NSString)localizedName;
- (id)subpickerSectionIdentifiers;
- (void)createPickerSectionIfNeeded;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setNestedPresetPickers:(id)a3;
- (void)setPickerItems:(id)a3;
- (void)setPickerSection:(id)a3;
- (void)setSubpickers:(id)a3;
- (void)setSupplementalPicker:(id)a3;
@end

@implementation AVTAvatarAttributeEditorMulticolorSectionProvider

- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithLocalizedName:(id)a3 subpickers:(id)a4 nestedPresetPickers:(id)a5 supplementalPicker:(id)a6 pickerItems:(id)a7 editorState:(id)a8
{
  v14 = (void *)MEMORY[0x263F08C38];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [v14 UUID];
  v22 = [v21 UUIDString];
  v23 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self initWithIdentifier:v22 localizedName:v20 subpickers:v19 nestedPresetPickers:v18 supplementalPicker:v17 pickerItems:v16 editorState:v15];

  return v23;
}

- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithIdentifier:(id)a3 localizedName:(id)a4 subpickers:(id)a5 nestedPresetPickers:(id)a6 supplementalPicker:(id)a7 pickerItems:(id)a8 editorState:(id)a9
{
  return [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self initWithIdentifier:a3 localizedName:a4 subpickers:a5 subpickerRemovalUpdaters:0 nestedPresetPickers:a6 supplementalPicker:a7 pickerItems:a8 editorState:a9];
}

- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithIdentifier:(id)a3 localizedName:(id)a4 subpickers:(id)a5 subpickerRemovalUpdaters:(id)a6 nestedPresetPickers:(id)a7 supplementalPicker:(id)a8 pickerItems:(id)a9 editorState:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)AVTAvatarAttributeEditorMulticolorSectionProvider;
  id v18 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)&v28 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_localizedName, a4);
    objc_storeStrong((id *)&v19->_subpickerRemovalUpdaters, a6);
    objc_storeStrong((id *)&v19->_nestedPresetPickers, a7);
    objc_storeStrong((id *)&v19->_supplementalPicker, a8);
    objc_storeStrong((id *)&v19->_pickerItems, a9);
    objc_storeStrong((id *)&v19->_subpickers, a5);
    objc_storeStrong((id *)&v19->_editorState, a10);
  }

  return v19;
}

- (void)createPickerSectionIfNeeded
{
  v3 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self pickerSection];

  if (!v3)
  {
    v4 = [AVTAvatarAttributeEditorMulticolorPickerSection alloc];
    v5 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self identifier];
    v6 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self localizedName];
    v7 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self pickerItems];
    v8 = [(AVTAvatarAttributeEditorMulticolorPickerSection *)v4 initWithIdentifier:v5 localizedName:v6 items:v7];

    [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self setPickerSection:v8];
  }
}

- (id)subpickerSectionIdentifiers
{
  v2 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self subpickers];
  v3 = objc_msgSend(v2, "avt_map:", &__block_literal_global_20);

  return v3;
}

uint64_t __80__AVTAvatarAttributeEditorMulticolorSectionProvider_subpickerSectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (NSArray)sections
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self editorState];
  v4 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self identifier];
  uint64_t v5 = [v3 selectedMulticolorSubpickersIndexForMulticolorPickerIdentifier:v4];

  v6 = (void *)MEMORY[0x263EFF980];
  v7 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self nestedPresetPickers];
  v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count") + 2);

  [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self createPickerSectionIfNeeded];
  v9 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self pickerSection];
  [v8 addObject:v9];

  v10 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self subpickers];
  v11 = [v10 objectAtIndexedSubscript:v5];

  [v8 addObject:v11];
  v12 = [(AVTAvatarAttributeEditorMulticolorSectionProvider *)self nestedPresetPickers];
  v13 = [NSNumber numberWithInteger:v5];
  v14 = [v12 objectForKeyedSubscript:v13];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "setShouldDisplayInsetSeparatorAfterSection:", 1, (void)v22);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  if (v15) {
    [v8 addObjectsFromArray:v15];
  }
  id v20 = objc_msgSend(v8, "copy", (void)v22);

  return (NSArray *)v20;
}

- (NSArray)subsections
{
  return self->_subsections;
}

- (NSDictionary)nestedPresetPickers
{
  return self->_nestedPresetPickers;
}

- (void)setNestedPresetPickers:(id)a3
{
}

- (BOOL)allowsRemoval
{
  return self->_allowsRemoval;
}

- (NSArray)subpickerRemovalUpdaters
{
  return self->_subpickerRemovalUpdaters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (AVTAvatarAttributeEditorMulticolorPickerSection)pickerSection
{
  return self->_pickerSection;
}

- (void)setPickerSection:(id)a3
{
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (void)setPickerItems:(id)a3
{
}

- (NSArray)subpickers
{
  return self->_subpickers;
}

- (void)setSubpickers:(id)a3
{
}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (void)setSupplementalPicker:(id)a3
{
}

- (AVTAvatarAttributeEditorState)editorState
{
  return self->_editorState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorState, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_subpickers, 0);
  objc_storeStrong((id *)&self->_pickerItems, 0);
  objc_storeStrong((id *)&self->_pickerSection, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subpickerRemovalUpdaters, 0);
  objc_storeStrong((id *)&self->_nestedPresetPickers, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
}

@end