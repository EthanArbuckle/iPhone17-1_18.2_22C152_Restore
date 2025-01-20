@interface RepairResultViewController
- (BOOL)isDenied;
- (BOOL)isLostMode;
- (BOOL)isNetworkError;
- (DSHardwareButtonEventMonitor)buttonEventMonitor;
- (OBLinkTrayButton)linkButton;
- (OBTableWelcomeController)contentViewController;
- (OBTrayButton)boldButton;
- (RepairResultInputs)inputs;
- (void)_restartButtonTapped:(id)a3;
- (void)_tryAgainButtonTapped:(id)a3;
- (void)cancel;
- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4;
- (void)handleButtonEvent:(unint64_t)a3;
- (void)setBoldButton:(id)a3;
- (void)setButtonEventMonitor:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setInputs:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation RepairResultViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[RepairResultViewController setupWithInputs:responder:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  [(RepairResultViewController *)self setInputs:v6];
  v9 = [(RepairResultViewController *)self inputs];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    v11 = [(RepairResultViewController *)self result];
    [v11 setStatusCode:&off_1000085D8];

    [(RepairResultViewController *)self setFinished:1];
  }
  v12 = handleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Register physical button events", buf, 2u);
  }

  if (!sub_10000608C())
  {
    v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000648C(v13);
    }

    v14 = [(RepairResultViewController *)self result];
    [v14 setStatusCode:&off_1000085F0];

    [(RepairResultViewController *)self setFinished:1];
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v15 = (void *)qword_10000C9F8;
  uint64_t v27 = qword_10000C9F8;
  if (!qword_10000C9F8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000061D0;
    v29 = &unk_1000082B0;
    v30 = &v24;
    sub_1000061D0((uint64_t)buf);
    v15 = (void *)v25[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v24, 8);
  v17 = objc_opt_new();
  [(RepairResultViewController *)self setButtonEventMonitor:v17];

  v18 = [(RepairResultViewController *)self buttonEventMonitor];
  LODWORD(v17) = v18 == 0;

  if (v17)
  {
    v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100006448(v19);
    }

    v20 = [(RepairResultViewController *)self result];
    [v20 setStatusCode:&off_1000085F0];

    [(RepairResultViewController *)self setFinished:1];
  }
  objc_initWeak((id *)buf, self);
  v21 = [(RepairResultViewController *)self buttonEventMonitor];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100004B64;
  v22[3] = &unk_1000081C0;
  objc_copyWeak(&v23, (id *)buf);
  [v21 startWithPriority:200 completion:v22];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)start
{
}

- (void)cancel
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[RepairResultViewController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(RepairResultViewController *)self setFinished:1];
}

- (void)teardown
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[RepairResultViewController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v4 = [(RepairResultViewController *)self buttonEventMonitor];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004DBC;
  v5[3] = &unk_1000081E8;
  v5[4] = self;
  [v4 stopWithCompletion:v5];
}

