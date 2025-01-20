@interface CBAlternateNetworkViewController
- (BOOL)_canAttemptJoin;
- (BOOL)_networkNameIsValid;
- (BOOL)_passwordIsValid;
- (BOOL)joining;
- (BOOL)otherNetworkViewActive;
- (CBAlternateNetworkViewController)initWithScanResult:(id)a3;
- (CBAlternateNetworkViewController)initWithScanResult:(id)a3 prepopulatedPassword:(id)a4;
- (CBAlternateNetworkViewController)initWithScanResult:(id)a3 prepopulatedPassword:(id)a4 prepopulatedSSID:(id)a5;
- (CWFScanResult)scanResult;
- (NSArray)currentSecurityGroup;
- (NSArray)hiddenNetworkWithNoPasswordGroup;
- (NSArray)hiddenNetworkWithPasswordGroup;
- (NSNumber)networkRequiresPassword;
- (NSString)networkName;
- (NSString)networkPassword;
- (NSTimer)joinTimer;
- (PSEditableTableCell)networkNameCell;
- (PSEditableTableCell)passwordCell;
- (UITextField)currentlyActiveTextField;
- (id)_groupSeparatorSpecifier;
- (id)_networkNameSpecifier;
- (id)_passwordSpecifier;
- (id)_securitySpecifier;
- (id)name;
- (id)password;
- (id)requiresPassword;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)indexToSelect;
- (unint64_t)retryJoinAttemptCount;
- (void)_checkoutAndPostAssociationCompletedNotificationWithError:(id)a3;
- (void)_cleanUp;
- (void)_deregisterNotifications;
- (void)_enableLeftBarButtonItem:(BOOL)a3;
- (void)_enableRightBarButtonItem:(BOOL)a3;
- (void)_enableUI:(BOOL)a3;
- (void)_handleAssociationEvent:(id)a3;
- (void)_joinTapped;
- (void)_keyboardWillPresent:(id)a3;
- (void)_networkJoinRetryTimerFired:(id)a3;
- (void)_presentFailedAssociationAlertWithTitle:(id)a3 message:(id)a4;
- (void)_registerForNotifications;
- (void)_returnKeyTapped:(id)a3;
- (void)_setReturnKeyEnabled:(BOOL)a3;
- (void)_setupNavBar;
- (void)_updateReturnKey;
- (void)cancelTapped:(id)a3;
- (void)dealloc;
- (void)joinTapped:(id)a3;
- (void)setCurrentSecurityGroup:(id)a3;
- (void)setCurrentlyActiveTextField:(id)a3;
- (void)setHiddenNetworkWithNoPasswordGroup:(id)a3;
- (void)setHiddenNetworkWithPasswordGroup:(id)a3;
- (void)setIndexToSelect:(int64_t)a3;
- (void)setJoinTimer:(id)a3;
- (void)setJoining:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setNetworkNameCell:(id)a3;
- (void)setNetworkPassword:(id)a3;
- (void)setNetworkRequiresPassword:(id)a3;
- (void)setOtherNetworkViewActive:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordCell:(id)a3;
- (void)setRequiresPassword:(id)a3;
- (void)setRetryJoinAttemptCount:(unint64_t)a3;
- (void)setScanResult:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CBAlternateNetworkViewController

- (CBAlternateNetworkViewController)initWithScanResult:(id)a3
{
  return [(CBAlternateNetworkViewController *)self initWithScanResult:a3 prepopulatedPassword:0 prepopulatedSSID:0];
}

- (CBAlternateNetworkViewController)initWithScanResult:(id)a3 prepopulatedPassword:(id)a4
{
  return [(CBAlternateNetworkViewController *)self initWithScanResult:a3 prepopulatedPassword:a4 prepopulatedSSID:0];
}

