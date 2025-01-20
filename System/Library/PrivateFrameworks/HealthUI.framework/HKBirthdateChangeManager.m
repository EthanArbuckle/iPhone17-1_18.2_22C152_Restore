@interface HKBirthdateChangeManager
+ (id)_birthdayCalendar;
+ (void)showDisabledWarningWithAge:(int64_t)a3 isHealthChecklistAvailable:(BOOL)a4 presentingViewController:(id)a5 withAlertActions:(id)a6;
+ (void)showDisabledWarningWithAge:(int64_t)a3 presentingViewController:(id)a4;
+ (void)showDisabledWarningWithHealthChecklistWithAge:(int64_t)a3 presentingViewController:(id)a4 openHealthChecklistInContext:(BOOL)a5;
- (HKBirthdateChangeManager)initWithHealthStore:(id)a3;
- (HKHealthStore)healthStore;
- (id)_nowDate;
- (id)setBirthdate:(id)a3 withError:(id *)a4;
- (int64_t)_ageFromBirthDate:(id)a3;
- (int64_t)_ageFromBirthDateComponents:(id)a3;
- (void)setHealthStore:(id)a3;
@end

@implementation HKBirthdateChangeManager

- (HKBirthdateChangeManager)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKBirthdateChangeManager;
  v5 = [(HKBirthdateChangeManager *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HKBirthdateChangeManager *)v5 setHealthStore:v4];
  }

  return v6;
}

- (id)setBirthdate:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(HKBirthdateChangeManager *)self healthStore];
  id v23 = 0;
  objc_super v8 = [v7 dateOfBirthComponentsWithError:&v23];
  id v9 = v23;

  v10 = [(HKBirthdateChangeManager *)self healthStore];
  id v22 = v9;
  unsigned int v11 = [v10 _setDateOfBirthComponents:v6 error:&v22];
  id v12 = v22;

  int64_t v13 = [(HKBirthdateChangeManager *)self _ageFromBirthDateComponents:v8];
  int64_t v14 = [(HKBirthdateChangeManager *)self _ageFromBirthDateComponents:v6];

  v15 = objc_alloc_init(HKBirthdateChangeStatus);
  v16 = v15;
  if (v12) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v11;
  }
  [(HKBirthdateChangeStatus *)v15 setSuccess:v17];
  if ([(HKBirthdateChangeStatus *)v16 success]) {
    BOOL v19 = v13 >= *MEMORY[0x1E4F2BE50] && v14 < *MEMORY[0x1E4F2BE50];
  }
  else {
    BOOL v19 = 0;
  }
  [(HKBirthdateChangeStatus *)v16 setShouldShowWarning:v19];
  [(HKBirthdateChangeStatus *)v16 setNewAge:v14];
  id v20 = v12;
  if (v12)
  {
    if (a4) {
      *a4 = v20;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v16;
}

+ (void)showDisabledWarningWithAge:(int64_t)a3 presentingViewController:(id)a4
{
  id v5 = a4;
  [(id)objc_opt_class() showDisabledWarningWithAge:a3 isHealthChecklistAvailable:0 presentingViewController:v5 withAlertActions:MEMORY[0x1E4F1CBF0]];
}

+ (void)showDisabledWarningWithHealthChecklistWithAge:(int64_t)a3 presentingViewController:(id)a4 openHealthChecklistInContext:(BOOL)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4FB1410];
  objc_super v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = a4;
  v10 = [v8 bundleWithIdentifier:@"com.apple.HealthUI"];
  unsigned int v11 = [v10 localizedStringForKey:@"EDIT_DETAILS_ACTION_CHECKLIST" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __128__HKBirthdateChangeManager_showDisabledWarningWithHealthChecklistWithAge_presentingViewController_openHealthChecklistInContext___block_invoke;
  v15[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  BOOL v16 = a5;
  id v12 = [v7 actionWithTitle:v11 style:0 handler:v15];

  int64_t v13 = objc_opt_class();
  v17[0] = v12;
  int64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v13 showDisabledWarningWithAge:a3 isHealthChecklistAvailable:1 presentingViewController:v9 withAlertActions:v14];
}

