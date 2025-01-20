@interface AXSoundActionsController
- (BOOL)_shouldEnableSoundSource;
- (id)_allSoundActions;
- (id)_keyForSoundAction:(id)a3;
- (id)_stringForSoundAction:(id)a3;
- (id)actionForActionPickerController:(id)a3;
- (id)actionsBySoundAction;
- (id)selectSpecifier:(id)a3;
- (id)soundAction:(id)a3;
- (id)specifiers;
- (void)actionPickerController:(id)a3 didSelectAction:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AXSoundActionsController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v24 = OBJC_IVAR___PSListController__specifiers;
    v4 = objc_opt_new();
    v5 = +[PSSpecifier emptyGroupSpecifier];
    if ([(AXSoundActionsController *)self _shouldEnableSoundSource]) {
      v6 = @"SOUND_ACTION_PRACTICE_FOOTER";
    }
    else {
      v6 = @"SOUND_ACTION_GROUP_FOOTER";
    }
    v7 = settingsLocString(v6, @"Accessibility");
    [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v4 addObject:v5];
    v8 = settingsLocString(@"SOUND_ACTION_PRACTICE_TITLE", @"Accessibility");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v9 setIdentifier:@"SOUND_ACTION_PRACTICE_ID"];
    v10 = +[NSNumber numberWithBool:[(AXSoundActionsController *)self _shouldEnableSoundSource]];
    uint64_t v26 = PSEnabledKey;
    objc_msgSend(v9, "setProperty:forKey:", v10);

    [v4 addObject:v9];
    v11 = +[PSSpecifier emptyGroupSpecifier];

    v12 = v4;
    [v4 addObject:v11];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [(AXSoundActionsController *)self _allSoundActions];
    id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        v16 = 0;
        v17 = v11;
        do
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v16);
          v19 = [(AXSoundActionsController *)self _stringForSoundAction:v18];
          v11 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:"soundAction:" detail:objc_opt_class() cell:2 edit:0];

          [v11 setProperty:v18 forKey:@"AXSoundActionsInputEventUsage"];
          v20 = +[NSNumber numberWithBool:[(AXSoundActionsController *)self _shouldEnableSoundSource]];
          [v11 setProperty:v20 forKey:v26];

          v21 = [(AXSoundActionsController *)self _keyForSoundAction:v18];
          [v11 setIdentifier:v21];

          [v12 addObject:v11];
          v16 = (char *)v16 + 1;
          v17 = v11;
        }
        while (v14 != v16);
        id v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);
    }

    v22 = *(void **)&self->AXUISettingsBaseListController_opaque[v24];
    *(void *)&self->AXUISettingsBaseListController_opaque[v24] = v12;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v24];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AXSoundActionsController;
  id v6 = a4;
  [(AXSoundActionsController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = -[AXSoundActionsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v12.receiver, v12.super_class);

  v8 = [v7 identifier];
  LODWORD(v6) = [v8 isEqualToString:@"SOUND_ACTION_PRACTICE_ID"];

  if (v6)
  {
    v9 = [SoundActionsPracticeNavigationController alloc];
    v10 = [(AXSoundActionsController *)self soundActionslocalURL];
    v11 = [(SoundActionsPracticeNavigationController *)v9 initWithAssetURL:v10];

    [(AXSoundActionsController *)self presentModalViewController:v11 withTransition:3];
  }
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXSoundActionsController;
  v5 = [(AXSoundActionsController *)&v8 selectSpecifier:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setDelegate:self];
    id v6 = [v4 identifier];
    [v5 setIdentifier:v6];
  }

  return v5;
}

- (id)soundAction:(id)a3
{
  id v4 = [a3 propertyForKey:@"AXSoundActionsInputEventUsage"];
  id v5 = [v4 integerValue];

  id v6 = [(AXSoundActionsController *)self actionsBySoundAction];
  v7 = +[NSNumber numberWithLong:v5];
  objc_super v8 = [v7 stringValue];
  v9 = [v6 objectForKey:v8];

  if (v9) {
    AXUIAssistiveTouchStringForName();
  }
  else {
  v10 = settingsLocString(@"NONE", @"HandSettings");
  }

  return v10;
}

- (id)actionForActionPickerController:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [(AXSoundActionsController *)self specifierForID:v4];
  id v6 = [v5 propertyForKey:@"AXSoundActionsInputEventUsage"];
  id v7 = [v6 integerValue];

  objc_super v8 = [(AXSoundActionsController *)self actionsBySoundAction];
  v9 = +[NSNumber numberWithLong:v7];
  v10 = [v9 stringValue];
  v11 = [v8 objectForKey:v10];
  objc_super v12 = v11;
  if (!v11) {
    v11 = @"__NONE__";
  }
  id v13 = v11;

  return v13;
}

- (void)actionPickerController:(id)a3 didSelectAction:(id)a4
{
  id v19 = a4;
  id v6 = [a3 identifier];
  id v7 = [(AXSoundActionsController *)self specifierForID:v6];
  objc_super v8 = [v7 propertyForKey:@"AXSoundActionsInputEventUsage"];
  id v9 = [v8 integerValue];

  v10 = [(AXSoundActionsController *)self actionsBySoundAction];
  id v11 = [v10 mutableCopy];
  objc_super v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  id v14 = v13;

  unsigned int v15 = [v19 isEqualToString:@"__NONE__"];
  v16 = +[NSNumber numberWithLong:v9];
  v17 = [v16 stringValue];
  if (v15) {
    id v18 = 0;
  }
  else {
    id v18 = v19;
  }
  [v14 setObject:v18 forKeyedSubscript:v17];

  [(AXSoundActionsController *)self updateSoundActionsWithDictionary:v14];
  [(AXSoundActionsController *)self reloadSpecifiers];
}

- (id)_allSoundActions
{
  return &off_22BE58;
}

- (id)_keyForSoundAction:(id)a3
{
  v7[0] = &off_229708;
  v7[1] = &off_229720;
  v8[0] = @"SOUND_ACTION_CLICK";
  v8[1] = @"SOUND_ACTION_CLUCK";
  v7[2] = &off_229738;
  v7[3] = &off_229750;
  v8[2] = @"SOUND_ACTION_EE";
  v8[3] = @"SOUND_ACTION_EH";
  v7[4] = &off_229768;
  v7[5] = &off_229780;
  v8[4] = @"SOUND_ACTION_KK";
  v8[5] = @"SOUND_ACTION_LA";
  v7[6] = &off_229798;
  v7[7] = &off_2297B0;
  v8[6] = @"SOUND_ACTION_MUH";
  v8[7] = @"SOUND_ACTION_OO";
  v7[8] = &off_2297C8;
  v7[9] = &off_2297E0;
  v8[8] = @"SOUND_ACTION_POP";
  v8[9] = @"SOUND_ACTION_PP";
  v7[10] = &off_2297F8;
  v7[11] = &off_229810;
  v8[10] = @"SOUND_ACTION_SH";
  v8[11] = @"SOUND_ACTION_SS";
  v7[12] = &off_229828;
  v7[13] = &off_229840;
  v8[12] = @"SOUND_ACTION_TT";
  v8[13] = @"SOUND_ACTION_UH";
  id v3 = a3;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:14];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

- (id)_stringForSoundAction:(id)a3
{
  id v3 = [(AXSoundActionsController *)self _keyForSoundAction:a3];
  id v4 = settingsLocString(v3, @"Accessibility");

  return v4;
}

- (BOOL)_shouldEnableSoundSource
{
  v2 = [(AXSoundActionsController *)self soundActionslocalURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)actionsBySoundAction
{
  return &__NSDictionary0__struct;
}

@end