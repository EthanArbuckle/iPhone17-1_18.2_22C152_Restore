@interface AXVoiceOverPunctuationSelectionController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSelectedPunctuationGroup;
- (void)viewDidLoad;
@end

@implementation AXVoiceOverPunctuationSelectionController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    uint64_t v32 = v3;
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    v7 = +[NSMutableArray array];
    v8 = settingsLocString(@"PUNCTUATION_GROUPS", @"VoiceOverSettings");
    v9 = +[PSSpecifier groupSpecifierWithName:v8];

    [v7 addObject:v9];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(AXVoiceOverPunctuationBaseController *)self systemPunctuationGroups];
    id v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        v13 = 0;
        v14 = v9;
        do
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v13);
          v16 = [v15 name];
          v9 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

          v17 = [v15 uuid];
          [v9 setProperty:v17 forKey:@"punctuationGroupUUID"];

          [v7 addObject:v9];
          v13 = (char *)v13 + 1;
          v14 = v9;
        }
        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v11);
    }

    v18 = [(AXVoiceOverPunctuationBaseController *)self customPunctuationGroups];
    if ([v18 count])
    {
      v19 = settingsLocString(@"CUSTOM_PUNCTUATION_GROUPS", @"VoiceOverSettings");
      uint64_t v20 = +[PSSpecifier groupSpecifierWithName:v19];

      [v7 addObject:v20];
      v9 = (void *)v20;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obja = v18;
    id v21 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        v24 = 0;
        v25 = v9;
        do
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(obja);
          }
          v26 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v24);
          v27 = [v26 name];
          v9 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:3 edit:0];

          v28 = [v26 uuid];
          [v9 setProperty:v28 forKey:@"punctuationGroupUUID"];

          [v7 addObject:v9];
          v24 = (char *)v24 + 1;
          v25 = v9;
        }
        while (v22 != v24);
        id v22 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v22);
    }

    id v29 = [v7 copy];
    v30 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v32];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v32] = v29;

    v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v32];
  }

  return v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)AXVoiceOverPunctuationSelectionController;
  [(AXVoiceOverPunctuationSelectionController *)&v7 viewDidLoad];
  objc_initWeak(&location, self);
  uint64_t v3 = +[AXSettings sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __56__AXVoiceOverPunctuationSelectionController_viewDidLoad__block_invoke;
  v4[3] = &unk_208798;
  objc_copyWeak(&v5, &location);
  [v3 registerUpdateBlock:v4 forRetrieveSelector:"voiceOverPunctuationGroup" withListener:self];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__AXVoiceOverPunctuationSelectionController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSelectedPunctuationGroup];
}

- (void)updateSelectedPunctuationGroup
{
  v2 = self;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(AXVoiceOverPunctuationSelectionController *)self specifiers];
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    v14 = v2;
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        objc_super v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "propertyForKey:", @"punctuationGroupUUID", v14);
        v9 = +[AXSettings sharedInstance];
        id v10 = [v9 voiceOverPunctuationGroup];
        unsigned int v11 = [v8 isEqual:v10];

        if (v11)
        {
          id v12 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    id v12 = 0;
LABEL_11:
    v2 = v14;
  }
  else
  {
    id v12 = 0;
  }

  v13 = [(AXVoiceOverPunctuationSelectionController *)v2 indexPathForSpecifier:v12];
  [(AXVoiceOverPunctuationSelectionController *)v2 updateVisibleCellsWithCheckedSelection:v13];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AXVoiceOverPunctuationSelectionController;
  [(AXVoiceOverPunctuationSelectionController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  objc_super v7 = [(AXVoiceOverPunctuationSelectionController *)self specifierForIndexPath:v6];
  v8 = [v7 propertyForKey:@"punctuationGroupUUID"];
  if (v8)
  {
    v9 = +[AXSettings sharedInstance];
    [v9 setVoiceOverPunctuationGroup:v8];

    [(AXVoiceOverPunctuationSelectionController *)self updateVisibleCellsWithCheckedSelection:v6];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v11 = [(AXVoiceOverPunctuationSelectionController *)self specifierForIndexPath:a5];
  v8 = [v11 propertyForKey:@"punctuationGroupUUID"];
  v9 = +[AXSettings sharedInstance];
  objc_super v10 = [v9 voiceOverPunctuationGroup];

  if (!v10)
  {
    objc_super v10 = AXSettingsDefaultPunctuationGroupUUID();
  }
  objc_msgSend(v7, "setChecked:", objc_msgSend(v10, "isEqual:", v8));
}

@end