@interface ICSettingsPlugin
- (BOOL)hasMigratedLocalAccountWithNotes;
- (BOOL)localAccountExists;
- (BOOL)localAccountHasNotes;
- (ICSettingsPlugin)initWithCoder:(id)a3;
- (ICSettingsPlugin)initWithNibName:(id)a3 bundle:(id)a4;
- (NSURL)persistentStoreURL;
- (PSSystemPolicyForApp)systemPolicy;
- (id)_accountTitlesForSpecifier:(id)a3;
- (id)_accountValuesForSpecifier:(id)a3;
- (id)_accountsSpecifiers;
- (id)_appLinksSpecifiers;
- (id)_appPolicySpecifiers;
- (id)_currentDateHeadersType:(id)a3;
- (id)_currentNoteSortType:(id)a3;
- (id)_defaultNotesAccountSyncId:(id)a3;
- (id)_getAccessNotesFromLockScreen:(id)a3;
- (id)_getLocalNotesEnabled:(id)a3;
- (id)_getMentionsShouldNotifyMe:(id)a3;
- (id)_getShouldAutoConvertToTag:(id)a3;
- (id)_getShouldResumeLastQuickNote:(id)a3;
- (id)_getShouldSavePhotosVideos:(id)a3;
- (id)_getShouldShowQuickNoteLinksBar:(id)a3;
- (id)_getShouldShowQuickNoteSuggestions:(id)a3;
- (id)_getShowPasswordScreen:(id)a3;
- (id)_getSortCheckedItems:(id)a3;
- (id)_getUseDarkBackgroundsForNoteContent:(id)a3;
- (id)_heroPlacardSpecifiers;
- (id)_localAccountSpecifiers;
- (id)_lockscreenSpecifiers;
- (id)_mediaSpecifiers;
- (id)_mentionsSpecifiers;
- (id)_noteDefaultStyle:(id)a3;
- (id)_notePaperStyle:(id)a3;
- (id)_systemPaperSpecifiers;
- (id)_tagsSpecifiers;
- (id)_viewingSpecifiers;
- (id)allAccountsIncludingThoseInHTMLNoteContext:(id)a3;
- (id)localAccount;
- (id)localAccountName;
- (id)settingsBundle;
- (id)specifiers;
- (void)_setDateHeadersType:(id)a3 withSpecifier:(id)a4;
- (void)_setDefaultNotesAccountSyncId:(id)a3 withSpecifier:(id)a4;
- (void)_setLocalNotesEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_setMentionsShouldNotifyMe:(id)a3 withSpecifier:(id)a4;
- (void)_setNoteDefaultStyle:(id)a3 withSpecifier:(id)a4;
- (void)_setNoteSortType:(id)a3 withSpecifier:(id)a4;
- (void)_setShouldAutoConvertToTag:(id)a3 withSpecifier:(id)a4;
- (void)_setShouldResumeLastQuickNote:(id)a3 withSpecifier:(id)a4;
- (void)_setShouldSavePhotosVideos:(id)a3 withSpecifier:(id)a4;
- (void)_setShouldShowQuickNoteLinksBar:(id)a3 withSpecifier:(id)a4;
- (void)_setShouldShowQuickNoteSuggestions:(id)a3 withSpecifier:(id)a4;
- (void)_setUseDarkBackgroundsForNoteContent:(id)a3 withSpecifier:(id)a4;
- (void)_showPaperStyleScreen:(id)a3;
- (void)_showPasswordScreen:(id)a3;
- (void)addLocalAccount;
- (void)dealloc;
- (void)deleteLocalAccount;
- (void)registerForTraitChanges;
- (void)setPersistentStoreURL:(id)a3;
- (void)setSystemPolicy:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICSettingsPlugin

- (ICSettingsPlugin)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICSettingsPlugin;
  v4 = [(ICSettingsPlugin *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"accountsDidChange" name:ICAccountsDidChangeNotification object:0];

    [(ICSettingsPlugin *)v4 registerForTraitChanges];
  }
  return v4;
}