- (CBAlternateNetworkViewController)initWithScanResult:(id)a3 prepopulatedPassword:(id)a4 prepopulatedSSID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CBAlternateNetworkViewController;
  v12 = [(CBAlternateNetworkViewController *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_otherNetworkViewActive = v9 == 0;
    if (v9)
    {
      uint64_t v14 = [v9 networkName];
      networkName = v13->_networkName;
      v13->_networkName = (NSString *)v14;

      objc_storeStrong((id *)&v13->_scanResult, a3);
    }
    if (v11 && !v13->_networkName) {
      objc_storeStrong((id *)&v13->_networkName, a5);
    }
    if (v10) {
      objc_storeStrong((id *)&v13->_networkPassword, a4);
    }
    v13->_joining = 0;
    v13->_retryJoinAttemptCount = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Alternate Network pane loaded", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CBAlternateNetworkViewController;
  [(CBAlternateNetworkViewController *)&v4 viewDidLoad];
  [(CBAlternateNetworkViewController *)self _setupNavBar];
}

- (void)_setupNavBar
{
  unsigned int v5 = [(CBAlternateNetworkViewController *)self otherNetworkViewActive];
  char v6 = v5;
  if (v5)
  {
    v7 = +[NSBundle mainBundle];
    [v7 localizedStringForKey:@"OTHER_NETWORK_PROMPT" value:&stru_10007A9F8 table:0];
  }
  else
  {
    v7 = +[NSBundle mainBundle];
    uint64_t v2 = [v7 localizedStringForKey:@"ENCRYPTED_NETWORK_PROMPT" value:&stru_10007A9F8 table:0];
    v3 = [(CBAlternateNetworkViewController *)self networkName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v3);
  v8 = };
  id v9 = [(CBAlternateNetworkViewController *)self navigationItem];
  [v9 setPrompt:v8];

  if ((v6 & 1) == 0)
  {

    v8 = (void *)v2;
  }

  unsigned int v10 = [(CBAlternateNetworkViewController *)self otherNetworkViewActive];
  id v11 = +[NSBundle mainBundle];
  v12 = v11;
  if (v10) {
    CFStringRef v13 = @"OTHER_NETWORK_TITLE";
  }
  else {
    CFStringRef v13 = @"ENCRYPTED_NETWORK_TITLE";
  }
  uint64_t v14 = [v11 localizedStringForKey:v13 value:&stru_10007A9F8 table:0];
  v15 = [(CBAlternateNetworkViewController *)self navigationItem];
  [v15 setTitle:v14];

  id v22 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelTapped:"];
  id v16 = objc_alloc((Class)UIBarButtonItem);
  objc_super v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"JOIN" value:&stru_10007A9F8 table:0];
  id v19 = [v16 initWithTitle:v18 style:2 target:self action:"joinTapped:"];

  v20 = [(CBAlternateNetworkViewController *)self navigationItem];
  [v20 setLeftBarButtonItem:v22];

  v21 = [(CBAlternateNetworkViewController *)self navigationItem];
  [v21 setRightBarButtonItem:v19];

  [(CBAlternateNetworkViewController *)self _enableRightBarButtonItem:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Alternate Network pane will appear", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)CBAlternateNetworkViewController;
  [(CBAlternateNetworkViewController *)&v22 viewWillAppear:v3];
  [(CBAlternateNetworkViewController *)self _registerForNotifications];
  char v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"PASSWORD" value:&stru_10007A9F8 table:0];
  [(CBAlternateNetworkViewController *)self setIndexToSelect:[(CBAlternateNetworkViewController *)self indexOfSpecifierID:v7]];

  v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v9 = [(CBAlternateNetworkViewController *)self indexToSelect];
    *(_DWORD *)buf = 134217984;
    int64_t v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Index to be selected %ld", buf, 0xCu);
  }

  if ([(CBAlternateNetworkViewController *)self indexToSelect] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"OTHER_NETWORK_NAME" value:&stru_10007A9F8 table:0];
    [(CBAlternateNetworkViewController *)self setIndexToSelect:[(CBAlternateNetworkViewController *)self indexOfSpecifierID:v11]];

    v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = [(CBAlternateNetworkViewController *)self indexToSelect];
      *(_DWORD *)buf = 134217984;
      int64_t v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not found. New index to be selected %ld", buf, 0xCu);
    }

    uint64_t v14 = [(CBAlternateNetworkViewController *)self networkNameCell];
  }
  else
  {
    uint64_t v14 = [(CBAlternateNetworkViewController *)self passwordCell];
  }
  v15 = v14;
  id v16 = [v14 textField];
  [(CBAlternateNetworkViewController *)self setCurrentlyActiveTextField:v16];

  objc_super v17 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__table];
  v18 = [(CBAlternateNetworkViewController *)self indexPathForIndex:[(CBAlternateNetworkViewController *)self indexToSelect]];
  id v19 = [v17 cellForRowAtIndexPath:v18];
  [v19 becomeFirstResponder];

  [(CBAlternateNetworkViewController *)self _updateReturnKey];
  v20 = [(CBAlternateNetworkViewController *)self networkPassword];

  if (v20)
  {
    [(CBAlternateNetworkViewController *)self setRequiresPassword:&__kCFBooleanTrue];
    v21 = [(CBAlternateNetworkViewController *)self networkPassword];
    [(CBAlternateNetworkViewController *)self setPassword:v21];
  }
}

