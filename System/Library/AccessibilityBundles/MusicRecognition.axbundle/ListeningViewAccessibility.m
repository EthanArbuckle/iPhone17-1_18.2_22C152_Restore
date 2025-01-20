@interface ListeningViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ListeningViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicRecognition.ListeningView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)ListeningViewAccessibility;
  [(ListeningViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(ListeningViewAccessibility *)self safeSwiftValueForKey:@"cancelButton"];
  v4 = accessibilityLocalizedString(@"ACCESSIBILITY_STOP_LISTENING");
  [v3 setAccessibilityLabel:v4];
}

@end