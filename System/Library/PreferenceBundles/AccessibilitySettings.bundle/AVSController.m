@interface AVSController
- (AVSController)init;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (PSSpecifier)addSpecifier;
- (id)actionNameForShortcutSpecifier:(id)a3;
- (id)adaptiveVoiceShortcutsEnabled:(id)a3;
- (id)createAVSIntroductionGroupSpecifier;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_doneNavigationButtonTapped:(id)a3;
- (void)_editNavigationButtonTapped:(id)a3;
- (void)_loadAVSDetailControllerForSpecifier:(id)a3;
- (void)_resetButtonTapped:(id)a3;
- (void)_setUpForSpecifier:(id)a3;
- (void)_updateNavigationBarUI;
- (void)_updateSetupAVSButtonForOneness;
- (void)adaptiveVoiceShortcutsSetEnabled:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)setAddSpecifier:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AVSController

- (AVSController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVSController;
  v2 = [(AVSController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleContinuityDisplayStateChanged_0, kAXSContinuityDisplayStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AVSController;
  [(AVSController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVSController;
  [(AVSController *)&v4 viewWillAppear:a3];
  [(AVSController *)self _updateNavigationBarUI];
}

- (id)specifiers
{
  v3 = +[AVSStore shortcuts];
  objc_super v4 = +[NSMutableArray array];
  if ([v3 count])
  {
    objc_super v5 = settingsLocString(@"ADAPTIVE_VOICE_SHORTCUTS_TITLE", @"Accessibility");
    v44 = self;
    uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"adaptiveVoiceShortcutsSetEnabled:specifier:" get:"adaptiveVoiceShortcutsEnabled:" detail:0 cell:6 edit:0];

    v43 = (void *)v6;
    [v4 addObject:v6];
    v7 = settingsLocString(@"ADAPTIVE_VOICE_SHORTCUTS_ACTIONS_SECTION_TITLE", @"Accessibility");
    uint64_t v8 = +[PSSpecifier groupSpecifierWithName:v7];

    v42 = (void *)v8;
    [v4 addObject:v8];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v45 = v3;
    id obj = v3;
    id v9 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    uint64_t v10 = PSIDKey;
    if (v9)
    {
      id v11 = v9;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          v14 = v4;
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v16 = +[AVSTableCell specifier];
          v17 = [v15 associatedShortcutName];
          [v16 setProperty:v17 forKey:@"avsActionName"];

          v18 = settingsLocString(@"ADAPTIVE_VOICE_SHORTCUTS_ACTION", @"Accessibility");
          v19 = [v15 name];
          v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v19);
          [v16 setProperty:v20 forKey:@"avsName"];

          v21 = [v15 identifier];
          [v16 setProperty:v21 forKey:v10];

          v22 = [v15 identifier];
          [v16 setProperty:v22 forKey:@"avsIdentifier"];

          objc_super v4 = v14;
          [v14 addObject:v16];
        }
        id v11 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v11);
    }

    v23 = +[PSSpecifier emptyGroupSpecifier];
    [v23 setIdentifier:@"AVSAddNewGroupIdentifier"];
    [v4 addObject:v23];
    v24 = settingsLocString(@"AVS_ADD_BUTTON_TITLE", @"Accessibility");
    self = v44;
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:v44 set:0 get:0 detail:0 cell:13 edit:0];

    [v25 setProperty:@"AVS_ADD_BUTTON_TITLE" forKey:v10];
    [v25 setButtonAction:"_setUpForSpecifier:"];
    uint64_t v26 = PSAllowMultilineTitleKey;
    [v25 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    objc_storeStrong((id *)&v44->_addSpecifier, v25);
    [v4 addObject:v25];
    v27 = +[PSSpecifier emptyGroupSpecifier];
    [v4 addObject:v27];
    if (AXIsInternalInstall())
    {
      v28 = +[PSSpecifier emptyGroupSpecifier];
      [v4 addObject:v28];
      v29 = settingsLocString(@"AVS_RESET", @"Accessibility");
      v30 = +[PSSpecifier deleteButtonSpecifierWithName:v29 target:v44 action:"_resetButtonTapped:"];

      [v30 setProperty:&__kCFBooleanTrue forKey:v26];
      [v4 addObject:v30];
    }
    v3 = v45;
  }
  else
  {
    v31 = [(AVSController *)self createAVSIntroductionGroupSpecifier];
    [v4 addObject:v31];
    v32 = settingsLocString(@"AVS_SET_UP_BUTTON_TITLE", @"Accessibility");
    v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v33 setProperty:@"AVS_SET_UP_BUTTON_TITLE" forKey:PSIDKey];
    [v33 setButtonAction:"_setUpForSpecifier:"];
    [v33 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v34 = +[AXSpringBoardServer server];
    uint64_t v35 = [v34 isContinuitySessionActive] ^ 1;

    v36 = +[NSNumber numberWithBool:v35];
    [v33 setProperty:v36 forKey:PSEnabledKey];

    [v4 addObject:v33];
  }
  uint64_t v37 = OBJC_IVAR___PSListController__specifiers;
  v38 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] = v4;
  id v39 = v4;

  id v40 = *(id *)&self->AXUISettingsBaseListController_opaque[v37];
  return v40;
}