- (void)_registerForNotifications
{
  [(CBAlternateNetworkViewController *)self _deregisterNotifications];
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for keyboard and Wi-Fi notifications…", v8, 2u);
  }

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_keyboardWillPresent:" name:UIKeyboardWillShowNotification object:0];

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_returnKeyTapped:" name:UIKeyboardReturnKeyPressed object:0];

  char v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handleAssociationEvent:" name:@"CBWiFiManagerDidAssociateToOpenNetworkNotification" object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_handleAssociationEvent:" name:@"CBWiFiManagerDidAssociateToEncryptedNetworkNotification" object:0];
}

- (void)_deregisterNotifications
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deregistering keyboard and Wi-Fi notifications…", v8, 2u);
  }

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardReturnKeyPressed object:0];

  char v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:@"CBWiFiManagerDidAssociateToOpenNetworkNotification" object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:@"CBWiFiManagerDidAssociateToEncryptedNetworkNotification" object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Alternate Network pane will disappear", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)CBAlternateNetworkViewController;
  [(CBAlternateNetworkViewController *)&v6 viewWillDisappear:v3];
  [(CBAlternateNetworkViewController *)self _cleanUp];
}

- (void)dealloc
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  [(CBAlternateNetworkViewController *)self _cleanUp];
  v4.receiver = self;
  v4.super_class = (Class)CBAlternateNetworkViewController;
  [(CBAlternateNetworkViewController *)&v4 dealloc];
}

- (void)_cleanUp
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up Alternate View Controller…", buf, 2u);
  }

  objc_super v4 = [(CBAlternateNetworkViewController *)self joinTimer];

  if (v4)
  {
    unsigned int v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating join timer…", v13, 2u);
    }

    objc_super v6 = [(CBAlternateNetworkViewController *)self joinTimer];
    [v6 invalidate];

    [(CBAlternateNetworkViewController *)self setJoinTimer:0];
  }
  uint64_t v7 = OBJC_IVAR___PSListController__specifiers;
  if ([*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count])
  {
    unint64_t v8 = 0;
    uint64_t v9 = PSTableCellKey;
    do
    {
      unsigned int v10 = [*(id *)&self->PSListController_opaque[v7] objectAtIndex:v8];
      id v11 = [v10 propertyForKey:v9];
      v12 = v11;
      if (v11)
      {
        [v11 setCellTarget:0];
        [v12 setCellAction:0];
      }

      ++v8;
    }
    while (v8 < (unint64_t)[*(id *)&self->PSListController_opaque[v7] count]);
  }
  [(CBAlternateNetworkViewController *)self loseFocus];
  [(CBAlternateNetworkViewController *)self _deregisterNotifications];
}

- (void)_keyboardWillPresent:(id)a3
{
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Keyboard will be presented…", v5, 2u);
  }

  [(CBAlternateNetworkViewController *)self _setReturnKeyEnabled:0];
}

