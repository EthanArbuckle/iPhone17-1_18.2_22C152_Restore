@interface FlyoverTrayHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupViews;
@end

@implementation FlyoverTrayHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FlyoverTrayHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FlyoverTrayHeader", @"_setupViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FlyoverTrayHeader", @"button", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)FlyoverTrayHeaderAccessibility;
  [(FlyoverTrayHeaderAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = AXMapsLocString(@"CLOSE_BUTTON");
  v4 = [(FlyoverTrayHeaderAccessibility *)self safeUIViewForKey:@"button"];
  [v4 setAccessibilityLabel:v3];
}

- (void)_setupViews
{
  v3.receiver = self;
  v3.super_class = (Class)FlyoverTrayHeaderAccessibility;
  [(FlyoverTrayHeaderAccessibility *)&v3 _setupViews];
  [(FlyoverTrayHeaderAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end