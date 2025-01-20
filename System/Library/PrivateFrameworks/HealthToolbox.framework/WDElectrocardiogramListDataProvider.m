@interface WDElectrocardiogramListDataProvider
- (BOOL)calendarDateSelectorVisible;
- (BOOL)canEditRowAtIndexPath:(id)a3;
- (BOOL)shouldConsiderRequeryDueToDeletedObjects;
- (WDElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (WDElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)_cellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6;
- (id)_compactCellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6;
- (id)_waveCellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6;
- (id)activeECGAlgorithmVersion;
- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)customLoadingCellForRowAtIndexPath:(id)a3 tableView:(id)a4;
- (id)placeholderCellAtIndexPath:(id)a3 tableView:(id)a4;
- (id)queryDateForSelectedDate:(id)a3;
- (id)sampleTypes;
- (id)textForObject:(id)a3;
- (id)titleForSection:(unint64_t)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (int64_t)cellStyle;
- (int64_t)mode;
- (unint64_t)numberOfObjectsForSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (unint64_t)recentSampleLimit;
- (void)activeECGAlgorithmVersion;
- (void)customizeTableView:(id)a3;
- (void)refineSamplesWithCompletion:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setRecentSampleLimit:(unint64_t)a3;
- (void)setShouldConsiderRequeryDueToDeletedObjects:(BOOL)a3;
- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
@end

@implementation WDElectrocardiogramListDataProvider

- (WDElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramListDataProvider;
  result = [(WDSampleListDataProvider *)&v5 initWithDisplayType:a3 profile:a4];
  if (result) {
    result->_mode = 0;
  }
  return result;
}

- (WDElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)WDElectrocardiogramListDataProvider;
  result = [(WDSampleListDataProvider *)&v7 initWithDisplayType:a3 profile:a4];
  if (result) {
    result->_mode = a5;
  }
  return result;
}

- (id)activeECGAlgorithmVersion
{
  v2 = (void *)MEMORY[0x263F0A348];
  v3 = [(WDSampleListDataProvider *)self profile];
  v4 = [v3 healthStore];
  id v9 = 0;
  objc_super v5 = [v2 versionWithHealthStore:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    _HKInitializeLogging();
    objc_super v7 = *MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      [(WDElectrocardiogramListDataProvider *)(uint64_t)v6 activeECGAlgorithmVersion];
    }
  }

  return v5;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([(WDElectrocardiogramListDataProvider *)self recentSampleLimit]) {
    a5 = [(WDElectrocardiogramListDataProvider *)self recentSampleLimit];
  }
  v18.receiver = self;
  v18.super_class = (Class)WDElectrocardiogramListDataProvider;
  v16 = [(WDSampleListDataProvider *)&v18 createQueryForSampleType:v12 predicate:v13 limit:a5 sortDescriptors:v14 resultsHandler:v15];

  return v16;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([(WDElectrocardiogramListDataProvider *)self recentSampleLimit])
  {
    if ([v15 count] || v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
LABEL_6:
    [(WDElectrocardiogramListDataProvider *)self setShouldConsiderRequeryDueToDeletedObjects:1];
  }
  v16.receiver = self;
  v16.super_class = (Class)WDElectrocardiogramListDataProvider;
  [(WDSampleListDataProvider *)&v16 updateController:v12 didReceiveUpdateForType:v13 samplesAdded:v14 objectsRemoved:v15 recoveringFromError:v7];
}

