@interface AXForceTouchController
- (AXForceTouchController)init;
- (BOOL)shouldIgnoreNextEnabledChangedNotification;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)forceTouchSettingItems;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_previewForConfigurationWithIdentifier:(id)a3 inTableView:(id)a4;
- (id)_specsForLongPressTiming;
- (id)_specsForMainSwitch;
- (id)_specsForSensitivity;
- (id)_specsForTester:(BOOL)a3;
- (id)forceTouchEnabled:(id)a3;
- (id)forceTouchSensitivity:(id)a3;
- (id)forceTouchTiming:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (void)dealloc;
- (void)setForceTouchEnabled:(id)a3 specifier:(id)a4;
- (void)setForceTouchSensitivity:(id)a3 specifier:(id)a4;
- (void)setForceTouchSettingItems:(id)a3;
- (void)setForceTouchSettingsEnabled:(BOOL)a3;
- (void)setForceTouchTiming:(id)a3 specifier:(id)a4;
- (void)setShouldIgnoreNextEnabledChangedNotification:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation AXForceTouchController

- (AXForceTouchController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXForceTouchController;
  v2 = [(AXForceTouchController *)&v5 init];
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_forceTouchEnabledSettingsChanged, kAXSForceTouchEnabledPreferenceNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(AXForceTouchController *)self setForceTouchSettingItems:0];
  v4.receiver = self;
  v4.super_class = (Class)AXForceTouchController;
  [(AXForceTouchController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    self->_forceTouchSettingsEnabled = _AXSForceTouchEnabled() != 0;
    if ([(AXForceTouchController *)self _deviceHasForcePress3dTouch])
    {
      v6 = [(AXForceTouchController *)self _specsForMainSwitch];
      [v5 addObjectsFromArray:v6];
    }
    v7 = +[NSMutableArray array];
    if ([(AXForceTouchController *)self _deviceHasForcePress3dTouch])
    {
      v8 = [(AXForceTouchController *)self _specsForSensitivity];
      [v7 addObjectsFromArray:v8];
      if (self->_forceTouchSettingsEnabled) {
        [v5 addObjectsFromArray:v8];
      }
    }
    v9 = [(AXForceTouchController *)self _specsForLongPressTiming];
    [v5 addObjectsFromArray:v9];

    v10 = [(AXForceTouchController *)self _specsForTester:[(AXForceTouchController *)self _deviceHasForcePress3dTouch]];
    [v5 addObjectsFromArray:v10];

    [(AXForceTouchController *)self setForceTouchSettingItems:v7];
    v11 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)_specsForMainSwitch
{
  uint64_t v3 = +[NSMutableArray array];
  objc_super v4 = settingsLocString(@"FORCE_TOUCH", @"Accessibility");
  objc_super v5 = +[PSSpecifier groupSpecifierWithName:v4];

  v6 = settingsLocString(@"FORCE_TOUCH_FOOTER_TEXT", @"Accessibility");
  [v5 setProperty:v6 forKey:PSFooterTextGroupKey];
  [v3 addObject:v5];
  v7 = settingsLocString(@"FORCE_TOUCH", @"Accessibility");
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setForceTouchEnabled:specifier:" get:"forceTouchEnabled:" detail:0 cell:6 edit:0];

  [v8 setProperty:@"ForceTouchAccessibilityMainSwitch" forKey:PSIDKey];
  [v3 addObject:v8];

  return v3;
}

- (id)_specsForLongPressTiming
{
  v2 = +[NSMutableArray array];
  uint64_t v3 = settingsLocString(@"HAPTIC_TOUCH_TIME", @"Accessibility");
  objc_super v4 = +[PSSpecifier groupSpecifierWithName:v3];

  [v4 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  uint64_t v5 = PSIDKey;
  [v4 setProperty:@"timingGroup" forKey:PSIDKey];
  v16 = settingsLocString(@"HAPTIC_TOUCH_TIMING_FOOTER_TEXT", @"Accessibility");
  objc_msgSend(v4, "setProperty:forKey:");
  [v2 addObject:v4];
  v6 = settingsLocString(@"HAPTIC_TOUCH_TIMING_SLOW", @"Accessibility");
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v7 setProperty:&off_2294F8 forKey:@"hapticTouchValue"];
  [v7 setProperty:@"HapticTouchSlowIdentifier" forKey:v5];
  v8 = settingsLocString(@"HAPTIC_TOUCH_TIMING_DEFAULT", @"Accessibility");
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v9 setProperty:&off_229510 forKey:@"hapticTouchValue"];
  [v9 setProperty:@"HapticTouchFastIdentifier" forKey:v5];
  v10 = settingsLocString(@"HAPTIC_TOUCH_TIMING_FAST", @"Accessibility");
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v11 setProperty:&off_229528 forKey:@"hapticTouchValue"];
  [v11 setProperty:@"HapticTouchFastIdentifier" forKey:v5];
  int v12 = _AXSForceTouchTimeDuration();
  v13 = v7;
  if (v12)
  {
    if (_AXSForceTouchTimeDuration() == 2) {
      v13 = v11;
    }
    else {
      v13 = v9;
    }
  }
  id v14 = v13;
  [v4 setProperty:v14 forKey:PSRadioGroupCheckedSpecifierKey];
  [v2 addObject:v11];
  [v2 addObject:v9];
  [v2 addObject:v7];

  return v2;
}