- (ICSettingsPlugin)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICSettingsPlugin;
  v3 = [(ICSettingsPlugin *)&v6 initWithCoder:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"accountsDidChange" name:ICAccountsDidChangeNotification object:0];

    [(ICSettingsPlugin *)v3 registerForTraitChanges];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSettingsPlugin;
  [(ICSettingsPlugin *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsPlugin;
  [(ICSettingsPlugin *)&v4 viewWillAppear:a3];
  +[ICQuickNoteSessionSettings disableNotesOnLockScreenIfNecessary];
  [(ICSettingsPlugin *)self reloadSpecifiers];
  if ((+[UIDevice ic_isVision] & 1) == 0) {
    [(ICSettingsPlugin *)self setTitle:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsPlugin;
  [(ICSettingsPlugin *)&v4 viewDidAppear:a3];
  [(ICSettingsPlugin *)self ic_submitNavigationEventForIdentifier:0 titleStringKey:@"Notes" navigationComponents:&__NSArray0__struct];
}

- (void)registerForTraitChanges
{
  id v4 = +[UITraitCollection ic_traitsAffectingSizeAndColor];
  id v3 = [(ICSettingsPlugin *)self registerForTraitChanges:v4 withAction:"reloadSpecifiers"];
}

- (BOOL)localAccountExists
{
  id v3 = +[ICSettingsUtilities objectForKey:kICDefaultsKeyDidMigrateLocalAccount];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [(ICSettingsPlugin *)self localAccount];
    id v6 = v5;
    if (v5) {
      unsigned __int8 v7 = [v5 didChooseToMigrate];
    }
    else {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    id v6 = objc_alloc_init((Class)NoteContext);
    v8 = [v6 localAccount];
    unsigned __int8 v7 = v8 != 0;
  }
  return v7;
}

- (BOOL)localAccountHasNotes
{
  id v3 = +[ICSettingsUtilities objectForKey:kICDefaultsKeyDidMigrateLocalAccount];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [(ICSettingsPlugin *)self localAccount];
    id v6 = v5;
    BOOL v7 = v5
      && [v5 didChooseToMigrate]
      && [v6 visibleNotesIncludingTrashCount] != 0;
  }
  else
  {
    id v6 = objc_alloc_init((Class)NoteContext);
    v8 = [v6 localAccount];
    if (v8) {
      BOOL v7 = [v6 countOfVisibleNotesInCollection:v8] != 0;
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (id)localAccountName
{
  return +[ICAccount localizedLocalAccountName];
}

- (id)localAccount
{
  v2 = +[ICNoteContext sharedContext];
  [v2 refreshAll];
  id v3 = [v2 managedObjectContext];
  unsigned int v4 = +[ICAccount localAccountInContext:v3];

  return v4;
}

- (void)deleteLocalAccount
{
  id v5 = +[ICNoteContext sharedContext];
  v2 = [v5 managedObjectContext];
  id v3 = +[ICAccount localAccountInContext:v2];

  if (v3)
  {
    +[ICAccount deleteAccount:v3];
    [v5 save];
  }
  +[ICSettingsUtilities setObject:&__kCFBooleanTrue forKey:kICDefaultsKeyDidMigrateLocalAccount];
  unsigned int v4 = [v5 crossProcessChangeCoordinator];
  [v4 postAccountDidChangeNotification];

  +[ICQuickNoteSessionSettings disableNotesOnLockScreenIfNecessary];
}

- (void)addLocalAccount
{
  id v8 = +[ICNoteContext sharedContext];
  v2 = +[ICNoteContext sharedContext];
  id v3 = [v2 managedObjectContext];
  unsigned int v4 = +[ICAccount localAccountInContext:v3];

  if (!v4)
  {
    id v5 = +[ICNoteContext sharedContext];
    id v6 = [v5 managedObjectContext];

    [v8 save];
    BOOL v7 = [v8 crossProcessChangeCoordinator];
    [v7 postAccountDidChangeNotification];

    +[ICQuickNoteSessionSettings updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded];
  }
}

- (BOOL)hasMigratedLocalAccountWithNotes
{
  id v3 = +[ICSettingsUtilities objectForKey:kICDefaultsKeyDidMigrateLocalAccount];
  unsigned int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0;
  }
  id v5 = [(ICSettingsPlugin *)self localAccount];
  BOOL v6 = [v5 visibleNotesIncludingTrashCount] != 0;

  return v6;
}

- (id)allAccountsIncludingThoseInHTMLNoteContext:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[ICNoteContext sharedContext];
  id v5 = +[NSMutableArray array];
  BOOL v6 = [v4 managedObjectContext];
  BOOL v7 = +[ICAccount allActiveAccountsInContext:v6];

  if ([v7 count]) {
    [v5 addObjectsFromArray:v7];
  }
  id v8 = [v3 allAccounts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v13
          && ([*(id *)(*((void *)&v16 + 1) + 8 * i) didChooseToMigrate] & 1) == 0)
        {
          [v5 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  id v14 = [v5 copy];

  return v14;
}

- (PSSystemPolicyForApp)systemPolicy
{
  systemPolicy = self->_systemPolicy;
  if (!systemPolicy)
  {
    unsigned int v4 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:ICSettingsBundleID()];
    id v5 = self->_systemPolicy;
    self->_systemPolicy = v4;

    [(PSSystemPolicyForApp *)self->_systemPolicy setDelegate:self];
    systemPolicy = self->_systemPolicy;
  }

  return systemPolicy;
}

- (id)settingsBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)specifiers
{
  id v3 = +[ICNoteContext sharedContext];

  if (v3)
  {
    unsigned int v4 = [(ICSettingsPlugin *)self persistentStoreURL];
    id v5 = +[ICPaths persistentStoreURL];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = +[ICNoteContext sharedContext];
      [v7 clearPersistentContainer];

      id v8 = +[ICNoteContext sharedContext];
      [v8 setupCrossProcessChangeCoordinator];

      id v9 = +[ICNoteContext sharedContext];
      [v9 loadAdditionalPersistentStores];

      id v10 = +[ICPaths persistentStoreURL];
      [(ICSettingsPlugin *)self setPersistentStoreURL:v10];
    }
  }
  else
  {
    uint64_t v11 = +[AccountUtilities sharedAccountUtilities];
    [v11 startKeepingAccountInfosUpToDate];

    +[ICPluginUtilities setupNoteContextWithOptions:1573396];
  }
  v12 = +[ICNoteContext sharedContext];

  if (!v12) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((ICNoteContext.sharedContext) != nil)", "-[ICSettingsPlugin specifiers]", 1, 0, @"Expected non-nil value for '%s'", "ICNoteContext.sharedContext");
  }
  uint64_t v13 = +[NSMutableArray array];
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    id v14 = [(ICSettingsPlugin *)self _heroPlacardSpecifiers];
    [v13 addObjectsFromArray:v14];
  }
  v15 = [(ICSettingsPlugin *)self _appPolicySpecifiers];
  [v13 addObjectsFromArray:v15];

  long long v16 = [(ICSettingsPlugin *)self _accountsSpecifiers];
  [v13 addObjectsFromArray:v16];

  long long v17 = [(ICSettingsPlugin *)self _localAccountSpecifiers];
  [v13 addObjectsFromArray:v17];

  long long v18 = [(ICSettingsPlugin *)self _mentionsSpecifiers];
  [v13 addObjectsFromArray:v18];

  long long v19 = [(ICSettingsPlugin *)self _viewingSpecifiers];
  [v13 addObjectsFromArray:v19];

  if (ICInternalSettingsIsSystemPaperEnabled()
    && +[ICDeviceSupport deviceSupportsSystemPaper])
  {
    if (+[UIDevice ic_isiPad])
    {
      v20 = [(ICSettingsPlugin *)self _systemPaperSpecifiers];
      [v13 addObjectsFromArray:v20];
    }
    v21 = [(ICSettingsPlugin *)self _appLinksSpecifiers];
    [v13 addObjectsFromArray:v21];
  }
  v22 = [(ICSettingsPlugin *)self _tagsSpecifiers];
  [v13 addObjectsFromArray:v22];

  v23 = [(ICSettingsPlugin *)self _mediaSpecifiers];
  [v13 addObjectsFromArray:v23];

  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    v24 = [(ICSettingsPlugin *)self _lockscreenSpecifiers];
    [v13 addObjectsFromArray:v24];
  }
  [(ICSettingsPlugin *)self setSpecifiers:v13];

  return v13;
}

- (id)_heroPlacardSpecifiers
{
  id v3 = +[PSSpecifier emptyGroupSpecifier];
  unsigned int v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_1DFC8 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v4 setObject:NSClassFromString(@"NotesSettings.NotesSettingsPlacardCell") forKeyedSubscript:PSCellClassKey];
  [v4 setIdentifier:@"NOTES_PLACARD"];
  id v5 = [(ICSettingsPlugin *)self systemPolicy];
  unsigned __int8 v6 = [v5 specifiersForPolicyOptions:0x8000000 force:0];

  uint64_t v7 = [v6 specifierForID:@"ACCOUNTS"];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(ICSettingsPlugin *)self settingsBundle];
    id v10 = [v9 localizedStringForKey:@"NOTES_ACCOUNTS" value:@"Notes Accounts" table:@"Settings"];
    [v8 setName:v10];
  }
  else
  {
    id v8 = [v6 specifierForID:@"ADD_ACCOUNT"];
  }
  uint64_t v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, v8, 0);

  return v11;
}

- (id)_appPolicySpecifiers
{
  unsigned int v3 = +[UIDevice ic_isVision];
  unsigned int v4 = [(ICSettingsPlugin *)self systemPolicy];
  id v5 = v4;
  if (v3) {
    uint64_t v6 = 142606337;
  }
  else {
    uint64_t v6 = 41943041;
  }
  uint64_t v7 = [v4 specifiersForPolicyOptions:v6 force:0];

  return v7;
}

