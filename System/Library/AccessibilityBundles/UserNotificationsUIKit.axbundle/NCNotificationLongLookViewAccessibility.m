@interface NCNotificationLongLookViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityBannerIsSticky;
- (BOOL)accessibilityPerformEscape;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation NCNotificationLongLookViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationLongLookView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCDimmableView"];
  [v3 validateClass:@"NCNotificationViewController" hasInstanceVariable:@"_notificationRequest" withType:"NCNotificationRequest"];
  [v3 validateClass:@"NCNotificationLongLookView" isKindOfClass:@"PLExpandedPlatterView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandedPlatterView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"options", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationOptions", @"dismissAutomatically", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationLongLookViewController", @"contentProviderDismissCustomContent:animated:", "v", "@", "B", 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 8;
}

- (BOOL)_accessibilityBannerIsSticky
{
  v2 = [(NCNotificationLongLookViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456680B0](@"NCDimmableView", a2)];
  id v3 = [MEMORY[0x263F1CB68] viewControllerForView:v2];
  v4 = [v3 safeValueForKey:@"_notificationRequest"];
  v5 = __UIAccessibilitySafeClass();

  v6 = [v5 safeValueForKey:@"options"];
  v7 = __UIAccessibilitySafeClass();

  LODWORD(v6) = [v7 safeBoolForKey:@"dismissAutomatically"] ^ 1;
  return (char)v6;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

void __69__NCNotificationLongLookViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v1 contentProviderDismissCustomContent:0 animated:1];
}

@end