@interface WDElectrocardiogramInternalSettingsViewController
- (BOOL)isDeletingSamples;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKDateCache)dateCache;
- (HKHealthStore)healthStore;
- (HKHeartRhythmAvailability)heartRhythmAvailability;
- (HKHostingAreaLayoutView)algorithmVersionPickerInputView;
- (HKHostingAreaLayoutView)pickerInputView;
- (HKKeyValueDomain)keyValueDomain;
- (HRElectrocardiogramOnboardingManager)onboardingManager;
- (NPSManager)syncManager;
- (NSArray)allAlgorithmVersions;
- (NSArray)allDemoResults;
- (NSArray)demoResultKeys;
- (NSArray)keyValueDomainContentKeys;
- (NSDictionary)keyValueDomainContent;
- (UIPickerView)algorithmVersionPicker;
- (UIPickerView)resultPicker;
- (WDElectrocardiogramInternalSettingsViewController)initWithHealthStore:(id)a3 dateCache:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_buttonCellForTableView:(id)a3;
- (id)_onboardingCompletedAlgorithmVersion;
- (id)_styleSubtitleCellForTableView:(id)a3;
- (id)_styleValue1CellForTableView:(id)a3 inputView:(id)a4;
- (id)displayableDescriptionFromValue:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_overrideAlgorithmVersion;
- (void)_presentAvailabilityInternalSettingsViewController;
- (void)_presentOnboardingManagerWithOnboardingType:(int64_t)a3;
- (void)_resetOnboarding;
- (void)_saveOverrideAlgorithmVersionIfNeeded:(int64_t)a3;
- (void)_startFullOnboarding;
- (void)_startUpgrade;
- (void)clearCellIndexNumberLabels;
- (void)dealloc;
- (void)didCompleteOnboarding;
- (void)didDismissOnboarding;
- (void)didTapOnElectrocardiogram:(id)a3;
- (void)heartRhythmAvailabilityDidUpdate;
- (void)keyboardDidDismiss:(id)a3;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)reloadKeyValueDomainContent;
- (void)setAlgorithmVersionPicker:(id)a3;
- (void)setAlgorithmVersionPickerInputView:(id)a3;
- (void)setDeletingSamples:(BOOL)a3;
- (void)setDemoResultKeys:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setKeyValueDomainContent:(id)a3;
- (void)setKeyValueDomainContentKeys:(id)a3;
- (void)setOnboardingManager:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateCellIndexNumberLabels;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation WDElectrocardiogramInternalSettingsViewController

- (WDElectrocardiogramInternalSettingsViewController)initWithHealthStore:(id)a3 dateCache:(id)a4
{
  v24[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  v9 = [(WDElectrocardiogramInternalSettingsViewController *)&v23 initWithStyle:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateCache, a4);
    objc_storeStrong((id *)&v10->_healthStore, a3);
    uint64_t v11 = [MEMORY[0x263F0A470] heartRhythmDefaultsDomainWithHealthStore:v7];
    keyValueDomain = v10->_keyValueDomain;
    v10->_keyValueDomain = (HKKeyValueDomain *)v11;

    v13 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    syncManager = v10->_syncManager;
    v10->_syncManager = v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
    uint64_t v16 = objc_msgSend(v15, "hk_demoResultKeys");
    demoResultKeys = v10->_demoResultKeys;
    v10->_demoResultKeys = (NSArray *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x263F0A448]) initWithHealthStore:v7];
    heartRhythmAvailability = v10->_heartRhythmAvailability;
    v10->_heartRhythmAvailability = (HKHeartRhythmAvailability *)v18;

    v24[0] = @"No override";
    v24[1] = @"ECG 1";
    v24[2] = @"ECG 2";
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
    allAlgorithmVersions = v10->_allAlgorithmVersions;
    v10->_allAlgorithmVersions = (NSArray *)v20;

    [(HKHeartRhythmAvailability *)v10->_heartRhythmAvailability addHeartRhythmAvailabilityObserver:v10];
  }

  return v10;
}

