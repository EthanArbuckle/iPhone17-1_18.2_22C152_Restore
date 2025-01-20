@interface VoiceOverCommandsOverviewController
- (VOSCommandManager)commandManager;
- (id)specifiers;
- (void)_resetVoiceOverCommandsButtonTapped:(id)a3;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)setCommandManager:(id)a3;
@end

@implementation VoiceOverCommandsOverviewController

- (VOSCommandManager)commandManager
{
  commandManager = self->_commandManager;
  if (!commandManager)
  {
    v4 = (VOSCommandManager *)[objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
    v5 = self->_commandManager;
    self->_commandManager = v4;

    commandManager = self->_commandManager;
  }

  return commandManager;
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v52 = OBJC_IVAR___PSListController__specifiers;
    v47 = self;
    v4 = [(VoiceOverCommandsOverviewController *)self commandManager];
    v5 = objc_opt_new();
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    v7 = +[VOSCommandResolver resolverForCurrentHost];
    v8 = settingsLocString(@"vo.all.commands", @"VoiceOverSettings");
    v9 = +[PSSpecifier voGenericSubmenuWithTitle:v8 childViewControllerClass:objc_opt_class() commandManager:v4 resolver:v7];

    uint64_t v10 = PSIDKey;
    [v9 setProperty:@"AllCommands" forKey:PSIDKey];
    [v5 addObject:v9];
    v11 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v11];
    v12 = settingsLocString(@"vo.touch.gestures", @"VoiceOverSettings");
    v13 = +[PSSpecifier voGenericSubmenuWithTitle:v12 childViewControllerClass:objc_opt_class() commandManager:v4 resolver:v7];

    [v13 setProperty:@"TouchGestures" forKey:v10];
    [v5 addObject:v13];
    v14 = settingsLocString(@"vo.keyboard.shortcuts", @"VoiceOverSettings");
    v15 = +[PSSpecifier voGenericSubmenuWithTitle:v14 childViewControllerClass:objc_opt_class() commandManager:v4 resolver:v7];

    [v15 setProperty:@"KeyboardShortcuts" forKey:v10];
    [v5 addObject:v15];
    v16 = voiceOverLocalizedStringForKeyboardShortcutsFooterText();
    [v11 setProperty:v16 forKey:PSFooterTextGroupKey];

    v45 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v45];
    v17 = +[VOSScreenreaderMode Handwriting];
    uint64_t v18 = [v7 resolverWithScreenreaderModeVariant:v17];

    v19 = settingsLocString(@"vo.handwriting", @"VoiceOverSettings");
    v49 = (void *)v18;
    v20 = +[PSSpecifier voGenericSubmenuWithTitle:v19 childViewControllerClass:objc_opt_class() commandManager:v4 resolver:v18];

    [v20 setProperty:@"Handwriting" forKey:v10];
    [v5 addObject:v20];
    v21 = +[VOSScreenreaderMode BrailleScreenInput];
    v51 = v7;
    uint64_t v22 = [v7 resolverWithScreenreaderModeVariant:v21];

    v23 = settingsLocString(@"vo.bsi", @"VoiceOverSettings");
    v48 = (void *)v22;
    v24 = +[PSSpecifier voGenericSubmenuWithTitle:v23 childViewControllerClass:objc_opt_class() commandManager:v4 resolver:v22];

    uint64_t v50 = v10;
    [v24 setProperty:@"BrailleScreenInput" forKey:v10];
    [v5 addObject:v24];
    v25 = +[VOSBluetoothManager sharedInstance];
    v26 = [v25 pairedBrailleDevices];

    v27 = settingsLocString(@"vo.braille.devices", @"VoiceOverSettings");
    uint64_t v28 = +[PSSpecifier groupSpecifierWithName:v27];

    v46 = (void *)v28;
    [v5 addObject:v28];
    v29 = settingsLocString(@"vo.braille.command.default", @"VoiceOverSettings");
    objc_opt_class();
    v30 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, 0);

    [v30 setVoBrailleDevice:0];
    v31 = v5;
    [v5 addObject:v30];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v32 = v26;
    id v33 = [v32 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v54;
      do
      {
        v36 = 0;
        v37 = v30;
        do
        {
          if (*(void *)v54 != v35) {
            objc_enumerationMutation(v32);
          }
          v38 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v36);
          v39 = [v38 name];
          v30 = +[PSSpecifier preferenceSpecifierNamed:v39 target:v47 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          [v30 setVoBrailleDevice:v38];
          [v31 addObject:v30];
          v36 = (char *)v36 + 1;
          v37 = v30;
        }
        while (v34 != v36);
        id v34 = [v32 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v34);
    }

    v40 = +[PSSpecifier emptyGroupSpecifier];

    [v31 addObject:v40];
    v41 = settingsLocString(@"vo.reset.commands.title", @"VoiceOverSettings");
    v42 = +[PSSpecifier deleteButtonSpecifierWithName:v41 target:v47 action:"_resetVoiceOverCommandsButtonTapped:"];

    [v42 setProperty:@"ResetVoiceOverCommands" forKey:v50];
    [v31 addObject:v42];
    [(VoiceOverCommandsOverviewController *)v47 setAllSpecifiersUnsearchable:v31];
    v43 = *(void **)&v47->AXUISettingsBaseListController_opaque[v52];
    *(void *)&v47->AXUISettingsBaseListController_opaque[v52] = v31;

    v3 = *(void **)&v47->AXUISettingsBaseListController_opaque[v52];
  }

  return v3;
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
}

- (void)_resetVoiceOverCommandsButtonTapped:(id)a3
{
  id v8 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v4 = settingsLocString(@"vo.reset.commands.prompt.title", @"VoiceOverSettings");
  [v8 setTitle:v4];

  v5 = settingsLocString(@"vo.reset.commands.prompt.details", @"VoiceOverSettings");
  [v8 setPrompt:v5];

  v6 = settingsLocString(@"vo.cancel", @"VoiceOverSettings");
  [v8 setCancelButton:v6];

  v7 = settingsLocString(@"vo.ok", @"VoiceOverSettings");
  [v8 setOkButton:v7];

  [v8 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [(VoiceOverCommandsOverviewController *)self showConfirmationViewForSpecifier:v8];
}

- (void)setCommandManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end