@interface HKEmergencyCardWeightTableItem
- (BOOL)hasPresentableData;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)_createEditableCell;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (int64_t)editingStyleForRowAtIndex:(int64_t)a3;
- (void)commitEditing;
- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (void)localeDidChange:(id)a3;
- (void)medicalIDEditorCellDidChangeValue:(id)a3;
@end

@implementation HKEmergencyCardWeightTableItem

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"weight" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (BOOL)hasPresentableData
{
  v2 = [(HKEmergencyCardTableItem *)self data];
  v3 = [v2 weight];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)localeDidChange:(id)a3
{
}

- (id)_createEditableCell
{
  v3 = [[HKMedicalIDEditorWeightCell alloc] initWithStyle:0 reuseIdentifier:@"kWeightTableItemCellIdentifier"];
  BOOL v4 = [(HKEmergencyCardWeightTableItem *)self title];
  [(HKMedicalIDEditorCell *)v3 setLabel:v4];

  [(HKMedicalIDEditorCell *)v3 setMinimumLabelWidth:47.0];
  [(HKMedicalIDEditorCell *)v3 setEditDelegate:self];
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    v6 = [(HKEmergencyCardTableItem *)self data];
    v7 = [v6 weight];

    if (v7)
    {
      v8 = [v5 dequeueReusableCellWithIdentifier:@"kWeightTableItemCellIdentifier"];
      if (!v8)
      {
        v8 = [(HKEmergencyCardWeightTableItem *)self _createEditableCell];
      }
      v9 = [(HKEmergencyCardTableItem *)self data];
      v10 = [v9 weight];
      v11 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:9];
      [v10 doubleValueForUnit:v11];
      double v13 = v12;

      v14 = [NSNumber numberWithDouble:v13];
      [v8 setKilogramValue:v14];

      v15 = v8;
      editableCell = self->_editableCell;
      self->_editableCell = v15;
    }
    else
    {
      editableCell = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v28 = [editableCell localizedStringForKey:@"add_weight" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v15 = [(HKEmergencyCardTableItem *)self _dequeueNoValueCellInTableView:v5 withTitle:v28];
    }
  }
  else
  {
    v17 = +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier];
    v15 = [v5 dequeueReusableCellWithIdentifier:v17];

    v18 = [(HKEmergencyCardWeightTableItem *)self title];
    v19 = [(HKMedicalIDEditorWeightCell *)v15 titleLabel];
    [v19 setText:v18];

    v20 = [(HKEmergencyCardTableItem *)self data];
    v21 = [v20 weight];
    v22 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:9];
    [v21 doubleValueForUnit:v22];
    double v24 = v23;

    editableCell = +[HKPersonWeightFormatter sharedFormatter];
    v25 = [NSNumber numberWithDouble:v24];
    v26 = [editableCell stringFromWeightInKilograms:v25];
    v27 = [(HKMedicalIDEditorWeightCell *)v15 detailLabel];
    [v27 setText:v26];
  }
  return v15;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  id v6 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    v10.receiver = self;
    v10.super_class = (Class)HKEmergencyCardWeightTableItem;
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
  BOOL v4 = [(HKEmergencyCardTableItem *)self data];
  id v5 = [v4 weight];

  if (v5) {
    [(HKMedicalIDEditorWeightCell *)self->_editableCell beginEditing];
  }
  return 0;
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  id v8 = [(HKMedicalIDEditorWeightCell *)self->_editableCell kilogramValue];
  if (v8)
  {
    BOOL v4 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:9];
    id v5 = (void *)MEMORY[0x1E4F2B370];
    [v8 doubleValue];
    id v6 = objc_msgSend(v5, "quantityWithUnit:doubleValue:", v4);
    double v7 = [(HKEmergencyCardTableItem *)self data];
    [v7 setWeight:v6];
  }
  else
  {
    BOOL v4 = [(HKEmergencyCardTableItem *)self data];
    [v4 setWeight:0];
  }
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  v3 = [(HKEmergencyCardTableItem *)self data];
  BOOL v4 = [v3 weight];

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
    [v5 setWeight:0];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F2B618], "gramUnitWithMetricPrefix:", 9, a4);
    id v6 = (void *)MEMORY[0x1E4F2B370];
    +[HKMedicalIDWeightPickerDataProvider defaultKilogramValue];
    double v7 = objc_msgSend(v6, "quantityWithUnit:doubleValue:", v5);
    id v8 = [(HKEmergencyCardTableItem *)self data];
    [v8 setWeight:v7];
  }
  return 2;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 2) {
    [(HKMedicalIDEditorWeightCell *)self->_editableCell beginEditing];
  }
}

- (void)commitEditing
{
}

- (void).cxx_destruct
{
}

@end