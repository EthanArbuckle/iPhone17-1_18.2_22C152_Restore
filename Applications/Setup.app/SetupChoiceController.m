@interface SetupChoiceController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)_useTableLayout;
- (BOOL)useTableLayout;
- (BOOL)wantsNextButton;
- (NSArray)choices;
- (SetupChoice)selectedChoice;
- (SetupChoiceController)init;
- (UIButton)primaryChoiceButton;
- (UIButton)secondaryChoiceButton;
- (double)choiceButtonsBottomInset;
- (double)heightForFooterInTableView:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_footerIcon;
- (id)footerDetailText;
- (id)footerIcon;
- (id)footerIconName;
- (id)footerTitleText;
- (id)learnMoreButtonText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)viewForFooterInTableView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_primaryButtonPressed;
- (void)_secondaryButtonPressed;
- (void)_updateSelectedChoiceCheckmark;
- (void)checkChoiceValid;
- (void)choiceCancelled:(id)a3;
- (void)choiceConfirmed:(id)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4;
- (void)controllerDone;
- (void)finishWithChoiceForIdentifier:(id)a3;
- (void)learnMoreButtonTapped:(id)a3;
- (void)loadView;
- (void)setButtonsEnabled:(BOOL)a3;
- (void)setChoiceButtonsBottomInset:(double)a3;
- (void)setChoices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedChoice:(id)a3;
- (void)setSelectedChoiceIndex:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SetupChoiceController

