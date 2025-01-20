@interface CSLPRFStingSettingsViewController
- (CSLPRFStingSettingsViewController)init;
- (id)_gesturePaneChordFooterTextForActionType:(unint64_t)a3;
- (id)_gesturePaneFooterTextForActionType:(unint64_t)a3;
- (id)_gesturePaneSpecifiersForActionType:(unint64_t)a3;
- (id)_holdToActivateMandrakeForSpecifier:(id)a3;
- (id)_makeListItemSpecifier:(id)a3 label:(id)a4 icon:(id)a5 detail:(Class)a6;
- (id)_mandrakeSpecifiers;
- (id)_quickSwitchSpecifiers;
- (id)_selectedAccessibilitySpecifier;
- (id)_selectedActionItemSpecifierForActionType:(unint64_t)a3;
- (id)_selectedAppSpecifier:(id)a3 detail:(Class)a4;
- (id)_selectedShortcutSpecifier;
- (id)_selectedWorkoutItemForIdentifier:(id)a3 workoutItems:(id)a4;
- (id)_specifiersForActionType:(unint64_t)a3;
- (id)_specifiersForUnconfiguredAction;
- (id)_workoutSpecifiersForActionType:(unint64_t)a3 bundleID:(id)a4 workoutIdentifier:(id)a5;
- (id)specifiers;
- (void)_deregisterMandrakeSettingsListener;
- (void)_registerMandrakeSettingsListener;
- (void)_setHoldToActivateMandrake:(id)a3 forSpecifier:(id)a4;
- (void)addSelectedAppRowWithTitle:(id)a3 specifiers:(id)a4;
- (void)dealloc;
- (void)reloadSpecifiers;
- (void)viewDidLoad;
@end

@implementation CSLPRFStingSettingsViewController

- (CSLPRFStingSettingsViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSLPRFStingSettingsViewController;
  v2 = [(CSLPRFStingSettingsViewController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:0];
    appLibrary = v2->_appLibrary;
    v2->_appLibrary = (CSLPRFApplicationLibrary *)v3;

    v5 = (CSLPRFStingConfiguration *)[objc_alloc((Class)CSLPRFStingConfiguration) initWithDelegate:v2];
    stingConfiguration = v2->_stingConfiguration;
    v2->_stingConfiguration = v5;

    v7 = (CSLPRFStingSettingsModel *)objc_alloc_init((Class)CSLPRFStingSettingsModel);
    model = v2->_model;
    v2->_model = v7;
  }
  return v2;
}

- (void)dealloc
{
  [(CSLPRFStingSettingsViewController *)self _deregisterMandrakeSettingsListener];
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFStingSettingsViewController;
  [(CSLPRFStingSettingsViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFStingSettingsViewController;
  [(CSLPRFStingSettingsViewController *)&v5 viewDidLoad];
  objc_super v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ROOT_CONTROLLER_TITLE" value:&stru_C350 table:@"LocalizableSettings-N199"];
  [(CSLPRFStingSettingsViewController *)self setTitle:v4];

  [(CSLPRFStingSettingsViewController *)self _registerMandrakeSettingsListener];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(CSLPRFStingConfiguration *)self->_stingConfiguration actionType];
    if (v5) {
      [(CSLPRFStingSettingsViewController *)self _specifiersForActionType:v5];
    }
    else {
    v6 = [(CSLPRFStingSettingsViewController *)self _specifiersForUnconfiguredAction];
    }
    v7 = [(CSLPRFStingSettingsViewController *)self _quickSwitchSpecifiers];
    [v6 addObjectsFromArray:v7];

    v8 = [(CSLPRFStingSettingsViewController *)self _mandrakeSpecifiers];
    [v6 addObjectsFromArray:v8];

    id v9 = [v6 copy];
    objc_super v10 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v9;

    v11 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)&self->PSListController_opaque[v3];
      int v14 = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%@: loaded specifiers %@", (uint8_t *)&v14, 0x16u);
    }

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_specifiersForUnconfiguredAction
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsChooseActionTypeGroupID"];
  [v3 addObject:v4];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CHOOSE_STING_ACTION" value:&stru_C350 table:@"LocalizableSettings-N199"];
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v7 setProperty:self->_model forKey:@"StingSettingsModel"];
  [v7 setIdentifier:@"StingSystemSettingsChooseActionTypeItem"];
  [v3 addObject:v7];

  return v3;
}

