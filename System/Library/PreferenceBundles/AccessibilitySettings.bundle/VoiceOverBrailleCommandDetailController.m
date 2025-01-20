@interface VoiceOverBrailleCommandDetailController
- (BOOL)keyIsSupported:(id)a3;
- (BOOL)keyIsSupportedInEightDot:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (VoiceOverBrailleCommandDetailController)init;
- (id)_assignedCommandSpecifiers;
- (id)_buttonNameForKeyIdentifier:(id)a3;
- (id)_specifierForBrailleKeyIdentifier:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_donePressed;
- (void)_editPressed:(id)a3;
- (void)_updateEditButtonState;
- (void)handleBrailleKeyMemorize:(id)a3;
- (void)memorizeNextKey:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverBrailleCommandDetailController

- (VoiceOverBrailleCommandDetailController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VoiceOverBrailleCommandDetailController;
  v2 = [(VoiceOverBrailleCommandDetailController *)&v6 init];
  if (v2)
  {
    v3 = (SCROBrailleClient *)[objc_alloc((Class)SCROBrailleClient) initWithDelegate:v2];
    brailleClient = v2->_brailleClient;
    v2->_brailleClient = v3;

    [(SCROBrailleClient *)v2->_brailleClient setKeepConnectionAlive:1];
    [(SCROBrailleClient *)v2->_brailleClient setDisplayDescriptorCallbackEnabled:0];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v4 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v5 = [v4 objectForKey:@"bt-device"];
  device = self->_device;
  self->_device = v5;

  v7 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] userInfo];
  v8 = [v7 objectForKey:@"braille-command"];
  command = self->_command;
  self->_command = v8;

  v10 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] userInfo];
  v11 = [v10 objectForKey:@"input-manager"];
  inputManager = self->_inputManager;
  self->_inputManager = v11;

  v13 = [*(id *)&self->AXUISettingsBaseListController_opaque[v3] userInfo];
  v14 = [v13 objectForKey:@"display-token"];
  self->_token = [v14 intValue];

  uint64_t v15 = OBJC_IVAR___PSListController__specifiers;
  v16 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v16)
  {
    id v17 = objc_alloc_init((Class)NSMutableArray);
    v18 = settingsLocString(@"ASSIGNED_BRAILLE_KEYS", @"VoiceOverBrailleOptions");
    v19 = +[PSSpecifier groupSpecifierWithID:@"BrailleCommandGroup" name:v18];

    [v17 addObject:v19];
    v20 = [(VoiceOverBrailleCommandDetailController *)self _assignedCommandSpecifiers];
    if ([v20 count])
    {
      [(VoiceOverBrailleCommandDetailController *)self _updateEditButtonState];
      [v17 addObjectsFromArray:v20];
    }
    else
    {
      v21 = settingsLocString(@"NO_ASSIGNED_BRAILLE_KEYS", @"VoiceOverBrailleOptions");
      v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:objc_opt_class() cell:3 edit:0];

      [v22 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
      [v17 addObject:v22];
    }
    v23 = +[PSSpecifier groupSpecifierWithID:@"AddNewCommand"];
    [v17 addObject:v23];
    v24 = settingsLocString(@"ASSIGN_NEW_CHORD", @"VoiceOverBrailleOptions");
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v25 setButtonAction:"memorizeNextKey:"];
    [v17 addObject:v25];
    v26 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
    *(void *)&self->AXUISettingsBaseListController_opaque[v15] = v17;

    v16 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
  }

  return v16;
}

- (id)_assignedCommandSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = [(SCROMobileBrailleDisplayInputManager *)self->_inputManager commandDictionaryForDisplayWithToken:self->_token];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __69__VoiceOverBrailleCommandDetailController__assignedCommandSpecifiers__block_invoke;
  v9[3] = &unk_209CB0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  objc_super v6 = v10;
  id v7 = v5;

  return v7;
}

void __69__VoiceOverBrailleCommandDetailController__assignedCommandSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if ([a3 isEqualToString:*(void *)(*(void *)(a1 + 32) + 216)]
    && [*(id *)(a1 + 32) keyIsSupported:v6])
  {
    id v5 = [*(id *)(a1 + 32) _specifierForBrailleKeyIdentifier:v6];
    if (v5) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

- (BOOL)keyIsSupported:(id)a3
{
  return VOTBrailleKeyIsSupported(a3);
}

- (BOOL)keyIsSupportedInEightDot:(id)a3
{
  return VOTBrailleKeyIsSupportedInEightDot(a3);
}

- (id)_buttonNameForKeyIdentifier:(id)a3
{
  return VOTBrailleButtonName((uint64_t)a3, self->_inputManager, self->_token);
}

- (id)_specifierForBrailleKeyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverBrailleCommandDetailController *)self _buttonNameForKeyIdentifier:v4];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:3 edit:0];
  [v6 setProperty:v4 forKey:@"braille-key"];

  return v6;
}

