@interface FIUIHealthSettingsWeightPickerController
- (double)_weightInLocaleUnitForRow:(int64_t)a3;
- (id)_weightDisplayStringForRow:(int64_t)a3;
- (id)_weightQuantityForRow:(int64_t)a3;
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)weightUpdateHandler;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)numberOfRows;
- (void)_setDefaultValuesOnWeightPickerIfRequiredWithWeight:(id)a3;
- (void)_updateWithWeightQuantity:(id)a3;
- (void)forceUpdate;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setWeightQuantity:(id)a3;
- (void)setWeightUpdateHandler:(id)a3;
@end

@implementation FIUIHealthSettingsWeightPickerController

- (void)forceUpdate
{
  id v4 = [(FIUIHealthSettingsPickerController *)self pickerView];
  v3 = -[FIUIHealthSettingsWeightPickerController _weightQuantityForRow:](self, "_weightQuantityForRow:", [v4 selectedRowInComponent:0]);
  [(FIUIHealthSettingsWeightPickerController *)self _updateWithWeightQuantity:v3];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)numberOfRows
{
  v2 = (void *)MEMORY[0x263F0A630];
  v3 = [MEMORY[0x263F0A830] poundUnit];
  id v4 = [v2 quantityWithUnit:v3 doubleValue:1000.0];

  double v5 = round(_WeightInLocaleUnit(v4));
  return (uint64_t)(v5 - _RoundedMinWeightInLocaleUnit() + 1.0);
}

- (void)_setDefaultValuesOnWeightPickerIfRequiredWithWeight:(id)a3
{
  if (!a3)
  {
    double v5 = _AvgWeightQuantity();
    double v6 = round(_WeightInLocaleUnit(v5));

    uint64_t v7 = (uint64_t)((double)(uint64_t)v6 - _RoundedMinWeightInLocaleUnit());
    id v8 = [(FIUIHealthSettingsPickerController *)self pickerView];
    [v8 selectRow:v7 inComponent:0 animated:0];
  }
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  double v5 = [(FIUIHealthSettingsWeightPickerController *)self _weightDisplayStringForRow:a4];
  double v6 = _PickerStyledAttributedString(v5);

  return v6;
}

- (id)_weightDisplayStringForRow:(int64_t)a3
{
  double v5 = _MassFormatter();
  [(FIUIHealthSettingsWeightPickerController *)self _weightInLocaleUnitForRow:a3];
  uint64_t v7 = [v5 stringFromValue:_LocaleWeightMassFormatterUnit() unit:v6];

  return v7;
}

- (double)_weightInLocaleUnitForRow:(int64_t)a3
{
  return _RoundedMinWeightInLocaleUnit() + (double)a3;
}

- (id)_weightQuantityForRow:(int64_t)a3
{
  double v5 = (void *)MEMORY[0x263F0A630];
  double v6 = [MEMORY[0x263F0A830] unitFromMassFormatterUnit:_LocaleWeightMassFormatterUnit()];
  [(FIUIHealthSettingsWeightPickerController *)self _weightInLocaleUnitForRow:a3];
  uint64_t v7 = objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6);

  return v7;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = [(FIUIHealthSettingsWeightPickerController *)self _weightQuantityForRow:a4];
  [(FIUIHealthSettingsWeightPickerController *)self _updateWithWeightQuantity:v6];
}

- (void)setWeightQuantity:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _AvgWeightQuantity();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v4;
  double v5 = [MEMORY[0x263F0A830] unitFromMassFormatterUnit:_LocaleWeightMassFormatterUnit()];
  [v10 doubleValueForUnit:v5];
  double v7 = round(v6);

  uint64_t v8 = (uint64_t)((double)(uint64_t)v7 - _RoundedMinWeightInLocaleUnit());
  if ((v8 & 0x8000000000000000) == 0
    && [(FIUIHealthSettingsWeightPickerController *)self numberOfRows] > v8)
  {
    v9 = [(FIUIHealthSettingsPickerController *)self pickerView];
    [v9 selectRow:v8 inComponent:0 animated:0];
  }
}

- (void)_updateWithWeightQuantity:(id)a3
{
  id v6 = a3;
  id v4 = [(FIUIHealthSettingsWeightPickerController *)self weightUpdateHandler];

  if (v4)
  {
    double v5 = [(FIUIHealthSettingsWeightPickerController *)self weightUpdateHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)weightUpdateHandler
{
  return self->_weightUpdateHandler;
}

- (void)setWeightUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end