- (id)_specifiersForActionType:(unint64_t)a3
{
  id v5 = +[NSMutableArray array];
  v21 = [(CSLPRFStingConfiguration *)self->_stingConfiguration bundleID];
  v6 = [(CSLPRFStingConfiguration *)self->_stingConfiguration workoutIdentifier];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"ACTION" value:&stru_C350 table:@"LocalizableSettings-N199"];
  id v9 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsActionTypeGroupID" name:v8];

  [v5 addObject:v9];
  objc_super v10 = [(CSLPRFStingSettingsViewController *)self _selectedActionItemSpecifierForActionType:a3];
  [v5 addObject:v10];
  if ((uint64_t)a3 <= 17)
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_16;
      case 2uLL:
        v11 = [(CSLPRFStingSettingsViewController *)self _selectedShortcutSpecifier];
        if (!v11) {
          goto LABEL_14;
        }
        uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
        v13 = [v12 localizedStringForKey:@"SHORTCUT_TITLE" value:&stru_C350 table:@"LocalizableSettings-N199"];
        CFStringRef v14 = @"StingSystemSettingsShortcutsGroupID";
        goto LABEL_13;
      case 6uLL:
      case 9uLL:
        goto LABEL_8;
      default:
        goto LABEL_15;
    }
  }
  if (a3 != 18)
  {
    if (a3 == 38)
    {
      v11 = [(CSLPRFStingSettingsViewController *)self _selectedAccessibilitySpecifier];
      if (v11)
      {
        uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
        v13 = [v12 localizedStringForKey:@"ACCESSIBILITY_TITLE" value:&stru_C350 table:@"LocalizableSettings-N199"];
        CFStringRef v14 = @"StingSystemSettingsAccessibilityGroupID";
LABEL_13:
        v18 = +[PSSpecifier groupSpecifierWithID:name:](PSSpecifier, "groupSpecifierWithID:name:", v14, v13, PSSpecifier);

        [v5 addObject:v18];
        [v5 addObject:v11];
      }
    }
    else
    {
      if (a3 != 20)
      {
LABEL_15:
        v19 = [(CSLPRFStingSettingsViewController *)self _gesturePaneSpecifiersForActionType:a3];
        [v5 addObjectsFromArray:v19];

        goto LABEL_16;
      }
LABEL_8:
      v15 = +[NSBundle bundleForClass:objc_opt_class()];
      __int16 v16 = [v15 localizedStringForKey:@"APP" value:&stru_C350 table:@"LocalizableSettings-N199"];
      uint64_t v17 = [v16 localizedUppercaseString];
      [(CSLPRFStingSettingsViewController *)self addSelectedAppRowWithTitle:v17 specifiers:v5];

      if (a3 != 6 && a3 != 9) {
        goto LABEL_15;
      }
      v11 = [(CSLPRFStingSettingsViewController *)self _workoutSpecifiersForActionType:a3 bundleID:v21 workoutIdentifier:v6];
      [v5 addObjectsFromArray:v11];
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (id)_gesturePaneSpecifiersForActionType:(unint64_t)a3
{
  id v5 = +[NSMutableArray array];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"GESTURE_PANE_TITLE" value:&stru_C350 table:@"LocalizableSettings-N199"];
  v8 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsActionTypeGroupID" name:v7];

  v25 = [(CSLPRFStingSettingsViewController *)self _gesturePaneFooterTextForActionType:a3];
  objc_msgSend(v8, "setProperty:forKey:");
  uint64_t v24 = PSFooterAlignmentGroupKey;
  objc_msgSend(v8, "setProperty:forKey:", &off_CD80);
  [v5 addObject:v8];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = PSCellClassKey;
  [v9 setProperty:v10 forKey:PSCellClassKey];
  +[CSLPRFStingGesturePaneCell preferredCellHeight];
  uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v13 = PSTableCellHeightKey;
  [v9 setProperty:v12 forKey:PSTableCellHeightKey];

  CFStringRef v14 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:a3];
  if (v14) {
    [v9 setProperty:v14 forKey:@"CSLPRFStingGesturePaneCellSymbolName"];
  }
  [v5 addObject:v9];
  if (CSLHasChordActionInstructions())
  {
    uint64_t v15 = CSLChordAction();
    if (v15 != a3)
    {
      uint64_t v16 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:v15];

      CFStringRef v14 = (void *)v16;
    }
    uint64_t v17 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsGesturesGroupTwoID"];
    v23 = [(CSLPRFStingSettingsViewController *)self _gesturePaneChordFooterTextForActionType:a3];
    objc_msgSend(v17, "setProperty:forKey:");
    [v17 setProperty:&off_CD80 forKey:v24];
    v18 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v18 setProperty:objc_opt_class() forKey:v11];
    +[CSLPRFStingGesturePaneCell preferredCellHeight];
    v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v18 setProperty:v19 forKey:v13];

    if (v14) {
      [v18 setProperty:v14 forKey:@"CSLPRFStingGesturePaneCellSymbolName"];
    }
    v20 = +[NSNumber numberWithBool:1];
    [v18 setProperty:v20 forKey:@"CSLPRFStingGesturePaneCellHasChordArrow"];
    [v5 addObject:v17];
    [v5 addObject:v18];
  }
  id v21 = [v5 copy];

  return v21;
}

