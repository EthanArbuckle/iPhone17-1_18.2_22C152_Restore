@interface DOCItemRenameTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsClearButtonInstalled;
- (BOOL)isAccessibilityElement;
- (int64_t)_accessibilitySortPriority;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupClearButton;
- (void)didMoveToSuperview;
- (void)installClearButton;
@end

@implementation DOCItemRenameTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Files.DOCItemRenameTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Files.DOCItemRenameTextView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCItemRenameTextView", @"accessibilityClearButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCItemRenameTextView", @"installClearButton", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)DOCItemRenameTextViewAccessibility;
  [(DOCItemRenameTextViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(DOCItemRenameTextViewAccessibility *)self _axMarkupClearButton];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)DOCItemRenameTextViewAccessibility;
  [(DOCItemRenameTextViewAccessibility *)&v2 didMoveToSuperview];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __56__DOCItemRenameTextViewAccessibility_didMoveToSuperview__block_invoke(uint64_t a1)
{
}

- (void)installClearButton
{
  v3.receiver = self;
  v3.super_class = (Class)DOCItemRenameTextViewAccessibility;
  [(DOCItemRenameTextViewAccessibility *)&v3 installClearButton];
  [(DOCItemRenameTextViewAccessibility *)self _axMarkupClearButton];
}

- (void)_axMarkupClearButton
{
  id v3 = [(DOCItemRenameTextViewAccessibility *)self safeValueForKey:@"accessibilityClearButton"];
  objc_super v2 = accessibilityLocalizedString(@"text.view.clear");
  [v3 setAccessibilityLabel:v2];
}

- (int64_t)_accessibilitySortPriority
{
  if ([(DOCItemRenameTextViewAccessibility *)self _axIsClearButtonInstalled]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)DOCItemRenameTextViewAccessibility;
  return [(DOCItemRenameTextViewAccessibility *)&v4 _accessibilitySortPriority];
}

- (BOOL)_axIsClearButtonInstalled
{
  id v3 = [(DOCItemRenameTextViewAccessibility *)self safeUIViewForKey:@"superview"];
  objc_super v4 = [v3 subviews];
  v5 = [(DOCItemRenameTextViewAccessibility *)self safeValueForKey:@"accessibilityClearButton"];
  char v6 = [v4 containsObject:v5];

  return v6;
}

@end