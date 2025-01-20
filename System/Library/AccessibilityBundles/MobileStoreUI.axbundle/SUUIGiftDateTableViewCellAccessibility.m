@interface SUUIGiftDateTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIGiftDateTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIGiftDateTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIGiftDateTableViewCell", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIGiftDateTableViewCell", @"date", "@", 0);
  [v3 validateClass:@"SUUIGiftDateTableViewCell" hasInstanceVariable:@"_datePicker" withType:"UIDatePicker"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(SUUIGiftDateTableViewCellAccessibility *)self safeBoolForKey:@"isChecked"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityLabel
{
  return (id)[(SUUIGiftDateTableViewCellAccessibility *)self safeValueForKey:@"label"];
}

- (id)accessibilityValue
{
  uint64_t v2 = [(SUUIGiftDateTableViewCellAccessibility *)self safeValueForKey:@"_datePicker"];
  int v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"send.gift.date.hint");
}

- (id)_accessibilitySupplementaryFooterViews
{
  v8[1] = *MEMORY[0x263EF8340];
  int v3 = [(SUUIGiftDateTableViewCellAccessibility *)self safeValueForKey:@"_datePicker"];
  if ([v3 isDescendantOfView:self])
  {
    v8[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIGiftDateTableViewCellAccessibility;
    uint64_t v4 = [(SUUIGiftDateTableViewCellAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  }
  v5 = (void *)v4;

  return v5;
}

@end