- (id)_gesturePaneFooterTextForActionType:(unint64_t)a3
{
  uint64_t v3 = 0;
  if ((uint64_t)a3 <= 24)
  {
    switch(a3)
    {
      case 1uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_FLASHLIGHT_SINGLE_PRESS";
        goto LABEL_24;
      case 2uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_SHORTCUT_SINGLE_PRESS";
        goto LABEL_24;
      case 4uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_STOPWATCH_SINGLE_PRESS";
        goto LABEL_24;
      case 5uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_WAYPOINT_SINGLE_PRESS";
        goto LABEL_24;
      case 6uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_WORKOUT_SINGLE_PRESS";
        goto LABEL_24;
      case 9uLL:
        id v9 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = [v9 localizedStringForKey:@"GESTURE_PANE_WORKOUT_OPEN" value:&stru_C350 table:@"LocalizableSettings-N199"];

        uint64_t v10 = [(CSLPRFStingConfiguration *)self->_stingConfiguration bundleID];
        uint64_t v11 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:0];
        uint64_t v12 = [v11 applicationWithBundleIdentifier:v10];
        uint64_t v13 = [v12 localizedName];

        if (![v13 length])
        {
          CFStringRef v14 = +[NSBundle bundleForClass:objc_opt_class()];
          uint64_t v15 = [v14 localizedStringForKey:@"APP" value:&stru_C350 table:@"LocalizableSettings-N199"];

          uint64_t v13 = (void *)v15;
        }
        uint64_t v3 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v13);

        goto LABEL_26;
      case 0xCuLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_BACKTRACK_SINGLE_PRESS";
        goto LABEL_24;
      case 0x14uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_DIVE_SINGLE_PRESS";
        goto LABEL_24;
      default:
        goto LABEL_27;
    }
    goto LABEL_27;
  }
  if ((uint64_t)a3 <= 33)
  {
    if (a3 != 25)
    {
      if (a3 != 29) {
        goto LABEL_27;
      }
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      id v5 = v4;
      CFStringRef v6 = @"GESTURE_PANE_TRANSLATE_SINGLE_PRESS";
      CFStringRef v7 = @"LocalizableSettings-Translate";
      goto LABEL_25;
    }
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"GESTURE_PANE_VOICE_MEMO_SINGLE_PRESS";
  }
  else
  {
    switch(a3)
    {
      case '""':
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_REGATTA_SINGLE_PRESS";
        CFStringRef v7 = @"LocalizableSettings-Squall";
        goto LABEL_25;
      case '&':
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_ACCESSIBLITY_SINGLE_PRESS";
        break;
      case '(':
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_RECOGNIZE_MUSIC_SINGLE_PRESS";
        break;
      default:
        goto LABEL_27;
    }
  }
LABEL_24:
  CFStringRef v7 = @"LocalizableSettings-N199";
LABEL_25:
  uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_C350 table:v7];
LABEL_26:

LABEL_27:

  return v3;
}

- (id)_gesturePaneChordFooterTextForActionType:(unint64_t)a3
{
  uint64_t v3 = 0;
  if ((uint64_t)a3 > 11)
  {
    switch(a3)
    {
      case 0xCuLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_BACKTRACK_CHORD";
        break;
      case 0x14uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_DIVE_CHORD";
        break;
      case 0x22uLL:
        v4 = +[NSBundle bundleForClass:objc_opt_class()];
        id v5 = v4;
        CFStringRef v6 = @"GESTURE_PANE_REGATTA_CHORD";
        CFStringRef v7 = @"LocalizableSettings-Squall";
        goto LABEL_12;
      default:
        goto LABEL_13;
    }
LABEL_11:
    CFStringRef v7 = @"LocalizableSettings-N199";
LABEL_12:
    uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_C350 table:v7];

    goto LABEL_13;
  }
  if (a3 == 4 || a3 == 6)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"GESTURE_PANE_PAUSE_CHORD";
    goto LABEL_11;
  }
