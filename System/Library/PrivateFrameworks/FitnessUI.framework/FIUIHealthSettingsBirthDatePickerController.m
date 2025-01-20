@interface FIUIHealthSettingsBirthDatePickerController
- (FIUIHealthSettingsBirthDatePickerController)init;
- (FIUIHealthSettingsDatePicker)datePickerView;
- (id)dateOfBirthUpdateHandler;
- (void)forceUpdate;
- (void)setDateOfBirth:(id)a3;
- (void)setDateOfBirthUpdateHandler:(id)a3;
- (void)setDatePickerView:(id)a3;
@end

@implementation FIUIHealthSettingsBirthDatePickerController

- (FIUIHealthSettingsBirthDatePickerController)init
{
  v10.receiver = self;
  v10.super_class = (Class)FIUIHealthSettingsBirthDatePickerController;
  v2 = [(FIUIHealthSettingsBirthDatePickerController *)&v10 init];
  if (v2)
  {
    v3 = [FIUIHealthSettingsDatePicker alloc];
    uint64_t v4 = -[FIUIHealthSettingsDatePicker initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    datePickerView = v2->_datePickerView;
    v2->_datePickerView = (FIUIHealthSettingsDatePicker *)v4;

    objc_initWeak(&location, v2);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__FIUIHealthSettingsBirthDatePickerController_init__block_invoke;
    v7[3] = &unk_2644A79D8;
    objc_copyWeak(&v8, &location);
    [(FIUIHealthSettingsDatePicker *)v2->_datePickerView setDateUpdateHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __51__FIUIHealthSettingsBirthDatePickerController_init__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained dateOfBirthUpdateHandler];

    if (v5)
    {
      v6 = [v4 dateOfBirthUpdateHandler];
      ((void (**)(void, id))v6)[2](v6, v7);
    }
  }
}

- (void)setDateOfBirth:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF8F0] currentCalendar];
    v6 = [MEMORY[0x263EFF910] date];
    id v7 = [v5 dateByAddingUnit:4 value:-30 toDate:v6 options:0];

    id v4 = v7;
  }
  id v8 = v4;
  [(FIUIHealthSettingsDatePicker *)self->_datePickerView setDate:v4];
}

- (void)forceUpdate
{
}

- (FIUIHealthSettingsDatePicker)datePickerView
{
  return self->_datePickerView;
}

- (void)setDatePickerView:(id)a3
{
}

- (id)dateOfBirthUpdateHandler
{
  return self->_dateOfBirthUpdateHandler;
}

- (void)setDateOfBirthUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateOfBirthUpdateHandler, 0);
  objc_storeStrong((id *)&self->_datePickerView, 0);
}

@end