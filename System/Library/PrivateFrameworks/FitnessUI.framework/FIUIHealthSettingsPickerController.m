@interface FIUIHealthSettingsPickerController
- (BOOL)isMetricLocale;
- (FIUIHealthSettingsPickerController)init;
- (UIPickerView)pickerView;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)forceUpdate;
- (void)setIsMetricLocale:(BOOL)a3;
- (void)setPickerView:(id)a3;
@end

@implementation FIUIHealthSettingsPickerController

- (FIUIHealthSettingsPickerController)init
{
  v8.receiver = self;
  v8.super_class = (Class)FIUIHealthSettingsPickerController;
  v2 = [(FIUIHealthSettingsPickerController *)&v8 init];
  if (v2)
  {
    v2->_isMetricLocale = _IsMetricLocale();
    id v3 = objc_alloc(MEMORY[0x263F82A38]);
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    pickerView = v2->_pickerView;
    v2->_pickerView = (UIPickerView *)v4;

    [(UIPickerView *)v2->_pickerView setDataSource:v2];
    [(UIPickerView *)v2->_pickerView setDelegate:v2];
    v6 = [MEMORY[0x263F825C8] colorWithRed:0.109803922 green:0.109803922 blue:0.109803922 alpha:1.0];
    [(UIPickerView *)v2->_pickerView setBackgroundColor:v6];
  }
  return v2;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 0;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 0;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (BOOL)isMetricLocale
{
  return self->_isMetricLocale;
}

- (void)setIsMetricLocale:(BOOL)a3
{
  self->_isMetricLocale = a3;
}

- (void).cxx_destruct
{
}

- (void)forceUpdate
{
  uint64_t v4 = objc_opt_class();
  MEMORY[0x270EF2BB8](self, a2, v4);
}

@end