LABEL_13:

  return v3;
}

- (void)addSelectedAppRowWithTitle:(id)a3 specifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSLPRFStingConfiguration *)self->_stingConfiguration bundleID];
  id v9 = [(CSLPRFApplicationLibrary *)self->_appLibrary applicationWithBundleIdentifier:v8];
  if (v9)
  {
    uint64_t v10 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsSelectedAppGroupID" name:v6];
    [v7 addObject:v10];
    uint64_t v11 = [(CSLPRFStingSettingsViewController *)self _selectedAppSpecifier:v9 detail:objc_opt_class()];
    if (v11) {
      [v7 addObject:v11];
    }
  }
  else
  {
    uint64_t v12 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_87A8((uint64_t)v8, v12);
    }
  }
}

- (id)_selectedShortcutSpecifier
{
  uint64_t v3 = [(CSLPRFStingConfiguration *)self->_stingConfiguration workoutIdentifier];
  v4 = [(CSLPRFStingSettingsModel *)self->_model shortcutItems];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_36C0;
  v18 = sub_36D0;
  v19 = &stru_C350;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_36D8;
  uint64_t v11 = &unk_C2C0;
  id v5 = v3;
  id v12 = v5;
  uint64_t v13 = &v14;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];
  id v6 = [(CSLPRFStingSettingsViewController *)self _makeListItemSpecifier:@"StingSystemSettingsShortcuts", v15[5], 0, objc_opt_class(), v8, v9, v10, v11 label icon detail];

  _Block_object_dispose(&v14, 8);

  return v6;
}

- (id)_selectedAccessibilitySpecifier
{
  uint64_t v3 = [(CSLPRFStingConfiguration *)self->_stingConfiguration workoutIdentifier];
  [(CSLPRFStingSettingsModel *)self->_model accessibilityItems];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    v8 = &stru_C350;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v15);
        unsigned int v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          v8 = [v10 title];
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    v8 = &stru_C350;
  }
LABEL_12:

  uint64_t v13 = [(CSLPRFStingSettingsViewController *)self _makeListItemSpecifier:@"StingSystemSettingsAccessibility" label:v8 icon:0 detail:objc_opt_class()];

  return v13;
}

- (id)_workoutSpecifiersForActionType:(unint64_t)a3 bundleID:(id)a4 workoutIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[NSMutableArray array];
  uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v12 = [v11 localizedStringForKey:@"FIRST_PRESS" value:&stru_C350 table:@"LocalizableSettings-N199"];
  uint64_t v13 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsWorkoutGroupID" name:v12];

  [v10 addObject:v13];
  if (a3 == 6)
  {
    uint64_t v14 = [(CSLPRFStingSettingsModel *)self->_model startWorkoutsListForBundleID:v8];
    long long v15 = [(CSLPRFStingSettingsViewController *)self _selectedWorkoutItemForIdentifier:v9 workoutItems:v14];
    long long v16 = [v15 title];
    long long v17 = [v15 subtitle];
    long long v18 = &CSLActionTypeToSettingsActionType_ptr;
  }
  else
  {
    id v26 = v8;
    uint64_t v14 = [(CSLPRFStingConfiguration *)self->_stingConfiguration bundleID];
    v19 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:0];
    v20 = [v19 applicationWithBundleIdentifier:v14];
    long long v15 = [v20 localizedName];

    if (v15 && [v15 length])
    {
      id v21 = +[NSBundle bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"OPEN_APP_NAME" value:&stru_C350 table:@"LocalizableSettings-N199"];
      long long v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v15);

      long long v17 = 0;
    }
    else
    {
      long long v17 = 0;
      long long v16 = 0;
    }
    id v8 = v26;
    long long v18 = &CSLActionTypeToSettingsActionType_ptr;
  }

  v23 = [v18[62] preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v23 setProperty:v17 forKey:PSTableCellSubtitleTextKey];
  [v23 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v23 setProperty:self->_model forKey:@"StingSettingsModel"];
  [v10 addObject:v23];
  id v24 = [v10 copy];

  return v24;
}

