@interface OBPrivacySplashControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetIconProperties:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation OBPrivacySplashControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBPrivacySplashController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBPrivacySplashController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"OBPrivacySplashController" isKindOfClass:@"OBWelcomeController"];
  [v3 validateClass:@"OBWelcomeController" hasInstanceVariable:@"_headerView" withType:"OBHeaderView"];
  [v3 validateClass:@"OBHeaderView" hasInstanceVariable:@"_imageView" withType:"OBImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)OBPrivacySplashControllerAccessibility;
  [(OBPrivacySplashControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(OBPrivacySplashControllerAccessibility *)self safeValueForKey:@"_headerView"];
  v4 = [v3 safeUIViewForKey:@"_imageView"];

  [(OBPrivacySplashControllerAccessibility *)self _axSetIconProperties:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OBPrivacySplashControllerAccessibility;
  [(OBPrivacySplashControllerAccessibility *)&v3 viewDidLoad];
  [(OBPrivacySplashControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBPrivacySplashControllerAccessibility;
  [(OBPrivacySplashControllerAccessibility *)&v8 viewDidAppear:a3];
  v4 = [(OBPrivacySplashControllerAccessibility *)self safeUIViewForKey:@"view"];
  objc_super v5 = [v4 _accessibilityDescendantOfType:NSClassFromString(&cfstr_Obprivacysplas_2.isa)];

  [v5 _accessibilityLoadAccessibilityInformation];
  v6 = [(OBPrivacySplashControllerAccessibility *)self safeValueForKey:@"_headerView"];
  v7 = [v6 safeUIViewForKey:@"_imageView"];

  if (v7) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v7);
  }
}

- (void)_axSetIconProperties:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setIsAccessibilityElement:1];
    objc_super v3 = accessibilityLocalizedString(@"privacy.icon");
    [v4 setAccessibilityLabel:v3];

    [v4 setAccessibilityTraits:*MEMORY[0x263F21A90]];
  }
}

@end