@interface AXPronunciationVoiceListController
- (AXPronunciationVoiceListControllerDelegate)delegate;
- (NSMutableSet)voiceIds;
- (id)specifiers;
- (void)setDelegate:(id)a3;
- (void)setVoiceIds:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXPronunciationVoiceListController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v32 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[PSSpecifier emptyGroupSpecifier];
    [v4 addObject:v5];
    v6 = settingsLocString(@"ALL_LANGUAGES", @"VoiceOverSettings");
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v7 setProperty:@"ALL" forKey:PSIDKey];
    [v4 addObject:v7];
    uint64_t v8 = +[PSSpecifier emptyGroupSpecifier];

    v30 = (void *)v8;
    v31 = v4;
    [v4 addObject:v8];
    v9 = [(AXPronunciationVoiceListController *)self specifier];
    v10 = [v9 propertyForKey:@"Languages"];

    v11 = [(AXPronunciationVoiceListController *)self specifier];
    v12 = [v11 propertyForKey:@"VoiceIds"];
    id v13 = [v12 mutableCopy];
    [(AXPronunciationVoiceListController *)self setVoiceIds:v13];

    v14 = [(AXPronunciationVoiceListController *)self voiceIds];

    if (!v14)
    {
      v15 = +[NSMutableSet set];
      [(AXPronunciationVoiceListController *)self setVoiceIds:v15];
    }
    v33 = self;
    v16 = +[NSMutableArray array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v17 = +[AVSpeechSynthesisVoice _speechVoicesIncludingSiri];
    id v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v23 = [v22 language];
          unsigned int v24 = [v10 containsObject:v23];

          if (v24)
          {
            v25 = [v22 name];
            v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:v33 set:0 get:0 detail:0 cell:3 edit:0];

            [v26 setObject:v22 forKeyedSubscript:@"Voice"];
            [v16 addObject:v26];
            v7 = v26;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v19);
    }

    [v16 sortUsingComparator:&__block_literal_global_49];
    [v31 addObjectsFromArray:v16];
    v27 = *(void **)&v33->AXUISettingsBaseListController_opaque[v32];
    *(void *)&v33->AXUISettingsBaseListController_opaque[v32] = v31;
    id v28 = v31;

    v3 = *(void **)&v33->AXUISettingsBaseListController_opaque[v32];
  }

  return v3;
}

int64_t __48__AXPronunciationVoiceListController_specifiers__block_invoke(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  id v4 = a3;
  v5 = [(PSSpecifier *)a2 name];
  v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 localizedCompare:v6];
  return (int64_t)v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)AXPronunciationVoiceListController;
  [(AXPronunciationVoiceListController *)&v38 tableView:v6 didSelectRowAtIndexPath:v7];
  uint64_t v32 = v6;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  v31 = v7;
  v30 = [(AXPronunciationVoiceListController *)self specifierForIndexPath:v7];
  uint64_t v8 = [v30 objectForKeyedSubscript:@"Voice"];
  v9 = [(AXPronunciationVoiceListController *)self voiceIds];
  v10 = v9;
  v29 = v8;
  if (v8)
  {
    v11 = [v8 identifier];
    unsigned int v12 = [v10 containsObject:v11];

    v10 = [(AXPronunciationVoiceListController *)self voiceIds];
    id v13 = [v8 identifier];
    if (v12) {
      [v10 removeObject:v13];
    }
    else {
      [v10 addObject:v13];
    }
  }
  else
  {
    [v9 removeAllObjects];
  }

  v14 = [(AXPronunciationVoiceListController *)self delegate];
  v15 = [(AXPronunciationVoiceListController *)self voiceIds];
  [v14 pronunciationVoiceListController:self didSelectVoices:v15];

  [(AXPronunciationVoiceListController *)self updateVisibleCellsWithCheckedSelection:0];
  v16 = [(AXPronunciationVoiceListController *)self cellForSpecifierID:@"ALL"];
  v17 = [(AXPronunciationVoiceListController *)self voiceIds];
  id v28 = v16;
  objc_msgSend(v16, "setChecked:", objc_msgSend(v17, "count") == 0);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v18 = OBJC_IVAR___PSListController__table;
  id obj = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] indexPathsForVisibleRows];
  id v19 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = [*(id *)&self->AXUISettingsBaseListController_opaque[v18] cellForRowAtIndexPath:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        unsigned int v24 = [v23 specifier];
        v25 = [v24 propertyForKey:@"Voice"];

        if (v25)
        {
          v26 = [(AXPronunciationVoiceListController *)self voiceIds];
          v27 = [v25 identifier];
          objc_msgSend(v23, "setChecked:", objc_msgSend(v26, "containsObject:", v27));
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v20);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  uint64_t v8 = [(AXPronunciationVoiceListController *)self specifierForIndexPath:v7];
  v9 = [v8 objectForKeyedSubscript:@"Voice"];

  v10 = [(AXPronunciationVoiceListController *)self specifierForIndexPath:v7];

  v11 = [v10 objectForKeyedSubscript:PSIDKey];

  unsigned int v12 = [v11 isEqualToString:@"ALL"];
  if (v12)
  {
    v10 = [(AXPronunciationVoiceListController *)self voiceIds];
    if (![v10 count])
    {
      [v15 setChecked:1];
      goto LABEL_6;
    }
  }
  id v13 = [(AXPronunciationVoiceListController *)self voiceIds];
  v14 = [v9 identifier];
  objc_msgSend(v15, "setChecked:", objc_msgSend(v13, "containsObject:", v14));

  if (v12) {
LABEL_6:
  }
}

- (AXPronunciationVoiceListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXPronunciationVoiceListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)voiceIds
{
  return self->_voiceIds;
}

- (void)setVoiceIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceIds, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end