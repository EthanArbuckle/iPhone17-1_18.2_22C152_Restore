@interface ActivationLockViewController
- (ActivationLockViewController)initWithTokenChallengers:(id)a3 authenticator:(id)a4;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (IDMSAuthenticator)authenticator;
- (NSArray)tokenChallengers;
- (NSMutableDictionary)localizedComponentMap;
- (RemoteUIController)remoteUIController;
- (StartPreflightNavigationCoordinator)coordinator;
- (id)activeTokenChallenger;
- (id)moveToNextLockedTokenChallenger;
- (id)transitionTable;
- (int64_t)state;
- (unint64_t)activeTokenChallengerIndex;
- (void)_setHandlerForNextButton;
- (void)_setHandlerForSkipButton;
- (void)_showAlertWithTitle:(id)a3 message:(id)a4 actionTitle:(id)a5;
- (void)_skipActivateTapped;
- (void)_startActivateTapped;
- (void)fetchPasswordScreen;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)resetState;
- (void)setActiveTokenChallengerIndex:(unint64_t)a3;
- (void)setAuthenticator:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setLocalizedComponentMap:(id)a3;
- (void)setRemoteUIController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTokenChallengers:(id)a3;
- (void)setupRemoteUIController;
- (void)showUnknownErrorAlertWithCode:(int64_t)a3;
- (void)showUserAuthErrorAlert;
- (void)transitionToState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ActivationLockViewController

- (ActivationLockViewController)initWithTokenChallengers:(id)a3 authenticator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v56 = v6;
  if ([v6 count])
  {
    id v54 = v7;
    v8 = +[NSMutableDictionary dictionary];
    [(ActivationLockViewController *)self setLocalizedComponentMap:v8];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v59;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v59 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v15 = [(ActivationLockViewController *)self localizedComponentMap];
          v16 = [v14 localizedComponentsMap];
          [v15 addEntriesFromDictionary:v16];
        }
        id v11 = [v9 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v11);
    }

    v17 = [(ActivationLockViewController *)self localizedComponentMap];
    id v18 = [v17 count];

    v19 = [(ActivationLockViewController *)self localizedComponentMap];
    v20 = v19;
    if (v18 == (id)1)
    {
      v21 = [v19 allValues];
      v22 = [v21 objectAtIndexedSubscript:0];

      v23 = +[NSBundle mainBundle];
      v24 = [v23 localizedStringForKey:@"SINGLE_OWNER_SINGLE_ACTIVATION_LOCK_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
      uint64_t v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v22);

      v26 = v25;
      v27 = +[NSBundle mainBundle];
      v28 = [v27 localizedStringForKey:@"SINGLE_OWNER_SINGLE_ACTIVATION_LOCK_TEXT" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v22);

      v30 = 0;
      id v7 = v54;
      goto LABEL_22;
    }
    id v32 = [v19 count];

    if ((unint64_t)v32 >= 2)
    {
      v33 = [(ActivationLockViewController *)self localizedComponentMap];
      v34 = [v33 allValues];
      uint64_t v35 = [v34 componentsJoinedByString:@"\n"];

      id v36 = [v9 count];
      v37 = +[NSBundle mainBundle];
      v38 = v37;
      if ((unint64_t)v36 < 2)
      {
        v26 = [v37 localizedStringForKey:@"SINGLE_OWNER_MULTI_ACTIVATION_LOCK_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];

        v39 = +[NSBundle mainBundle];
        v22 = v39;
        CFStringRef v40 = @"SINGLE_OWNER_MULTI_ACTIVATION_LOCK_TEXT";
      }
      else
      {
        v26 = [v37 localizedStringForKey:@"MULTI_OWNER_MULTI_ACTIVATION_LOCK_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];

        v39 = +[NSBundle mainBundle];
        v22 = v39;
        CFStringRef v40 = @"MULTI_OWNER_MULTI_ACTIVATION_LOCK_TEXT";
      }
      v29 = [v39 localizedStringForKey:v40 value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
      id v7 = v54;
      v30 = (void *)v35;
LABEL_22:

      v41 = +[UIColor tintColor];
      v42 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v41];
      v43 = +[UIImage systemImageNamed:@"lock.circle" withConfiguration:v42];

      v57.receiver = self;
      v57.super_class = (Class)ActivationLockViewController;
      v44 = [(OBBoldSubtitleController *)&v57 initWithTitle:v26 subtitle:v30 detailText:v29 icon:v43];
      if (v44)
      {
        v45 = +[OBBoldTrayButton boldButton];
        +[NSBundle mainBundle];
        v46 = v55 = v26;
        v47 = [v46 localizedStringForKey:@"START_ACTIVATION_BUTTON_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
        [v45 setTitle:v47 forState:0];

        [v45 addTarget:v44 action:"_startActivateTapped" forControlEvents:64];
        v48 = [(ActivationLockViewController *)v44 buttonTray];
        [v48 addButton:v45];

        v49 = +[OBLinkTrayButton linkButton];
        v50 = +[NSBundle mainBundle];
        v51 = [v50 localizedStringForKey:@"SKIP_ACTIVATION_BUTTON_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
        [v49 setTitle:v51 forState:0];

        [v49 addTarget:v44 action:"_skipActivateTapped" forControlEvents:64];
        v52 = [(ActivationLockViewController *)v44 buttonTray];
        [v52 addButton:v49];

        [(ActivationLockViewController *)v44 setTokenChallengers:v9];
        [(ActivationLockViewController *)v44 setAuthenticator:v7];
        [(ActivationLockViewController *)v44 resetState];

        v26 = v55;
      }
      self = v44;

      v31 = self;
      goto LABEL_25;
    }
    v26 = handleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10000FBC8();
    }
    v31 = 0;
    id v7 = v54;
  }
  else
  {
    v26 = handleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10000FB94();
    }
    v31 = 0;
  }
LABEL_25:

  return v31;
}

