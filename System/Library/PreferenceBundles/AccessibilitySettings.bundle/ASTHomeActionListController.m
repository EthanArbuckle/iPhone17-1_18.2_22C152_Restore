@interface ASTHomeActionListController
- (ASTHomeActionListController)init;
- (ASTHomeActionListControllerDelegate)delegate;
- (AXSSMotionTrackingInputManager)motionTrackingInputManager;
- (BOOL)_supportsTimeout;
- (BOOL)isTimeoutSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (id)_timeoutValue:(id)a3;
- (id)adjustedASTIndexPath:(id)a3;
- (id)prependedSystemIcons;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)adjustedASTSection:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)homeActionType;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ASTHomeActionListController

- (id)prependedSystemIcons
{
  v3 = +[NSMutableArray arrayWithObject:@"__NONE__"];
  unint64_t v4 = [(ASTHomeActionListController *)self homeActionType];
  v5 = &AXAssistiveTouchIconTypeOpenMenu;
  if (v4 == 1)
  {
    v8 = &AXAssistiveTouchIconTypePassThroughToApp;
    goto LABEL_6;
  }
  if (v4 != 5) {
    goto LABEL_8;
  }
  [v3 addObject:AXAssistiveTouchIconTypeMousePrimaryClick];
  v6 = +[AXSettings sharedInstance];
  unsigned int v7 = [v6 laserEnabled];

  v8 = &AXAssistiveTouchIconTypeOpenMenu;
  if (v7)
  {
    v5 = &AXAssistiveTouchIconTypeMouseSecondaryClick;
LABEL_6:
    [v3 addObject:*v5];
  }
  v5 = v8;
LABEL_8:
  [v3 addObject:*v5];

  return v3;
}

- (unint64_t)homeActionType
{
  v2 = [(ASTHomeActionListController *)self specifier];
  v3 = [v2 propertyForKey:@"HomeAction"];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (BOOL)_supportsTimeout
{
  return (char *)[(ASTHomeActionListController *)self homeActionType] == (char *)&dword_0 + 2
      || (char *)[(ASTHomeActionListController *)self homeActionType] == (char *)&dword_0 + 3;
}

- (id)_timeoutValue:(id)a3
{
  id v4 = +[AXSettings sharedInstance];
  if ((char *)[(ASTHomeActionListController *)self homeActionType] == (char *)&dword_0 + 2)
  {
    v5 = [v4 assistiveTouchDoubleTapAction];

    if (v5)
    {
      [v4 assistiveTouchDoubleTapActionTimeout];
LABEL_7:
      uint64_t v7 = AXLocalizedTimeSummary();
      goto LABEL_9;
    }
  }
  if ((char *)[(ASTHomeActionListController *)self homeActionType] == (char *)&dword_0 + 3)
  {
    v6 = [v4 assistiveTouchLongPressAction];

    if (v6)
    {
      [v4 assistiveTouchLongPressActionDuration];
      goto LABEL_7;
    }
  }
  uint64_t v7 = settingsLocString(@"OFF", @"Accessibility");
LABEL_9:
  v8 = (void *)v7;

  return v8;
}

- (ASTHomeActionListController)init
{
  v11.receiver = self;
  v11.super_class = (Class)ASTHomeActionListController;
  v2 = [(ASTHomeActionListController *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)AXSSMotionTrackingInputConfiguration);
    if (AXIsInternalInstall())
    {
      id v4 = +[AXSettings sharedInstance];
      unsigned int v5 = [v4 assistiveTouchInternalOnlyPearlTrackingEnabled];
    }
    else
    {
      unsigned int v5 = 0;
    }
    v6 = +[NSMutableSet setWithObject:&off_229B28];
    uint64_t v7 = v6;
    if (v5) {
      [v6 addObject:&off_229B40];
    }
    [v3 setAllowedTrackingTypes:v7];
    v8 = (AXSSMotionTrackingInputManager *)[objc_alloc((Class)AXSSMotionTrackingInputManager) initWithConfiguration:v3];
    motionTrackingInputManager = v2->_motionTrackingInputManager;
    v2->_motionTrackingInputManager = v8;
  }
  return v2;
}