- (void)_returnKeyTapped:(id)a3
{
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Return key tapped before main thread", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035C38;
  block[3] = &unk_1000794E0;
  block[4] = self;
  unsigned int v5 = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleAssociationEvent:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035F20;
  v4[3] = &unk_1000795E0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_networkJoinRetryTimerFired:(id)a3
{
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Network Join Retry timeout fired…", buf, 2u);
  }

  id v5 = [(CBAlternateNetworkViewController *)self joinTimer];

  if (v5)
  {
    objc_super v6 = [(CBAlternateNetworkViewController *)self joinTimer];
    [v6 invalidate];

    [(CBAlternateNetworkViewController *)self setJoinTimer:0];
  }
  if ([(CBAlternateNetworkViewController *)self retryJoinAttemptCount] > 4)
  {
    uint64_t v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000497A0(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    objc_super v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"FAILED_NETWORK_PROMPT" value:&stru_10007A9F8 table:0];
    id v19 = [(CBAlternateNetworkViewController *)self networkName];
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
    v21 = [(CBAlternateNetworkViewController *)self navigationItem];
    [v21 setPrompt:v20];

    [(CBAlternateNetworkViewController *)self _enableUI:1];
    objc_super v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"UNABLE_TO_JOIN_TITLE" value:&stru_10007A9F8 table:0];
    int64_t v24 = [(CBAlternateNetworkViewController *)self networkName];
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24);
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"TRY_AGAIN_MESSAGE" value:&stru_10007A9F8 table:0];
    [(CBAlternateNetworkViewController *)self _presentFailedAssociationAlertWithTitle:v25 message:v27];
  }
  else
  {
    [(CBAlternateNetworkViewController *)self setRetryJoinAttemptCount:(char *)[(CBAlternateNetworkViewController *)self retryJoinAttemptCount] + 1];
    uint64_t v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = [(CBAlternateNetworkViewController *)self retryJoinAttemptCount];
      *(_DWORD *)buf = 134217984;
      unint64_t v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Join Retry Attempt [#%lu]", buf, 0xCu);
    }

    [(CBAlternateNetworkViewController *)self _joinTapped];
  }
}

- (void)cancelTapped:(id)a3
{
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancel tapped", v6, 2u);
  }

  id v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"Wifi", [&off_10007CDE0 integerValue], 0);
  [(CBAlternateNetworkViewController *)self _checkoutAndPostAssociationCompletedNotificationWithError:v5];
}

- (void)joinTapped:(id)a3
{
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Joined tapped", v5, 2u);
  }

  [(CBAlternateNetworkViewController *)self setRetryJoinAttemptCount:0];
  [(CBAlternateNetworkViewController *)self _joinTapped];
}

- (void)_joinTapped
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Preparing to join network…", buf, 2u);
  }

  if (![(CBAlternateNetworkViewController *)self joining])
  {
    [(CBAlternateNetworkViewController *)self setJoining:1];
    id v5 = +[NSBundle mainBundle];
    objc_super v6 = [v5 localizedStringForKey:@"JOINING_NETWORK_PROMPT" value:&stru_10007A9F8 table:0];
    uint64_t v7 = [(CBAlternateNetworkViewController *)self networkName];
    unint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
    uint64_t v9 = [(CBAlternateNetworkViewController *)self navigationItem];
    [v9 setPrompt:v8];

    [(CBAlternateNetworkViewController *)self _enableUI:0];
    uint64_t v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dismissing the keyboard…", v22, 2u);
    }

    uint64_t v11 = [(CBAlternateNetworkViewController *)self currentlyActiveTextField];
    [v11 resignFirstResponder];

    objc_super v4 = +[CBWiFiManager sharedInstance];
    if ([(CBAlternateNetworkViewController *)self otherNetworkViewActive])
    {
      uint64_t v12 = [(CBAlternateNetworkViewController *)self networkRequiresPassword];
      unsigned __int8 v13 = [v12 BOOLValue];

      uint64_t v14 = CheckerBoardLogHandleForCategory();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if ((v13 & 1) == 0)
      {
        if (v15)
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Network is [non-]hidden and open", v21, 2u);
        }

        uint64_t v16 = [(CBAlternateNetworkViewController *)self networkName];
        [v4 associateToHiddenUnencryptedNetworkWithName:v16];
        goto LABEL_20;
      }
      if (v15)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Network is [non-]hidden and encrypted", v20, 2u);
      }

      uint64_t v16 = [(CBAlternateNetworkViewController *)self networkName];
      objc_super v17 = [(CBAlternateNetworkViewController *)self networkPassword];
      [v4 associateToHiddenEncryptedNetworkWithName:v16 password:v17];
    }
    else
    {
      v18 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Network is non-hidden and encrypted", v19, 2u);
      }

      uint64_t v16 = [(CBAlternateNetworkViewController *)self scanResult];
      objc_super v17 = [(CBAlternateNetworkViewController *)self networkPassword];
      [v4 associateToEncryptedNetworkWithScanResult:v16 password:v17];
    }

