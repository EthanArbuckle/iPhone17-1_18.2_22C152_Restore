@interface BYODDomainPurchaseSearchViewController
+ (id)log;
- (BOOL)_isOptionSelected:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BYODDomainPurchaseSearchViewController)initWithACAccount:(id)a3 isBuyNewDomainFlow:(BOOL)a4 domainPurchaseProviderName:(id)a5;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)colourForCard;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)getOptionsSectionIndex;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_clearResults;
- (void)_createNameInputCell;
- (void)_domainAvailableTapped:(id)a3;
- (void)_navigateToProvider:(id)a3;
- (void)_nextButtonTapped:(id)a3;
- (void)_notNowTapped:(id)a3;
- (void)_optionTapped:(id)a3;
- (void)_removeSuggestion:(id)a3;
- (void)_requestData:(id)a3;
- (void)_showErrorAlert;
- (void)_updateNextButtonState;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODDomainPurchaseSearchViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_41620;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7428 != -1) {
    dispatch_once(&qword_D7428, block);
  }
  v2 = (void *)qword_D7420;

  return v2;
}

- (BYODDomainPurchaseSearchViewController)initWithACAccount:(id)a3 isBuyNewDomainFlow:(BOOL)a4 domainPurchaseProviderName:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_DETAIL" value:&stru_B9F70 table:@"AccountPreferences"];
  v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v10);

  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v18.receiver = self;
  v18.super_class = (Class)BYODDomainPurchaseSearchViewController;
  v16 = [(BYODDomainPurchaseSearchViewController *)&v18 initWithTitle:v15 detailText:v13 icon:0 adoptTableViewScrollView:1];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_loggedInUserAccount, a3);
    v16->_isBuyNewDomainFlow = a4;
    [(BYODDomainPurchaseSearchViewController *)v16 _clearResults];
    [(BYODDomainPurchaseSearchViewController *)v16 _createNameInputCell];
  }

  return v16;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)BYODDomainPurchaseSearchViewController;
  [(BYODDomainPurchaseSearchViewController *)&v25 viewDidLoad];
  BOOL isBuyNewDomainFlow = self->_isBuyNewDomainFlow;
  v4 = [(BYODDomainPurchaseSearchViewController *)self navigationItem];
  v5 = v4;
  if (isBuyNewDomainFlow)
  {
    id v6 = objc_alloc((Class)UIBarButtonItem);
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_NOT_NOW" value:&stru_B9F70 table:@"AccountPreferences"];
    id v9 = [v6 initWithTitle:v8 style:0 target:self action:"_notNowTapped:"];
    [v5 setLeftBarButtonItem:v9];
  }
  else
  {
    [v4 setHidesBackButton:0];
  }

  id v10 = [(BYODDomainPurchaseSearchViewController *)self navigationItem];
  id v11 = objc_alloc((Class)UIBarButtonItem);
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"NEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v14 = [v11 initWithTitle:v13 style:0 target:self action:"_nextButtonTapped:"];
  [v10 setRightBarButtonItem:v14];

  id v15 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BYODDomainPurchaseSearchViewController *)self setTableView:v15];

  v16 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = +[UIColor clearColor];
  objc_super v18 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v18 setBackgroundColor:v17];

  v19 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v19 registerClass:objc_opt_class() forCellReuseIdentifier:@"BYODDomainSearchResultCellID"];

  v20 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v20 registerClass:objc_opt_class() forCellReuseIdentifier:@"BYODDomainSearchOptionCellID"];

  v21 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v21 registerClass:objc_opt_class() forCellReuseIdentifier:@"BYODDomainSearchNoteCellID"];

  v22 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v22 registerClass:objc_opt_class() forCellReuseIdentifier:@"BYODOverlayCellID"];

  v23 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v23 setDelegate:self];

  v24 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v24 setDataSource:self];

  [(BYODDomainPurchaseSearchViewController *)self _updateNextButtonState];
}

