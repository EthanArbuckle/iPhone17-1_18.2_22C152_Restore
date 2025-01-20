@interface WDAtrialFibrillationInternalSettingsViewController
- (BOOL)deletingSamples;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKHealthStore)healthStore;
- (HKKeyValueDomain)keyValueDomain;
- (NSArray)sections;
- (WDAtrialFibrillationInternalSettingsViewController)initWithHealthStore:(id)a3;
- (id)_buttonCellForTableView:(id)a3 text:(id)a4;
- (id)_featureAvailabilityStatusString;
- (id)_featureAvailabilityStringForFeatureName:(id)a3 onboardedCountryCodeSupportedState:(id)a4;
- (id)makeFeatureStateViewControllerForFeatureIdentifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addNewSample;
- (void)_deleteAllNotifications;
- (void)_deleteAllNotificationsAndTachograms;
- (void)_fakeNewAnalyzedSample;
- (void)_resetOnboarding;
- (void)_showFeatureStateViewControllerForFeatureIdentifier:(id)a3;
- (void)setDeletingSamples:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WDAtrialFibrillationInternalSettingsViewController

- (WDAtrialFibrillationInternalSettingsViewController)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDAtrialFibrillationInternalSettingsViewController;
  v6 = [(WDAtrialFibrillationInternalSettingsViewController *)&v13 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x263F0A470]);
    uint64_t v9 = [v8 initWithCategory:0 domainName:*MEMORY[0x263F0AD78] healthStore:v5];
    keyValueDomain = v7->_keyValueDomain;
    v7->_keyValueDomain = (HKKeyValueDomain *)v9;

    sections = v7->_sections;
    v7->_sections = (NSArray *)&unk_26D2FD530;
  }
  return v7;
}

- (id)makeFeatureStateViewControllerForFeatureIdentifier:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB68]);

  return v3;
}

- (void)_showFeatureStateViewControllerForFeatureIdentifier:(id)a3
{
  id v4 = [(WDAtrialFibrillationInternalSettingsViewController *)self makeFeatureStateViewControllerForFeatureIdentifier:a3];
  [(WDAtrialFibrillationInternalSettingsViewController *)self showViewController:v4 sender:self];
}

- (id)_buttonCellForTableView:(id)a3 text:(id)a4
{
  id v5 = a4;
  v6 = [a3 dequeueReusableCellWithIdentifier:@"ButtonCell"];
  if (!v6)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"ButtonCell"];
    v7 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
    id v8 = [v6 textLabel];
    [v8 setTextColor:v7];
  }
  uint64_t v9 = [v6 textLabel];
  [v9 setText:v5];

  return v6;
}

- (void)_resetOnboarding
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v5 = v12;
    _os_log_impl(&dword_2210D2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting onboarding", buf, 0xCu);
  }
  id v6 = objc_alloc(MEMORY[0x263F0A3B8]);
  uint64_t v7 = *MEMORY[0x263F09778];
  id v8 = [(WDAtrialFibrillationInternalSettingsViewController *)self healthStore];
  uint64_t v9 = (void *)[v6 initWithFeatureIdentifier:v7 healthStore:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke;
  v10[3] = &unk_26458DC48;
  v10[4] = self;
  [v9 resetOnboardingWithCompletion:v10];
}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(a1, v6);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 32) keyValueDomain];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0AD88]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_288;
  v10[3] = &unk_26458DC48;
  v10[4] = *(void *)(a1 + 32);
  [v7 removeValuesForKeys:v8 completion:v10];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_290;
  v9[3] = &unk_26458DC98;
  v9[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_288(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_288_cold_1(a1, v6);
    }
  }
}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_290(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)_deleteAllNotifications
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v5 = v12;
    _os_log_impl(&dword_2210D2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting all notifications", buf, 0xCu);
  }
  [(WDAtrialFibrillationInternalSettingsViewController *)self setDeletingSamples:1];
  id v6 = [(WDAtrialFibrillationInternalSettingsViewController *)self healthStore];
  uint64_t v7 = [MEMORY[0x263F0A158] atrialFibrillationEventType];
  v10 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke;
  v9[3] = &unk_26458DC48;
  v9[4] = self;
  [v6 deleteAllSamplesWithTypes:v8 sourceBundleIdentifier:0 options:2 completion:v9];
}

void __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_cold_1(a1, v6);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_294;
  block[3] = &unk_26458DC98;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_294(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeletingSamples:0];
}

- (void)_deleteAllNotificationsAndTachograms
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v5 = v13;
    _os_log_impl(&dword_2210D2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting all atrial fibrillation event and tachogram samples", buf, 0xCu);
  }
  id v6 = [MEMORY[0x263F0A158] atrialFibrillationEventType];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x263F0A708] heartbeatSeriesType];
  v11[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  [(WDAtrialFibrillationInternalSettingsViewController *)self setDeletingSamples:1];
  uint64_t v9 = [(WDAtrialFibrillationInternalSettingsViewController *)self healthStore];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke;
  v10[3] = &unk_26458DC48;
  v10[4] = self;
  [v9 deleteAllSamplesWithTypes:v8 sourceBundleIdentifier:0 options:2 completion:v10];
}

