@interface VoiceOverCommandDetailsViewController
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addGestureButtonTapped:(id)a3;
- (void)_addKeyboardShortcutButtonTapped:(id)a3;
- (void)_addKeyboardShortcutWithSpecifier:(id)a3 resolver:(id)a4;
- (void)_addQuickNavShortcutButtonTapped:(id)a3;
- (void)_addSpecifiersForShortcuts:(id)a3 toSpecifiers:(id)a4 commandManager:(id)a5 resolver:(id)a6;
- (void)_doneNavigationButtonTapped:(id)a3;
- (void)_editNavigationButtonTapped:(id)a3;
- (void)_finishEditingIfNeeded;
- (void)_updateNavigationBarUI;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VoiceOverCommandDetailsViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverCommandDetailsViewController;
  [(VoiceOverCommandDetailsViewController *)&v4 viewWillAppear:a3];
  [(VoiceOverCommandDetailsViewController *)self _updateNavigationBarUI];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VoiceOverCommandDetailsViewController;
  [(VoiceOverCommandDetailsViewController *)&v19 setEditing:a3 animated:a4];
  [(VoiceOverCommandDetailsViewController *)self _updateNavigationBarUI];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_addItemSpecifiers;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    BOOL v10 = !v4;
    uint64_t v11 = PSEnabledKey;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
        v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10, (void)v15);
        [v13 setProperty:v14 forKey:v11];

        [(VoiceOverCommandDetailsViewController *)self reloadSpecifier:v13 animated:1];
        v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_24;
  }
  uint64_t v48 = OBJC_IVAR___PSListController__specifiers;
  BOOL v4 = objc_opt_new();
  v51 = (NSArray *)objc_opt_new();
  uint64_t v5 = OBJC_IVAR___PSViewController__specifier;
  v54 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
  v6 = [*(id *)&self->AXUISettingsBaseListController_opaque[v5] voCommandContext];
  uint64_t v7 = [v6 command];

  id v8 = [*(id *)&self->AXUISettingsBaseListController_opaque[v5] voCommandResolver];
  uint64_t v9 = (const void *)_AXSTripleClickCopyOptions();
  if (_AXSTripleClickContainsOption())
  {
    BOOL v10 = 1;
    if (!v9) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  BOOL v10 = _AXSZoomTouchEnabled() != 0;
  if (v9) {
LABEL_4:
  }
    CFRelease(v9);
LABEL_5:
  uint64_t v11 = settingsLocString(@"vo.touch.gestures", @"VoiceOverSettings");
  v12 = +[PSSpecifier groupSpecifierWithName:v11];

  if (v10 && [v54 commandHasModifiedBindingsWhenZoomEnabled:v7 withResolver:v8])
  {
    v13 = settingsLocString(@"vo.touch.gestures.zoom.conflict", @"VoiceOverSettings");
    [v12 setProperty:v13 forKey:PSFooterTextGroupKey];
  }
  v49 = self;
  v52 = v12;
  [v4 addObject:v12];
  v14 = v54;
  v50 = (void *)v7;
  [v54 gestureBindingsForCommand:v7 withResolver:v8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v15)
  {
    id v16 = v15;
    long long v17 = 0;
    uint64_t v18 = *(void *)v57;
    uint64_t v19 = PSEnabledKey;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        v22 = (char *)[v14 availabilityForGesture:v21 withResolver:v8];
        if (v22 != (unsigned char *)&dword_0 + 2)
        {
          id v23 = v22;
          v24 = +[PSSpecifier voGestureItem:v21 commandManager:v14 resolver:v8];

          v25 = +[NSNumber numberWithUnsignedInteger:v23];
          v26 = [v24 voCommandContext];
          [v26 setBindingAvailability:v25];

          v27 = +[NSNumber numberWithInt:v23 == 0];
          [v24 setProperty:v27 forKey:v19];

          v14 = v54;
          [v4 addObject:v24];
          long long v17 = v24;
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v16);
  }
  else
  {
    long long v17 = 0;
  }
  v28 = v14;
  v29 = settingsLocString(@"vo.add.gesture", @"VoiceOverSettings");
  v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:v49 set:0 get:0 detail:0 cell:13 edit:0];

  v31 = v50;
  v32 = +[VOCommandContext genericContextWithCommandManager:v14 command:v50 resolver:v8];
  [v30 setVoCommandContext:v32];

  [v30 setButtonAction:"_addGestureButtonTapped:"];
  [v4 addObject:v30];
  [(NSArray *)v51 addObject:v30];
  v33 = settingsLocString(@"vo.keyboard.shortcuts", @"VoiceOverSettings");
  v34 = +[PSSpecifier groupSpecifierWithName:v33];

  v35 = voiceOverLocalizedStringForKeyboardShortcutsFooterText();
  [v34 setProperty:v35 forKey:PSFooterTextGroupKey];

  v53 = v34;
  [v4 addObject:v34];
  v47 = [v28 shortcutBindingsForCommand:v50 withResolver:v8];
  -[VoiceOverCommandDetailsViewController _addSpecifiersForShortcuts:toSpecifiers:commandManager:resolver:](v49, "_addSpecifiersForShortcuts:toSpecifiers:commandManager:resolver:");
  v36 = settingsLocString(@"vo.add.keyboard.shortcut", @"VoiceOverSettings");
  v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:v49 set:0 get:0 detail:0 cell:13 edit:0];

  v38 = +[VOCommandContext genericContextWithCommandManager:v28 command:v50 resolver:v8];
  [v37 setVoCommandContext:v38];

  [v37 setButtonAction:"_addKeyboardShortcutButtonTapped:"];
  [v4 addObject:v37];
  [(NSArray *)v51 addObject:v37];
  id v39 = [v8 copy];
  [v39 setKeyboardMode:1];
  v40 = [v28 shortcutBindingsForCommand:v50 withResolver:v39];
  if ([v40 count])
  {
    v41 = settingsLocString(@"vo.quicknav.shortcuts", @"VoiceOverSettings");
    uint64_t v42 = +[PSSpecifier groupSpecifierWithName:v41];

    v31 = v50;
    [v4 addObject:v42];
    [(VoiceOverCommandDetailsViewController *)v49 _addSpecifiersForShortcuts:v40 toSpecifiers:v4 commandManager:v28 resolver:v39];
    v53 = (void *)v42;
  }
  v43 = *(void **)&v49->AXUISettingsBaseListController_opaque[v48];
  *(void *)&v49->AXUISettingsBaseListController_opaque[v48] = v4;
  id v44 = v4;

  addItemSpecifiers = v49->_addItemSpecifiers;
  v49->_addItemSpecifiers = v51;

  v3 = *(void **)&v49->AXUISettingsBaseListController_opaque[v48];
