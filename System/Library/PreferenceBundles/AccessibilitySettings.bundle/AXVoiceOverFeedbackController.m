@interface AXVoiceOverFeedbackController
+ (id)descriptionForOption:(id)a3;
- (VOFeedbackExtraOnOffSwitch)extraOnOffSwitchBlock;
- (id)_extraGetter:(id)a3;
- (id)getValueSelectedBlock;
- (id)setValueSelectedBlock;
- (id)specifiers;
- (void)_extraSetter:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXVoiceOverFeedbackController

+ (id)descriptionForOption:(id)a3
{
  if (!a3)
  {
    v7 = settingsLocString(@"DEFAULT", @"Accessibility");
    goto LABEL_15;
  }
  unsigned __int8 v3 = [a3 integerValue];
  v4 = objc_opt_new();
  if ((v3 & 2) != 0)
  {
    v11 = settingsLocString(@"FEEDBACK_SPEAK", @"VoiceOverSettings");
    [v4 addObject:v11];

    if ((v3 & 4) == 0)
    {
LABEL_4:
      if ((v3 & 8) == 0) {
        goto LABEL_5;
      }
LABEL_20:
      v13 = settingsLocString(@"FEEDBACK_CHANGE_PITCH", @"VoiceOverSettings");
      [v4 addObject:v13];

      if ((v3 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_4;
  }
  v12 = settingsLocString(@"FEEDBACK_PLAY_TONE", @"VoiceOverSettings");
  [v4 addObject:v12];

  if ((v3 & 8) != 0) {
    goto LABEL_20;
  }
LABEL_5:
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    v5 = settingsLocString(@"FEEDBACK_CHANGE_BRAILLE", @"VoiceOverSettings");
    [v4 addObject:v5];
  }
LABEL_7:
  v6 = +[NSListFormatter localizedStringByJoiningStrings:v4];
  v7 = v6;
  if (v3)
  {
    if ([v6 length])
    {
      v8 = AXLogUI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[AXVoiceOverFeedbackController descriptionForOption:](v8);
      }
    }
    uint64_t v9 = settingsLocString(@"FEEDBACK_DO_NOTHING", @"VoiceOverSettings");

    v7 = (void *)v9;
  }

LABEL_15:

  return v7;
}

- (id)getValueSelectedBlock
{
  v2 = [(AXVoiceOverFeedbackController *)self specifier];
  unsigned __int8 v3 = [v2 propertyForKey:@"getValueSelectedBlock"];

  return v3;
}

- (VOFeedbackExtraOnOffSwitch)extraOnOffSwitchBlock
{
  v2 = [(AXVoiceOverFeedbackController *)self specifier];
  unsigned __int8 v3 = [v2 propertyForKey:@"extraOnOffSwitchBlock"];

  return (VOFeedbackExtraOnOffSwitch *)v3;
}

- (id)setValueSelectedBlock
{
  v2 = [(AXVoiceOverFeedbackController *)self specifier];
  unsigned __int8 v3 = [v2 propertyForKey:@"setValueSelectedBlock"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v7 = +[NSMutableArray array];
    v8 = [(AXVoiceOverFeedbackController *)self specifier];
    uint64_t v9 = [v8 propertyForKey:@"showDefaultOption"];
    unsigned int v10 = [v9 BOOLValue];

    if (v10)
    {
      v11 = settingsLocString(@"DEFAULT", @"Accessibility");
      v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v12 setProperty:&off_2295A0 forKey:@"AXSVOFeedbackKey"];
      [v7 addObject:v12];
    }
    v13 = settingsLocString(@"FEEDBACK_SPEAK", @"VoiceOverSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setProperty:&off_2295B8 forKey:@"AXSVOFeedbackKey"];
    [v7 addObject:v14];
    v15 = [(AXVoiceOverFeedbackController *)self specifier];
    v16 = [v15 propertyForKey:@"ignoreSoundOption"];
    unsigned __int8 v17 = [v16 BOOLValue];

    if ((v17 & 1) == 0)
    {
      v18 = settingsLocString(@"FEEDBACK_PLAY_TONE", @"VoiceOverSettings");
      v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v19 setProperty:&off_2295D0 forKey:@"AXSVOFeedbackKey"];
      [v7 addObject:v19];
      v14 = v19;
    }
    v20 = [(AXVoiceOverFeedbackController *)self specifier];
    v21 = [v20 propertyForKey:@"ignorePitchOption"];
    unsigned __int8 v22 = [v21 BOOLValue];

    if ((v22 & 1) == 0)
    {
      v23 = settingsLocString(@"FEEDBACK_CHANGE_PITCH", @"VoiceOverSettings");
      v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v24 setProperty:&off_2295E8 forKey:@"AXSVOFeedbackKey"];
      [v7 addObject:v24];
      v14 = v24;
    }
    v25 = [(AXVoiceOverFeedbackController *)self specifier];
    v26 = [v25 propertyForKey:@"ignoreBrailleOption"];
    unsigned __int8 v27 = [v26 BOOLValue];

    if ((v27 & 1) == 0)
    {
      v28 = settingsLocString(@"FEEDBACK_CHANGE_BRAILLE", @"VoiceOverSettings");
      v29 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v29 setProperty:&off_229600 forKey:@"AXSVOFeedbackKey"];
      [v7 addObject:v29];
      v14 = v29;
    }
    v30 = settingsLocString(@"FEEDBACK_DO_NOTHING", @"VoiceOverSettings");
    v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v31 setProperty:&off_229618 forKey:@"AXSVOFeedbackKey"];
    [v7 addObject:v31];
    v32 = [(AXVoiceOverFeedbackController *)self extraOnOffSwitchBlock];
    v33 = [v32 title];

    if (v33)
    {
      v34 = +[PSSpecifier emptyGroupSpecifier];
      [v7 addObject:v34];

      v35 = [(AXVoiceOverFeedbackController *)self extraOnOffSwitchBlock];
      v36 = [v35 title];
      v37 = v36[2]();
      uint64_t v38 = +[PSSpecifier preferenceSpecifierNamed:v37 target:self set:"_extraSetter:specifier:" get:"_extraGetter:" detail:0 cell:6 edit:0];

      [v7 addObject:v38];
      v31 = (void *)v38;
    }
    id v39 = [v7 copy];
    v40 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v39;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)_extraSetter:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  uint64_t v5 = [(AXVoiceOverFeedbackController *)self extraOnOffSwitchBlock];
  v6 = [v5 setter];

  if (v6)
  {
    v7 = [(AXVoiceOverFeedbackController *)self extraOnOffSwitchBlock];
    v8 = [v7 setter];
    ((void (**)(void, id))v8)[2](v8, [v9 BOOLValue]);
  }
}

