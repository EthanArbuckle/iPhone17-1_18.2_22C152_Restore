@interface VoiceOverAllCommandsListController
- (id)specifiers;
@end

@implementation VoiceOverAllCommandsListController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v29 = OBJC_IVAR___PSListController__specifiers;
    v4 = objc_opt_new();
    v5 = self;
    uint64_t v6 = OBJC_IVAR___PSViewController__specifier;
    v33 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
    v28 = +[PSSpecifier emptyGroupSpecifier];
    objc_msgSend(v4, "addObject:");
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = +[VOSCommandCategory allCategories];
    id v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    v32 = v4;
    if (v7)
    {
      id v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v35;
      do
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v11);
          v14 = [*(id *)&v5->AXUISettingsBaseListController_opaque[v6] voCommandContext];
          v15 = [v14 resolver];
          v9 = +[PSSpecifier voSubmenuForCommandCategory:v13 commandManager:v33 resolver:v15];

          v4 = v32;
          [v32 addObject:v9];
          v11 = (char *)v11 + 1;
          v12 = v9;
        }
        while (v8 != v11);
        id v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v16 = v5;
    v17 = [*(id *)&v5->AXUISettingsBaseListController_opaque[v6] voCommandResolver];
    v18 = [v33 allSiriShortcutCommandsWithResolver:v17];
    if ([v18 count])
    {
      id obja = +[PSSpecifier emptyGroupSpecifier];

      [v4 addObject:obja];
      v19 = settingsLocString(@"vo.siri.shortcuts", @"VoiceOverSettings");
      uint64_t v20 = objc_opt_class();
      v21 = [*(id *)&v16->AXUISettingsBaseListController_opaque[v6] voCommandContext];
      [v21 resolver];
      v23 = v22 = v17;
      uint64_t v24 = +[PSSpecifier voGenericSubmenuWithTitle:v19 childViewControllerClass:v20 commandManager:v33 resolver:v23];

      v17 = v22;
      v4 = v32;

      [v32 addObject:v24];
      v9 = (void *)v24;
      v25 = obja;
    }
    else
    {
      v25 = v28;
    }
    v26 = *(void **)&v16->AXUISettingsBaseListController_opaque[v29];
    *(void *)&v16->AXUISettingsBaseListController_opaque[v29] = v4;

    v3 = *(void **)&v16->AXUISettingsBaseListController_opaque[v29];
  }

  return v3;
}

@end