- (void)viewDidLoad
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ActivationLockViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)ActivationLockViewController;
  [(ActivationLockViewController *)&v5 viewDidLoad];
  v4 = [(ActivationLockViewController *)self navigationController];
  [v4 setDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[ActivationLockViewController viewDidAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)ActivationLockViewController;
  [(ActivationLockViewController *)&v6 viewDidAppear:v3];
  [(ActivationLockViewController *)self resetState];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v5 = a3;
  objc_super v6 = [v5 viewControllers];
  id v7 = +[NSMutableArray arrayWithArray:v6];

  if ((unint64_t)[v7 count] >= 2)
  {
    v8 = [v7 objectAtIndexedSubscript:[v7 count] - 1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v7 objectAtIndexedSubscript:[v7 count] - 2];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v11 = handleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "removing second-to-last RUI Page", v12, 2u);
        }

        [v7 removeObjectAtIndex:[v7 count] - 2];
        [v5 setViewControllers:v7 animated:0];
      }
    }
    else
    {
    }
  }
}

- (id)activeTokenChallenger
{
  unint64_t v3 = [(ActivationLockViewController *)self activeTokenChallengerIndex];
  v4 = [(ActivationLockViewController *)self tokenChallengers];
  if (v3 >= (unint64_t)[v4 count])
  {

    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000FBFC(self);
    }

    objc_super v6 = 0;
  }
  else
  {
    [(ActivationLockViewController *)self activeTokenChallengerIndex];

    id v5 = [(ActivationLockViewController *)self tokenChallengers];
    objc_super v6 = [v5 objectAtIndexedSubscript:[self activeTokenChallengerIndex]];
  }

  return v6;
}

