@interface SFUnifiedBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation SFUnifiedBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFUnifiedBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedBarButton", @"initWithImage:action:", "@", "@?", 0);
  [v3 validateClass:@"SFUnifiedBarButton" hasInstanceVariable:@"_buttonView" withType:"SFUnifiedBarButtonView"];
}

- (void)setAccessibilityLabel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFUnifiedBarButtonAccessibility;
  id v4 = a3;
  [(SFUnifiedBarButtonAccessibility *)&v6 setAccessibilityLabel:v4];
  v5 = [(SFUnifiedBarButtonAccessibility *)self safeValueForKey:@"_buttonView", v6.receiver, v6.super_class];
  [v5 setAccessibilityLabel:v4];
}

@end