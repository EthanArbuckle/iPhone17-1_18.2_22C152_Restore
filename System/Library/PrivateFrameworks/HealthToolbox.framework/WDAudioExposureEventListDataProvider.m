@interface WDAudioExposureEventListDataProvider
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)sampleTypes;
- (id)titleForSection:(unint64_t)a3;
- (int64_t)cellStyle;
@end

@implementation WDAudioExposureEventListDataProvider

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A158] environmentalAudioExposureEventType];
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
  v9 = [v7 sampleType];
  v10 = [(WDSampleListDataProvider *)self unitController];
  v11 = objc_msgSend(v9, "hk_formatPrimaryMetadataValueForObject:unitPreferencesController:", v7, v10);

  if (!v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v7;
      v13 = [(WDSampleListDataProvider *)self displayTypeController];
      v14 = [v12 sampleType];
      v15 = [v13 displayTypeForObjectType:v14];
      v16 = objc_msgSend(v15, "hk_enumeratedValueLabels");

      v17 = NSNumber;
      uint64_t v18 = [v12 value];

      v19 = [v17 numberWithInteger:v18];
      v11 = [v16 objectForKeyedSubscript:v19];
    }
    else
    {
      v11 = 0;
    }
  }
  [(WDDataTableViewCell *)v8 setDisplayValue:v11];
  [(WDDataTableViewCell *)v8 setAccessoryType:1];
  v20 = [v7 endDate];
  v21 = HKFormattedStringForDate();
  [(WDDataTableViewCell *)v8 setDateString:v21];

  return v8;
}

- (id)titleForSection:(unint64_t)a3
{
  v4 = [(WDSampleListDataProvider *)self samples];
  uint64_t v5 = [v4 count];

  if (v5 < 1)
  {
    v9 = &stru_26D2EA890;
  }
  else
  {
    v6 = [(WDSampleListDataProvider *)self samples];
    id v7 = [v6 sampleAtIndex:0];
    v8 = [v7 sampleType];
    objc_msgSend(v8, "hk_localizedName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end