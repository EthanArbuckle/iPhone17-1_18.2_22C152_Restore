@interface BuddySceneDelegateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation BuddySceneDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddySceneDelegate";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BuddySceneDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BuddySceneDelegate", @"scene:willConnectToSession:options:", "v", "@", "@", "@", 0);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BuddySceneDelegateAccessibility;
  [(BuddySceneDelegateAccessibility *)&v13 scene:v8 willConnectToSession:v9 options:v10];
  objc_opt_class();
  v11 = [NSClassFromString(&cfstr_Buddyapplicati.isa) safeValueForKey:@"setupController"];
  v12 = __UIAccessibilityCastAsClass();

  [v12 _accessibilityLoadAccessibilityInformation];
}

@end