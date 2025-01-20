@interface UnknownPartViewController
- (RepairSummaryNavigationCoordinator)coordinator;
- (UnknownPartViewController)initWithComponent:(id)a3;
- (void)_continueTapped;
- (void)setCoordinator:(id)a3;
@end

@implementation UnknownPartViewController

- (UnknownPartViewController)initWithComponent:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:v4 value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"UNKOWN_PART_TITLE" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);

  v10 = [(UnknownPartViewController *)self navigationItem];
  [v10 setHidesBackButton:1];

  [(UnknownPartViewController *)self setScrollingDisabled:0];
  v11 = +[UIColor systemYellowColor];
  v12 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v11];

  v13 = +[UIImage systemImageNamed:@"exclamationmark.triangle"];
  v14 = [v13 imageByApplyingSymbolConfiguration:v12];

  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"UNKOWN_PART_DETAIL_TEXT" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];

  v23.receiver = self;
  v23.super_class = (Class)UnknownPartViewController;
  v17 = [(UnknownPartViewController *)&v23 initWithTitle:v9 detailText:v16 icon:v14];
  if (v17)
  {
    v18 = +[OBBoldTrayButton boldButton];
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"CONTINUE" value:&stru_10000C398 table:@"RepairSummaryPlugin-Release"];
    [v18 setTitle:v20 forState:0];

    [v18 addTarget:v17 action:"_continueTapped" forControlEvents:64];
    v21 = [(UnknownPartViewController *)v17 buttonTray];
    [v21 addButton:v18];
  }
  return v17;
}

- (void)_continueTapped
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Continue button tapped", v5, 2u);
  }

  id v4 = [(UnknownPartViewController *)self coordinator];
  [v4 moveToNextViewController];
}

- (RepairSummaryNavigationCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (RepairSummaryNavigationCoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end