- (id)_accountsSpecifiers
{
  unsigned int v3 = +[UMUserManager sharedManager];
  unsigned int v4 = [v3 currentUser];

  if ([v4 userType] == (char *)&dword_0 + 1)
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v6 = +[PSSpecifier groupSpecifierWithID:@"ACCOUNTS_GROUP"];
    uint64_t v7 = [(ICSettingsPlugin *)self settingsBundle];
    id v8 = [v7 localizedStringForKey:@"DEFAULT_NOTES_ACCOUNT_EXPLANATION", @"Notes created outside of a specific account, such as when using Siri, are placed in this account.", @"Settings" value table];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    id v9 = [(ICSettingsPlugin *)self settingsBundle];
    id v10 = [v9 localizedStringForKey:@" " value:@"Default Account" table:@"Settings"];
    uint64_t v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"_setDefaultNotesAccountSyncId:withSpecifier:" get:"_defaultNotesAccountSyncId:" detail:objc_opt_class() cell:2 edit:0];

    [v11 setIdentifier:@"DEFAULT_ACCOUNT"];
    v12 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"DefaultNotesAccount", @"key", 0];
    [v11 setUserInfo:v12];

    [v11 setProperty:@"_accountValuesForSpecifier:" forKey:PSValuesDataSourceKey];
    [v11 setProperty:@"_accountTitlesForSpecifier:" forKey:PSTitlesDataSourceKey];
    v27[0] = v6;
    v27[1] = v11;
    uint64_t v13 = +[NSArray arrayWithObjects:v27 count:2];
    id v5 = [&__NSArray0__struct arrayByAddingObjectsFromArray:v13];
  }
  if ([v4 userType] != (char *)&dword_0 + 1)
  {
    id v14 = +[PSSpecifier emptyGroupSpecifier];
    v15 = [(ICSettingsPlugin *)self settingsBundle];
    long long v16 = [v15 localizedStringForKey:@"PASSWORD_SETTINGS" value:@"Password" table:@"Settings"];
    long long v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v17 setIdentifier:@"PASSWORD"];
    v25 = &off_1F2E0;
    CFStringRef v26 = &stru_1DFC8;
    long long v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v17 setTitleDictionary:v18];

    [v17 setButtonAction:"_showPasswordScreen:"];
    v24[0] = v14;
    v24[1] = v17;
    long long v19 = +[NSArray arrayWithObjects:v24 count:2];
    uint64_t v20 = [v5 arrayByAddingObjectsFromArray:v19];

    v21 = [(ICSettingsPlugin *)self settingsBundle];
    v22 = [v21 localizedStringForKey:@"PASSWORD_EXPLANATION" value:@"Lock important notes using end-to-end encryption." table:@"Settings"];
    [v14 setProperty:v22 forKey:PSFooterTextGroupKey];

    id v5 = (void *)v20;
  }

  return v5;
}

- (id)_mentionsSpecifiers
{
  unsigned int v3 = +[PSSpecifier emptyGroupSpecifier];
  unsigned int v4 = [(ICSettingsPlugin *)self settingsBundle];
  id v5 = [v4 localizedStringForKey:@"MENTIONS_SHOULD_NOTIFY_ME_EXPLANATION" value:@"Receive notifications on this device when your name is mentioned in shared notes." table:@"Settings"];
  [v3 setProperty:v5 forKey:PSFooterTextGroupKey];

  uint64_t v6 = [(ICSettingsPlugin *)self settingsBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"MENTIONS_SHOULD_NOTIFY_ME_PREF" value:@"Mention Notifications" table:@"Settings"];

  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setMentionsShouldNotifyMe:withSpecifier:" get:"_getMentionsShouldNotifyMe:" detail:0 cell:6 edit:0];
  [v8 setIdentifier:@"MENTION_NOTIFICATIONS"];
  id v9 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"ICMentionsShouldNotifyMeDefaultsKey", @"key", 0];
  [v8 setUserInfo:v9];

  [v8 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  v12[0] = v3;
  v12[1] = v8;
  id v10 = +[NSArray arrayWithObjects:v12 count:2];

  return v10;
}

- (id)_localAccountSpecifiers
{
  unsigned int v3 = +[UMUserManager sharedManager];
  unsigned int v4 = [v3 currentUser];

  if ([v4 userType] == (char *)&dword_0 + 1 && !objc_msgSend(v4, "isTransientUser"))
  {
    uint64_t v20 = &__NSArray0__struct;
  }
  else
  {
    id v5 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v6 = [(ICSettingsPlugin *)self settingsBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"DEFAULT_LOCAL_NOTES_PREF_DESC" value:@"Using an “%@” account allows you to store notes on this device. Your other notes won’t be affected." table:@"Settings"];

    id v8 = [(ICSettingsPlugin *)self localAccountName];
    id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8);
    [v5 setProperty:v9 forKey:PSFooterTextGroupKey];

    id v10 = +[ICAccountUtilities sharedInstance];
    id v11 = [v10 hasSyncingAccount];

    v12 = [(ICSettingsPlugin *)self settingsBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"DEFAULT_LOCAL_NOTES_PREF" value:@"“%@” Account" table:@"Settings"];

    id v14 = [(ICSettingsPlugin *)self localAccountName];
    v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v14);
    long long v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"_setLocalNotesEnabled:withSpecifier:" get:"_getLocalNotesEnabled:" detail:0 cell:6 edit:0];

    [v16 setIdentifier:@"LOCAL_ACCOUNT"];
    long long v17 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"LocalNotes", @"key", 0];
    [v16 setUserInfo:v17];

    long long v18 = +[NSNumber numberWithBool:v11];
    [v16 setProperty:v18 forKey:PSEnabledKey];

    v22[0] = v5;
    v22[1] = v16;
    long long v19 = +[NSArray arrayWithObjects:v22 count:2];
    uint64_t v20 = [&__NSArray0__struct arrayByAddingObjectsFromArray:v19];
  }

  return v20;
}

