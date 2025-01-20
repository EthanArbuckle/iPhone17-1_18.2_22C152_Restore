@interface WDCardioFitnessEventListDataProvider
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)sampleTypes;
- (id)titleForSection:(unint64_t)a3;
- (int64_t)cellStyle;
@end

@implementation WDCardioFitnessEventListDataProvider

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A158] lowCardioFitnessEventType];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)cellStyle
{
  return 2;
}

- (double)customCellHeight
{
  return *MEMORY[0x263F1D600];
}

- (double)customEstimatedCellHeight
{
  return *MEMORY[0x263F1D600];
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v7 = a3;
  v8 = [a5 dequeueReusableCellWithIdentifier:@"CellIdentifier"];
  if (!v8) {
    v8 = [[WDDataTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"CellIdentifier"];
  }
  v9 = [(WDSampleListDataProvider *)self displayType];
  v10 = objc_msgSend(v9, "hk_enumeratedValueLabels");

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "value"));
  v12 = [v10 objectForKeyedSubscript:v11];
  [(WDDataTableViewCell *)v8 setDisplayValue:v12];

  v13 = [v7 endDate];

  v14 = HKFormattedStringForDate();
  [(WDDataTableViewCell *)v8 setDateString:v14];

  [(WDDataTableViewCell *)v8 setAccessoryType:1];

  return v8;
}

- (id)titleForSection:(unint64_t)a3
{
  v3 = [(WDSampleListDataProvider *)self samples];
  if ([v3 count] < 1)
  {
    v5 = &stru_26D2EA890;
  }
  else
  {
    v4 = [MEMORY[0x263F0A158] lowCardioFitnessEventType];
    objc_msgSend(v4, "hk_localizedName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end