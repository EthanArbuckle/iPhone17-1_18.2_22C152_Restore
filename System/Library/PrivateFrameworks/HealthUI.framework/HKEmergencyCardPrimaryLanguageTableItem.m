@interface HKEmergencyCardPrimaryLanguageTableItem
- (BOOL)hasPresentableData;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (HKEmergencyCardPrimaryLanguageUpdateDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)_createEditableCell;
- (id)attributedStringForCurrentLanguage;
- (id)initInEditMode:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (int64_t)editingStyleForRowAtIndex:(int64_t)a3;
- (void)didCancelLanguageSelection;
- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (void)didSelectCellWithLanguage:(id)a3;
- (void)presentSpokenLanguageController;
- (void)setCurrentLanguage:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKEmergencyCardPrimaryLanguageTableItem

- (BOOL)hasPresentableData
{
  v2 = [(HKEmergencyCardTableItem *)self data];
  v3 = [v2 primaryLanguageCode];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"primary_language" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)initInEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKEmergencyCardPrimaryLanguageTableItem;
  BOOL v4 = -[HKEmergencyCardTableItem initInEditMode:](&v17, sel_initInEditMode_);
  if (v4) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CA20];
    v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v8 = [v6 spokenLanguagesForLanguages:v7 includeLanguagesForRegion:1];
    uint64_t v9 = objc_msgSend(v8, "hk_map:", &__block_literal_global_90);
    v10 = (void *)v4[8];
    v4[8] = v9;

    v11 = [MEMORY[0x1E4F1CA20] availableSpokenLanguages];
    v12 = objc_msgSend(v11, "hk_map:", &__block_literal_global_296);
    v13 = [v12 allObjects];
    uint64_t v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_299];
    v15 = (void *)v4[9];
    v4[9] = v14;
  }
  return v4;
}

HKSpokenLanguage *__58__HKEmergencyCardPrimaryLanguageTableItem_initInEditMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [[HKSpokenLanguage alloc] initWithLanguageIdentifier:v2 forCategory:1];

  return v3;
}

HKSpokenLanguage *__58__HKEmergencyCardPrimaryLanguageTableItem_initInEditMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [[HKSpokenLanguage alloc] initWithLanguageIdentifier:v2 forCategory:2];

  return v3;
}

uint64_t __58__HKEmergencyCardPrimaryLanguageTableItem_initInEditMode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 languageInCurrentLocale];
  v6 = [v4 languageInCurrentLocale];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)_createEditableCell
{
  BOOL v3 = [(HKMedicalIDEditorCell *)[HKMedicalIDEditorLanguageCell alloc] initWithStyle:0 reuseIdentifier:@"kPreferredLanguageTableItemCellIdentifier"];
  id v4 = [(HKEmergencyCardPrimaryLanguageTableItem *)self title];
  [(HKMedicalIDEditorCell *)v3 setLabel:v4];

  [(HKMedicalIDEditorCell *)v3 setMinimumLabelWidth:87.0];
  [(HKMedicalIDEditorCell *)v3 setEditDelegate:self];
  [(HKMedicalIDEditorLanguageCell *)v3 setValueLanguageText:self->_currentLanguage];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__HKEmergencyCardPrimaryLanguageTableItem__createEditableCell__block_invoke;
  v6[3] = &unk_1E6D51C48;
  objc_copyWeak(&v7, &location);
  [(HKMedicalIDEditorLanguageCell *)v3 setBeginEditAction:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

void __62__HKEmergencyCardPrimaryLanguageTableItem__createEditableCell__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentSpokenLanguageController];
}

- (void)setCurrentLanguage:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_currentLanguage) {
    goto LABEL_3;
  }
  BOOL v5 = [(HKEmergencyCardTableItem *)self data];
  v6 = [v5 primaryLanguageCode];
  id v7 = [(HKSpokenLanguage *)self->_currentLanguage identifier];

  if (v6 != v7)
  {
LABEL_3:
    v8 = [(HKEmergencyCardTableItem *)self data];
    uint64_t v9 = [v8 primaryLanguageCode];

    if (!v9 && v3)
    {
      v10 = (void *)MEMORY[0x1E4F1CA20];
      v11 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      v12 = [v10 spokenLanguagesForLanguages:v11 includeLanguagesForRegion:1];
      v13 = [v12 firstObject];
      uint64_t v14 = [(HKEmergencyCardTableItem *)self data];
      [v14 setPrimaryLanguageCode:v13];
    }
    v15 = [HKSpokenLanguage alloc];
    id v19 = [(HKEmergencyCardTableItem *)self data];
    v16 = [v19 primaryLanguageCode];
    objc_super v17 = [(HKSpokenLanguage *)v15 initWithLanguageIdentifier:v16 forCategory:0];
    currentLanguage = self->_currentLanguage;
    self->_currentLanguage = v17;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5 = a3;
  [(HKEmergencyCardPrimaryLanguageTableItem *)self setCurrentLanguage:0];
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    if (self->_isEditing
      || ([(HKEmergencyCardTableItem *)self data],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 primaryLanguageCode],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      v8 = [v5 dequeueReusableCellWithIdentifier:@"kPreferredLanguageTableItemCellIdentifier"];
      if (!v8)
      {
        v8 = [(HKEmergencyCardPrimaryLanguageTableItem *)self _createEditableCell];
      }
      uint64_t v9 = v8;
      editableCell = self->_editableCell;
      self->_editableCell = v9;
    }
    else
    {
      editableCell = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v16 = [editableCell localizedStringForKey:@"add_primary_language" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      uint64_t v9 = [(HKEmergencyCardTableItem *)self _dequeueNoValueCellInTableView:v5 withTitle:v16];
    }
  }
  else
  {
    v11 = +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier];
    uint64_t v9 = [v5 dequeueReusableCellWithIdentifier:v11];

    v12 = [(HKEmergencyCardPrimaryLanguageTableItem *)self title];
    v13 = [(HKMedicalIDEditorLanguageCell *)v9 titleLabel];
    [v13 setText:v12];

    editableCell = [(HKEmergencyCardPrimaryLanguageTableItem *)self attributedStringForCurrentLanguage];
    uint64_t v14 = [(HKMedicalIDEditorLanguageCell *)v9 detailLabel];
    [v14 setAttributedText:editableCell];
  }
  return v9;
}

