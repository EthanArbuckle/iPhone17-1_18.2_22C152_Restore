@interface WDClinicalSettingsViewController
+ (id)tableViewSectionClasses;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WDClinicalSettingsViewController

+ (id)tableViewSectionClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)WDClinicalSettingsViewController;
  [(HRWDTableViewController *)&v13 viewDidLoad];
  v3 = HRLocalizedString(@"CLINICAL_ACCOUNTS_SETTINGS_TITLE");
  [(WDClinicalSettingsViewController *)self setTitle:v3];

  v4 = [(WDClinicalSettingsViewController *)self navigationItem];
  [v4 setLargeTitleDisplayMode:2];

  v5 = objc_alloc_init(WDClinicalSettingsOptInNib);
  [(WDClinicalSettingsOptInNib *)v5 setTextViewDelegate:self];
  v6 = [(WDClinicalSettingsViewController *)self tableView];
  objc_msgSend(v6, "_setSectionContentInset:", 0.0, 16.0, 0.0, 16.0);

  v7 = [(WDClinicalSettingsViewController *)self tableView];
  [v7 _setSectionCornerRadius:10.0];

  v8 = [(WDClinicalSettingsViewController *)self tableView];
  [v8 registerNib:v5 forHeaderFooterViewReuseIdentifier:@"_OptInSectionFooterCell"];

  v9 = [(WDClinicalSettingsViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"_OptInCell"];

  v10 = [(WDClinicalSettingsViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  v12 = +[WDClinicalSettingsViewAnalyticsDataCell defaultReuseIdentifier];
  [v10 registerClass:v11 forCellReuseIdentifier:v12];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDClinicalSettingsViewController;
  [(WDClinicalSettingsViewController *)&v4 viewDidAppear:a3];
  v3 = +[CHRAnalyticsManager shared];
  [v3 postPrivacyInteractionEventWithType:1 context:1 action:0];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"_OptInSectionFooterCell", v4);
  }
  return v6;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  v8 = [v7 scheme];
  int v9 = [v8 isEqualToString:@"prefs"];

  if (!a6 && v9)
  {
    v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v10 openSensitiveURL:v7 withOptions:0];
  }
  return 0;
}

@end