- (id)moveToNextLockedTokenChallenger
{
  do
  {
    unint64_t v3 = (char *)[(ActivationLockViewController *)self activeTokenChallengerIndex] + 1;
    [(ActivationLockViewController *)self setActiveTokenChallengerIndex:v3];
    v4 = [(ActivationLockViewController *)self tokenChallengers];
    id v5 = (char *)[v4 count];

    if (v3 >= v5)
    {
      id v10 = 0;
      goto LABEL_7;
    }
    objc_super v6 = [(ActivationLockViewController *)self activeTokenChallenger];
    unsigned __int8 v7 = [v6 isTokenUnlocked];
  }
  while ((v7 & 1) != 0);
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(ActivationLockViewController *)self activeTokenChallenger];
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Moved to next locked token: %@", (uint8_t *)&v12, 0xCu);
  }
  id v10 = [(ActivationLockViewController *)self activeTokenChallenger];
LABEL_7:

  return v10;
}

- (void)setupRemoteUIController
{
  unint64_t v3 = objc_opt_new();
  [(ActivationLockViewController *)self setRemoteUIController:v3];

  v4 = [(ActivationLockViewController *)self remoteUIController];
  [v4 setDelegate:self];

  id v5 = [(ActivationLockViewController *)self navigationController];
  objc_super v6 = [(ActivationLockViewController *)self remoteUIController];
  [v6 setHostViewController:v5];

  unsigned __int8 v7 = +[RUIStyle setupAssistantStyle];
  v8 = [(ActivationLockViewController *)self remoteUIController];
  [v8 setStyle:v7];

  id v9 = [(ActivationLockViewController *)self remoteUIController];
  id v10 = [(ActivationLockViewController *)self localizedComponentMap];
  [v9 registerPartsInfoViewWithComponentsMap:v10];

  [(ActivationLockViewController *)self _setHandlerForSkipButton];

  [(ActivationLockViewController *)self _setHandlerForNextButton];
}

- (void)_startActivateTapped
{
  unint64_t v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ActivationLockViewController _startActivateTapped]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(ActivationLockViewController *)self setupRemoteUIController];
  [(ActivationLockViewController *)self fetchPasswordScreen];
}

- (void)fetchPasswordScreen
{
  [(ActivationLockViewController *)self transitionToState:1];
  unint64_t v3 = [(ActivationLockViewController *)self activeTokenChallenger];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006D4C;
  v4[3] = &unk_1000186F0;
  v4[4] = self;
  [v3 fetchPasswordWithCompletion:v4];
}