- (void)dealloc
{
  id v3 = +[AXSiriShortcutsManager sharedManager];
  [v3 unregisterShortcutsDidChangeBlock:self->_siriShortcutToken];

  v4.receiver = self;
  v4.super_class = (Class)ASTHomeActionListController;
  [(ASTHomeActionListController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    objc_initWeak(&location, self);
    v6 = +[AXSiriShortcutsManager sharedManager];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __41__ASTHomeActionListController_specifiers__block_invoke;
    v24[3] = &unk_2099A8;
    objc_copyWeak(&v25, &location);
    uint64_t v7 = [v6 registerShortcutsDidChangeBlock:v24];
    siriShortcutToken = self->_siriShortcutToken;
    self->_siriShortcutToken = v7;

    if ([(ASTHomeActionListController *)self _supportsTimeout])
    {
      if ((char *)[(ASTHomeActionListController *)self homeActionType] == (char *)&dword_0 + 2)
      {
        v9 = settingsLocString(@"DOUBLE_TAP_TIMEOUT", @"HandSettings");
        v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"_timeoutValue:" detail:objc_opt_class() cell:2 edit:0];

        [v10 setIdentifier:@"ASTDoubleTapTimeoutSpecifier"];
        [v5 addObject:v10];
        objc_super v11 = +[AXSettings sharedInstance];
        v12 = v22;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = __41__ASTHomeActionListController_specifiers__block_invoke_2;
        v22[3] = &unk_208BB8;
        v13 = &v23;
        objc_copyWeak(&v23, &location);
        id v14 = v10;
        v22[4] = v14;
        [v11 registerUpdateBlock:v22 forRetrieveSelector:"assistiveTouchDoubleTapActionTimeout" withListener:self];
LABEL_7:

        objc_destroyWeak(v13);
        goto LABEL_8;
      }
      if ((char *)[(ASTHomeActionListController *)self homeActionType] == (char *)&dword_0 + 3)
      {
        v15 = settingsLocString(@"LONG_PRESS_DURATION", @"HandSettings");
        v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"_timeoutValue:" detail:objc_opt_class() cell:2 edit:0];

        [v16 setIdentifier:@"ASTLongPressDurationSpecifier"];
        [v5 addObject:v16];
        objc_super v11 = +[AXSettings sharedInstance];
        v12 = v20;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = __41__ASTHomeActionListController_specifiers__block_invoke_3;
        v20[3] = &unk_208BB8;
        v13 = &v21;
        objc_copyWeak(&v21, &location);
        id v14 = v16;
        v20[4] = v14;
        [v11 registerUpdateBlock:v20 forRetrieveSelector:"assistiveTouchLongPressActionDuration" withListener:self];
        goto LABEL_7;
      }
    }
LABEL_8:
    [(AssistiveTouchCustomizeBaseActionPickerController *)self reloadASTDataSource];
    v17 = [(AssistiveTouchCustomizeBaseActionPickerController *)self iconSpecifiers];
    [v5 addObjectsFromArray:v17];

    v18 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    objc_super v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

void __41__ASTHomeActionListController_specifiers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __41__ASTHomeActionListController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

void __41__ASTHomeActionListController_specifiers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (void)loadView
{
  +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", AXAssistiveTouchIconTypeTap, AXAssistiveTouchIconTypeCustom, AXAssistiveTouchIconTypeDevice, AXAssistiveTouchIconTypeRotateScreen, AXAssistiveTouchIconTypeSideApp, AXAssistiveTouchIconTypeGestures, AXAssistiveTouchIconTypeDwell, AXAssistiveTouchIconTypeScroll, AXAssistiveTouchIconTypeAssistiveTouch, AXAssistiveTouchIconTypeClassicInvert, AXAssistiveTouchIconTypeColorFilters, AXAssistiveTouchIconTypeMagnifier, AXAssistiveTouchIconTypeVoiceOver, AXAssistiveTouchIconTypeSmartInvert, AXAssistiveTouchIconTypeZoom, AXAssistiveTouchIconTypeZoomController, AXAssistiveTouchIconTypeSwitchControl,
    AXAssistiveTouchIconTypeFullKeyboardAccess,
    AXAssistiveTouchIconTypeTorch,
    AXAssistiveTouchIconTypeConfirmApplePay,
    AXAssistiveTouchIconTypeSiriShortcutsMenu,
  uint64_t v3 = 0);
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __39__ASTHomeActionListController_loadView__block_invoke;
  v6[3] = &unk_20AD70;
  id v4 = v3;
  id v7 = v4;
  objc_copyWeak(&v9, &location);
  v8 = self;
  [(AssistiveTouchCustomizeBaseActionPickerController *)self setIconFilter:v6];
  v5.receiver = self;
  v5.super_class = (Class)ASTHomeActionListController;
  [(AssistiveTouchCustomizeBaseActionPickerController *)&v5 loadView];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

uint64_t __39__ASTHomeActionListController_loadView__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] containsObject:v3])
  {
    uint64_t v4 = 0;
  }
  else
  {
    objc_super v5 = a1 + 6;
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v7 = (char *)[WeakRetained homeActionType];

    if (v7 == (unsigned char *)&dword_0 + 1
      && ([v3 isEqualToString:AXAssistiveTouchIconTypePinch] & 1) == 0
      && ([v3 isEqualToString:AXAssistiveTouchIconTypeRotate] & 1) == 0
      && ([v3 isEqualToString:AXAssistiveTouchIconTypePinchAndRotate] & 1) == 0
      && ([v3 isEqualToString:AXAssistiveTouchIconTypeTap] & 1) == 0
      && ([v3 isEqualToString:AXAssistiveTouchIconTypeDoubleTap] & 1) == 0
      && ([v3 isEqualToString:AXAssistiveTouchIconTypeForceTap] & 1) == 0
      && ([v3 isEqualToString:AXAssistiveTouchIconTypeLongPress] & 1) == 0
      && ([v3 hasPrefix:AXASTCustomGesturePrefixName] & 1) == 0
      && [a1[5] inSetup])
    {
      [v3 isEqualToString:AXAssistiveTouchIconTypeCommandAndControl];
    }
    id v8 = objc_loadWeakRetained(a1 + 6);
    if ([v8 homeActionType] == (char *)&dword_4 + 2)
    {
      BOOL v9 = 1;
    }
    else
    {
      id v10 = objc_loadWeakRetained(v5);
      if ([v10 homeActionType] == (char *)&dword_4 + 3)
      {
        BOOL v9 = 1;
      }
      else
      {
        id v11 = objc_loadWeakRetained(v5);
        if ([v11 homeActionType] == &dword_8)
        {
          BOOL v9 = 1;
        }
        else
        {
          id v12 = objc_loadWeakRetained(v5);
          BOOL v9 = [v12 homeActionType] == (char *)&dword_8 + 1;
        }
      }
    }
    unsigned int v13 = [v3 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingBubbleMode];
    unsigned int v14 = [v3 isEqualToString:AXAssistiveTouchIconTypeEyeTrackingAutoHide];
    unsigned int v15 = v14;
    if (v9)
    {
      id v16 = objc_loadWeakRetained(v5);
      v17 = [v16 motionTrackingInputManager];
      v18 = [v17 compatibleInputs];
      v19 = +[NSMutableArray arrayWithArray:v18];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v20 = v19;
      id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v30;
        while (2)
        {
          v24 = 0;
          do
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v24);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v25, "isHIDDevice", (void)v29)
              && [v25 trackingType] == (char *)&dword_0 + 2)
            {
              int v26 = 0;
              goto LABEL_37;
            }
            v24 = (char *)v24 + 1;
          }
          while (v22 != v24);
          id v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
      int v26 = 1;
