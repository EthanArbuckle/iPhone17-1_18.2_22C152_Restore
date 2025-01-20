@interface HKDataMetadataViewController
- (BOOL)_addSectionIfNonNull:(id)a3;
- (CGSize)_adjustedTableViewSize;
- (HKDataMetadataDeviceSectionRegulatedFeatureInfoProvider)regulatedFeatureInfoProvider;
- (HKDataMetadataViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 delegate:(id)a6;
- (HKDataMetadataViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 regulatedFeatureInfoProvider:(id)a6 delegate:(id)a7;
- (HKDataMetadataViewControllerDelegate)delegate;
- (HKDataMetadataWorkoutRouteSection)workoutRouteSection;
- (HKLocationFetcher)locationFetcher;
- (HKLocationReadings)locationReadings;
- (HKSample)sample;
- (NSArray)subSampleTypes;
- (NSMutableArray)sections;
- (double)cellHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)accessViewControllerForSample:(id)a3 healthStore:(id)a4;
- (id)defaultPredicateForSampleType:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addWorkoutRouteSection;
- (void)_exportButtonAction:(id)a3;
- (void)_fetchRoutesWithSamplesHandler:(id)a3;
- (void)_fetchSubSampleTypes;
- (void)_fetchWorkoutRouteLocations;
- (void)_loadSections;
- (void)_updateSubSampleTypes:(id)a3 error:(id)a4;
- (void)_updateWorkoutRouteSize;
- (void)dealloc;
- (void)finishedAggregateQuery;
- (void)setLocationFetcher:(id)a3;
- (void)setLocationReadings:(id)a3;
- (void)setRegulatedFeatureInfoProvider:(id)a3;
- (void)setSample:(id)a3;
- (void)setSections:(id)a3;
- (void)setWorkoutRouteSection:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HKDataMetadataViewController

- (HKDataMetadataViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 delegate:(id)a6
{
  return [(HKDataMetadataViewController *)self initWithSample:a3 usingInsetStyling:a4 profileName:a5 regulatedFeatureInfoProvider:0 delegate:a6];
}

- (HKDataMetadataViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 regulatedFeatureInfoProvider:(id)a6 delegate:(id)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HKDataMetadataViewController;
  v17 = [(HKTableViewController *)&v31 initWithUsingInsetStyling:v10];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sample, a3);
    v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v20 = [v19 localizedStringForKey:@"DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(HKDataMetadataViewController *)v18 setTitle:v20];

    if (v14)
    {
      v21 = NSString;
      v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v23 = [v22 localizedStringForKey:@"METADATA_TITLE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
      v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v14);
      [(HKDataMetadataViewController *)v18 setTitle:v24];
    }
    subSampleTypes = v18->_subSampleTypes;
    v18->_subSampleTypes = (NSArray *)MEMORY[0x1E4F1CBF0];

    objc_storeStrong((id *)&v18->_regulatedFeatureInfoProvider, a6);
    objc_storeStrong((id *)&v18->_delegate, a7);
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sections = v18->_sections;
    v18->_sections = v26;

    [(HKDataMetadataViewController *)v18 _fetchWorkoutRouteLocations];
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v18 selector:sel__localeOrDisplayTypeChange_ name:*MEMORY[0x1E4F1C370] object:0];

    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v18 selector:sel__localeOrDisplayTypeChange_ name:@"HKDisplayTypeControllerDisplayTypeStringValuesChangedNotification" object:0];
  }
  return v18;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
  [(HKDataMetadataViewController *)self _loadSections];
  id v4 = [(HKDataMetadataViewController *)self tableView];
  [v4 reloadData];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKDataMetadataViewController;
  [(HKDataMetadataViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HKDataMetadataViewController;
  [(HKTableViewController *)&v10 viewDidLoad];
  [(HKDataMetadataViewController *)self _fetchSubSampleTypes];
  [(HKDataMetadataViewController *)self _loadSections];
  v3 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1FBD0);
  objc_super v4 = [(HKDataMetadataViewController *)self tableView];
  [v4 setAccessibilityIdentifier:v3];

  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HKDataMetadataViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E6D55DA8;
  objc_copyWeak(&v8, &location);
  id v6 = (id)[(HKDataMetadataViewController *)self registerForTraitChanges:v5 withHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__HKDataMetadataViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateWorkoutRouteSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKDataMetadataViewController;
  [(HKDataMetadataViewController *)&v6 viewDidAppear:a3];
  if (!self->_sample)
  {
    objc_super v4 = [(HKDataMetadataViewController *)self navigationController];
    id v5 = (id)[v4 popViewControllerAnimated:1];
  }
}

- (BOOL)_addSectionIfNonNull:(id)a3
{
  if (a3) {
    [(NSMutableArray *)self->_sections addObject:a3];
  }
  return a3 != 0;
}

- (void)_loadSections
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_sections removeAllObjects];
  v3 = [(HKDataMetadataViewControllerDelegate *)self->_delegate healthStore];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [(HKDataMetadataViewControllerDelegate *)self->_delegate displayTypeController];
  }
  else
  {
    objc_super v4 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(HKDataMetadataViewControllerDelegate *)self->_delegate unitController];
  }
  else
  {
    id v5 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    objc_super v6 = [(HKDataMetadataViewControllerDelegate *)self->_delegate prependedSectionsForSample:self->_sample];
    v7 = v6;
    if (v6)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v7);
            }
            [(HKDataMetadataViewController *)self _addSectionIfNonNull:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v8);
      }
    }
  }
  v11 = [[HKDataMetadataReportSection alloc] initWithSample:self->_sample healthStore:v3];
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v11];

  v12 = [[HKDataMetadataReportAccessSection alloc] initWithSample:self->_sample healthStore:v3 delegate:self];
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v12];

  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HKDataMetadataViewControllerDelegate *)self->_delegate detailSectionForSample:self->_sample];
  }
  else
  {
    id v13 = [[HKDataMetadataDetailSection alloc] initWithSample:self->_sample displayTypeController:v4 unitController:v5];
  }
  id v14 = v13;
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v13];

  if (objc_opt_respondsToSelector())
  {
    id v15 = [(HKDataMetadataViewControllerDelegate *)self->_delegate deviceSectionForSample:self->_sample];
  }
  else
  {
    id v15 = [[HKDataMetadataDeviceSection alloc] initWithSample:self->_sample regulatedFeatureInfoProvider:self->_regulatedFeatureInfoProvider];
  }
  id v16 = v15;
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v15];

  v17 = [[HKDataMetadataViewAllQuantitySeriesSection alloc] initWithSample:self->_sample delegate:self->_delegate];
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__HKDataMetadataViewController__loadSections__block_invoke;
  v25[3] = &unk_1E6D55DD0;
  objc_copyWeak(&v26, &location);
  [(HKDataMetadataViewAllQuantitySeriesSection *)v17 setReloadMetaDataVC:v25];
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v17];
  v18 = [[HKDataMetadataSubsampleSection alloc] initWithSample:self->_sample workoutActivity:0 subSampleTypes:self->_subSampleTypes showOnlyExertion:0 healthStore:v3 displayTypeController:v4 unitController:v5 subsampleDelegate:self];
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v18];

  v19 = [[HKDataMetadataAudiogramFrequenciesSection alloc] initWithSample:self->_sample leftEar:1 unitController:v5];
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v19];

  v20 = [[HKDataMetadataAudiogramFrequenciesSection alloc] initWithSample:self->_sample leftEar:0 unitController:v5];
  [(HKDataMetadataViewController *)self _addSectionIfNonNull:v20];

  [(HKDataMetadataViewController *)self _addWorkoutRouteSection];
  sections = self->_sections;
  v22 = [(HKSample *)self->_sample hk_additionalMetadataSectionsWithHealthStore:v3 displayTypeController:v4 unitController:v5 subsampleDelegate:self];
  [(NSMutableArray *)sections addObjectsFromArray:v22];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(HKDataMetadataViewControllerDelegate *)self->_delegate shareDocumentUsingSample:self->_sample])
  {
    v23 = [(HKDataMetadataViewController *)self navigationItem];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__exportButtonAction_];
    [v23 setRightBarButtonItem:v24];
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __45__HKDataMetadataViewController__loadSections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__HKDataMetadataViewController__loadSections__block_invoke_2;
  v5[3] = &unk_1E6D527B8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __45__HKDataMetadataViewController__loadSections__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSample:v1];
}