void __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_cold_1(a1, v6);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_296;
  block[3] = &unk_26458DC98;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_296(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeletingSamples:0];
}

- (void)_fakeNewAnalyzedSample
{
  id v3 = [(WDAtrialFibrillationInternalSettingsViewController *)self keyValueDomain];
  v2 = [MEMORY[0x263EFF910] date];
  [v3 setDate:v2 forKey:*MEMORY[0x263F0AD88] completion:&__block_literal_global_5];
}

- (void)_addNewSample
{
  id v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 dateByAddingTimeInterval:0.0];
  id v5 = (void *)MEMORY[0x263F0A150];
  id v6 = [MEMORY[0x263F0A158] atrialFibrillationEventType];
  uint64_t v7 = [MEMORY[0x263F0A2D8] localDevice];
  id v8 = [v5 categorySampleWithType:v6 value:0 startDate:v4 endDate:v3 device:v7 metadata:MEMORY[0x263EFFA78]];

  healthStore = self->_healthStore;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __67__WDAtrialFibrillationInternalSettingsViewController__addNewSample__block_invoke;
  v11[3] = &unk_26458E610;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(HKHealthStore *)healthStore saveObject:v10 withCompletion:v11];
}

void __67__WDAtrialFibrillationInternalSettingsViewController__addNewSample__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      id v8 = objc_opt_class();
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = v8;
      v11 = [v9 UUID];
      int v18 = 138543618;
      id v19 = v8;
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_2210D2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Saved AFib event with UUID %{public}@", (uint8_t *)&v18, 0x16u);

LABEL_9:
    }
  }
  else
  {
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x263F09920];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v13)
      {
        uint64_t v7 = v12;
        uint64_t v14 = objc_opt_class();
        id v15 = v14;
        v16 = [v5 localizedDescription];
        int v18 = 138543618;
        id v19 = v14;
        __int16 v20 = 2114;
        v21 = v16;
        _os_log_impl(&dword_2210D2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to save AFib event with error: %{public}@", (uint8_t *)&v18, 0x16u);

        goto LABEL_9;
      }
    }
    else if (v13)
    {
      uint64_t v7 = v12;
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v17 = v19;
      _os_log_impl(&dword_2210D2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to save AFib event", (uint8_t *)&v18, 0xCu);

      goto LABEL_9;
    }
  }
}

- (id)_featureAvailabilityStatusString
{
  id v3 = objc_alloc(MEMORY[0x263F0A3B8]);
  uint64_t v4 = *MEMORY[0x263F09778];
  id v5 = [(WDAtrialFibrillationInternalSettingsViewController *)self healthStore];
  id v6 = (void *)[v3 initWithFeatureIdentifier:v4 healthStore:v5];

  id v32 = 0;
  uint64_t v7 = [v6 onboardedCountryCodeSupportedStateWithError:&v32];
  id v8 = v32;
  id v9 = objc_alloc(MEMORY[0x263F0A3B8]);
  uint64_t v10 = *MEMORY[0x263F09780];
  v11 = [(WDAtrialFibrillationInternalSettingsViewController *)self healthStore];
  id v12 = (void *)[v9 initWithFeatureIdentifier:v10 healthStore:v11];

  id v31 = v8;
  BOOL v13 = [v12 onboardedCountryCodeSupportedStateWithError:&v31];
  id v14 = v31;

  id v15 = objc_alloc(MEMORY[0x263F0A3B8]);
  uint64_t v16 = *MEMORY[0x263F09788];
  id v17 = [(WDAtrialFibrillationInternalSettingsViewController *)self healthStore];
  int v18 = (void *)[v15 initWithFeatureIdentifier:v16 healthStore:v17];

  id v30 = v14;
  id v19 = [v18 onboardedCountryCodeSupportedStateWithError:&v30];
  id v20 = v30;

  if (v20)
  {
    v21 = [NSString stringWithFormat:@"Error determining feature state: %@", v20];
  }
  else
  {
    uint64_t v22 = [(WDAtrialFibrillationInternalSettingsViewController *)self _featureAvailabilityStringForFeatureName:@"IRN (Combined)" onboardedCountryCodeSupportedState:v7];
    v23 = [(WDAtrialFibrillationInternalSettingsViewController *)self _featureAvailabilityStringForFeatureName:@"IRN 1.0" onboardedCountryCodeSupportedState:v13];
    [(WDAtrialFibrillationInternalSettingsViewController *)self _featureAvailabilityStringForFeatureName:@"IRN 2.0" onboardedCountryCodeSupportedState:v19];
    v29 = v12;
    v24 = v13;
    v25 = v6;
    v27 = v26 = v7;
    v21 = [NSString stringWithFormat:@"%@\n%@\n%@", v22, v23, v27];

    uint64_t v7 = v26;
    id v6 = v25;
    BOOL v13 = v24;
    id v12 = v29;
  }

  return v21;
}

