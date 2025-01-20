@interface FKASettingsController
- (AXSSKeyboardCommandMap)cachedCommandMap;
- (BOOL)_shouldDisableSwitch;
- (BOOL)cursorColorSelectionController:(id)a3 allowsCursorColor:(int64_t)a4;
- (FKASettingsController)init;
- (id)_instructionWithFormat:(id)a3 forStandardCommandIdentifier:(id)a4;
- (id)activateItemInstruction;
- (id)appSwitcherInstruction;
- (id)availableCommandsUpdateToken;
- (id)controlCenterInstruction;
- (id)focusRingColor:(id)a3;
- (id)focusRingHighContrastEnabled:(id)a3;
- (id)focusRingTimeoutDescription:(id)a3;
- (id)fullKeyboardAccessEnabled:(id)a3;
- (id)helpInstruction;
- (id)homeInstruction;
- (id)largeFocusRingEnabled:(id)a3;
- (id)moveBackwardInstruction;
- (id)moveForwardInstruction;
- (id)notificationCenterInstruction;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (int64_t)selectedColorForSelectionController:(id)a3;
- (void)cursorColorSelectionController:(id)a3 selectedCursorColor:(int64_t)a4;
- (void)dealloc;
- (void)setAvailableCommandsUpdateToken:(id)a3;
- (void)setCachedCommandMap:(id)a3;
- (void)setFocusRingHighContrastEnabled:(id)a3 specifier:(id)a4;
- (void)setFullKeyboardAccessEnabled:(id)a3 specifier:(id)a4;
- (void)setLargeFocusRingEnabled:(id)a3 specifier:(id)a4;
@end

@implementation FKASettingsController

- (FKASettingsController)init
{
  v21.receiver = self;
  v21.super_class = (Class)FKASettingsController;
  v2 = [(FKASettingsController *)&v21 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_preferencesDidChange:" name:kAXSFullKeyboardAccessEnabledNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_preferencesDidChange:" name:kAXSAssistiveTouchScannerEnabledNotification object:0];

    objc_initWeak(&location, v2);
    v5 = +[AXSettings sharedInstance];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __29__FKASettingsController_init__block_invoke;
    v18[3] = &unk_208798;
    objc_copyWeak(&v19, &location);
    [v5 registerUpdateBlock:v18 forRetrieveSelector:"fullKeyboardAccessFocusRingTimeoutEnabled" withListener:v2];

    objc_destroyWeak(&v19);
    v6 = +[AXSettings sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __29__FKASettingsController_init__block_invoke_2;
    v16[3] = &unk_208798;
    objc_copyWeak(&v17, &location);
    [v6 registerUpdateBlock:v16 forRetrieveSelector:"fullKeyboardAccessFocusRingTimeout" withListener:v2];

    objc_destroyWeak(&v17);
    v7 = +[FKAAvailableCommands sharedInstance];
    uint64_t v8 = [v7 commandMap];
    cachedCommandMap = v2->_cachedCommandMap;
    v2->_cachedCommandMap = (AXSSKeyboardCommandMap *)v8;

    v10 = +[FKAAvailableCommands sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __29__FKASettingsController_init__block_invoke_3;
    v14[3] = &unk_209AF8;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = [v10 registerUpdateBlock:v14];
    id availableCommandsUpdateToken = v2->_availableCommandsUpdateToken;
    v2->_id availableCommandsUpdateToken = (id)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__FKASettingsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __29__FKASettingsController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __29__FKASettingsController_init__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 commandMap];

  [WeakRetained setCachedCommandMap:v4];
  [WeakRetained reloadSpecifiers];
}

- (void)dealloc
{
  id v3 = +[FKAAvailableCommands sharedInstance];
  [v3 unregisterUpdateBlockWithToken:self->_availableCommandsUpdateToken];

  v4.receiver = self;
  v4.super_class = (Class)FKASettingsController;
  [(FKASettingsController *)&v4 dealloc];
}

- (BOOL)_shouldDisableSwitch
{
  return _AXSAssistiveTouchScannerEnabled() != 0;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = [(FKASettingsController *)self loadSpecifiersFromPlistName:@"FullKeyboardAccessSettings" target:self];
    [v5 axSafelyAddObjectsFromArray:v6];

    v7 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
    *(void *)&self->AXUISettingsSetupCapableListController_opaque[v3] = v5;
    id v8 = v5;

    v9 = [(FKASettingsController *)self specifierForID:@"FKAEnabledSwitch"];
    v10 = +[NSNumber numberWithInt:[(FKASettingsController *)self _shouldDisableSwitch] ^ 1];

    [v9 setProperty:v10 forKey:PSEnabledKey];
    objc_super v4 = *(void **)&self->AXUISettingsSetupCapableListController_opaque[v3];
  }

  return v4;
}

