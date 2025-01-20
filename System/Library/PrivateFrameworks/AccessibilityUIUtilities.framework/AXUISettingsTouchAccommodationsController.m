@interface AXUISettingsTouchAccommodationsController
- (BOOL)_shouldShowSwipeGesturesSpecifiersWithTapAssistance;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass;
- (BOOL)touchAccommodationsAreConfigured;
- (BOOL)touchAccommodationsEnabled;
- (BOOL)touchAccommodationsHoldDurationEnabled;
- (BOOL)touchAccommodationsIgnoreRepeatEnabled;
- (Class)touchAccomodationsSwipeGestureViewControllerClass;
- (NSArray)swipeGesturesSpecifiers;
- (NSArray)tapTimeoutSpecifiers;
- (PSSpecifier)holdDurationPickerSpecifier;
- (PSSpecifier)ignoreRepeatPickerSpecifier;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)touchAccommodationsHoldDuration;
- (double)touchAccommodationsIgnoreRepeatDuration;
- (double)touchAccommodationsTapActivationTimeout;
- (double)valueForSpecifier:(id)a3;
- (id)_durationSpecifiersWithName:(id)a3 groupIdentifier:(id)a4 footerText:(id)a5 set:(SEL)a6 get:(SEL)a7 previousSpecifierIdentifier:(id)a8 conditionalSpecifiers:(id)a9;
- (id)_holdDurationEnabled:(id)a3;
- (id)_holdDurationSpecifiers;
- (id)_ignoreRepeatEnabled:(id)a3;
- (id)_ignoreRepeatSpecifiers;
- (id)_swipeGesturesEnabled:(id)a3;
- (id)_swipeGesturesSpecifiers;
- (id)_tapActivationMethodSpecifiers;
- (id)activationMethod:(id)a3;
- (id)holdDuration:(id)a3;
- (id)ignoreRepeat:(id)a3;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)touchAccommodationsEnabled:(id)a3;
- (int64_t)touchAccommodationsTapActivationMethod;
- (void)_setHoldDurationEnabled:(id)a3 specifier:(id)a4;
- (void)_setIgnoreRepeatEnabled:(id)a3 specifier:(id)a4;
- (void)_showOrHideTapTimeoutAnimated:(BOOL)a3;
- (void)_updateDelayPickerSpecifier:(id)a3 additionalSpecifiers:(id)a4 afterSpecifierWithIdentifier:(id)a5 enabled:(BOOL)a6;
- (void)_updateMasterSwitchFooterText;
- (void)_updateMasterSwitchFooterTextForSpecifier:(id)a3 shouldReload:(BOOL)a4;
- (void)_updateSwipeGesturesSpecifiers;
- (void)setHoldDurationPickerSpecifier:(id)a3;
- (void)setIgnoreRepeatPickerSpecifier:(id)a3;
- (void)setSwipeGesturesSpecifiers:(id)a3;
- (void)setTapTimeoutSpecifiers:(id)a3;
- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3;
- (void)setTouchAccommodationsEnabled:(BOOL)a3;
- (void)setTouchAccommodationsEnabled:(id)a3 specifier:(id)a4;
- (void)setTouchAccommodationsHoldDuration:(double)a3;
- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3;
- (void)setTouchAccommodationsIgnoreRepeatDuration:(double)a3;
- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3;
- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3;
- (void)setTouchAccommodationsTapActivationTimeout:(double)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXUISettingsTouchAccommodationsController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsTouchAccommodationsController;
  [(AXUISettingsTouchAccommodationsController *)&v4 viewWillAppear:a3];
  [(AXUISettingsTouchAccommodationsController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    [v6 setIdentifier:@"TouchAccommodationsMasterSwitch"];
    [(AXUISettingsTouchAccommodationsController *)self _updateMasterSwitchFooterTextForSpecifier:v6 shouldReload:0];
    if ([(AXUISettingsTouchAccommodationsController *)self touchAccommodationsAreConfigured])
    {
      v7 = AXLocStringKeyForHomeButton();
      v8 = AXLocStringKeyForModel();
      v9 = AXUILocalizedStringForKey(v8);
    }
    else
    {
      v9 = AXUILocalizedStringForKey(@"TOUCH_ACCOMMODATIONS_FOOTER_TEXT_UNCONFIGURED");
    }
    [v6 setProperty:v9 forKey:*MEMORY[0x1E4F93170]];

    [v5 addObject:v6];
    v10 = (void *)MEMORY[0x1E4F92E70];
    v11 = AXUILocalizedStringForKey(@"TOUCH_ACCOMMODATIONS");
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:sel_setTouchAccommodationsEnabled_specifier_ get:sel_touchAccommodationsEnabled_ detail:0 cell:6 edit:0];

    [v12 setProperty:@"TOUCH_ACCOMMODATIONS_SWITCHER" forKey:*MEMORY[0x1E4F93188]];
    [v5 addObject:v12];
    v13 = [(AXUISettingsTouchAccommodationsController *)self _holdDurationSpecifiers];
    [v5 addObjectsFromArray:v13];

    if ([(AXUISettingsTouchAccommodationsController *)self _shouldShowSwipeGesturesSpecifiersWithHoldDuration])
    {
      v14 = [(AXUISettingsTouchAccommodationsController *)self _swipeGesturesSpecifiers];
      [v5 addObjectsFromArray:v14];
    }
    v15 = [(AXUISettingsTouchAccommodationsController *)self _ignoreRepeatSpecifiers];
    [v5 addObjectsFromArray:v15];

    v16 = [(AXUISettingsTouchAccommodationsController *)self _tapActivationMethodSpecifiers];
    [v5 addObjectsFromArray:v16];

    if ([(AXUISettingsTouchAccommodationsController *)self _shouldShowSwipeGesturesSpecifiersWithTapAssistance])
    {
      v17 = [(AXUISettingsTouchAccommodationsController *)self _swipeGesturesSpecifiers];
      [v5 addObjectsFromArray:v17];
    }
    v18 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)touchAccommodationsEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  BOOL v4 = [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (void)setTouchAccommodationsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  [(AXUISettingsTouchAccommodationsController *)self setTouchAccommodationsEnabled:v5];
}

