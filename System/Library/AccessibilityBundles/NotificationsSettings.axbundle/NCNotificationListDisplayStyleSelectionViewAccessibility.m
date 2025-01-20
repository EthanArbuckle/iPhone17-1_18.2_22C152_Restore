@interface NCNotificationListDisplayStyleSelectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCNotificationListDisplayStyleSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationListDisplayStyleSelectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListDisplayStyleSelectionView", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListDisplayStyleSelectionView", @"encapsulatedSelectionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListDisplayStyleSelectionView", @"selectionLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(NCNotificationListDisplayStyleSelectionViewAccessibility *)self safeBoolForKey:@"isSelected"])id v3 = @"encapsulatedSelectionLabel"; {
  else
  }
    id v3 = @"selectionLabel";
  v4 = [(NCNotificationListDisplayStyleSelectionViewAccessibility *)self safeValueForKey:v3];
  v5 = [v4 accessibilityLabel];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationListDisplayStyleSelectionViewAccessibility;
  unint64_t v3 = [(NCNotificationListDisplayStyleSelectionViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(NCNotificationListDisplayStyleSelectionViewAccessibility *)self safeBoolForKey:@"isSelected"];
  v5 = (void *)MEMORY[0x263F1CF38];
  if (!v4) {
    v5 = (void *)MEMORY[0x263F1CEE8];
  }
  return *v5 | v3;
}

@end