+ (id)cloudConfigSkipKey
{
  id v7 = a1;
  SEL aSelector = a2;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id location = NSStringFromSelector(aSelector);
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Subclasses must implement %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

+ (unint64_t)applicableDispositions
{
}

- (SetupChoiceController)init
{
  SEL v11 = a2;
  id location = 0;
  v10.receiver = self;
  v10.super_class = (Class)SetupChoiceController;
  id location = [(SetupChoiceController *)&v10 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    if ([location isMemberOfClass:objc_opt_class()])
    {
      v2 = +[NSAssertionHandler currentHandler];
      [(NSAssertionHandler *)v2 handleFailureInMethod:v11, location, @"SetupChoiceController.m", 128, @"Do not instantiate SetupChoiceController directly, subclass instead", 0 object file lineNumber description];
    }
    if ([location wantsNextButton])
    {
      id v3 = objc_alloc((Class)UIBarButtonItem);
      os_log_type_t v4 = +[NSBundle mainBundle];
      v5 = [(NSBundle *)v4 localizedStringForKey:@"NEXT" value:&stru_1002B4E18 table:@"Localizable"];
      id v9 = [v3 initWithTitle:v5 style:2 target:location action:"checkChoiceValid"];

      [v9 setEnabled:0];
      id v6 = [location navigationItem];
      [v6 setRightBarButtonItem:v9];

      objc_storeStrong(&v9, 0);
    }
  }
  id v7 = (SetupChoiceController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (id)_footerIcon
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = [(SetupChoiceController *)self footerIcon];
  if (!location[0])
  {
    id v6 = [(SetupChoiceController *)v8 footerIconName];
    if (v6)
    {
      v2 = +[UIImage imageNamed:v6];
      id v3 = location[0];
      location[0] = v2;
    }
    objc_storeStrong(&v6, 0);
  }
  id v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (void)loadView
{
  v56 = self;
  SEL v55 = a2;
  v54.receiver = self;
  v54.super_class = (Class)SetupChoiceController;
  [(BuddyTableViewController *)&v54 loadView];
  objc_storeStrong((id *)&v56->_serviceFooterView, 0);
  objc_storeStrong((id *)&v56->_learnMoreView, 0);
  id v53 = [(SetupChoiceController *)v56 footerTitleText];
  id v52 = [(SetupChoiceController *)v56 footerDetailText];
  id v51 = [(SetupChoiceController *)v56 learnMoreButtonText];
  id v50 = [(SetupChoiceController *)v56 _footerIcon];
  if ([v53 length] || objc_msgSend(v52, "length") || objc_msgSend(v51, "length") || v50)
  {
    if ([(SetupChoiceController *)v56 _useTableLayout])
    {
      if ([v53 length] || objc_msgSend(v52, "length"))
      {
        v2 = -[BuddyAppleIDTableHeaderView initWithFrame:]([BuddyAppleIDTableHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        serviceFooterView = v56->_serviceFooterView;
        v56->_serviceFooterView = v2;

        if ([v53 length])
        {
          id v4 = objc_alloc((Class)NSAttributedString);
          id v5 = +[BuddyAppleIDTableHeaderView defaultTitleTextAttributes];
          id v6 = [v4 initWithString:v53 attributes:v5];
          id v7 = [(BuddyAppleIDTableHeaderView *)v56->_serviceFooterView textLabel];
          [(UILabel *)v7 setAttributedText:v6];
        }
        if ([v52 length])
        {
          id v8 = objc_alloc((Class)NSAttributedString);
          id v9 = +[BuddyAppleIDTableHeaderView defaultDetailTextAttributes];
          id v10 = [v8 initWithString:v52 attributes:v9];
          SEL v11 = [(BuddyAppleIDTableHeaderView *)v56->_serviceFooterView detailTextLabel];
          [(UILabel *)v11 setAttributedText:v10];
        }
      }
      if ([v51 length])
      {
        v12 = -[BuddyAppleIDLinkView initWithFrame:]([BuddyAppleIDLinkView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        learnMoreView = v56->_learnMoreView;
        v56->_learnMoreView = v12;

        [(BuddyAppleIDLinkView *)v56->_learnMoreView setButtonTopPadding:15.0];
        v14 = [(BuddyAppleIDLinkView *)v56->_learnMoreView linkButton];
        [(UIButton *)v14 setTitle:v51 forState:0];

        v15 = [(BuddyAppleIDLinkView *)v56->_learnMoreView linkButton];
        [(UIButton *)v15 addTarget:v56 action:"learnMoreButtonTapped:" forControlEvents:64];
      }
      [(BuddyAppleIDTableHeaderView *)v56->_serviceFooterView setLinkButtonTopPadding:10.0];
      v16 = [(BuddyAppleIDTableHeaderView *)v56->_serviceFooterView topIconName];
      NSUInteger v17 = [(NSString *)v16 length];

      if (v17) {
        [(BuddyAppleIDTableHeaderView *)v56->_serviceFooterView setBottomPadding:2.0];
      }
      else {
        [(BuddyAppleIDTableHeaderView *)v56->_serviceFooterView setBottomPadding:20.0];
      }
    }
    else
    {
      objc_initWeak(&location, v56);
      if ([v52 length])
      {
        v18 = [(BuddyTableViewController *)v56 headerView];
        id v19 = [(BFFPaneHeaderView *)v18 detailTextLabel];
        [v19 setText:v52];
      }
      if ([v51 length])
      {
        v20 = [(BuddyTableViewController *)v56 headerView];
        id v21 = v51;
        v44 = _NSConcreteStackBlock;
        uint64_t v45 = 3221225472;
        v46 = sub_1000CA9B4;
        v47 = &unk_1002B0CA8;
        objc_copyWeak(&v48, &location);
        [(BFFPaneHeaderView *)v20 setLinkText:v21 handler:&v44];

        objc_destroyWeak(&v48);
      }
      objc_destroyWeak(&location);
    }
    if (v50)
    {
      v22 = [(BuddyTableViewController *)v56 headerView];
      [(BFFPaneHeaderView *)v22 setIcon:v50];
    }
  }
  if (![(SetupChoiceController *)v56 _useTableLayout])
  {
    v23 = [(SetupChoiceController *)v56 choices];
    NSUInteger v24 = [(NSArray *)v23 count];

    if (v24)
    {
      id v25 = +[BFFStyle sharedStyle];
      v26 = [(SetupChoiceController *)v56 choices];
      id v27 = [(NSArray *)v26 firstObject];
      id v28 = [v27 localizedTitle];
      v29 = [(BuddyTableViewController *)v56 tableView];
      v30 = (UIButton *)[v25 continueButtonWithTitle:v28 inView:v29];
      primaryChoiceButton = v56->_primaryChoiceButton;
      v56->_primaryChoiceButton = v30;

      [(UIButton *)v56->_primaryChoiceButton addTarget:v56 action:"_primaryButtonPressed" forControlEvents:0x2000];
    }
    v32 = [(SetupChoiceController *)v56 choices];
    NSUInteger v33 = [(NSArray *)v32 count];

    if (v33 > 1)
    {
      v34 = +[UIButton buttonWithType:1];
      secondaryChoiceButton = v56->_secondaryChoiceButton;
      v56->_secondaryChoiceButton = v34;

      v36 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      v37 = [(UIButton *)v56->_secondaryChoiceButton titleLabel];
      [(UILabel *)v37 setFont:v36];

      v38 = [(UIButton *)v56->_secondaryChoiceButton titleLabel];
      [(UILabel *)v38 setAdjustsFontSizeToFitWidth:1];

      v39 = v56->_secondaryChoiceButton;
      v40 = [(SetupChoiceController *)v56 choices];
      id v41 = [(NSArray *)v40 lastObject];
      id v42 = [v41 localizedTitle];
      [(UIButton *)v39 setTitle:v42 forState:0];

      [(UIButton *)v56->_secondaryChoiceButton addTarget:v56 action:"_secondaryButtonPressed" forControlEvents:0x2000];
      v43 = [(BuddyTableViewController *)v56 tableView];
      [(UITableView *)v43 addSubview:v56->_secondaryChoiceButton];
    }
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
}

- (void)_primaryButtonPressed
{
  v2 = [(SetupChoiceController *)self choices];
  NSUInteger v3 = [(NSArray *)v2 count];

  if (v3)
  {
    id v4 = [(SetupChoiceController *)self choices];
    id v5 = [(NSArray *)v4 objectAtIndexedSubscript:0];
    objc_storeWeak((id *)&self->_selectedChoice, v5);

    [(SetupChoiceController *)self checkChoiceValid];
  }
}

- (void)_secondaryButtonPressed
{
  v2 = [(SetupChoiceController *)self choices];
  NSUInteger v3 = [(NSArray *)v2 count];

  if (v3 > 1)
  {
    id v4 = [(SetupChoiceController *)self choices];
    id v5 = [(NSArray *)v4 objectAtIndexedSubscript:1];
    objc_storeWeak((id *)&self->_selectedChoice, v5);

    [(SetupChoiceController *)self checkChoiceValid];
  }
}

- (void)setChoices:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v16->_choices != location[0])
  {
    memset(__b, 0, sizeof(__b));
    id v3 = location[0];
    id v4 = [v3 countByEnumeratingWithState:__b objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v4; ++i)
        {
          if (*(void *)__b[2] != v5) {
            objc_enumerationMutation(v3);
          }
          id v14 = *(id *)(__b[1] + 8 * i);
          [v14 setChoiceController:0];
        }
        id v4 = [v3 countByEnumeratingWithState:__b objects:v18 count:16];
      }
      while (v4);
    }

    objc_storeStrong((id *)&v16->_choices, location[0]);
    memset(v11, 0, sizeof(v11));
    id v7 = v16->_choices;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:v11 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v11[2];
      do
      {
        for (unint64_t j = 0; j < (unint64_t)v8; ++j)
        {
          if (*(void *)v11[2] != v9) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(v11[1] + 8 * j);
          [v12 setChoiceController:v16];
        }
        id v8 = [(NSArray *)v7 countByEnumeratingWithState:v11 objects:v17 count:16];
      }
      while (v8);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)setButtonsEnabled:(BOOL)a3
{
}

- (BOOL)_useTableLayout
{
  v2 = [(SetupChoiceController *)self choices];
  if ([(NSArray *)v2 count] < 3) {
    unsigned int v3 = [(SetupChoiceController *)self useTableLayout];
  }
  else {
    unsigned int v3 = 1;
  }
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)useTableLayout
{
  return 1;
}

- (id)footerTitleText
{
  return 0;
}

- (id)footerDetailText
{
  return 0;
}

- (id)footerIcon
{
  return 0;
}

- (id)footerIconName
{
  return 0;
}

- (id)learnMoreButtonText
{
  return 0;
}

- (void)learnMoreButtonTapped:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)wantsNextButton
{
  return 1;
}

- (void)finishWithChoiceForIdentifier:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (int i = 0; ; ++i)
  {
    unint64_t v3 = i;
    BOOL v4 = [(SetupChoiceController *)v14 choices];
    NSUInteger v5 = [(NSArray *)v4 count];

    if (v3 >= v5) {
      break;
    }
    id v6 = [(SetupChoiceController *)v14 choices];
    id v11 = [(NSArray *)v6 objectAtIndex:i];

    id v7 = [v11 identifier];
    unsigned __int8 v8 = [v7 isEqual:location[0]];

    if (v8)
    {
      [(SetupChoiceController *)v14 setSelectedChoiceIndex:i];
      [(SetupChoiceController *)v14 controllerDone];
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
    }
    objc_storeStrong(&v11, 0);
    if (v10) {
      goto LABEL_11;
    }
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100051470((uint64_t)buf, (uint64_t)v14, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ cannot finish with controller identifier choice %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  int v10 = 0;
LABEL_11:
  objc_storeStrong(location, 0);
}

- (void)_updateSelectedChoiceCheckmark
{
  v16 = self;
  SEL v15 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedChoice);

  if (WeakRetained)
  {
    id v14 = 0;
    choices = v16->_choices;
    id v4 = objc_loadWeakRetained((id *)&v16->_selectedChoice);
    id v5 = [(NSArray *)choices indexOfObject:v4];

    id v14 = v5;
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = +[NSIndexPath indexPathForRow:v14 inSection:0];
      id v6 = [(BuddyTableViewController *)v16 tableView];
      id location = [(UITableView *)v6 cellForRowAtIndexPath:v13];

      [location setAccessoryType:3];
      id v7 = [location textLabel];
      id v8 = +[UIColor tableCellBlueTextColor];
      [v7 setTextColor:v8];

      [location setNeedsLayout];
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v13, 0);
    }
  }
  if ([(SetupChoiceController *)v16 wantsNextButton])
  {
    id v9 = [(SetupChoiceController *)v16 navigationItem];
    id v10 = [v9 rightBarButtonItem];
    id v11 = objc_loadWeakRetained((id *)&v16->_selectedChoice);
    [v10 setEnabled:v11 != 0];
  }
}

- (void)viewDidLoad
{
  id v4 = self;
  SEL v3 = a2;
  [(SetupChoiceController *)self _updateSelectedChoiceCheckmark];
  v2.receiver = v4;
  v2.super_class = (Class)SetupChoiceController;
  [(SetupChoiceController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SetupChoiceController;
  [(SetupChoiceController *)&v6 viewDidAppear:a3];
  if (![(SetupChoiceController *)v9 wantsNextButton])
  {
    SEL v3 = [(BuddyTableViewController *)v9 tableView];
    id v5 = [(UITableView *)v3 indexPathForSelectedRow];

    if (v5)
    {
      id v4 = [(BuddyTableViewController *)v9 tableView];
      [(UITableView *)v4 deselectRowAtIndexPath:v5 animated:1];
    }
    objc_storeStrong((id *)&v5, 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if ([(SetupChoiceController *)self isMovingFromParentViewController])[(SetupChoiceController *)v6 controllerBack]; {
  v3.receiver = v6;
  }
  v3.super_class = (Class)SetupChoiceController;
  [(SetupChoiceController *)&v3 viewDidDisappear:v4];
}

- (void)viewDidLayoutSubviews
{
  v115 = self;
  SEL v114 = a2;
  id v2 = [(SetupChoiceController *)self traitCollection];
  BOOL v3 = [v2 horizontalSizeClass] == (id)1;

  BOOL v113 = v3;
  [(SetupChoiceController *)v115 choiceButtonsBottomInset];
  double v112 = v4 + 24.0;
  double v111 = 0.0;
  double v5 = 120.0;
  if (v3) {
    double v5 = 40.0;
  }
  double v111 = v112 + v5;
  v110.receiver = v115;
  v110.super_class = (Class)SetupChoiceController;
  [(BuddyTableViewController *)&v110 viewDidLayoutSubviews];
  objc_super v6 = [(BuddyTableViewController *)v115 tableView];
  [(UITableView *)v6 bounds];
  v109.origin.y = v7;
  v109.origin.x = v8;
  v109.size.height = v9;
  v109.size.double width = v10;

  id v11 = [(BuddyTableViewController *)v115 headerView];
  [(BFFPaneHeaderView *)v11 frame];
  v108.origin.y = v12;
  v108.origin.x = v13;
  v108.size.height = v14;
  v108.size.double width = v15;

  memset(__b, 0, sizeof(__b));
  id v16 = +[BFFStyle sharedStyle];
  NSUInteger v17 = [(BuddyTableViewController *)v115 tableView];
  [v16 edgeInsetsForTable:v17];
  __b[0] = v18;
  __b[1] = v19;
  __b[2] = v20;
  __b[3] = v21;

  id v22 = +[BFFStyle sharedStyle];
  id v23 = [(SetupChoiceController *)v115 view];
  [v22 horizontalMarginForView:v23];
  char v105 = 0;
  char v103 = 0;
  if (v24 * 2.0 - *(double *)&__b[1] - *(double *)&__b[3] >= 0.0)
  {
    id v106 = +[BFFStyle sharedStyle];
    char v105 = 1;
    id v104 = [(SetupChoiceController *)v115 view];
    char v103 = 1;
    [v106 horizontalMarginForView:];
    double v25 = v26 * 2.0 - *(double *)&__b[1] - *(double *)&__b[3];
  }
  else
  {
    double v25 = 0.0;
  }
  if (v103) {

  }
  if (v105) {
  char v101 = 0;
  }
  if (!v113)
  {
    v102 = [(BuddyTableViewController *)v115 tableView];
    char v101 = 1;
    [(UITableView *)v102 separatorInset];
  }
  if (v101) {

  }
  double v100 = v109.size.width - v25;
  [(UIButton *)v115->_primaryChoiceButton frame];
  rect.origin.y = v27;
  rect.origin.x = v28;
  rect.size.height = v29;
  rect.size.double width = v30;
  if (v115->_primaryChoiceButton)
  {
    id v31 = +[BFFStyle sharedStyle];
    id v32 = [(SetupChoiceController *)v115 view];
    [v31 sizeForContinueButtonInAncestor:v32];
    v98.double width = v33;
    v98.height = v34;
    rect.size = v98;

    UIRoundToViewScale();
    rect.origin.x = v35;
    id v36 = [(SetupChoiceController *)v115 view];
    id v37 = [v36 safeAreaLayoutGuide];
    [v37 layoutFrame];
    CGFloat v39 = v38 - v98.height - v111;
    char v96 = 0;
    char v94 = 0;
    if (v39 <= CGRectGetMaxY(v108) + 14.0)
    {
      double v41 = CGRectGetMaxY(v108) + 14.0;
    }
    else
    {
      id v97 = [(SetupChoiceController *)v115 view];
      char v96 = 1;
      id v95 = [v97 safeAreaLayoutGuide];
      char v94 = 1;
      [v95 layoutFrame];
      double v41 = v40 - v98.height - v111;
    }
    rect.origin.y = v41;
    if (v94) {

    }
    if (v96) {
    -[UIButton setFrame:](v115->_primaryChoiceButton, "setFrame:", rect.origin.x, rect.origin.y, v98);
    }
  }
  if (v115->_secondaryChoiceButton)
  {
    id v42 = [(UIButton *)v115->_secondaryChoiceButton titleLabel];
    sub_1000CC034();
    -[UILabel sizeThatFits:](v42, "sizeThatFits:", v43, v44);
    v93.size.double width = v45;
    v93.size.height = v46;

    if (v93.size.width >= v100) {
      double width = v100;
    }
    else {
      double width = v93.size.width;
    }
    v93.size.double width = width;
    UIRoundToViewScale();
    v93.origin.x = v48;
    id v49 = [(SetupChoiceController *)v115 view];
    id v50 = [v49 safeAreaLayoutGuide];
    [v50 layoutFrame];
    double v52 = v51;
    id v53 = [(UIButton *)v115->_secondaryChoiceButton titleLabel];
    [(UILabel *)v53 _firstLineBaselineOffsetFromBoundsTop];
    CGFloat v55 = v52 - v54 - v112;
    char v91 = 0;
    char v89 = 0;
    char v87 = 0;
    if (v55 <= CGRectGetMaxY(rect) + 4.0)
    {
      double v59 = CGRectGetMaxY(rect) + 4.0;
    }
    else
    {
      id v92 = [(SetupChoiceController *)v115 view];
      char v91 = 1;
      id v90 = [v92 safeAreaLayoutGuide];
      char v89 = 1;
      [v90 layoutFrame];
      double v57 = v56;
      v88 = [(UIButton *)v115->_secondaryChoiceButton titleLabel];
      char v87 = 1;
      [(UILabel *)v88 _firstLineBaselineOffsetFromBoundsTop];
      double v59 = v57 - v58 - v112;
    }
    v93.origin.y = v59;
    if (v87) {

    }
    if (v89) {
    if (v91)
    }

    -[UIButton setFrame:](v115->_secondaryChoiceButton, "setFrame:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
    double MaxY = CGRectGetMaxY(v93);
    if (MaxY > CGRectGetMaxY(v109))
    {
      v61 = [(BuddyTableViewController *)v115 headerView];
      id v62 = [(BFFPaneHeaderView *)v61 icon];

      if (v62)
      {
        v63 = [(BuddyTableViewController *)v115 headerView];
        id v64 = [(BFFPaneHeaderView *)v63 detailTextLabel];
        v65 = [(BuddyTableViewController *)v115 headerView];
        id v66 = [(BFFPaneHeaderView *)v65 detailTextLabel];
        id v67 = [v66 font];
        v68 = [(BuddyTableViewController *)v115 headerView];
        id v69 = [(BFFPaneHeaderView *)v68 detailTextLabel];
        id v70 = [v69 font];
        [v70 pointSize];
        id v72 = [v67 fontWithSize:v71 - 1.0];
        [v64 setFont:v72];

        v73 = [(BuddyTableViewController *)v115 headerView];
        [(BFFPaneHeaderView *)v73 setIcon:0];

        v74 = [(BuddyTableViewController *)v115 tableView];
        [(UITableView *)v74 reloadData];

        v75 = (UITableView *)[(SetupChoiceController *)v115 view];
        [(UITableView *)v75 setNeedsLayout];
      }
      else
      {
        v76 = [(BuddyTableViewController *)v115 tableView];
        [(UITableView *)v76 frame];
        uint64_t v83 = v77;
        uint64_t v82 = v78;
        double v85 = v79;
        double v84 = v80;

        double v81 = CGRectGetMaxY(v93);
        double v86 = v85 + v81 - CGRectGetMaxY(v109);
        v75 = [(BuddyTableViewController *)v115 tableView];
        -[UITableView setContentSize:](v75, "setContentSize:", v84, v86);
      }
    }
  }
}

- (void)setSelectedChoiceIndex:(unint64_t)a3
{
  id v4 = [(NSArray *)self->_choices objectAtIndexedSubscript:a3];
  [(SetupChoiceController *)self setSelectedChoice:v4];
}

- (void)setSelectedChoice:(id)a3
{
  CGFloat v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v15->_selectedChoice);
  id v4 = location[0];

  if (WeakRetained != v4)
  {
    char v13 = [(SetupChoiceController *)v15 wantsNextButton];
    id v5 = objc_loadWeakRetained((id *)&v15->_selectedChoice);

    if (v5 && (v13 & 1) != 0)
    {
      objc_super v6 = [(BuddyTableViewController *)v15 tableView];
      choices = v15->_choices;
      id v8 = objc_loadWeakRetained((id *)&v15->_selectedChoice);
      CGFloat v9 = +[NSIndexPath indexPathForRow:[(NSArray *)choices indexOfObject:v8] inSection:0];
      id v12 = [(UITableView *)v6 cellForRowAtIndexPath:v9];

      [v12 setAccessoryType:0];
      id v10 = [v12 textLabel];
      id v11 = +[UIColor _labelColor];
      [v10 setTextColor:v11];

      objc_storeStrong(&v12, 0);
    }
    objc_storeWeak((id *)&v15->_selectedChoice, location[0]);
    if (v13) {
      [(SetupChoiceController *)v15 _updateSelectedChoiceCheckmark];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)checkChoiceValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedChoice);

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)&self->_selectedChoice);
    [v3 runConfirmationIfNeeded:a2];
  }
  else
  {
    [(SetupChoiceController *)self controllerDone];
  }
}

- (void)choiceConfirmed:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SetupChoiceController *)v4 controllerDone];
  objc_storeStrong(location, 0);
}