- (id)_specsForSensitivity
{
  uint64_t v3 = +[NSMutableArray array];
  objc_super v4 = settingsLocString(@"FORCE_TOUCH_SENSITIVITY", @"Accessibility");
  uint64_t v5 = +[PSSpecifier groupSpecifierWithName:v4];

  [v5 setIdentifier:@"FourceTouchSensitivityGroupIdentifier"];
  [v3 addObject:v5];
  v6 = settingsLocString(@"FORCE_TOUCH_SENSITIVITY_FOOTER_TEXT", @"Accessibility");
  [v5 setProperty:v6 forKey:PSFooterTextGroupKey];
  v7 = settingsLocString(@"SENSITIVITY_LIGHT", @"Accessibility");
  v15 = v7;
  v8 = settingsLocString(@"SENSITIVITY_MEDIUM", @"Accessibility");
  v16 = v8;
  v9 = settingsLocString(@"SENSITIVITY_FIRM", @"Accessibility");
  v17 = v9;
  v10 = +[NSArray arrayWithObjects:&v15 count:3];
  LODWORD(v11) = 1061997773;
  LODWORD(v12) = 1067030938;
  v13 = +[AXSensitivitySliderCell specifierWithSensitivityNames:minimumValue:maximumValue:target:set:get:](AXSensitivitySliderCell, "specifierWithSensitivityNames:minimumValue:maximumValue:target:set:get:", v10, self, "setForceTouchSensitivity:specifier:", "forceTouchSensitivity:", v11, v12, v15, v16);
  [v3 addObject:v13];

  return v3;
}

- (id)_specsForTester:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSMutableArray array];
  if (v3) {
    v6 = @"FORCE_TOUCH_SENSITIVITY_TEST";
  }
  else {
    v6 = @"HAPTIC_TOUCH_TIMING_TEST";
  }
  if (v3) {
    v7 = @"FORCE_TOUCH_SENSITIVITY_TEST_FOOTER_TEXT";
  }
  else {
    v7 = @"HAPTIC_TOUCH_TIMING_TEST_FOOTER_TEXT";
  }
  v8 = settingsLocString(v6, @"Accessibility");
  v9 = +[PSSpecifier groupSpecifierWithName:v8];

  [v9 setIdentifier:@"FourceTouchSensitivityTestGroupIdentifier"];
  [v5 addObject:v9];
  v10 = settingsLocString(v7, @"Accessibility");
  [v9 setProperty:v10 forKey:PSFooterTextGroupKey];
  double v11 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v11 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v11 setProperty:@"AXForceTouchSensitivityTestCell" forKey:PSIDKey];
  [v5 addObject:v11];

  return v5;
}

- (id)forceTouchEnabled:(id)a3
{
  uint64_t v3 = _AXSForceTouchEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setForceTouchEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [(AXForceTouchController *)self setShouldIgnoreNextEnabledChangedNotification:1];
  [v5 BOOLValue];
  _AXSSetForceTouchEnabled();
  id v6 = [v5 BOOLValue];

  [(AXForceTouchController *)self setForceTouchSettingsEnabled:v6];
}

- (void)setForceTouchTiming:(id)a3 specifier:(id)a4
{
  [a3 floatValue];

  _AXSSetForceTouchTimeDuration();
}

- (id)forceTouchTiming:(id)a3
{
  uint64_t v3 = _AXSForceTouchTimeDuration();

  return +[NSNumber numberWithUnsignedInt:v3];
}

- (void)setForceTouchSensitivity:(id)a3 specifier:(id)a4
{
  id v4 = [a3 floatValue];

  __AXSSetForceTouchSensitivity(v4);
}

