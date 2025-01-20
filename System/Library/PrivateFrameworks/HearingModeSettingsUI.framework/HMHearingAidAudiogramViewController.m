@interface HMHearingAidAudiogramViewController
- (HKAudiogramSample)selectedSample;
- (HMHearingAidAudiogramViewController)init;
- (HMHearingAidEnrollmentDelegate)delegate;
- (NSArray)invalidAudiograms;
- (NSArray)validAudiograms;
- (NSLayoutConstraint)contentHeightConstraint;
- (_TtP21HearingModeSettingsUI25HearingFlowControllerType_)flowController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_tableFooterView;
- (id)_tableFooterViewWith:(id)a3;
- (id)addAudiogramViewController;
- (id)getAudiogramSummary:(id)a3;
- (id)getHearingLossLevel:(unint64_t)a3;
- (id)invalidAudiogramFooterLabel;
- (id)listener;
- (id)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateTableFooter;
- (void)addDeviceLisenters;
- (void)audiogramIngestionDidSaveAudiogram:(id)a3;
- (void)insertAudiogram:(id)a3;
- (void)linkButtonTapped;
- (void)mainButtonTapped;
- (void)refreshAudiogramList;
- (void)retrieveAndShowAudiograms;
- (void)setAGListResult;
- (void)setContentHeightConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowController:(id)a3;
- (void)setListener:(id)a3;
- (void)setSelectedSample:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateButtonTray;
- (void)updateForNoValidAudiogram;
- (void)updateTableView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HMHearingAidAudiogramViewController

- (HMHearingAidAudiogramViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Choose a Hearing Test Result" value:&stru_2702152D0 table:0];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"Choose which test result you’d like to use to set up Hearing Assistance." value:&stru_2702152D0 table:0];

  v13.receiver = self;
  v13.super_class = (Class)HMHearingAidAudiogramViewController;
  v7 = [(HMHearingAidAudiogramViewController *)&v13 initWithTitle:v4 detailText:v6 icon:0];
  v8 = v7;
  if (v7)
  {
    v7->_selectedIndex = -1;
    v9 = (UITableView *)objc_alloc_init(MEMORY[0x263F82C78]);
    tableView = v8->_tableView;
    v8->_tableView = v9;

    [(UITableView *)v8->_tableView setDataSource:v8];
    [(UITableView *)v8->_tableView setDelegate:v8];
    [(UITableView *)v8->_tableView setScrollEnabled:0];
    checkedIndexPath = v8->_checkedIndexPath;
    v8->_checkedIndexPath = 0;

    [(UITableView *)v8->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"HMHearingAidAudiogram_Cell"];
  }

  return v8;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HMHearingAidAudiogramViewController;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  [(HMHearingAidAudiogramViewController *)self updateTableView];
  [(HMHearingAidAudiogramViewController *)self updateButtonTray];
  [(HMHearingAidAudiogramViewController *)self retrieveAndShowAudiograms];
  [(HMHearingAidAudiogramViewController *)self addDeviceLisenters];
  v3 = [(OBBaseWelcomeController *)self navigationItem];
  [v3 setRightBarButtonItem:0];

  [(HMHearingAidAudiogramViewController *)self set_shouldInlineButtontray:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMHearingAidAudiogramViewController;
  [(HMHearingAidAudiogramViewController *)&v7 viewWillAppear:a3];
  [(HMHearingAidAudiogramViewController *)self _updateTableFooter];
  [(UITableView *)self->_tableView reloadData];
  [(UITableView *)self->_tableView contentSize];
  double v5 = v4;
  v6 = [(HMHearingAidAudiogramViewController *)self contentHeightConstraint];
  [v6 setConstant:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMHearingAidAudiogramViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(HMHearingAidAudiogramViewController *)self setAGListResult];
  [(HMHearingAidAudiogramViewController *)self refreshAudiogramList];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HMHearingAidAudiogramViewController;
  [(OBBaseWelcomeController *)&v6 viewDidLayoutSubviews];
  [(HMHearingAidAudiogramViewController *)self _updateTableFooter];
  [(UITableView *)self->_tableView layoutIfNeeded];
  [(UITableView *)self->_tableView contentSize];
  double v4 = v3;
  double v5 = [(HMHearingAidAudiogramViewController *)self contentHeightConstraint];
  [v5 setConstant:v4];
}

- (void)retrieveAndShowAudiograms
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v3 = [(HMHearingAidAudiogramViewController *)self validAudiograms];
  double v4 = (NSMutableArray *)[v3 mutableCopy];
  validAudiograms = self->_validAudiograms;
  self->_validAudiograms = v4;

  objc_super v6 = [(HMHearingAidAudiogramViewController *)self invalidAudiograms];
  objc_super v7 = (NSMutableArray *)[v6 mutableCopy];
  invalidAudiograms = self->_invalidAudiograms;
  self->_invalidAudiograms = v7;

  NSLog(&cfstr_HearingAidList.isa);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v9 = self->_validAudiograms;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = [*(id *)(*((void *)&v30 + 1) + 8 * i) description];
        NSLog(&cfstr_HearingAidVali.isa, v12 + i, v15);
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      v12 += i;
    }
    while (v11);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v16 = self->_invalidAudiograms;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = [*(id *)(*((void *)&v26 + 1) + 8 * j) description];
        NSLog(&cfstr_HearingAidInva.isa, v19 + j, v22);
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      v19 += j;
    }
    while (v18);
  }

  if ([(NSMutableArray *)self->_validAudiograms count])
  {
    v23 = [(NSMutableArray *)self->_validAudiograms sortedArrayUsingComparator:&__block_literal_global_0];
    v24 = (NSMutableArray *)[v23 mutableCopy];
    v25 = self->_validAudiograms;
    self->_validAudiograms = v24;
  }
}

