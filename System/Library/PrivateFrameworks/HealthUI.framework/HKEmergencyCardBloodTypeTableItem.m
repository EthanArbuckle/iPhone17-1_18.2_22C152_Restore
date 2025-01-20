@interface HKEmergencyCardBloodTypeTableItem
- (BOOL)hasPresentableData;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)_createEditableCell;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (int64_t)editingStyleForRowAtIndex:(int64_t)a3;
- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (void)medicalIDEditorCellDidChangeValue:(id)a3;
@end

@implementation HKEmergencyCardBloodTypeTableItem

- (BOOL)hasPresentableData
{
  v2 = [(HKEmergencyCardTableItem *)self data];
  BOOL v3 = [v2 bloodType] != 0;

  return v3;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v3 = [v2 localizedStringForKey:@"blood_type" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_createEditableCell
{
  v16[9] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HKMedicalIDEditorCell *)[HKMedicalIDEditorPickerCell alloc] initWithStyle:0 reuseIdentifier:@"kBloodTypeTableItemCellIdentifier"];
  v4 = [(HKEmergencyCardBloodTypeTableItem *)self title];
  [(HKMedicalIDEditorCell *)v3 setLabel:v4];

  [(HKMedicalIDEditorCell *)v3 setMinimumLabelWidth:87.0];
  [(HKMedicalIDEditorCell *)v3 setEditDelegate:self];
  v15 = HKStringForBloodType(0);
  v16[0] = v15;
  v5 = HKStringForBloodType(1);
  v16[1] = v5;
  v6 = HKStringForBloodType(2);
  v16[2] = v6;
  v7 = HKStringForBloodType(3);
  v16[3] = v7;
  v8 = HKStringForBloodType(4);
  v16[4] = v8;
  v9 = HKStringForBloodType(5);
  v16[5] = v9;
  v10 = HKStringForBloodType(6);
  v16[6] = v10;
  v11 = HKStringForBloodType(7);
  v16[7] = v11;
  v12 = HKStringForBloodType(8);
  v16[8] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:9];
  [(HKMedicalIDEditorPickerCell *)v3 setPossibleValues:v13];

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    if (self->_isEditing
      || ([(HKEmergencyCardTableItem *)self data],
          v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 bloodType],
          v6,
          v7))
    {
      v8 = [v5 dequeueReusableCellWithIdentifier:@"kBloodTypeTableItemCellIdentifier"];
      if (!v8)
      {
        v8 = [(HKEmergencyCardBloodTypeTableItem *)self _createEditableCell];
      }
      v9 = [(HKEmergencyCardTableItem *)self data];
      objc_msgSend(v8, "setChosenValueIndex:", objc_msgSend(v9, "bloodType"));

      v10 = v8;
      editableCell = self->_editableCell;
      self->_editableCell = v10;
    }
    else
    {
      editableCell = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v18 = [editableCell localizedStringForKey:@"add_blood_type" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v10 = [(HKEmergencyCardTableItem *)self _dequeueNoValueCellInTableView:v5 withTitle:v18];
    }
  }
  else
  {
    v12 = +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier];
    v10 = [v5 dequeueReusableCellWithIdentifier:v12];

    v13 = [(HKEmergencyCardBloodTypeTableItem *)self title];
    v14 = [(HKMedicalIDEditorPickerCell *)v10 titleLabel];
    [v14 setText:v13];

    editableCell = [(HKEmergencyCardTableItem *)self data];
    v15 = HKStringForBloodType([editableCell bloodType]);
    v16 = [(HKMedicalIDEditorPickerCell *)v10 detailLabel];
    [v16 setText:v15];
  }
  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  id v6 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    v10.receiver = self;
    v10.super_class = (Class)HKEmergencyCardBloodTypeTableItem;
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
    [(HKMedicalIDEditorPickerCell *)self->_editableCell beginEditing];
  }
  return 0;
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  int64_t v4 = [(HKMedicalIDEditorPickerCell *)self->_editableCell chosenValueIndex];
  id v5 = [(HKEmergencyCardTableItem *)self data];
  [v5 setBloodType:v4];
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  if (self->_isEditing) {
    return 1;
  }
  int64_t v4 = [(HKEmergencyCardTableItem *)self data];
  uint64_t v5 = [v4 bloodType];

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
    [v5 setBloodType:0];

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
    [(HKMedicalIDEditorPickerCell *)self->_editableCell beginEditing];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayCell, 0);
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end