void __128__HKBirthdateChangeManager_showDisabledWarningWithHealthChecklistWithAge_presentingViewController_openHealthChecklistInContext___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    v1 = @"x-apple-health://HealthChecklist/CurrentContext";
  }
  else {
    v1 = @"x-apple-health://HealthChecklist";
  }
  v2 = (void *)MEMORY[0x1E4F223E0];
  v3 = v1;
  id v5 = [v2 defaultWorkspace];
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  [v5 openSensitiveURL:v4 withOptions:MEMORY[0x1E4F1CC08]];
}

+ (void)showDisabledWarningWithAge:(int64_t)a3 isHealthChecklistAvailable:(BOOL)a4 presentingViewController:(id)a5 withAlertActions:(id)a6
{
  BOOL v7 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  unsigned int v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v12 = [v11 localizedStringForKey:@"EDIT_DETAILS_AGE_UNDER_13_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  if (a3 < 0 && v7)
  {
    int64_t v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int64_t v14 = v13;
    v15 = @"EDIT_DETAILS_AGE_REMOVED_TEXT_CHECKLIST_AVAILABLE";
LABEL_4:
    BOOL v16 = [v13 localizedStringForKey:v15 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    goto LABEL_10;
  }
  if (v7)
  {
    uint64_t v17 = NSString;
    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int64_t v14 = v18;
    BOOL v19 = @"EDIT_DETAILS_AGE_%ld_UNDER_13_BODY_CHECKLIST_AVAILABLE";
  }
  else
  {
    if (a3 < 0)
    {
      int64_t v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v14 = v13;
      v15 = @"EDIT_DETAILS_AGE_REMOVED_TEXT_CHECKLIST_UNAVAILABLE";
      goto LABEL_4;
    }
    uint64_t v17 = NSString;
    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int64_t v14 = v18;
    BOOL v19 = @"EDIT_DETAILS_AGE_%ld_UNDER_13_BODY_CHECKLIST_UNAVAILABLE";
  }
  id v20 = [v18 localizedStringForKey:v19 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  BOOL v16 = objc_msgSend(v17, "localizedStringWithFormat:", v20, a3);

LABEL_10:
  v21 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v16 preferredStyle:1];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v10;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        [v21 addAction:*(void *)(*((void *)&v31 + 1) + 8 * v26++)];
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v24);
  }

  v27 = (void *)MEMORY[0x1E4FB1410];
  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v29 = [v28 localizedStringForKey:@"EDIT_DETAILS_ALERT_ACTION_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v30 = [v27 actionWithTitle:v29 style:0 handler:0];

  [v21 addAction:v30];
  [v21 setPreferredAction:v30];
  [v9 presentViewController:v21 animated:1 completion:0];
}

- (int64_t)_ageFromBirthDateComponents:(id)a3
{
  if (!a3) {
    return -1;
  }
  id v4 = a3;
  id v5 = +[HKBirthdateChangeManager _birthdayCalendar];
  id v6 = [v5 dateFromComponents:v4];

  int64_t v7 = [(HKBirthdateChangeManager *)self _ageFromBirthDate:v6];
  return v7;
}

- (int64_t)_ageFromBirthDate:(id)a3
{
  id v4 = a3;
  id v5 = +[HKBirthdateChangeManager _birthdayCalendar];
  id v6 = [(HKBirthdateChangeManager *)self _nowDate];
  int64_t v7 = [v5 components:4 fromDate:v4 toDate:v6 options:0];

  int64_t v8 = [v7 year];
  return v8;
}

- (id)_nowDate
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

+ (id)_birthdayCalendar
{
  if (_birthdayCalendar_onceToken != -1) {
    dispatch_once(&_birthdayCalendar_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)_birthdayCalendar_calendar;
  return v2;
}

uint64_t __45__HKBirthdateChangeManager__birthdayCalendar__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = _birthdayCalendar_calendar;
  _birthdayCalendar_calendar = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end