- (void)_createNameInputCell
{
  v3 = (UITableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:1000 reuseIdentifier:0];
  nameInputCell = self->_nameInputCell;
  self->_nameInputCell = v3;

  [(UITableViewCell *)self->_nameInputCell setTextFieldOffset:0.0];
  v5 = self->_nameInputCell;
  id v14 = +[UIColor secondarySystemBackgroundColor];
  -[UITableViewCell setBackgroundColor:](v5, "setBackgroundColor:");

  [(UITableViewCell *)self->_nameInputCell setSelectionStyle:0];
  id v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v6 = [(UITableViewCell *)self->_nameInputCell editableTextField];
  [v6 setFont:v15];

  id v16 = [(UITableViewCell *)self->_nameInputCell heightAnchor];
  v7 = [v16 constraintEqualToConstant:46.0];
  [v7 setActive:1];

  v8 = [(UITableViewCell *)self->_nameInputCell contentConfiguration];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(UITableViewCell *)self->_nameInputCell defaultContentConfiguration];
  }
  id v17 = v10;

  [v17 directionalLayoutMargins];
  [(UITableViewCell *)self->_nameInputCell setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
  id v11 = [(UITableViewCell *)self->_nameInputCell editableTextField];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_INPUT_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v11 setPlaceholder:v13];

  [v11 setClearButtonMode:1];
  [v11 setReturnKeyType:6];
  [v11 setEnablesReturnKeyAutomatically:1];
  [v11 setAutocapitalizationType:0];
  [v11 setSpellCheckingType:1];
  [v11 setAutocorrectionType:1];
  [v11 _setDataOwnerForPaste:3];
  [v11 _setDataOwnerForCopy:3];
  [v11 setDelegate:self];
}

- (void)_notNowTapped:(id)a3
{
}

- (void)_nextButtonTapped:(id)a3
{
  id v4 = a3;
  selectedDomainName = self->_selectedDomainName;
  if (!selectedDomainName)
  {
    id v6 = +[BYODDomainPurchaseSearchViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Domain isn't selected", buf, 2u);
    }

    selectedDomainName = self->_selectedDomainName;
  }
  v7 = selectedDomainName;
  spinner = self->_spinner;
  if (!spinner)
  {
    id v9 = [[BYODSpinner alloc] initWithViewController:self];
    id v10 = self->_spinner;
    self->_spinner = v9;

    spinner = self->_spinner;
  }
  [(BYODSpinner *)spinner startSpinner];
  id v11 = [BYODGetPurchaseURLRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  v13 = [(ACAccount *)loggedInUserAccount accountStore];
  id v14 = [(BYODGetPurchaseURLRequest *)v11 initWithAccount:loggedInUserAccount accountStore:v13 domain:v7];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4212C;
  v16[3] = &unk_B94D0;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v7;
  id v17 = v15;
  [(BYODGetPurchaseURLRequest *)v14 performRequestWithCallback:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)_navigateToProvider:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 purchaseURL], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"BYOD_PURCHASE_CONTINUE_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    id v9 = [v5 dnsProviderName];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"BYOD_PURCHASE_CONTINUE_ALERT_DETAIL" value:&stru_B9F70 table:@"AccountPreferences"];
    v13 = +[UIAlertController alertControllerWithTitle:v10 message:v12 preferredStyle:1];

    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    id v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];

    id v17 = +[NSBundle bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_428B4;
    v21[3] = &unk_B9310;
    id v22 = v5;
    v23 = self;
    v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v21];

    [v13 addAction:v16];
    [v13 addAction:v19];
    [v13 setPreferredAction:v19];
    [(BYODDomainPurchaseSearchViewController *)self presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    v20 = +[BYODDomainPurchaseSearchViewController log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Provider URL is null", buf, 2u);
    }

    [(BYODDomainPurchaseSearchViewController *)self _showErrorAlert];
  }
}

- (void)_domainAvailableTapped:(id)a3
{
  id v10 = a3;
  id v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v10 tag], 1);
  v5 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  v7 = [v6 domain];
  selectedDomainName = self->_selectedDomainName;
  self->_selectedDomainName = v7;

  [(BYODDomainPurchaseSearchViewController *)self _updateNextButtonState];
  id v9 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v9 reloadData];
}

- (void)_optionTapped:(id)a3
{
  id v10 = a3;
  id v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v10 tag], -[BYODDomainPurchaseSearchViewController getOptionsSectionIndex](self, "getOptionsSectionIndex"));
  v5 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  v7 = [v6 domain];
  selectedDomainName = self->_selectedDomainName;
  self->_selectedDomainName = v7;

  [(BYODDomainPurchaseSearchViewController *)self _updateNextButtonState];
  id v9 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v9 reloadData];
}

- (BOOL)_isOptionSelected:(id)a3
{
  return [a3 isEqualToString:self->_selectedDomainName];
}

- (void)_updateNextButtonState
{
  selectedDomainName = self->_selectedDomainName;
  id v4 = [(BYODDomainPurchaseSearchViewController *)self navigationItem];
  v3 = [v4 rightBarButtonItem];
  [v3 setEnabled:selectedDomainName != 0];
}