- (id)_viewingSpecifiers
{
  unsigned int v3 = [(ICSettingsPlugin *)self settingsBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"VIEWING_GROUP_TITLE" value:@"Viewing" table:@"Settings"];
  v79 = +[PSSpecifier groupSpecifierWithName:v4];

  id v5 = [(ICSettingsPlugin *)self settingsBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"NOTE_DEFAULT_SORT" value:@"Sort Notes By" table:@"Settings"];
  v83 = self;
  uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"_setNoteSortType:withSpecifier:" get:"_currentNoteSortType:" detail:objc_opt_class() cell:2 edit:0];

  [v7 setIdentifier:@"SORT_TYPE"];
  id v8 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:ICSettingsNoteListSortTypeKey, @"key", 0];
  v84 = v7;
  [v7 setUserInfo:v8];

  id v86 = objc_alloc_init((Class)NSMutableDictionary);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v9 = [&off_1F208 countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v92;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v92 != v11) {
          objc_enumerationMutation(&off_1F208);
        }
        uint64_t v13 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        id v14 = +[ICNoteListSortUtilities descriptionForNoteListSortType:](ICNoteListSortUtilities, "descriptionForNoteListSortType:", [v13 integerValue]);
        if (v14) {
          [v86 setObject:v14 forKeyedSubscript:v13];
        }
        else {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "title", "-[ICSettingsPlugin _viewingSpecifiers]", 1, 0, @"Failed to find title for note Sort type %@", v13);
        }
      }
      id v10 = [&off_1F208 countByEnumeratingWithState:&v91 objects:v102 count:16];
    }
    while (v10);
  }
  uint64_t v15 = objc_opt_class();
  long long v16 = NSStringFromSelector(a2);
  NSLog(@"[%@(%p) %@] values %@ titles %@ ", v15, v83, v16, &off_1F208, v86);

  id v17 = [&off_1F208 copy];
  [v84 setValues:v17];

  id v18 = [v86 copy];
  [v84 setTitleDictionary:v18];

  long long v19 = [(ICSettingsPlugin *)v83 settingsBundle];
  uint64_t v20 = [v19 localizedStringForKey:@"NOTE_DEFAULT_DATEHEADERSTYPE" value:@"Group Notes By Date" table:@"Settings"];
  v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:v83 set:"_setDateHeadersType:withSpecifier:" get:"_currentDateHeadersType:" detail:0 cell:6 edit:0];

  [v21 setIdentifier:@"DATE_HEADERS"];
  [v21 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  v78 = v21;
  [v21 setValues:&off_1F220];
  v22 = [(ICSettingsPlugin *)v83 settingsBundle];
  v23 = [v22 localizedStringForKey:@"NOTE_DEFAULT_STYLE" value:@"New Notes Start With" table:@"Settings"];
  v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:v83 set:"_setNoteDefaultStyle:withSpecifier:" get:"_noteDefaultStyle:" detail:objc_opt_class() cell:2 edit:0];

  [v24 setIdentifier:@"DEFAULT_STYLE"];
  v25 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"TTTextControllerNoteDefaultNamedStyleKey", @"key", 0];
  v82 = v24;
  [v24 setUserInfo:v25];

  id v85 = objc_alloc_init((Class)NSMutableDictionary);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v26 = [&off_1F238 countByEnumeratingWithState:&v87 objects:v101 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v88;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v88 != v28) {
          objc_enumerationMutation(&off_1F238);
        }
        v30 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
        v31 = +[ICTextStyle settingsDescriptionForNamedStyle:](ICTextStyle, "settingsDescriptionForNamedStyle:", [v30 unsignedIntegerValue]);
        if (v31) {
          [v85 setObject:v31 forKeyedSubscript:v30];
        }
        else {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "title", "-[ICSettingsPlugin _viewingSpecifiers]", 1, 0, @"Failed to find title for namedStyle %@", v30);
        }
      }
      id v27 = [&off_1F238 countByEnumeratingWithState:&v87 objects:v101 count:16];
    }
    while (v27);
  }
  uint64_t v32 = objc_opt_class();
  v33 = NSStringFromSelector(a2);
  NSLog(@"[%@(%p) %@] values %@ titles %@ ", v32, v83, v33, &off_1F238, v85);

  id v34 = [&off_1F238 copy];
  [v82 setValues:v34];

  id v35 = [v85 copy];
  [v82 setTitleDictionary:v35];

  v36 = [(ICSettingsPlugin *)v83 settingsBundle];
  uint64_t v37 = [v36 localizedStringForKey:@"SORT_CHECKED_ITEMS_SETTINGS" value:@"Sort Checked Items" table:@"Settings"];

  aSelectora = (char *)v37;
  v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:v83 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v38 setIdentifier:@"SORT_CHECKED_ITEMS"];
  v77 = v38;
  *(void *)&v38[OBJC_IVAR___PSSpecifier_getter] = "_getSortCheckedItems:";
  v39 = [(ICSettingsPlugin *)v83 settingsBundle];
  v40 = [v39 localizedStringForKey:@"PAPER_STYLE_SETTINGS" value:@"Lines & Grids" table:@"Settings"];
  v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:v83 set:0 get:"_notePaperStyle:" detail:objc_opt_class() cell:2 edit:0];

  [v41 setIdentifier:@"PAPER_STYLE"];
  [v41 setButtonAction:"_showPaperStyleScreen:"];
  v42 = [(ICSettingsPlugin *)v83 settingsBundle];
  uint64_t v43 = [v42 localizedStringForKey:@"PAPER_STYLE_NONE" value:@"None" table:@"Settings"];

  v99[0] = &off_1F3A0;
  v99[1] = &off_1F3B8;
  v100[0] = v43;
  v100[1] = v43;
  v75 = (void *)v43;
  v99[2] = &off_1F3D0;
  v76 = [(ICSettingsPlugin *)v83 settingsBundle];
  v73 = [v76 localizedStringForKey:@"PAPER_STYLE_GRID_SMALL" value:@"Grid Small" table:@"Settings"];
  v100[2] = v73;
  v99[3] = &off_1F3E8;
  v71 = [(ICSettingsPlugin *)v83 settingsBundle];
  v70 = [v71 localizedStringForKey:@"PAPER_STYLE_GRID_MEDIUM" value:@"Grid Medium" table:@"Settings"];
  v100[3] = v70;
  v99[4] = &off_1F400;
  v69 = [(ICSettingsPlugin *)v83 settingsBundle];
  v44 = [v69 localizedStringForKey:@"PAPER_STYLE_GRID_LARGE" value:@"Grid Large" table:@"Settings"];
  v100[4] = v44;
  v99[5] = &off_1F418;
  v45 = [(ICSettingsPlugin *)v83 settingsBundle];
  v46 = [v45 localizedStringForKey:@"PAPER_STYLE_LINES_SMALL" value:@"Lines Small" table:@"Settings"];
  v100[5] = v46;
  v99[6] = &off_1F430;
  v47 = [(ICSettingsPlugin *)v83 settingsBundle];
  v48 = [v47 localizedStringForKey:@"PAPER_STYLE_LINES_MEDIUM" value:@"Lines Medium" table:@"Settings"];
  v100[6] = v48;
  v99[7] = &off_1F448;
  v49 = [(ICSettingsPlugin *)v83 settingsBundle];
  v50 = [v49 localizedStringForKey:@"PAPER_STYLE_LINES_LARGE" value:@"Lines Large" table:@"Settings"];
  v100[7] = v50;
  uint64_t v51 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:8];

  v74 = (void *)v51;
  [v41 setTitleDictionary:v51];
  v52 = [(ICSettingsPlugin *)v83 settingsBundle];
  v53 = [v52 localizedStringForKey:@"NOTE_CONTENT_BACKGROUNDS" value:@"Note Backgrounds" table:@"Settings"];
  v54 = +[PSSpecifier preferenceSpecifierNamed:v53 target:v83 set:"_setUseDarkBackgroundsForNoteContent:withSpecifier:" get:"_getUseDarkBackgroundsForNoteContent:" detail:objc_opt_class() cell:2 edit:0];

  [v54 setIdentifier:@"ALLOW_DARK_BACKGROUNDS"];
  v55 = [(ICSettingsPlugin *)v83 settingsBundle];
  uint64_t v56 = [v55 localizedStringForKey:@"ALLOW_DARK_BACKGROUNDS" value:@"Dark" table:@"Settings"];

  v57 = [(ICSettingsPlugin *)v83 settingsBundle];
  v58 = [v57 localizedStringForKey:@"DISALLOW_DARK_BACKGROUNDS" value:@"Light" table:@"Settings"];

  v97[0] = &__kCFBooleanTrue;
  v97[1] = &__kCFBooleanFalse;
  v72 = (void *)v56;
  v98[0] = v56;
  v98[1] = v58;
  v59 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];
  [v54 setValues:&off_1F250];
  [v54 setTitleDictionary:v59];
  v96[0] = v79;
  v96[1] = v84;
  v60 = +[NSArray arrayWithObjects:v96 count:2];
  v61 = +[NSMutableArray arrayWithArray:v60];

  v62 = [(ICSettingsPlugin *)v83 _currentNoteSortType:v84];
  v63 = (char *)[v62 integerValue];

  if (v63 != (unsigned char *)&dword_0 + 2) {
    objc_msgSend(v61, "ic_addNonNilObject:", v78);
  }
  v95[0] = v82;
  v95[1] = v77;
  v95[2] = v41;
  v64 = +[NSArray arrayWithObjects:v95 count:3];
  objc_msgSend(v61, "ic_addObjectsFromNonNilArray:", v64);

  v65 = [(ICSettingsPlugin *)v83 traitCollection];
  if (objc_msgSend(v65, "ic_isDark"))
  {
    unsigned __int8 v66 = +[UIDevice ic_isVision];

    if ((v66 & 1) == 0) {
      objc_msgSend(v61, "ic_addNonNilObject:", v54);
    }
  }
  else
  {
  }
  id v67 = [v61 copy];

  return v67;
}

