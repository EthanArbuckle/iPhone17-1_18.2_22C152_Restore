@interface VoiceOverModifierKeyController
+ (id)modifierShortStringDescription:(int64_t)a3;
- (id)specifiers;
- (int64_t)_selectedChoice;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverModifierKeyController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = settingsLocString(@"VO_MODIFIER_KEY_FOOTER", @"VoiceOverSettings");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v8 = settingsLocString(@"VO_MODIFIER_KEY_CONTROL_OPTIONS", @"VoiceOverSettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v9 setProperty:&off_22A608 forKey:@"AXSVoiceOverKeyboardModifierChoice"];
    uint64_t v10 = PSIDKey;
    [v9 setProperty:@"VO_MODIFIER_KEY_CONTROL_OPTIONS" forKey:PSIDKey];
    [v5 addObject:v9];
    v11 = settingsLocString(@"VO_MODIFIER_KEY_CAPS_LOCK", @"VoiceOverSettings");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setProperty:&off_22A620 forKey:@"AXSVoiceOverKeyboardModifierChoice"];
    [v12 setProperty:@"VO_MODIFIER_KEY_CAPS_LOCK" forKey:v10];
    [v5 addObject:v12];
    id v13 = [v5 copy];
    v14 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v13;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

+ (id)modifierShortStringDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = settingsLocString(off_20BC68[a3 - 1], @"VoiceOverSettings");
  }
  return v4;
}

- (int64_t)_selectedChoice
{
  v2 = [(VoiceOverModifierKeyController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"AXVOModifierKeyGetterBlock"];

  if (v3 && (v3[2](v3), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    id v6 = [v4 integerValue];
  }
  else
  {
    v5 = +[AXSettings sharedInstance];
    id v6 = [v5 voiceOverKeyboardModifierChoice];
  }
  int64_t v7 = (int64_t)v6;

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(VoiceOverModifierKeyController *)self _selectedChoice];
  v12 = __UIAccessibilitySafeClass();
  id v13 = [v12 specifier];

  v14 = [v13 propertyForKey:@"AXSVoiceOverKeyboardModifierChoice"];
  unint64_t v15 = (unint64_t)[v14 integerValue];

  if (((v15 & v11 & 0x8000000000000000) != 0) ^ v16 | ((v15 & v11) == 0)) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = 1;
  }
  [v9 setChecked:v17];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VoiceOverModifierKeyController;
  [(VoiceOverModifierKeyController *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(VoiceOverModifierKeyController *)self specifierForIndexPath:v7];
  id v9 = [v8 propertyForKey:@"AXSVoiceOverKeyboardModifierChoice"];
  unint64_t v10 = (unint64_t)[v9 integerValue];

  unint64_t v11 = [(VoiceOverModifierKeyController *)self _selectedChoice] ^ v10;
  if (v11)
  {
    v12 = [v6 cellForRowAtIndexPath:v7];
    id v13 = v12;
    if (((v11 & v10 & 0x8000000000000000) != 0) ^ v14 | ((v11 & v10) == 0)) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 1;
    }
    [v12 setChecked:v15];

    char v16 = [(VoiceOverModifierKeyController *)self specifier];
    uint64_t v17 = [v16 propertyForKey:@"AXVOModifierKeySelectionBlock"];

    if (v17)
    {
      v18 = +[NSNumber numberWithInteger:v11];
      ((void (**)(void, void *))v17)[2](v17, v18);
    }
    else
    {
      v18 = +[AXSettings sharedInstance];
      [v18 setVoiceOverKeyboardModifierChoice:v11];
    }
  }
}

@end