- (id)holdDuration:(id)a3
{
  if ([(AXUISettingsTouchAccommodationsController *)self touchAccommodationsHoldDurationEnabled])
  {
    [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsHoldDuration];
    AXLocalizedTimeSummary(0, v4);
  }
  else
  {
    AXUILocalizedStringForKey(@"OFF");
  uint64_t v5 = };
  return v5;
}

- (id)ignoreRepeat:(id)a3
{
  if ([(AXUISettingsTouchAccommodationsController *)self touchAccommodationsIgnoreRepeatEnabled])
  {
    [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsIgnoreRepeatDuration];
    AXLocalizedTimeSummary(0, v4);
  }
  else
  {
    AXUILocalizedStringForKey(@"OFF");
  uint64_t v5 = };
  return v5;
}

- (id)activationMethod:(id)a3
{
  unint64_t v3 = [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsTapActivationMethod];
  if (v3 > 2)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = AXUILocalizedStringForKey(off_1E649C838[v3]);
  }
  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  v7 = [(AXUISettingsBaseListController *)self specifierForIndexPath:a5];
  v8 = [v7 propertyForKey:@"ActivationMethod"];
  if (v8) {
    objc_msgSend(v9, "setChecked:", -[AXUISettingsTouchAccommodationsController touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod") == (int)objc_msgSend(v8, "intValue"));
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AXUISettingsTouchAccommodationsController;
  [(AXUISettingsSetupCapableListController *)&v28 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(AXUISettingsBaseListController *)self specifierForIndexPath:v7];
  id v9 = [v8 propertyForKey:@"ActivationMethod"];
  if (v9)
  {
    v21 = v8;
    id v22 = v7;
    v20 = v9;
    int v10 = [v9 intValue];
    [(AXUISettingsTouchAccommodationsController *)self setTouchAccommodationsTapActivationMethod:v10];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v6;
    v11 = [v6 visibleCells];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = [v16 specifier];
          v18 = [v17 propertyForKey:@"ActivationMethod"];
          v19 = v18;
          if (v18) {
            objc_msgSend(v16, "setChecked:", objc_msgSend(v18, "intValue") == v10);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v13);
    }

    [(AXUISettingsTouchAccommodationsController *)self _updateMasterSwitchFooterText];
    [(AXUISettingsTouchAccommodationsController *)self _showOrHideTapTimeoutAnimated:1];
    [(AXUISettingsTouchAccommodationsController *)self _updateSwipeGesturesSpecifiers];
    id v7 = v22;
    id v6 = v23;
    id v9 = v20;
    v8 = v21;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)minimumValueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUISettingsTouchAccommodationsController *)self ignoreRepeatPickerSpecifier];

  if (v5 == v4)
  {
    id v7 = (double *)MEMORY[0x1E4F48550];
  }
  else
  {
    id v6 = [(AXUISettingsTouchAccommodationsController *)self holdDurationPickerSpecifier];

    id v7 = (double *)MEMORY[0x1E4F48570];
    if (v6 == v4) {
      id v7 = (double *)MEMORY[0x1E4F48540];
    }
  }
  double v8 = *v7;

  return v8;
}

