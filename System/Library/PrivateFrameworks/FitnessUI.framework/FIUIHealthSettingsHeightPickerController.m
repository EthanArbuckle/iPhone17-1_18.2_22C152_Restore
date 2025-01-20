@interface FIUIHealthSettingsHeightPickerController
- (id)_pickerDisplayStringForHeightForRow:(int64_t)a3 forComponent:(int64_t)a4;
- (id)heightUpdateHandler;
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_heightPickerUpdated;
- (void)setHeightQuantity:(id)a3;
- (void)setHeightUpdateHandler:(id)a3;
@end

@implementation FIUIHealthSettingsHeightPickerController

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  if ([(FIUIHealthSettingsPickerController *)self isMetricLocale]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  BOOL v5 = [(FIUIHealthSettingsPickerController *)self isMetricLocale];
  int64_t v6 = 12;
  if (!a4) {
    int64_t v6 = 9;
  }
  if (v5) {
    return 246;
  }
  else {
    return v6;
  }
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  BOOL v5 = [(FIUIHealthSettingsHeightPickerController *)self _pickerDisplayStringForHeightForRow:a4 forComponent:a5];
  int64_t v6 = _PickerStyledAttributedString(v5);

  return v6;
}

- (void)setHeightQuantity:(id)a3
{
  id v21 = a3;
  if (!v21)
  {
    v4 = (void *)MEMORY[0x263F0A630];
    BOOL v5 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:5];
    id v21 = [v4 quantityWithUnit:v5 doubleValue:162.0];
  }
  if ([(FIUIHealthSettingsPickerController *)self isMetricLocale])
  {
    int64_t v6 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:5];
    [v21 doubleValueForUnit:v6];
    uint64_t v8 = llround(v7);

    uint64_t v9 = 30;
    if (v8 > 30) {
      uint64_t v9 = v8;
    }
    uint64_t v10 = v9 - 30;
    v11 = [(FIUIHealthSettingsPickerController *)self pickerView];
    v12 = v11;
    uint64_t v13 = v10;
    uint64_t v14 = 0;
  }
  else
  {
    v15 = [MEMORY[0x263F0A830] inchUnit];
    [v21 doubleValueForUnit:v15];
    int64_t v17 = llround(v16);

    uint64_t v18 = (uint64_t)(double)(v17 / 12);
    uint64_t v19 = (v17 - 12 * v18) & ~((v17 - 12 * v18) >> 63);
    v20 = [(FIUIHealthSettingsPickerController *)self pickerView];
    [v20 selectRow:v18 - 1 inComponent:0 animated:0];

    v11 = [(FIUIHealthSettingsPickerController *)self pickerView];
    v12 = v11;
    uint64_t v13 = v19;
    uint64_t v14 = 1;
  }
  [v11 selectRow:v13 inComponent:v14 animated:0];
}

- (void)_heightPickerUpdated
{
  BOOL v3 = [(FIUIHealthSettingsPickerController *)self isMetricLocale];
  v4 = [(FIUIHealthSettingsPickerController *)self pickerView];
  uint64_t v5 = [v4 selectedRowInComponent:0];
  uint64_t v6 = v5;
  if (v3)
  {
    uint64_t v7 = v5 + 30;

    uint64_t v8 = (void *)MEMORY[0x263F0A630];
    [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:5];
  }
  else
  {

    uint64_t v9 = [(FIUIHealthSettingsPickerController *)self pickerView];
    uint64_t v10 = [v9 selectedRowInComponent:1];

    uint64_t v7 = v10 + 12 * v6 + 12;
    uint64_t v8 = (void *)MEMORY[0x263F0A630];
    [MEMORY[0x263F0A830] inchUnit];
  v11 = };
  uint64_t v14 = [v8 quantityWithUnit:v11 doubleValue:(double)v7];

  v12 = [(FIUIHealthSettingsHeightPickerController *)self heightUpdateHandler];

  if (v12)
  {
    uint64_t v13 = [(FIUIHealthSettingsHeightPickerController *)self heightUpdateHandler];
    v13[2](v13, v14);
  }
  MEMORY[0x270F9A758]();
}

- (id)_pickerDisplayStringForHeightForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  uint64_t v7 = _HeightFormatterMediumStyle();
  BOOL v8 = [(FIUIHealthSettingsPickerController *)self isMetricLocale];
  int64_t v9 = a3 + 30;
  if (a4) {
    int64_t v10 = a3;
  }
  else {
    int64_t v10 = a3 + 1;
  }
  uint64_t v11 = 1281;
  if (!a4) {
    uint64_t v11 = 1282;
  }
  if (v8)
  {
    uint64_t v12 = 9;
  }
  else
  {
    int64_t v9 = v10;
    uint64_t v12 = v11;
  }
  uint64_t v13 = [v7 stringFromValue:v12 unit:(double)(unint64_t)v9];

  return v13;
}

- (id)heightUpdateHandler
{
  return self->_heightUpdateHandler;
}

- (void)setHeightUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_heightUpdateHandler, 0);
  objc_storeStrong((id *)&self->_heightFormatter, 0);
}

@end