LABEL_24:

  return v3;
}

- (void)_addSpecifiersForShortcuts:(id)a3 toSpecifiers:(id)a4 commandManager:(id)a5 resolver:(id)a6
{
  id v9 = a3;
  id v25 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v9;
  id v12 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    v14 = 0;
    uint64_t v15 = *(void *)v28;
    uint64_t v24 = PSEnabledKey;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v18 = (char *)[v10 availabilityForShortcut:v17 withResolver:v11];
        if (v18 != (unsigned char *)&dword_0 + 2)
        {
          id v19 = v18;
          v20 = +[VOCommandContext keyboardShortcutContextWithKeyChord:v17 commandManager:v10 resolver:v11];
          uint64_t v21 = +[NSNumber numberWithUnsignedInteger:v19];
          [v20 setBindingAvailability:v21];

          v22 = +[PSSpecifier voKeyboardShortcutItem:v20 commandManager:v10 resolver:v11];

          id v23 = +[NSNumber numberWithInt:v19 == 0];
          [v22 setProperty:v23 forKey:v24];

          [v25 addObject:v22];
          v14 = v22;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  BOOL v4 = [(VoiceOverCommandDetailsViewController *)self specifierForIndexPath:a4];
  BOOL v5 = [v4 voBindingAvailability] == 0;

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(VoiceOverCommandDetailsViewController *)self specifierForIndexPath:a4];
  int64_t v5 = [v4 voBindingAvailability] == 0;

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    v53[2] = v8;
    v53[3] = v7;
    v53[14] = v5;
    v53[15] = v6;
    id v10 = [(VoiceOverCommandDetailsViewController *)self specifierForIndexPath:a5];
    id v11 = [v10 voCommandResolver];
    id v12 = [v10 voCommandContext];
    id v13 = [v12 commandManager];
    v14 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandContext];
    uint64_t v15 = [v14 command];

    if (!v10 || !v12 || !v13 || !v15 || ![v12 itemType]) {
      goto LABEL_12;
    }
    id v16 = (char *)[v12 itemType];
    if ((unint64_t)(v16 - 3) >= 2)
    {
      if (v16 != (unsigned char *)&dword_0 + 2)
      {
LABEL_12:

        return;
      }
      [v12 gesture];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v50[3] = &unk_208DC8;
      v32 = &v51;
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      id v51 = v28;
      id v29 = v15;
      id v52 = v29;
      id v30 = v11;
      v53[0] = v30;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2;
      v45[3] = &unk_208DF0;
      v45[4] = self;
      v35 = &v46;
      id v46 = v10;
      id v47 = v28;
      v33 = &v48;
      v34 = &v47;
      id v48 = v29;
      v20 = &v49;
      uint64_t v24 = &v52;
      id v31 = v30;
      v22 = (id *)v53;
      id v49 = v31;
      id v25 = v28;
      v26 = v50;
      long long v27 = v45;
    }
    else
    {
      [v12 keyChord];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_300;
      v41[3] = &unk_208DC8;
      v32 = &v42;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v42 = v17;
      id v18 = v15;
      id v43 = v18;
      id v19 = v11;
      id v44 = v19;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_301;
      v36[3] = &unk_208DF0;
      v36[4] = self;
      v35 = &v37;
      id v37 = v10;
      id v38 = v17;
      v33 = &v39;
      v34 = &v38;
      id v39 = v18;
      v20 = &v40;
      id v21 = v19;
      v22 = &v44;
      id v40 = v21;
      id v23 = v17;
      uint64_t v24 = &v43;
      id v25 = v23;
      v26 = v41;
      long long v27 = v36;
    }
    [v13 batchUpdateActiveProfile:v26 saveIfSuccessful:1 completion:v27];

    goto LABEL_12;
  }
}