- (void)dealloc
{
  [(HKHeartRhythmAvailability *)self->_heartRhythmAvailability removeHeartRhythmAvailabilityObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  [(WDElectrocardiogramInternalSettingsViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  [(HKTableViewController *)&v14 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F1C858]);
  [(WDElectrocardiogramInternalSettingsViewController *)self setAlgorithmVersionPicker:v3];

  v4 = [(WDElectrocardiogramInternalSettingsViewController *)self algorithmVersionPicker];
  [v4 setDataSource:self];

  v5 = [(WDElectrocardiogramInternalSettingsViewController *)self algorithmVersionPicker];
  [v5 setDelegate:self];

  v6 = [(WDElectrocardiogramInternalSettingsViewController *)self algorithmVersionPicker];
  objc_msgSend(v6, "selectRow:inComponent:animated:", -[WDElectrocardiogramInternalSettingsViewController _overrideAlgorithmVersion](self, "_overrideAlgorithmVersion"), 0, 0);

  id v7 = (void *)MEMORY[0x263F467A8];
  id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self algorithmVersionPicker];
  v9 = [v7 viewHostingView:v8];
  [(WDElectrocardiogramInternalSettingsViewController *)self setAlgorithmVersionPickerInputView:v9];

  v10 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
  [v10 setKeyboardDismissMode:1];

  uint64_t v11 = [(WDElectrocardiogramInternalSettingsViewController *)self editButtonItem];
  v12 = [(WDElectrocardiogramInternalSettingsViewController *)self navigationItem];
  [v12 setRightBarButtonItem:v11];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel_keyboardDidDismiss_ name:*MEMORY[0x263F1D480] object:0];

  [(WDElectrocardiogramInternalSettingsViewController *)self reloadKeyValueDomainContent];
}

- (void)reloadKeyValueDomainContent
{
  objc_initWeak(&location, self);
  id v3 = [(WDElectrocardiogramInternalSettingsViewController *)self keyValueDomain];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke;
  v4[3] = &unk_26458EB00;
  objc_copyWeak(&v5, &location);
  [v3 allValuesWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke_2;
  v5[3] = &unk_26458DD60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allKeys];
  id v3 = objc_msgSend(v2, "hk_filter:", &__block_literal_global_9);
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setKeyValueDomainContentKeys:v4];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = objc_loadWeakRetained(v5);
  [v8 setKeyValueDomainContent:v7];

  id v11 = objc_loadWeakRetained(v5);
  v9 = [v11 tableView];
  v10 = [MEMORY[0x263F088D0] indexSetWithIndex:4];
  [v9 reloadSections:v10 withRowAnimation:100];
}

uint64_t __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"HKElectrocardiogram"];
}

- (void)setDemoResultKeys:(id)a3
{
  objc_storeStrong((id *)&self->_demoResultKeys, a3);
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  objc_msgSend(v6, "hk_setDemoResultKeys:", v5);

  id v9 = [(WDElectrocardiogramInternalSettingsViewController *)self syncManager];
  uint64_t v7 = *MEMORY[0x263F0AD78];
  id v8 = [MEMORY[0x263EFFA08] setWithObject:@"DemoResultKeys"];

  [v9 synchronizeUserDefaultsDomain:v7 keys:v8];
}

- (UIPickerView)resultPicker
{
  resultPicker = self->_resultPicker;
  if (!resultPicker)
  {
    id v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x263F1C858]);
    id v5 = self->_resultPicker;
    self->_resultPicker = v4;

    [(UIPickerView *)self->_resultPicker setDataSource:self];
    [(UIPickerView *)self->_resultPicker setDelegate:self];
    resultPicker = self->_resultPicker;
  }

  return resultPicker;
}

- (HKHostingAreaLayoutView)pickerInputView
{
  pickerInputView = self->_pickerInputView;
  if (!pickerInputView)
  {
    id v4 = (void *)MEMORY[0x263F467A8];
    id v5 = [(WDElectrocardiogramInternalSettingsViewController *)self resultPicker];
    id v6 = [v4 viewHostingView:v5];
    uint64_t v7 = self->_pickerInputView;
    self->_pickerInputView = v6;

    pickerInputView = self->_pickerInputView;
  }

  return pickerInputView;
}

- (NSArray)allDemoResults
{
  allDemoResults = self->_allDemoResults;
  if (!allDemoResults)
  {
    self->_allDemoResults = (NSArray *)&unk_26D2FD5A8;

    allDemoResults = self->_allDemoResults;
  }

  return allDemoResults;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  [(WDElectrocardiogramInternalSettingsViewController *)&v6 setEditing:a3 animated:a4];
  if (!a3) {
    [(WDElectrocardiogramInternalSettingsViewController *)self updateCellIndexNumberLabels];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = 1;
  switch(a4)
  {
    case 0:
      id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
      int64_t v7 = [v8 count] + 1;

      break;
    case 2:
    case 3:
      int64_t v7 = 2;
      break;
    case 4:
      id v9 = [(WDElectrocardiogramInternalSettingsViewController *)self keyValueDomainContentKeys];
      unint64_t v10 = [v9 count];

      if (v10 <= 1) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = v10;
      }
      break;
    default:
      break;
  }

  return v7;
}

