@interface AXVoiceOverSelectedBrailleTableController
- (VoiceOverBrailleLanguageController)parentBrailleController;
- (id)_defaultTable;
- (id)specifiers;
- (void)setParentBrailleController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXVoiceOverSelectedBrailleTableController

- (id)specifiers
{
  v2 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v2)
  {
    id v3 = v2;
    goto LABEL_22;
  }
  uint64_t v32 = OBJC_IVAR___PSListController__specifiers;
  v34 = +[NSMutableArray array];
  v5 = +[AXSettings sharedInstance];
  [v5 voiceOverBrailleLanguageRotorItems];
  v6 = v33 = self;

  v7 = +[AXLanguageManager sharedInstance];
  v8 = [v7 userLocale];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v6;
  v10 = self;
  id obj = v9;
  id v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v11) {
    goto LABEL_21;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v37;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v16 = [v15 objectForKeyedSubscript:@"Default"];
      unsigned int v17 = [v16 BOOLValue];

      if (v17)
      {
        v18 = [v15 objectForKeyedSubscript:@"LanguageDefaults"];
        v19 = [v8 localeIdentifier];
        v20 = [v18 objectForKeyedSubscript:v19];

        if (v20)
        {
          id v21 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v20];
        }
        else
        {
          v23 = [(AXVoiceOverSelectedBrailleTableController *)v10 parentBrailleController];
          v24 = [v23 tableEnumerator];
          id v21 = [(id)objc_opt_class() defaultTableForLocale:v8];

          v10 = v33;
        }
      }
      else
      {
        id v22 = objc_alloc((Class)BRLTTable);
        v18 = [v15 objectForKeyedSubscript:@"RotorItem"];
        id v21 = [v22 initWithIdentifier:v18];
      }

      if (VOSCustomBrailleEnabled())
      {
        v25 = [v21 replacements];
        id v26 = [v25 count];

        if (v26) {
          goto LABEL_19;
        }
      }
      else if ([v21 isCustomBrailleTable])
      {
        goto LABEL_19;
      }
      v27 = [v21 localizedNameWithService];
      v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:v10 set:0 get:0 detail:0 cell:3 edit:0];

      [v28 setProperty:v21 forKey:@"Table"];
      [v34 addObject:v28];

LABEL_19:
    }
    id v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v12);
LABEL_21:

  v29 = *(void **)&v10->AXUISettingsBaseListController_opaque[v32];
  *(void *)&v10->AXUISettingsBaseListController_opaque[v32] = v34;
  id v30 = v34;

  id v3 = *(id *)&v10->AXUISettingsBaseListController_opaque[v32];
LABEL_22:

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a4;
  v7 = [(AXVoiceOverSelectedBrailleTableController *)self specifierForIndexPath:a5];
  v8 = [v7 propertyForKey:@"Table"];
  id v9 = +[AXSettings sharedInstance];
  v10 = [v9 voiceOverBrailleTableIdentifier];

  id v11 = [v8 identifier];
  if ([v11 isEqualToString:v10])
  {

LABEL_3:
    uint64_t v12 = 3;
    goto LABEL_8;
  }
  if (v10)
  {
  }
  else
  {
    uint64_t v13 = [v8 identifier];
    v14 = [(AXVoiceOverSelectedBrailleTableController *)self _defaultTable];
    v15 = [v14 identifier];
    unsigned __int8 v16 = [v13 isEqualToString:v15];

    if (v16) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_8:
  [v17 setAccessoryType:v12];
}

- (id)_defaultTable
{
  id v3 = +[AXLanguageManager sharedInstance];
  v4 = [v3 userLocale];

  v5 = [(AXVoiceOverSelectedBrailleTableController *)self parentBrailleController];
  v6 = [v5 tableEnumerator];
  v7 = [(id)objc_opt_class() defaultTableForLocale:v4];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = [(AXVoiceOverSelectedBrailleTableController *)self specifierForIndexPath:a4];
  v5 = [v8 propertyForKey:@"Table"];
  v6 = [v5 identifier];
  v7 = +[AXSettings sharedInstance];
  [v7 setVoiceOverBrailleTableIdentifier:v6];

  [(AXVoiceOverSelectedBrailleTableController *)self reload];
}

- (VoiceOverBrailleLanguageController)parentBrailleController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentBrailleController);

  return (VoiceOverBrailleLanguageController *)WeakRetained;
}

- (void)setParentBrailleController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end