@interface CACCommandsController
- (BOOL)_commandItemBelongsToDifferentLocale:(id)a3;
- (BOOL)isCurrentlyAppearing;
- (CACCommandsController)init;
- (CACSpokenCommandGroup)commandGroup;
- (CACSpokenCommandPresentation)commandPresentation;
- (id)_detailStringForSpecifier:(id)a3;
- (id)_sortedCustomCommandsArrayByLanguage;
- (id)specifiers;
- (void)_commandSettingsDidChange;
- (void)_refreshGroupCommands;
- (void)dealloc;
- (void)presentCustomAction:(id)a3;
- (void)setCommandGroup:(id)a3;
- (void)setCommandPresentation:(id)a3;
- (void)setIsCurrentlyAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACCommandsController

- (CACCommandsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CACCommandsController;
  v2 = [(CACCommandsController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_AF30, @"CACNotificationCommandsSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CACNotificationCommandsSettingsChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CACCommandsController;
  [(CACCommandsController *)&v4 dealloc];
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v36 = OBJC_IVAR___PSListController__specifiers;
    v41 = +[NSMutableArray array];
    objc_super v4 = [(CACCommandsController *)self commandGroup];
    if ([v4 isCustom])
    {
      objc_super v5 = [(CACCommandsController *)self _sortedCustomCommandsArrayByLanguage];
    }
    else
    {
      v6 = [(CACCommandsController *)self commandGroup];
      objc_super v5 = [v6 commandsArray];
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v38 = 0;
      uint64_t v39 = *(void *)v43;
      uint64_t v37 = PSEnabledKey;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v43 != v39) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v10 isGroup])
          {
            v34 = [(CACCommandsController *)self commandGroup];
            v35 = v10;
            _AXAssert();
          }
          if (objc_msgSend(v10, "isCustom", v34, v35)) {
            uint64_t v11 = 0;
          }
          else {
            uint64_t v11 = objc_opt_class();
          }
          unsigned int v12 = [(CACCommandsController *)self _commandItemBelongsToDifferentLocale:v10];
          if (v12)
          {
            v13 = [v10 untranslatedDisplayString];
            uint64_t v14 = -1;
          }
          else
          {
            v13 = [v10 displayString];
            uint64_t v14 = 2;
          }
          v15 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"_detailStringForSpecifier:" detail:v11 cell:v14 edit:0];
          if ([v10 isCustom])
          {
            [v15 setControllerLoadAction:"presentCustomAction:"];
            v16 = +[NSNumber numberWithInt:v12 ^ 1];
            [v15 setProperty:v16 forKey:v37];
          }
          [v15 setProperty:v10 forKey:@"CACCommandItem"];
          [v41 addObject:v15];
          v17 = [(CACCommandsController *)self commandGroup];
          unsigned int v18 = [v17 isCustom];

          if (v18)
          {
            v19 = [obj axSafeObjectAtIndex:(char *)i + v38 + 1];
            if (![(CACCommandsController *)self _commandItemBelongsToDifferentLocale:v10]&& [(CACCommandsController *)self _commandItemBelongsToDifferentLocale:v19])
            {
              v20 = settingsLocString(@"CUSTOM_COMMAND_GROUP_OTHER_LANGUAGES_HEADER", @"CommandAndControlSettings");
              v21 = +[PSSpecifier groupSpecifierWithName:v20];
              [v41 addObject:v21];
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        v38 += (uint64_t)i;
      }
      while (v8);
    }

    v22 = [(CACCommandsController *)self commandGroup];
    if ([v22 isCustom])
    {
      v23 = +[CACPreferences sharedPreferences];
      v24 = [v23 allCustomCommandProperties];
      id v25 = [v24 count];
      id v26 = +[CACCommandImportExportUtilities maximumNumberOfAllowedEntries];

      if (v25 >= v26)
      {
LABEL_31:
        v32 = *(void **)&self->AXUISettingsBaseListController_opaque[v36];
        *(void *)&self->AXUISettingsBaseListController_opaque[v36] = v41;

        v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v36];
        goto LABEL_32;
      }
      v27 = settingsLocString(@"CREATE_NEW_CUSTOM_COMMAND", @"CommandAndControlSettings");
      v22 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:2 edit:0];

      [v22 setControllerLoadAction:"presentCustomAction:"];
      v28 = +[CACPreferences sharedPreferences];
      v29 = [v28 bestLocaleIdentifier];
      id v30 = +[CACSpokenCommandItem newCommandItemWithLocale:v29 scope:@"com.apple.speech.SystemWideScope"];
      [v22 setProperty:v30 forKey:@"CACCommandItem"];

      v31 = +[PSSpecifier emptyGroupSpecifier];
      [v41 addObject:v31];

      [v41 addObject:v22];
    }

    goto LABEL_31;
  }
LABEL_32:

  return v3;
}

