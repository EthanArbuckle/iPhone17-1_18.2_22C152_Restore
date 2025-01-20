@interface STSetupAssistantPosedDeviceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation STSetupAssistantPosedDeviceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STSetupAssistantPosedDeviceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)STSetupAssistantPosedDeviceViewControllerAccessibility;
  [(STSetupAssistantPosedDeviceViewControllerAccessibility *)&v6 viewDidLoad];
  v3 = [(STSetupAssistantPosedDeviceViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4 = AXLocStringKeyForModel();
  v5 = accessibilityLocalizedString(v4);
  [v3 setAccessibilityLabel:v5];

  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityRespondsToUserInteraction:0];
  [v3 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F7A9400];
}

@end