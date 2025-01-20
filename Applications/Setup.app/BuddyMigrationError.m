@interface BuddyMigrationError
+ (id)_appendErrorInformationForInternal:(id)a3 error:(id)a4;
+ (id)detailTextForErrorOnSource:(id)a3;
+ (id)detailTextForErrorOnTarget:(id)a3 requiresErase:(BOOL)a4;
+ (id)titleForError:(id)a3;
@end

@implementation BuddyMigrationError

+ (id)titleForError:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] domain];
  unsigned __int8 v4 = [v3 isEqualToString:@"MBErrorDomain"];

  if ((v4 & 1) == 0) {
    goto LABEL_6;
  }
  if ([location[0] code] == (id)202)
  {
    v5 = +[NSBundle mainBundle];
    v11 = [(NSBundle *)v5 localizedStringForKey:@"MIGRATION_ERROR_TITLE_CANCELLED" value:&stru_1002B4E18 table:@"Migration"];

    goto LABEL_7;
  }
  if ([location[0] code] == (id)106)
  {
    v6 = +[NSBundle mainBundle];
    v11 = [(NSBundle *)v6 localizedStringForKey:@"MIGRATION_ERROR_TITLE_OUT_OF_SPACE" value:&stru_1002B4E18 table:@"Migration"];
  }
  else
  {
LABEL_6:
    v7 = +[NSBundle mainBundle];
    v11 = [(NSBundle *)v7 localizedStringForKey:@"MIGRATION_ERROR_TITLE_GENERIC" value:&stru_1002B4E18 table:@"Migration"];
  }
LABEL_7:
  objc_storeStrong(location, 0);
  v8 = v11;

  return v8;
}

+ (id)detailTextForErrorOnSource:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  id v3 = [location[0] domain];
  unsigned __int8 v4 = [v3 isEqualToString:@"MBErrorDomain"];

  if (v4)
  {
    if ([location[0] code] == (id)15)
    {
      v5 = +[NSBundle mainBundle];
      id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_ERROR_DETAIL_DISCONNECTED"];
      v7 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"Migration"];
      id v8 = v18;
      id v18 = v7;
    }
    else if ([location[0] code] == (id)106)
    {
      v9 = +[NSBundle mainBundle];
      id v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_ERROR_DETAIL_SOURCE_OUT_OF_SPACE"];
      v11 = [(NSBundle *)v9 localizedStringForKey:v10 value:&stru_1002B4E18 table:@"Migration"];
      id v12 = v18;
      id v18 = v11;
    }
  }
  else
  {
    v13 = +[NSBundle mainBundle];
    v14 = [(NSBundle *)v13 localizedStringForKey:@"MIGRATION_ERROR_DETAIL_GENERIC" value:&stru_1002B4E18 table:@"Migration"];
    id v15 = v18;
    id v18 = v14;
  }
  id v16 = +[BuddyMigrationError _appendErrorInformationForInternal:error:](BuddyMigrationError, "_appendErrorInformationForInternal:error:", v18, location[0], v18);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);

  return v16;
}

+ (id)detailTextForErrorOnTarget:(id)a3 requiresErase:(BOOL)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v36 = a4;
  id v35 = 0;
  id v5 = [location[0] domain];
  unsigned __int8 v6 = [v5 isEqualToString:@"MBErrorDomain"];

  if (v6)
  {
    if ([location[0] code] == (id)202)
    {
      objc_storeStrong(&v35, 0);
    }
    else if ([location[0] code] == (id)15)
    {
      v7 = +[NSBundle mainBundle];
      id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_ERROR_DETAIL_DISCONNECTED"];
      v9 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"Migration"];
      id v10 = v35;
      id v35 = v9;
    }
    else if ([location[0] code] == (id)106)
    {
      v11 = +[NSBundle mainBundle];
      id v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_ERROR_DETAIL_TARGET_OUT_OF_SPACE"];
      v13 = [(NSBundle *)v11 localizedStringForKey:v12 value:&stru_1002B4E18 table:@"Migration"];
      id v14 = v35;
      id v35 = v13;
    }
  }
  else
  {
    id v15 = +[NSBundle mainBundle];
    id v16 = [(NSBundle *)v15 localizedStringForKey:@"MIGRATION_ERROR_DETAIL_GENERIC" value:&stru_1002B4E18 table:@"Migration"];
    id v17 = v35;
    id v35 = v16;
  }
  if (v36)
  {
    if (v35)
    {
      id v18 = v35;
      v19 = +[NSBundle mainBundle];
      id v20 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_ERROR_DETAIL_TARGET_SUFFIX_RESET"];
      v21 = [(NSBundle *)v19 localizedStringForKey:v20 value:&stru_1002B4E18 table:@"Migration"];
      v22 = +[NSString localizedStringWithFormat:@"%@ %@", v18, v21];
      id v23 = v35;
      id v35 = v22;
    }
    else
    {
      v19 = +[NSBundle mainBundle];
      id v24 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MIGRATION_ERROR_DETAIL_TARGET_SUFFIX_RESET"];
      v25 = [(NSBundle *)v19 localizedStringForKey:v24 value:&stru_1002B4E18 table:@"Migration"];
      id v26 = v35;
      id v35 = v25;
    }
  }
  else
  {
    char v33 = 0;
    BOOL v27 = 0;
    if (!v35)
    {
      id v34 = [location[0] domain];
      char v33 = 1;
      BOOL v27 = 0;
      if ([v34 isEqualToString:@"MBErrorDomain"]) {
        BOOL v27 = [location[0] code] == (id)202;
      }
    }
    if (v33) {

    }
    if (v27)
    {
      v28 = +[NSBundle mainBundle];
      v29 = [(NSBundle *)v28 localizedStringForKey:@"MIGRATION_ERROR_DETAIL_GENERIC" value:&stru_1002B4E18 table:@"Migration"];
      id v30 = v35;
      id v35 = v29;
    }
  }
  id v31 = +[BuddyMigrationError _appendErrorInformationForInternal:v35 error:location[0]];
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);

  return v31;
}

+ (id)_appendErrorInformationForInternal:(id)a3 error:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if ((os_variant_has_internal_ui() & 1) != 0 && v7) {
    v9 = +[NSString stringWithFormat:@"%@\n\nInternal: %@", location[0], v7];
  }
  else {
    v9 = (NSString *)location[0];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  id v5 = v9;

  return v5;
}

@end