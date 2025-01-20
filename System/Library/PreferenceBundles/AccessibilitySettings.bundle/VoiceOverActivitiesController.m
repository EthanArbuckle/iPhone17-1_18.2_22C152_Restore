@interface VoiceOverActivitiesController
- (BOOL)canEditTable;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)_nonBuiltInActivityCount;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_activityChanged:(id)a3;
- (void)dealloc;
- (void)removeDataForSpecifier:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation VoiceOverActivitiesController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsEditableViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->AXUISettingsEditableViewController_opaque[v3];
    v7 = self;
    uint64_t v31 = v3;
    *(void *)&self->AXUISettingsEditableViewController_opaque[v3] = v5;

    v8 = +[NSMutableArray array];
    v9 = +[PSSpecifier emptyGroupSpecifier];
    v10 = settingsLocString(@"ACTIVITY_FOOTER_TEXT", @"VoiceOverSettings");
    [v9 setProperty:v10 forKey:PSFooterTextGroupKey];

    v11 = v8;
    v30 = v9;
    [v8 addObject:v9];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v12 = +[AXSettings sharedInstance];
    v13 = [v12 voiceOverActivities];

    id obj = v13;
    id v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    uint64_t v32 = PSIDKey;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v19 = [v18 name];
          v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v7 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          [v20 setProperty:v18 forKey:@"activity"];
          v21 = [v18 name];
          v22 = AXParameterizedLocalizedString();
          unsigned int v23 = [v21 isEqualToString:v22];

          if (v23) {
            [v20 setProperty:@"Programming" forKey:v32];
          }
          [v11 addObject:v20];
        }
        id v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v15);
    }

    v24 = +[PSSpecifier emptyGroupSpecifier];
    [v11 addObject:v24];

    v25 = settingsLocString(@"ACTIVITY_ADD_ACTIVITY", @"VoiceOverSettings");
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:v7 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v26 setProperty:@"New" forKey:v32];
    [v11 addObject:v26];
    id v27 = [v11 copy];
    v28 = *(void **)&v7->AXUISettingsEditableViewController_opaque[v31];
    *(void *)&v7->AXUISettingsEditableViewController_opaque[v31] = v27;

    v4 = *(void **)&v7->AXUISettingsEditableViewController_opaque[v31];
  }

  return v4;
}

- (int64_t)_nonBuiltInActivityCount
{
  v2 = +[AXSettings sharedInstance];
  uint64_t v3 = [v2 voiceOverActivities];
  v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_33);
  id v5 = [v4 count];

  return (int64_t)v5;
}

BOOL __57__VoiceOverActivitiesController__nonBuiltInActivityCount__block_invoke(id a1, AXVoiceOverActivity *a2, unint64_t a3, BOOL *a4)
{
  return [(AXVoiceOverActivity *)a2 builtIn] ^ 1;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)VoiceOverActivitiesController;
  [(VoiceOverActivitiesController *)&v11 viewDidLoad];
  self->_cachedActivityCount = [(VoiceOverActivitiesController *)self _nonBuiltInActivityCount];
  objc_initWeak(&location, self);
  uint64_t v3 = +[AXSettings sharedInstance];
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = __44__VoiceOverActivitiesController_viewDidLoad__block_invoke;
  v8 = &unk_208798;
  objc_copyWeak(&v9, &location);
  [v3 registerUpdateBlock:&v5 forRetrieveSelector:"voiceOverActivities" withListener:self];

  objc_destroyWeak(&v9);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_activityChanged:" name:@"AXVoiceOverActivityChanged" object:0];

  objc_destroyWeak(&location);
}

void __44__VoiceOverActivitiesController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = VOTLogActivities();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = +[AXSettings sharedInstance];
    v4 = [v3 voiceOverActivities];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Activities changed: %@", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activityChanged:0];
}

