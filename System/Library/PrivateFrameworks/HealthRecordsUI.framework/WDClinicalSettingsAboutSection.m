@interface WDClinicalSettingsAboutSection
- (id)_tableViewPrivacyInfoCell:(id)a3;
- (id)cellForRow:(unint64_t)a3 table:(id)a4;
- (unint64_t)numberOfRows;
- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5;
@end

@implementation WDClinicalSettingsAboutSection

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[WDClinicalSettingsAboutSection _tableViewPrivacyInfoCell:](self, "_tableViewPrivacyInfoCell:", a4, v4);
  }
  return v6;
}

- (id)_tableViewPrivacyInfoCell:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[WDClinicalSettingsViewAnalyticsDataCell defaultReuseIdentifier];
  uint64_t v5 = [v3 dequeueReusableCellWithIdentifier:v4];

  v6 = HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_FOOTER_ABOUT_PRIVACY");
  v7 = [v5 textLabel];
  [v7 setText:v6];

  v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v9 = [v5 textLabel];
  [v9 setTextColor:v8];

  v10 = [v5 textLabel];
  [v10 setTextAlignment:1];

  v11 = [v5 textLabel];
  [v11 setNumberOfLines:0];

  [v5 setAccessoryType:0];
  return v5;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  v6 = (void (**)(id, uint64_t, void))a5;
  v7 = +[HRViewControllerFactory shared];
  id v9 = [v7 makeImproveHealthRecordsPrivacyPresenter];

  v8 = [(HRWDTableViewSection *)self delegate];
  [v9 setPresentingViewController:v8];
  [v9 present];
  v6[2](v6, 1, 0);
}

@end