- (void)_skipActivateTapped
{
  unint64_t v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ActivationLockViewController _skipActivateTapped]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v4 = [(ActivationLockViewController *)self tokenChallengers];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setIsTokenUnlocked:1];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(ActivationLockViewController *)self transitionToState:5];
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4 actionTitle:(id)a5
{
  id v8 = a5;
  id v10 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  long long v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:0];

  [v10 addAction:v9];
  [(ActivationLockViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)showUserAuthErrorAlert
{
  id v6 = +[NSBundle mainBundle];
  unint64_t v3 = [v6 localizedStringForKey:@"AUTH_ERROR_ALERT_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
  int v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"AUTH_ERROR_ALERT_ACTION" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
  [(ActivationLockViewController *)self _showAlertWithTitle:v3 message:0 actionTitle:v5];
}

- (void)showUnknownErrorAlertWithCode:(int64_t)a3
{
  int v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000FCA8();
  }

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"UNKNOWN_ERROR_ALERT_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
  uint64_t v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"UNKNOWN_ERROR_ALERT_MESSAGE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
  long long v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"UNKNOWN_ERROR_ALERT_ACTION" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
  [(ActivationLockViewController *)self _showAlertWithTitle:v6 message:v8 actionTitle:v10];
}

- (void)_setHandlerForNextButton
{
  objc_initWeak(&location, self);
  unint64_t v3 = [(ActivationLockViewController *)self remoteUIController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000073C0;
  v5[3] = &unk_1000187A8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v4 = [v3 setHandlerForElementsMatching:&stru_100018730 handler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setHandlerForSkipButton
{
  objc_initWeak(&location, self);
  remoteUIController = self->_remoteUIController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007948;
  v5[3] = &unk_1000187F0;
  objc_copyWeak(&v6, &location);
  id v4 = [(RemoteUIController *)remoteUIController setHandlerForElementsMatching:&stru_1000187C8 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!a5)
  {
LABEL_11:
    id v18 = handleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000FDB4();
    }

    [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-101];
    goto LABEL_39;
  }
  if (*a5 != 2)
  {
    if (*a5 == 1)
    {
      long long v11 = [v9 clientInfo];
      long long v12 = [v11 objectForKeyedSubscript:@"status"];

      v13 = handleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 138412290;
        *(void *)&v27[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Got dismiss action with status %@", v27, 0xCu);
      }

      if (!v12)
      {
        [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-304];
LABEL_38:

        goto LABEL_39;
      }
      if ((id)[(ActivationLockViewController *)self state] == (id)1)
      {
        unsigned int v14 = [v12 isEqualToString:@"0"];
        v15 = handleForCategory();
        v16 = v15;
        if (!v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10000FDE8();
          }

          [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-303];
          v24 = self;
          uint64_t v25 = 0;
          goto LABEL_37;
        }
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_27:

          v23 = [(ActivationLockViewController *)self activeTokenChallenger];
          [v23 setIsTokenUnlocked:1];

          v24 = self;
          uint64_t v25 = 5;
LABEL_37:
          -[ActivationLockViewController transitionToState:](v24, "transitionToState:", v25, *(void *)v27);
          goto LABEL_38;
        }
        *(_WORD *)v27 = 0;
        v17 = "Token has already been unlocked";
      }
      else
      {
        if ((id)[(ActivationLockViewController *)self state] != (id)4)
        {
          v26 = handleForCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_10000FEC0(self);
          }

          [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-100];
          [(ActivationLockViewController *)self resetState];
          goto LABEL_38;
        }
        unsigned int v21 = [v12 isEqualToString:@"0"];
        v22 = handleForCategory();
        v16 = v22;
        if (!v21)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10000FE54();
          }

          [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-303];
          v24 = self;
          uint64_t v25 = 2;
          goto LABEL_37;
        }
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        *(_WORD *)v27 = 0;
        v17 = "Token unlocked";
      }
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, v27, 2u);
      goto LABEL_27;
    }
    goto LABEL_11;
  }
  v19 = handleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Got push action", v27, 2u);
  }

  if ((id)[(ActivationLockViewController *)self state] == (id)1)
  {
    [(ActivationLockViewController *)self transitionToState:2];
  }
  else
  {
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000FF38(self);
    }

    [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-100];
    [(ActivationLockViewController *)self resetState];
  }
LABEL_39:
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[ActivationLockViewController remoteUIController:shouldLoadRequest:redirectResponse:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    v15 = "-[ActivationLockViewController remoteUIController:didFinishLoadWithError:forRequest:]";
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: error: %@. request: %@", (uint8_t *)&v14, 0x20u);
  }

  if (v7)
  {
    id v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100010028();
    }

    if ((id)[(ActivationLockViewController *)self state] == (id)4)
    {
      [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-103];
      long long v11 = self;
      uint64_t v12 = 2;
LABEL_10:
      [(ActivationLockViewController *)v11 transitionToState:v12];
      goto LABEL_14;
    }
    if ((id)[(ActivationLockViewController *)self state] == (id)1)
    {
      [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-102];
      long long v11 = self;
      uint64_t v12 = 0;
      goto LABEL_10;
    }
    v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000FFB0(self);
    }

    [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-100];
    [(ActivationLockViewController *)self resetState];
  }
LABEL_14:
}

- (id)transitionTable
{
  v4[0] = &off_100019418;
  v4[1] = &off_100019430;
  v5[0] = &off_100019560;
  v5[1] = &off_100019578;
  v4[2] = &off_100019460;
  v4[3] = &off_100019478;
  v5[2] = &off_100019590;
  v5[3] = &off_1000195A8;
  v4[4] = &off_100019490;
  void v4[5] = &off_100019448;
  void v5[4] = &off_1000195C0;
  void v5[5] = &off_1000195D8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];

  return v2;
}

