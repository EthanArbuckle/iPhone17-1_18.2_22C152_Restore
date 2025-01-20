@interface MessageViewStatusIndicatorManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateImageViews;
@end

@implementation MessageViewStatusIndicatorManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MessageViewStatusIndicatorManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageViewStatusIndicatorManager", @"updateImageViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessageViewStatusIndicatorManager", @"statusIndicatorImageViews", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)MessageViewStatusIndicatorManagerAccessibility;
  [(MessageViewStatusIndicatorManagerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(MessageViewStatusIndicatorManagerAccessibility *)self safeValueForKey:@"statusIndicatorImageViews"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 enumerateObjectsUsingBlock:&__block_literal_global_11];
}

void __92__MessageViewStatusIndicatorManagerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsAccessibilityElement:1];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CF18]];
}

- (void)updateImageViews
{
  v3.receiver = self;
  v3.super_class = (Class)MessageViewStatusIndicatorManagerAccessibility;
  [(MessageViewStatusIndicatorManagerAccessibility *)&v3 updateImageViews];
  [(MessageViewStatusIndicatorManagerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end