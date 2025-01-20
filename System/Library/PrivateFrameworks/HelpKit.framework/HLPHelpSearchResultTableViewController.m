@interface HLPHelpSearchResultTableViewController
- (BOOL)fullBookView;
- (NSArray)searchResults;
- (UIView)footerView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)preferSeparatorValue:(double)a3;
- (void)setFooterView:(id)a3;
- (void)setFullBookView:(BOOL)a3;
- (void)setSearchResults:(id)a3;
- (void)updateWithSearchText:(id)a3 searchResults:(id)a4;
- (void)viewDidLoad;
@end

@implementation HLPHelpSearchResultTableViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HLPHelpSearchResultTableViewController;
  [(HLPHelpSearchResultTableViewController *)&v5 viewDidLoad];
  v3 = [(HLPHelpSearchResultTableViewController *)self tableView];
  [v3 setContentInsetAdjustmentBehavior:0];

  v4 = [(HLPHelpSearchResultTableViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"SearchResultTableViewIdentifier"];
}

- (UIView)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    objc_super v5 = self->_footerView;
    self->_footerView = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v6;

    uint64_t v8 = *MEMORY[0x263F1D300];
    v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
    [(UILabel *)self->_footerLabel setFont:v9];

    [(UILabel *)self->_footerLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_footerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x263F086E0] HLPBundle];
    v11 = [v10 localizedStringForKey:@"No results found" value:&stru_26D29FC58 table:0];
    [(UILabel *)self->_footerLabel setText:v11];

    if (+[HLPCommonDefines isVisionOS]) {
      [MEMORY[0x263F1C550] secondaryLabelColor];
    }
    else {
    v12 = [MEMORY[0x263F1C550] colorWithWhite:0.309803922 alpha:1.0];
    }
    [(UILabel *)self->_footerLabel setTextColor:v12];

    [(UILabel *)self->_footerLabel setTextAlignment:1];
    [(UILabel *)self->_footerLabel setNumberOfLines:0];
    [(UILabel *)self->_footerLabel setLineBreakMode:0];
    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:v8];
    [(UILabel *)self->_footerLabel setFont:v13];

    [(UIView *)self->_footerView addSubview:self->_footerLabel];
    v14 = [(UILabel *)self->_footerLabel leadingAnchor];
    v15 = [(UIView *)self->_footerView leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:12.0];
    [v16 setActive:1];

    v17 = [(UILabel *)self->_footerLabel trailingAnchor];
    v18 = [(UIView *)self->_footerView trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:-12.0];
    [v19 setActive:1];

    v20 = [(UILabel *)self->_footerLabel topAnchor];
    v21 = [(UIView *)self->_footerView topAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:50.0];
    [v22 setActive:1];

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)updateWithSearchText:(id)a3 searchResults:(id)a4
{
  id v12 = a4;
  objc_storeStrong((id *)&self->_searchResults, a4);
  id v7 = a3;
  uint64_t v8 = [(HLPHelpSearchResultTableViewController *)self tableView];
  [v8 reloadData];

  uint64_t v9 = [v7 length];
  if (!v9) {
    goto LABEL_4;
  }
  if ([v12 count])
  {
    LODWORD(v9) = 0;
LABEL_4:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = [(HLPHelpSearchResultTableViewController *)self footerView];
  LODWORD(v9) = 1;
LABEL_6:
  v11 = [(HLPHelpSearchResultTableViewController *)self tableView];
  [v11 setTableFooterView:v10];

  if (v9) {
}
  }

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_searchResults count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"SearchResultTableViewIdentifier" forIndexPath:v6];
  [v7 setSearchResult:1];
  [v7 setShowFirstLevelIcon:0];
  if (![(HLPHelpSearchResultTableViewController *)self fullBookView]) {
    [v7 setAccessoryType:1];
  }
  [v7 setIgnoreLevels:1];
  searchResults = self->_searchResults;
  uint64_t v9 = [v6 row];

  v10 = [(NSArray *)searchResults objectAtIndexedSubscript:v9];
  [v7 setHelpItem:v10];

  return v7;
}

- (void)preferSeparatorValue:(double)a3
{
  if (a3 >= 24.0) {
    double v3 = a3;
  }
  else {
    double v3 = 24.0;
  }
  if (self->_separatorValue != v3)
  {
    self->_separatorValue = v3;
    id v4 = [(HLPHelpSearchResultTableViewController *)self tableView];
    objc_msgSend(v4, "setSeparatorInset:", 0.0, v3, 0.0, 0.0);
  }
}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (void)setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (void)setFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end