LABEL_20:
    goto LABEL_21;
  }
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "We are already in the middle of an association…", v23, 2u);
  }
LABEL_21:
}

- (void)textFieldDidChange:(id)a3
{
  [(CBAlternateNetworkViewController *)self setCurrentlyActiveTextField:a3];

  [(CBAlternateNetworkViewController *)self _updateReturnKey];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    if ([(CBAlternateNetworkViewController *)self otherNetworkViewActive])
    {
      objc_super v4 = [(CBAlternateNetworkViewController *)self _securitySpecifier];
      objc_super v22 = v4;
      id v5 = +[NSArray arrayWithObjects:&v22 count:1];
      [(CBAlternateNetworkViewController *)self setHiddenNetworkWithNoPasswordGroup:v5];

      objc_super v6 = [(CBAlternateNetworkViewController *)self _securitySpecifier];
      v21[0] = v6;
      uint64_t v7 = [(CBAlternateNetworkViewController *)self _passwordSpecifier];
      v21[1] = v7;
      unint64_t v8 = +[NSArray arrayWithObjects:v21 count:2];
      [(CBAlternateNetworkViewController *)self setHiddenNetworkWithPasswordGroup:v8];

      uint64_t v9 = [(CBAlternateNetworkViewController *)self hiddenNetworkWithNoPasswordGroup];
      [(CBAlternateNetworkViewController *)self setCurrentSecurityGroup:v9];

      uint64_t v10 = [(CBAlternateNetworkViewController *)self _networkNameSpecifier];
      v20[0] = v10;
      uint64_t v11 = [(CBAlternateNetworkViewController *)self _groupSeparatorSpecifier];
      v20[1] = v11;
      uint64_t v12 = +[NSArray arrayWithObjects:v20 count:2];
      unsigned __int8 v13 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v12;

      uint64_t v14 = [(CBAlternateNetworkViewController *)self currentSecurityGroup];
      [(CBAlternateNetworkViewController *)self addSpecifiersFromArray:v14];
    }
    else
    {
      uint64_t v14 = [(CBAlternateNetworkViewController *)self _passwordSpecifier];
      id v19 = v14;
      uint64_t v15 = +[NSArray arrayWithObjects:&v19 count:1];
      uint64_t v16 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v15;
    }
  }
  objc_super v17 = *(void **)&self->PSListController_opaque[v3];

  return v17;
}

- (id)_networkNameSpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"OTHER_NETWORK_NAME" value:&stru_10007A9F8 table:0];
  id v5 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v4 target:self set:"setName:" get:"name" detail:0 cell:8 edit:0];

  objc_super v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"OTHER_NETWORK_PLACEHOLDER" value:&stru_10007A9F8 table:0];
  [v5 setPlaceholder:v7];

  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v5;
}

- (id)_groupSeparatorSpecifier
{
  return +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
}

- (id)_securitySpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"PASSWORD_REQUIRED" value:&stru_10007A9F8 table:0];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setRequiresPassword:" get:"requiresPassword" detail:0 cell:6 edit:0];

  return v5;
}

- (id)_passwordSpecifier
{
  uint64_t v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"PASSWORD" value:&stru_10007A9F8 table:0];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setPassword:" get:"password" detail:0 cell:12 edit:0];

  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v5;
}

- (void)setName:(id)a3
{
}

- (id)name
{
  uint64_t v2 = [(CBAlternateNetworkViewController *)self networkName];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_10007A9F8;
  }
  objc_super v4 = v2;

  return v4;
}

