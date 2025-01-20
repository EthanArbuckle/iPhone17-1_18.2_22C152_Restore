@interface PKTrailingAccessoryLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PKTrailingAccessoryLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKTrailingAccessoryLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PKTrailingAccessoryLabelAccessibility;
  [(PKTrailingAccessoryLabelAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(PKTrailingAccessoryLabelAccessibility *)self subviews];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __83__PKTrailingAccessoryLabelAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265140D60;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __83__PKTrailingAccessoryLabelAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "setAccessibilityTraits:", objc_msgSend(*(id *)(a1 + 32), "accessibilityTraits"));
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKTrailingAccessoryLabelAccessibility;
  [(PKTrailingAccessoryLabelAccessibility *)&v3 layoutSubviews];
  [(PKTrailingAccessoryLabelAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end