uint64_t __64__HMHearingAidAudiogramViewController_retrieveAndShowAudiograms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 startDate];
  objc_super v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  uint64_t v8 = 1;
  if (v7 != -1) {
    uint64_t v8 = -1;
  }
  if (v7) {
    return v8;
  }
  else {
    return 0;
  }
}

- (void)updateTableView
{
  v27[5] = *MEMORY[0x263EF8340];
  double v3 = [(HMHearingAidAudiogramViewController *)self contentView];
  [v3 addSubview:self->_tableView];

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setSeparatorStyle:1];
  id v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(UITableView *)self->_tableView setSeparatorColor:v4];

  [(UITableView *)self->_tableView setSectionHeaderTopPadding:0.0];
  double v5 = [(HMHearingAidAudiogramViewController *)self contentView];
  objc_super v6 = [v5 heightAnchor];
  uint64_t v7 = [v6 constraintEqualToConstant:400.0];
  [(HMHearingAidAudiogramViewController *)self setContentHeightConstraint:v7];

  uint64_t v19 = (void *)MEMORY[0x263F08938];
  long long v26 = [(HMHearingAidAudiogramViewController *)self contentHeightConstraint];
  v27[0] = v26;
  v24 = [(UITableView *)self->_tableView topAnchor];
  v25 = [(HMHearingAidAudiogramViewController *)self contentView];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[1] = v22;
  uint64_t v20 = [(UITableView *)self->_tableView bottomAnchor];
  v21 = [(HMHearingAidAudiogramViewController *)self contentView];
  uint64_t v18 = [v21 bottomAnchor];
  uint64_t v8 = [v20 constraintEqualToAnchor:v18];
  v27[2] = v8;
  v9 = [(UITableView *)self->_tableView leadingAnchor];
  uint64_t v10 = [(HMHearingAidAudiogramViewController *)self contentView];
  uint64_t v11 = [v10 leadingAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  v27[3] = v12;
  uint64_t v13 = [(UITableView *)self->_tableView trailingAnchor];
  v14 = [(HMHearingAidAudiogramViewController *)self contentView];
  v15 = [v14 trailingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v27[4] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:5];
  [v19 activateConstraints:v17];
}