- (id)attributedStringForCurrentLanguage
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v4 = [(HKSpokenLanguage *)self->_currentLanguage languageInCurrentLocale];
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  uint64_t v21 = *MEMORY[0x1E4FB06F8];
  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v22[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v8 = (void *)[v3 initWithString:v4 attributes:v7];

  uint64_t v9 = [(HKSpokenLanguage *)self->_currentLanguage languageInCurrentLocale];
  v10 = [(HKSpokenLanguage *)self->_currentLanguage languageInLanguageLocale];

  if (v9 != v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v12 = NSString;
    v13 = [(HKSpokenLanguage *)self->_currentLanguage languageInLanguageLocale];
    uint64_t v14 = [v12 stringWithFormat:@"\n%@", v13];
    uint64_t v19 = v5;
    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v20 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    objc_super v17 = (void *)[v11 initWithString:v14 attributes:v16];
    [v8 appendAttributedString:v17];
  }
  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  id v6 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    v10.receiver = self;
    v10.super_class = (Class)HKEmergencyCardPrimaryLanguageTableItem;
    [(HKEmergencyCardTableItem *)&v10 tableView:v6 heightForRowAtIndex:a4];
    double v8 = v7;
  }
  else
  {
    double v8 = *MEMORY[0x1E4FB2F28];
  }

  return v8;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  if ([(HKEmergencyCardTableItem *)self isInEditMode]) {
    [(HKMedicalIDEditorLanguageCell *)self->_editableCell beginEditing];
  }
  return 0;
}

- (void)presentSpokenLanguageController
{
  [(HKEmergencyCardPrimaryLanguageTableItem *)self setCurrentLanguage:1];
  uint64_t v5 = [[HKSpokenLanguagesViewController alloc] initWithCurrentLanguage:self->_currentLanguage preferredLanguages:self->_mostLikelyLanguages andAllSpokenLanguages:self->_allSpokenLanguages];
  [(HKSpokenLanguagesViewController *)v5 setPickerDelegate:self];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  id v4 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v4 presentViewController:v3 animated:1 completion:0];
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  if (self->_isEditing) {
    return 1;
  }
  id v4 = [(HKEmergencyCardTableItem *)self data];
  uint64_t v5 = [v4 primaryLanguageCode];

  if (v5) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 1)
  {
    uint64_t v5 = [(HKEmergencyCardTableItem *)self data];
    [v5 setPrimaryLanguageCode:0];

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  self->_isEditing = v6;
  return 2;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 2 && self->_isEditing) {
    [(HKMedicalIDEditorLanguageCell *)self->_editableCell beginEditing];
  }
}

- (void)didSelectCellWithLanguage:(id)a3
{
  id v4 = (HKSpokenLanguage *)a3;
  uint64_t v5 = [(HKSpokenLanguage *)v4 identifier];
  BOOL v6 = [(HKEmergencyCardTableItem *)self data];
  [v6 setPrimaryLanguageCode:v5];

  currentLanguage = self->_currentLanguage;
  self->_currentLanguage = v4;
  double v8 = v4;

  [(HKMedicalIDEditorLanguageCell *)self->_editableCell setValueLanguageText:self->_currentLanguage];
}

- (void)didCancelLanguageSelection
{
  if (![(HKEmergencyCardPrimaryLanguageTableItem *)self hasPresentableData])
  {
    [(HKEmergencyCardPrimaryLanguageTableItem *)self commitEditingStyle:1 forRowAtIndex:0];
    id v3 = [(HKEmergencyCardPrimaryLanguageTableItem *)self delegate];
    [v3 updatePrimaryLanguageTableItem];
  }
}

- (HKEmergencyCardPrimaryLanguageUpdateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKEmergencyCardPrimaryLanguageUpdateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_allSpokenLanguages, 0);
  objc_storeStrong((id *)&self->_mostLikelyLanguages, 0);
  objc_storeStrong((id *)&self->_displayCell, 0);
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end