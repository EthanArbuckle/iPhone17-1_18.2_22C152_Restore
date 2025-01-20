@interface ICSettingsQuickNoteController
- (BOOL)stateIsSet:(unint64_t)a3;
- (id)durationSpecifierNamed:(id)a3 duration:(int64_t)a4 group:(id)a5;
- (id)footerString;
- (id)settingsBundle;
- (id)specifiers;
- (id)stateSpecifierNamed:(id)a3 state:(unint64_t)a4 group:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsQuickNoteController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsQuickNoteController;
  [(ICSettingsQuickNoteController *)&v4 viewDidAppear:a3];
  [(ICSettingsQuickNoteController *)self ic_submitNavigationEventForIdentifier:@"ACCESS_FROM_LOCK_SCREEN" titleStringKey:@"ACCESS_NOTES_FROM_LOCK_SCREEN" navigationComponents:&off_1F178];
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  unint64_t v57 = (unint64_t)+[ICQuickNoteSessionSettings showOnLockScreen];
  objc_super v4 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v5 = PSIsRadioGroupKey;
  [v4 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  [v3 addObject:v4];
  v6 = [(ICSettingsQuickNoteController *)self settingsBundle];
  v7 = [v6 localizedStringForKey:@"ACCESS_NOTES_FROM_LOCK_SCREEN_OFF" value:@"Off" table:@"Settings"];
  v8 = [(ICSettingsQuickNoteController *)self stateSpecifierNamed:v7 state:0 group:v4];

  [v3 addObject:v8];
  v9 = [(ICSettingsQuickNoteController *)self settingsBundle];
  v10 = [v9 localizedStringForKey:@"ALWAYS_CREATE_NEW_NOTE" value:@"Always Create New Note" table:@"Settings"];
  uint64_t v11 = [(ICSettingsQuickNoteController *)self stateSpecifierNamed:v10 state:1 group:v4];

  v59 = (void *)v11;
  [v3 addObject:v11];
  v12 = [(ICSettingsQuickNoteController *)self settingsBundle];
  v13 = [v12 localizedStringForKey:@"RESUME_LAST_NOTE" value:@"Resume Last Note" table:@"Settings"];
  v14 = [(ICSettingsQuickNoteController *)self stateSpecifierNamed:v13 state:2 group:v4];

  [v3 addObject:v14];
  if ((v57 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v55 = v14;
    v56 = v8;
    v15 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v16 = [v15 localizedStringForKey:@"RESUME_LAST_NOTE_IPHONE_HEADER" value:@"RESUME LAST NOTE" table:@"Settings"];
    v17 = +[PSSpecifier groupSpecifierWithName:v16];

    [v17 setProperty:&__kCFBooleanTrue forKey:v5];
    v18 = [(ICSettingsQuickNoteController *)self footerString];
    uint64_t v53 = PSFooterTextGroupKey;
    objc_msgSend(v17, "setProperty:forKey:", v18);

    [v3 addObject:v17];
    v19 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v20 = [v19 localizedStringForKey:@"CREATED_ON_LOCK_SCREEN" value:@"Created on Lock Screen" table:@"Settings"];
    v21 = [(ICSettingsQuickNoteController *)self stateSpecifierNamed:v20 state:3 group:v17];

    [v3 addObject:v21];
    v22 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v23 = [v22 localizedStringForKey:@"VIEWED_IN_NOTES_APP" value:@"Viewed in Notes App" table:@"Settings"];
    v24 = [(ICSettingsQuickNoteController *)self stateSpecifierNamed:v23 state:4 group:v17];

    [v3 addObject:v24];
    v25 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v26 = v25;
    if (v57 == 3)
    {
      CFStringRef v27 = @"CREATE_NEW_NOTE_HEADER";
      CFStringRef v28 = @"CREATE NEW NOTE";
    }
    else
    {
      CFStringRef v27 = @"REQUIRE_PASSCODE_HEADER";
      CFStringRef v28 = @"REQUIRE PASSCODE";
    }
    uint64_t v31 = [v25 localizedStringForKey:v27 value:v28 table:@"Settings"];

    v54 = (void *)v31;
    v32 = +[PSSpecifier groupSpecifierWithName:v31];
    [v32 setProperty:&__kCFBooleanTrue forKey:v5];
    v33 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v34 = [v33 localizedStringForKey:@"DURATION_FOOTER" value:@"Shorter times are more secure." table:@"Settings"];
    [v32 setProperty:v34 forKey:v53];

    [v3 addObject:v32];
    if (v57 == 2)
    {
      v35 = [(ICSettingsQuickNoteController *)self settingsBundle];
      v36 = [v35 localizedStringForKey:@"QUICK_NOTE_DURATION_ZERO" value:@"Always" table:@"Settings"];
      v37 = [(ICSettingsQuickNoteController *)self durationSpecifierNamed:v36 duration:0 group:v32];

      [v3 addObject:v37];
    }
    v38 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v39 = [v38 localizedStringForKey:@"QUICK_NOTE_DURATION_FIVE_MINUTES" value:@"After 5 Minutes" table:@"Settings"];
    v58 = [(ICSettingsQuickNoteController *)self durationSpecifierNamed:v39 duration:300 group:v32];

    [v3 addObject:v58];
    v40 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v41 = [v40 localizedStringForKey:@"QUICK_NOTE_DURATION_FIFTEEN_MINUTES" value:@"After 15 Minutes" table:@"Settings"];
    v42 = [(ICSettingsQuickNoteController *)self durationSpecifierNamed:v41 duration:900 group:v32];

    [v3 addObject:v42];
    v43 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v44 = [v43 localizedStringForKey:@"QUICK_NOTE_DURATION_ONE_HOUR" value:@"After 1 Hour" table:@"Settings"];
    v45 = [(ICSettingsQuickNoteController *)self durationSpecifierNamed:v44 duration:3600 group:v32];

    [v3 addObject:v45];
    v46 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v47 = [v46 localizedStringForKey:@"QUICK_NOTE_DURATION_ALL_DAY" value:@"After Today" table:@"Settings"];
    v48 = [(ICSettingsQuickNoteController *)self durationSpecifierNamed:v47 duration:-2 group:v32];

    [v3 addObject:v48];
    v49 = [(ICSettingsQuickNoteController *)self settingsBundle];
    v50 = [v49 localizedStringForKey:@"QUICK_NOTE_DURATION_INFINITE" value:@"Never" table:@"Settings"];
    v51 = [(ICSettingsQuickNoteController *)self durationSpecifierNamed:v50 duration:-1 group:v32];

    [v3 addObject:v51];
    v14 = v55;
    v8 = v56;
    v30 = v59;
    v29 = v54;
  }
  else
  {
    v29 = [(ICSettingsQuickNoteController *)self footerString];
    [v4 setProperty:v29 forKey:PSFooterTextGroupKey];
    v30 = (void *)v11;
  }

  [(ICSettingsQuickNoteController *)self setSpecifiers:v3];

  return v3;
}

- (id)settingsBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)ICSettingsQuickNoteController;
  [(ICSettingsQuickNoteController *)&v33 tableView:a3 didSelectRowAtIndexPath:v7];
  v8 = [(ICSettingsQuickNoteController *)self specifierAtIndexPath:v7];
  objc_opt_class();
  v9 = [v8 userInfo];
  v10 = ICDynamicCast();

  if (![v7 section] || objc_msgSend(v7, "section") == (char *)&dword_0 + 1)
  {
    objc_opt_class();
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ICSettingsQuickNoteStateKey"];
    v12 = ICDynamicCast();

    if (v12)
    {
      switch((unint64_t)[v12 unsignedIntegerValue])
      {
        case 0uLL:
          uint64_t v13 = 0;
          goto LABEL_22;
        case 1uLL:
          uint64_t v13 = 1;
LABEL_22:
          +[ICQuickNoteSessionSettings setShowOnLockScreen:v13];
          goto LABEL_32;
        case 2uLL:
          v26 = &_s10Foundation3URLV19_bridgeToObjectiveCSo5NSURLCyF_ptr;
          goto LABEL_25;
        case 3uLL:
          v26 = &_s10Foundation3URLV19_bridgeToObjectiveCSo5NSURLCyF_ptr;
          if (+[ICQuickNoteSessionSettings showOnLockScreen] == (char *)&dword_0 + 3)goto LABEL_32; {
LABEL_25:
          }
          [v26[150] setShowOnLockScreen:3];
          v18 = v26[150];
          uint64_t v16 = 300;
          break;
        case 4uLL:
          if (+[ICQuickNoteSessionSettings showOnLockScreen] == (char *)&dword_0 + 2)goto LABEL_32; {
          +[ICQuickNoteSessionSettings setShowOnLockScreen:2];
          }
          v18 = ICQuickNoteSessionSettings;
          uint64_t v16 = 0;
          break;
        default:
          v19 = os_log_create("com.apple.notes", "QuickNote");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_11124((uint64_t)v12, v19, v20, v21, v22, v23, v24, v25);
          }
          goto LABEL_31;
      }
      goto LABEL_28;
    }
    v17 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1107C((uint64_t)self, a2);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  v14 = [v10 objectForKeyedSubscript:@"ICSettingsQuickNoteDurationKey"];
  v12 = ICDynamicCast();

  if (!v12)
  {
    v17 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_11190((uint64_t)self, a2);
    }