- (void)presentCustomAction:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init((Class)CACCustomCommandEditorViewController);
  objc_super v5 = [v4 propertyForKey:@"CACCommandItem"];

  [v7 setCommandItem:v5];
  [v7 setDelegate:self];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  [(CACCommandsController *)self presentViewController:v6 animated:1 completion:0];
}

- (CACSpokenCommandGroup)commandGroup
{
  v2 = [(CACCommandsController *)self specifier];
  v3 = [v2 propertyForKey:@"CACCommandGroup"];

  return (CACSpokenCommandGroup *)v3;
}

- (BOOL)_commandItemBelongsToDifferentLocale:(id)a3
{
  id v3 = a3;
  id v4 = [v3 untranslatedLocale];
  if (v4 && [v3 isCustom])
  {
    objc_super v5 = [v3 untranslatedLocale];
    id v6 = +[CACPreferences sharedPreferences];
    id v7 = [v6 bestLocaleIdentifier];
    BOOL v8 = v5 != v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_detailStringForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:@"CACCommandItem"];
  if ([v4 isCustom])
  {
    if ([(CACCommandsController *)self _commandItemBelongsToDifferentLocale:v4])
    {
      objc_super v5 = +[NSLocale currentLocale];
      id v6 = [v4 untranslatedLocale];
      id v7 = [v5 localizedStringForLocaleIdentifier:v6];
      BOOL v8 = [v7 localizedCapitalizedString];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    if ([v4 isEnabled]) {
      v9 = @"ON";
    }
    else {
      v9 = @"OFF";
    }
    BOOL v8 = settingsLocString(v9, @"CommandAndControlSettings");
  }

  return v8;
}

- (void)_commandSettingsDidChange
{
  if ([(CACCommandsController *)self isCurrentlyAppearing])
  {
    [(CACCommandsController *)self _refreshGroupCommands];
    id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
    *(void *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

    [(CACCommandsController *)self reloadSpecifiers];
    id v9 = [(CACCommandsController *)self commandGroup];
    id v4 = [v9 commandsArray];
    if ([v4 count])
    {
    }
    else
    {
      objc_super v5 = [(CACCommandsController *)self navigationController];
      id v6 = [v5 viewControllers];
      id v7 = [v6 lastObject];

      if (v7 != self) {
        return;
      }
      id v9 = [(CACCommandsController *)self navigationController];
      id v8 = [v9 popViewControllerAnimated:1];
    }
  }
}

- (void)_refreshGroupCommands
{
  id v3 = objc_alloc_init((Class)CACSpokenCommandPresentation);
  [(CACCommandsController *)self setCommandPresentation:v3];

  id v4 = [(CACCommandsController *)self commandPresentation];
  [v4 setUsedByPreferences:1];

  objc_super v5 = [(CACCommandsController *)self commandPresentation];
  id v6 = [v5 nestedCommandGroupsAndItems];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "identifier", (void)v19);
        uint64_t v14 = [(CACCommandsController *)self commandGroup];
        v15 = [v14 identifier];
        unsigned int v16 = [v13 isEqualToString:v15];

        if (v16)
        {
          unsigned int v18 = [(CACCommandsController *)self specifier];
          [v18 setProperty:v12 forKey:@"CACCommandGroup"];
          id v17 = v7;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v17 = objc_alloc_init((Class)CACSpokenCommandGroup);
  [v17 setIsCustom:1];
  unsigned int v18 = [(CACCommandsController *)self specifier];
  [v18 setProperty:v17 forKey:@"CACCommandGroup"];
LABEL_11:
}

- (id)_sortedCustomCommandsArrayByLanguage
{
  v2 = [(CACCommandsController *)self commandGroup];
  id v3 = [v2 commandsArray];

  id v4 = [v3 sortedArrayUsingComparator:&stru_4DBB8];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACCommandsController;
  [(CACCommandsController *)&v5 viewWillAppear:a3];
  [(CACCommandsController *)self setIsCurrentlyAppearing:1];
  [(CACCommandsController *)self _commandSettingsDidChange];
  id v4 = [(CACCommandsController *)self table];
  [v4 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACCommandsController;
  [(CACCommandsController *)&v4 viewWillDisappear:a3];
  [(CACCommandsController *)self setIsCurrentlyAppearing:0];
}

- (CACSpokenCommandPresentation)commandPresentation
{
  return self->_commandPresentation;
}

- (void)setCommandPresentation:(id)a3
{
}

- (void)setCommandGroup:(id)a3
{
}

- (BOOL)isCurrentlyAppearing
{
  return self->_isCurrentlyAppearing;
}

- (void)setIsCurrentlyAppearing:(BOOL)a3
{
  self->_isCurrentlyAppearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandGroup, 0);

  objc_storeStrong((id *)&self->_commandPresentation, 0);
}

@end