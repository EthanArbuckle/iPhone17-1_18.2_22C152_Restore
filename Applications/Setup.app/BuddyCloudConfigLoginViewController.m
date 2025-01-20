@interface BuddyCloudConfigLoginViewController
- (BOOL)disableExcessiveLayout;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BuddyCloudConfigController)configController;
- (BuddyCloudConfigLoginViewController)init;
- (MCProfileConnection)managedConfiguration;
- (NSError)lastError;
- (UIBarButtonItem)nextButton;
- (UITableViewCell)passwordCell;
- (UITableViewCell)usernameCell;
- (UITextField)activeTextField;
- (id)_sanitizedUsername:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_layoutTableView;
- (void)_setupForCloudConfigurationState;
- (void)_textChanged:(id)a3;
- (void)clearInput;
- (void)dealloc;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)retryLogin;
- (void)setActiveTextField:(id)a3;
- (void)setConfigController:(id)a3;
- (void)setDisableExcessiveLayout:(BOOL)a3;
- (void)setLastError:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setPasswordCell:(id)a3;
- (void)setUsernameCell:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BuddyCloudConfigLoginViewController

- (BuddyCloudConfigLoginViewController)init
{
  SEL v22 = a2;
  id location = 0;
  v21.receiver = self;
  v21.super_class = (Class)BuddyCloudConfigLoginViewController;
  id location = [(SetupChoiceController *)&v21 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = [location tableView];
    [v2 setScrollEnabled:1];

    id v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = +[NSBundle mainBundle];
    v5 = [(NSBundle *)v4 localizedStringForKey:@"NEXT" value:&stru_1002B4E18 table:@"Localizable"];
    id v6 = [v3 initWithTitle:v5 style:2 target:location action:"retryLogin"];
    v7 = (void *)*((void *)location + 22);
    *((void *)location + 22) = v6;

    [*((id *)location + 22) setEnabled:0];
    id v8 = [location navigationItem];
    [v8 setRightBarButtonItem:*((void *)location + 22)];

    id v9 = location;
    v10 = +[NSBundle mainBundle];
    v11 = [(NSBundle *)v10 localizedStringForKey:@"REMOTE_MANAGEMENT_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    [v9 setTitleText:v11];

    id v12 = [location headerView];
    v13 = +[UIImage systemImageNamed:@"gear"];
    [v12 setIcon:v13];

    id v14 = [location headerView];
    sub_1001D3718();
    [v14 setIconSize:v15, v16, *(void *)&v15, *(void *)&v16];

    v17 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v17 addObserver:location selector:"keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v18 addObserver:location selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
  }
  v19 = (BuddyCloudConfigLoginViewController *)location;
  objc_storeStrong(&location, 0);
  return v19;
}

- (void)dealloc
{
  id v6 = self;
  SEL v5 = a2;
  id v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v6 name:UIKeyboardDidShowNotification object:0];

  id v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:v6 name:UIKeyboardWillHideNotification object:0];

  v4.receiver = v6;
  v4.super_class = (Class)BuddyCloudConfigLoginViewController;
  [(BuddyCloudConfigLoginViewController *)&v4 dealloc];
}

- (void)clearInput
{
  id v2 = [(UITableViewCell *)self->_usernameCell editableTextField];
  [v2 setText:0];

  id v3 = [(UITableViewCell *)self->_passwordCell editableTextField];
  [v3 setText:0];

  [(BuddyCloudConfigLoginViewController *)self _textChanged:0];
}

- (void)keyboardDidShow:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id v3 = [location[0] userInfo];
  id v4 = [v3 valueForKey:UIKeyboardFrameEndUserInfoKey];
  [v4 getValue:__b];

  [(BuddyCloudConfigLoginViewController *)v19 setDisableExcessiveLayout:1];
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1001DA7C8;
  double v15 = &unk_1002B4A20;
  v16[0] = v19;
  v16[1] = (id)__b[0];
  v16[2] = (id)__b[1];
  v16[3] = (id)__b[2];
  v16[4] = (id)__b[3];
  SEL v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1001DA9C8;
  id v9 = &unk_1002B0EC0;
  v10 = v19;
  +[UIView animateWithDuration:&v11 animations:&v5 completion:0.3];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
}