- (void)setRequiresPassword:(id)a3
{
  [(CBAlternateNetworkViewController *)self setNetworkRequiresPassword:a3];
  objc_super v4 = [(CBAlternateNetworkViewController *)self networkRequiresPassword];
  unsigned int v5 = [v4 BOOLValue];

  objc_super v6 = [(CBAlternateNetworkViewController *)self currentSecurityGroup];
  [(CBAlternateNetworkViewController *)self removeContiguousSpecifiers:v6];

  if (v5)
  {
    uint64_t v7 = [(CBAlternateNetworkViewController *)self hiddenNetworkWithPasswordGroup];
    [(CBAlternateNetworkViewController *)self addSpecifiersFromArray:v7];

    id v10 = [(CBAlternateNetworkViewController *)self hiddenNetworkWithPasswordGroup];
    [(CBAlternateNetworkViewController *)self setCurrentSecurityGroup:v10];
  }
  else
  {
    unint64_t v8 = [(CBAlternateNetworkViewController *)self hiddenNetworkWithNoPasswordGroup];
    [(CBAlternateNetworkViewController *)self addSpecifiersFromArray:v8];

    uint64_t v9 = [(CBAlternateNetworkViewController *)self hiddenNetworkWithNoPasswordGroup];
    [(CBAlternateNetworkViewController *)self setCurrentSecurityGroup:v9];

    [(CBAlternateNetworkViewController *)self setNetworkPassword:0];
  }
}

- (id)requiresPassword
{
  uint64_t v2 = [(CBAlternateNetworkViewController *)self networkRequiresPassword];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &off_10007CDF8;
  }
  objc_super v4 = v2;

  return v4;
}

- (void)setPassword:(id)a3
{
}

- (id)password
{
  uint64_t v2 = [(CBAlternateNetworkViewController *)self networkPassword];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = &stru_10007A9F8;
  }
  objc_super v4 = v2;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)CBAlternateNetworkViewController;
  id v6 = a4;
  uint64_t v7 = [(CBAlternateNetworkViewController *)&v21 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[CBAlternateNetworkViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v21.receiver, v21.super_class);

  uint64_t v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v7 textField];
    uint64_t v11 = v10;
    if (v10) {
      [v10 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];
    }
    uint64_t v12 = [v9 identifier];
    unsigned __int8 v13 = +[NSBundle mainBundle];
    uint64_t v14 = [v13 localizedStringForKey:@"OTHER_NETWORK_NAME" value:&stru_10007A9F8 table:0];
    unsigned int v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      [(CBAlternateNetworkViewController *)self setNetworkNameCell:v7];
      uint64_t v16 = 32;
    }
    else
    {
      objc_super v17 = +[NSBundle mainBundle];
      v18 = [v17 localizedStringForKey:@"PASSWORD" value:&stru_10007A9F8 table:0];
      unsigned int v19 = [v12 isEqualToString:v18];

      if (!v19)
      {
LABEL_9:

        goto LABEL_10;
      }
      [(CBAlternateNetworkViewController *)self setPasswordCell:v7];
      uint64_t v16 = 100;
    }
    [v11 setAutocorrectionType:1];
    [v11 setAutocapitalizationType:0];
    [v7 setCharacterLimit:v16];
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (void)_enableLeftBarButtonItem:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"disabled";
    if (v3) {
      CFStringRef v6 = @"enabled";
    }
    int v9 = 138412290;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Left bar button is %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [(CBAlternateNetworkViewController *)self navigationItem];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];
}

- (void)_enableRightBarButtonItem:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"disabled";
    if (v3) {
      CFStringRef v6 = @"enabled";
    }
    int v9 = 138412290;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Right bar button is %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [(CBAlternateNetworkViewController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v3];
}

- (void)_setReturnKeyEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling return key %d", (uint8_t *)v6, 8u);
  }

  unsigned int v5 = +[UIKeyboard activeKeyboard];
  [v5 setReturnKeyEnabled:v3];
}

