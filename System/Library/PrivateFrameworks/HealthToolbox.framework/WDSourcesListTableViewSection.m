@interface WDSourcesListTableViewSection
+ (id)detailViewControllerForSourceModel:(id)a3 withProfile:(id)a4;
- (BOOL)shouldHideHeader;
- (HKSourceListDataSource)dataSource;
- (NSString)restorationSourceBundleIdentifier;
- (double)estimatedHeightForRow:(unint64_t)a3;
- (double)heightForRow:(unint64_t)a3;
- (id)detailViewControllerForSourceModel:(id)a3;
- (id)noneCellForTableView:(id)a3;
- (id)noneString;
- (void)dealloc;
- (void)setDataSource:(id)a3;
- (void)setRestorationSourceBundleIdentifier:(id)a3;
- (void)setShouldHideHeader:(BOOL)a3;
- (void)setSourceListDataSource:(id)a3;
@end

@implementation WDSourcesListTableViewSection

- (void)dealloc
{
  [(HKSourceListDataSource *)self->_dataSource unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)WDSourcesListTableViewSection;
  [(WDSourcesListTableViewSection *)&v3 dealloc];
}

- (void)setSourceListDataSource:(id)a3
{
  v5 = (HKSourceListDataSource *)a3;
  dataSource = self->_dataSource;
  v8 = v5;
  if (dataSource != v5)
  {
    [(HKSourceListDataSource *)dataSource unregisterObserver:self];
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(HKSourceListDataSource *)v8 registerObserver:self];
    v7 = [(HKSourceListDataSource *)v8 sources];

    if (v7) {
      [(WDSourcesListTableViewSection *)self dataSourceDidUpdate];
    }
  }
}

- (void)setRestorationSourceBundleIdentifier:(id)a3
{
}

- (double)estimatedHeightForRow:(unint64_t)a3
{
  return *MEMORY[0x263F46380];
}

- (double)heightForRow:(unint64_t)a3
{
  return *MEMORY[0x263F1D600];
}

- (id)noneCellForTableView:(id)a3
{
  v4 = [a3 dequeueReusableCellWithIdentifier:@"WDSourcesListTableViewSectionNoSources"];
  if (!v4) {
    v4 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"WDSourcesListTableViewSectionNoSources"];
  }
  [v4 setAccessoryType:0];
  [v4 setSelectionStyle:0];
  v5 = [(WDSourcesListTableViewSection *)self noneString];
  v6 = [v4 textLabel];
  [v6 setText:v5];

  v7 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v8 = [v4 textLabel];
  [v8 setTextColor:v7];

  v9 = objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  v10 = [v4 textLabel];
  [v10 setFont:v9];

  return v4;
}

- (id)noneString
{
  v2 = WDBundle();
  objc_super v3 = [v2 localizedStringForKey:@"NONE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

  return v3;
}

- (id)detailViewControllerForSourceModel:(id)a3
{
  id v4 = a3;
  v5 = [(WDTableViewSection *)self delegate];
  v6 = [v5 profile];

  v7 = [(id)objc_opt_class() detailViewControllerForSourceModel:v4 withProfile:v6];

  return v7;
}

+ (id)detailViewControllerForSourceModel:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 source];
  if ([v7 _requiresAuthorization])
  {
    if (([v5 installed] & 1) != 0
      || ([v6 healthStore],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 profileIdentifier],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 type],
          v9,
          v8,
          v10 == 3))
    {
      v11 = [v6 healthStore];
      v12 = [v6 healthRecordsStore];
      v13 = (void *)[objc_alloc(MEMORY[0x263F46438]) initWithHealthStore:v11 healthRecordsStore:v12 source:v7 typesRequestedForReading:0];
      v14 = (void *)[objc_alloc(MEMORY[0x263F469B0]) initWithHealthStore:v11 source:v7 typesForSharing:0 typesForReading:0];
      v15 = [[WDAuthorizationSettingsViewController alloc] initWithProfile:v6 style:0];
      v16 = [v5 purposeStrings];
      v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F46360]];
      [(HKAuthorizationSettingsViewController *)v15 setShareDescription:v17];

      v18 = [v5 purposeStrings];
      v19 = [v18 objectForKeyedSubscript:*MEMORY[0x263F46368]];
      [(HKAuthorizationSettingsViewController *)v15 setUpdateDescription:v19];

      v20 = [v5 purposeStrings];
      v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F46358]];
      [(HKAuthorizationSettingsViewController *)v15 setResearchStudyUsageDescription:v21];

      [(HKAuthorizationSettingsViewController *)v15 setSource:v7];
      if ([v13 anyTypeRequested])
      {
        id v22 = objc_alloc(MEMORY[0x263F46428]);
        v23 = [v5 purposeStrings];
        uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x263F46350]];
        v25 = v12;
        v26 = v14;
        v27 = (void *)v24;
        v33 = v25;
        uint64_t v28 = objc_msgSend(v22, "initWithHealthStore:healthRecordsStore:authorizationController:readUsageDescription:source:", v11);

        v14 = v26;
        v29 = (void *)v28;

        v30 = (void *)[objc_alloc(MEMORY[0x263F46430]) initWithContext:v28 style:0];
        if ([v14 anyTypeRequested])
        {
          v31 = (WDSourceMessageViewController *)[objc_alloc(MEMORY[0x263F469B8]) initWithHealthStore:v11 source:v7];
          [(WDSourceMessageViewController *)v31 setClinicalAuthorizationController:v13];
          [(WDSourceMessageViewController *)v31 setClinicalAuthorizationSettingsViewController:v30];
          [(WDSourceMessageViewController *)v31 setHealthDataAuthorizationController:v14];
          [(WDSourceMessageViewController *)v31 setHealthDataAuthorizationSettingsViewController:v15];
        }
        else
        {
          v31 = v30;
        }

        v12 = v33;
      }
      else
      {
        v31 = v15;
      }
    }
    else
    {
      v31 = [[WDSourceMessageViewController alloc] initWithStyle:1 source:v7];
    }
  }
  else
  {
    v31 = objc_alloc_init(WDSourceStoredDataViewController);
    [(WDSourceMessageViewController *)v31 setSource:v7];
    [(WDSourceMessageViewController *)v31 setProfile:v6];
  }

  return v31;
}

- (BOOL)shouldHideHeader
{
  return self->_shouldHideHeader;
}

- (void)setShouldHideHeader:(BOOL)a3
{
  self->_shouldHideHeader = a3;
}

- (HKSourceListDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)restorationSourceBundleIdentifier
{
  return self->_restorationSourceBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorationSourceBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end