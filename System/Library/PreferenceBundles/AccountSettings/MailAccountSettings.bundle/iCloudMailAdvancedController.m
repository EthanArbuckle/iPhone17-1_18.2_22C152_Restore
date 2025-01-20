@interface iCloudMailAdvancedController
- (iCloudMailAdvancedController)initWithPageType:(int64_t)a3;
- (id)specifiers;
- (void)cancel;
- (void)configureNavigationItems;
- (void)save;
- (void)viewDidLoad;
@end

@implementation iCloudMailAdvancedController

- (iCloudMailAdvancedController)initWithPageType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)iCloudMailAdvancedController;
  result = [(iCloudMailAdvancedController *)&v5 init];
  if (result) {
    result->_pageType = a3;
  }
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)iCloudMailAdvancedController;
  [(AccountPSAdvancedController *)&v3 viewDidLoad];
  [(iCloudMailAdvancedController *)self configureNavigationItems];
}

- (void)configureNavigationItems
{
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"save"];
  objc_super v3 = [(iCloudMailAdvancedController *)self navigationItem];
  [v3 setRightBarButtonItem:v5];

  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancel"];
  v4 = [(iCloudMailAdvancedController *)self navigationItem];
  [v4 setLeftBarButtonItem:v6];
}

- (id)specifiers
{
  v35.receiver = self;
  v35.super_class = (Class)iCloudMailAdvancedController;
  v32 = [(AccountPSAdvancedController *)&v35 specifiers];
  int64_t pageType = self->_pageType;
  if (pageType == 1)
  {
    v30 = +[NSBundle bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"SMIME_PREFS" value:&stru_B9F70 table:@"AccountPreferences"];
    v36[0] = v31;
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"ENABLE_SIGNING" value:&stru_B9F70 table:@"AccountPreferences"];
    v36[1] = v29;
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"ENABLE_ENCRYPTION" value:&stru_B9F70 table:@"AccountPreferences"];
    v36[2] = v27;
    v4 = +[NSArray arrayWithObjects:v36 count:3];
    v12 = +[NSSet setWithArray:v4];
  }
  else
  {
    if (pageType)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v30 = +[NSBundle bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"MAILBOX_BEHAVIORS" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[0] = v31;
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"DRAFTS_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[1] = v29;
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"SENT_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[2] = v27;
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v4 localizedStringForKey:@"DELETED_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[3] = v25;
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"ARCHIVE_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[4] = v24;
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"MOVE_DISCARDED_MESSAGES_INTO" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[5] = v22;
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"DELETED_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[6] = v20;
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"ARCHIVE_MAILBOX" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[7] = v6;
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"DELETED_MESSAGES_GROUP" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[8] = v8;
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"REMOVE_FROM_TRASH" value:&stru_B9F70 table:@"AccountPreferences"];
    v37[9] = v10;
    v11 = +[NSArray arrayWithObjects:v37 count:10];
    v12 = +[NSSet setWithArray:v11];
  }
LABEL_7:
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_70DCC;
  v33[3] = &unk_B9B10;
  id v34 = v12;
  id v13 = v12;
  uint64_t v14 = objc_msgSend(v32, "ef_filter:", v33);
  v15 = (id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v16 = *v15;
  id *v15 = (id)v14;

  id v17 = *v15;
  return v17;
}

- (void)save
{
  objc_super v3 = [(AccountPSAdvancedController *)self account];
  v4 = [(AccountPSAdvancedController *)self accountValues];
  [v3 setAccountPropertiesWithDictionary:v4];

  id v5 = [(AccountPSAdvancedController *)self account];
  [v5 savePersistentAccount];

  [(iCloudMailAdvancedController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)cancel
{
}

@end