- (void)setupView
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v74 = "-[RepairResultViewController setupView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(RepairResultViewController *)self setShouldShowPressHomeLabel:0];
  int v4 = +[UIColor systemBlueColor];
  uint64_t v5 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v4];

  id v6 = [(RepairResultViewController *)self inputs];
  id v7 = [v6 testStatusCode];
  unsigned int v8 = [v7 isEqual:&off_100008608];

  if (v8)
  {
    v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"TEST_DONE_TITLE" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];

    v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"TEST_DONE_DETAILS" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
    int v13 = 0;
    CFStringRef v14 = @"checkmark.circle";
    goto LABEL_13;
  }
  if ([(RepairResultViewController *)self isNetworkError])
  {
    v15 = +[NSBundle mainBundle];
    uint64_t v10 = [v15 localizedStringForKey:@"TEST_RETRY_TITLE" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];

    v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"TEST_RETRY_DETAILS" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
    int v13 = 1;
LABEL_12:
    CFStringRef v14 = @"exclamationmark.triangle";
    goto LABEL_13;
  }
  if ([(RepairResultViewController *)self isLostMode])
  {
    id v16 = +[NSBundle mainBundle];
    uint64_t v10 = [v16 localizedStringForKey:@"LOST_MODE_TITLE" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];

    v17 = +[NSBundle mainBundle];
    v11 = v17;
    CFStringRef v18 = @"LOST_MODE_DETAIL_TEXT";
LABEL_11:
    uint64_t v12 = [v17 localizedStringForKey:v18 value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
    int v13 = 0;
    goto LABEL_12;
  }
  unsigned int v19 = [(RepairResultViewController *)self isDenied];
  v20 = +[NSBundle mainBundle];
  v21 = v20;
  if (v19)
  {
    uint64_t v10 = [v20 localizedStringForKey:@"DENIED_TITLE" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];

    v17 = +[NSBundle mainBundle];
    v11 = v17;
    CFStringRef v18 = @"DENIED_DETAIL_TEXT";
    goto LABEL_11;
  }
  uint64_t v10 = [v20 localizedStringForKey:@"TEST_FAILED_TITLE" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];

  v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"TEST_FAILED_DETAILS" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
  int v13 = 0;
  CFStringRef v14 = @"arrowtriangle.left.circle";
LABEL_13:

  v22 = +[UIImage systemImageNamed:v14];
  v71 = (void *)v5;
  uint64_t v23 = [v22 imageByApplyingSymbolConfiguration:v5];

  v68 = (void *)v23;
  v69 = (void *)v12;
  id v24 = [objc_alloc((Class)OBTableWelcomeController) initWithTitle:v10 detailText:v12 icon:v23 adoptTableViewScrollView:0];
  [(RepairResultViewController *)self setContentViewController:v24];

  v25 = [(RepairResultViewController *)self contentViewController];
  [v25 setScrollingDisabled:1];

  uint64_t v26 = [(RepairResultViewController *)self contentViewController];
  uint64_t v27 = [v26 buttonTray];
  [v27 setHidden:0];

  v28 = +[OBBoldTrayButton boldButton];
  [(RepairResultViewController *)self setBoldButton:v28];

  v29 = [(RepairResultViewController *)self boldButton];
  v30 = +[NSBundle mainBundle];
  v31 = v30;
  v70 = (void *)v10;
  if (v13)
  {
    v32 = [v30 localizedStringForKey:@"TRY_AGAIN" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
    [v29 setTitle:v32 forState:0];

    v33 = [(RepairResultViewController *)self boldButton];
    [v33 addTarget:self action:"_tryAgainButtonTapped:" forControlEvents:64];

    v34 = [(RepairResultViewController *)self contentViewController];
    v35 = [v34 buttonTray];
    v36 = [(RepairResultViewController *)self boldButton];
    [v35 addButton:v36];

    v37 = +[OBLinkTrayButton linkButton];
    [(RepairResultViewController *)self setLinkButton:v37];

    v38 = [(RepairResultViewController *)self linkButton];
    v39 = +[NSBundle mainBundle];
    v40 = [v39 localizedStringForKey:@"RESTART" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
    [v38 setTitle:v40 forState:0];

    v41 = [(RepairResultViewController *)self linkButton];
    [v41 addTarget:self action:"_restartButtonTapped:" forControlEvents:64];

    v42 = [(RepairResultViewController *)self contentViewController];
    v43 = [v42 buttonTray];
    [(RepairResultViewController *)self linkButton];
  }
  else
  {
    v44 = [v30 localizedStringForKey:@"RESTART" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
    [v29 setTitle:v44 forState:0];

    v45 = [(RepairResultViewController *)self boldButton];
    [v45 addTarget:self action:"_restartButtonTapped:" forControlEvents:64];

    v42 = [(RepairResultViewController *)self contentViewController];
    v43 = [v42 buttonTray];
    [(RepairResultViewController *)self boldButton];
  v46 = };
  [v43 addButton:v46];

  v47 = [(RepairResultViewController *)self contentViewController];
  v48 = [v47 view];

  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  v49 = [(RepairResultViewController *)self view];
  [v49 addSubview:v48];

  v50 = [(RepairResultViewController *)self contentViewController];
  [(RepairResultViewController *)self addChildViewController:v50];

  v66 = [v48 topAnchor];
  v67 = [(RepairResultViewController *)self view];
  v65 = [v67 topAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v72[0] = v64;
  v62 = [v48 bottomAnchor];
  v63 = [(RepairResultViewController *)self view];
  v61 = [v63 bottomAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v72[1] = v60;
  v51 = [v48 leftAnchor];
  v52 = [(RepairResultViewController *)self view];
  v53 = [v52 leftAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  v72[2] = v54;
  v55 = [v48 rightAnchor];
  v56 = [(RepairResultViewController *)self view];
  v57 = [v56 rightAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  v72[3] = v58;
  v59 = +[NSArray arrayWithObjects:v72 count:4];

  +[NSLayoutConstraint activateConstraints:v59];
}

- (void)_restartButtonTapped:(id)a3
{
  int v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restart button tapped", buf, 2u);
  }

  uint64_t v5 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"ALERT_RESTART" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000591C;
  v12[3] = &unk_100008210;
  v12[4] = self;
  unsigned int v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v12];
  [v5 addAction:v8];

  v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"ALERT_CANCEL" value:&stru_1000082F0 table:@"RepairResultPlugin-Release"];
  v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&stru_100008250];
  [v5 addAction:v11];

  [(RepairResultViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_tryAgainButtonTapped:(id)a3
{
  int v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Try Again button tapped", v5, 2u);
  }

  [(RepairResultViewController *)self endTestWithStatusCode:-86 error:0];
}

- (void)handleButtonEvent:(unint64_t)a3
{
  int v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Physical button event: %ld", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)isNetworkError
{
  v3 = [(RepairResultViewController *)self inputs];
  int v4 = [v3 testIdentifer];
  unsigned int v5 = [v4 isEqual:&off_100008620];

  if (v5)
  {
    unint64_t v6 = [(RepairResultViewController *)self inputs];
    id v7 = [v6 testStatusCode];
    unsigned __int8 v8 = [v7 isEqual:&off_100008638];

    if (v8) {
      return 1;
    }
  }
  v9 = [(RepairResultViewController *)self inputs];
  uint64_t v10 = [v9 testIdentifer];
  unsigned int v11 = [v10 isEqual:&off_100008650];

  if (v11)
  {
    uint64_t v12 = [(RepairResultViewController *)self inputs];
    int v13 = [v12 testStatusCode];
    unsigned __int8 v14 = [v13 isEqual:&off_100008668];

    if (v14) {
      return 1;
    }
  }
  v15 = [(RepairResultViewController *)self inputs];
  id v16 = [v15 testIdentifer];
  unsigned int v17 = [v16 isEqual:&off_100008680];

  if (!v17) {
    return 0;
  }
  CFStringRef v18 = [(RepairResultViewController *)self inputs];
  unsigned int v19 = [v18 testStatusCode];
  unsigned __int8 v20 = [v19 isEqual:&off_100008638];

  return (v20 & 1) != 0;
}

- (BOOL)isLostMode
{
  v3 = [(RepairResultViewController *)self inputs];
  int v4 = [v3 testIdentifer];
  unsigned int v5 = [v4 isEqual:&off_100008698];

  BOOL result = 0;
  if (v5)
  {
    unint64_t v6 = [(RepairResultViewController *)self inputs];
    id v7 = [v6 testStatusCode];
    unsigned __int8 v8 = [v7 isEqual:&off_1000086B0];

    if (v8) {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDenied
{
  v3 = [(RepairResultViewController *)self inputs];
  int v4 = [v3 testIdentifer];
  unsigned int v5 = [v4 isEqual:&off_100008698];

  BOOL result = 0;
  if (v5)
  {
    unint64_t v6 = [(RepairResultViewController *)self inputs];
    id v7 = [v6 testStatusCode];
    unsigned __int8 v8 = [v7 isEqual:&off_1000086C8];

    if (v8) {
      return 1;
    }
  }
  return result;
}

- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v8 = [(RepairResultViewController *)self result];
  [v8 setStatusCode:v7];

  v15[0] = @"error";
  v9 = [v6 description];
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = +[NSNull null];
  }
  v15[1] = @"errorCode";
  v16[0] = v10;
  unsigned int v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = +[NSNull null];
  }
  v16[1] = v12;
  int v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  unsigned __int8 v14 = [(RepairResultViewController *)self result];
  [v14 setData:v13];

  if (!v11) {
  if (!v9)
  }

  [(RepairResultViewController *)self setFinished:1];
}

- (RepairResultInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (OBTableWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (OBTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);

  objc_storeStrong((id *)&self->inputs, 0);
}

@end