- (void)updateButtonTray
{
  double v3 = [MEMORY[0x263F5B898] boldButton];
  boldButton = self->_boldButton;
  self->_boldButton = v3;

  double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v5 localizedStringForKey:@"Next" value:&stru_2702152D0 table:0];

  [(OBTrayButton *)self->_boldButton setTitle:v11 forState:0];
  [(OBTrayButton *)self->_boldButton addTarget:self action:sel_mainButtonTapped forControlEvents:64];
  [(OBTrayButton *)self->_boldButton setEnabled:0];
  objc_super v6 = [(HMHearingAidAudiogramViewController *)self buttonTray];
  [v6 addButton:self->_boldButton];

  uint64_t v7 = [MEMORY[0x263F5B8D0] linkButton];
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Cancel" value:&stru_2702152D0 table:0];

  [v7 setTitle:v9 forState:0];
  [v7 addTarget:self action:sel_linkButtonTapped forControlEvents:64];
  uint64_t v10 = [(HMHearingAidAudiogramViewController *)self buttonTray];
  [v10 addButton:v7];
}

- (void)updateForNoValidAudiogram
{
  NSLog(&cfstr_HearingAidNoVa.isa, a2);
  double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v3 localizedStringForKey:@"No Usable Test Results" value:&stru_2702152D0 table:0];

  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v5 = [v4 localizedStringForKey:@"None of the hearing tests in the Health app contain enough information to be used to setup Hearing Aid Mode on AirPods." value:&stru_2702152D0 table:0];

  objc_super v6 = [(HMHearingAidAudiogramViewController *)self headerView];
  [v6 setTitle:v8];

  uint64_t v7 = [(HMHearingAidAudiogramViewController *)self headerView];
  [v7 setDetailText:v5];
}

- (void)linkButtonTapped
{
  id v2 = [(HMHearingAidAudiogramViewController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NSLog(&cfstr_HearingAidInde.isa, [v6 section], objc_msgSend(v6, "row"));
  id v8 = [v7 dequeueReusableCellWithIdentifier:@"HMHearingAidAudiogram_Cell" forIndexPath:v6];

  v9 = [v8 textLabel];
  [v9 setNumberOfLines:0];

  uint64_t v10 = [v8 layer];
  [v10 setCornerRadius:10.0];

  id v11 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v11];

  [v8 setSelectionStyle:0];
  id v12 = objc_alloc_init(MEMORY[0x263F08790]);
  [v12 setDateStyle:3];
  [v12 setTimeStyle:0];
  uint64_t v13 = [MEMORY[0x263EFF960] currentLocale];
  [v12 setLocale:v13];

  validAudiograms = self->_validAudiograms;
  uint64_t v15 = [v6 section];

  v16 = [(NSMutableArray *)validAudiograms objectAtIndexedSubscript:v15];
  uint64_t v17 = [v16 startDate];
  uint64_t v18 = [v12 stringFromDate:v17];

  uint64_t v19 = [v8 textLabel];
  uint64_t v20 = [v19 font];
  v21 = [v16 audiogramSelectionDescriptionWithDate:v18 font:v20];
  v22 = [v8 textLabel];
  [v22 setAttributedText:v21];

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v5 localizedStringForKey:@"COMPATIBLE RESULTS IN HEALTH" value:&stru_2702152D0 table:0];
  }
  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v5 = objc_alloc(MEMORY[0x263F82E00]);
    id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 2.22507386e-308;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = *MEMORY[0x263F839B8];
  if (a4) {
    return 8.0;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_validAudiograms count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = (NSIndexPath *)a4;
  NSLog(&cfstr_HearingAidCell.isa, [(NSIndexPath *)v6 section], [(NSIndexPath *)v6 row]);
  if (self->_checkedIndexPath)
  {
    id v7 = objc_msgSend(v12, "cellForRowAtIndexPath:");
    [v7 setAccessoryType:0];
  }
  [(OBTrayButton *)self->_boldButton setEnabled:1];
  self->_selectedIndex = [(NSIndexPath *)v6 section];
  id v8 = [v12 cellForRowAtIndexPath:v6];
  [v8 setAccessoryType:3];
  checkedIndexPath = self->_checkedIndexPath;
  self->_checkedIndexPath = v6;
  uint64_t v10 = v6;

  id v11 = [(NSMutableArray *)self->_validAudiograms objectAtIndexedSubscript:self->_selectedIndex];

  [(HMHearingAidAudiogramViewController *)self setSelectedSample:v11];
}

