@interface AutoAnswerCallsController
- (AutoAnswerCallsController)init;
- (BOOL)numericalPreferenceEnabled;
- (BOOL)userCanDisableNumericalPreference;
- (NPSDomainAccessor)domainAccessor;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedPickerFooterText;
- (id)localizedTitle;
- (void)dealloc;
- (void)setDomainAccessor:(id)a3;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation AutoAnswerCallsController

- (AutoAnswerCallsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AutoAnswerCallsController;
  v2 = [(AXUISettingsSetupCapableListController *)&v8 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadAutoAnswerValues, @"NanoAccessibilityDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    id v4 = objc_alloc(MEMORY[0x263F57520]);
    v5 = (void *)[v4 initWithDomain:*MEMORY[0x263F8B0F8]];
    [(AutoAnswerCallsController *)v2 setDomainAccessor:v5];

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NanoAccessibilityDefaultsChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)AutoAnswerCallsController;
  [(AXUISettingsSetupCapableListController *)&v4 dealloc];
}

- (double)maximumValue
{
  return *MEMORY[0x263F21410];
}

- (double)minimumValue
{
  return *MEMORY[0x263F21418];
}

- (double)stepAmount
{
  return *MEMORY[0x263F21420];
}

- (double)numericalPreferenceValue
{
  char v6 = 0;
  v2 = [(AutoAnswerCallsController *)self domainAccessor];
  [v2 floatForKey:*MEMORY[0x263F22A60] keyExistsAndHasValidFormat:&v6];
  float v4 = v3;

  double result = v4;
  if (!v6) {
    return 3.0;
  }
  return result;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v5 = [(AutoAnswerCallsController *)self domainAccessor];
  uint64_t v6 = *MEMORY[0x263F22A60];
  [v5 setDouble:*MEMORY[0x263F22A60] forKey:a3];

  v7 = [(AutoAnswerCallsController *)self domainAccessor];
  id v8 = (id)[v7 synchronize];

  v9 = objc_opt_new();
  v10 = [(AutoAnswerCallsController *)self domainAccessor];
  v11 = [v10 domain];
  v12 = (void *)MEMORY[0x263EFFA08];
  v15[0] = v6;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v14 = [v12 setWithArray:v13];
  [v9 synchronizeNanoDomain:v11 keys:v14];
}

- (BOOL)numericalPreferenceEnabled
{
  v2 = [(AutoAnswerCallsController *)self domainAccessor];
  char v3 = [v2 BOOLForKey:*MEMORY[0x263F22A58]];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x263EF8340];
  v5 = [(AutoAnswerCallsController *)self domainAccessor];
  uint64_t v6 = *MEMORY[0x263F22A58];
  [v5 setBool:v3 forKey:*MEMORY[0x263F22A58]];

  v7 = [(AutoAnswerCallsController *)self domainAccessor];
  id v8 = (id)[v7 synchronize];

  v9 = objc_opt_new();
  v10 = [(AutoAnswerCallsController *)self domainAccessor];
  v11 = [v10 domain];
  v12 = (void *)MEMORY[0x263EFFA08];
  v15[0] = v6;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v14 = [v12 setWithArray:v13];
  [v9 synchronizeNanoDomain:v11 keys:v14];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (id)localizedTitle
{
  return settingsLocString(@"AutoAnswerCalls", @"AccessibilitySettings");
}

- (id)localizedPickerFooterText
{
  return settingsLocString(@"AutoAnswerFooterText", @"AccessibilitySettings");
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end