- (void)keyboardWillHide:(id)a3
{
  int v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id v3 = [location[0] userInfo];
  id v4 = [v3 valueForKey:UIKeyboardFrameBeginUserInfoKey];
  [v4 getValue:__b];

  [(BuddyCloudConfigLoginViewController *)v13 setDisableExcessiveLayout:0];
  SEL v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1001DAB44;
  id v9 = &unk_1002B0D20;
  v10 = v13;
  +[UIView animateWithDuration:&v5 animations:0.3];
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (UITableViewCell)usernameCell
{
  int v12 = self;
  location[1] = (id)a2;
  if (!self->_usernameCell)
  {
    id v2 = [[BuddyTableViewCell alloc] initWithStyle:1000 reuseIdentifier:0];
    usernameCell = v12->_usernameCell;
    v12->_usernameCell = &v2->super;

    [(UITableViewCell *)v12->_usernameCell setSelectionStyle:0];
    id v4 = [(UITableViewCell *)v12->_usernameCell textLabel];
    SEL v5 = +[NSBundle mainBundle];
    int v6 = [(NSBundle *)v5 localizedStringForKey:@"CLOUD_CONFIG_LOGIN_USERNAME" value:&stru_1002B4E18 table:@"Localizable"];
    [(UILabel *)v4 setText:v6];

    location[0] = [(UITableViewCell *)v12->_usernameCell editableTextField];
    int v7 = +[NSBundle mainBundle];
    id v8 = [(NSBundle *)v7 localizedStringForKey:@"CLOUD_CONFIG_GENERIC_USERNAME" value:&stru_1002B4E18 table:@"Localizable"];
    [location[0] setPlaceholder:v8];

    [location[0] setAutocorrectionType:1];
    [location[0] setAutocapitalizationType:0];
    [location[0] setDelegate:v12];
    [location[0] setKeyboardType:7];
    [location[0] setEnablesReturnKeyAutomatically:1];
    objc_storeStrong(location, 0);
  }
  id v9 = v12->_usernameCell;

  return v9;
}

- (UITableViewCell)passwordCell
{
  int v12 = self;
  location[1] = (id)a2;
  if (!self->_passwordCell)
  {
    id v2 = [[BuddyTableViewCell alloc] initWithStyle:1000 reuseIdentifier:0];
    passwordCell = v12->_passwordCell;
    v12->_passwordCell = &v2->super;

    [(UITableViewCell *)v12->_passwordCell setSelectionStyle:0];
    id v4 = [(UITableViewCell *)v12->_passwordCell textLabel];
    SEL v5 = +[NSBundle mainBundle];
    int v6 = [(NSBundle *)v5 localizedStringForKey:@"PASSWORD_FIELD" value:&stru_1002B4E18 table:@"Localizable"];
    [(UILabel *)v4 setText:v6];

    location[0] = [(UITableViewCell *)v12->_passwordCell editableTextField];
    int v7 = +[NSBundle mainBundle];
    id v8 = [(NSBundle *)v7 localizedStringForKey:@"THIS_FIELD_REQUIRED" value:&stru_1002B4E18 table:@"Localizable"];
    [location[0] setPlaceholder:v8];

    [location[0] setSecureTextEntry:1];
    [location[0] setAutocorrectionType:1];
    [location[0] setAutocapitalizationType:0];
    [location[0] setDelegate:v12];
    [location[0] setEnablesReturnKeyAutomatically:1];
    objc_storeStrong(location, 0);
  }
  id v9 = v12->_passwordCell;

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  int v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyCloudConfigLoginViewController;
  [(BuddyCloudConfigLoginViewController *)&v3 viewWillAppear:a3];
  [(BuddyCloudConfigLoginViewController *)v6 _setupForCloudConfigurationState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  int v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyCloudConfigLoginViewController;
  [(BuddyCloudConfigLoginViewController *)&v4 viewWillDisappear:a3];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  int v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyCloudConfigLoginViewController;
  [(SetupChoiceController *)&v4 viewDidAppear:a3];
  objc_super v3 = [(BuddyCloudConfigLoginViewController *)v7 configController];
  [(BuddyCloudConfigController *)v3 removeControllersToRemove];
}

- (void)viewDidLayoutSubviews
{
  objc_super v4 = self;
  SEL v3 = a2;
  if (![(BuddyCloudConfigLoginViewController *)self disableExcessiveLayout])
  {
    v2.receiver = v4;
    v2.super_class = (Class)BuddyCloudConfigLoginViewController;
    [(SetupChoiceController *)&v2 viewDidLayoutSubviews];
    [(BuddyCloudConfigLoginViewController *)v4 _layoutTableView];
  }
}

- (void)_layoutTableView
{
  objc_super v2 = [(BuddyTableViewController *)self tableView];
  [(UITableView *)v2 sizeToFit];

  id v3 = [(BuddyCloudConfigLoginViewController *)self navigationController];
  id v4 = [v3 navigationBar];
  [v4 frame];

  BOOL v5 = [(BuddyTableViewController *)self tableView];
  [(UITableView *)v5 frame];

  sub_1001DB344(self);
  sub_1001D374C();
  double v12 = v6;
  double v11 = v7;
  double v14 = v8;
  double v13 = v9;
  v10 = [(BuddyTableViewController *)self tableView];
  -[UITableView setFrame:](v10, "setFrame:", v11, v12, v13, v14, *(void *)&v11, *(void *)&v12, *(void *)&v13, *(void *)&v14);
}

- (void)setLastError:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_lastError, location[0]);
  [(BuddyCloudConfigLoginViewController *)v4 _setupForCloudConfigurationState];
  objc_storeStrong(location, 0);
}