- (void)_exportButtonAction:(id)a3
{
  v19[11] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKDataMetadataViewControllerDelegate *)self->_delegate healthStore];
  id v6 = [(HKSample *)self->_sample dataForSharingWithHealthStore:v5];
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F9F3A8];
    v19[0] = *MEMORY[0x1E4F9F390];
    v19[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F9F3C0];
    v19[2] = *MEMORY[0x1E4F9F3B8];
    v19[3] = v8;
    uint64_t v9 = *MEMORY[0x1E4F9F3C8];
    v19[4] = *MEMORY[0x1E4F9F350];
    v19[5] = v9;
    uint64_t v10 = *MEMORY[0x1E4F9F398];
    v19[6] = *MEMORY[0x1E4F9F340];
    v19[7] = v10;
    uint64_t v11 = *MEMORY[0x1E4F9F3A0];
    v19[8] = *MEMORY[0x1E4F9F3B0];
    v19[9] = v11;
    v19[10] = @"com.apple.Health.ShareExtension";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:11];
    id v13 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v18 = v6;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    id v15 = (void *)[v13 initWithActivityItems:v14 applicationActivities:0];

    id v16 = [v15 popoverPresentationController];
    [v16 setSourceItem:v4];

    [v15 setExcludedActivityTypes:v12];
    v17 = [(HKDataMetadataViewController *)self navigationController];
    [v17 presentViewController:v15 animated:1 completion:0];
  }
}