id __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(void *a1, void *a2)
{
  return [a2 removeGesture:a1[4] fromCommand:a1[5] withResolver:a1[6]];
}

void __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = VOTLogCommands();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40) animated:1];
    [*(id *)(a1 + 32) _finishEditingIfNeeded];
  }
}

id __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_300(void *a1, void *a2)
{
  return [a2 removeKeyChord:a1[4] fromCommand:a1[5] withResolver:a1[6]];
}

void __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_301(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = VOTLogCommands();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_301_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40) animated:1];
    [*(id *)(a1 + 32) _finishEditingIfNeeded];
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  [(VoiceOverCommandDetailsViewController *)self setEditing:1 animated:1];

  [(VoiceOverCommandDetailsViewController *)self _updateNavigationBarUI];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  [(VoiceOverCommandDetailsViewController *)self setEditing:0 animated:1];

  [(VoiceOverCommandDetailsViewController *)self _updateNavigationBarUI];
}

- (void)_finishEditingIfNeeded
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  id v8 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
  BOOL v4 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] voCommandContext];
  uint64_t v5 = [v4 command];
  uint64_t v6 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] voCommandResolver];
  unsigned __int8 v7 = [v8 commandHasAnyBindings:v5 withResolver:v6];

  if ((v7 & 1) == 0) {
    [(VoiceOverCommandDetailsViewController *)self setEditing:0 animated:1];
  }
}

- (void)_updateNavigationBarUI
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  id v14 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
  BOOL v4 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] voCommandContext];
  uint64_t v5 = [v4 command];
  uint64_t v6 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] voCommandResolver];
  unsigned __int8 v7 = [v14 commandHasAnyBindings:v5 withResolver:v6];

  if (v7)
  {
    unsigned int v8 = [(VoiceOverCommandDetailsViewController *)self isEditing];
    id v9 = objc_allocWithZone((Class)UIBarButtonItem);
    if (v8)
    {
      id v10 = "_doneNavigationButtonTapped:";
      uint64_t v11 = 0;
    }
    else
    {
      id v10 = "_editNavigationButtonTapped:";
      uint64_t v11 = 2;
    }
    id v12 = [v9 initWithBarButtonSystemItem:v11 target:self action:v10];
    id v13 = [(VoiceOverCommandDetailsViewController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
  else
  {
    id v12 = [(VoiceOverCommandDetailsViewController *)self navigationItem];
    [v12 setRightBarButtonItem:0];
  }
}

- (void)_addGestureButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 voCommandResolver];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke;
  v12[3] = &unk_20BA28;
  id v6 = v4;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  objc_copyWeak(&v15, &location);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke_309;
  v10[3] = &unk_208798;
  objc_copyWeak(&v11, &location);
  unsigned int v8 = +[VoiceOverGesturePickerPresenter presenterWithSpecifier:v6 selectionBlock:v12 cancelBlock:v10];
  gesturePickerPresenter = self->_gesturePickerPresenter;
  self->_gesturePickerPresenter = v8;

  [(VoiceOverGesturePickerPresenter *)self->_gesturePickerPresenter presentWithController:self];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [a1[4] voCommandManager];
  id v10 = a1[5];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke_2;
  v14[3] = &unk_20BA00;
  objc_copyWeak(&v18, a1 + 6);
  id v12 = v7;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  id v17 = a1[5];
  [v9 applyAction:a4 toCommand:v13 withGesture:v12 keyboardShortcut:0 resolver:v10 presentationController:WeakRetained completion:v14];

  objc_destroyWeak(&v18);
}

