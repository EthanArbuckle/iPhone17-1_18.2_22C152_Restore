@interface BuddyFinishedControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyFinishedControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyFinishedController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BuddyFinishedController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"BuddyFinishedController" hasProperty:@"instructionalLabel" withType:"@"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)BuddyFinishedControllerAccessibility;
  [(BuddyFinishedControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BuddyFinishedControllerAccessibility *)self safeValueForKey:@"instructionalLabel"];
  v4 = v3;
  if (v3)
  {
    [v3 setIsAccessibilityElement:1];
    [v4 setAccessibilityRespondsToUserInteraction:1];
    v7[0] = *MEMORY[0x263F226A0];
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v4 _iosAccessibilitySetValue:v5 forAttribute:12015];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BuddyFinishedControllerAccessibility;
  [(BuddyFinishedControllerAccessibility *)&v4 viewDidAppear:a3];
  [(BuddyFinishedControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end