- (void)refineSamplesWithCompletion:(id)a3
{
  id v13 = (void (**)(id, void *, void))a3;
  if ([(WDElectrocardiogramListDataProvider *)self recentSampleLimit])
  {
    v4 = [(WDSampleListDataProvider *)self samples];
    objc_super v5 = [v4 allSamples];

    id v6 = [MEMORY[0x263EFF9C0] set];
    for (unint64_t i = [(WDElectrocardiogramListDataProvider *)self recentSampleLimit];
          i < [v5 count];
          ++i)
    {
      v8 = [v5 objectAtIndexedSubscript:i];
      id v9 = [v8 UUID];
      [v6 addObject:v9];
    }
    v13[2](v13, v6, 0);
    if ([(WDElectrocardiogramListDataProvider *)self shouldConsiderRequeryDueToDeletedObjects])
    {
      [(WDElectrocardiogramListDataProvider *)self setShouldConsiderRequeryDueToDeletedObjects:0];
      v10 = [(WDSampleListDataProvider *)self samples];
      unint64_t v11 = [v10 count];
      unint64_t v12 = [(WDElectrocardiogramListDataProvider *)self recentSampleLimit];

      if (v11 < v12) {
        [(WDSampleListDataProvider *)self viewControllerWantsDataIncludingDate:0];
      }
    }
  }
  else
  {
    v13[2](v13, 0, 0);
  }
}

- (id)sampleTypes
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(WDSampleListDataProvider *)self displayType];
  v3 = [v2 sampleType];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (unint64_t)numberOfSections
{
  v2 = [(WDSampleListDataProvider *)self samples];
  unint64_t v3 = [v2 count] > 0;

  return v3;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDElectrocardiogramListDataProvider;
  return [(WDSampleListDataProvider *)&v4 numberOfObjectsForSection:a3];
}

- (BOOL)calendarDateSelectorVisible
{
  return 1;
}

- (BOOL)canEditRowAtIndexPath:(id)a3
{
  return 0;
}

- (id)queryDateForSelectedDate:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:-(double)(unint64_t)(*MEMORY[0x263F09218] * *MEMORY[0x263F094F0])];
}

- (id)titleForSection:(unint64_t)a3
{
  return 0;
}

- (id)textForObject:(id)a3
{
  return &stru_26D2EA890;
}

- (int64_t)cellStyle
{
  return 2;
}

- (void)customizeTableView:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramListDataProvider;
  [(WDSampleListDataProvider *)&v6 customizeTableView:v4];
  if (![(WDElectrocardiogramListDataProvider *)self recentSampleLimit]
    && ![(WDElectrocardiogramListDataProvider *)self mode])
  {
    objc_super v5 = [MEMORY[0x263F1C550] clearColor];
    [v4 setSeparatorColor:v5];
  }
}

- (double)customCellHeight
{
  return *MEMORY[0x263F1D600];
}

- (double)customEstimatedCellHeight
{
  [MEMORY[0x263F46748] estimatedHeight];
  return result;
}

- (id)_cellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(WDElectrocardiogramListDataProvider *)self mode]) {
    [(WDElectrocardiogramListDataProvider *)self _compactCellForSample:v12 indexPath:v11 tableView:v10 activeAlgorithmVersion:a6];
  }
  else {
  id v13 = [(WDElectrocardiogramListDataProvider *)self _waveCellForSample:v12 indexPath:v11 tableView:v10 activeAlgorithmVersion:a6];
  }

  return v13;
}

- (id)_waveCellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6
{
  id v10 = a3;
  id v11 = (void *)MEMORY[0x263F46748];
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 defaultReuseIdentifier];
  id v15 = [v12 dequeueReusableCellWithIdentifier:v14];

  if (v15)
  {
    [v15 setSample:v10];
    [v15 setActiveAlgorithmVersion:a6];
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263F46748]);
    v17 = [(WDSampleListDataProvider *)self profile];
    objc_super v18 = [v17 dateCache];
    id v15 = (void *)[v16 initWithSample:v10 dateCache:v18 onboarding:0 activeAlgorithmVersion:a6];
  }
  uint64_t v19 = [v13 row];

  v20 = [(WDSampleListDataProvider *)self samples];
  v21 = [v20 allSamples];
  objc_msgSend(v15, "setBottomPaddingDisabled:", v19 == objc_msgSend(v21, "count") - 1);

  return v15;
}