- (void)_updateEditButtonState
{
  uint64_t v3 = [(VoiceOverBrailleCommandDetailController *)self _assignedCommandSpecifiers];
  id v4 = [v3 count];

  if (v4)
  {
    if (([*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] isEditing] & 1) == 0)
    {
      id v7 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_editPressed:"];
      id v6 = [(VoiceOverBrailleCommandDetailController *)self navigationItem];
      [v6 setRightBarButtonItem:v7];
    }
  }
  else
  {
    id v5 = [(VoiceOverBrailleCommandDetailController *)self navigationItem];
    [v5 setRightBarButtonItem:0];

    [(VoiceOverBrailleCommandDetailController *)self setEditing:0 animated:1];
  }
}

- (void)_editPressed:(id)a3
{
  [(VoiceOverBrailleCommandDetailController *)self setEditing:1 animated:1];
  id v5 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed"];
  id v4 = [(VoiceOverBrailleCommandDetailController *)self navigationItem];
  [v4 setRightBarButtonItem:v5];
}

- (void)_donePressed
{
  [(VoiceOverBrailleCommandDetailController *)self setEditing:0 animated:1];

  [(VoiceOverBrailleCommandDetailController *)self _updateEditButtonState];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if ((uint64_t)v8 >= (uint64_t)[v6 numberOfSections]
    || (id v9 = [v7 row],
        (uint64_t)v9 >= (uint64_t)objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"))))
  {
    BOOL v12 = 0;
  }
  else
  {
    id v10 = [(VoiceOverBrailleCommandDetailController *)self specifierAtIndex:[(VoiceOverBrailleCommandDetailController *)self indexForIndexPath:v7]];
    v11 = [v10 propertyForKey:@"braille-key"];
    BOOL v12 = v11 != 0;
  }
  return v12;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(VoiceOverBrailleCommandDetailController *)self specifierAtIndex:[(VoiceOverBrailleCommandDetailController *)self indexForIndexPath:a4]];
  id v5 = [v4 propertyForKey:@"braille-key"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  [(VoiceOverBrailleCommandDetailController *)self beginUpdates];
  id v8 = [(VoiceOverBrailleCommandDetailController *)self indexForIndexPath:v7];

  id v9 = [(VoiceOverBrailleCommandDetailController *)self specifierAtIndex:v8];
  id v10 = v9;
  if (a4 == 1)
  {
    v11 = [v9 propertyForKey:@"braille-key"];
    if (v11)
    {
      [(SCROMobileBrailleDisplayInputManager *)self->_inputManager setCommand:kVOTEventCommandNullCommand forInputIdentifier:v11 forDisplayWithToken:self->_token];
      v13 = v10;
      BOOL v12 = +[NSArray arrayWithObjects:&v13 count:1];
      [(VoiceOverBrailleCommandDetailController *)self removeContiguousSpecifiers:v12 animated:1];
    }
  }
  [(VoiceOverBrailleCommandDetailController *)self _updateEditButtonState];
  [(VoiceOverBrailleCommandDetailController *)self endUpdates];
}

- (void)memorizeNextKey:(id)a3
{
  id v4 = settingsLocString(@"BRAILLE_PRESS_KEYS_TO_BIND", @"VoiceOverBrailleOptions");
  id v5 = objc_alloc_init((Class)VOSVoiceOverCommandInfo);
  int64_t v6 = [v5 localizedNameForCommand:self->_command];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  id v8 = settingsLocString(@"BRAILLE_PRESS_KEYS_TITLE", @"VoiceOverBrailleOptions");
  id v9 = +[UIAlertController alertControllerWithTitle:v8 message:v7 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v9;

  v11 = settingsLocString(@"CANCEL", @"VoiceOverBluetoothDevices");
  BOOL v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];

  [(UIAlertController *)self->_alertController addAction:v12];
  self->_hasMemorizedKey = 0;
  if ([(VoiceOverBrailleCommandDetailController *)self inSetup])
  {
    v13 = [(VoiceOverBrailleCommandDetailController *)self navigationController];
  }
  else
  {
    v14 = [(VoiceOverBrailleCommandDetailController *)self view];
    uint64_t v15 = [v14 window];
    v13 = [v15 rootViewController];
  }
  v16 = self->_alertController;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __59__VoiceOverBrailleCommandDetailController_memorizeNextKey___block_invoke;
  v17[3] = &unk_2087C0;
  v17[4] = self;
  [v13 presentViewController:v16 animated:1 completion:v17];
}

id __59__VoiceOverBrailleCommandDetailController_memorizeNextKey___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 192) setPrimaryBrailleDisplay:*(unsigned int *)(*(void *)(a1 + 32) + 208)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 192);
  uint64_t v4 = *(unsigned int *)(v2 + 208);

  return [v3 setPrepareToMemorizeNextKey:1 immediate:1 forDisplayWithToken:v4];
}