- (id)_buttonCellForTableView:(id)a3
{
  id v3 = [a3 dequeueReusableCellWithIdentifier:@"ButtonCell"];
  if (!v3)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"ButtonCell"];
    id v4 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
    id v5 = [v3 textLabel];
    [v5 setTextColor:v4];
  }

  return v3;
}

- (id)_styleValue1CellForTableView:(id)a3 inputView:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dequeueReusableCellWithIdentifier:@"AlgorithmVersionReuseIdentifier"];
  if (!v6)
  {
    id v6 = [[WDProfileTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"AlgorithmVersionReuseIdentifier"];
    [(WDProfileTableViewCell *)v6 setInputView:v5];
    int64_t v7 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
    id v8 = [(WDProfileTableViewCell *)v6 displayNameLabel];
    [v8 setTextColor:v7];
  }

  return v6;
}

- (id)_styleSubtitleCellForTableView:(id)a3
{
  id v3 = [a3 dequeueReusableCellWithIdentifier:@"SubtitleCellStyleReuseIdentifier"];
  if (!v3)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:3 reuseIdentifier:@"SubtitleCellStyleReuseIdentifier"];
    id v4 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
    id v5 = [v3 textLabel];
    [v5 setTextColor:v4];

    id v6 = [v3 textLabel];
    int64_t v7 = [v6 font];
    id v8 = [v3 detailTextLabel];
    [v8 setFont:v7];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  switch([v8 section])
  {
    case 0:
      unint64_t v9 = [v8 row];
      unint64_t v10 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
      unint64_t v11 = [v10 count];

      if (v9 >= v11)
      {
        id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self _buttonCellForTableView:v7];
        uint64_t v18 = [(WDProfileTableViewCell *)v4 textLabel];
        uint64_t v16 = v18;
        v19 = @"Add Result";
        goto LABEL_21;
      }
      id v4 = [v7 dequeueReusableCellWithIdentifier:@"DemoResult"];
      if (!v4)
      {
        id v4 = [[WDProfileTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"DemoResult"];
        v12 = [(WDElectrocardiogramInternalSettingsViewController *)self pickerInputView];
        [(WDProfileTableViewCell *)v4 setInputView:v12];
      }
      v13 = (void *)MEMORY[0x263F08A30];
      objc_super v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "row") + 1);
      v15 = [v13 localizedStringFromNumber:v14 numberStyle:0];
      [(WDProfileTableViewCell *)v4 setDisplayName:v15];

      uint64_t v16 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
      v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
      [(WDProfileTableViewCell *)v4 setDisplayValue:v17];
      goto LABEL_9;
    case 1:
      id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self _buttonCellForTableView:v7];
      uint64_t v18 = [(WDProfileTableViewCell *)v4 textLabel];
      uint64_t v16 = v18;
      v19 = @"Delete All ECG Readings";
      goto LABEL_21;
    case 2:
      if (![v8 row])
      {
        id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self _buttonCellForTableView:v7];
        uint64_t v18 = [(WDProfileTableViewCell *)v4 textLabel];
        uint64_t v16 = v18;
        v19 = @"Reset Onboarding History";
        goto LABEL_21;
      }
      uint64_t v20 = [(WDElectrocardiogramInternalSettingsViewController *)self algorithmVersionPickerInputView];
      id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self _styleValue1CellForTableView:v7 inputView:v20];

      [(WDProfileTableViewCell *)v4 setDisplayName:@"Next Onboarding Override:"];
      uint64_t v16 = [(WDElectrocardiogramInternalSettingsViewController *)self allAlgorithmVersions];
      v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", -[WDElectrocardiogramInternalSettingsViewController _overrideAlgorithmVersion](self, "_overrideAlgorithmVersion"));
      v21 = [(WDProfileTableViewCell *)v4 detailTextLabel];
      [v21 setText:v17];