- (void)_updateSetupAVSButtonForOneness
{
  id v6 = [(AVSController *)self specifierForID:@"AVS_SET_UP_BUTTON_TITLE"];
  v3 = +[AXSpringBoardServer server];
  uint64_t v4 = [v3 isContinuitySessionActive] ^ 1;

  objc_super v5 = +[NSNumber numberWithBool:v4];
  [v6 setProperty:v5 forKey:PSEnabledKey];

  [(AVSController *)self reloadSpecifier:v6];
}

- (void)_loadAVSDetailControllerForSpecifier:(id)a3
{
  uint64_t v4 = PSIDKey;
  id v5 = a3;
  id v6 = [v5 propertyForKey:v4];
  v7 = [AVSDetailController alloc];
  uint64_t v8 = [v5 propertyForKey:PSTitleKey];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __54__AVSController__loadAVSDetailControllerForSpecifier___block_invoke;
  v10[3] = &unk_2097B8;
  v10[4] = self;
  id v9 = [(AVSDetailController *)v7 initWithIdentifier:v6 title:v8 withCompletion:v10];

  [(AVSController *)self showController:v9];
}

id *__54__AVSController__loadAVSDetailControllerForSpecifier___block_invoke(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] reloadSpecifiers];
  }
  return result;
}

- (id)createAVSIntroductionGroupSpecifier
{
  v2 = +[PSSpecifier emptyGroupSpecifier];
  v3 = AXLocStringKeyForModel();
  v18 = settingsLocString(v3, @"Accessibility");

  [v2 setProperty:v18 forKey:PSFooterTextGroupKey];
  [v2 setObject:@"Accessibility" forKeyedSubscript:@"table"];
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v2 setObject:v5 forKeyedSubscript:PSFooterCellClassGroupKey];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundlePath];
  [v2 setObject:v7 forKeyedSubscript:@"bundlePath"];

  uint64_t v8 = AXLocStringKeyForModel();
  CFStringRef v26 = @"contentLabel";
  v27 = v8;
  v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v28[0] = v17;
  v24[0] = @"moreLabel";
  v24[1] = @"additionalTitleLabel";
  v25[0] = @"AVS_FOOTER_LEARN_MORE";
  v25[1] = @"AVS_FOOTER_LEARN_MORE_TITLE";
  v25[2] = v8;
  v24[2] = @"additionalSubtitleLabel";
  v24[3] = @"additionalContent";
  v23[0] = &off_22C7D8;
  v23[1] = &off_22C800;
  v23[2] = &off_22C828;
  CFStringRef v21 = @"headerLabel";
  id v9 = AXLocStringKeyForModel();
  v22 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v23[3] = v10;
  v23[4] = &off_22C850;
  v23[5] = &off_22C878;
  CFStringRef v19 = @"headerLabel";
  id v11 = AXLocStringKeyForModel();
  v20 = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v23[6] = v12;
  v13 = +[NSArray arrayWithObjects:v23 count:7];
  v25[3] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  v28[1] = v14;
  v15 = +[NSArray arrayWithObjects:v28 count:2];
  [v2 setObject:v15 forKeyedSubscript:@"content"];

  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AVSController;
  [(AVSController *)&v4 tableView:a3 didSelectRowAtIndexPath:a4];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v7 = [(AVSController *)self specifierForIndexPath:a4];
  int64_t v8 = [v7 propertyForKey:@"avsIdentifier"];
  if (v8)
  {
    unsigned int v9 = [v6 isEditing];

    int64_t v8 = v9;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return (char *)[(AVSController *)self tableView:a3 editingStyleForRowAtIndexPath:a4] == (char *)&dword_0 + 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    uint64_t v16 = v5;
    uint64_t v17 = v6;
    int64_t v8 = [(AVSController *)self specifierForIndexPath:a5];
    id v9 = objc_alloc_init((Class)AVSStore);
    uint64_t v10 = [v8 identifier];
    [v9 deleteShortcutWithIdentifier:v10];

    [(AVSController *)self removeSpecifier:v8 animated:1];
    [(AVSController *)self _updateNavigationBarUI];
    id v11 = +[AVSStore shortcuts];
    id v12 = [v11 count];

    if (!v12)
    {
      v13 = AXLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Turning off AVS because there are no shortcuts left", buf, 2u);
      }

      v14 = +[AXSettings sharedInstance];
      [v14 setAdaptiveVoiceShortcutsEnabled:0];

      [(AVSController *)self reloadSpecifiers];
      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
}

