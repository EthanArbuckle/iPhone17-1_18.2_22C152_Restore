@interface AXUIBridgeVoiceOverBrailleAlertIntervalController
- (double)numericalPreferenceValue;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
- (void)viewDidLoad;
@end

@implementation AXUIBridgeVoiceOverBrailleAlertIntervalController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AXUIBridgeVoiceOverBrailleAlertIntervalController;
  [(AXUISettingsNumericalPickerViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_nanoSettingsChanged_ name:@"AXNanoPreferencesSettingsChangedNotification" object:0];
}

- (double)numericalPreferenceValue
{
  v2 = +[AccessibilityBridgeBaseController accessibilityDomainAccessor];
  v3 = [v2 objectForKey:*MEMORY[0x263F22B88]];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = *MEMORY[0x263F21428];
  }

  return v5;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  double v4 = objc_opt_class();
  id v5 = [NSNumber numberWithDouble:a3];
  [v4 setGizmoAccessibilityPref:v5 forKey:*MEMORY[0x263F22B88]];
}

@end