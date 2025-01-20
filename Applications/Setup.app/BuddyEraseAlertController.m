@interface BuddyEraseAlertController
+ (id)alertControllerWithWindow:(id)a3 navigationController:(id)a4 proximitySetupController:(id)a5 analyticsManager:(id)a6;
+ (void)eraseWithWindow:(id)a3 navigationController:(id)a4 proximitySetupController:(id)a5 analyticsManager:(id)a6;
@end

@implementation BuddyEraseAlertController

+ (id)alertControllerWithWindow:(id)a3 navigationController:(id)a4 proximitySetupController:(id)a5 analyticsManager:(id)a6
{
  id v39 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = 0;
  objc_storeStrong(&v36, a5);
  id v35 = 0;
  objc_storeStrong(&v35, a6);
  v9 = +[NSBundle mainBundle];
  id v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ERASE_START_OVER"];
  v11 = [(NSBundle *)v9 localizedStringForKey:v10 value:&stru_1002B4E18 table:@"Localizable"];
  v12 = +[NSBundle mainBundle];
  id v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ERASE_START_OVER_BODY"];
  v14 = [(NSBundle *)v12 localizedStringForKey:v13 value:&stru_1002B4E18 table:@"Localizable"];
  id v34 = +[BuddyEraseAlertController alertControllerWithTitle:v11 message:v14 preferredStyle:1];

  id v15 = v34;
  v16 = +[NSBundle mainBundle];
  id v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ERASE_DEVICE"];
  v18 = [(NSBundle *)v16 localizedStringForKey:v17 value:&stru_1002B4E18 table:@"Localizable"];
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_10008A890;
  v29 = &unk_1002B1CE0;
  v33[1] = v39;
  id v30 = location[0];
  id v31 = v37;
  id v32 = v36;
  v33[0] = v35;
  v19 = +[UIAlertAction actionWithTitle:v18 style:2 handler:&v26];
  [v15 addAction:v19, v26, v27, v28, v29, v30, v31, v32];

  id v20 = v34;
  v21 = +[NSBundle mainBundle];
  v22 = [(NSBundle *)v21 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
  v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:0];
  [v20 addAction:v23];

  id v24 = v34;
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v24;
}

+ (void)eraseWithWindow:(id)a3 navigationController:(id)a4 proximitySetupController:(id)a5 analyticsManager:(id)a6
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  id v19 = 0;
  objc_storeStrong(&v19, a6);
  [location[0] setUserInteractionEnabled:0];
  v9 = dispatch_get_global_queue(2, 0);
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_10008AAB4;
  v14 = &unk_1002B1480;
  id v15 = v20;
  id v16 = v19;
  id v17 = v21;
  id v18 = location[0];
  dispatch_async(v9, &v10);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end