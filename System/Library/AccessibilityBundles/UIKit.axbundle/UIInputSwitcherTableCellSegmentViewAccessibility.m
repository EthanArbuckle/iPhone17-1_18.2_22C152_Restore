@interface UIInputSwitcherTableCellSegmentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIInputSwitcherTableCellSegmentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSwitcherTableCellSegmentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIInputSwitcherTableCellSegmentView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"label", "@", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v11 = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[(UIInputSwitcherTableCellSegmentViewAccessibility *)v11 safeValueForKey:@"label"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = (id)[v7 text];

  if ([v10[0] length])
  {
    id v12 = v10[0];
  }
  else
  {
    v5.receiver = v11;
    v5.super_class = (Class)UIInputSwitcherTableCellSegmentViewAccessibility;
    id v12 = [(UIInputSwitcherTableCellSegmentViewAccessibility *)&v5 accessibilityLabel];
  }
  int v6 = 1;
  objc_storeStrong(v10, 0);
  v2 = v12;

  return v2;
}

- (unint64_t)accessibilityTraits
{
  id v8 = self;
  SEL v7 = a2;
  char v6 = [(UIInputSwitcherTableCellSegmentViewAccessibility *)self safeBoolForKey:@"isSelected"] & 1;
  v5.receiver = v8;
  v5.super_class = (Class)UIInputSwitcherTableCellSegmentViewAccessibility;
  unint64_t v4 = [(UIInputSwitcherTableCellSegmentViewAccessibility *)&v5 accessibilityTraits] | *MEMORY[0x263F1CEE8];
  if (v6) {
    uint64_t v3 = *MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v3 = 0;
  }
  return v4 | v3;
}

@end