- (void)choiceCancelled:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyTableViewController *)v8 tableView];
  choices = v8->_choices;
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_selectedChoice);
  objc_super v6 = +[NSIndexPath indexPathForRow:[(NSArray *)choices indexOfObject:WeakRetained] inSection:0];
  [(UITableView *)v3 deselectRowAtIndexPath:v6 animated:1];

  [(SetupChoiceController *)v8 setSelectedChoice:0];
  objc_storeStrong(location, 0);
}

- (void)controllerDone
{
  id v2 = [(SetupChoiceController *)self delegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedChoice);
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v2, "flowItemDone:nextItemClass:", self, [WeakRetained nextControllerClass]);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SetupChoiceController *)v6 _useTableLayout]) {
    NSUInteger v7 = [(NSArray *)v6->_choices count];
  }
  else {
    NSUInteger v7 = 0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  NSUInteger v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v5 = [location[0] textLabel];
  id v6 = -[NSArray objectAtIndexedSubscript:](v17->_choices, "objectAtIndexedSubscript:", [v15 row]);
  id v7 = [v6 localizedTitle];
  [v5 setText:v7];

  char v13 = 0;
  BOOL v8 = 0;
  if ([(SetupChoiceController *)v17 wantsNextButton])
  {
    id v9 = [v15 row];
    choices = v17->_choices;
    id WeakRetained = objc_loadWeakRetained((id *)&v17->_selectedChoice);
    char v13 = 1;
    BOOL v8 = v9 == (id)-[NSArray indexOfObject:](choices, "indexOfObject:");
  }
  if (v13) {

  }
  if (v8)
  {
    [location[0] setAccessoryType:3];
    id v11 = [location[0] textLabel];
    id v12 = +[UIColor tableCellBlueTextColor];
    [v11 setTextColor:v12];
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [v8 setSeparatorStyle:1];
  [v8 _setShouldHaveFullLengthTopSeparator:0];
  [v8 _setShouldHaveFullLengthBottomSeparator:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = [location[0] dequeueReusableCellWithIdentifier:@"CELL"];
  if (!v7)
  {
    id v7 = [[BuddySetupTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"CELL"];
  }
  [(SetupChoiceController *)v10 configureCell:v7 atIndexPath:v8];
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v5 = [(SetupChoiceController *)v16 tableView:location[0] cellForRowAtIndexPath:v14];
  [v5 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v7 = v6;
  id v8 = +[BFFStyle sharedStyle];
  [v8 tallRowHeight];
  double v10 = v9;

  if (v7 <= v10)
  {
    id v11 = +[BFFStyle sharedStyle];
    [v11 tallRowHeight];
    double v17 = v12;
  }
  else
  {
    double v17 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SetupChoiceController setSelectedChoiceIndex:](v7, "setSelectedChoiceIndex:", [v5 row]);
  if ([(SetupChoiceController *)v7 wantsNextButton]) {
    [location[0] deselectRowAtIndexPath:v5 animated:1];
  }
  else {
    [(SetupChoiceController *)v7 checkChoiceValid];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = v7->_serviceFooterView;
  objc_storeStrong(location, 0);
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v14->_serviceFooterView)
  {
    id v4 = [(BuddyTableViewController *)v14 tableView];
    [(UITableView *)v4 separatorInset];
    [(BuddyAppleIDTableHeaderView *)v14->_serviceFooterView setLeftPadding:v5];

    if ((BFFIsiPad() & 1) == 0)
    {
      double v6 = [(BuddyTableViewController *)v14 tableView];
      [(UITableView *)v6 separatorInset];
      [(BuddyAppleIDTableHeaderView *)v14->_serviceFooterView setRightPadding:v7];
    }
    serviceFooterView = v14->_serviceFooterView;
    [location[0] bounds];
    sub_1000CC034();
    -[BuddyAppleIDTableHeaderView sizeThatFits:](serviceFooterView, "sizeThatFits:", v9, v10);
    double v15 = v11;
  }
  else
  {
    double v15 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(location, 0);
  return v15;
}

- (id)viewForFooterInTableView:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v6->_learnMoreView;
  objc_storeStrong(location, 0);
  return v3;
}

- (double)heightForFooterInTableView:(id)a3
{
  double v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyTableViewController *)v12 tableView];
  [(UITableView *)v3 separatorInset];
  [(BuddyAppleIDLinkView *)v12->_learnMoreView setSidePadding:v4];

  if (v12->_learnMoreView)
  {
    learnMoreView = v12->_learnMoreView;
    [location[0] bounds];
    sub_1000CC034();
    -[BuddyAppleIDLinkView sizeThatFits:](learnMoreView, "sizeThatFits:", v6, v7);
    double v9 = v8 + 40.0;
  }
  else
  {
    double v9 = 0.0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (NSArray)choices
{
  return self->_choices;
}

- (SetupChoice)selectedChoice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedChoice);

  return (SetupChoice *)WeakRetained;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)choiceButtonsBottomInset
{
  return self->_choiceButtonsBottomInset;
}

- (void)setChoiceButtonsBottomInset:(double)a3
{
  self->_choiceButtonsBottomInset = a3;
}

- (UIButton)primaryChoiceButton
{
  return self->_primaryChoiceButton;
}

- (UIButton)secondaryChoiceButton
{
  return self->_secondaryChoiceButton;
}

- (void).cxx_destruct
{
}

@end