- (void)handleBrailleKeyMemorize:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke;
  v4[3] = &unk_208948;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 240) && *(void *)(a1 + 40))
  {
    *(unsigned char *)(v1 + 240) = 1;
    id v3 = [*(id *)(*(void *)(a1 + 32) + 200) commandForBrailleKey:*(void *)(a1 + 40)];
    if ([v3 length]
      && ([v3 isEqualToString:kVOTEventCommandNullCommand] & 1) == 0)
    {
      int64_t v6 = *(void **)(*(void *)(a1 + 32) + 224);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_2;
      v11[3] = &unk_209510;
      id v7 = v3;
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      id v12 = v7;
      uint64_t v13 = v8;
      id v14 = v9;
      [v6 dismissViewControllerAnimated:0 completion:v11];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 200) setCommand:*(void *)(*(void *)(a1 + 32) + 216) forBrailleKey:*(void *)(a1 + 40)];
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 224);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_5;
      v10[3] = &unk_2087C0;
      v10[4] = v4;
      [v5 dismissViewControllerAnimated:1 completion:v10];
    }
  }
}

void __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = settingsLocString(@"BRAILLE_KEY_IN_USE_TITLE", @"VoiceOverBrailleOptions");
  id v3 = objc_alloc_init((Class)VOSVoiceOverCommandInfo);
  uint64_t v4 = [v3 localizedNameForCommand:*(void *)(a1 + 32)];

  id v5 = settingsLocString(@"CONFLICT_BRAILLE_KEY_BINDING", @"VoiceOverBrailleOptions");
  int64_t v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) identifier];
  uint64_t v8 = [v6 _buttonNameForKeyIdentifier:v7];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8, v4);

  uint64_t v10 = +[UIAlertController alertControllerWithTitle:v2 message:v9 preferredStyle:1];
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(v11 + 232);
  *(void *)(v11 + 232) = v10;

  uint64_t v13 = settingsLocString(@"CANCEL", @"VoiceOverBluetoothDevices");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_3;
  v25[3] = &unk_208B68;
  v25[4] = *(void *)(a1 + 40);
  id v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v25];

  [*(id *)(*(void *)(a1 + 40) + 232) addAction:v14];
  uint64_t v15 = settingsLocString(@"REPLACE", @"VoiceOverBrailleOptions");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_4;
  v23[3] = &unk_209CD8;
  v16 = *(void **)(a1 + 48);
  v23[4] = *(void *)(a1 + 40);
  id v24 = v16;
  id v17 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v23];

  [*(id *)(*(void *)(a1 + 40) + 232) addAction:v17];
  unsigned __int8 v18 = [*(id *)(a1 + 40) inSetup];
  v19 = *(void **)(a1 + 40);
  if (v18)
  {
    v20 = [v19 navigationController];
  }
  else
  {
    v21 = [v19 view];
    v22 = [v21 window];
    v20 = [v22 rootViewController];
  }
  [v20 presentViewController:*(void *)(*(void *)(a1 + 40) + 232) animated:1 completion:0];
}

id __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 232) dismissViewControllerAnimated:1 completion:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

id __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) setCommand:*(void *)(*(void *)(a1 + 32) + 216) forBrailleKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 232) dismissViewControllerAnimated:1 completion:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

id __68__VoiceOverBrailleCommandDetailController_handleBrailleKeyMemorize___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictAlertController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
  objc_storeStrong((id *)&self->_brailleClient, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end