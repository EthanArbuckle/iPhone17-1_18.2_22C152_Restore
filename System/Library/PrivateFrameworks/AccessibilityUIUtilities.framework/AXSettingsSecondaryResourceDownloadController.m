@interface AXSettingsSecondaryResourceDownloadController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)_dialect;
- (id)_footerLabel;
- (id)_internalSpecifiers;
- (id)getDialectPreferencesCallback;
- (id)setDialectPreferencesCallback;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_donePressed;
- (void)_editPressed:(id)a3;
- (void)manageEditButton;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXSettingsSecondaryResourceDownloadController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)AXSettingsSecondaryResourceDownloadController;
  [(AXUISettingsSetupCapableListController *)&v19 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [(AXSettingsResourceDownloadController *)self speechModelController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke;
  v16[3] = &unk_1E649BD30;
  objc_copyWeak(&v17, &location);
  [v3 setDownloadProgressForVoiceIdCallback:v16];

  v4 = [(AXSettingsResourceDownloadController *)self speechModelController];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2;
  v14[3] = &unk_1E649BD58;
  objc_copyWeak(&v15, &location);
  [v4 setFinishedDownloadingResourceCallback:v14];

  v5 = [(AXSettingsResourceDownloadController *)self speechModelController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_277;
  v12[3] = &unk_1E649BD80;
  objc_copyWeak(&v13, &location);
  [v5 setFinishedDeletingResourceCallback:v12];

  v6 = [(AXSettingsResourceDownloadController *)self speechModelController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2_279;
  v10[3] = &unk_1E649BDA8;
  objc_copyWeak(&v11, &location);
  [v6 setResourceCacheDidReceiveUpdateCallback:v10];

  v7 = [(AXSettingsResourceDownloadController *)self speechModelController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_3;
  v8[3] = &unk_1E649BDA8;
  objc_copyWeak(&v9, &location);
  [v7 setSelectedVoiceDidUpdateCallback:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke(uint64_t a1, void *a2, float a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = [WeakRetained specifierForVoiceId:v8];

  *(float *)&double v12 = a3;
  id v13 = [NSNumber numberWithFloat:v12];
  [v11 setProperty:v13 forKey:@"DownloadProgress"];

  v14 = [NSNumber numberWithBool:a5];
  [v11 setProperty:v14 forKey:@"RequiredDiskSpace"];

  objc_opt_class();
  id v15 = objc_loadWeakRetained(v9);
  v16 = [v15 cellForSpecifier:v11];
  id v17 = __UIAccessibilityCastAsClass();

  [v17 updateInformation];
  id v18 = objc_loadWeakRetained(v9);
  objc_super v19 = [v18 speechModelController];
  v20 = [v19 resourceWithVoiceId:v8];
  *(float *)&double v21 = a3;
  [v18 downloadProgressUpdate:v20 progress:v21];
}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained reloadSpecifiers];

  id v7 = objc_loadWeakRetained(v4);
  id v8 = [v5 voiceId];
  id v13 = [v7 specifierForVoiceId:v8];

  if (a3) {
    id v9 = &unk_1F1F1FFE8;
  }
  else {
    id v9 = &unk_1F1F20000;
  }
  [v13 setProperty:v9 forKey:@"DownloadProgress"];
  id v10 = objc_loadWeakRetained(v4);
  [v10 reloadSpecifier:v13];

  id v11 = objc_loadWeakRetained(v4);
  [v11 manageEditButton];

  id v12 = objc_loadWeakRetained(v4);
  [v12 finishedDownloadingResource:v5];
}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_277(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained reloadSpecifiers];

  id v5 = objc_loadWeakRetained(v2);
  v6 = [v3 voiceId];
  id v10 = [v5 specifierForVoiceId:v6];

  [v10 setProperty:&unk_1F1F1FFE8 forKey:@"DownloadProgress"];
  id v7 = objc_loadWeakRetained(v2);
  [v7 reloadSpecifier:v10];

  id v8 = objc_loadWeakRetained(v2);
  [v8 manageEditButton];

  id v9 = objc_loadWeakRetained(v2);
  [v9 finishedDeletingResource:v3];
}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2_279(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSettings];
}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSettingsSecondaryResourceDownloadController;
  [(AXSettingsSecondaryResourceDownloadController *)&v4 viewWillAppear:a3];
  [(AXSettingsSecondaryResourceDownloadController *)self manageEditButton];
}

- (void)_editPressed:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(AXUISettingsBaseListController *)self setEditing:1 animated:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]), "visibleCells", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 setShowsUsageInfo:1];
        [v9 updateInformation];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(AXSettingsSecondaryResourceDownloadController *)self manageEditButton];
}