- (double)maximumValueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUISettingsTouchAccommodationsController *)self ignoreRepeatPickerSpecifier];

  if (v5 == v4)
  {
    id v7 = (double *)MEMORY[0x1E4F48548];
  }
  else
  {
    id v6 = [(AXUISettingsTouchAccommodationsController *)self holdDurationPickerSpecifier];

    id v7 = (double *)MEMORY[0x1E4F48568];
    if (v6 == v4) {
      id v7 = (double *)MEMORY[0x1E4F48538];
    }
  }
  double v8 = *v7;

  return v8;
}

- (double)stepValueForSpecifier:(id)a3
{
  return 0.05;
}

- (double)valueForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUISettingsTouchAccommodationsController *)self ignoreRepeatPickerSpecifier];

  if (v5 == v4)
  {
    [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsIgnoreRepeatDuration];
  }
  else
  {
    id v6 = [(AXUISettingsTouchAccommodationsController *)self holdDurationPickerSpecifier];

    if (v6 == v4) {
      [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsHoldDuration];
    }
    else {
      [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsTapActivationTimeout];
    }
  }
  double v8 = v7;

  return v8;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v8 = a3;
  id v6 = [(AXUISettingsTouchAccommodationsController *)self ignoreRepeatPickerSpecifier];

  if (v6 == v8)
  {
    [(AXUISettingsTouchAccommodationsController *)self setTouchAccommodationsIgnoreRepeatDuration:a4];
  }
  else
  {
    id v7 = [(AXUISettingsTouchAccommodationsController *)self holdDurationPickerSpecifier];

    if (v7 == v8) {
      [(AXUISettingsTouchAccommodationsController *)self setTouchAccommodationsHoldDuration:a4];
    }
    else {
      [(AXUISettingsTouchAccommodationsController *)self setTouchAccommodationsTapActivationTimeout:a4];
    }
  }
}

- (id)stringValueForSpecifier:(id)a3
{
  unint64_t v3 = NSNumber;
  [(AXUISettingsTouchAccommodationsController *)self valueForSpecifier:a3];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  id v5 = AXFormatNumberWithOptions();

  return v5;
}

- (void)_updateMasterSwitchFooterText
{
  id v3 = [(AXUISettingsTouchAccommodationsController *)self specifierForID:@"TouchAccommodationsMasterSwitch"];
  [(AXUISettingsTouchAccommodationsController *)self _updateMasterSwitchFooterTextForSpecifier:v3 shouldReload:1];
}

- (void)_updateMasterSwitchFooterTextForSpecifier:(id)a3 shouldReload:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if ([(AXUISettingsTouchAccommodationsController *)self touchAccommodationsAreConfigured])
  {
    id v6 = AXLocStringKeyForHomeButton();
    id v7 = AXLocStringKeyForModel();
    id v8 = AXUILocalizedStringForKey(v7);
  }
  else
  {
    id v8 = AXUILocalizedStringForKey(@"TOUCH_ACCOMMODATIONS_FOOTER_TEXT_UNCONFIGURED");
  }
  uint64_t v9 = *MEMORY[0x1E4F93170];
  int v10 = [v12 propertyForKey:*MEMORY[0x1E4F93170]];
  char v11 = [v10 isEqualToString:v8];

  if ((v11 & 1) == 0)
  {
    [v12 setProperty:v8 forKey:v9];
    if (v4) {
      [(AXUISettingsTouchAccommodationsController *)self reloadSpecifier:v12 animated:1];
    }
  }
}