- (void)_fetchSubSampleTypes
{
  id v3 = [(HKDataMetadataViewControllerDelegate *)self->_delegate healthStore];
  sample = self->_sample;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke;
  v5[3] = &unk_1E6D55408;
  void v5[4] = self;
  [(HKSample *)sample fetchSubSampleTypesWithHealthStore:v3 completion:v5];
}

void __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke_2;
    block[3] = &unk_1E6D51318;
    block[4] = *(void *)(a1 + 32);
    id v8 = v5;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__HKDataMetadataViewController__fetchSubSampleTypes__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSubSampleTypes:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_updateSubSampleTypes:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    objc_storeStrong((id *)&self->_subSampleTypes, a3);
    [(HKDataMetadataViewController *)self _loadSections];
  }
  else if (v8)
  {
    int v10 = objc_msgSend(v8, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FB0];
    v12 = *MEMORY[0x1E4F29FB0];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[HKDataMetadataViewController _updateSubSampleTypes:error:]((uint64_t)v9, v11);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[HKDataMetadataViewController _updateSubSampleTypes:error:]((uint64_t)v9, v11);
    }
  }
}

- (CGSize)_adjustedTableViewSize
{
  id v3 = [(HKDataMetadataViewController *)self tableView];
  [v3 frame];
  double v5 = v4;
  id v6 = [(HKDataMetadataViewController *)self tableView];
  [v6 _marginWidth];
  double v8 = v5 + v7 * -2.0;

  id v9 = [(HKDataMetadataViewController *)self tableView];
  [v9 frame];
  double v11 = v10;

  double v12 = fmax(v8, 0.0);
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_updateWorkoutRouteSize
{
  [(HKDataMetadataViewController *)self _adjustedTableViewSize];
  workoutRouteSection = self->_workoutRouteSection;
  -[HKDataMetadataWorkoutRouteSection setTableViewSize:](workoutRouteSection, "setTableViewSize:");
}

- (void)_addWorkoutRouteSection
{
  if (self->_workoutRouteSection)
  {
    -[HKDataMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:");
  }
  else
  {
    [(HKDataMetadataViewController *)self _adjustedTableViewSize];
    double v5 = -[HKDataMetadataWorkoutRouteSection initWithLocationReadings:tableViewSize:]([HKDataMetadataWorkoutRouteSection alloc], "initWithLocationReadings:tableViewSize:", self->_locationReadings, v3, v4);
    workoutRouteSection = self->_workoutRouteSection;
    self->_workoutRouteSection = v5;

    if ([(HKDataMetadataViewController *)self _addSectionIfNonNull:self->_workoutRouteSection])
    {
      id v7 = [(HKDataMetadataViewController *)self tableView];
      [v7 reloadData];
    }
  }
}

- (void)_fetchWorkoutRouteLocations
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke;
    v3[3] = &unk_1E6D55DF8;
    objc_copyWeak(&v4, &location);
    [(HKDataMetadataViewController *)self _fetchRoutesWithSamplesHandler:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    double v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [WeakRetained sample];
    double v8 = [v7 UUID];
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Finished fetching data for workout %@", buf, 0xCu);
  }
  id v9 = (id *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v9);
  [v10 setLocationReadings:v3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke_346;
  block[3] = &unk_1E6D51C48;
  objc_copyWeak(&v12, v9);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v12);
}

void __59__HKDataMetadataViewController__fetchWorkoutRouteLocations__block_invoke_346(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadSections];
}