- (void)_setupForCloudConfigurationState
{
  v24 = self;
  v23[1] = (id)a2;
  objc_super v2 = [(BuddyCloudConfigLoginViewController *)self configController];
  unsigned int v3 = [(BuddyCloudConfigController *)v2 cloudConfigState];

  switch(v3)
  {
    case 6u:
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"Login"];
      id v4 = [(BuddyCloudConfigLoginViewController *)v24 lastError];
      BOOL v5 = [(NSError *)v4 userInfo];
      v23[0] = [(NSDictionary *)v5 objectForKeyedSubscript:kMCErrorLoginPromptKey];

      if ([v23[0] length])
      {
        id v6 = [objc_alloc((Class)NSAttributedString) initWithString:v23[0]];
        [(BuddyTableViewController *)v24 setAttributedSubTitleText:v6];
      }
      else
      {
        double v7 = [(BuddyCloudConfigLoginViewController *)v24 managedConfiguration];
        id v8 = [(MCProfileConnection *)v7 cloudConfigurationDetails];
        id location = [v8 objectForKeyedSubscript:kMCCCOrganizationNameKey];

        id v9 = objc_alloc((Class)NSAttributedString);
        v10 = +[NSBundle mainBundle];
        double v11 = [(NSBundle *)v10 localizedStringForKey:@"CLOUD_CONFIG_LOGIN_PROMPT_%@" value:&stru_1002B4E18 table:@"Localizable"];
        double v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, location);
        id v13 = [v9 initWithString:v12];
        [(BuddyTableViewController *)v24 setAttributedSubTitleText:v13];

        objc_storeStrong(&location, 0);
      }
      double v14 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v14 removeObserver:v24 name:UITextFieldTextDidChangeNotification object:0];

      double v15 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v15 addObserver:v24 selector:"_textChanged:" name:UITextFieldTextDidChangeNotification object:0];

      double v16 = [(BuddyCloudConfigLoginViewController *)v24 usernameCell];
      id v17 = [(UITableViewCell *)v16 editableTextField];
      id v18 = [v17 text];
      id v19 = [v18 length];

      if (v19) {
        v20 = [(BuddyCloudConfigLoginViewController *)v24 passwordCell];
      }
      else {
        v20 = [(BuddyCloudConfigLoginViewController *)v24 usernameCell];
      }
      id v21 = [(UITableViewCell *)v20 editableTextField];
      [v21 becomeFirstResponder];

      objc_storeStrong(v23, 0);
      break;
    case 7u:
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v24 identifier:@"Login"];
      break;
    default:
      return;
  }
}