- (id)_tapActivationMethodSpecifiers
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)MEMORY[0x1E4F92E70];
  BOOL v4 = AXUILocalizedStringForKey(@"ACTIVATION_METHOD");
  id v5 = [v3 groupSpecifierWithName:v4];

  id v6 = AXUILocalizedStringForKey(@"ACTIVATION_METHOD_FOOTER_TEXT");
  uint64_t v25 = *MEMORY[0x1E4F93170];
  objc_msgSend(v5, "setProperty:forKey:", v6);

  [v2 addObject:v5];
  id v7 = (void *)MEMORY[0x1E4F92E70];
  id v8 = AXUILocalizedStringForKey(@"OFF");
  uint64_t v9 = [v7 preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  uint64_t v10 = *MEMORY[0x1E4F93188];
  [v9 setProperty:@"OFF" forKey:*MEMORY[0x1E4F93188]];
  [v9 setProperty:&unk_1F1F20138 forKey:@"ActivationMethod"];
  [v2 addObject:v9];
  char v11 = (void *)MEMORY[0x1E4F92E70];
  id v12 = AXUILocalizedStringForKey(@"ACTIVATE_ON_TOUCH");
  uint64_t v13 = [v11 preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v13 setProperty:@"ACTIVATE_ON_TOUCH" forKey:v10];
  [v13 setProperty:&unk_1F1F20150 forKey:@"ActivationMethod"];
  [v2 addObject:v13];
  uint64_t v14 = (void *)MEMORY[0x1E4F92E70];
  v15 = AXUILocalizedStringForKey(@"ACTIVATE_ON_RELEASE");
  v16 = [v14 preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v16 setProperty:@"ACTIVATE_ON_RELEASE" forKey:v10];
  [v16 setProperty:&unk_1F1F20168 forKey:@"ActivationMethod"];
  [v2 addObject:v16];
  v17 = [(AXUISettingsTouchAccommodationsController *)self tapTimeoutSpecifiers];

  if (!v17)
  {
    v18 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"TimerSpecifierGroup"];
    v19 = AXUILocalizedStringForKey(@"ACTIVATE_TAP_TIMEOUT");
    [v18 setName:v19];

    v20 = AXUILocalizedStringForKey(@"ACTIVATE_TAP_TIMEOUT_FOOTER");
    [v18 setProperty:v20 forKey:v25];

    [v18 setProperty:@"TimerSpecifierGroup" forKey:v10];
    v21 = objc_msgSend(MEMORY[0x1E4F92E70], "ax_stepperSpecifierWithDelegate:", self);
    [v21 setProperty:@"TimerSpecifier" forKey:v10];
    v27[0] = v18;
    v27[1] = v21;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [(AXUISettingsTouchAccommodationsController *)self setTapTimeoutSpecifiers:v22];
  }
  if ((unint64_t)([(AXUISettingsTouchAccommodationsController *)self touchAccommodationsTapActivationMethod]- 1) <= 1)
  {
    id v23 = [(AXUISettingsTouchAccommodationsController *)self tapTimeoutSpecifiers];
    [v2 addObjectsFromArray:v23];
  }
  return v2;
}

- (void)_showOrHideTapTimeoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsTapActivationMethod];
  id v6 = [(AXUISettingsTouchAccommodationsController *)self specifierForID:@"TimerSpecifierGroup"];

  if ((unint64_t)(v5 - 1) > 1)
  {
    if (!v6) {
      return;
    }
    id v7 = [(AXUISettingsTouchAccommodationsController *)self specifierForID:@"TimerSpecifier"];
    id v12 = [(AXUISettingsTouchAccommodationsController *)self indexPathForSpecifier:v7];

    id v8 = [(AXUISettingsTouchAccommodationsController *)self table];
    uint64_t v9 = [v8 cellForRowAtIndexPath:v12];

    uint64_t v10 = [v9 nameTextField];
    [v10 resignFirstResponder];

    char v11 = [(AXUISettingsTouchAccommodationsController *)self tapTimeoutSpecifiers];
    [(AXUISettingsTouchAccommodationsController *)self removeContiguousSpecifiers:v11 animated:v3];
  }
  else
  {
    if (v6) {
      return;
    }
    id v12 = [(AXUISettingsTouchAccommodationsController *)self tapTimeoutSpecifiers];
    -[AXUISettingsTouchAccommodationsController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:");
  }
}