id __64__AVSController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditing:0 animated:1];
}

- (void)_setUpForSpecifier:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __36__AVSController__setUpForSpecifier___block_invoke;
  v5[3] = &unk_2087C0;
  v5[4] = self;
  objc_super v4 = +[AVSEnrollmentCoordinatorFactory createWithCompletionHandler:v5];
  [(AVSController *)self presentViewController:v4 animated:1 completion:0];
}

id __36__AVSController__setUpForSpecifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateNavigationBarUI];
}

- (void)_updateNavigationBarUI
{
  id v9 = +[AVSStore shortcuts];
  if ([v9 count])
  {
    unsigned int v3 = [(AVSController *)self isEditing];
    id v4 = objc_allocWithZone((Class)UIBarButtonItem);
    if (v3)
    {
      uint64_t v5 = "_doneNavigationButtonTapped:";
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v5 = "_editNavigationButtonTapped:";
      uint64_t v6 = 2;
    }
    id v7 = [v4 initWithBarButtonSystemItem:v6 target:self action:v5];
    int64_t v8 = [(AVSController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
  else
  {
    id v7 = [(AVSController *)self navigationItem];
    [v7 setRightBarButtonItem:0];
  }
}

- (void)_editNavigationButtonTapped:(id)a3
{
}

- (void)_doneNavigationButtonTapped:(id)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVSController;
  -[AVSController setEditing:animated:](&v9, "setEditing:animated:");
  [(AVSController *)self _updateNavigationBarUI];
  if (v5)
  {
    [(AVSController *)self removeSpecifier:self->_addSpecifier animated:v4];
  }
  else
  {
    id v7 = +[AVSStore shortcuts];
    id v8 = [v7 count];

    if (v8) {
      [(AVSController *)self insertSpecifier:self->_addSpecifier afterSpecifierID:@"AVSAddNewGroupIdentifier" animated:v4];
    }
  }
}

- (id)adaptiveVoiceShortcutsEnabled:(id)a3
{
  unsigned int v3 = +[AXSettings sharedInstance];
  id v4 = [v3 isAdaptiveVoiceShortcutsEnabled];

  return +[NSNumber numberWithBool:v4];
}

- (void)adaptiveVoiceShortcutsSetEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setAdaptiveVoiceShortcutsEnabled:v4];
}

- (id)actionNameForShortcutSpecifier:(id)a3
{
  return [a3 objectForKeyedSubscript:PSValueKey];
}

- (void)_resetButtonTapped:(id)a3
{
  id v4 = objc_alloc_init((Class)AVSStore);
  [v4 deleteAllShortcuts];
  [(AVSController *)self reloadSpecifiers];
  [(AVSController *)self _updateNavigationBarUI];
}

- (PSSpecifier)addSpecifier
{
  return self->_addSpecifier;
}

- (void)setAddSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end