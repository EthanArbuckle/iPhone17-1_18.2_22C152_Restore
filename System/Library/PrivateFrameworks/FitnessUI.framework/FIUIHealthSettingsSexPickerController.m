@interface FIUIHealthSettingsSexPickerController
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)sexUpdateHandler;
- (int64_t)_biologicalSexForRow:(int64_t)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_updateWithBiologicalSex:(int64_t)a3;
- (void)forceUpdate;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setSexUpdateHandler:(id)a3;
@end

@implementation FIUIHealthSettingsSexPickerController

- (void)forceUpdate
{
  id v3 = [(FIUIHealthSettingsPickerController *)self pickerView];
  -[FIUIHealthSettingsSexPickerController _updateWithBiologicalSex:](self, "_updateWithBiologicalSex:", -[FIUIHealthSettingsSexPickerController _biologicalSexForRow:](self, "_biologicalSexForRow:", [v3 selectedRowInComponent:0]));
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 4;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  int64_t v6 = [(FIUIHealthSettingsSexPickerController *)self _biologicalSexForRow:a4];
  [(FIUIHealthSettingsSexPickerController *)self _updateWithBiologicalSex:v6];
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v5 = FIUIBiologicalSexDisplayString([(FIUIHealthSettingsSexPickerController *)self _biologicalSexForRow:a4]);
  int64_t v6 = _PickerStyledAttributedString(v5);

  return v6;
}

- (void)_updateWithBiologicalSex:(int64_t)a3
{
  v5 = [(FIUIHealthSettingsSexPickerController *)self sexUpdateHandler];

  if (v5)
  {
    int64_t v6 = [(FIUIHealthSettingsSexPickerController *)self sexUpdateHandler];
    v6[2](v6, a3);
  }
}

- (int64_t)_biologicalSexForRow:(int64_t)a3
{
  return a3;
}

- (void)setBiologicalSex:(int64_t)a3
{
  id v4 = [(FIUIHealthSettingsPickerController *)self pickerView];
  [v4 selectRow:a3 inComponent:0 animated:0];
}

- (id)sexUpdateHandler
{
  return self->_sexUpdateHandler;
}

- (void)setSexUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end