@interface HKDataMetadataBeatToBeatSection
- (HKDataMetadataBeatToBeatSection)initWithSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
@end

@implementation HKDataMetadataBeatToBeatSection

- (HKDataMetadataBeatToBeatSection)initWithSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKDataMetadataBeatToBeatSection;
  v15 = [(HKDataMetadataBeatToBeatSection *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sample, a3);
    objc_storeStrong((id *)&v16->_healthStore, a4);
    objc_storeStrong((id *)&v16->_displayTypeController, a5);
    objc_storeStrong((id *)&v16->_unitController, a6);
  }

  return v16;
}

- (id)sectionTitle
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"BEAT_TO_BEAT_MEASUREMENTS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v7 = [v4 textLabel];
  [v7 setText:v6];

  [v4 setAccessoryType:1];
  return v4;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [[HKBeatToBeatViewController alloc] initWithHeartbeatSeriesSample:self->_sample healthStore:self->_healthStore displayTypeController:self->_displayTypeController unitController:self->_unitController];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    v7 = [[HKBeatToBeatViewController alloc] initWithHRVSample:self->_sample healthStore:self->_healthStore displayTypeController:self->_displayTypeController unitController:self->_unitController];
  }
  v8 = v7;
  if (v7)
  {
    [v9 pushViewController:v7 animated:v5];
  }
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end