- (void)_donePressed
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(AXUISettingsBaseListController *)self setEditing:0 animated:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]), "visibleCells", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setShowsUsageInfo:0];
        [v8 updateInformation];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(AXSettingsSecondaryResourceDownloadController *)self manageEditButton];
}

- (void)manageEditButton
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [(AXSettingsSecondaryResourceDownloadController *)self specifiers];
  uint64_t v2 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    char v24 = 0;
    uint64_t v4 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v30 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v7 = [v6 propertyForKey:@"Resources"];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              long long v13 = [v12 speechVoice];
              if ([v13 canBeDownloaded])
              {
                char v14 = [v12 isInstalled];

                if (v14)
                {
                  char v24 = 1;
                  goto LABEL_17;
                }
              }
              else
              {
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }
LABEL_17:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v3);
  }
  else
  {
    char v24 = 0;
  }

  uint64_t v15 = (int)*MEMORY[0x1E4F92F10];
  if ([*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v15) isEditing])
  {
    if (![*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v15) isEditing])return; {
    if (v24)
    }
    {
      id v16 = objc_allocWithZone(MEMORY[0x1E4FB14A8]);
      id v17 = sel__donePressed;
      uint64_t v18 = 0;
LABEL_27:
      objc_super v19 = (void *)[v16 initWithBarButtonSystemItem:v18 target:self action:v17];
      v20 = [(AXSettingsSecondaryResourceDownloadController *)self navigationItem];
      [v20 setRightBarButtonItem:v19];

      return;
    }
    [(AXSettingsSecondaryResourceDownloadController *)self _donePressed];
  }
  else
  {
    if (v24)
    {
      id v16 = objc_allocWithZone(MEMORY[0x1E4FB14A8]);
      id v17 = sel__editPressed_;
      uint64_t v18 = 2;
      goto LABEL_27;
    }
    double v21 = [(AXSettingsSecondaryResourceDownloadController *)self navigationItem];
    [v21 setRightBarButtonItem:0];
  }
}

