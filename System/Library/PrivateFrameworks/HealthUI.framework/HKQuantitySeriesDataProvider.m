@interface HKQuantitySeriesDataProvider
- (BOOL)hasSubsamplesToRemove;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthStore;
- (HKQuantitySample)parentSample;
- (HKQuantitySeriesDataProvider)initWithSample:(id)a3 healthStore:(id)a4;
- (HKQuantitySeriesDataProviderDelegate)delegate;
- (HKQuantitySeriesSampleEditor)editor;
- (HKUnitPreferenceController)unitController;
- (NSMutableArray)quantities;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)textForQuantity:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)commitDeletionsIfNeeded;
- (void)deleteQuantity:(id)a3;
- (void)queryForSubsamples:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayTypeController:(id)a3;
- (void)setEditor:(id)a3;
- (void)setHasSubsamplesToRemove:(BOOL)a3;
- (void)setHealthStore:(id)a3;
- (void)setParentSample:(id)a3;
- (void)setQuantities:(id)a3;
- (void)setUnitController:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation HKQuantitySeriesDataProvider

- (HKQuantitySeriesDataProvider)initWithSample:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"Sample type is not an HKQuantitySample" format:@"Must be an HKQuantitySample to use the quantity series data provider"];
  }
  v13.receiver = self;
  v13.super_class = (Class)HKQuantitySeriesDataProvider;
  v8 = [(HKQuantitySeriesDataProvider *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(HKQuantitySeriesDataProvider *)v8 setParentSample:v6];
    [(HKQuantitySeriesDataProvider *)v9 setHealthStore:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(HKQuantitySeriesDataProvider *)v9 setQuantities:v10];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F2B3A0]) initWithHealthStore:v9->_healthStore quantitySample:v9->_parentSample];
    [(HKQuantitySeriesDataProvider *)v9 setEditor:v11];

    [(HKQuantitySeriesDataProvider *)v9 setHasSubsamplesToRemove:0];
  }

  return v9;
}

- (id)textForQuantity:(id)a3
{
  id v4 = a3;
  v5 = [(HKQuantitySeriesDataProvider *)self displayTypeController];
  id v6 = [(HKQuantitySeriesDataProvider *)self parentSample];
  id v7 = [v6 sampleType];
  v8 = [v5 displayTypeForObjectType:v7];

  v9 = [(HKQuantitySeriesDataProvider *)self unitController];
  id v10 = [v9 unitForDisplayType:v8];

  v11 = [v4 quantity];

  [v11 doubleValueForUnit:v10];
  double v13 = v12;

  v14 = [v8 presentation];
  v15 = [NSNumber numberWithDouble:v13];
  v16 = [v14 adjustedValueForDaemonValue:v15];

  v17 = [(HKQuantitySeriesDataProvider *)self unitController];
  v18 = HKFormattedStringFromValueForContext(v16, v8, v17, 0, 0, 1);

  v19 = [(HKQuantitySeriesDataProvider *)self unitController];
  char v20 = HKFormatterIncludesUnitForDisplayTypeInContext(v8, 1, v19);

  if (v20)
  {
    id v21 = v18;
  }
  else
  {
    v22 = [(HKQuantitySeriesDataProvider *)self unitController];
    v23 = [v22 localizedDisplayNameForDisplayType:v8 value:v16];

    if ([v8 displayTypeIdentifier] == 2)
    {
      v24 = [MEMORY[0x1E4F2B618] footUnit];
      int v25 = [v10 isEqual:v24];

      if (v25)
      {

        v23 = &stru_1F3B9CF20;
      }
    }
    HKFormatValueAndUnit(v18, v23);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v21;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[HKQuantitySeriesTableViewCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  id v10 = [(HKQuantitySeriesDataProvider *)self quantities];
  uint64_t v11 = [v6 row];

  double v12 = [v10 objectAtIndex:v11];

  double v13 = [(HKQuantitySeriesDataProvider *)self textForQuantity:v12];
  v14 = [v9 textLabel];
  [v14 setText:v13];

  v15 = HKDateFormatterFromTemplate(32);
  v16 = [v12 dateInterval];
  v17 = [v16 startDate];
  v18 = [v15 stringFromDate:v17];
  v19 = [v9 detailTextLabel];
  [v19 setText:v18];

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(HKQuantitySeriesDataProvider *)self quantities];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v8 = a5;
    id v9 = a3;
    id v10 = [(HKQuantitySeriesDataProvider *)self quantities];
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v8, "row"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    [(HKQuantitySeriesDataProvider *)self deleteQuantity:v13];
    uint64_t v11 = [(HKQuantitySeriesDataProvider *)self quantities];
    uint64_t v12 = [v8 row];

    [v11 removeObjectAtIndex:v12];
    [v9 reloadData];
  }
}

