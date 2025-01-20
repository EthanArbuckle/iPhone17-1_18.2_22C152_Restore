@interface HKEmergencyCardBirthdateTableItem
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)_cachedCalendar;
- (id)_createEditableCell;
- (id)initInEditMode:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (int64_t)editingStyleForRowAtIndex:(int64_t)a3;
- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (void)medicalIDEditorCellDidChangeValue:(id)a3;
- (void)timeZoneDidChange:(id)a3;
@end

@implementation HKEmergencyCardBirthdateTableItem

- (id)initInEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HKEmergencyCardBirthdateTableItem.m" lineNumber:28 description:@"HKEmergencyCardBirthdateTableItem only supports edit mode"];
  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardBirthdateTableItem;
  return [(HKEmergencyCardTableItem *)&v8 initInEditMode:v3];
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v3 = [v2 localizedStringForKey:@"birthdate" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (void)timeZoneDidChange:(id)a3
{
  self->_gregorianCalendar = 0;
  MEMORY[0x1F41817F8]();
}

- (id)_createEditableCell
{
  BOOL v3 = [(HKMedicalIDEditorCell *)[HKMedicalIDEditorDateCell alloc] initWithStyle:0 reuseIdentifier:@"kBirthdateTableItemCellIdentifier"];
  v4 = [(HKEmergencyCardBirthdateTableItem *)self title];
  [(HKMedicalIDEditorCell *)v3 setLabel:v4];

  [(HKMedicalIDEditorCell *)v3 setMinimumLabelWidth:47.0];
  [(HKMedicalIDEditorCell *)v3 setEditDelegate:self];
  return v3;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory()) {
    return *MEMORY[0x1E4FB2F28];
  }
  else {
    return 44.0 + 24.0 - 6.0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5 = a3;
  v6 = [(HKEmergencyCardTableItem *)self data];
  v7 = [v6 gregorianBirthday];

  if (v7)
  {
    objc_super v8 = [v5 dequeueReusableCellWithIdentifier:@"kBirthdateTableItemCellIdentifier"];
    if (!v8)
    {
      objc_super v8 = [(HKEmergencyCardBirthdateTableItem *)self _createEditableCell];
    }
    v9 = [(HKEmergencyCardBirthdateTableItem *)self _cachedCalendar];
    v10 = [(HKEmergencyCardTableItem *)self data];
    v11 = [v10 gregorianBirthday];
    v12 = [v9 dateFromComponents:v11];
    [v8 setDateValue:v12];

    v13 = v8;
    editableCell = self->_editableCell;
    self->_editableCell = v13;
  }
  else
  {
    editableCell = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v15 = [editableCell localizedStringForKey:@"add_birthdate" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v13 = [(HKEmergencyCardTableItem *)self _dequeueNoValueCellInTableView:v5 withTitle:v15];
  }
  return v13;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  BOOL v3 = [(HKEmergencyCardTableItem *)self data];
  v4 = [v3 gregorianBirthday];

  if (v4) {
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
    id v5 = [(HKEmergencyCardTableItem *)self data];
    [v5 setGregorianBirthday:0];
  }
  else
  {
    id v5 = HKUIDefaultGregorianBirthday();
    v6 = [(HKEmergencyCardTableItem *)self data];
    [v6 setGregorianBirthday:v5];
  }
  return 2;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 2) {
    [(HKMedicalIDEditorDateCell *)self->_editableCell beginEditing];
  }
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  id v8 = [(HKMedicalIDEditorDateCell *)self->_editableCell dateValue];
  if (v8)
  {
    BOOL v3 = [(HKEmergencyCardBirthdateTableItem *)self _cachedCalendar];
    id v5 = objc_msgSend(v3, "hk_dateOfBirthDateComponentsWithDate:", v8);
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(HKEmergencyCardTableItem *)self data];
  [v6 setGregorianBirthday:v5];

  v7 = v8;
  if (v8)
  {

    v7 = v8;
  }
}

- (id)_cachedCalendar
{
  gregorianCalendar = self->_gregorianCalendar;
  if (!gregorianCalendar)
  {
    objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_gregorianCalendar;
    self->_gregorianCalendar = v4;

    gregorianCalendar = self->_gregorianCalendar;
  }
  return gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end