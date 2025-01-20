@interface NCNotificationAppSectionListSummarizedContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCNotificationAppSectionListSummarizedContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationAppSectionListSummarizedContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationAppSectionListSummarizedContentView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationAppSectionListSummarizedContentView", @"count", "Q", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(NCNotificationAppSectionListSummarizedContentViewAccessibility *)self safeValueForKeyPath:@"title"];
  v4 = NSString;
  v5 = accessibilityLocalizedString(@"digest.notification.count");
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, -[NCNotificationAppSectionListSummarizedContentViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", @"count"));

  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"notification.cell.collapsed.hint");
}

@end