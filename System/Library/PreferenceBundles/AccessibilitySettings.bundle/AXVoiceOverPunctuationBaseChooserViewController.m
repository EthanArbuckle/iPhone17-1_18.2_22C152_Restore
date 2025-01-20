@interface AXVoiceOverPunctuationBaseChooserViewController
- (id)punctuationGroup;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXVoiceOverPunctuationBaseChooserViewController

- (id)punctuationGroup
{
  v2 = [(AXVoiceOverPunctuationBaseChooserViewController *)self specifier];
  v3 = [v2 propertyForKey:@"PunctuationGroup"];

  return v3;
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v29 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    v5 = settingsLocString(@"PUNCTUATION_ALL", @"VoiceOverSettings");
    v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v6 setProperty:AXSSVoiceOverPunctuationGroupAll forKey:@"punctuationGroupUUID"];
    [v4 addObject:v6];
    v7 = settingsLocString(@"PUNCTUATION_SOME", @"VoiceOverSettings");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v8 setProperty:AXSSVoiceOverPunctuationGroupSome forKey:@"punctuationGroupUUID"];
    [v4 addObject:v8];
    v9 = settingsLocString(@"PUNCTUATION_NONE", @"VoiceOverSettings");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v10 setProperty:AXSSVoiceOverPunctuationGroupNone forKey:@"punctuationGroupUUID"];
    v30 = v4;
    [v4 addObject:v10];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v11 = +[AXSSPunctuationManager sharedDatabase];
    v12 = [v11 punctuationGroups];

    id obj = v12;
    id v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v18 = [v17 uuid];
          v19 = [(AXVoiceOverPunctuationBaseChooserViewController *)self punctuationGroup];
          v20 = [v19 uuid];
          unsigned __int8 v21 = [v18 isEqual:v20];

          if ((v21 & 1) == 0)
          {
            v22 = [v17 name];
            v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            v24 = [(AXVoiceOverPunctuationBaseChooserViewController *)self punctuationGroup];
            v25 = [v24 uuid];
            [v23 setProperty:v25 forKey:@"punctuationGroupUUID"];

            [v30 addObject:v23];
            v10 = v23;
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    id v26 = [v30 copy];
    v27 = *(void **)&self->AXUISettingsBaseListController_opaque[v29];
    *(void *)&self->AXUISettingsBaseListController_opaque[v29] = v26;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v29];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(AXVoiceOverPunctuationBaseChooserViewController *)self specifierForIndexPath:v6];
  v9 = [v8 propertyForKey:@"punctuationGroupUUID"];
  v10 = [(AXVoiceOverPunctuationBaseChooserViewController *)self punctuationGroup];
  [v10 setBasePunctuationUUID:v9];

  v11 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [(AXVoiceOverPunctuationBaseChooserViewController *)self punctuationGroup];
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Set base punctuation group: %@ for %@", buf, 0x16u);
  }
  id v13 = +[AXSSPunctuationManager sharedDatabase];
  id v14 = [(AXVoiceOverPunctuationBaseChooserViewController *)self punctuationGroup];
  [v13 updatePunctuationGroup:v14];

  uint64_t v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"AXVoiceOverPunctuationGroupChangedNotification" object:0];

  v16.receiver = self;
  v16.super_class = (Class)AXVoiceOverPunctuationBaseChooserViewController;
  [(AXVoiceOverPunctuationBaseChooserViewController *)&v16 tableView:v7 didSelectRowAtIndexPath:v6];

  [(AXVoiceOverPunctuationBaseChooserViewController *)self updateTableCheckedSelection:v6];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v12 = [(AXVoiceOverPunctuationBaseChooserViewController *)self specifierForIndexPath:a5];
  v8 = [v12 propertyForKey:@"punctuationGroupUUID"];
  v9 = [(AXVoiceOverPunctuationBaseChooserViewController *)self punctuationGroup];
  v10 = [v9 basePunctuationUUID];
  id v11 = [v10 isEqual:v8];

  [v7 setChecked:v11];
}

@end