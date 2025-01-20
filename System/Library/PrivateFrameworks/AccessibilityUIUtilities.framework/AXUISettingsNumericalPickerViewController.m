@interface AXUISettingsNumericalPickerViewController
- (BOOL)infiniteTimeEnabled;
- (BOOL)numericalPreferenceEnabled;
- (BOOL)shouldDisablePreferenceEntirely;
- (BOOL)shouldSaveOnExit;
- (BOOL)supportsInfiniteTime;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (double)valueForSpecifier:(id)a3;
- (id)_delayPickerFooterSpecifier;
- (id)_delayPickerSpecifier;
- (id)delayEnabled:(id)a3;
- (id)infiniteTime:(id)a3;
- (id)localizedFooterText;
- (id)localizedPickerFooterText;
- (id)localizedTextForValue:(double)a3;
- (id)localizedTitle;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_updateEnabledStateForDelay;
- (void)setDelayEnabled:(id)a3 specifier:(id)a4;
- (void)setInfiniteTimeEnabled:(id)a3 specifier:(id)a4;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXUISettingsNumericalPickerViewController

- (double)maximumValue
{
  return 0.0;
}

- (BOOL)supportsInfiniteTime
{
  return 0;
}

- (double)minimumValue
{
  return 0.0;
}

- (double)numericalPreferenceValue
{
  return 0.0;
}

- (BOOL)numericalPreferenceEnabled
{
  return 0;
}

- (BOOL)userCanDisableNumericalPreference
{
  return 0;
}

- (id)localizedFooterText
{
  return 0;
}

- (id)localizedTitle
{
  return &stru_1F1F0EB90;
}

- (id)localizedPickerFooterText
{
  return &stru_1F1F0EB90;
}

- (double)stepAmount
{
  return 0.05;
}

- (BOOL)shouldDisablePreferenceEntirely
{
  return 0;
}

- (BOOL)shouldSaveOnExit
{
  return 0;
}