- (id)_extraGetter:(id)a3
{
  v4 = [(AXVoiceOverFeedbackController *)self extraOnOffSwitchBlock];
  uint64_t v5 = [v4 getter];

  if (v5)
  {
    v6 = [(AXVoiceOverFeedbackController *)self extraOnOffSwitchBlock];
    v7 = [v6 getter];
    v8 = +[NSNumber numberWithBool:v7[2]()];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a4;
  v6 = [(AXVoiceOverFeedbackController *)self getValueSelectedBlock];
  uint64_t v7 = v6[2]();

  v8 = [v13 specifier];
  id v9 = [v8 propertyForKey:@"AXSVOFeedbackKey"];
  unint64_t v10 = (unint64_t)[v9 integerValue];

  if (((v10 & v7 & 0x8000000000000000) != 0) ^ v11 | ((v10 & v7) == 0)) {
    BOOL v12 = (v10 | v7) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  [v13 setChecked:v12];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)AXVoiceOverFeedbackController;
  id v6 = a4;
  [(AXVoiceOverFeedbackController *)&v20 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[AXVoiceOverFeedbackController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v20.receiver, v20.super_class);

  v8 = [v7 propertyForKey:@"AXSVOFeedbackKey"];
  unint64_t v9 = (unint64_t)[v8 integerValue];

  unint64_t v10 = [(AXVoiceOverFeedbackController *)self getValueSelectedBlock];
  uint64_t v11 = v10[2]();

  if (v9 >= 2)
  {
    if ((v9 & ~v11) != 0)
    {
      unint64_t v15 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if (v9 == 8)
      {
        v16 = [(AXVoiceOverFeedbackController *)self specifier];
        unsigned __int8 v17 = [v16 propertyForKey:@"supportsPitchWithoutSpeak"];
        unsigned int v18 = [v17 BOOLValue];

        if (v18) {
          unint64_t v9 = 8;
        }
        else {
          unint64_t v9 = 10;
        }
      }
      v9 |= v15;
    }
    else if (v11 != v9)
    {
      if ((v9 & 2) != 0)
      {
        BOOL v12 = [(AXVoiceOverFeedbackController *)self specifier];
        id v13 = [v12 propertyForKey:@"supportsPitchWithoutSpeak"];
        unsigned int v14 = [v13 BOOLValue];

        if (!v14) {
          v11 &= ~8uLL;
        }
      }
      if ((v11 & ~v9) <= 1) {
        unint64_t v9 = 1;
      }
      else {
        unint64_t v9 = v11 & ~v9;
      }
    }
  }
  v19 = [(AXVoiceOverFeedbackController *)self setValueSelectedBlock];
  v19[2](v19, v9);

  [(AXVoiceOverFeedbackController *)self beginUpdates];
  [(AXVoiceOverFeedbackController *)self reloadSpecifiers];
  [(AXVoiceOverFeedbackController *)self endUpdates];
}

+ (void)descriptionForOption:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "we should not have other options with nothing", v1, 2u);
}

@end