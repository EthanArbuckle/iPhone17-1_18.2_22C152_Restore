@interface WDAtrialFibrillationEventListDataProvider
- (double)customCellHeight;
- (double)customEstimatedCellHeight;
- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5;
- (id)sampleTypes;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (int64_t)cellStyle;
@end

@implementation WDAtrialFibrillationEventListDataProvider

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A158] atrialFibrillationEventType];
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
  id v8 = a4;
  id v9 = a3;
  v10 = [a5 dequeueReusableCellWithIdentifier:@"CellIdentifier"];
  if (!v10) {
    v10 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:3 reuseIdentifier:@"CellIdentifier"];
  }
  v11 = WDBundle();
  v12 = [v11 localizedStringForKey:@"ATRIAL_FIBRILLATION_EVENT_CELL_LABEL" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Antimony"];
  v13 = [v10 textLabel];
  [v13 setText:v12];

  v14 = [v9 endDate];

  v15 = HKLocalizedStringForDateAndTemplate();
  v16 = [v10 detailTextLabel];
  [v16 setText:v15];

  v17 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v18 = [v10 detailTextLabel];
  [v18 setTextColor:v17];

  BOOL v19 = [(WDSampleListDataProvider *)self hasDetailViewController];
  if (v19) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 0;
  }
  [v10 setAccessoryType:v19];
  [v10 setSelectionStyle:v20];
  v21 = NSString;
  uint64_t v22 = [v8 item];

  v23 = objc_msgSend(v21, "stringWithFormat:", @"AFibEvent.%ld", v22);
  v24 = [NSString healthAccessibilityIdentifier:2 suffix:v23];
  [v10 setAccessibilityIdentifier:v24];

  return v10;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(WDSampleListDataProvider *)self hasDetailViewController])
  {
    v5 = -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", [v4 row], objc_msgSend(v4, "section"));
    v6 = [[WDAtrialFibrillationEventMetadataViewController alloc] initWithEvent:v5 delegate:self];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end