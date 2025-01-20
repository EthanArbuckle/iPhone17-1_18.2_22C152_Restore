@interface VoiceOverCommandsByKeyboardShortcutListController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)_keyboardShortcutValueForSpecifier:(id)a3;
- (id)makeSpecifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_doneNavigationButtonTapped:(id)a3;
- (void)_editNavigationButtonTapped:(id)a3;
- (void)_finishEditingIfNeeded;
- (void)_modifyKeyboardShortcutWithSpecifier:(id)a3 resolver:(id)a4;
- (void)_updateNavigationBarUI;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VoiceOverCommandsByKeyboardShortcutListController

- (id)makeSpecifiers
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v4 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandResolver];
  v35 = self;
  uint64_t v32 = v3;
  v5 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v3] voCommandContext];
  v6 = [v5 commandManager];

  v7 = objc_opt_new();
  v8 = settingsLocString(@"vo.keyboard.shortcuts", @"VoiceOverSettings");
  uint64_t v9 = +[PSSpecifier groupSpecifierWithName:v8];

  id v33 = v7;
  v28 = (void *)v9;
  [v7 addObject:v9];
  [v6 userPresentableAllShortcutBindingsWithResolver:v4];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    v12 = 0;
    uint64_t v13 = *(void *)v37;
    uint64_t v31 = PSEnabledKey;
    uint64_t v29 = *(void *)v37;
    uint64_t v30 = PSCellClassKey;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v16 = (char *)[v6 availabilityForShortcut:v15 withResolver:v4];
        if (v16 != (unsigned char *)&dword_0 + 2)
        {
          id v17 = v16;
          v18 = +[VOCommandContext keyboardShortcutContextWithKeyChord:v15 commandManager:v6 resolver:v4];
          v19 = [v6 commandForKeyChord:v15 withResolver:v4];
          [v18 setCommand:v19];

          v20 = +[NSNumber numberWithUnsignedInteger:v17];
          [v18 setBindingAvailability:v20];

          v21 = [*(id *)&v35->AXUISettingsSearchableBaseListController_opaque[v32] voCommandContext];
          [v21 resolver];
          v23 = id v22 = v11;
          v24 = +[PSSpecifier voKeyboardShortcutBindingItem:v18 commandManager:v6 resolver:v23];

          id v11 = v22;
          uint64_t v13 = v29;
          v25 = +[NSNumber numberWithInt:v17 == 0];
          [v24 setProperty:v25 forKey:v31];

          [v24 setProperty:objc_opt_class() forKey:v30];
          objc_storeWeak((id *)&v24[OBJC_IVAR___PSSpecifier_target], v35);
          *(void *)&v24[OBJC_IVAR___PSSpecifier_getter] = "_keyboardShortcutValueForSpecifier:";
          [v33 addObject:v24];

          v12 = v24;
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  id v26 = v33;

  return v26;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverCommandsByKeyboardShortcutListController;
  [(VoiceOverCommandsByKeyboardShortcutListController *)&v4 viewWillAppear:a3];
  [(VoiceOverCommandsByKeyboardShortcutListController *)self _updateNavigationBarUI];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VoiceOverCommandsByKeyboardShortcutListController;
  [(VoiceOverCommandsByKeyboardShortcutListController *)&v5 setEditing:a3 animated:a4];
  [(VoiceOverCommandsByKeyboardShortcutListController *)self _updateNavigationBarUI];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v8 = [(VoiceOverCommandsByKeyboardShortcutListController *)self specifierAtIndexPath:v6];

  v7 = +[VOSCommandResolver resolverForCurrentHost];
  [(VoiceOverCommandsByKeyboardShortcutListController *)self _modifyKeyboardShortcutWithSpecifier:v8 resolver:v7];
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverCommandsByKeyboardShortcutListController *)self specifierForIndexPath:a4];
  BOOL v5 = [v4 voBindingAvailability] == 0;

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverCommandsByKeyboardShortcutListController *)self specifierForIndexPath:a4];
  int64_t v5 = [v4 voBindingAvailability] == 0;

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    uint64_t v26 = v8;
    uint64_t v27 = v7;
    uint64_t v28 = v5;
    uint64_t v29 = v6;
    id v10 = [(VoiceOverCommandsByKeyboardShortcutListController *)self specifierForIndexPath:a5];
    id v11 = [v10 voCommandResolver];
    v12 = [v10 voCommandContext];
    uint64_t v13 = [v12 commandManager];
    v14 = [v10 voCommandContext];
    uint64_t v15 = [v14 command];

    if (v10
      && v12
      && v13
      && v15
      && [v12 itemType]
      && (char *)[v12 itemType] - 3 <= (unsigned char *)&dword_0 + 1)
    {
      [v12 keyChord];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __100__VoiceOverCommandsByKeyboardShortcutListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v22[3] = &unk_208DC8;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = v15;
      id v25 = v11;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = __100__VoiceOverCommandsByKeyboardShortcutListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2;
      v17[3] = &unk_208DF0;
      v17[4] = self;
      id v18 = v10;
      id v19 = v23;
      id v20 = v24;
      id v21 = v25;
      id v16 = v23;
      [v13 batchUpdateActiveProfile:v22 saveIfSuccessful:1 completion:v17];
    }
  }
}