- (id)getAudiogramSummary:(id)a3
{
  [a3 diagnostic];
  return (id)HKLocalizedStringForHearingLevelClassification();
}

- (id)getHearingLossLevel:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      id v5 = @"No Hearing Loss";
      break;
    case 2uLL:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      id v5 = @"Slight Hearing Loss";
      break;
    case 3uLL:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      id v5 = @"Moderate Hearing Loss";
      break;
    case 4uLL:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      id v5 = @"Severe Hearing Loss";
      break;
    case 5uLL:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      id v5 = @"Profound Hearing Loss";
      break;
    default:
      double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v4 = v3;
      id v5 = @"Unavailable";
      break;
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_2702152D0 table:0];

  return v6;
}

- (id)invalidAudiogramFooterLabel
{
  p_invalidAudiogramFooterLabel = &self->_invalidAudiogramFooterLabel;
  invalidAudiogramFooterLabel = self->_invalidAudiogramFooterLabel;
  if (invalidAudiogramFooterLabel)
  {
    uint64_t v4 = invalidAudiogramFooterLabel;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v4 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(UILabel *)v4 setNumberOfLines:0];
    [(UILabel *)v4 setLineBreakMode:0];
    id v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v4 setFont:v7];

    id v8 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v4 setTextColor:v8];

    v9 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UILabel *)v4 setBackgroundColor:v9];

    uint64_t v10 = NSString;
    id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"%lu other test results were not recent enough or did not have enough data to be used for set up." value:&stru_2702152D0 table:0];
    uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, -[NSMutableArray count](self->_invalidAudiograms, "count"));
    [(UILabel *)v4 setText:v13];

    objc_storeStrong((id *)p_invalidAudiogramFooterLabel, v4);
  }
  return v4;
}

- (void)insertAudiogram:(id)a3
{
  id v4 = a3;
  BOOL v5 = isAudiogramValid(v4);
  id v6 = &OBJC_IVAR___HMHearingAidAudiogramViewController__invalidAudiograms;
  if (v5) {
    id v6 = &OBJC_IVAR___HMHearingAidAudiogramViewController__validAudiograms;
  }
  id v7 = *(id *)((char *)&self->super.super.super.super.super.isa + *v6);
  [v7 addObject:v4];

  [(UITableView *)self->_tableView reloadData];
  [(HMHearingAidAudiogramViewController *)self _updateTableFooter];
}

- (id)_tableFooterView
{
  if ([(NSMutableArray *)self->_invalidAudiograms count])
  {
    double v3 = NSString;
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v5 = [v4 localizedStringForKey:@"%lu other test results were not recent enough or did not have enough data to be used for set up." value:&stru_2702152D0 table:0];
    id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, -[NSMutableArray count](self->_invalidAudiograms, "count"));

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:v6 value:&stru_2702152D0 table:0];
    v9 = [(HMHearingAidAudiogramViewController *)self invalidAudiogramFooterLabel];
    [v9 setText:v8];
  }
  else
  {
    id v6 = [(HMHearingAidAudiogramViewController *)self invalidAudiogramFooterLabel];
    [v6 setText:&stru_2702152D0];
  }

  footerView = self->_footerView;
  if (!footerView)
  {
    id v11 = [(HMHearingAidAudiogramViewController *)self invalidAudiogramFooterLabel];
    [(UITableView *)self->_tableView bounds];
    double v13 = v12;
    LODWORD(v12) = 1112014848;
    LODWORD(v14) = 1148846080;
    objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, 0.0, v12, v14);
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v15, v16);
    uint64_t v17 = [(HMHearingAidAudiogramViewController *)self _tableFooterViewWith:v11];
    uint64_t v18 = self->_footerView;
    self->_footerView = v17;

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)_updateTableFooter
{
  double v3 = [(HMHearingAidAudiogramViewController *)self _tableFooterView];
  [v3 layoutSubviews];

  tableView = self->_tableView;
  id v5 = [(HMHearingAidAudiogramViewController *)self _tableFooterView];
  [(UITableView *)tableView setTableFooterView:v5];
}