LABEL_9:
      break;
    case 3:
      uint64_t v22 = [v8 row];
      id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self _buttonCellForTableView:v7];
      uint64_t v18 = [(WDProfileTableViewCell *)v4 textLabel];
      uint64_t v16 = v18;
      if (v22) {
        v19 = @"Start Upgrade";
      }
      else {
        v19 = @"Start Full Onboarding";
      }
      goto LABEL_21;
    case 4:
      id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self _styleSubtitleCellForTableView:v7];
      objc_super v23 = [(WDElectrocardiogramInternalSettingsViewController *)self keyValueDomainContentKeys];
      uint64_t v24 = [v23 count];

      if (v24)
      {
        v25 = [(WDElectrocardiogramInternalSettingsViewController *)self keyValueDomainContentKeys];
        uint64_t v16 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

        v26 = [(WDElectrocardiogramInternalSettingsViewController *)self keyValueDomainContent];
        v27 = [v26 objectForKeyedSubscript:v16];

        v28 = [v16 substringFromIndex:objc_msgSend(@"HKElectrocardiogram", "length")];
        v29 = [(WDProfileTableViewCell *)v4 textLabel];
        [v29 setText:v28];

        v30 = [(WDElectrocardiogramInternalSettingsViewController *)self displayableDescriptionFromValue:v27];
        v31 = [(WDProfileTableViewCell *)v4 detailTextLabel];
        [v31 setText:v30];
      }
      else
      {
        v32 = [(WDProfileTableViewCell *)v4 textLabel];
        [v32 setText:@"N/A"];

LABEL_20:
        uint64_t v18 = [(WDProfileTableViewCell *)v4 detailTextLabel];
        uint64_t v16 = v18;
        v19 = 0;
LABEL_21:
        [v18 setText:v19];
      }
      break;
    case 5:
      id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self _styleValue1CellForTableView:v7 inputView:0];
      [(WDProfileTableViewCell *)v4 setAccessoryType:1];
      [(WDProfileTableViewCell *)v4 setDisplayName:@"Remote Feature Availability"];
      goto LABEL_20;
    default:
      goto LABEL_23;
  }

LABEL_23:

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "section", a3);
  double result = 44.0;
  if (v4 == 4) {
    return 60.0;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "section", a3);
  if (v5 == 4) {
    return 0;
  }
  if (v5 == 1) {
    return ![(WDElectrocardiogramInternalSettingsViewController *)self isDeletingSamples];
  }
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    BOOL v6 = 0;
  }
  else
  {
    unint64_t v7 = [v5 row];
    id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
    BOOL v6 = v7 < [v8 count];
  }
  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = v9;
  if (a4 == 1 && ![v9 section])
  {
    unint64_t v11 = [v10 row];
    v12 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
    unint64_t v13 = [v12 count];

    if (v11 < v13)
    {
      objc_super v14 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
      v15 = (void *)[v14 mutableCopy];

      objc_msgSend(v15, "removeObjectAtIndex:", objc_msgSend(v10, "row"));
      [(WDElectrocardiogramInternalSettingsViewController *)self setDemoResultKeys:v15];
      v17[0] = v10;
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      [v8 deleteRowsAtIndexPaths:v16 withRowAnimation:0];

      [(WDElectrocardiogramInternalSettingsViewController *)self updateCellIndexNumberLabels];
    }
  }
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  if (![v11 section] && !objc_msgSend(v7, "section"))
  {
    id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
    id v9 = (void *)[v8 mutableCopy];

    unint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v11, "row"));
    objc_msgSend(v9, "insertObject:atIndex:", v10, objc_msgSend(v7, "row"));
    [(WDElectrocardiogramInternalSettingsViewController *)self setDemoResultKeys:v9];
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    BOOL v6 = 0;
  }
  else
  {
    unint64_t v7 = [v5 row];
    id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
    BOOL v6 = v7 < [v8 count];
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEditing] & 1) == 0)
  {
    switch([v7 section])
    {
      case 0:
        unint64_t v8 = [v7 row];
        id v9 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
        unint64_t v10 = [v9 count];

        if (v8 >= v10)
        {
          v30 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v34[3] = &unk_26458DB58;
          v34[4] = self;
          id v35 = v7;
          [v30 performBatchUpdates:v34 completion:&__block_literal_global_381];
        }
        else
        {
          uint64_t v11 = [v6 cellForRowAtIndexPath:v7];
          if (v11)
          {
            v12 = (void *)v11;
            unint64_t v13 = [(WDElectrocardiogramInternalSettingsViewController *)self allDemoResults];
            objc_super v14 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
            v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
            uint64_t v16 = [v13 indexOfObject:v15];

            if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_16;
            }
            v17 = [(WDElectrocardiogramInternalSettingsViewController *)self resultPicker];
            goto LABEL_15;
          }
        }
        break;
      case 1:
        uint64_t v18 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
        [v18 endEditing:0];

        v19 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
        [v19 deselectRowAtIndexPath:v7 animated:1];

        if (![(WDElectrocardiogramInternalSettingsViewController *)self isDeletingSamples])
        {
          [(WDElectrocardiogramInternalSettingsViewController *)self setDeletingSamples:1];
          v12 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:@"Delete All ECG Samples" preferredStyle:0];
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
          v33[3] = &unk_26458DFA8;
          v33[4] = self;
          uint64_t v20 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Delete All" style:2 handler:v33];
          [v12 addAction:v20];

          v21 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Cancel" style:1 handler:0];
          [v12 addAction:v21];

          [(WDElectrocardiogramInternalSettingsViewController *)self presentViewController:v12 animated:1 completion:0];
          goto LABEL_17;
        }
        break;
      case 2:
        if ([v7 row])
        {
          if ([v7 row] == 1)
          {
            uint64_t v22 = [v6 cellForRowAtIndexPath:v7];
            if (v22)
            {
              v12 = (void *)v22;
              objc_super v23 = [(WDElectrocardiogramInternalSettingsViewController *)self allAlgorithmVersions];
              uint64_t v24 = [v12 detailTextLabel];
              v25 = [v24 text];
              uint64_t v16 = [v23 indexOfObject:v25];

              if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v17 = [(WDElectrocardiogramInternalSettingsViewController *)self algorithmVersionPicker];
LABEL_15:
                v26 = v17;
                [v17 selectRow:v16 inComponent:0 animated:0];
              }
LABEL_16:
              [v12 becomeFirstResponder];
LABEL_17:
            }
          }
        }
        else
        {
          v31 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
          [v31 endEditing:0];

          v32 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
          [v32 deselectRowAtIndexPath:v7 animated:1];

          [(WDElectrocardiogramInternalSettingsViewController *)self _resetOnboarding];
        }
        break;
      case 3:
        v27 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
        [v27 deselectRowAtIndexPath:v7 animated:1];

        if ([v7 row]) {
          [(WDElectrocardiogramInternalSettingsViewController *)self _startUpgrade];
        }
        else {
          [(WDElectrocardiogramInternalSettingsViewController *)self _startFullOnboarding];
        }
        break;
      case 5:
        v28 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
        [v28 endEditing:0];

        v29 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
        [v29 deselectRowAtIndexPath:v7 animated:1];

        [(WDElectrocardiogramInternalSettingsViewController *)self _presentAvailabilityInternalSettingsViewController];
        break;
      default:
        break;
    }
  }
}

