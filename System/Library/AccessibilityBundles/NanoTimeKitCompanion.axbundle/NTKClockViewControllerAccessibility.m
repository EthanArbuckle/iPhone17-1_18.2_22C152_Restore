@interface NTKClockViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_endFaceLibraryControllerPresentation;
- (void)_showLibraryViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4;
@end

@implementation NTKClockViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKClockViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKClockViewController", @"_showLibraryViewControllerAnimated: withCompletion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKClockViewController", @"_endFaceLibraryControllerPresentation", "v", 0);
  [v3 validateClass:@"NTKComplicationControllerCache"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"NTKComplicationControllerCache", @"sharedCache", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NTKClockViewControllerAccessibility;
  [(NTKClockViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  v2 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedCache"];
  [v2 _accessibilityLoadAccessibilityInformation];
}

- (void)_showLibraryViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NTKClockViewControllerAccessibility;
  [(NTKClockViewControllerAccessibility *)&v4 _showLibraryViewControllerAnimated:a3 withCompletion:a4];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_endFaceLibraryControllerPresentation
{
  v2.receiver = self;
  v2.super_class = (Class)NTKClockViewControllerAccessibility;
  [(NTKClockViewControllerAccessibility *)&v2 _endFaceLibraryControllerPresentation];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end