- (id)_dialect
{
  uint64_t v2 = [(AXSettingsSecondaryResourceDownloadController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"kAXPSDialectMapKey"];

  return v3;
}

- (id)_footerLabel
{
  uint64_t v2 = [(AXSettingsSecondaryResourceDownloadController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"Resources"];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = [v4 speechVoice];
  int v6 = [v5 canBeDownloaded];

  if (v6)
  {
    if ([v4 isInstalled]) {
      AXLocalizedTileForResourceOnDiskSizeUsed(v4);
    }
    else {
    uint64_t v7 = AXLocalizedTileForResourceDownloadSizeRequired(v4);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = [(AXSettingsSecondaryResourceDownloadController *)self _internalSpecifiers];
    int v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3) = v5;

    uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_internalSpecifiers
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXSettingsSecondaryResourceDownloadController *)self specifier];
  uint64_t v4 = [(AXSettingsSecondaryResourceDownloadController *)self getDialectPreferencesCallback];
  v37 = v4[2]();

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v34 = v3;
  int v6 = [v3 propertyForKey:@"Resources"];
  uint64_t v8 = AXSortedVoiceVariantsForDisplay(v6, v7);

  uint64_t v9 = self;
  uint64_t v10 = [(AXSettingsSecondaryResourceDownloadController *)self _dialect];
  uint64_t v11 = [v10 languageNameAndLocaleInCurrentLocale];

  v33 = (void *)v11;
  [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  long long v32 = v38 = v5;
  objc_msgSend(v5, "addObject:");
  long long v12 = AXSortTTSAXResourcesForSiriVoicesIfNeeded(v8);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v36 = *(void *)v40;
    uint64_t v15 = *MEMORY[0x1E4F930A8];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v18 = AXLocalizedVoiceVariantNameForResource(v17);
        objc_super v19 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v18 target:v9 set:0 get:0 detail:0 cell:3 edit:0];
        v43 = v17;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        [v19 setProperty:v20 forKey:@"Resources"];

        [v19 setProperty:objc_opt_class() forKey:v15];
        [v38 addObject:v19];
        double v21 = [v17 speechVoice];
        int v22 = [v21 canBeDownloaded];

        if (v22)
        {
          if ([v17 isInstalled])
          {
            [v19 setProperty:&unk_1F1F20000 forKey:@"DownloadProgress"];
          }
          else
          {
            v23 = [(AXSettingsResourceDownloadController *)v9 downloadProgessByVoiceID];
            char v24 = [v17 voiceId];
            long long v25 = [v23 objectForKeyedSubscript:v24];

            if (v25)
            {
              long long v26 = [(AXSettingsResourceDownloadController *)v9 downloadProgessByVoiceID];
              long long v27 = [v17 voiceId];
              long long v28 = [v26 objectForKeyedSubscript:v27];
              [v19 setProperty:v28 forKey:@"DownloadProgress"];
            }
          }
        }
        long long v29 = [v17 voiceId];
        int v30 = [v37 isEqualToString:v29];

        if (v30) {
          [v19 setProperty:MEMORY[0x1E4F1CC38] forKey:@"IsSelected"];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v14);
  }

  return v38;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v12 = [(AXUISettingsBaseListController *)self specifierForIndexPath:a5];
  uint64_t v7 = [v12 propertyForKey:@"DownloadProgress"];
  [v7 floatValue];
  float v9 = v8;

  if (a4 == 1 && v9 == 1.0)
  {
    uint64_t v10 = [v12 propertyForKey:@"Resources"];
    uint64_t v11 = [v10 firstObject];

    [(AXSettingsResourceDownloadController *)self deleteResource:v11];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = [(AXUISettingsBaseListController *)self specifierForIndexPath:a4];
  int v6 = [v5 propertyForKey:@"Resources"];
  uint64_t v7 = [v6 firstObject];

  float v8 = [(AXSettingsResourceDownloadController *)self speechModelController];
  LOBYTE(v6) = [v8 isResourceUserDeletable:v7];

  return (char)v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(AXUISettingsBaseListController *)self specifierForIndexPath:a4];
  id v5 = [v4 propertyForKey:@"Resources"];
  int v6 = [v5 firstObject];

  uint64_t v7 = [v4 propertyForKey:@"DownloadProgress"];
  [v7 floatValue];
  float v9 = v8;

  if (v9 == 1.0) {
    int64_t v10 = AXResourceActivelyUsed() ^ 1;
  }
  else {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setShowsPlayButton:1];
    [v7 setShowsInfoLabel:1];
    if (AXRuntimeCheck_PerVoiceSettings()) {
      BOOL v6 = [(AXSettingsResourceDownloadController *)self showPerVoiceSettings];
    }
    else {
      BOOL v6 = 0;
    }
    [v7 setShowsPerVoiceSettingsButton:v6];
    [v7 setInfoDelegate:self];
    objc_msgSend(v7, "setShowsUsageInfo:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]), "isEditing"));
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)AXSettingsSecondaryResourceDownloadController;
  id v6 = a4;
  [(AXUISettingsSetupCapableListController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[AXSettingsSecondaryResourceDownloadController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  float v8 = [(AXSettingsSecondaryResourceDownloadController *)self specifierAtIndex:v7];
  float v9 = [v8 propertyForKey:@"Resources"];
  int64_t v10 = [v9 firstObject];

  if ([v10 isInstalled])
  {
    uint64_t v11 = [(AXSettingsSecondaryResourceDownloadController *)self setDialectPreferencesCallback];

    if (v11)
    {
      id v12 = [(AXSettingsSecondaryResourceDownloadController *)self setDialectPreferencesCallback];
      uint64_t v13 = [v10 voiceId];
      ((void (**)(void, void *))v12)[2](v12, v13);
    }
    [(AXSettingsResourceDownloadController *)self setSelectedSpecifier:v8];
  }
}

- (id)getDialectPreferencesCallback
{
  uint64_t v2 = [(AXSettingsSecondaryResourceDownloadController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"getDialectPreferencesCallback"];

  return v3;
}

- (id)setDialectPreferencesCallback
{
  uint64_t v2 = [(AXSettingsSecondaryResourceDownloadController *)self specifier];
  uint64_t v3 = [v2 propertyForKey:@"setDialectPreferencesCallback"];

  return v3;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(AXUISettingsBaseListController *)self specifierForIndexPath:a4];
  id v5 = [v4 propertyForKey:@"Resources"];
  id v6 = [v5 firstObject];

  LOBYTE(v5) = AXResourceActivelyUsed() ^ 1;
  return (char)v5;
}

@end