- (id)_featureAvailabilityStringForFeatureName:(id)a3 onboardedCountryCodeSupportedState:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    [a4 integerValue];
    NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = NSString;
    id v8 = [v6 lowercaseString];
    id v9 = [v7 stringWithFormat:@"%@ is %@.", v5, v8];
  }
  else
  {
    uint64_t v10 = NSString;
    id v6 = a3;
    id v9 = [v10 stringWithFormat:@"%@: Unknown state.", v6];
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  uint64_t v5 = [v4 integerValue];

  int64_t v6 = 3;
  if (v5 != 1) {
    int64_t v6 = 0;
  }
  if (v5) {
    return v6;
  }
  else {
    return 5;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v7 section]);
  uint64_t v9 = [v8 integerValue];

  if (v9 != 1)
  {
    if (!v9)
    {
      switch([v7 row])
      {
        case 0:
          uint64_t v10 = @"Reset Onboarding";
          goto LABEL_16;
        case 1:
          uint64_t v10 = @"Delete All IRN Samples";
          goto LABEL_16;
        case 2:
          uint64_t v10 = @"Delete All IRN and Tachogram Samples";
          goto LABEL_16;
        case 3:
          uint64_t v10 = @"Analyze New Sample";
          goto LABEL_16;
        case 4:
          uint64_t v10 = @"Add New Sample";
          goto LABEL_16;
        default:
          goto LABEL_5;
      }
    }
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v11 = [v7 row];
  if (v11 == 2)
  {
    uint64_t v10 = @"IRN 2.0 Feature State";
  }
  else if (v11 == 1)
  {
    uint64_t v10 = @"IRN 1.0 Feature State";
  }
  else
  {
    if (v11)
    {
LABEL_9:
      id v12 = (objc_class *)objc_opt_class();
      BOOL v13 = NSStringFromClass(v12);
      id v14 = HKErrorTableViewCell();

      goto LABEL_17;
    }
    uint64_t v10 = @"IRN (Combined) Feature State";
  }
LABEL_16:
  id v14 = [(WDAtrialFibrillationInternalSettingsViewController *)self _buttonCellForTableView:v6 text:v10];
LABEL_17:

  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == 1)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    LOBYTE(v6) = 1;
    switch([v5 row])
    {
      case 0:
      case 4:
        break;
      case 1:
      case 2:
      case 3:
        BOOL v6 = ![(WDAtrialFibrillationInternalSettingsViewController *)self deletingSamples];
        break;
      default:
        LOBYTE(v6) = 0;
        break;
    }
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  id v5 = [(WDAtrialFibrillationInternalSettingsViewController *)self tableView];
  [v5 deselectRowAtIndexPath:v10 animated:1];

  BOOL v6 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v10 section]);
  uint64_t v7 = [v6 integerValue];

  if (v7 == 1)
  {
    uint64_t v8 = [v10 row];
    if (v8 == 2)
    {
      uint64_t v9 = (void *)MEMORY[0x263F09788];
    }
    else if (v8 == 1)
    {
      uint64_t v9 = (void *)MEMORY[0x263F09780];
    }
    else
    {
      if (v8) {
        goto LABEL_12;
      }
      uint64_t v9 = (void *)MEMORY[0x263F09778];
    }
    [(WDAtrialFibrillationInternalSettingsViewController *)self _showFeatureStateViewControllerForFeatureIdentifier:*v9];
  }
  else if (!v7)
  {
    switch([v10 row])
    {
      case 0:
        [(WDAtrialFibrillationInternalSettingsViewController *)self _resetOnboarding];
        break;
      case 1:
        [(WDAtrialFibrillationInternalSettingsViewController *)self _deleteAllNotifications];
        break;
      case 2:
        [(WDAtrialFibrillationInternalSettingsViewController *)self _deleteAllNotificationsAndTachograms];
        break;
      case 3:
        [(WDAtrialFibrillationInternalSettingsViewController *)self _fakeNewAnalyzedSample];
        break;
      case 4:
        [(WDAtrialFibrillationInternalSettingsViewController *)self _addNewSample];
        break;
      default:
        break;
    }
  }
LABEL_12:

  MEMORY[0x270F9A758]();
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 1)
  {
    uint64_t v7 = [(WDAtrialFibrillationInternalSettingsViewController *)self _featureAvailabilityStatusString];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (BOOL)deletingSamples
{
  return self->_deletingSamples;
}

- (void)setDeletingSamples:(BOOL)a3
{
  self->_deletingSamples = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "%{public}@: Error resetting IRN onboarding: %{public}@", v7, v8, v9, v10, v11);
}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_288_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "%{public}@: Error deleting last analyzed sample date: %{public}@", v7, v8, v9, v10, v11);
}

void __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "%{public}@: Error deleting atrial fibrillation event samples: %{public}@", v7, v8, v9, v10, v11);
}

void __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_1(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_2210D2000, v5, v6, "%{public}@: Error deleting atrial fibrillation event and tachogram samples: %{public}@", v7, v8, v9, v10, v11);
}

@end