- (void)_textChanged:(id)a3
{
  double v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v3 = [(BuddyCloudConfigLoginViewController *)v14 passwordCell];
  id v4 = [(UITableViewCell *)v3 editableTextField];
  id v5 = [v4 text];
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  BOOL v6 = 0;
  if ([v5 length])
  {
    double v12 = [(BuddyCloudConfigLoginViewController *)v14 usernameCell];
    char v11 = 1;
    id v10 = [(UITableViewCell *)v12 editableTextField];
    char v9 = 1;
    id v8 = [v10 text];
    char v7 = 1;
    BOOL v6 = [v8 length] != 0;
  }
  if (v7) {

  }
  if (v9) {
  if (v11)
  }

  if (v6) {
    [(UIBarButtonItem *)v14->_nextButton setEnabled:1];
  }
  else {
    [(UIBarButtonItem *)v14->_nextButton setEnabled:0];
  }
  objc_storeStrong(location, 0);
}

- (id)_sanitizedUsername:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  if (location[0])
  {
    id v3 = [location[0] stringByApplyingTransform:NSStringTransformToLatin reverse:0];
    id v4 = v10;
    id v10 = v3;

    if ((unint64_t)[v10 length] > 0xFF)
    {
      id v5 = [v10 substringToIndex:255];
      id v6 = v10;
      id v10 = v5;
    }
  }
  char v7 = (__CFString *)v10;
  if (!v10) {
    char v7 = &stru_1002B4E18;
  }
  id v8 = v7;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)retryLogin
{
  id v18 = self;
  SEL v17 = a2;
  objc_super v2 = [(BuddyCloudConfigLoginViewController *)self configController];
  [(BuddyCloudConfigController *)v2 setCloudConfigState:7];

  [(BuddyCloudConfigLoginViewController *)v18 _setupForCloudConfigurationState];
  id v3 = +[UIApplication sharedApplication];
  [(UIApplication *)v3 beginIgnoringInteractionEvents];

  id v4 = [(BuddyCloudConfigLoginViewController *)v18 usernameCell];
  id v5 = [(UITableViewCell *)v4 editableTextField];
  [v5 setEnabled:0];

  id v6 = [(BuddyCloudConfigLoginViewController *)v18 passwordCell];
  id v7 = [(UITableViewCell *)v6 editableTextField];
  [v7 setEnabled:0];

  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v18 identifier:@"Login"];
  double v16 = 2.0;
  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(2.0 * 1000000000.0));
  id v8 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  double v12 = sub_1001DBE7C;
  id v13 = &unk_1002B0D20;
  double v14 = v18;
  dispatch_after(v15, (dispatch_queue_t)v8, &block);

  objc_storeStrong((id *)&v14, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v5 = [v8 row];
  if (v5)
  {
    if (v5 == (id)1) {
      int v11 = [(BuddyCloudConfigLoginViewController *)v10 passwordCell];
    }
  }
  else
  {
    int v11 = [(BuddyCloudConfigLoginViewController *)v10 usernameCell];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  id v6 = v11;

  return v6;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyCloudConfigLoginViewController *)v4 setActiveTextField:location[0]];
  objc_storeStrong(location, 0);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyCloudConfigLoginViewController *)v4 setActiveTextField:0];
  objc_storeStrong(location, 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  dispatch_time_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v13 = 0;
  id v3 = location[0];
  id v4 = [(BuddyCloudConfigLoginViewController *)v15 usernameCell];
  id v5 = [(UITableViewCell *)v4 editableTextField];

  if (v3 == v5)
  {
    id v6 = [(UITableViewCell *)v15->_passwordCell editableTextField];
    [v6 becomeFirstResponder];
  }
  else
  {
    id v7 = location[0];
    id v8 = [(BuddyCloudConfigLoginViewController *)v15 passwordCell];
    id v9 = [(UITableViewCell *)v8 editableTextField];

    if (v7 == v9)
    {
      id v10 = [location[0] text];
      id v11 = [v10 length];

      if (v11)
      {
        char v13 = 1;
        [(BuddyCloudConfigLoginViewController *)v15 retryLogin];
      }
    }
  }
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (BuddyCloudConfigController)configController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configController);

  return (BuddyCloudConfigController *)WeakRetained;
}

- (void)setConfigController:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setUsernameCell:(id)a3
{
}

- (void)setPasswordCell:(id)a3
{
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (UITextField)activeTextField
{
  return self->_activeTextField;
}

- (void)setActiveTextField:(id)a3
{
}

- (BOOL)disableExcessiveLayout
{
  return self->_disableExcessiveLayout;
}

- (void)setDisableExcessiveLayout:(BOOL)a3
{
  self->_disableExcessiveLayout = a3;
}

- (void).cxx_destruct
{
}

@end