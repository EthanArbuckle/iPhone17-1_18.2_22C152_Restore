@interface SFPrivacyReportTrackerDetailViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (SFPrivacyReportTrackerDetailViewController)initWithTracker:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateHeaderSize;
- (void)_updateHeaderSizeForTraitChanges;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation SFPrivacyReportTrackerDetailViewController

- (SFPrivacyReportTrackerDetailViewController)initWithTracker:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFPrivacyReportTrackerDetailViewController;
  v6 = [(SFPrivacyReportTrackerDetailViewController *)&v12 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tracker, a3);
    v8 = objc_msgSend(MEMORY[0x1E4FB1E20], "safari_traitsAffectingTextAppearance");
    id v9 = (id)[(SFPrivacyReportTrackerDetailViewController *)v7 registerForTraitChanges:v8 withTarget:v7 action:sel__updateHeaderSizeForTraitChanges];

    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)SFPrivacyReportTrackerDetailViewController;
  [(SFPrivacyReportTrackerDetailViewController *)&v37 viewDidLoad];
  v3 = [(WBSKnownTrackingThirdParty *)self->_tracker domain];
  [(SFPrivacyReportTrackerDetailViewController *)self setTitle:v3];

  v4 = [(SFPrivacyReportTrackerDetailViewController *)self tableView];
  double v5 = *MEMORY[0x1E4FB2F28];
  [v4 setRowHeight:*MEMORY[0x1E4FB2F28]];
  v36 = v4;
  [v4 setSectionHeaderHeight:v5];
  [v4 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"websiteListSectionHeaderView"];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v7 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v6 setFont:v7];

  v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v6 setTextColor:v8];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setAdjustsFontForContentSizeCategory:1];
  [v6 setNumberOfLines:0];
  id v9 = NSString;
  v10 = _WBSLocalizedString();
  v11 = [(WBSKnownTrackingThirdParty *)self->_tracker domain];
  objc_super v12 = [(WBSKnownTrackingThirdParty *)self->_tracker ownerName];
  v13 = objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);
  [v6 setText:v13];

  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 320.0, 200.0);
  header = self->_header;
  self->_header = v14;

  [(UIView *)self->_header setPreservesSuperviewLayoutMargins:1];
  [(UIView *)self->_header addSubview:v6];
  v16 = self->_header;
  v17 = [(SFPrivacyReportTrackerDetailViewController *)self tableView];
  [v17 setTableHeaderView:v16];

  v18 = [(UIView *)self->_header layoutMarginsGuide];
  v29 = (void *)MEMORY[0x1E4F28DC8];
  v35 = [v6 leadingAnchor];
  v33 = v18;
  v34 = [v18 leadingAnchor];
  v32 = [v35 constraintEqualToAnchor:v34];
  v38[0] = v32;
  v31 = [v6 topAnchor];
  v30 = [(UIView *)self->_header topAnchor];
  v19 = [v31 constraintEqualToSystemSpacingBelowAnchor:v30 multiplier:4.0];
  v38[1] = v19;
  v20 = [v6 trailingAnchor];
  v21 = [v18 trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v38[2] = v22;
  v23 = [v6 bottomAnchor];
  v24 = [(UIView *)self->_header bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v38[3] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  [v29 activateConstraints:v26];

  _WBSLocalizedString();
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  tableViewHeaderText = self->_tableViewHeaderText;
  self->_tableViewHeaderText = v27;
}

- (void)_updateHeaderSize
{
  [(UIView *)self->_header frame];
  double v4 = v3;
  double v6 = v5;
  header = self->_header;
  v8 = [(SFPrivacyReportTrackerDetailViewController *)self tableView];
  [v8 frame];
  CGFloat Width = CGRectGetWidth(v19);
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](header, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v10, v11);
  double v13 = v12;
  double v15 = v14;

  -[UIView setFrame:](self->_header, "setFrame:", v4, v6, v13, v15);
  v16 = self->_header;
  id v17 = [(SFPrivacyReportTrackerDetailViewController *)self tableView];
  [v17 setTableHeaderView:v16];
}

- (void)_updateHeaderSizeForTraitChanges
{
  dispatch_time_t v3 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SFPrivacyReportTrackerDetailViewController__updateHeaderSizeForTraitChanges__block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __78__SFPrivacyReportTrackerDetailViewController__updateHeaderSizeForTraitChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHeaderSize];
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFPrivacyReportTrackerDetailViewController;
  [(SFPrivacyReportTrackerDetailViewController *)&v3 viewLayoutMarginsDidChange];
  [(SFPrivacyReportTrackerDetailViewController *)self _updateHeaderSize];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(WBSKnownTrackingThirdParty *)self->_tracker firstParties];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"websiteCellIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"websiteCellIdentifier"];
  }
  v8 = [(WBSKnownTrackingThirdParty *)self->_tracker firstParties];
  uint64_t v9 = [v6 row];

  double v10 = [v8 objectAtIndexedSubscript:v9];

  double v11 = [v10 domain];
  double v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return self->_tableViewHeaderText;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeaderText, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_tracker, 0);

  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end