- (id)localizedTextForValue:(double)a3
{
  v3 = [NSNumber numberWithDouble:a3];
  v4 = AXFormatNumberWithOptions();

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsNumericalPickerViewController;
  [(AXUISettingsSetupCapableListController *)&v3 viewDidLoad];
  self->_cachedNumericalValue = 3.40282347e38;
  [(AXUISettingsNumericalPickerViewController *)self _updateEnabledStateForDelay];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    if ([(AXUISettingsNumericalPickerViewController *)self userCanDisableNumericalPreference])
    {
      BOOL v6 = [(AXUISettingsNumericalPickerViewController *)self shouldDisablePreferenceEntirely];
      v7 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      v8 = [(AXUISettingsNumericalPickerViewController *)self localizedFooterText];
      uint64_t v9 = *MEMORY[0x1E4F93170];
      [v7 setProperty:v8 forKey:*MEMORY[0x1E4F93170]];

      [v5 addObject:v7];
      v10 = (void *)MEMORY[0x1E4F92E70];
      v11 = [(AXUISettingsNumericalPickerViewController *)self localizedTitle];
      v12 = [v10 preferenceSpecifierNamed:v11 target:self set:sel_setDelayEnabled_specifier_ get:sel_delayEnabled_ detail:0 cell:6 edit:0];

      [v12 setIdentifier:@"NumericalPreferenceSwitcherIdentifier"];
      if (v6) {
        [v12 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
      }
      [v5 addObject:v12];
      v13 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      [v13 setIdentifier:@"NumericalPreferencePickerGroupIdentifier"];
      [v5 addObject:v13];
      if ([(AXUISettingsNumericalPickerViewController *)self numericalPreferenceEnabled]
        && !v6)
      {
        v14 = [(AXUISettingsNumericalPickerViewController *)self localizedPickerFooterText];
        [v13 setProperty:v14 forKey:v9];

        v15 = [(AXUISettingsNumericalPickerViewController *)self _delayPickerSpecifier];
        [v5 addObject:v15];
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F92E70];
      v17 = [(AXUISettingsNumericalPickerViewController *)self localizedTitle];
      v7 = [v16 groupSpecifierWithName:v17];

      [v7 setIdentifier:@"NumericalPreferencePickerGroupIdentifier"];
      v12 = [(AXUISettingsNumericalPickerViewController *)self localizedFooterText];
      if (v12) {
        [v7 setProperty:v12 forKey:*MEMORY[0x1E4F93170]];
      }
      [v5 addObject:v7];
      v13 = [(AXUISettingsNumericalPickerViewController *)self _delayPickerSpecifier];
      [v5 addObject:v13];
    }

    if ([(AXUISettingsNumericalPickerViewController *)self supportsInfiniteTime])
    {
      v18 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      [v5 addObject:v18];
      v19 = (void *)MEMORY[0x1E4F92E70];
      v20 = accessibilityLocalizedString(@"infinite.time.for.duration");
      v21 = [v19 preferenceSpecifierNamed:v20 target:self set:sel_setInfiniteTimeEnabled_specifier_ get:sel_infiniteTime_ detail:0 cell:6 edit:0];

      [v21 setIdentifier:@"NumericalPreferenceInfiniteTimeDurationIdentifier"];
      [v5 addObject:v21];
    }
    v22 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_updateEnabledStateForDelay
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = *MEMORY[0x1E4F93130];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        int v11 = [v10 isEqualToString:@"NumericalPreferencePickerIdentifier"];

        if (v11)
        {
          v12 = objc_msgSend(NSNumber, "numberWithInt:", -[AXUISettingsNumericalPickerViewController infiniteTimeEnabled](self, "infiniteTimeEnabled") ^ 1);
          [v9 setProperty:v12 forKey:v7];

          [(AXUISettingsNumericalPickerViewController *)self reloadSpecifier:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)setInfiniteTimeEnabled:(id)a3 specifier:(id)a4
{
  -[AXUISettingsNumericalPickerViewController setInfiniteTimeEnabled:](self, "setInfiniteTimeEnabled:", [a3 BOOLValue]);
  [(AXUISettingsNumericalPickerViewController *)self _updateEnabledStateForDelay];
}

- (id)infiniteTime:(id)a3
{
  id v3 = NSNumber;
  BOOL v4 = [(AXUISettingsNumericalPickerViewController *)self infiniteTimeEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (BOOL)infiniteTimeEnabled
{
  return 0;
}

- (void)setDelayEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  [(AXUISettingsNumericalPickerViewController *)self setNumericalPreferenceEnabledFromUser:v5];
  if (v5)
  {
    uint64_t v6 = [(AXUISettingsNumericalPickerViewController *)self _delayPickerSpecifier];
    [(AXUISettingsNumericalPickerViewController *)self insertSpecifier:v6 afterSpecifierID:@"NumericalPreferencePickerGroupIdentifier" animated:1];

    if ([(AXUISettingsNumericalPickerViewController *)self shouldSaveOnExit]
      && fabs(self->_cachedNumericalValue + -3.40282347e38) >= 2.22044605e-16)
    {
      uint64_t v7 = [(AXUISettingsNumericalPickerViewController *)self _delayPickerFooterSpecifier];
      [(AXUISettingsNumericalPickerViewController *)self insertSpecifier:v7 atIndex:0 animated:1];
    }
    v8 = [(AXUISettingsNumericalPickerViewController *)self specifierForID:@"NumericalPreferencePickerGroupIdentifier"];
    uint64_t v9 = [(AXUISettingsNumericalPickerViewController *)self localizedPickerFooterText];
    [v8 setProperty:v9 forKey:*MEMORY[0x1E4F93170]];

    [(AXUISettingsNumericalPickerViewController *)self reloadSpecifier:v8];
  }
  else
  {
    v10 = [(AXUISettingsNumericalPickerViewController *)self specifierForID:@"NumericalPreferencePickerIdentifier"];
    v8 = [(AXUISettingsNumericalPickerViewController *)self indexPathForSpecifier:v10];

    int v11 = [(AXUISettingsNumericalPickerViewController *)self table];
    v12 = [v11 cellForRowAtIndexPath:v8];

    long long v13 = [v12 nameTextField];
    [v13 resignFirstResponder];

    [(AXUISettingsNumericalPickerViewController *)self removeSpecifierID:@"NumericalPreferencePickerIdentifier" animated:1];
    [(AXUISettingsNumericalPickerViewController *)self removeSpecifierID:@"NumericalPreferencePickerDelayFooterIdentifier" animated:1];
    long long v14 = [(AXUISettingsNumericalPickerViewController *)self specifierForID:@"NumericalPreferencePickerGroupIdentifier"];
    [v14 setProperty:&stru_1F1F0EB90 forKey:*MEMORY[0x1E4F93170]];
    [(AXUISettingsNumericalPickerViewController *)self reloadSpecifier:v14];
  }
  UIAccessibilityNotifications v15 = *MEMORY[0x1E4FB2470];
  UIAccessibilityPostNotification(v15, 0);
}

- (id)delayEnabled:(id)a3
{
  if ([(AXUISettingsNumericalPickerViewController *)self shouldDisablePreferenceEntirely])
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    BOOL v4 = objc_msgSend(NSNumber, "numberWithBool:", -[AXUISettingsNumericalPickerViewController numericalPreferenceEnabled](self, "numericalPreferenceEnabled"));
  }
  return v4;
}

- (id)_delayPickerSpecifier
{
  v2 = objc_msgSend(MEMORY[0x1E4F92E70], "ax_stepperSpecifierWithDelegate:", self);
  [v2 setIdentifier:@"NumericalPreferencePickerIdentifier"];
  return v2;
}

- (id)_delayPickerFooterSpecifier
{
  v2 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"NumericalPreferencePickerDelayFooterIdentifier"];
  id v3 = accessibilityLocalizedString(@"numerical.value.saved.later");
  [v2 setProperty:v3 forKey:*MEMORY[0x1E4F93170]];

  return v2;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsNumericalPickerViewController;
  [(AXUISettingsNumericalPickerViewController *)&v4 viewWillDisappear:a3];
  if ([(AXUISettingsNumericalPickerViewController *)self shouldSaveOnExit])
  {
    if (fabs(self->_cachedNumericalValue + -3.40282347e38) >= 2.22044605e-16) {
      -[AXUISettingsNumericalPickerViewController setNumericalPreferenceValueFromUser:](self, "setNumericalPreferenceValueFromUser:");
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXUISettingsNumericalPickerViewController;
  objc_super v4 = [(AXUISettingsNumericalPickerViewController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (double)valueForSpecifier:(id)a3
{
  double result = self->_cachedNumericalValue;
  if (fabs(result + -3.40282347e38) < 2.22044605e-16) {
    [(AXUISettingsNumericalPickerViewController *)self numericalPreferenceValue];
  }
  return result;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v6 = a3;
  if ([(AXUISettingsNumericalPickerViewController *)self shouldSaveOnExit])
  {
    self->_cachedNumericalValue = a4;
    objc_super v7 = [(AXUISettingsNumericalPickerViewController *)self specifierForID:@"NumericalPreferencePickerDelayFooterIdentifier"];

    if (!v7)
    {
      v8 = [(AXUISettingsNumericalPickerViewController *)self _delayPickerFooterSpecifier];
      [(AXUISettingsNumericalPickerViewController *)self insertSpecifier:v8 atIndex:0 animated:1];
    }
  }
  else
  {
    [(AXUISettingsNumericalPickerViewController *)self setNumericalPreferenceValueFromUser:a4];
  }
  id v9 = v6;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__AXUISettingsNumericalPickerViewController_specifier_setValue___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x1E4FB2418];
  id v2 = [*(id *)(a1 + 32) stringValueForSpecifier:*(void *)(a1 + 40)];
  UIAccessibilityPostNotification(v1, v2);
}

- (id)stringValueForSpecifier:(id)a3
{
  [(AXUISettingsNumericalPickerViewController *)self valueForSpecifier:a3];
  return -[AXUISettingsNumericalPickerViewController localizedTextForValue:](self, "localizedTextForValue:");
}

@end