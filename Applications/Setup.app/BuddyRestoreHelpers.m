@interface BuddyRestoreHelpers
+ (id)alertForBackupError:(id)a3 forBackup:(BOOL)a4 okButtonAction:(id)a5;
+ (id)alertForBackupError:(id)a3 okButtonAction:(id)a4;
@end

@implementation BuddyRestoreHelpers

+ (id)alertForBackupError:(id)a3 okButtonAction:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = [(id)objc_opt_class() alertForBackupError:location[0] forBackup:0 okButtonAction:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v5;
}

+ (id)alertForBackupError:(id)a3 forBackup:(BOOL)a4 okButtonAction:(id)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v51 = a4;
  id v50 = 0;
  objc_storeStrong(&v50, a5);
  id v49 = 0;
  id v48 = 0;
  id v47 = 0;
  if (v51)
  {
    v19 = +[NSBundle mainBundle];
    v20 = [(NSBundle *)v19 localizedStringForKey:@"ERROR_TITLE_CANNOT_BACK_UP" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v21 = v47;
    id v47 = v20;

    id v22 = [location[0] domain];
    unsigned __int8 v23 = [v22 isEqualToString:@"MBErrorDomain"];

    if ((v23 & 1) == 0) {
      goto LABEL_27;
    }
    id v24 = [location[0] code];
    if (v24 == (id)13)
    {
      objc_storeStrong(&v49, @"ERROR_BACKING_UP_BACKUPS_BUSY");
      goto LABEL_27;
    }
    if (v24 == (id)300) {
      goto LABEL_22;
    }
    if (v24 == (id)302)
    {
      objc_storeStrong(&v49, @"ERROR_BACKING_UP_SERVER_ERROR");
      goto LABEL_27;
    }
    if (v24 == (id)304)
    {
      objc_storeStrong(&v49, @"ERROR_BACKING_UP_SERVER_UNAVAILABLE");
      goto LABEL_27;
    }
    if (v24 == (id)308)
    {
LABEL_22:
      objc_storeStrong(&v49, @"ERROR_BACKING_UP_LOST_NETWORK");
      v25 = +[NSBundle mainBundle];
      v26 = [(NSBundle *)v25 localizedStringForKey:@"ERROR_TITLE_LOST_NETWORK" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
      id v27 = v47;
      id v47 = v26;

      goto LABEL_27;
    }
    objc_storeStrong(&v48, &stru_1002B4E18);
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    v8 = [(NSBundle *)v7 localizedStringForKey:@"ERROR_TITLE_CANNOT_RESTORE" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v9 = v47;
    id v47 = v8;

    id v10 = [location[0] domain];
    unsigned __int8 v11 = [v10 isEqualToString:@"MBErrorDomain"];

    if (v11)
    {
      id v12 = [location[0] code];
      if (v12 == (id)13)
      {
        objc_storeStrong(&v49, @"ERROR_RESTORING_BACKUPS_BUSY");
      }
      else if (v12 == (id)205)
      {
        objc_storeStrong(&v49, @"ERROR_RESTORING_BAD_BACKUP_DATA");
      }
      else
      {
        if (v12 == (id)300)
        {
LABEL_9:
          id v13 = (id)SFLocalizableWAPIStringKeyForKey();
          id v14 = v49;
          id v49 = v13;

          v15 = +[NSBundle mainBundle];
          id v16 = (id)SFLocalizableWAPIStringKeyForKey();
          v17 = [(NSBundle *)v15 localizedStringForKey:v16 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
          id v18 = v47;
          id v47 = v17;

          goto LABEL_27;
        }
        if (v12 == (id)302)
        {
          objc_storeStrong(&v49, @"ERROR_RESTORING_SERVER_ERROR");
        }
        else if (v12 == (id)304)
        {
          objc_storeStrong(&v49, @"ERROR_RESTORING_SERVER_UNAVAILABLE");
        }
        else
        {
          if (v12 == (id)308) {
            goto LABEL_9;
          }
          objc_storeStrong(&v48, &stru_1002B4E18);
        }
      }
    }
  }
LABEL_27:
  if (v49)
  {
    v28 = +[NSBundle mainBundle];
    id v29 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v49];
    v30 = [(NSBundle *)v28 localizedStringForKey:v29 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v31 = v48;
    id v48 = v30;
  }
  if (![v48 length] && (os_variant_has_internal_ui() & 1) != 0)
  {
    v32 = +[NSString stringWithFormat:@"Internal: %@", location[0]];
    id v33 = v48;
    id v48 = v32;
  }
  id v46 = +[UIAlertController alertControllerWithTitle:v47 message:v48 preferredStyle:1];
  id v34 = v46;
  v35 = +[NSBundle mainBundle];
  v36 = [(NSBundle *)v35 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  v40 = _NSConcreteStackBlock;
  int v41 = -1073741824;
  int v42 = 0;
  v43 = sub_1001C8AA4;
  v44 = &unk_1002B2098;
  id v45 = v50;
  v37 = +[UIAlertAction actionWithTitle:v36 style:0 handler:&v40];
  [v34 addAction:v37];

  id v38 = v46;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
  return v38;
}

@end