- (void)resetState
{
  unint64_t v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    int64_t v9 = [(ActivationLockViewController *)self state];
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reset state from %ld to %ld", (uint8_t *)&v8, 0x16u);
  }

  [(ActivationLockViewController *)self setState:0];
  [(ActivationLockViewController *)self setActiveTokenChallengerIndex:-1];
  id v4 = [(ActivationLockViewController *)self moveToNextLockedTokenChallenger];
  id v5 = [(ActivationLockViewController *)self buttonTray];
  [v5 showButtonsAvailable];

  id v6 = [(ActivationLockViewController *)self navigationController];
  id v7 = [v6 popToViewController:self animated:1];

  [(ActivationLockViewController *)self setRemoteUIController:0];
}

- (void)transitionToState:(int64_t)a3
{
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218240;
    int64_t v22 = [(ActivationLockViewController *)self state];
    __int16 v23 = 2048;
    int64_t v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Transitioning state from %ld to %ld", (uint8_t *)&v21, 0x16u);
  }

  id v6 = [(ActivationLockViewController *)self transitionTable];
  id v7 = +[NSNumber numberWithInteger:[(ActivationLockViewController *)self state]];
  int v8 = [v6 objectForKeyedSubscript:v7];

  if (v8
    && (+[NSNumber numberWithInteger:a3],
        int64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v8 containsObject:v9],
        v9,
        (v10 & 1) != 0))
  {
    [(ActivationLockViewController *)self setState:a3];
    uint64_t v11 = [(ActivationLockViewController *)self buttonTray];
    if ((a3 | 4) == 5)
    {
      [v11 showButtonsBusy];

      uint64_t v12 = [(ActivationLockViewController *)self remoteUIController];
      v13 = [v12 displayedPages];
      int v14 = [v13 lastObject];
      v15 = v14;
      uint64_t v16 = 1;
    }
    else
    {
      [v11 showButtonsAvailable];

      uint64_t v12 = [(ActivationLockViewController *)self remoteUIController];
      v13 = [v12 displayedPages];
      int v14 = [v13 lastObject];
      v15 = v14;
      uint64_t v16 = 0;
    }
    [v14 setLoading:v16];

    if (a3 == 5)
    {
      __int16 v18 = [(ActivationLockViewController *)self moveToNextLockedTokenChallenger];

      if (v18)
      {
        [(ActivationLockViewController *)self fetchPasswordScreen];
      }
      else
      {
        id v19 = handleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No more token left", (uint8_t *)&v21, 2u);
        }

        v20 = [(ActivationLockViewController *)self coordinator];
        [v20 moveToNextViewController];
      }
    }
  }
  else
  {
    id v17 = handleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10001005C(self, a3, v17);
    }

    [(ActivationLockViewController *)self showUnknownErrorAlertWithCode:-100];
    [(ActivationLockViewController *)self resetState];
  }
}

- (StartPreflightNavigationCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (StartPreflightNavigationCoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
}

- (NSArray)tokenChallengers
{
  return self->_tokenChallengers;
}

- (void)setTokenChallengers:(id)a3
{
}

- (unint64_t)activeTokenChallengerIndex
{
  return self->_activeTokenChallengerIndex;
}

- (void)setActiveTokenChallengerIndex:(unint64_t)a3
{
  self->_activeTokenChallengerIndex = a3;
}

- (NSMutableDictionary)localizedComponentMap
{
  return self->_localizedComponentMap;
}

- (void)setLocalizedComponentMap:(id)a3
{
}

- (IDMSAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_localizedComponentMap, 0);
  objc_storeStrong((id *)&self->_tokenChallengers, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);

  objc_destroyWeak((id *)&self->_coordinator);
}

@end