- (void)_enableUI:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling UI (%d)", (uint8_t *)v8, 8u);
  }

  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] setUserInteractionEnabled:v3];
  [(CBAlternateNetworkViewController *)self _enableLeftBarButtonItem:v3];
  if (v3)
  {
    [(CBAlternateNetworkViewController *)self _updateReturnKey];
    CFStringRef v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "I'm bringing keyboard back", (uint8_t *)v8, 2u);
    }

    uint64_t v7 = [(CBAlternateNetworkViewController *)self currentlyActiveTextField];
    [v7 becomeFirstResponder];
  }
  else
  {
    [(CBAlternateNetworkViewController *)self _enableRightBarButtonItem:0];
    [(CBAlternateNetworkViewController *)self _setReturnKeyEnabled:0];
  }
}

- (void)_updateReturnKey
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating [Return] key…", v20, 2u);
  }

  objc_super v4 = [(CBAlternateNetworkViewController *)self networkNameCell];
  unsigned int v5 = [v4 textField];

  CFStringRef v6 = [(CBAlternateNetworkViewController *)self passwordCell];
  uint64_t v7 = [v6 textField];

  if (v5)
  {
    id v8 = [v5 text];
    [(CBAlternateNetworkViewController *)self setName:v8];
  }
  if (v7)
  {
    int v9 = [v7 text];
    [(CBAlternateNetworkViewController *)self setPassword:v9];
  }
  BOOL v10 = [(CBAlternateNetworkViewController *)self _canAttemptJoin];
  if ([(CBAlternateNetworkViewController *)self otherNetworkViewActive])
  {
    uint64_t v11 = [(CBAlternateNetworkViewController *)self networkName];
    if ([v11 length])
    {
      uint64_t v12 = [(CBAlternateNetworkViewController *)self currentlyActiveTextField];
      unsigned __int8 v13 = [v12 textInputTraits];
      if ([v13 returnKeyType])
      {
        uint64_t v14 = [(CBAlternateNetworkViewController *)self scanResult];
        if ([v14 isSecure]) {
          unsigned int v15 = [(CBAlternateNetworkViewController *)self _passwordIsValid];
        }
        else {
          unsigned int v15 = 1;
        }
      }
      else
      {
        unsigned int v15 = 1;
      }
    }
    else
    {
      unsigned int v15 = 0;
    }
  }
  else
  {
    unsigned int v15 = [(CBAlternateNetworkViewController *)self _passwordIsValid];
  }
  [(CBAlternateNetworkViewController *)self _enableRightBarButtonItem:v10];
  [(CBAlternateNetworkViewController *)self _setReturnKeyEnabled:v10 | v15];
  uint64_t v16 = [v5 textInputTraits];
  objc_super v17 = [(CBAlternateNetworkViewController *)self scanResult];
  if ([v17 isSecure]) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = 3;
  }
  [v16 setReturnKeyType:v18];

  unsigned int v19 = [v7 textInputTraits];
  [v19 setReturnKeyType:3];
}

- (void)_presentFailedAssociationAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting failed association alert", v13, 2u);
  }

  int v9 = +[UIAlertController alertControllerWithTitle:v7 message:v6 preferredStyle:1];

  BOOL v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 localizedStringForKey:@"DISMISS" value:&stru_10007A9F8 table:0];
  uint64_t v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];
  [v9 addAction:v12];

  [(CBAlternateNetworkViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_checkoutAndPostAssociationCompletedNotificationWithError:(id)a3
{
  id v3 = a3;
  objc_super v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking out Alternate Network View Controller…", v8, 2u);
  }

  unsigned int v5 = +[NSMutableDictionary dictionary];
  id v6 = v5;
  if (v3) {
    [v5 setObject:v3 forKeyedSubscript:@"CBWiFiManagerErrorKey"];
  }
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"CBWiFiNetworkAssociationCompletedNotification" object:0 userInfo:v6];
}