- (id)_systemPaperSpecifiers
{
  unsigned int v3 = [(ICSettingsPlugin *)self settingsBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"QUICK_NOTE_GROUP_TITLE" value:@"Quick Notes" table:@"Settings"];
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  uint64_t v6 = [(ICSettingsPlugin *)self settingsBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"QUICK_NOTES_RESUME_LAST_QUICK_NOTE_EXPLANATION", @"If enabled, resume last Quick Note instead of creating a new one.", @"Settings" value table];
  [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

  id v8 = [(ICSettingsPlugin *)self settingsBundle];
  id v9 = [v8 localizedStringForKey:@"CORNER_GESTURES" value:@"Corner Gestures" table:@"Settings"];
  id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  [v10 setIdentifier:@"CORNER_GESTURES"];
  uint64_t v11 = [(ICSettingsPlugin *)self settingsBundle];
  v12 = [v11 localizedStringForKey:@"SHOULD_RESUME_LAST_QUICK_NOTE_PREF" value:@"Resume Last Quick Note" table:@"Settings"];

  uint64_t v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"_setShouldResumeLastQuickNote:withSpecifier:" get:"_getShouldResumeLastQuickNote:" detail:0 cell:6 edit:0];
  [v13 setIdentifier:@"RESUME_LAST_QUICKNOTE"];
  [v13 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  id v14 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"ICShouldResumeLastQuickNoteDefaultsKey", @"key", 0];
  [v13 setUserInfo:v14];

  v17[0] = v5;
  v17[1] = v10;
  v17[2] = v13;
  uint64_t v15 = +[NSArray arrayWithObjects:v17 count:3];

  return v15;
}

- (id)_appLinksSpecifiers
{
  unsigned int v3 = [(ICSettingsPlugin *)self settingsBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"APP_LINKS_GROUP_TITLE" value:@"App Links" table:@"Settings"];
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  uint64_t v6 = [(ICSettingsPlugin *)self traitCollection];
  uint64_t v7 = (char *)[v6 userInterfaceIdiom];

  if (v7)
  {
    if (v7 == (unsigned char *)&dword_4 + 2)
    {
      id v8 = [(ICSettingsPlugin *)self settingsBundle];
      id v9 = v8;
      CFStringRef v10 = @"APP_LINKS_EXPLANATION_VISION";
      CFStringRef v11 = @"Only Quick Notes containing related links may be suggested when using your Vision Pro.";
    }
    else
    {
      id v8 = [(ICSettingsPlugin *)self settingsBundle];
      id v9 = v8;
      if (v7 == (unsigned char *)&dword_0 + 1)
      {
        CFStringRef v10 = @"APP_LINKS_EXPLANATION_IPAD";
        CFStringRef v11 = @"Only Quick Notes containing related links may be suggested when using your iPad.";
      }
      else
      {
        CFStringRef v10 = @"APP_LINKS_EXPLANATION_DEVICE";
        CFStringRef v11 = @"Only Quick Notes containing related links may be suggested when using your device.";
      }
    }
  }
  else
  {
    id v8 = [(ICSettingsPlugin *)self settingsBundle];
    id v9 = v8;
    CFStringRef v10 = @"APP_LINKS_EXPLANATION_IPHONE";
    CFStringRef v11 = @"Only Quick Notes containing related links may be suggested when using your iPhone.";
  }
  v12 = [v8 localizedStringForKey:v10 value:v11 table:@"Settings"];

  [v5 setProperty:v12 forKey:PSFooterTextGroupKey];
  uint64_t v13 = [(ICSettingsPlugin *)self settingsBundle];
  id v14 = [v13 localizedStringForKey:@"SHOULD_SHOW_LINK_BAR_QUICK_NOTE_PREF" value:@"Suggest App Link when Composing Quick Note" table:@"Settings"];

  uint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"_setShouldShowQuickNoteLinksBar:withSpecifier:" get:"_getShouldShowQuickNoteLinksBar:" detail:0 cell:6 edit:0];
  [v15 setIdentifier:@"SHOW_QUICKNOTE_LINKS_BAR"];
  uint64_t v16 = PSAllowMultilineTitleKey;
  [v15 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  id v17 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"ICShouldShowQuickNoteLinksBarDefaultsKey", @"key", 0];
  [v15 setUserInfo:v17];

  id v18 = [(ICSettingsPlugin *)self settingsBundle];
  long long v19 = [v18 localizedStringForKey:@"SHOULD_SHOW_SUGGESTIONS_QUICK_NOTE_PREF" value:@"Suggest Notes with App Links" table:@"Settings"];

  uint64_t v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"_setShouldShowQuickNoteSuggestions:withSpecifier:" get:"_getShouldShowQuickNoteSuggestions:" detail:0 cell:6 edit:0];
  [v20 setIdentifier:@"SHOW_QUICKNOTE_SUGGESTIONS"];
  [v20 setProperty:&__kCFBooleanTrue forKey:v16];
  v23[0] = v5;
  v23[1] = v15;
  v23[2] = v20;
  v21 = +[NSArray arrayWithObjects:v23 count:3];

  return v21;
}