- (void)_requestData:(id)a3
{
  id v4 = a3;
  spinner = self->_spinner;
  if (!spinner)
  {
    id v6 = [[BYODSpinner alloc] initWithViewController:self];
    v7 = self->_spinner;
    self->_spinner = v6;

    spinner = self->_spinner;
  }
  [(BYODSpinner *)spinner startSpinner];
  self->_isSearchInProgress = 1;
  [(BYODDomainPurchaseSearchViewController *)self _clearResults];
  v8 = [BYODSearchDomainRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v10 = [(ACAccount *)loggedInUserAccount accountStore];
  id v11 = [(BYODSearchDomainRequest *)v8 initWithAccount:loggedInUserAccount accountStore:v10 domain:v4];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_42E2C;
  v12[3] = &unk_B94F8;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  [(BYODSearchDomainRequest *)v11 performRequestWithCallback:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = [BYODGetDomainRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v6 = [(ACAccount *)loggedInUserAccount accountStore];
  v7 = [(BYODGetDomainRequest *)v4 initWithAccount:loggedInUserAccount accountStore:v6 domain:self->_selectedDomainName];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_432FC;
  v8[3] = &unk_B9290;
  objc_copyWeak(&v9, &location);
  [(BYODGetDomainRequest *)v7 performRequestWithCallback:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [a3 text];
  [(BYODDomainPurchaseSearchViewController *)self _requestData:v4];

  return 0;
}

- (void)_removeSuggestion:(id)a3
{
  suggestions = self->_suggestions;
  +[NSPredicate predicateWithFormat:@"name == %@", self->_selectedDomainName];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableArray filteredArrayUsingPredicate:](suggestions, "filteredArrayUsingPredicate:");
  [(NSMutableArray *)suggestions removeObjectsInArray:v5];

  id v7 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v7 reloadData];
}

- (void)_clearResults
{
  self->_showResults = 0;
  selectedDomainName = self->_selectedDomainName;
  self->_selectedDomainName = 0;

  [(BYODDomainPurchaseSearchViewController *)self _updateNextButtonState];
  id v4 = [(BYODDomainPurchaseSearchViewController *)self tableView];
  [v4 reloadData];
}

- (id)colourForCard
{
  return +[UIColor systemBackgroundColor];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_showResults)
  {
    BOOL v3 = ![(BYODDomainOptionsList *)self->_domainOptions isAvailable];
    int64_t v4 = 2;
  }
  else
  {
    BOOL v3 = !self->_isSearchInProgress;
    int64_t v4 = 1;
  }
  if (v3) {
    return v4;
  }
  else {
    return v4 + 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(BYODDomainPurchaseSearchViewController *)self getOptionsSectionIndex] != a4) {
    return 1;
  }
  suggestions = self->_suggestions;

  return (int64_t)[(NSMutableArray *)suggestions count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    v8 = self->_nameInputCell;
    goto LABEL_15;
  }
  if ([v7 section] == (char *)&dword_0 + 1 && self->_isSearchInProgress)
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"BYODOverlayCellID"];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_IN_PROGRESS" value:&stru_B9F70 table:@"AccountPreferences"];
    [(UITableViewCell *)v8 setNote:v10];

    id v11 = [(UITableViewCell *)v8 textLabel];
    v12 = [v11 heightAnchor];
    [v6 bounds];
    id v14 = [v12 constraintEqualToConstant:v13 * 0.5];
    [v14 setActive:1];
