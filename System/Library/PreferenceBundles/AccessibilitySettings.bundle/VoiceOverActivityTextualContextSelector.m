@interface VoiceOverActivityTextualContextSelector
- (id)activity;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverActivityTextualContextSelector

- (id)activity
{
  v2 = [(VoiceOverActivityTextualContextSelector *)self specifier];
  v3 = [v2 propertyForKey:@"activity"];

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
    uint64_t v20 = v3;
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v7 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = AXSSVoiceOverAvailableTextualContextIdentifiers();
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      uint64_t v12 = AXSSVoiceOverTextualContextFileSystem;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v14 isEqualToString:v12] & 1) == 0)
          {
            v15 = AXSSVoiceOverLocalizedNameForTextualContextIdentifier();
            v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

            [v16 setProperty:v14 forKey:@"context"];
            [v7 addObject:v16];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    id v17 = [v7 copy];
    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v20];
    *(void *)&self->AXUISettingsBaseListController_opaque[v20] = v17;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v20];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  v8 = [(VoiceOverActivityTextualContextSelector *)self specifierAtIndexPath:a5];
  id v11 = [v8 propertyForKey:@"context"];

  id v9 = [(VoiceOverActivityTextualContextSelector *)self activity];
  id v10 = [v9 textualContexts];
  objc_msgSend(v7, "setChecked:", objc_msgSend(v10, "containsObject:", v11));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VoiceOverActivityTextualContextSelector;
  id v7 = a3;
  [(VoiceOverActivityTextualContextSelector *)&v20 tableView:v7 didSelectRowAtIndexPath:v6];
  v8 = -[VoiceOverActivityTextualContextSelector specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v20.receiver, v20.super_class);
  id v9 = [v8 propertyForKey:@"context"];

  id v10 = [(VoiceOverActivityTextualContextSelector *)self activity];
  id v11 = [v10 textualContexts];
  if (v11)
  {
    uint64_t v12 = [(VoiceOverActivityTextualContextSelector *)self activity];
    v13 = [v12 textualContexts];
    id v14 = [v13 mutableCopy];
  }
  else
  {
    id v14 = +[NSMutableSet set];
  }

  if ([v14 containsObject:v9]) {
    [v14 removeObject:v9];
  }
  else {
    [v14 addObject:v9];
  }
  v15 = [(VoiceOverActivityTextualContextSelector *)self activity];
  [v15 setTextualContexts:v14];

  v16 = VOTLogActivities();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(VoiceOverActivityTextualContextSelector *)self activity];
    v18 = [v17 textualContexts];
    *(_DWORD *)buf = 138412290;
    long long v22 = v18;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Context selected: %@", buf, 0xCu);
  }
  v19 = [v7 cellForRowAtIndexPath:v6];

  objc_msgSend(v19, "setChecked:", objc_msgSend(v14, "containsObject:", v9));
}

@end