- (id)_tagsSpecifiers
{
  unsigned int v3 = [(ICSettingsPlugin *)self settingsBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"TAGS_GROUP_TITLE" value:@"Tags" table:@"Settings"];
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  uint64_t v6 = [(ICSettingsPlugin *)self settingsBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"SHOULD_AUTO_SAVE_TO_TAG_EXPLANATION" value:@"Typing a space automatically converts #text to tag." table:@"Settings"];
  [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

  id v8 = [(ICSettingsPlugin *)self settingsBundle];
  id v9 = [v8 localizedStringForKey:@"SHOULD_AUTO_CONVERT_TO_TAG_PREF" value:@"Auto Convert to Tag" table:@"Settings"];

  CFStringRef v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"_setShouldAutoConvertToTag:withSpecifier:" get:"_getShouldAutoConvertToTag:" detail:0 cell:6 edit:0];
  [v10 setIdentifier:@"AUTO_CONVERT_TO_TAG"];
  [v10 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  CFStringRef v11 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"ICHashtagsShouldAutoConvertToTagDefaultsKey", @"key", 0];
  [v10 setUserInfo:v11];

  v14[0] = v5;
  v14[1] = v10;
  v12 = +[NSArray arrayWithObjects:v14 count:2];

  return v12;
}

- (id)_mediaSpecifiers
{
  unsigned int v3 = [(ICSettingsPlugin *)self settingsBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"MEDIA_GROUP_TITLE" value:@"Media" table:@"Settings"];
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  uint64_t v6 = [(ICSettingsPlugin *)self settingsBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"SHOULD_SAVE_PHOTOS_VIDEOS_EXPLANATION" value:@"Save photos and videos taken in Notes to the Photos app." table:@"Settings"];
  [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

  id v8 = [(ICSettingsPlugin *)self settingsBundle];
  id v9 = [v8 localizedStringForKey:@"SHOULD_SAVE_PHOTOS_VIDEOS_PREF" value:@"Save to Photos" table:@"Settings"];

  CFStringRef v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"_setShouldSavePhotosVideos:withSpecifier:" get:"_getShouldSavePhotosVideos:" detail:0 cell:6 edit:0];
  [v10 setIdentifier:@"SAVE_PHOTOS"];
  CFStringRef v11 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"ICShouldSavePhotosAndVideosToCameraRollKey", @"key", 0];
  [v10 setUserInfo:v11];

  v14[0] = v5;
  v14[1] = v10;
  v12 = +[NSArray arrayWithObjects:v14 count:2];

  return v12;
}

- (id)_lockscreenSpecifiers
{
  unsigned int v3 = [(ICSettingsPlugin *)self settingsBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"LOCKSCREEN_GROUP_TITLE" value:@"Lock Screen & Control Center" table:@"Settings"];
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  LODWORD(v4) = MGGetBoolAnswer();
  uint64_t v6 = [(ICSettingsPlugin *)self settingsBundle];
  uint64_t v7 = v6;
  if (v4)
  {
    CFStringRef v8 = @"RESUME_TO_PREVIOUS_NOTE_EXPLANATION_WITH_PENCIL";
    CFStringRef v9 = @"Quickly create or resume notes by tapping anywhere on the Lock Screen with Apple Pencil, or pressing the Notes control in Control Center. You can configure Notes access from Control Center in Settings.";
  }
  else
  {
    CFStringRef v8 = @"RESUME_TO_PREVIOUS_NOTE_EXPLANATION_WITHOUT_PENCIL";
    CFStringRef v9 = @"Quickly create or resume notes by pressing the Notes control in Control Center. You can configure Notes access from Control Center in Settings.";
  }
  CFStringRef v10 = [v6 localizedStringForKey:v8 value:v9 table:@"Settings"];
  [v5 setProperty:v10 forKey:PSFooterTextGroupKey];

  CFStringRef v11 = [(ICSettingsPlugin *)self settingsBundle];
  v12 = [v11 localizedStringForKey:@"ACCESS_NOTES_FROM_LOCK_SCREEN" value:@"Access Notes from Lock Screen" table:@"Settings"];
  uint64_t v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v13 setIdentifier:@"ACCESS_FROM_LOCK_SCREEN"];
  [v13 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  id v14 = [(ICSettingsPlugin *)self traitCollection];
  uint64_t v15 = (char *)[v14 userInterfaceIdiom];

  if (v15 == (unsigned char *)&dword_0 + 1) {
    *(void *)&v13[OBJC_IVAR___PSSpecifier_getter] = "_getAccessNotesFromLockScreen:";
  }
  v18[0] = v5;
  v18[1] = v13;
  uint64_t v16 = +[NSArray arrayWithObjects:v18 count:2];

  return v16;
}

- (id)_accountValuesForSpecifier:(id)a3
{
  id v16 = objc_alloc_init((Class)NoteContext);
  unsigned int v3 = -[ICSettingsPlugin allAccountsIncludingThoseInHTMLNoteContext:](self, "allAccountsIncludingThoseInHTMLNoteContext:");
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        CFStringRef v10 = ICDynamicCast();
        objc_opt_class();
        CFStringRef v11 = ICDynamicCast();
        if (v10 && [v10 accountType] != 3)
        {
          uint64_t v12 = [v10 identifier];
        }
        else
        {
          if (!v11 || ![v11 accountType]) {
            goto LABEL_14;
          }
          uint64_t v12 = [v11 accountIdentifier];
        }
        uint64_t v13 = (void *)v12;
        if (v12)
        {
          [v4 addObject:v12];
        }
LABEL_14:
      }
      uint64_t v7 = (char *)[v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  if (-[ICSettingsPlugin localAccountExists](self, "localAccountExists") || ![v4 count]) {
    [v4 addObject:LegacyDeviceLocalAccountID];
  }

  return v4;
}

- (id)_accountTitlesForSpecifier:(id)a3
{
  id v17 = objc_alloc_init((Class)NoteContext);
  unsigned int v3 = -[ICSettingsPlugin allAccountsIncludingThoseInHTMLNoteContext:](self, "allAccountsIncludingThoseInHTMLNoteContext:");
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        CFStringRef v10 = ICDynamicCast();
        objc_opt_class();
        CFStringRef v11 = ICDynamicCast();
        if (v10 && [v10 accountType] != 3)
        {
          uint64_t v12 = [v10 accountName];
        }
        else
        {
          if (!v11 || ![v11 accountType]) {
            goto LABEL_14;
          }
          uint64_t v12 = [v11 name];
        }
        uint64_t v13 = (void *)v12;
        if (v12)
        {
          [v4 addObject:v12];
        }
LABEL_14:
      }
      uint64_t v7 = (char *)[v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  if (-[ICSettingsPlugin localAccountExists](self, "localAccountExists") || ![v4 count])
  {
    id v14 = +[ACUILocalization localizedTitleForLocalSourceOfDataclass:ACAccountDataclassNotes usedAtBeginningOfSentence:1];
    if (v14) {
      [v4 addObject:v14];
    }
  }

  return v4;
}

- (id)_getShowPasswordScreen:(id)a3
{
  return &off_1F2E0;
}

