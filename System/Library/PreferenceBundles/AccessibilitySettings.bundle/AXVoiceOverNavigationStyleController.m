@interface AXVoiceOverNavigationStyleController
- (id)specifiers;
- (void)_updateFooterText;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXVoiceOverNavigationStyleController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    v7 = +[NSMutableArray array];
    v8 = +[PSSpecifier emptyGroupSpecifier];
    [v7 addObject:v8];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v8;
    v10 = v8;

    [(AXVoiceOverNavigationStyleController *)self _updateFooterText];
    v11 = settingsLocString(@"NAVIGATION_STYLE_FLAT", @"VoiceOverSettings");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setProperty:&off_22A6F8 forKey:@"AXSVoiceOverNavigationStyle"];
    [v7 addObject:v12];
    v13 = settingsLocString(@"NAVIGATION_STYLE_GROUPS", @"VoiceOverSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setProperty:&off_22A710 forKey:@"AXSVoiceOverNavigationStyle"];
    [v7 addObject:v14];
    id v15 = [v7 copy];
    v16 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v15;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  uint64_t v5 = +[AXSettings sharedInstance];
  id v6 = [v5 voiceOverNavigationStyle];

  v7 = [v10 specifier];
  v8 = [v7 propertyForKey:@"AXSVoiceOverNavigationStyle"];
  id v9 = [v8 integerValue];

  [v10 setChecked:v6 == v9];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AXVoiceOverNavigationStyleController;
  id v6 = a4;
  [(AXVoiceOverNavigationStyleController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = -[AXVoiceOverNavigationStyleController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v11.receiver, v11.super_class);

  v8 = [v7 propertyForKey:@"AXSVoiceOverNavigationStyle"];
  id v9 = [v8 integerValue];
  id v10 = +[AXSettings sharedInstance];
  [v10 setVoiceOverNavigationStyle:v9];

  [(AXVoiceOverNavigationStyleController *)self beginUpdates];
  [(AXVoiceOverNavigationStyleController *)self reloadSpecifiers];
  [(AXVoiceOverNavigationStyleController *)self endUpdates];
}

- (void)_updateFooterText
{
  id v24 = +[VOSCommandResolver resolverForCurrentHost];
  id v3 = [objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
  v4 = +[VOSCommand MoveIn];
  uint64_t v5 = [v3 gestureBindingsForCommand:v4 withResolver:v24];

  id v6 = +[VOSCommand MoveOut];
  v7 = [v3 gestureBindingsForCommand:v6 withResolver:v24];

  v8 = +[AXSettings sharedInstance];
  id v9 = (char *)[v8 voiceOverNavigationStyle];

  if ((unint64_t)(v9 + 1) >= 2)
  {
    if (v9 != (unsigned char *)&dword_0 + 1) {
      goto LABEL_10;
    }
    objc_super v11 = settingsLocString(@"NAVIGATION_STYLE_FOOTER_GROUPS", @"VoiceOverSettings");
    if ([v5 count])
    {
      v14 = settingsLocString(@"NAVIGATION_STYLE_FOOTER_GROUPS_WITH_COMMANDS_ENTER", @"VoiceOverSettings");
      id v15 = [v5 anyObject];
      v16 = [v15 localizedName];
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v16);
      uint64_t v18 = +[NSString stringWithFormat:@"%@ %@", v11, v17];

      objc_super v11 = (void *)v18;
    }
    if ([v7 count])
    {
      v19 = settingsLocString(@"NAVIGATION_STYLE_FOOTER_GROUPS_WITH_COMMANDS_EXIT", @"VoiceOverSettings");
      v20 = [v7 anyObject];
      v21 = [v20 localizedName];
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v21);
      uint64_t v23 = +[NSString stringWithFormat:@"%@ %@", v11, v22];

      objc_super v11 = (void *)v23;
    }
    groupSpecifier = self->_groupSpecifier;
    uint64_t v12 = PSFooterTextGroupKey;
  }
  else
  {
    id v10 = self->_groupSpecifier;
    objc_super v11 = settingsLocString(@"NAVIGATION_STYLE_FOOTER_FLAT", @"VoiceOverSettings");
    uint64_t v12 = PSFooterTextGroupKey;
    groupSpecifier = v10;
  }
  [(PSSpecifier *)groupSpecifier setProperty:v11 forKey:v12];

LABEL_10:
}

- (void).cxx_destruct
{
}

@end