void __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 endEditing:0];

  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];

  uint64_t v4 = [*(id *)(a1 + 32) demoResultKeys];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [*(id *)(a1 + 32) allDemoResults];
  id v7 = [v6 objectAtIndexedSubscript:0];
  [v5 addObject:v7];

  [*(id *)(a1 + 32) setDemoResultKeys:v5];
  unint64_t v8 = [*(id *)(a1 + 32) tableView];
  v10[0] = *(void *)(a1 + 40);
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v8 insertRowsAtIndexPaths:v9 withRowAnimation:100];
}

void __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) healthStore];
  id v3 = [MEMORY[0x263F0A358] electrocardiogramType];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v5[3] = &unk_26458DC48;
  void v5[4] = *(void *)(a1 + 32);
  [v2 deleteAllSamplesWithTypes:v4 sourceBundleIdentifier:0 options:2 completion:v5];
}

void __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
  block[3] = &unk_26458DC98;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeletingSamples:0];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = @"HK Key Value Domain";
  if (a4 != 4) {
    uint64_t v4 = 0;
  }
  if (a4) {
    return v4;
  }
  else {
    return @"Demo Result Order";
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    unint64_t v8 = [(WDElectrocardiogramInternalSettingsViewController *)self heartRhythmAvailability];
    int v9 = [v8 isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion];

    if (v9)
    {
      unint64_t v10 = [(WDElectrocardiogramInternalSettingsViewController *)self heartRhythmAvailability];
      uint64_t v11 = [v10 electrocardiogramOnboardingCompletedVersionNoCache];

      v12 = [(WDElectrocardiogramInternalSettingsViewController *)self _onboardingCompletedAlgorithmVersion];
      unint64_t v13 = [(WDElectrocardiogramInternalSettingsViewController *)self heartRhythmAvailability];
      objc_super v14 = [v13 electrocardiogramOnboardingCountryCode];

      v15 = [(WDElectrocardiogramInternalSettingsViewController *)self heartRhythmAvailability];
      uint64_t v16 = [v15 electrocardiogramOnboardingHistoryType:1];

      v17 = NSString;
      uint64_t v18 = [v16 description];
      [v17 stringWithFormat:@"Completed onboarding for %@ (onboarding = %d) with country code %@.\n\nOnboarding history: %@", v12, v11, v14, v18];
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = @"Onboarding for ECG has not been completed.";
    }
  }
  else if (a4)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = @"Results will repeat indefinitely when the ECG app has Demo Results enabled. Changes will sync to the active paired watch. Quit the ECG app to apply changes or restart result order.";
  }

  return v7;
}

