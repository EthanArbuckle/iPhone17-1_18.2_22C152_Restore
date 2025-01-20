@interface VoiceOverCommandsForCategoryListController
- (id)specifiers;
@end

@implementation VoiceOverCommandsForCategoryListController

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v29 = OBJC_IVAR___PSListController__specifiers;
    v33 = objc_opt_new();
    uint64_t v4 = OBJC_IVAR___PSViewController__specifier;
    v5 = [*(id *)&v2->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] voCommandManager];
    v6 = [*(id *)&v2->AXUISettingsBaseListController_opaque[v4] voCommandResolver];
    uint64_t v32 = v4;
    v7 = [*(id *)&v2->AXUISettingsBaseListController_opaque[v4] voCommandContext];
    v8 = [v7 commandCategory];
    v9 = [v8 commands];
    v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_11];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v11)
    {
      id v12 = v11;
      v13 = 0;
      uint64_t v14 = *(void *)v37;
      uint64_t v30 = *(void *)v37;
      v31 = v6;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v5 availabilityForCommand:v16 withResolver:v6] != (char *)&dword_0 + 1)
          {
            [v16 localizedName];
            v17 = v35 = v13;
            id v18 = v12;
            v19 = v5;
            uint64_t v20 = objc_opt_class();
            v21 = [*(id *)&v2->AXUISettingsBaseListController_opaque[v32] voCommandContext];
            [v21 resolver];
            v23 = v22 = v2;
            uint64_t v24 = v20;
            v5 = v19;
            id v12 = v18;
            uint64_t v25 = +[PSSpecifier voCommandSubmenuWithTitle:v17 childViewControllerClass:v24 command:v16 commandManager:v5 resolver:v23];

            v2 = v22;
            uint64_t v14 = v30;

            v6 = v31;
            [v33 addObject:v25];
            v13 = (void *)v25;
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v26 = *(void **)&v2->AXUISettingsBaseListController_opaque[v29];
    *(void *)&v2->AXUISettingsBaseListController_opaque[v29] = v33;
    id v27 = v33;

    v3 = *(void **)&v2->AXUISettingsBaseListController_opaque[v29];
  }

  return v3;
}

int64_t __56__VoiceOverCommandsForCategoryListController_specifiers__block_invoke(id a1, VOSCommand *a2, VOSCommand *a3)
{
  uint64_t v4 = a3;
  v5 = [(VOSCommand *)a2 localizedName];
  v6 = [(VOSCommand *)v4 localizedName];

  id v7 = [v5 localizedCompare:v6];
  return (int64_t)v7;
}

@end