- (void)_fetchRoutesWithSamplesHandler:(id)a3
{
  id v4 = a3;
  double v5 = [HKLocationFetcher alloc];
  id v6 = [(HKDataMetadataViewControllerDelegate *)self->_delegate healthStore];
  id v7 = [(HKLocationFetcher *)v5 initWithHealthStore:v6];
  locationFetcher = self->_locationFetcher;
  self->_locationFetcher = v7;

  id v9 = [(HKDataMetadataViewController *)self locationFetcher];
  [v9 fetchLocationsFromWorkout:self->_sample applyThreshold:0 withSamplesHandler:v4];
}

- (void)finishedAggregateQuery
{
  id v2 = [(HKDataMetadataViewController *)self tableView];
  [v2 reloadData];
}

- (id)defaultPredicateForSampleType:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(HKDataMetadataViewControllerDelegate *)self->_delegate defaultPredicateForSampleType:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)viewControllerForSampleType:(id)a3 subSamplePredicate:(id)a4 title:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    double v11 = [(HKDataMetadataViewControllerDelegate *)self->_delegate viewControllerForSampleType:v8 subSamplePredicate:v9 title:v10];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)accessViewControllerForSample:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(HKDataMetadataViewControllerDelegate *)self->_delegate accessViewControllerForSample:v6 healthStore:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sections count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  double v5 = [v4 sectionTitle];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  double v5 = [v4 sectionFooter];

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v4 = [(HKDataMetadataViewController *)self tableView:a3 titleForHeaderInSection:a4];
  if (v4) {
    double v5 = *MEMORY[0x1E4FB2F28];
  }
  else {
    double v5 = 0.5;
  }

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  sections = self->_sections;
  id v6 = a3;
  id v7 = [(NSMutableArray *)sections objectAtIndex:a4];
  id v8 = [v7 sectionFooterViewInTableView:v6];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  int64_t v5 = [v4 numberOfRowsInSection];

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v6 section]);
  uint64_t v9 = [v6 row];

  id v10 = [v8 cellForIndex:v9 tableView:v7];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v6 section]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 row];

  id v8 = [(HKDataMetadataViewController *)self navigationController];
  [v9 selectCellForIndex:v7 navigationController:v8 animated:1];
}

- (double)cellHeight
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __68__HKDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  double v11 = &unk_1E6D522F8;
  objc_copyWeak(&v12, &location);
  int64_t v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  uint64_t v7 = [(HKDataMetadataViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __68__HKDataMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(HKDataMetadataViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (HKSample)sample
{
  return self->_sample;
}

- (NSArray)subSampleTypes
{
  return self->_subSampleTypes;
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (HKLocationFetcher)locationFetcher
{
  return self->_locationFetcher;
}

- (void)setLocationFetcher:(id)a3
{
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
}

- (HKDataMetadataDeviceSectionRegulatedFeatureInfoProvider)regulatedFeatureInfoProvider
{
  return self->_regulatedFeatureInfoProvider;
}

- (void)setRegulatedFeatureInfoProvider:(id)a3
{
}

- (HKDataMetadataWorkoutRouteSection)workoutRouteSection
{
  return self->_workoutRouteSection;
}

- (void)setWorkoutRouteSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutRouteSection, 0);
  objc_storeStrong((id *)&self->_regulatedFeatureInfoProvider, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_locationFetcher, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_subSampleTypes, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

- (void)_updateSubSampleTypes:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_DEBUG, "Error from subsample sample type query: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateSubSampleTypes:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Error from subsample sample type query: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end