- (id)displayableDescriptionFromValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      if ([v4 isEqual:&stru_26D2EA890]) {
        id v5 = @"(empty string)";
      }
      else {
        id v5 = (__CFString *)v4;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = 0;
        id v6 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:&v15];
        id v7 = v15;
        id v8 = v7;
        if (!v6 || v7)
        {
          uint64_t v11 = [v7 localizedDescription];
          int v9 = (void *)v11;
          v12 = @"(error)";
          if (v11) {
            v12 = (__CFString *)v11;
          }
          unint64_t v10 = v12;
        }
        else
        {
          id v14 = 0;
          int v9 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:&v14];
          id v8 = v14;
          unint64_t v10 = (__CFString *)[[NSString alloc] initWithData:v9 encoding:4];
        }
        id v5 = v10;
      }
      else
      {
        id v5 = [v3 description];
      }
    }
  }
  else
  {
    id v5 = @"(null)";
  }

  return v5;
}

- (void)keyboardDidDismiss:(id)a3
{
  id v4 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
  id v5 = [v4 indexPathForSelectedRow];

  if (v5)
  {
    id v6 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
    id v7 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
    id v8 = [v7 indexPathForSelectedRow];
    [v6 deselectRowAtIndexPath:v8 animated:1];

    id v9 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
    [v9 endEditing:0];
  }
}

- (void)updateCellIndexNumberLabels
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v10 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
          uint64_t v11 = [v10 indexPathForCell:v9];

          v12 = (void *)MEMORY[0x263F08A30];
          unint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "row") + 1);
          id v14 = [v12 localizedStringFromNumber:v13 numberStyle:0];
          [v9 setDisplayName:v14];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)clearCellIndexNumberLabels
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
  id v3 = [v2 visibleCells];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 setDisplayName:0];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(WDElectrocardiogramInternalSettingsViewController *)self resultPicker];

  if (v6 == v5) {
    [(WDElectrocardiogramInternalSettingsViewController *)self allDemoResults];
  }
  else {
  uint64_t v7 = [(WDElectrocardiogramInternalSettingsViewController *)self allAlgorithmVersions];
  }
  int64_t v8 = [v7 count];

  return v8;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self resultPicker];

  if (v8 == v7) {
    [(WDElectrocardiogramInternalSettingsViewController *)self allDemoResults];
  }
  else {
  long long v9 = [(WDElectrocardiogramInternalSettingsViewController *)self allAlgorithmVersions];
  }
  long long v10 = [v9 objectAtIndexedSubscript:a4];

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self resultPicker];

  long long v9 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
  uint64_t v24 = [v9 indexPathForSelectedRow];

  if (v8 == v7)
  {
    long long v11 = v24;
    if (v24)
    {
      uint64_t v10 = [v24 section];
      long long v11 = v24;
      if (!v10)
      {
        long long v18 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
        unint64_t v13 = [v18 cellForRowAtIndexPath:v24];

        if (v13)
        {
          v19 = [(WDElectrocardiogramInternalSettingsViewController *)self allDemoResults];
          uint64_t v20 = [v19 objectAtIndexedSubscript:a4];
          [v13 setDisplayValue:v20];

          v21 = [(WDElectrocardiogramInternalSettingsViewController *)self demoResultKeys];
          long long v15 = (void *)[v21 mutableCopy];

          uint64_t v22 = [(WDElectrocardiogramInternalSettingsViewController *)self allDemoResults];
          objc_super v23 = [v22 objectAtIndexedSubscript:a4];
          objc_msgSend(v15, "setObject:atIndexedSubscript:", v23, objc_msgSend(v24, "row"));

          [(WDElectrocardiogramInternalSettingsViewController *)self setDemoResultKeys:v15];
          goto LABEL_10;
        }
LABEL_11:

        long long v11 = v24;
      }
    }
  }
  else
  {
    long long v11 = v24;
    if (v24)
    {
      uint64_t v10 = [v24 section];
      long long v11 = v24;
      if (v10 == 2)
      {
        long long v12 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
        unint64_t v13 = [v12 cellForRowAtIndexPath:v24];

        if (v13)
        {
          uint64_t v14 = [(WDElectrocardiogramInternalSettingsViewController *)self allAlgorithmVersions];
          long long v15 = [v14 objectAtIndexedSubscript:a4];

          long long v16 = [v13 detailTextLabel];
          [v16 setText:v15];

          [(WDElectrocardiogramInternalSettingsViewController *)self _saveOverrideAlgorithmVersionIfNeeded:a4];
          long long v17 = [(WDElectrocardiogramInternalSettingsViewController *)self tableView];
          [v17 endEditing:0];

LABEL_10:
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
  }

  MEMORY[0x270F9A758](v10, v11);
}

- (void)_presentAvailabilityInternalSettingsViewController
{
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D2FD5C0];
  id v3 = [[WDRemoteFeatureAvailabilityInternalSettingsViewController alloc] initWithConditions:v5];
  uint64_t v4 = [(WDElectrocardiogramInternalSettingsViewController *)self navigationController];
  [v4 pushViewController:v3 animated:1];
}

- (void)_saveOverrideAlgorithmVersionIfNeeded:(int64_t)a3
{
  if (*MEMORY[0x263F0AA58] == a3)
  {
    objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 removeObjectForKey:*MEMORY[0x263F09528]];
  }
  else
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F0A348], "onboardingVersionForKnownAlgorithmVersion:");
    objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:v3];
    [v5 setObject:v4 forKey:*MEMORY[0x263F09528]];
  }
}