- (void)_setIgnoreRepeatEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  [(AXUISettingsTouchAccommodationsController *)self setTouchAccommodationsIgnoreRepeatEnabled:v5];
  [(AXUISettingsTouchAccommodationsController *)self _updateMasterSwitchFooterText];
  id v6 = [(AXUISettingsTouchAccommodationsController *)self ignoreRepeatPickerSpecifier];
  [(AXUISettingsTouchAccommodationsController *)self _updateDelayPickerSpecifier:v6 additionalSpecifiers:0 afterSpecifierWithIdentifier:@"IgnoreRepeat" enabled:v5];
}

- (id)_ignoreRepeatEnabled:(id)a3
{
  BOOL v3 = NSNumber;
  BOOL v4 = [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsIgnoreRepeatEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (id)_ignoreRepeatSpecifiers
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AXUISettingsTouchAccommodationsController *)self ignoreRepeatPickerSpecifier];

  if (!v3)
  {
    BOOL v4 = objc_msgSend(MEMORY[0x1E4F92E70], "ax_stepperSpecifierWithDelegate:", self);
    [(AXUISettingsTouchAccommodationsController *)self setIgnoreRepeatPickerSpecifier:v4];
  }
  uint64_t v5 = AXUILocalizedStringForKey(@"IGNORE_REPEAT");
  id v6 = AXUILocalizedStringForKey(@"IGNORE_REPEAT_FOOTER_TEXT");
  id v7 = [(AXUISettingsTouchAccommodationsController *)self ignoreRepeatPickerSpecifier];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = [(AXUISettingsTouchAccommodationsController *)self _durationSpecifiersWithName:v5 groupIdentifier:@"IgnoreRepeatGroup" footerText:v6 set:sel__setIgnoreRepeatEnabled_specifier_ get:sel__ignoreRepeatEnabled_ previousSpecifierIdentifier:@"IgnoreRepeat" conditionalSpecifiers:v8];

  return v9;
}

- (void)_setHoldDurationEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  [(AXUISettingsTouchAccommodationsController *)self setTouchAccommodationsHoldDurationEnabled:v5];
  [(AXUISettingsTouchAccommodationsController *)self _updateMasterSwitchFooterText];
  id v6 = [(AXUISettingsTouchAccommodationsController *)self holdDurationPickerSpecifier];
  [(AXUISettingsTouchAccommodationsController *)self _updateDelayPickerSpecifier:v6 additionalSpecifiers:0 afterSpecifierWithIdentifier:@"HoldDuration" enabled:v5];

  [(AXUISettingsTouchAccommodationsController *)self _updateSwipeGesturesSpecifiers];
}

- (id)_holdDurationEnabled:(id)a3
{
  BOOL v3 = NSNumber;
  BOOL v4 = [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsHoldDurationEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (id)_holdDurationSpecifiers
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AXUISettingsTouchAccommodationsController *)self holdDurationPickerSpecifier];

  if (!v3)
  {
    BOOL v4 = objc_msgSend(MEMORY[0x1E4F92E70], "ax_stepperSpecifierWithDelegate:", self);
    [(AXUISettingsTouchAccommodationsController *)self setHoldDurationPickerSpecifier:v4];
  }
  uint64_t v5 = [(AXUISettingsTouchAccommodationsController *)self holdDurationPickerSpecifier];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  id v7 = AXUILocalizedStringForKey(@"HOLD_DURATION");
  id v8 = AXUILocalizedStringForKey(@"HOLD_DURATION_FOOTER_TEXT");
  uint64_t v9 = [(AXUISettingsTouchAccommodationsController *)self _durationSpecifiersWithName:v7 groupIdentifier:@"HoldDurationGroup" footerText:v8 set:sel__setHoldDurationEnabled_specifier_ get:sel__holdDurationEnabled_ previousSpecifierIdentifier:@"HoldDuration" conditionalSpecifiers:v6];

  return v9;
}

- (BOOL)_shouldShowSwipeGesturesSpecifiersWithTapAssistance
{
  int64_t v3 = [(AXUISettingsTouchAccommodationsController *)self touchAccommodationsTapActivationMethod];
  if (v3) {
    LOBYTE(v3) = ![(AXUISettingsTouchAccommodationsController *)self touchAccommodationsHoldDurationEnabled];
  }
  return v3;
}

