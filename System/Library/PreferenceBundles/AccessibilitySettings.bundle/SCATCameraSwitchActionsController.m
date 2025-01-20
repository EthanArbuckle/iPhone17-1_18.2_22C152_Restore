@interface SCATCameraSwitchActionsController
- (NSString)footerText;
- (SCATCameraSwitchActionsController)initWithSwitch:(id)a3;
- (id)_actionSpecifiersWithActions:(id)a3;
- (id)_rootSwitchesController;
- (id)disallowedActions;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)cameraSwitchType;
- (void)saveSwitchToSettings:(id)a3;
- (void)setCameraSwitchType:(unint64_t)a3;
- (void)setFooterText:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATCameraSwitchActionsController

- (SCATCameraSwitchActionsController)initWithSwitch:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCATCameraSwitchActionsController;
  v5 = [(SCATSwitchActionsController *)&v7 initWithSwitch:v4];
  if (v5)
  {
    -[SCATSwitchActionsController setPopToRootSwitchViewControlAfterSelection:](v5, "setPopToRootSwitchViewControlAfterSelection:", [v4 cameraSwitch] != (char *)&dword_8 + 1);
    -[SCATCameraSwitchActionsController setCameraSwitchType:](v5, "setCameraSwitchType:", [v4 cameraSwitch]);
  }

  return v5;
}

- (id)_rootSwitchesController
{
  v3 = [(SCATCameraSwitchActionsController *)self navigationController];
  id v4 = [v3 viewControllers];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = [v4 reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    v27 = v4;
    uint64_t v25 = *(void *)v33;
    while (2)
    {
      v9 = 0;
      id v26 = v7;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v9);
        v11 = [(SCATCameraSwitchActionsController *)self parentController];
        unsigned int v12 = [v10 isMemberOfClass:objc_opt_class()];

        if (v12)
        {
          id v24 = v10;
LABEL_21:

          id v4 = v27;
          goto LABEL_22;
        }
        v13 = [v10 childViewControllers];
        id v14 = [v13 count];

        if (v14)
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v15 = [v10 childViewControllers];
          id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v29;
            while (2)
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                v21 = [(SCATCameraSwitchActionsController *)self parentController];
                LOBYTE(v20) = [v20 isMemberOfClass:objc_opt_class()];

                if (v20)
                {
                  id v22 = v10;

                  goto LABEL_21;
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v25;
          id v7 = v26;
        }
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
      id v4 = v27;
      if (v7) {
        continue;
      }
      break;
    }
  }

  v10 = [(SCATCameraSwitchActionsController *)self parentController];
LABEL_22:

  return v10;
}

- (void)saveSwitchToSettings:(id)a3
{
}

- (id)disallowedActions
{
  return &off_22BF18;
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  if ((char *)[(SCATCameraSwitchActionsController *)self cameraSwitchType] == (char *)&dword_8 + 1)
  {
    id v4 = AXParameterizedLocalizedString();
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v5 setProperty:@"CameraSwitchActionDwellOptions" forKey:PSIDKey];
    v33[0] = v5;
    id v6 = +[PSSpecifier emptyGroupSpecifier];
    v33[1] = v6;
    id v7 = v33;
  }
  else
  {
    uint64_t v8 = AXParameterizedLocalizedString();
    v5 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v5 setProperty:@"CameraSwitchActionSensitivity" forKey:PSIDKey];
    v9 = +[NSNumber numberWithUnsignedInteger:[(SCATCameraSwitchActionsController *)self cameraSwitchType]];
    [v5 setProperty:v9 forKey:@"SCATCameraExpressionType"];

    v10 = [(SCATSwitchActionsController *)self storedSwitch];
    [v5 setProperty:v10 forKey:@"StoredCameraSwitch"];

    v32[0] = v5;
    id v6 = +[PSSpecifier emptyGroupSpecifier];
    v32[1] = v6;
    id v7 = v32;
  }
  v11 = +[NSArray arrayWithObjects:v7 count:2];
  [v3 addObjectsFromArray:v11];

  v31.receiver = self;
  v31.super_class = (Class)SCATCameraSwitchActionsController;
  unsigned int v12 = [(SCATSwitchActionsController *)&v31 specifiers];
  [v3 axSafelyAddObjectsFromArray:v12];

  v13 = AXParameterizedLocalizedString();
  id v14 = +[PSSpecifier groupSpecifierWithName:v13];

  [v3 addObject:v14];
  v15 = SCATHeadTrackingSwitchActions();
  id v16 = [(SCATCameraSwitchActionsController *)self _actionSpecifiersWithActions:v15];

  [v3 addObjectsFromArray:v16];
  id v17 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v18 = +[NSMutableArray arrayWithObject:v17];

  v19 = AXParameterizedLocalizedString();
  v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v20 setProperty:&off_22A3C8 forKey:@"ActionKey"];
  [v20 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v18 addObject:v20];
  v21 = [(SCATCameraSwitchActionsController *)self footerText];

  if (v21)
  {
    id v22 = [(SCATSwitchActionsController *)self footerTextSpecifier];
    v23 = [(SCATCameraSwitchActionsController *)self footerText];
    [v22 setProperty:v23 forKey:PSFooterTextGroupKey];
  }
  id v24 = [(SCATSwitchActionsController *)self footerTextSpecifier];

  if (v24)
  {
    uint64_t v25 = [(SCATSwitchActionsController *)self footerTextSpecifier];
    objc_msgSend(v3, "ps_insertObjectsFromArray:afterObject:", v18, v25);
  }
  else
  {
    [v3 addObjectsFromArray:v18];
  }
  uint64_t v26 = OBJC_IVAR___PSListController__specifiers;
  v27 = *(void **)&self->super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v28 = v3;

  id v29 = *(id *)&self->super.AXUISettingsSetupCapableListController_opaque[v26];
  return v29;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATCameraSwitchActionsController;
  [(SCATCameraSwitchActionsController *)&v4 viewWillAppear:a3];
  [(SCATCameraSwitchActionsController *)self reloadSpecifiers];
}

- (id)_actionSpecifiersWithActions:(id)a3
{
  id v4 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __66__SCATCameraSwitchActionsController__actionSpecifiersWithActions___block_invoke;
  v9[3] = &unk_20AEA8;
  v9[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __66__SCATCameraSwitchActionsController__actionSpecifiersWithActions___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) disallowedActions];
  unsigned __int8 v4 = [v3 containsObject:v7];

  if ((v4 & 1) == 0)
  {
    [v7 integerValue];
    id v5 = SCATLocStringForAction();
    id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];

    [v6 setProperty:v7 forKey:@"ActionKey"];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SCATCameraSwitchActionsController;
  unsigned __int8 v4 = [(SCATSwitchActionsController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 specifier];
  uint64_t v6 = PSIDKey;
  id v7 = [v5 propertyForKey:PSIDKey];
  if ([v7 isEqualToString:@"CameraSwitchActionDwellOptions"])
  {
  }
  else
  {
    uint64_t v8 = [v5 propertyForKey:v6];
    unsigned int v9 = [v8 isEqualToString:@"CameraSwitchActionSensitivity"];

    if (!v9) {
      goto LABEL_5;
    }
  }
  [v4 setAccessoryType:1];
LABEL_5:

  return v4;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (unint64_t)cameraSwitchType
{
  return self->_cameraSwitchType;
}

- (void)setCameraSwitchType:(unint64_t)a3
{
  self->_cameraSwitchType = a3;
}

- (void).cxx_destruct
{
}

@end