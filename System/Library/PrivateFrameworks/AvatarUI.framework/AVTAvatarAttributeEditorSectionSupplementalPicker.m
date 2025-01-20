@interface AVTAvatarAttributeEditorSectionSupplementalPicker
+ (id)pickerForMulticolorPicker:(id)a3 isMultipleSelected:(BOOL)a4 switchToSingleColorAvatarUpdater:(id)a5 switchToMultipleColorAvatarUpdater:(id)a6;
+ (id)pickerForPairableModelCategory:(id)a3 isPaired:(BOOL)a4 avatarUpdaterOnPair:(id)a5;
+ (id)pickerFromEditorSection:(id)a3;
- (AVTAvatarAttributeEditorSectionSupplementalPicker)initWithLocalizedTitle:(id)a3 choices:(id)a4;
- (NSArray)choices;
- (NSString)localizedTitle;
- (id)copyWithLocalizedTitle:(id)a3;
@end

@implementation AVTAvatarAttributeEditorSectionSupplementalPicker

+ (id)pickerFromEditorSection:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  id v16 = 0;
  v4 = [v3 sectionItems];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerFromEditorSection___block_invoke;
  v10[3] = &unk_263FF1C68;
  v10[4] = &v11;
  v5 = objc_msgSend(v4, "avt_map:", v10);

  v6 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
  v7 = [(id)v12[5] localizedName];
  v8 = [(AVTAvatarAttributeEditorSectionSupplementalPicker *)v6 initWithLocalizedTitle:v7 choices:v5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

AVTAvatarAttributeEditorSectionSupplementalPickerItem *__77__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerFromEditorSection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isSelected]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  v5 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
  v6 = [v4 localizedName];
  v7 = [v4 avatarUpdater];
  v8 = -[AVTAvatarAttributeEditorSectionSupplementalPickerItem initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:](v5, "initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:", v6, 0, v7, 0, [v4 isSelected]);

  return v8;
}

+ (id)pickerForPairableModelCategory:(id)a3 isPaired:(BOOL)a4 avatarUpdaterOnPair:(id)a5
{
  BOOL v5 = a4;
  v28[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = [a3 pairing];
  if (v8)
  {
    v9 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    v10 = [v8 localizedPairTitle];
    uint64_t v11 = [v8 localizedPairedDescription];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke;
    v26[3] = &unk_263FF1C90;
    id v12 = v8;
    id v27 = v12;
    uint64_t v13 = [(AVTAvatarAttributeEditorSectionSupplementalPickerItem *)v9 initWithLocalizedName:v10 localizedDescription:v11 avatarUpdater:0 editorUpdater:v26 selected:v5];

    v14 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    v15 = [v12 localizedUnpairTitle];
    id v16 = [v12 localizedUnpairedDescription];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke_2;
    v24[3] = &unk_263FF1C90;
    id v17 = v12;
    id v25 = v17;
    v18 = [(AVTAvatarAttributeEditorSectionSupplementalPickerItem *)v14 initWithLocalizedName:v15 localizedDescription:v16 avatarUpdater:v7 editorUpdater:v24 selected:v5 ^ 1];

    if (v5) {
      [v17 localizedPairTitle];
    }
    else {
    v20 = [v17 localizedUnpairTitle];
    }
    v21 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
    v28[0] = v13;
    v28[1] = v18;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    v19 = [(AVTAvatarAttributeEditorSectionSupplementalPicker *)v21 initWithLocalizedTitle:v20 choices:v22];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCategory:inPairedState:", objc_msgSend(v2, "pairedCategory"), 1);
}

void __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCategory:inPairedState:", objc_msgSend(v2, "pairedCategory"), 0);
}

+ (id)pickerForMulticolorPicker:(id)a3 isMultipleSelected:(BOOL)a4 switchToSingleColorAvatarUpdater:(id)a5 switchToMultipleColorAvatarUpdater:(id)a6
{
  BOOL v8 = a4;
  v42[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 auxiliaryPicker];
  uint64_t v13 = v12;
  if (v12)
  {
    v14 = [v12 items];
    v15 = [v14 objectAtIndexedSubscript:0];

    id v16 = [v13 items];
    id v17 = [v16 objectAtIndexedSubscript:1];

    id v37 = v11;
    v18 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    v19 = [v15 title];
    v20 = [v15 message];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke;
    v40[3] = &unk_263FF1C90;
    id v21 = v9;
    id v36 = v9;
    id v22 = v10;
    id v23 = v21;
    id v41 = v21;
    v24 = [(AVTAvatarAttributeEditorSectionSupplementalPickerItem *)v18 initWithLocalizedName:v19 localizedDescription:v20 avatarUpdater:v22 editorUpdater:v40 selected:v8 ^ 1];

    id v25 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    v26 = [v17 title];
    id v27 = [v17 message];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke_2;
    v38[3] = &unk_263FF1C90;
    id v39 = v23;
    v28 = [(AVTAvatarAttributeEditorSectionSupplementalPickerItem *)v25 initWithLocalizedName:v26 localizedDescription:v27 avatarUpdater:v37 editorUpdater:v38 selected:v8];

    if (v8) {
      v29 = v17;
    }
    else {
      v29 = v15;
    }
    v30 = [v29 title];
    v31 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
    v42[0] = v24;
    v42[1] = v28;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
    v33 = v31;
    id v11 = v37;
    v34 = [(AVTAvatarAttributeEditorSectionSupplementalPicker *)v33 initWithLocalizedTitle:v30 choices:v32];

    id v10 = v22;
    id v9 = v36;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

void __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  [v3 setEnabledMulticolorSubpickersIndex:0 forMulticolorPickerIdentifier:v4];
}

void __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 subpickers];
  uint64_t v5 = [v7 count] - 1;
  v6 = [*(id *)(a1 + 32) identifier];
  [v4 setEnabledMulticolorSubpickersIndex:v5 forMulticolorPickerIdentifier:v6];
}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)initWithLocalizedTitle:(id)a3 choices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorSectionSupplementalPicker;
  id v9 = [(AVTAvatarAttributeEditorSectionSupplementalPicker *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedTitle, a3);
    objc_storeStrong((id *)&v10->_choices, a4);
  }

  return v10;
}

- (id)copyWithLocalizedTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
  v6 = [(AVTAvatarAttributeEditorSectionSupplementalPicker *)self choices];
  id v7 = [(AVTAvatarAttributeEditorSectionSupplementalPicker *)v5 initWithLocalizedTitle:v4 choices:v6];

  return v7;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSArray)choices
{
  return self->_choices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end