- (void)setFullKeyboardAccessEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 BOOLValue];
  if (v8)
  {
    _AXSFullKeyboardAccessSetEnabled();
  }
  else
  {
    v9 = AXUILocalizedStringForKey();
    v10 = AXUILocalizedStringForKey();
    uint64_t v11 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    v12 = AXUILocalizedStringForKey();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __64__FKASettingsController_setFullKeyboardAccessEnabled_specifier___block_invoke;
    v19[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
    unsigned __int8 v20 = v8;
    v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v19];

    objc_initWeak(&location, self);
    v14 = AXUILocalizedStringForKey();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __64__FKASettingsController_setFullKeyboardAccessEnabled_specifier___block_invoke_2;
    v16[3] = &unk_208F50;
    objc_copyWeak(&v17, &location);
    id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v16];

    [v11 addAction:v13];
    [v11 addAction:v15];
    [(FKASettingsController *)self presentViewController:v11 animated:1 completion:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

uint64_t __64__FKASettingsController_setFullKeyboardAccessEnabled_specifier___block_invoke()
{
  return _AXSFullKeyboardAccessSetEnabled();
}

void __64__FKASettingsController_setFullKeyboardAccessEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)fullKeyboardAccessEnabled:(id)a3
{
  uint64_t v3 = _AXSFullKeyboardAccessEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FKASettingsController;
  objc_super v4 = [(FKASettingsController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (id)focusRingTimeoutDescription:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  if ([v3 fullKeyboardAccessFocusRingTimeoutEnabled])
  {
    [v3 fullKeyboardAccessFocusRingTimeout];
    AXLocalizedTimeSummary();
  }
  else
  {
    settingsLocString(@"FOCUS_RING_TIMEOUT_DISABLED", @"FullKeyboardAccessSettings");
  objc_super v4 = };

  return v4;
}

- (void)setLargeFocusRingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setFullKeyboardAccessLargeFocusRingEnabled:v4];
}

- (id)largeFocusRingEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 fullKeyboardAccessLargeFocusRingEnabled]);

  return v4;
}

- (void)setFocusRingHighContrastEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setFullKeyboardAccessFocusRingHighContrastEnabled:v4];
}

- (id)focusRingHighContrastEnabled:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 fullKeyboardAccessFocusRingHighContrastEnabled]);

  return v4;
}

- (id)focusRingColor:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 fullKeyboardAccessFocusRingColor];
  id v4 = AXAssistiveTouchScannerColorDescription();

  return v4;
}

- (id)_instructionWithFormat:(id)a3 forStandardCommandIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(FKASettingsController *)self cachedCommandMap];
  v9 = +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:v7];

  v10 = [v8 keyChordForCommand:v9];
  uint64_t v11 = [v10 fkaSpeakableDisplayValue];

  if ([v11 length])
  {
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)helpInstruction
{
  uint64_t v3 = settingsLocString(@"HELP_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierHelp];

  return v4;
}

- (id)moveForwardInstruction
{
  uint64_t v3 = settingsLocString(@"MOVE_FORWARD_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierGoToNextElement];

  return v4;
}

- (id)moveBackwardInstruction
{
  uint64_t v3 = settingsLocString(@"MOVE_BACKWARD_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierGoToPreviousElement];

  return v4;
}

- (id)activateItemInstruction
{
  uint64_t v3 = settingsLocString(@"ACTIVATE_ITEM_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierPerformDefaultAction];

  return v4;
}

- (id)homeInstruction
{
  uint64_t v3 = settingsLocString(@"HOME_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierGoHome];

  return v4;
}

- (id)appSwitcherInstruction
{
  uint64_t v3 = settingsLocString(@"APP_SWITCHER_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierToggleAppSwitcher];

  return v4;
}

- (id)controlCenterInstruction
{
  uint64_t v3 = settingsLocString(@"CONTROL_CENTER_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierToggleControlCenter];

  return v4;
}

- (id)notificationCenterInstruction
{
  uint64_t v3 = settingsLocString(@"NOTIFICATION_CENTER_INSTRUCTION", @"FullKeyboardAccessSettings");
  id v4 = [(FKASettingsController *)self _instructionWithFormat:v3 forStandardCommandIdentifier:AXSSKeyboardCommandIdentifierToggleNotificationCenter];

  return v4;
}

- (void)cursorColorSelectionController:(id)a3 selectedCursorColor:(int64_t)a4
{
  id v6 = +[AXSettings sharedInstance];
  [v6 setFullKeyboardAccessFocusRingColor:a4];

  [(FKASettingsController *)self reloadSpecifierID:@"FKAFocusRingColor"];
}

- (int64_t)selectedColorForSelectionController:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 fullKeyboardAccessFocusRingColor];

  return (int64_t)v4;
}

- (BOOL)cursorColorSelectionController:(id)a3 allowsCursorColor:(int64_t)a4
{
  return 1;
}

- (AXSSKeyboardCommandMap)cachedCommandMap
{
  return self->_cachedCommandMap;
}

- (void)setCachedCommandMap:(id)a3
{
}

- (id)availableCommandsUpdateToken
{
  return self->_availableCommandsUpdateToken;
}

- (void)setAvailableCommandsUpdateToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_availableCommandsUpdateToken, 0);

  objc_storeStrong((id *)&self->_cachedCommandMap, 0);
}

@end