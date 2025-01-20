@interface VTUISiriEducationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityHideVideoPlayer;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VTUISiriEducationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VTUISiriEducationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VTUISiriEducationViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"VTUISiriEducationViewController" hasInstanceVariable:@"_playerViewController" withType:"AVPlayerViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VTUISiriEducationViewControllerAccessibility;
  [(VTUISiriEducationViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(VTUISiriEducationViewControllerAccessibility *)self _accessibilityHideVideoPlayer];
}

- (void)_accessibilityHideVideoPlayer
{
  objc_opt_class();
  objc_super v3 = [(VTUISiriEducationViewControllerAccessibility *)self safeValueForKey:@"_playerViewController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 view];
  [v5 setAccessibilityElementsHidden:1];

  v6 = [v4 view];
  [v6 setIsAccessibilityElement:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VTUISiriEducationViewControllerAccessibility;
  [(VTUISiriEducationViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(VTUISiriEducationViewControllerAccessibility *)self _accessibilityHideVideoPlayer];
}

@end