- (void)_updateSwipeGesturesSpecifiers
{
  unint64_t v3 = [(AXUISettingsTouchAccommodationsController *)self indexOfSpecifierID:@"IgnoreRepeatGroup"];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    _AXAssert();
  }
  BOOL v4 = [(AXUISettingsTouchAccommodationsController *)self swipeGesturesSpecifiers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(AXUISettingsTouchAccommodationsController *)self swipeGesturesSpecifiers];
    id v7 = [v6 lastObject];

    unint64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]) indexOfObject:v7];
    BOOL v9 = 0;
    BOOL v10 = 0;
    if (v3 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v10 = v8 < v3;
      BOOL v9 = v8 > v3;
    }
  }
  else
  {
    BOOL v9 = 0;
    BOOL v10 = 0;
  }
  BOOL v11 = [(AXUISettingsTouchAccommodationsController *)self _shouldShowSwipeGesturesSpecifiersWithHoldDuration];
  BOOL v12 = [(AXUISettingsTouchAccommodationsController *)self _shouldShowSwipeGesturesSpecifiersWithTapAssistance];
  BOOL v13 = v12;
  if (v10 && !v11 || v9 && !v12)
  {
    uint64_t v14 = [(AXUISettingsTouchAccommodationsController *)self _swipeGesturesSpecifiers];
    [(AXUISettingsTouchAccommodationsController *)self removeContiguousSpecifiers:v14 animated:1];
  }
  if (v10 || !v11)
  {
    if (v9 || !v13) {
      return;
    }
    id v16 = [(AXUISettingsTouchAccommodationsController *)self _swipeGesturesSpecifiers];
    [(AXUISettingsTouchAccommodationsController *)self addSpecifiersFromArray:v16 animated:1];
  }
  else
  {
    id v16 = [(AXUISettingsTouchAccommodationsController *)self _swipeGesturesSpecifiers];
    [(AXUISettingsTouchAccommodationsController *)self insertContiguousSpecifiers:v16 atIndex:v3 animated:1];
  }
}

- (Class)touchAccomodationsSwipeGestureViewControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_swipeGesturesSpecifiers
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(AXUISettingsTouchAccommodationsController *)self swipeGesturesSpecifiers];

  if (!v3)
  {
    BOOL v4 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
    id v6 = AXUILocalizedStringForKey(@"ALLOW_SWIPE_GESTURES");
    id v7 = objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__swipeGesturesEnabled_, -[AXUISettingsTouchAccommodationsController touchAccomodationsSwipeGestureViewControllerClass](self, "touchAccomodationsSwipeGestureViewControllerClass"), 2, 0);

    v11[0] = v4;
    v11[1] = v7;
    unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(AXUISettingsTouchAccommodationsController *)self setSwipeGesturesSpecifiers:v8];
  }
  BOOL v9 = [(AXUISettingsTouchAccommodationsController *)self swipeGesturesSpecifiers];
  return v9;
}

- (id)_swipeGesturesEnabled:(id)a3
{
  if ([(AXUISettingsTouchAccommodationsController *)self touchAccommodationsAllowsSwipeGesturesToBypass])
  {
    unint64_t v3 = @"ON";
  }
  else
  {
    unint64_t v3 = @"OFF";
  }
  BOOL v4 = AXUILocalizedStringForKey(v3);
  return v4;
}

- (void)_updateDelayPickerSpecifier:(id)a3 additionalSpecifiers:(id)a4 afterSpecifierWithIdentifier:(id)a5 enabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = [(AXUISettingsTouchAccommodationsController *)self specifiers];
  int v13 = [v12 containsObject:v19];

  if (v6)
  {
    if (v13) {
      goto LABEL_7;
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithObject:v19];
    [v14 addObjectsFromArray:v10];
    [(AXUISettingsTouchAccommodationsController *)self insertContiguousSpecifiers:v14 afterSpecifierID:v11 animated:1];
  }
  else
  {
    if (!v13) {
      goto LABEL_7;
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithObject:v19];
    [v14 addObjectsFromArray:v10];
    uint64_t v15 = [(AXUISettingsTouchAccommodationsController *)self indexPathForSpecifier:v19];
    id v16 = [(AXUISettingsTouchAccommodationsController *)self table];
    v17 = [v16 cellForRowAtIndexPath:v15];

    v18 = [v17 nameTextField];
    [v18 resignFirstResponder];

    [(AXUISettingsTouchAccommodationsController *)self removeContiguousSpecifiers:v14 animated:1];
  }

