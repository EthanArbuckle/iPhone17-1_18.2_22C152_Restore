@interface ThemeFilterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4;
@end

@implementation ThemeFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ThemeFilterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.DurationFilterCell", @"accessibilityApplyState:disabled:", "v", "B", "B", 0);
  [v3 validateClass:@"SeymourUI.ThemeFilterCell" hasSwiftField:@"themeLabel" withSwiftType:"UILabel"];
}

- (id)accessibilityLabel
{
  v2 = [(ThemeFilterCellAccessibility *)self safeSwiftValueForKey:@"themeLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ThemeFilterCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ThemeFilterCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ThemeFilterCellAccessibility;
  -[ThemeFilterCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      unint64_t v7 = [(ThemeFilterCellAccessibility *)self accessibilityTraits];
      [(ThemeFilterCellAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF20] | v7];
    }
    else
    {
      [(ThemeFilterCellAccessibility *)self setAccessibilityTraits:[(ThemeFilterCellAccessibility *)self accessibilityTraits] & ~*MEMORY[0x263F1CF20]];
      if (v5)
      {
        unint64_t v8 = [(ThemeFilterCellAccessibility *)self accessibilityTraits];
        unint64_t v9 = *MEMORY[0x263F1CF38] | v8;
LABEL_8:
        [(ThemeFilterCellAccessibility *)self setAccessibilityTraits:v9];
        return;
      }
    }
    uint64_t v10 = *MEMORY[0x263F1CF38];
    unint64_t v9 = [(ThemeFilterCellAccessibility *)self accessibilityTraits] & ~v10;
    goto LABEL_8;
  }
}

@end