LABEL_37:

      int v27 = (v13 | v15) & v26;
    }
    else
    {
      int v27 = v13 | v14;
    }
    uint64_t v4 = v27 ^ 1u;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(ASTHomeActionListController *)self delegate];

  if (v5)
  {
    v6 = [(ASTHomeActionListController *)self delegate];
    id v7 = [v6 getCurrentActionForHomeActionListController:self];
    [(AssistiveTouchCustomizeBaseActionPickerController *)self setSelectedPopoverIcon:v7];
  }
  id v8 = [(ASTHomeActionListController *)self motionTrackingInputManager];
  [v8 setDelegate:self];

  BOOL v9 = [(ASTHomeActionListController *)self motionTrackingInputManager];
  [v9 startMonitoring];

  v10.receiver = self;
  v10.super_class = (Class)ASTHomeActionListController;
  [(ASTHomeActionListController *)&v10 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(ASTHomeActionListController *)self motionTrackingInputManager];
  [v5 stopMonitoring];

  v6.receiver = self;
  v6.super_class = (Class)ASTHomeActionListController;
  [(ASTHomeActionListController *)&v6 viewWillDisappear:v3];
}

- (BOOL)isTimeoutSection:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return [(ASTHomeActionListController *)self _supportsTimeout];
  }
}