- (void)_activityChanged:(id)a3
{
  if ([(VoiceOverActivitiesController *)self _nonBuiltInActivityCount] >= 1
    && !self->_cachedActivityCount)
  {
    v4 = +[AXSettings sharedInstance];
    id v5 = [v4 voiceOverRotorItems];
    id v6 = [v5 mutableCopy];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = +[AXSettings sharedInstance];
    v8 = [v7 voiceOverRotorItems];

    id v9 = (char *)[v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      v10 = v9;
      objc_super v11 = 0;
      uint64_t v12 = *(void *)v25;
      unsigned int v23 = v6;
      while (2)
      {
        v13 = 0;
        v21 = &v10[(void)v11];
        v22 = v11;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v13);
          id v15 = [v14 objectForKeyedSubscript:@"RotorItem"];
          unsigned int v16 = [v15 isEqualToString:kAXSVoiceOverTouchRotorActivities];

          if (v16)
          {
            id v17 = [v14 mutableCopy];
            [v17 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Enabled"];
            id v6 = v23;
            [v23 setObject:v17 atIndexedSubscript:&v13[(void)v22]];
            v18 = +[AXSettings sharedInstance];
            [v18 setVoiceOverRotorItems:v23];

            goto LABEL_13;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = (char *)[v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        objc_super v11 = v21;
        id v6 = v23;
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  int64_t cachedActivityCount = self->_cachedActivityCount;
  int64_t v20 = [(VoiceOverActivitiesController *)self _nonBuiltInActivityCount];
  self->_int64_t cachedActivityCount = v20;
  if (v20 > cachedActivityCount) {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

id __50__VoiceOverActivitiesController__activityChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VoiceOverActivitiesController;
  [(VoiceOverActivitiesController *)&v4 dealloc];
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverActivitiesController *)self specifierAtIndexPath:a4];
  id v5 = [v4 propertyForKey:@"activity"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverActivitiesController *)self specifierAtIndexPath:a4];
  id v5 = [v4 propertyForKey:@"activity"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverActivitiesController *)self specifierAtIndexPath:a4];
  id v5 = [v4 propertyForKey:@"activity"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(VoiceOverActivitiesController *)self specifierAtIndexPath:v7];
  v10 = [(VoiceOverActivitiesController *)self specifierAtIndexPath:v8];
  uint64_t v11 = [v9 propertyForKey:@"activity"];
  if (!v11
    || (uint64_t v12 = (void *)v11,
        [v10 propertyForKey:@"activity"],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        id v14 = v8,
        !v13))
  {
    id v14 = v7;
  }
  id v15 = v14;

  return v15;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v26 = a4;
  id v7 = a5;
  id v8 = (id *)&self->AXUISettingsEditableViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v9 = [*v8 mutableCopy];
  v10 = [(VoiceOverActivitiesController *)self specifierAtIndexPath:v26];
  uint64_t v11 = [(VoiceOverActivitiesController *)self specifierAtIndexPath:v7];
  uint64_t v12 = (void *)v11;
  if (v10 && v11 && v10 != (void *)v11)
  {
    v13 = (char *)[v9 indexOfObject:v10];
    id v14 = (char *)[v9 indexOfObject:v12];
    BOOL v15 = v13 == (char *)0x7FFFFFFFFFFFFFFFLL || v14 == (char *)0x7FFFFFFFFFFFFFFFLL;
    if (!v15 && v13 != v14)
    {
      id v17 = +[AXSettings sharedInstance];
      v18 = [v17 voiceOverActivities];
      id v19 = [v18 mutableCopy];

      id v20 = [v26 row];
      if (v20 < [v19 count])
      {
        id v21 = [v7 row];
        if (v21 < [v19 count])
        {
          v22 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v26, "row"));
          objc_msgSend(v19, "removeObjectAtIndex:", objc_msgSend(v26, "row"));
          objc_msgSend(v19, "insertObject:atIndex:", v22, objc_msgSend(v7, "row"));
          unsigned int v23 = +[AXSettings sharedInstance];
          [v23 setVoiceOverActivities:v19];
        }
      }
      [v9 removeObjectAtIndex:v13];
      long long v24 = (char *)[v9 indexOfObject:v12];
      if (v13 > v24) {
        long long v25 = v24;
      }
      else {
        long long v25 = v24 + 1;
      }
      [v9 insertObject:v10 atIndex:v25];
      objc_storeStrong(v8, v9);
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VoiceOverActivitiesController;
  -[VoiceOverActivitiesController setEditing:animated:](&v9, "setEditing:animated:");
  [(VoiceOverActivitiesController *)self beginUpdates];
  id v7 = [(VoiceOverActivitiesController *)self specifierForID:@"New"];
  id v8 = +[NSNumber numberWithInt:!v5];
  [v7 setProperty:v8 forKey:PSEnabledKey];

  [(VoiceOverActivitiesController *)self reloadSpecifier:v7 animated:v4];
  [(VoiceOverActivitiesController *)self endUpdates];
}

- (BOOL)canEditTable
{
  v2 = [(VoiceOverActivitiesController *)self specifiers];
  uint64_t v3 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_315);
  id v4 = [v3 count];

  return (uint64_t)v4 > 0;
}

BOOL __45__VoiceOverActivitiesController_canEditTable__block_invoke(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(PSSpecifier *)a2 propertyForKey:@"activity", a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)removeDataForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"activity"];
  id v4 = +[AXSettings sharedInstance];
  BOOL v5 = [v4 voiceOverActivities];
  id v6 = [v5 mutableCopy];

  [v6 removeObject:v3];
  id v7 = +[AXSettings sharedInstance];
  [v7 setVoiceOverActivities:v6];

  id v8 = VOTLogActivities();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Removed activity: %@", buf, 0xCu);
  }

  if (v3)
  {
    CFStringRef v16 = @"delete";
    objc_super v9 = [v3 uuid];
    v10 = [v9 UUIDString];
    BOOL v15 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v15 count:1];
    id v17 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
  else
  {
    uint64_t v12 = &__NSDictionary0__struct;
  }
  v13 = AXAssetAndDataClient();
  id v14 = +[AXAccessQueue mainAccessQueue];
  [v13 sendAsynchronousMessage:v12 withIdentifier:2 targetAccessQueue:v14 completion:0];
}

@end