- (void)_showPasswordScreen:(id)a3
{
  id v4 = +[ICNoteContext sharedContext];
  [v4 addOrDeleteLocalAccountIfNecessary];

  id v5 = +[ICNoteContext sharedContext];
  uint64_t v6 = [v5 managedObjectContext];
  id v13 = +[ICAccount allActiveAccountsInContext:v6];

  if ([v13 count])
  {
    if ((unint64_t)[v13 count] < 2)
    {
      CFStringRef v10 = [ICSettingsPasswordViewController alloc];
      CFStringRef v11 = [v13 firstObject];
      uint64_t v12 = [v11 objectID];
      uint64_t v7 = [(ICSettingsPasswordViewController *)v10 initWithAccountID:v12];
    }
    else
    {
      uint64_t v7 = objc_alloc_init(ICSettingsAccountsPasswordViewController);
    }
    uint64_t v8 = [(ICSettingsPlugin *)self navigationController];
    [v8 pushViewController:v7 animated:1];
  }
  else
  {
    uint64_t v7 = +[ICAuthenticationAlert upgradeToLockNotesInfoAlert];
    uint64_t v8 = [(ICSettingsPlugin *)self view];
    CFStringRef v9 = [v8 window];
    [(ICSettingsAccountsPasswordViewController *)v7 presentInWindow:v9 completionHandler:0];
  }
}

- (void)_showPaperStyleScreen:(id)a3
{
  id v4 = [(ICSettingsPlugin *)self view];
  id v5 = [v4 traitCollection];
  BOOL v6 = [v5 userInterfaceIdiom] == (char *)&dword_0 + 1;

  id v18 = [objc_alloc((Class)ICPaperStyleCollectionViewController) initWithLargeIcons:v6 forPreferences:1];
  uint64_t v7 = [(ICSettingsPlugin *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = [v18 view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  id v17 = [(ICSettingsPlugin *)self navigationController];
  [v17 pushViewController:v18 animated:1];

  [(ICSettingsPlugin *)self ic_submitNavigationEventForIdentifier:@"PAPER_STYLE" titleStringKey:@"PAPER_STYLE_SETTINGS" navigationComponents:&off_1F268];
}

- (id)_defaultNotesAccountSyncId:(id)a3
{
  objc_opt_class();
  unsigned int v3 = +[ICSettingsUtilities objectForKey:@"DefaultNotesAccount"];
  id v4 = ICCheckedDynamicCast();

  id v5 = [objc_alloc((Class)NoteContext) initWithPrivateQueue];
  BOOL v6 = +[ICDefaultAccountUtilities defaultAccountWithHTMLNoteContext:v5];
  objc_opt_class();
  uint64_t v7 = ICDynamicCast();
  objc_opt_class();
  double v8 = ICDynamicCast();
  double v9 = v8;
  if (v7)
  {
    if ([v7 accountType] != 3)
    {
      id v10 = [v7 identifier];
LABEL_8:
      double v11 = v10;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v8)
  {
    if ([v8 accountType])
    {
      id v10 = [v9 accountIdentifier];
      goto LABEL_8;
    }
LABEL_7:
    id v10 = LegacyDeviceLocalAccountID;
    goto LABEL_8;
  }
  double v13 = +[AccountUtilities sharedAccountUtilities];
  double v11 = [v13 defaultStoreSyncIdWithDesiredSyncId:v4];

LABEL_9:

  return v11;
}

- (void)_setDefaultNotesAccountSyncId:(id)a3 withSpecifier:(id)a4
{
}

- (id)_currentNoteSortType:(id)a3
{
  id v3 = +[ICNoteListSortUtilities currentNoteListSortType];

  return +[NSNumber numberWithInteger:v3];
}

- (void)_setNoteSortType:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v6;
  if (v6)
  {
    +[ICNoteListSortUtilities setCurrentNoteListSortType:](ICNoteListSortUtilities, "setCurrentNoteListSortType:", [v6 integerValue]);
    id v5 = v6;
  }
}

- (id)_currentDateHeadersType:(id)a3
{
  if ((+[ICDateHeadersUtilities defaultDateHeadersType] & 0xFFFFFFFD) != 0)return &__kCFBooleanFalse; {
  else
  }
    return &__kCFBooleanTrue;
}

- (void)_setDateHeadersType:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v7;
  if (v7)
  {
    if ([v7 BOOLValue]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    +[ICDateHeadersUtilities setDefaultDateHeadersType:v6];
    id v5 = v7;
  }
}

- (id)_getAccessNotesFromLockScreen:(id)a3
{
  id v4 = +[ICQuickNoteSessionSettings showOnLockScreen];
  id v5 = [(ICSettingsPlugin *)self settingsBundle];
  uint64_t v6 = v5;
  if (v4)
  {
    CFStringRef v7 = @"ACCESS_FROM_LOCKSCREEN_ON";
    CFStringRef v8 = @"On";
  }
  else
  {
    CFStringRef v7 = @"ACCESS_FROM_LOCKSCREEN_OFF";
    CFStringRef v8 = @"Off";
  }
  double v9 = [v5 localizedStringForKey:v7 value:v8 table:@"Settings"];

  return v9;
}

- (void)_setNoteDefaultStyle:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v6;
  if (v6)
  {
    +[ICTextStyle setNoteDefaultNamedStyle:](ICTextStyle, "setNoteDefaultNamedStyle:", [v6 unsignedIntValue]);
    id v5 = v6;
  }
}

- (id)_noteDefaultStyle:(id)a3
{
  id v3 = +[ICTextStyle noteDefaultNamedStyle];

  return +[NSNumber numberWithUnsignedInt:v3];
}

- (id)_getSortCheckedItems:(id)a3
{
  unsigned int v4 = +[ICSettingsUtilities BOOLForKey:@"ICChecklistAutoSortEnabledDefaultsKey"];
  id v5 = [(ICSettingsPlugin *)self settingsBundle];
  id v6 = v5;
  if (v4)
  {
    CFStringRef v7 = @"AUTO_SORT_CHECKLIST_ON";
    CFStringRef v8 = @"Automatically";
  }
  else
  {
    CFStringRef v7 = @"AUTO_SORT_CHECKLIST_OFF";
    CFStringRef v8 = @"Manually";
  }
  double v9 = [v5 localizedStringForKey:v7 value:v8 table:@"Settings"];

  return v9;
}

- (id)_notePaperStyle:(id)a3
{
  id v3 = +[ICSettingsUtilities objectForKey:@"PaperStyle"];
  unsigned int v4 = v3;
  if (!v3) {
    id v3 = &off_1F3A0;
  }
  id v5 = v3;

  return v5;
}

- (id)_getLocalNotesEnabled:(id)a3
{
  objc_opt_class();
  unsigned int v4 = +[ICSettingsUtilities objectForKey:@"LocalNotes"];
  id v5 = ICCheckedDynamicCast();

  id v6 = +[ICAccountUtilities sharedInstance];
  unsigned int v7 = [v6 hasSyncingAccount];

  if (([v5 BOOLValue] & 1) == 0
    && (!v7 || [(ICSettingsPlugin *)self hasMigratedLocalAccountWithNotes]))
  {

    id v5 = &__kCFBooleanTrue;
  }

  return v5;
}

- (void)_setLocalNotesEnabled:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = ICCheckedDynamicCast();
  if ([v6 BOOLValue])
  {
    +[ICSettingsUtilities setObject:v5 forKey:@"LocalNotes"];
    unsigned int v7 = [(ICSettingsPlugin *)self localAccount];
    if (!v7) {
      [(ICSettingsPlugin *)self addLocalAccount];
    }
    [(ICSettingsPlugin *)self accountsDidChange];
  }
  else if ([(ICSettingsPlugin *)self localAccountHasNotes])
  {
    CFStringRef v8 = [(ICSettingsPlugin *)self settingsBundle];
    v25 = [v8 localizedStringForKey:@"DELETE_LOCAL_NOTES_MESSAGE" value:@"Your “%@” account contains notes. You need to move or delete them before you can disable this account." table:@"Settings"];

    double v9 = [(ICSettingsPlugin *)self settingsBundle];
    id v10 = [v9 localizedStringForKey:@"DELETE_LOCAL_NOTES_TITLE" value:@"Delete Notes?" table:@"Settings"];
    double v11 = [(ICSettingsPlugin *)self localAccountName];
    double v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v11);
    double v13 = +[UIAlertController alertControllerWithTitle:v10 message:v12 preferredStyle:1];

    double v14 = +[UIColor ICTintColor];
    double v15 = [v13 view];
    [v15 setTintColor:v14];

    id v16 = [(ICSettingsPlugin *)self settingsBundle];
    id v17 = [v16 localizedStringForKey:@"GO_TO_NOTES_ACTION" value:@"Go To Notes" table:@"Settings"];
    id v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:&stru_1CA28];

    long long v19 = [(ICSettingsPlugin *)self settingsBundle];
    long long v20 = [v19 localizedStringForKey:@"DELETE_LOCAL_NOTES_ACTION" value:@"Delete Notes" table:@"Settings"];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_E470;
    v26[3] = &unk_1CA50;
    v26[4] = self;
    id v27 = v5;
    long long v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:v26];

    v22 = [(ICSettingsPlugin *)self settingsBundle];
    v23 = [v22 localizedStringForKey:@"CANCEL_ACTION" value:@"Cancel" table:@"Settings"];
    v24 = +[UIAlertAction actionWithTitle:v23 style:1 handler:0];

    [v13 addAction:v18];
    [v13 addAction:v21];
    [v13 addAction:v24];
    [(ICSettingsPlugin *)self presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    [(ICSettingsPlugin *)self deleteLocalAccount];
    +[ICSettingsUtilities setObject:v5 forKey:@"LocalNotes"];
    [(ICSettingsPlugin *)self accountsDidChange];
  }
}

