@interface NCNotificationListSectionRevealHintViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsHintTitleVisible;
- (BOOL)accessibilityRespondsToUserInteraction;
- (id)accessibilityLabel;
@end

@implementation NCNotificationListSectionRevealHintViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListSectionRevealHintView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationListSectionRevealHintView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListSectionRevealHintView", @"revealHintTitle", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(NCNotificationListSectionRevealHintViewAccessibility *)self safeValueForKey:@"revealHintTitle"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (BOOL)_accessibilityIsHintTitleVisible
{
  v2 = [(NCNotificationListSectionRevealHintViewAccessibility *)self safeUIViewForKey:@"revealHintTitle"];
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

@end