LABEL_13:

    goto LABEL_14;
  }
  if ([v7 section] != (char *)&dword_0 + 1
    || ![(BYODDomainOptionsList *)self->_domainOptions isAvailable])
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"BYODDomainSearchOptionCellID"];
    v21 = -[NSMutableArray objectAtIndexedSubscript:](self->_suggestions, "objectAtIndexedSubscript:", [v7 row]);
    id v11 = [v21 name];

    id v22 = -[NSMutableArray objectAtIndexedSubscript:](self->_suggestions, "objectAtIndexedSubscript:", [v7 row]);
    v12 = [v22 price];

    [(UITableViewCell *)v8 setDomain:v11 price:v12];
    v23 = [(UITableViewCell *)v8 selectButton];
    [v23 addTarget:self action:"_optionTapped:" forControlEvents:64];

    v24 = [(UITableViewCell *)v8 selectButton];
    objc_msgSend(v24, "setTag:", objc_msgSend(v7, "row"));

    objc_super v25 = [(UITableViewCell *)v8 domain];
    [(UITableViewCell *)v8 setChecked:[(BYODDomainPurchaseSearchViewController *)self _isOptionSelected:v25]];

    v26 = [(UITableViewCell *)v8 contentConfiguration];
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [(UITableViewCell *)v8 defaultContentConfiguration];
    }
    id v14 = v28;

    [v14 directionalLayoutMargins];
    [(UITableViewCell *)v8 setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
    goto LABEL_13;
  }
  v8 = [v6 dequeueReusableCellWithIdentifier:@"BYODDomainSearchResultCellID"];
  id v15 = [(BYODDomainOptionsList *)self->_domainOptions searchedDomain];
  id v16 = [v15 name];
  id v17 = [(BYODDomainOptionsList *)self->_domainOptions searchedDomain];
  id v18 = [v17 price];
  [(UITableViewCell *)v8 setDomain:v16 price:v18];

  v19 = [(UITableViewCell *)v8 selectButton];
  [v19 addTarget:self action:"_domainAvailableTapped:" forControlEvents:64];

  v20 = [(UITableViewCell *)v8 selectButton];
  objc_msgSend(v20, "setTag:", objc_msgSend(v7, "row"));

  id v11 = [(UITableViewCell *)v8 domain];
  [(UITableViewCell *)v8 setChecked:[(BYODDomainPurchaseSearchViewController *)self _isOptionSelected:v11]];
LABEL_14:

LABEL_15:

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(BYODDomainPurchaseSearchViewController *)self getOptionsSectionIndex] == a4)
  {
    id v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"BYODDomainSearchListHeaderID"];
    if (!v7) {
      id v7 = [objc_alloc((Class)UITableViewHeaderFooterView) initWithReuseIdentifier:@"BYODDomainSearchListHeaderID"];
    }
    v8 = [v7 contentConfiguration];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v7 defaultContentConfiguration];
    }
    id v11 = v10;

    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    double v13 = [v12 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_OPTIONS" value:&stru_B9F70 table:@"AccountPreferences"];
    [v11 setText:v13];

    [v11 directionalLayoutMargins];
    objc_msgSend(v11, "setDirectionalLayoutMargins:");
    [v7 setContentConfiguration:v11];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = 0;
  if (!a4 && self->_showResults)
  {
    if ([(BYODDomainOptionsList *)self->_domainOptions isAvailable])
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [v6 dequeueReusableCellWithIdentifier:@"BYODDomainSearchNoteCellID"];
      if (!v7) {
        id v7 = [[BYODDomainSearchNoteCellView alloc] initWithStyle:0 reuseIdentifier:@"BYODDomainSearchNoteCellID"];
      }
      if ([(BYODDomainOptionsList *)self->_domainOptions isKeywordSearch])
      {
        v8 = +[NSBundle bundleForClass:objc_opt_class()];
        id v9 = [v8 localizedStringForKey:@"BYOD_PURCHASE_SEARCH_KEYWORD_NOTE" value:&stru_B9F70 table:@"AccountPreferences"];
        [(BYODDomainSearchNoteCellView *)v7 setNote:v9];
      }
      else
      {
        v8 = [(BYODDomainOptionsList *)self->_domainOptions searchedDomain];
        id v9 = [v8 name];
        [(BYODDomainSearchNoteCellView *)v7 setNoteWithDomain:v9];
      }
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  [v6 sectionHeaderHeight];
  double v8 = v7;
  if ([(BYODDomainPurchaseSearchViewController *)self getOptionsSectionIndex] != a4) {
    double v8 = 0.0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  [v6 sectionFooterHeight];
  double v8 = v7;
  if (self->_showResults && [(BYODDomainOptionsList *)self->_domainOptions isAvailable])
  {
    double v9 = 32.0;
    if (v8 >= 32.0 || a4 != 0) {
      double v9 = v8;
    }
    if (a4 == 1) {
      double v8 = 22.0;
    }
    else {
      double v8 = v9;
    }
  }

  return v8;
}

- (int64_t)getOptionsSectionIndex
{
  if (!self->_showResults) {
    return -1;
  }
  if ([(BYODDomainOptionsList *)self->_domainOptions isAvailable]) {
    return 2;
  }
  return 1;
}

- (void)_showErrorAlert
{
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  int64_t v4 = [v3 localizedStringForKey:@"BYOD_GENERIC_ERROR_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  double v7 = [v6 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  double v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];

  [v5 addAction:v8];
  v12 = self;
  id v9 = v5;
  id v13 = v9;
  id v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:&v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_domainOptions, 0);
  objc_storeStrong((id *)&self->_selectedDomainName, 0);
  objc_storeStrong((id *)&self->_nameInputCell, 0);

  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
}

@end