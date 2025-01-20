@interface HKDataMetadataViewAllQuantitySeriesSection
- (HKDataMetadataViewAllQuantitySeriesSection)initWithSample:(id)a3 delegate:(id)a4;
- (HKDataMetadataViewControllerDelegate)delegate;
- (HKSample)sample;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)reloadMetaDataVC;
- (unint64_t)numberOfRowsInSection;
- (void)reloadSampleData;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setReloadMetaDataVC:(id)a3;
- (void)setSample:(id)a3;
@end

@implementation HKDataMetadataViewAllQuantitySeriesSection

- (HKDataMetadataViewAllQuantitySeriesSection)initWithSample:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"QUANTITY_SERIES_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v13.receiver = self;
  v13.super_class = (Class)HKDataMetadataViewAllQuantitySeriesSection;
  v10 = [(HKDataMetadataSimpleSection *)&v13 initWithTitle:v9];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HKDataMetadataViewAllQuantitySeriesSection *)v10 setSample:v6],
        [(HKDataMetadataViewAllQuantitySeriesSection *)v10 setDelegate:v7],
        [v6 count] >= 2))
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v4 = [a4 dequeueReusableCellWithIdentifier:@"viewAllQuantityCell"];
  if (!v4) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"viewAllQuantityCell"];
  }
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"VIEW_ALL_QUANTITY_SERIES_BUTTON" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v7 = [v4 textLabel];
  [v7 setText:v6];

  [v4 setAccessoryType:1];
  [v4 setSelectionStyle:3];
  return v4;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  v16 = objc_alloc_init(HKQuantitySeriesViewController);
  id v7 = [HKQuantitySeriesDataProvider alloc];
  v8 = [(HKDataMetadataViewAllQuantitySeriesSection *)self sample];
  v9 = [(HKDataMetadataViewAllQuantitySeriesSection *)self delegate];
  v10 = [v9 healthStore];
  v11 = [(HKQuantitySeriesDataProvider *)v7 initWithSample:v8 healthStore:v10];

  v12 = [(HKDataMetadataViewAllQuantitySeriesSection *)self delegate];
  objc_super v13 = [v12 unitController];
  [(HKQuantitySeriesDataProvider *)v11 setUnitController:v13];

  v14 = [(HKDataMetadataViewAllQuantitySeriesSection *)self delegate];
  v15 = [v14 displayTypeController];
  [(HKQuantitySeriesDataProvider *)v11 setDisplayTypeController:v15];

  [(HKQuantitySeriesDataProvider *)v11 setDelegate:self];
  [(HKQuantitySeriesViewController *)v16 setDataProvider:v11];
  [v6 pushViewController:v16 animated:1];
}

- (void)reloadSampleData
{
  v4 = [(HKDataMetadataViewAllQuantitySeriesSection *)self reloadMetaDataVC];
  v3 = [(HKDataMetadataViewAllQuantitySeriesSection *)self sample];
  v4[2](v4, v3);
}

- (id)reloadMetaDataVC
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setReloadMetaDataVC:(id)a3
{
}

- (HKSample)sample
{
  return (HKSample *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSample:(id)a3
{
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKDataMetadataViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong(&self->_reloadMetaDataVC, 0);
}

@end