LABEL_7:
}

- (id)_durationSpecifiersWithName:(id)a3 groupIdentifier:(id)a4 footerText:(id)a5 set:(SEL)a6 get:(SEL)a7 previousSpecifierIdentifier:(id)a8 conditionalSpecifiers:(id)a9
{
  id v14 = a9;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CA48];
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [v15 array];
  v21 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v19];
  [v21 setProperty:v18 forKey:*MEMORY[0x1E4F93188]];

  [v21 setProperty:v17 forKey:*MEMORY[0x1E4F93170]];
  [v20 addObject:v21];
  id v22 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v19 target:self set:a6 get:a7 detail:0 cell:6 edit:0];

  [v22 setIdentifier:v16];
  [v20 addObject:v22];
  if (objc_msgSend((id)-[AXUISettingsTouchAccommodationsController performSelector:withObject:](self, "performSelector:withObject:", a7, 0), "BOOLValue"))objc_msgSend(v20, "addObjectsFromArray:", v14); {

  }
  return v20;
}

- (BOOL)touchAccommodationsEnabled
{
  return self->_touchAccommodationsEnabled;
}

- (void)setTouchAccommodationsEnabled:(BOOL)a3
{
  self->_touchAccommodationsEnabled = a3;
}

- (BOOL)touchAccommodationsAreConfigured
{
  return self->_touchAccommodationsAreConfigured;
}

- (BOOL)touchAccommodationsHoldDurationEnabled
{
  return self->_touchAccommodationsHoldDurationEnabled;
}

- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3
{
  self->_touchAccommodationsHoldDurationEnabled = a3;
}

- (BOOL)touchAccommodationsIgnoreRepeatEnabled
{
  return self->_touchAccommodationsIgnoreRepeatEnabled;
}

- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3
{
  self->_touchAccommodationsIgnoreRepeatEnabled = a3;
}

- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass
{
  return self->_touchAccommodationsAllowsSwipeGesturesToBypass;
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
  self->_touchAccommodationsAllowsSwipeGesturesToBypass = a3;
}

- (double)touchAccommodationsHoldDuration
{
  return self->_touchAccommodationsHoldDuration;
}

- (void)setTouchAccommodationsHoldDuration:(double)a3
{
  self->_touchAccommodationsHoldDuration = a3;
}

- (double)touchAccommodationsIgnoreRepeatDuration
{
  return self->_touchAccommodationsIgnoreRepeatDuration;
}

- (void)setTouchAccommodationsIgnoreRepeatDuration:(double)a3
{
  self->_touchAccommodationsIgnoreRepeatDuration = a3;
}

- (double)touchAccommodationsTapActivationTimeout
{
  return self->_touchAccommodationsTapActivationTimeout;
}

- (void)setTouchAccommodationsTapActivationTimeout:(double)a3
{
  self->_touchAccommodationsTapActivationTimeout = a3;
}

- (int64_t)touchAccommodationsTapActivationMethod
{
  return self->_touchAccommodationsTapActivationMethod;
}

- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3
{
  self->_touchAccommodationsTapActivationMethod = a3;
}

- (NSArray)tapTimeoutSpecifiers
{
  return self->_tapTimeoutSpecifiers;
}

- (void)setTapTimeoutSpecifiers:(id)a3
{
}

- (PSSpecifier)holdDurationPickerSpecifier
{
  return self->_holdDurationPickerSpecifier;
}

- (void)setHoldDurationPickerSpecifier:(id)a3
{
}

- (PSSpecifier)ignoreRepeatPickerSpecifier
{
  return self->_ignoreRepeatPickerSpecifier;
}

- (void)setIgnoreRepeatPickerSpecifier:(id)a3
{
}

- (NSArray)swipeGesturesSpecifiers
{
  return self->_swipeGesturesSpecifiers;
}

- (void)setSwipeGesturesSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeGesturesSpecifiers, 0);
  objc_storeStrong((id *)&self->_ignoreRepeatPickerSpecifier, 0);
  objc_storeStrong((id *)&self->_holdDurationPickerSpecifier, 0);
  objc_storeStrong((id *)&self->_tapTimeoutSpecifiers, 0);
}

@end