- (void)queryForSubsamples:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKQuantitySeriesDataProvider *)self parentSample];
  id v6 = [v5 sampleType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"Sample type is not an HKQuantitySample" format:@"Must be an HKQuantitySample to use the quantity series data provider"];
  }
  id v8 = [(HKQuantitySeriesDataProvider *)self parentSample];
  id v9 = [v8 sampleType];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = (void *)MEMORY[0x1E4F2B3C0];
  uint64_t v12 = [(HKQuantitySeriesDataProvider *)self parentSample];
  id v13 = [v12 UUID];
  v14 = [v11 predicateForObjectWithUUID:v13];

  objc_initWeak(&location, self);
  id v15 = objc_alloc(MEMORY[0x1E4F2B3B0]);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __51__HKQuantitySeriesDataProvider_queryForSubsamples___block_invoke;
  v23 = &unk_1E6D52EF0;
  id v16 = v10;
  id v24 = v16;
  objc_copyWeak(&v26, &location);
  id v17 = v4;
  id v25 = v17;
  v18 = (void *)[v15 initWithQuantityType:v9 predicate:v14 quantityHandler:&v20];
  objc_msgSend(v18, "setIncludeSample:", 0, v20, v21, v22, v23);
  [v18 setOrderByQuantitySampleStartDate:1];
  v19 = [(HKQuantitySeriesDataProvider *)self healthStore];
  [v19 executeQuery:v18];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __51__HKQuantitySeriesDataProvider_queryForSubsamples___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, void *a7)
{
  id v20 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13 && v14)
  {
    id v17 = [[HKQuantityWrapper alloc] initWithQuantity:v13 dateInterval:v14];
    [*(id *)(a1 + 32) addObject:v17];
  }
  if (a6)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setQuantities:v18];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)deleteQuantity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKQuantitySeriesDataProvider *)self editor];
  id v6 = [v4 dateInterval];

  uint64_t v9 = 0;
  [v5 removeQuantityForDateInterval:v6 error:&v9];
  uint64_t v7 = v9;

  [(HKQuantitySeriesDataProvider *)self setHasSubsamplesToRemove:1];
  if (v7)
  {
    id v8 = [(HKQuantitySeriesDataProvider *)self editor];
    [v8 discard];

    [(HKQuantitySeriesDataProvider *)self setHasSubsamplesToRemove:0];
  }
}

- (void)commitDeletionsIfNeeded
{
  if ([(HKQuantitySeriesDataProvider *)self hasSubsamplesToRemove])
  {
    v3 = [(HKQuantitySeriesDataProvider *)self editor];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__HKQuantitySeriesDataProvider_commitDeletionsIfNeeded__block_invoke;
    v4[3] = &unk_1E6D52F18;
    v4[4] = self;
    [v3 commitWithCompletion:v4];
  }
}

void __55__HKQuantitySeriesDataProvider_commitDeletionsIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v15 = v5;
  if (a3)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v6 = (id *)(a1 + 32);
    id v8 = [v7 editor];
    [v8 discard];

    goto LABEL_9;
  }
  if ([v5 count] <= 1)
  {
    [*(id *)(a1 + 32) setParentSample:v15];
    uint64_t v9 = [*(id *)(a1 + 32) delegate];
    [v9 sampleDidChange:v15];

    id v10 = *(void **)(a1 + 32);
LABEL_7:
    id v14 = [v10 delegate];
    [v14 reloadSampleData];
    goto LABEL_8;
  }
  id v10 = *(void **)(a1 + 32);
  if (!v15) {
    goto LABEL_7;
  }
  [v10 setParentSample:v15];
  id v11 = objc_alloc(MEMORY[0x1E4F2B3A0]);
  uint64_t v12 = [*(id *)(a1 + 32) healthStore];
  id v13 = (void *)[v11 initWithHealthStore:v12 quantitySample:v15];
  [*(id *)(a1 + 32) setEditor:v13];

  id v14 = [*(id *)(a1 + 32) delegate];
  [v14 sampleDidChange:v15];
LABEL_8:

  id v6 = (id *)(a1 + 32);
LABEL_9:
  [*v6 setHasSubsamplesToRemove:0];
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (HKQuantitySeriesDataProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKQuantitySample)parentSample
{
  return self->_parentSample;
}

- (void)setParentSample:(id)a3
{
}

- (NSMutableArray)quantities
{
  return self->_quantities;
}

- (void)setQuantities:(id)a3
{
}

- (HKQuantitySeriesSampleEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
}

- (BOOL)hasSubsamplesToRemove
{
  return self->_hasSubsamplesToRemove;
}

- (void)setHasSubsamplesToRemove:(BOOL)a3
{
  self->_hasSubsamplesToRemove = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_quantities, 0);
  objc_storeStrong((id *)&self->_parentSample, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
}

@end