- (BOOL)_canAttemptJoin
{
  if ([(CBAlternateNetworkViewController *)self otherNetworkViewActive])
  {
    if ([(CBAlternateNetworkViewController *)self _networkNameIsValid])
    {
      id v3 = [(CBAlternateNetworkViewController *)self scanResult];
      if ([v3 isSecure]) {
        BOOL v4 = [(CBAlternateNetworkViewController *)self _passwordIsValid];
      }
      else {
        BOOL v4 = 1;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = [(CBAlternateNetworkViewController *)self _passwordIsValid];
  }
  unsigned int v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Allowing join %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (BOOL)_networkNameIsValid
{
  uint64_t v2 = [(CBAlternateNetworkViewController *)self networkName];
  id v3 = [v2 length];

  BOOL v4 = CheckerBoardLogHandleForCategory();
  unint64_t v5 = (unint64_t)v3 - 1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5 < 0x20;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Network name is valid %d", (uint8_t *)v7, 8u);
  }

  return v5 < 0x20;
}

- (BOOL)_passwordIsValid
{
  id v3 = [(CBAlternateNetworkViewController *)self networkPassword];
  BOOL v4 = [(CBAlternateNetworkViewController *)self networkPassword];
  unint64_t v5 = (char *)[v4 length];

  id v6 = +[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
  id v7 = [v6 invertedSet];

  id v8 = [v3 rangeOfCharacterFromSet:v7];
  int v9 = [(CBAlternateNetworkViewController *)self scanResult];
  if ([v9 isWPA])
  {

LABEL_4:
    BOOL v13 = v5 == (char *)64 && v8 == (id)0x7FFFFFFFFFFFFFFFLL;
    BOOL v14 = (unint64_t)(v5 - 8) < 0x38 || v13;
    goto LABEL_14;
  }
  BOOL v10 = [(CBAlternateNetworkViewController *)self scanResult];
  unsigned int v11 = [v10 isWPA2];

  if (v11) {
    goto LABEL_4;
  }
  BOOL v14 = v5 != 0;
LABEL_14:
  unsigned int v15 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Password is valid %d", (uint8_t *)v17, 8u);
  }

  return v14;
}

- (BOOL)otherNetworkViewActive
{
  return self->_otherNetworkViewActive;
}

- (void)setOtherNetworkViewActive:(BOOL)a3
{
  self->_otherNetworkViewActive = a3;
}

- (NSArray)hiddenNetworkWithNoPasswordGroup
{
  return self->_hiddenNetworkWithNoPasswordGroup;
}

- (void)setHiddenNetworkWithNoPasswordGroup:(id)a3
{
}

- (NSArray)hiddenNetworkWithPasswordGroup
{
  return self->_hiddenNetworkWithPasswordGroup;
}

- (void)setHiddenNetworkWithPasswordGroup:(id)a3
{
}

- (NSArray)currentSecurityGroup
{
  return self->_currentSecurityGroup;
}

- (void)setCurrentSecurityGroup:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSNumber)networkRequiresPassword
{
  return self->_networkRequiresPassword;
}

- (void)setNetworkRequiresPassword:(id)a3
{
}

- (NSString)networkPassword
{
  return self->_networkPassword;
}

- (void)setNetworkPassword:(id)a3
{
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
}

- (UITextField)currentlyActiveTextField
{
  return self->_currentlyActiveTextField;
}

- (void)setCurrentlyActiveTextField:(id)a3
{
}

- (PSEditableTableCell)networkNameCell
{
  return self->_networkNameCell;
}

- (void)setNetworkNameCell:(id)a3
{
}

- (PSEditableTableCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
}

- (int64_t)indexToSelect
{
  return self->_indexToSelect;
}

- (void)setIndexToSelect:(int64_t)a3
{
  self->_indexToSelect = a3;
}

- (BOOL)joining
{
  return self->_joining;
}

- (void)setJoining:(BOOL)a3
{
  self->_joining = a3;
}

- (unint64_t)retryJoinAttemptCount
{
  return self->_retryJoinAttemptCount;
}

- (void)setRetryJoinAttemptCount:(unint64_t)a3
{
  self->_retryJoinAttemptCount = a3;
}

- (NSTimer)joinTimer
{
  return self->_joinTimer;
}

- (void)setJoinTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinTimer, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_networkNameCell, 0);
  objc_storeStrong((id *)&self->_currentlyActiveTextField, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong((id *)&self->_networkPassword, 0);
  objc_storeStrong((id *)&self->_networkRequiresPassword, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_currentSecurityGroup, 0);
  objc_storeStrong((id *)&self->_hiddenNetworkWithPasswordGroup, 0);

  objc_storeStrong((id *)&self->_hiddenNetworkWithNoPasswordGroup, 0);
}

@end