- (id)_compactCellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263F46748];
  id v10 = a5;
  id v11 = [v9 defaultReuseIdentifier];
  id v12 = [v10 dequeueReusableCellWithIdentifier:v11];

  if (v12)
  {
    if (v8)
    {
LABEL_3:
      uint64_t v13 = [v8 _localizedClassificationWithActiveAlgorithmVersion:a6];
      id v14 = (void *)v13;
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      else {
        id v15 = @" ";
      }
      id v16 = [v12 textLabel];
      [v16 setText:v15];

      v17 = [v8 endDate];
      objc_super v18 = HKLocalizedStringForDateAndTemplate();
      uint64_t v19 = [v12 detailTextLabel];
      [v19 setText:v18];

      goto LABEL_9;
    }
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x263F1CA48]);
    v21 = [MEMORY[0x263F46748] defaultReuseIdentifier];
    id v12 = (void *)[v20 initWithStyle:3 reuseIdentifier:v21];

    if (v8) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v23 = [v22 localizedStringForKey:@"ECG_CARD_LOADING_TEXT" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Cinnamon"];
  v24 = HKConditionallyRedactedHeartRhythmString();
  v25 = [v12 textLabel];
  [v25 setText:v24];

  v17 = [v12 detailTextLabel];
  [v17 setText:&stru_26D2EA890];
LABEL_9:

  v26 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v27 = [v12 detailTextLabel];
  [v27 setTextColor:v26];

  [v12 setAccessoryType:1];

  return v12;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WDElectrocardiogramListDataProvider *)self activeECGAlgorithmVersion];
  id v12 = v11;
  if (v11) {
    -[WDElectrocardiogramListDataProvider _cellForSample:indexPath:tableView:activeAlgorithmVersion:](self, "_cellForSample:indexPath:tableView:activeAlgorithmVersion:", v8, v9, v10, [v11 integerValue]);
  }
  else {
  uint64_t v13 = [(WDElectrocardiogramListDataProvider *)self placeholderCellAtIndexPath:v9 tableView:v10];
  }

  return v13;
}

- (id)placeholderCellAtIndexPath:(id)a3 tableView:(id)a4
{
  return [(WDElectrocardiogramListDataProvider *)self _cellForSample:0 indexPath:a3 tableView:a4 activeAlgorithmVersion:0];
}

- (id)customLoadingCellForRowAtIndexPath:(id)a3 tableView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = +[WDSpinnerTableViewCell defaultReuseIdentifier];
  id v8 = [v5 dequeueReusableCellWithIdentifier:v7 forIndexPath:v6];

  id v9 = [MEMORY[0x263F1C550] clearColor];
  [v8 setBackgroundColor:v9];

  return v8;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  BOOL v7 = [(WDSampleListDataProvider *)self objectAtIndex:v5 forSection:v6];
  id v8 = [WDElectrocardiogramDataMetadataViewController alloc];
  int64_t v9 = [(WDElectrocardiogramListDataProvider *)self mode];
  id v10 = [(WDElectrocardiogramListDataProvider *)self activeECGAlgorithmVersion];
  id v11 = [(WDElectrocardiogramDataMetadataViewController *)v8 initWithSample:v7 delegate:self mode:v9 activeAlgorithmVersion:v10];

  return v11;
}

- (unint64_t)recentSampleLimit
{
  return self->_recentSampleLimit;
}

- (void)setRecentSampleLimit:(unint64_t)a3
{
  self->_recentSampleLimit = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)shouldConsiderRequeryDueToDeletedObjects
{
  return self->_shouldConsiderRequeryDueToDeletedObjects;
}

- (void)setShouldConsiderRequeryDueToDeletedObjects:(BOOL)a3
{
  self->_shouldConsiderRequeryDueToDeletedObjects = a3;
}

- (void)activeECGAlgorithmVersion
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  unint64_t v3 = "-[WDElectrocardiogramListDataProvider activeECGAlgorithmVersion]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "[%{public}s] Failed to fetch algorithm version: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end