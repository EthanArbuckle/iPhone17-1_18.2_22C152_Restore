@interface BuddyMigrationCancelAlertController
+ (id)alertControllerForSource:(id)a3;
+ (id)alertControllerForTargetWithNeedsErase:(BOOL)a3 completion:(id)a4;
@end

@implementation BuddyMigrationCancelAlertController

+ (id)alertControllerForSource:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"MIGRATION_CANCEL_CONFIRM_ALERT_TITLE" value:&stru_1002B4E18 table:@"Migration"];
  id v20 = +[UIAlertController alertControllerWithTitle:v4 message:0 preferredStyle:1];

  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"CONTINUE_TRANSFER" value:&stru_1002B4E18 table:@"Migration"];
  v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:0];
  [v20 addAction:v7];

  id v8 = v20;
  v9 = +[NSBundle mainBundle];
  v10 = [(NSBundle *)v9 localizedStringForKey:@"STOP_TRANSFER" value:&stru_1002B4E18 table:@"Migration"];
  v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_1001131FC;
  v18 = &unk_1002B2098;
  id v19 = location[0];
  v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&v14];
  [v8 addAction:v11];

  id v12 = v20;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v12;
}

+ (id)alertControllerForTargetWithNeedsErase:(BOOL)a3 completion:(id)a4
{
  id v45 = a1;
  SEL v44 = a2;
  BOOL v43 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v41 = 0;
  id v40 = 0;
  uint64_t v39 = 0;
  if (v43)
  {
    v4 = +[NSBundle mainBundle];
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_CANCEL_CONFIRM_ALERT_DETAIL"];
    v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Migration"];
    id v7 = v41;
    id v41 = v6;

    id v8 = +[NSBundle mainBundle];
    id v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"STOP_TRANSFER_AND_RESET"];
    v10 = [(NSBundle *)v8 localizedStringForKey:v9 value:&stru_1002B4E18 table:@"Migration"];
    id v11 = v40;
    id v40 = v10;

    uint64_t v39 = 2;
  }
  else
  {
    objc_storeStrong(&v41, 0);
    id v12 = +[NSBundle mainBundle];
    v13 = [(NSBundle *)v12 localizedStringForKey:@"STOP_TRANSFER" value:&stru_1002B4E18 table:@"Migration"];
    id v14 = v40;
    id v40 = v13;

    uint64_t v39 = 1;
  }
  int v15 = +[NSBundle mainBundle];
  int v16 = [(NSBundle *)v15 localizedStringForKey:@"MIGRATION_CANCEL_CONFIRM_ALERT_TITLE" value:&stru_1002B4E18 table:@"Migration"];
  id v38 = +[UIAlertController alertControllerWithTitle:v16 message:v41 preferredStyle:1];

  id v17 = v38;
  v18 = +[NSBundle mainBundle];
  id v19 = [(NSBundle *)v18 localizedStringForKey:@"CONTINUE_TRANSFER" value:&stru_1002B4E18 table:@"Migration"];
  v32 = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  v35 = sub_1001136D0;
  v36 = &unk_1002B2098;
  id v37 = location;
  id v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:&v32];
  [v17 addAction:v20];

  id v21 = v38;
  id v22 = v40;
  uint64_t v23 = v39;
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_10011372C;
  v30 = &unk_1002B2098;
  id v31 = location;
  v24 = +[UIAlertAction actionWithTitle:v22 style:v23 handler:&v27];
  [v21 addAction:v24, v27, v28, v29, v30];

  id v25 = v38;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&location, 0);
  return v25;
}

@end