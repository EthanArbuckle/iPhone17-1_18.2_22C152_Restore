@interface HKClinicalAuthorizationDisplayController
- (HKClinicalAuthorizationDisplayController)init;
- (HKClinicalAuthorizationDisplayController)initWithAuthorizationController:(id)a3;
- (HKClinicalSourceAuthorizationController)authorizationController;
- (HKSource)source;
- (id)_displayReadAuthorizationDateForMode:(int64_t)a3;
- (id)_displayStringForReadAuthorizationDate:(id)a3;
- (id)committedTitleForReadAuthorizationModeFooterWithSelectedMode:(int64_t)a3 formatBlock:(id)a4;
- (id)currentTimeDisplayStringForReadAuthorizationFooter;
- (id)currentTimeTitleForReadAuthorizationModeFooterWithSelectedMode:(int64_t)a3 formatBlock:(id)a4;
@end

@implementation HKClinicalAuthorizationDisplayController

- (HKClinicalAuthorizationDisplayController)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalAuthorizationDisplayController)initWithAuthorizationController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAuthorizationDisplayController;
  v6 = [(HKClinicalAuthorizationDisplayController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authorizationController, a3);
  }

  return v7;
}

- (id)_displayReadAuthorizationDateForMode:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = [(HKClinicalAuthorizationDisplayController *)self authorizationController];
    id v5 = [v4 orderedTypesForReading];

    if (v5)
    {
      v6 = [v4 displayReadAuthorizationAnchorDate];
      v7 = v6;
      if (v6) {
        id v8 = v6;
      }
      else {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      }
      id v3 = v8;
    }
    else
    {
      _HKInitializeLogging();
      objc_super v9 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        -[HKClinicalAuthorizationDisplayController _displayReadAuthorizationDateForMode:](v9, v4);
      }
      id v3 = 0;
    }
  }
  else if (!a3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  }
  return v3;
}

- (id)_displayStringForReadAuthorizationDate:(id)a3
{
  return HKLocalizedStringForDateAndTemplateWithFormattingContext(a3, 34, 1);
}

- (id)currentTimeDisplayStringForReadAuthorizationFooter
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v4 = [(HKClinicalAuthorizationDisplayController *)self _displayStringForReadAuthorizationDate:v3];

  return v4;
}

- (id)committedTitleForReadAuthorizationModeFooterWithSelectedMode:(int64_t)a3 formatBlock:(id)a4
{
  v6 = (void (**)(id, void *, int64_t, void *))a4;
  v7 = [(HKClinicalAuthorizationDisplayController *)self _displayReadAuthorizationDateForMode:a3];
  if (v7)
  {
    id v8 = [(HKClinicalAuthorizationDisplayController *)self _displayStringForReadAuthorizationDate:v7];
    objc_super v9 = [(HKClinicalAuthorizationDisplayController *)self source];
    v10 = v6[2](v6, v8, a3, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)currentTimeTitleForReadAuthorizationModeFooterWithSelectedMode:(int64_t)a3 formatBlock:(id)a4
{
  v6 = (void (**)(id, void *, int64_t, void *))a4;
  v7 = [(HKClinicalAuthorizationDisplayController *)self currentTimeDisplayStringForReadAuthorizationFooter];
  id v8 = [(HKClinicalAuthorizationDisplayController *)self source];
  objc_super v9 = v6[2](v6, v7, a3, v8);

  return v9;
}

- (HKSource)source
{
  v2 = [(HKClinicalAuthorizationDisplayController *)self authorizationController];
  id v3 = [v2 source];

  return (HKSource *)v3;
}

- (HKClinicalSourceAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void).cxx_destruct
{
}

- (void)_displayReadAuthorizationDateForMode:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [a2 fetchError];
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_ERROR, "Missing date for read authorization: last authorization controller fetch failed with error %{public}@", (uint8_t *)&v5, 0xCu);
}

@end