- (id)tableView
{
  return self->_tableView;
}

- (HMHearingAidEnrollmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMHearingAidEnrollmentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKAudiogramSample)selectedSample
{
  return self->_selectedSample;
}

- (void)setSelectedSample:(id)a3
{
}

- (id)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (void)setContentHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong(&self->_listener, 0);
  objc_storeStrong((id *)&self->_selectedSample, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invalidAudiogramFooterLabel, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_checkedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_invalidAudiograms, 0);
  objc_storeStrong((id *)&self->_validAudiograms, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
}

- (_TtP21HearingModeSettingsUI25HearingFlowControllerType_)flowController
{
  id v2 = self;
  double v3 = (void *)HMHearingAidAudiogramViewController.flowController.getter();

  return (_TtP21HearingModeSettingsUI25HearingFlowControllerType_ *)v3;
}

- (void)setFlowController:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectRetain();
  id v5 = self;
  objc_setAssociatedObject(v5, &unk_269B2D460, a3, (void *)1);
  swift_endAccess();

  swift_unknownObjectRelease();
}

- (void)audiogramIngestionDidSaveAudiogram:(id)a3
{
}

- (id)addAudiogramViewController
{
  id v3 = objc_allocWithZone(MEMORY[0x263F28EC0]);
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_initWithDelegate_, v4);
  objc_msgSend(v5, sel_setAnalyticsClient_, 2);

  return v5;
}

- (id)_tableFooterViewWith:(id)a3
{
  id v4 = (UILabel *)a3;
  id v5 = self;
  HMHearingAidAudiogramViewController._tableFooterView(with:)(v6, v4);
  id v8 = v7;

  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMHearingAidAudiogramViewController;
  id v4 = self;
  id v5 = a3;
  [(HMHearingAidAudiogramViewController *)&v8 traitCollectionDidChange:v5];
  id v6 = [(HMHearingAidAudiogramViewController *)v4 view];
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_layoutIfNeeded);
  }
  else
  {
    __break(1u);
  }
}

- (NSArray)validAudiograms
{
  return (NSArray *)sub_25123FD50(self, (uint64_t)a2, (void (*)(void))HMHearingAidAudiogramViewController.validAudiograms.getter);
}

- (NSArray)invalidAudiograms
{
  return (NSArray *)sub_25123FD50(self, (uint64_t)a2, (void (*)(void))HMHearingAidAudiogramViewController.invalidAudiograms.getter);
}

- (void)addDeviceLisenters
{
  id v2 = self;
  HMHearingAidAudiogramViewController.addDeviceLisenters()();
}

- (void)mainButtonTapped
{
  id v2 = self;
  sub_251240598();
}

- (void)refreshAudiogramList
{
  sub_25126BDF8();
  id v3 = self;
  id v4 = (void *)sub_25126BDD8();
  id v5 = (void *)sub_25126BDE8();

  v7[4] = sub_251240A50;
  v7[5] = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_251240CB4;
  v7[3] = &block_descriptor_8;
  id v6 = _Block_copy(v7);
  objc_msgSend(v5, sel_triggerFetchAudiogramsWithCompletion_, v6);
  _Block_release(v6);
}

- (void)setAGListResult
{
  id v2 = self;
  sub_25126BC68();
  sub_25124082C();
}

@end