- (id)forceTouchSensitivity:(id)a3
{
  _AXSForceTouchSensitivity();

  return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
}

- (void)setForceTouchSettingsEnabled:(BOOL)a3
{
  if (self->_forceTouchSettingsEnabled != a3)
  {
    BOOL v3 = a3;
    self->_forceTouchSettingsEnabled = a3;
    uint64_t v5 = [(AXForceTouchController *)self forceTouchSettingItems];
    id v6 = (id)v5;
    if (v3) {
      [(AXForceTouchController *)self insertContiguousSpecifiers:v5 afterSpecifierID:@"ForceTouchAccessibilityMainSwitch" animated:1];
    }
    else {
      [(AXForceTouchController *)self removeContiguousSpecifiers:v5 animated:1];
    }
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AXForceTouchController *)self specifierAtIndex:[(AXForceTouchController *)self indexForIndexPath:v7]];
  v9 = [v8 propertyForKey:PSCellClassKey];
  uint64_t v10 = objc_opt_class();

  if (v9 == (void *)v10)
  {
    double v12 = 175.0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXForceTouchController;
    [(AXForceTouchController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
    double v12 = v11;
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AXForceTouchController;
  id v6 = a4;
  [(AXForceTouchController *)&v13 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = objc_msgSend(v6, "section", v13.receiver, v13.super_class);

  v8 = [(AXForceTouchController *)self specifierAtIndex:[(AXForceTouchController *)self indexOfGroup:v7]];
  v9 = [v8 propertyForKey:PSIDKey];
  unsigned int v10 = [v9 isEqualToString:@"timingGroup"];

  if (v10)
  {
    double v11 = [v8 propertyForKey:PSRadioGroupCheckedSpecifierKey];
    double v12 = [v11 propertyForKey:@"hapticTouchValue"];
    [v12 intValue];

    _AXSSetForceTouchTimeDuration();
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AXForceTouchController *)self specifierForIndexPath:v7];
  v9 = [v8 propertyForKey:PSIDKey];
  unsigned __int8 v10 = [v9 isEqualToString:@"AXForceTouchSensitivityTestCell"];

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AXForceTouchController;
    BOOL v11 = [(AXForceTouchController *)&v13 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v11;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = [(AXForceTouchController *)self table];
  double v12 = [v11 cellForRowAtIndexPath:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v13 = [v12 flowersView];
    objc_msgSend(v9, "convertPoint:toView:", v13, x, y);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v13 bounds];
    v21.double x = v15;
    v21.double y = v17;
    if (CGRectContainsPoint(v22, v21))
    {
      v18 = +[UIContextMenuConfiguration configurationWithIdentifier:@"_TestContextMenuConfigurationIdentifier" previewProvider:&__block_literal_global_17 actionProvider:0];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

AXForceTouchSensitivityTestViewController *__cdecl __84__AXForceTouchController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(id a1)
{
  v1 = objc_alloc_init(AXForceTouchSensitivityTestViewController);

  return v1;
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  v8 = [(AXForceTouchController *)self _previewForConfigurationWithIdentifier:v7 inTableView:v6];

  return v8;
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  v8 = [(AXForceTouchController *)self _previewForConfigurationWithIdentifier:v7 inTableView:v6];

  return v8;
}

- (id)_previewForConfigurationWithIdentifier:(id)a3 inTableView:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"_TestContextMenuConfigurationIdentifier"])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = objc_msgSend(v5, "visibleCells", 0);
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v7 = v10;
            goto LABEL_13;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v11 = [v7 window];

    if (v11)
    {
      double v12 = [v7 flowersView];
      id v11 = [objc_alloc((Class)UITargetedPreview) initWithView:v12];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [v6 previewViewController];
  uint64_t v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __94__AXForceTouchController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v9[3] = &unk_208948;
    v9[4] = self;
    id v10 = v7;
    [v6 addAnimations:v9];
  }
}

id __94__AXForceTouchController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (BOOL)shouldIgnoreNextEnabledChangedNotification
{
  return self->_shouldIgnoreNextEnabledChangedNotification;
}

- (void)setShouldIgnoreNextEnabledChangedNotification:(BOOL)a3
{
  self->_shouldIgnoreNextEnabledChangedNotification = a3;
}

- (NSArray)forceTouchSettingItems
{
  return self->_forceTouchSettingItems;
}

- (void)setForceTouchSettingItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end