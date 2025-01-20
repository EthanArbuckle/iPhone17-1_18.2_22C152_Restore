@interface ChimeraLockViewController
- (ChimeraLockViewController)initWithComponent:(id)a3 status:(id)a4;
- (StartPreflightNavigationCoordinator)coordinator;
- (void)_continueTapped;
- (void)setCoordinator:(id)a3;
@end

@implementation ChimeraLockViewController

- (ChimeraLockViewController)initWithComponent:(id)a3 status:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[UIImage systemImageNamed:@"iphone.slash"];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:v7 value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"CHIMERA_LOCK_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10);

  if ([v6 isEqualToString:@"LOST"])
  {
    v14 = +[NSBundle mainBundle];
    v15 = v14;
    CFStringRef v16 = @"ACTIVATION_LOST_DETAIL_TEXT";
LABEL_5:
    v17 = [v14 localizedStringForKey:v16 value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];

    v25.receiver = self;
    v25.super_class = (Class)ChimeraLockViewController;
    v18 = [(OBBoldSubtitleController *)&v25 initWithTitle:v13 subtitle:0 detailText:v17 icon:v8];
    if (v18)
    {
      v19 = +[OBBoldTrayButton boldButton];
      v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"CONTINUE_BUTTON_TITLE" value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
      [v19 setTitle:v21 forState:0];

      [v19 addTarget:v18 action:"_continueTapped" forControlEvents:64];
      v22 = [(ChimeraLockViewController *)v18 buttonTray];
      [v22 addButton:v19];
    }
    self = v18;
    v23 = self;
    goto LABEL_11;
  }
  if ([v6 isEqualToString:@"DENIED"])
  {
    v14 = +[NSBundle mainBundle];
    v15 = v14;
    CFStringRef v16 = @"CHIMERA_LOCK_DETAIL_TEXT";
    goto LABEL_5;
  }
  v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100010B8C(v17);
  }
  v23 = 0;
LABEL_11:

  return v23;
}

- (void)_continueTapped
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ChimeraLockViewController _continueTapped]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(ChimeraLockViewController *)self coordinator];
  [v4 moveToNextViewController];
}

- (StartPreflightNavigationCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (StartPreflightNavigationCoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end