id __100__VoiceOverCommandsByKeyboardShortcutListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(void *a1, void *a2)
{
  return [a2 removeKeyChord:a1[4] fromCommand:a1[5] withResolver:a1[6]];
}

void __100__VoiceOverCommandsByKeyboardShortcutListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = VOTLogCommands();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __100__VoiceOverCommandsByKeyboardShortcutListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_cold_1((void *)a1, (uint64_t)v3, v4);
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
  [(VoiceOverCommandsByKeyboardShortcutListController *)self setEditing:1 animated:1];

  [(VoiceOverCommandsByKeyboardShortcutListController *)self _updateNavigationBarUI];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  [(VoiceOverCommandsByKeyboardShortcutListController *)self setEditing:0 animated:1];

  [(VoiceOverCommandsByKeyboardShortcutListController *)self _updateNavigationBarUI];
}

- (void)_editNavigationButtonTapped:(id)a3
{
}

- (void)_doneNavigationButtonTapped:(id)a3
{
}

- (void)_modifyKeyboardShortcutWithSpecifier:(id)a3 resolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke;
  v17[3] = &unk_208E40;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  objc_copyWeak(&v20, &location);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke_287;
  v15[3] = &unk_208798;
  objc_copyWeak(&v16, &location);
  id v10 = +[AXKeyboardShortcutEntryPresenter presenterWithSpecifier:v8 selectionBlock:v17 cancelBlock:v15];
  keyboardShortcutEntryPresenter = self->_keyboardShortcutEntryPresenter;
  self->_keyboardShortcutEntryPresenter = v10;

  [(AXKeyboardShortcutEntryPresenter *)self->_keyboardShortcutEntryPresenter setFilteredKeyModifiers:22];
  v12 = self->_keyboardShortcutEntryPresenter;
  uint64_t v13 = [v8 voCommandContext];
  v14 = [v13 keyChord];
  [(AXKeyboardShortcutEntryPresenter *)v12 presentWithController:self initialKeyChord:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

void __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) voCommandContext];
  uint64_t v5 = [v4 command];

  id v6 = [*(id *)(a1 + 32) voCommandManager];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke_2;
  v10[3] = &unk_208E18;
  objc_copyWeak(&v11, v8);
  [v6 applyAction:3 toCommand:v5 withGesture:0 keyboardShortcut:v3 resolver:v7 presentationController:WeakRetained completion:v10];

  objc_destroyWeak(&v11);
}

void __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = VOTLogCommands();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke_2_cold_1((uint64_t)v3, WeakRetained);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained reloadSpecifiers];
    [(objc_class *)WeakRetained[23].isa dismissViewController];
    Class isa = WeakRetained[23].isa;
    WeakRetained[23].Class isa = 0;

    [WeakRetained _updateNavigationBarUI];
  }
}

void __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke_287(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[23] dismissViewController];
  id v1 = WeakRetained[23];
  WeakRetained[23] = 0;
}

- (void)_finishEditingIfNeeded
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  id v7 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
  objc_super v4 = [*(id *)&self->AXUISettingsSearchableBaseListController_opaque[v3] voCommandResolver];
  uint64_t v5 = [v7 allShortcutBindingsWithResolver:v4];
  id v6 = [v5 count];

  if (!v6) {
    [(VoiceOverCommandsByKeyboardShortcutListController *)self setEditing:0 animated:1];
  }
}

- (void)_updateNavigationBarUI
{
  unsigned int v3 = [(VoiceOverCommandsByKeyboardShortcutListController *)self isEditing];
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
  id v8 = [v4 initWithBarButtonSystemItem:v6 target:self action:v5];
  id v7 = [(VoiceOverCommandsByKeyboardShortcutListController *)self navigationItem];
  [v7 setRightBarButtonItem:v8];
}

- (id)_keyboardShortcutValueForSpecifier:(id)a3
{
  unsigned int v3 = [a3 voCommandContext];
  id v4 = [v3 keyChord];
  uint64_t v5 = [v4 accessibilitySpeakableDisplayValue];

  return v5;
}

- (void).cxx_destruct
{
}

void __100__VoiceOverCommandsByKeyboardShortcutListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2_cold_1(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  int v6 = 138413058;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to batch remove keyChord '%@' from command '%@' with '%@'. %@", (uint8_t *)&v6, 0x2Au);
}

void __99__VoiceOverCommandsByKeyboardShortcutListController__modifyKeyboardShortcutWithSpecifier_resolver___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Modify keyboard shortcut failed: %@", (uint8_t *)&v2, 0xCu);
}

@end