- (int64_t)adjustedASTSection:(int64_t)a3
{
  return a3 - [(ASTHomeActionListController *)self _supportsTimeout];
}

- (id)adjustedASTIndexPath:(id)a3
{
  id v4 = a3;
  if ([(ASTHomeActionListController *)self _supportsTimeout])
  {
    +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v4 row], -[ASTHomeActionListController adjustedASTSection:](self, "adjustedASTSection:", objc_msgSend(v4, "section")));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  objc_super v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ASTHomeActionListController isTimeoutSection:](self, "isTimeoutSection:", [v7 section]))
  {
    v12.receiver = self;
    v12.super_class = (Class)ASTHomeActionListController;
    [(ASTHomeActionListController *)&v12 tableView:v6 didSelectRowAtIndexPath:v7];
  }
  else
  {
    id v8 = [(ASTHomeActionListController *)self adjustedASTIndexPath:v7];

    [(AssistiveTouchCustomizeBaseActionPickerController *)self astTableView:v6 didSelectRowAtIndexPath:v8];
    BOOL v9 = [(AssistiveTouchCustomizeBaseActionPickerController *)self selectedPopoverIcon];
    objc_super v10 = [(ASTHomeActionListController *)self delegate];

    if (v10)
    {
      id v11 = [(ASTHomeActionListController *)self delegate];
      [v11 homeActionListController:self selectedAction:v9];
    }
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!-[ASTHomeActionListController isTimeoutSection:](self, "isTimeoutSection:", [v9 section]))
  {
    objc_super v10 = [(ASTHomeActionListController *)self adjustedASTIndexPath:v9];
    [(AssistiveTouchCustomizeBaseActionPickerController *)self astTableView:v11 willDisplayCell:v8 forRowAtIndexPath:v10];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4 = [(AssistiveTouchCustomizeBaseActionPickerController *)self astNumberOfSections];
  return v4 + [(ASTHomeActionListController *)self _supportsTimeout];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(ASTHomeActionListController *)self isTimeoutSection:a4])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(AssistiveTouchCustomizeBaseActionPickerController *)self astTitleForSection:[(ASTHomeActionListController *)self adjustedASTSection:a4]];
  }

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(ASTHomeActionListController *)self isTimeoutSection:a4]) {
    return 1;
  }
  int64_t v7 = [(ASTHomeActionListController *)self adjustedASTSection:a4];

  return [(AssistiveTouchCustomizeBaseActionPickerController *)self astNumberOfRowsInSection:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASTHomeActionListController *)self specifierForIndexPath:v7];
  if (-[ASTHomeActionListController isTimeoutSection:](self, "isTimeoutSection:", [v7 section]))
  {
    v16.receiver = self;
    v16.super_class = (Class)ASTHomeActionListController;
    id v9 = [(ASTHomeActionListController *)&v16 tableView:v6 cellForRowAtIndexPath:v7];
  }
  else
  {
    objc_super v10 = [(ASTHomeActionListController *)self adjustedASTIndexPath:v7];

    id v9 = [(AssistiveTouchCustomizeBaseActionPickerController *)self astPickerCellForRowAtIndexPath:v10 tableView:v6];
    id v11 = [v8 propertyForKey:PSIDKey];
    unsigned int v12 = [v11 isEqualToString:@"__NONE__"];

    if (v12)
    {
      unsigned int v13 = settingsLocString(@"NONE", @"HandSettings");
      unsigned int v14 = [v9 textLabel];
      [v14 setText:v13];
    }
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (ASTHomeActionListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASTHomeActionListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXSSMotionTrackingInputManager)motionTrackingInputManager
{
  return self->_motionTrackingInputManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionTrackingInputManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_siriShortcutToken, 0);
}

@end