void __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = VOTLogCommands();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke_2_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained reloadSpecifiers];
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id v6 = (void *)WeakRetained[24];
    WeakRetained[24] = 0;

    [WeakRetained _updateNavigationBarUI];
  }
}

void __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke_309(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
  v1 = (void *)WeakRetained[24];
  WeakRetained[24] = 0;
}

- (void)_addKeyboardShortcutWithSpecifier:(id)a3 resolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = *(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke;
  v22[3] = &unk_20BA50;
  id v9 = v8;
  id v23 = v9;
  id v10 = v6;
  id v24 = v10;
  id v11 = v7;
  id v25 = v11;
  objc_copyWeak(&v26, &location);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke_313;
  v20 = &unk_208798;
  objc_copyWeak(&v21, &location);
  id v12 = +[AXKeyboardShortcutEntryPresenter presenterWithSpecifier:v10 selectionBlock:v22 cancelBlock:&v17];
  keyboardShortcutEntryPresenter = self->_keyboardShortcutEntryPresenter;
  self->_keyboardShortcutEntryPresenter = v12;

  -[AXKeyboardShortcutEntryPresenter setFilteredKeyModifiers:](self->_keyboardShortcutEntryPresenter, "setFilteredKeyModifiers:", 22, v17, v18, v19, v20);
  id v14 = self->_keyboardShortcutEntryPresenter;
  id v15 = [v10 voCommandContext];
  id v16 = [v15 keyChord];
  [(AXKeyboardShortcutEntryPresenter *)v14 presentWithController:self initialKeyChord:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&location);
}

void __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] voCommandContext];
  uint64_t v5 = [v4 command];

  id v6 = [a1[5] voCommandManager];
  id v7 = a1[6];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke_2;
  v11[3] = &unk_20BA00;
  objc_copyWeak(&v15, a1 + 7);
  id v9 = v3;
  id v12 = v9;
  id v10 = v5;
  id v13 = v10;
  id v14 = a1[6];
  [v6 applyAction:3 toCommand:v10 withGesture:0 keyboardShortcut:v9 resolver:v7 presentationController:WeakRetained completion:v11];

  objc_destroyWeak(&v15);
}

void __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = VOTLogCommands();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke_2_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained reloadSpecifiers];
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id v6 = (void *)WeakRetained[23];
    WeakRetained[23] = 0;

    [WeakRetained _updateNavigationBarUI];
  }
}

void __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke_313(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
  v1 = (void *)WeakRetained[23];
  WeakRetained[23] = 0;
}

- (void)_addKeyboardShortcutButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = +[VOSCommandResolver resolverForCurrentHost];
  [(VoiceOverCommandDetailsViewController *)self _addKeyboardShortcutWithSpecifier:v4 resolver:v5];
}

- (void)_addQuickNavShortcutButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = +[VOSCommandResolver resolverForCurrentHost];
  [v5 setKeyboardMode:1];
  [(VoiceOverCommandDetailsViewController *)self _addKeyboardShortcutWithSpecifier:v4 resolver:v5];
}

- (void)_editNavigationButtonTapped:(id)a3
{
}

- (void)_doneNavigationButtonTapped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addItemSpecifiers, 0);
  objc_storeStrong((id *)&self->_gesturePickerPresenter, 0);

  objc_storeStrong((id *)&self->_keyboardShortcutEntryPresenter, 0);
}

void __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_0, v0, v1, "Failed to batch remove gesture '%@' from command '%@' with '%@'. %@");
}

void __88__VoiceOverCommandDetailsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_301_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_0, v0, v1, "Failed to batch remove quicknav keychord '%@' from command '%@' with '%@'. %@");
}

void __65__VoiceOverCommandDetailsViewController__addGestureButtonTapped___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_0, v0, v1, "Failed to add gesture for command. %@ --> %@. %@. %@");
}

void __84__VoiceOverCommandDetailsViewController__addKeyboardShortcutWithSpecifier_resolver___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_0, v0, v1, "Failed to add keychord for command. %@ --> %@. %@. %@");
}

@end