LABEL_14:

    goto LABEL_32;
  }
  v15 = (linkedit_data_command *)[v12 integerValue];
  uint64_t v16 = (uint64_t)v15;
  if ((uint64_t)v15 > 299)
  {
    if (v15 != (linkedit_data_command *)((char *)&stru_108.addr + 4)
      && v15 != &stru_E10
      && v15 != (linkedit_data_command *)&stru_338.reserved3)
    {
      goto LABEL_29;
    }
LABEL_18:
    v18 = ICQuickNoteSessionSettings;
LABEL_28:
    [v18 setSessionDuration:v16];
    goto LABEL_32;
  }
  if ((unint64_t)&v15->cmd + 2 < 3) {
    goto LABEL_18;
  }
LABEL_29:
  v19 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_11238((uint64_t)v12, v19, v27, v28, v29, v30, v31, v32);
  }
LABEL_31:

LABEL_32:
  [(ICSettingsQuickNoteController *)self reloadSpecifiers];
}

- (id)stateSpecifierNamed:(id)a3 state:(unint64_t)a4 group:(id)a5
{
  id v8 = a5;
  v9 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  CFStringRef v13 = @"ICSettingsQuickNoteStateKey";
  v10 = +[NSNumber numberWithUnsignedInteger:a4];
  v14 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v9 setUserInfo:v11];

  if ([(ICSettingsQuickNoteController *)self stateIsSet:a4]) {
    [v8 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  }

  return v9;
}

