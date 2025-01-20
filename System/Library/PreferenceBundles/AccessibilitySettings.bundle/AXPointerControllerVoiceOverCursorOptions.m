@interface AXPointerControllerVoiceOverCursorOptions
+ (id)localizedNameForVoiceOverCursorOption:(int)a3;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXPointerControllerVoiceOverCursorOptions

+ (id)localizedNameForVoiceOverCursorOption:(int)a3
{
  if (a3 <= 2)
  {
    settingsLocString(*(&off_20BD20 + a3), @"Accessibility-hello");
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __55__AXPointerControllerVoiceOverCursorOptions_specifiers__block_invoke;
    v13[3] = &unk_20BCB0;
    v13[4] = self;
    v6 = objc_retainBlock(v13);
    v7 = ((void (*)(void *, void))v6[2])(v6, 0);
    [v5 addObject:v7];

    v8 = ((void (*)(void *, uint64_t))v6[2])(v6, 1);
    [v5 addObject:v8];

    v9 = ((void (*)(void *, uint64_t))v6[2])(v6, 2);
    [v5 addObject:v9];

    v10 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;
    id v11 = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

id __55__AXPointerControllerVoiceOverCursorOptions_specifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [(id)objc_opt_class() localizedNameForVoiceOverCursorOption:a2];
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];

  v6 = +[NSNumber numberWithUnsignedInt:a2];
  [v5 setProperty:v6 forKey:@"CursorOptionKey"];

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  v7 = [(AXPointerControllerVoiceOverCursorOptions *)self specifierForIndexPath:a5];
  v8 = [v7 propertyForKey:@"CursorOptionKey"];
  if (v8)
  {
    id v9 = v10;
    objc_msgSend(v9, "setChecked:", objc_msgSend(v8, "intValue") == _AXSPointerVoiceOverCursorOption());
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AXPointerControllerVoiceOverCursorOptions;
  [(AXPointerControllerVoiceOverCursorOptions *)&v28 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(AXPointerControllerVoiceOverCursorOptions *)self specifierForIndexPath:v7];
  id v9 = [v8 propertyForKey:@"CursorOptionKey"];
  id v10 = v9;
  if (v9)
  {
    v21 = v8;
    id v22 = v7;
    unsigned int v11 = [v9 intValue];
    _AXSPointerSetVoiceOverCursorOption();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v6;
    v12 = [v6 visibleCells];
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v18 = [v17 specifier];
          v19 = [v18 propertyForKey:@"CursorOptionKey"];
          v20 = v19;
          if (v19) {
            objc_msgSend(v17, "setChecked:", objc_msgSend(v19, "intValue") == v11);
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v14);
    }

    id v7 = v22;
    id v6 = v23;
    v8 = v21;
  }
}

@end