- (id)_selectedWorkoutItemForIdentifier:(id)a3 workoutItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        unsigned int v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 workoutIdentifier];
        unsigned int v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          id v15 = v12;

          id v9 = v15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_selectedAppSpecifier:(id)a3 detail:(Class)a4
{
  id v6 = a3;
  id v7 = [v6 localizedName];
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:a4 cell:2 edit:0];

  [v8 setApp:v6];
  id v9 = [v6 bundleIdentifier];
  [v8 setIdentifier:v9];

  uint64_t v10 = [v6 bundleIdentifier];

  [v8 setProperty:v10 forKey:PSLazyIconAppID];
  [v8 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v8 setProperty:self->_model forKey:@"StingSettingsModel"];

  return v8;
}

- (id)_selectedActionItemSpecifierForActionType:(unint64_t)a3
{
  if (a3 != 18 && a3)
  {
    id v6 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:a3];
    id v8 = +[UIImage _systemImageNamed:v6];
    id v9 = +[UIColor systemWhiteColor];
    uint64_t v10 = [v8 imageWithTintColor:v9 renderingMode:1];

    uint64_t v11 = +[CSLPRFStingSettingsModel actionNameForActionType:a3];
    id v7 = [(CSLPRFStingSettingsViewController *)self _makeListItemSpecifier:@"StingSystemSettingsActionTypeItem" label:v11 icon:v10 detail:objc_opt_class()];
  }
  else
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"NONE_ACTION" value:&stru_C350 table:@"LocalizableSettings-N199"];

    id v7 = [(CSLPRFStingSettingsViewController *)self _makeListItemSpecifier:@"StingSystemSettingsActionTypeItem" label:v6 icon:0 detail:objc_opt_class()];
  }

  return v7;
}

- (void)reloadSpecifiers
{
  [(CSLPRFStingSettingsViewController *)self setSpecifiers:0];
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFStingSettingsViewController;
  [(CSLPRFStingSettingsViewController *)&v3 reloadSpecifiers];
}

- (id)_makeListItemSpecifier:(id)a3 label:(id)a4 icon:(id)a5 detail:(Class)a6
{
  id v10 = a3;
  id v11 = a5;
  unsigned int v12 = +[PSSpecifier preferenceSpecifierNamed:a4 target:self set:0 get:0 detail:a6 cell:2 edit:0];
  uint64_t v13 = v12;
  if (v11) {
    [v12 setProperty:v11 forKey:PSIconImageKey];
  }
  [v13 setIdentifier:v10];
  [v13 setProperty:self->_model forKey:@"StingSettingsModel"];

  return v13;
}

- (id)_quickSwitchSpecifiers
{
  objc_super v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsShowQuickSwitchGroupID"];
  [v3 addObject:v4];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"QUICK_SWITCH" value:&stru_C350 table:@"LocalizableSettings-N199"];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v3 addObject:v7];

  return v3;
}

- (id)_mandrakeSpecifiers
{
  objc_super v3 = +[NSMutableArray array];
  if (+[SOSUtilities activeDeviceHasMandrake])
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"ACTIVATE_MANDRAKE_HEADER" value:&stru_C350 table:@"LocalizableSettings-N199"];
    id v6 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsMandrakeActivationGroupID" name:v5];

    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"ACTIVATE_MANDRAKE_FOOTER" value:&stru_C350 table:@"LocalizableSettings-N199"];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v3 addObject:v6];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"ACTIVATE_MANDRAKE_TOGGLE_LABEL" value:&stru_C350 table:@"LocalizableSettings-N199"];
    id v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"_setHoldToActivateMandrake:forSpecifier:" get:"_holdToActivateMandrakeForSpecifier:" detail:0 cell:6 edit:0];

    [v3 addObject:v11];
  }

  return v3;
}

- (void)_registerMandrakeSettingsListener
{
  objc_initWeak(&location, self);
  objc_super v3 = (const char *)[SOSMandrakeStateChangedNotification UTF8String];
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_46C8;
  v5[3] = &unk_C2E8;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_stingActivatesMandrakeNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_deregisterMandrakeSettingsListener
{
  int stingActivatesMandrakeNotifyToken = self->_stingActivatesMandrakeNotifyToken;
  if (stingActivatesMandrakeNotifyToken != -1)
  {
    notify_cancel(stingActivatesMandrakeNotifyToken);
    self->_int stingActivatesMandrakeNotifyToken = -1;
  }
}

- (void)_setHoldToActivateMandrake:(id)a3 forSpecifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  +[SOSUtilities setLongPressTriggersMandrake:v4];
}

- (id)_holdToActivateMandrakeForSpecifier:(id)a3
{
  id v3 = +[SOSUtilities longPressTriggersMandrake];

  return +[NSNumber numberWithBool:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_stingConfiguration, 0);
}

@end