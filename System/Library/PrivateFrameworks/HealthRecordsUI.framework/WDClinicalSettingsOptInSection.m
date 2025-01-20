@interface WDClinicalSettingsOptInSection
- (BOOL)optIn;
- (id)_optInCellForTableView:(id)a3;
- (id)_viewDataCellForTableView:(id)a3;
- (id)cellForRow:(unint64_t)a3 table:(id)a4;
- (id)titleForHeader;
- (unint64_t)numberOfRows;
- (void)_fetchOptInStatus;
- (void)_handleOptInSwitchChanged:(id)a3;
- (void)_setOptInStatus:(BOOL)a3;
- (void)applicationWillEnterForeground;
- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDClinicalSettingsOptInSection

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDClinicalSettingsOptInSection;
  [(HRWDTableViewSection *)&v4 viewWillAppear:a3];
  [(WDClinicalSettingsOptInSection *)self _fetchOptInStatus];
}

- (void)applicationWillEnterForeground
{
  v3.receiver = self;
  v3.super_class = (Class)WDClinicalSettingsOptInSection;
  [(HRWDTableViewSection *)&v3 applicationWillEnterForeground];
  [(WDClinicalSettingsOptInSection *)self _fetchOptInStatus];
}

- (unint64_t)numberOfRows
{
  return 2;
}

- (id)titleForHeader
{
  return (id)HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_HEADER");
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  if (a3 == 1) {
    [(WDClinicalSettingsOptInSection *)self _viewDataCellForTableView:a4];
  }
  else {
  objc_super v4 = [(WDClinicalSettingsOptInSection *)self _optInCellForTableView:a4];
  }
  return v4;
}

- (id)_viewDataCellForTableView:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[WDClinicalSettingsViewAnalyticsDataCell defaultReuseIdentifier];
  v5 = [v3 dequeueReusableCellWithIdentifier:v4];

  [v5 setViewControllerClass:objc_opt_class()];
  v6 = HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_VIEW_ANALYTICS_DATA");
  v7 = [v5 textLabel];
  [v7 setText:v6];

  v8 = [MEMORY[0x1E4FB1618] labelColor];
  v9 = [v5 textLabel];
  [v9 setTextColor:v8];

  v10 = [v5 textLabel];
  [v10 setTextAlignment:4];

  [v5 setAccessoryType:1];
  return v5;
}

- (id)_optInCellForTableView:(id)a3
{
  objc_super v4 = [a3 dequeueReusableCellWithIdentifier:@"_OptInCell"];
  v5 = HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_SWITCH_TITLE");
  v6 = [v4 textLabel];
  [v6 setText:v5];

  [v4 setSelectionStyle:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  objc_msgSend(v7, "setOn:animated:", -[WDClinicalSettingsOptInSection optIn](self, "optIn"), 0);
  [v7 addTarget:self action:sel__handleOptInSwitchChanged_ forControlEvents:4096];
  [v4 setAccessoryView:v7];

  return v4;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  id v15 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)[v15 viewControllerClass];
    if (v8)
    {
      id v9 = objc_alloc_init(v8);
      if (v9)
      {
        v10 = v9;
        v11 = [(HRWDTableViewSection *)self delegate];
        v12 = [v11 profile];
        v13 = [v12 healthRecordsStore];
        [v10 setHealthRecordsStore:v13];

        v14 = [(HRWDTableViewSection *)self delegate];
        [v14 pushViewController:v10];
      }
    }
  }
  v7[2](v7, 1, 0);
}

- (void)_handleOptInSwitchChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  [(WDClinicalSettingsOptInSection *)self _setOptInStatus:v4];
}

- (void)_fetchOptInStatus
{
  id v3 = [(HRWDTableViewSection *)self delegate];
  uint64_t v4 = [v3 profile];
  v5 = [v4 healthRecordsStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke;
  v6[3] = &unk_1E644AFF8;
  v6[4] = self;
  [v5 fetchUserHasAgreedToHealthRecordsDataSubmissionWithCompletion:v6];
}

void __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  v8 = [MEMORY[0x1E4F28F08] mainQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_331;
  v10[3] = &unk_1E644ADD8;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v9 = v5;
  [v8 addOperationWithBlock:v10];
}

void __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_331(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) BOOLValue];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 reloadTable];
}

- (void)_setOptInStatus:(BOOL)a3
{
  uint64_t v3 = *MEMORY[0x1E4F65850];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke;
  v4[3] = &unk_1E644B020;
  v4[4] = self;
  BOOL v5 = a3;
  [MEMORY[0x1E4F65860] setUserDidAccept:a3 currentAgreement:v3 completion:v4];
}

void __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FB0];
  id v7 = *MEMORY[0x1E4F29FB0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = v6;
      v10 = HKStringFromBool();
      id v11 = HKSensitiveLogItem();
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_1C21A1000, v9, OS_LOG_TYPE_INFO, "%{public}@: Successfully saved opt-in status %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (BOOL)optIn
{
  return self->_optIn;
}

void __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching opt in status: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  __int16 v6 = HKStringFromBool();
  uint64_t v7 = HKSensitiveLogItem();
  int v8 = 138543874;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1C21A1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Error saving opt-in status %@: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end