- (id)durationSpecifierNamed:(id)a3 duration:(int64_t)a4 group:(id)a5
{
  id v8 = a5;
  v9 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  CFStringRef v13 = @"ICSettingsQuickNoteDurationKey";
  v10 = +[NSNumber numberWithInteger:a4];
  v14 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v9 setUserInfo:v11];

  if (+[ICQuickNoteSessionSettings sessionDuration] == (id)a4) {
    [v8 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  }

  return v9;
}

- (BOOL)stateIsSet:(unint64_t)a3
{
  unint64_t v4 = (unint64_t)+[ICQuickNoteSessionSettings showOnLockScreen];
  switch(a3)
  {
    case 0uLL:
      BOOL v5 = v4 == 0;
      goto LABEL_10;
    case 1uLL:
      BOOL v5 = v4 == 1;
      goto LABEL_10;
    case 2uLL:
      BOOL v5 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 2;
      goto LABEL_10;
    case 3uLL:
      BOOL v5 = v4 == 3;
      goto LABEL_10;
    case 4uLL:
      BOOL v5 = v4 == 2;
LABEL_10:
      BOOL result = v5;
      break;
    default:
      v6 = os_log_create("com.apple.notes", "QuickNote");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_112A4(a3, v6, v7, v8, v9, v10, v11, v12);
      }

      BOOL result = 0;
      break;
  }
  return result;
}

- (id)footerString
{
  v3 = (char *)+[ICQuickNoteSessionSettings showOnLockScreen];
  int v4 = MGGetBoolAnswer();
  if (v3 == (unsigned char *)&dword_0 + 3)
  {
    v6 = [(ICSettingsQuickNoteController *)self settingsBundle];
    uint64_t v7 = v6;
    CFStringRef v8 = @"RESUME_LAST_NOTE_CREATED_HELP";
    CFStringRef v9 = @"Resume the last note created on the Lock Screen, or create a new note after some amount of time.";
  }
  else if (v3 == (unsigned char *)&dword_0 + 2)
  {
    v6 = [(ICSettingsQuickNoteController *)self settingsBundle];
    uint64_t v7 = v6;
    CFStringRef v8 = @"RESUME_LAST_NOTE_VIEWED_HELP";
    CFStringRef v9 = @"Resume the last note viewed in the Notes app, and require a passcode after some amount of time.";
  }
  else
  {
    if (v3 != (unsigned char *)&dword_0 + 1)
    {
      uint64_t v10 = 0;
      goto LABEL_11;
    }
    int v5 = v4;
    v6 = [(ICSettingsQuickNoteController *)self settingsBundle];
    uint64_t v7 = v6;
    if (v5)
    {
      CFStringRef v8 = @"ALWAYS_CREATE_NEW_NOTE_HELP_PENCIL";
      CFStringRef v9 = @"Always create a new note when tapping anywhere on the Lock Screen with Apple Pencil, or pressing the Notes control in Control Center.";
    }
    else
    {
      CFStringRef v8 = @"ALWAYS_CREATE_NEW_NOTE_HELP_NO_PENCIL";
      CFStringRef v9 = @"Always create a new note when pressing the Notes control in Control Center.";
    }
  }
  uint64_t v10 = [v6 localizedStringForKey:v8 value:v9 table:@"Settings"];

LABEL_11:

  return v10;
}

@end