- (void)_setUseDarkBackgroundsForNoteContent:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v6;
  if (v6)
  {
    +[UITraitCollection setIc_alwaysShowLightContent:](UITraitCollection, "setIc_alwaysShowLightContent:", [v6 BOOLValue] ^ 1);
    id v5 = v6;
  }
}

- (id)_getUseDarkBackgroundsForNoteContent:(id)a3
{
  uint64_t v3 = +[UITraitCollection ic_alwaysShowLightContent] ^ 1;

  return +[NSNumber numberWithInt:v3];
}

- (void)_setShouldSavePhotosVideos:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();
  if (v4) {
    +[ICSettingsUtilities setObject:v5 forKey:@"ICShouldSavePhotosAndVideosToCameraRollKey"];
  }
}

- (id)_getShouldSavePhotosVideos:(id)a3
{
  objc_opt_class();
  uint64_t v3 = +[ICSettingsUtilities objectForKey:@"ICShouldSavePhotosAndVideosToCameraRollKey"];
  id v4 = ICCheckedDynamicCast();

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[NSNumber numberWithBool:0];
  }
  id v6 = v5;

  return v6;
}

- (void)_setMentionsShouldNotifyMe:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v5 = +[ICNoteContext sharedContext];
    id v6 = [v5 managedObjectContext];
    unsigned int v7 = +[ICAccount defaultAccountInContext:v6];

    CFStringRef v8 = +[ICCloudNotificationsController sharedController];
    objc_msgSend(v8, "updateSubscriptionPreferenceForMentionNotifications:forAccount:", objc_msgSend(v9, "BOOLValue"), v7);
  }
}

- (id)_getMentionsShouldNotifyMe:(id)a3
{
  uint64_t v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];
  id v5 = +[ICAccount defaultAccountInContext:v4];

  id v6 = +[ICCloudNotificationsController sharedController];
  id v7 = [v6 isSubscribedToMentionNotificationsForAccount:v5];

  CFStringRef v8 = +[NSNumber numberWithBool:v7];

  return v8;
}

- (void)_setShouldAutoConvertToTag:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();
  if (v4) {
    +[ICSettingsUtilities setObject:v5 forKey:@"ICHashtagsShouldAutoConvertToTagDefaultsKey"];
  }
}

- (id)_getShouldAutoConvertToTag:(id)a3
{
  id v3 = +[ICHashtagController shouldAutoConvertToTag];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setShouldResumeLastQuickNote:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();
  if (v4) {
    +[ICSettingsUtilities setObject:v5 forKey:@"ICShouldResumeLastQuickNoteDefaultsKey"];
  }
}

- (id)_getShouldResumeLastQuickNote:(id)a3
{
  objc_opt_class();
  id v3 = +[ICSettingsUtilities objectForKey:@"ICShouldResumeLastQuickNoteDefaultsKey"];
  id v4 = ICCheckedDynamicCast();

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &__kCFBooleanTrue;
  }

  return v5;
}

- (void)_setShouldShowQuickNoteLinksBar:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();
  if (v4)
  {
    +[ICSettingsUtilities setObject:v6 forKey:@"ICShouldShowQuickNoteLinksBarDefaultsKey"];
    id v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 postNotificationName:@"ICShouldQuickNoteLinksBarDefaultsChangedNotification" object:0];
  }
}

- (id)_getShouldShowQuickNoteLinksBar:(id)a3
{
  objc_opt_class();
  id v3 = +[ICSettingsUtilities objectForKey:@"ICShouldShowQuickNoteLinksBarDefaultsKey"];
  id v4 = ICCheckedDynamicCast();

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &__kCFBooleanTrue;
  }

  return v5;
}

- (void)_setShouldShowQuickNoteSuggestions:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v6;
  if (v6)
  {
    +[SYDefaults setIndicatorCoverage:](SYDefaults, "setIndicatorCoverage:", [v6 BOOLValue]);
    id v5 = v6;
  }
}

- (id)_getShouldShowQuickNoteSuggestions:(id)a3
{
  BOOL v3 = +[SYDefaults indicatorCoverage] == (char *)&dword_0 + 1;

  return +[NSNumber numberWithBool:v3];
}

- (void)setSystemPolicy:(id)a3
{
}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (void)setPersistentStoreURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);

  objc_storeStrong((id *)&self->_systemPolicy, 0);
}

@end