- (unint64_t)_overrideAlgorithmVersion
{
  v2 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F09528]];

  unint64_t v4 = objc_msgSend(MEMORY[0x263F0A348], "algorithmVersionForOnboardingVersion:", objc_msgSend(v3, "integerValue"));
  return v4;
}

- (id)_onboardingCompletedAlgorithmVersion
{
  v2 = [(WDElectrocardiogramInternalSettingsViewController *)self heartRhythmAvailability];
  uint64_t v3 = [v2 electrocardiogramOnboardingCompletedVersionNoCache];

  uint64_t v4 = [MEMORY[0x263F0A348] algorithmVersionForOnboardingVersion:v3];
  id v5 = @"N/A";
  if (v4 == 2) {
    id v5 = @"ECG 2";
  }
  if (v4 == 1) {
    return @"ECG 1";
  }
  else {
    return v5;
  }
}

- (void)_startFullOnboarding
{
  uint64_t v3 = [(WDElectrocardiogramInternalSettingsViewController *)self heartRhythmAvailability];
  int v4 = [v3 isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion];

  if (v4)
  {
    id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Cannot Start Full Onboarding" message:@"The ECG feature already has an onboarded completed! Please reset the current onboarding first or choose the upgrade flow." preferredStyle:0];
    id v5 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Ok" style:1 handler:0];
    [v6 addAction:v5];

    [(WDElectrocardiogramInternalSettingsViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(WDElectrocardiogramInternalSettingsViewController *)self _presentOnboardingManagerWithOnboardingType:0];
  }
}

- (void)_startUpgrade
{
  uint64_t v3 = [(WDElectrocardiogramInternalSettingsViewController *)self heartRhythmAvailability];
  char v4 = [v3 isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion];

  if (v4)
  {
    [(WDElectrocardiogramInternalSettingsViewController *)self _presentOnboardingManagerWithOnboardingType:1];
  }
  else
  {
    id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Cannot Start Upgrade", @"Cannot upgrade ECG without a full onboarding already completed before, as there is nothing to upgrade from! Please start a full onboarding instead.", 0 message preferredStyle];
    id v5 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Ok" style:1 handler:0];
    [v6 addAction:v5];

    [(WDElectrocardiogramInternalSettingsViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_presentOnboardingManagerWithOnboardingType:(int64_t)a3
{
  BOOL v5 = a3 != 1;
  id v6 = objc_alloc(MEMORY[0x263F476B8]);
  id v7 = [(WDElectrocardiogramInternalSettingsViewController *)self healthStore];
  id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self dateCache];
  LOBYTE(v12) = 1;
  long long v9 = (void *)[v6 initWithOnboardingType:a3 isFirstTimeOnboarding:v5 healthStore:v7 dateCache:v8 provenance:0 delegate:self isSampleInteractive:v12];
  [(WDElectrocardiogramInternalSettingsViewController *)self setOnboardingManager:v9];

  uint64_t v10 = [(WDElectrocardiogramInternalSettingsViewController *)self onboardingManager];
  id v13 = [v10 onboardingNavigationController];

  [v13 setModalInPresentation:1];
  long long v11 = [(WDElectrocardiogramInternalSettingsViewController *)self navigationController];
  [v11 presentViewController:v13 animated:1 completion:0];
}

- (void)_resetOnboarding
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  uint64_t v3 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    char v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v5 = v12;
    _os_log_impl(&dword_2210D2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting onboarding", buf, 0xCu);
  }
  id v6 = objc_alloc(MEMORY[0x263F0A3B8]);
  uint64_t v7 = *MEMORY[0x263F09740];
  id v8 = [(WDElectrocardiogramInternalSettingsViewController *)self healthStore];
  long long v9 = (void *)[v6 initWithFeatureIdentifier:v7 healthStore:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke;
  v10[3] = &unk_26458DC48;
  v10[4] = self;
  [v9 resetOnboardingWithCompletion:v10];
}

void __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(a1, v6, (uint64_t)v5);
    }
  }
  [*(id *)(a1 + 32) heartRhythmAvailabilityDidUpdate];
}

- (void)didTapOnElectrocardiogram:(id)a3
{
  id v3 = [(WDElectrocardiogramInternalSettingsViewController *)self onboardingManager];
  [v3 dismissOnboarding];
}

- (void)didCompleteOnboarding
{
}

- (void)didDismissOnboarding
{
}

- (void)heartRhythmAvailabilityDidUpdate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__WDElectrocardiogramInternalSettingsViewController_heartRhythmAvailabilityDidUpdate__block_invoke;
  block[3] = &unk_26458DC98;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __85__WDElectrocardiogramInternalSettingsViewController_heartRhythmAvailabilityDidUpdate__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  id v3 = [MEMORY[0x263F088D0] indexSetWithIndex:2];
  [v2 reloadSections:v3 withRowAnimation:100];

  char v4 = *(void **)(a1 + 32);

  return [v4 reloadKeyValueDomainContent];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  char v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __89__WDElectrocardiogramInternalSettingsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  long long v11 = &unk_26458DD38;
  objc_copyWeak(&v12, &location);
  id v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  uint64_t v7 = [(WDElectrocardiogramInternalSettingsViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __89__WDElectrocardiogramInternalSettingsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(WDElectrocardiogramInternalSettingsViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (NSArray)allAlgorithmVersions
{
  return self->_allAlgorithmVersions;
}

- (HKHostingAreaLayoutView)algorithmVersionPickerInputView
{
  return self->_algorithmVersionPickerInputView;
}

- (void)setAlgorithmVersionPickerInputView:(id)a3
{
}

- (UIPickerView)algorithmVersionPicker
{
  return self->_algorithmVersionPicker;
}

- (void)setAlgorithmVersionPicker:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (NSArray)demoResultKeys
{
  return self->_demoResultKeys;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKHeartRhythmAvailability)heartRhythmAvailability
{
  return self->_heartRhythmAvailability;
}

- (HRElectrocardiogramOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (NSArray)keyValueDomainContentKeys
{
  return self->_keyValueDomainContentKeys;
}

- (void)setKeyValueDomainContentKeys:(id)a3
{
}

- (NSDictionary)keyValueDomainContent
{
  return self->_keyValueDomainContent;
}

- (void)setKeyValueDomainContent:(id)a3
{
}

- (BOOL)isDeletingSamples
{
  return self->_deletingSamples;
}

- (void)setDeletingSamples:(BOOL)a3
{
  self->_deletingSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomainContent, 0);
  objc_storeStrong((id *)&self->_keyValueDomainContentKeys, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_heartRhythmAvailability, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_demoResultKeys, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_algorithmVersionPicker, 0);
  objc_storeStrong((id *)&self->_algorithmVersionPickerInputView, 0);
  objc_storeStrong((id *)&self->_allAlgorithmVersions, 0);
  objc_storeStrong((id *)&self->_resultPicker, 0);
  objc_storeStrong((id *)&self->_pickerInputView, 0);

  objc_storeStrong((id *)&self->_allDemoResults, 0);
}

void __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v4 = a2;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_2210D2000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error resetting ECG onboarding: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end