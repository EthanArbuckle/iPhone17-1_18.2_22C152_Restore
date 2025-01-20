@interface DurationFilterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4;
@end

@implementation DurationFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.DurationFilterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.DurationFilterCell", @"accessibilityApplyState:disabled:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.DurationFilterCell", @"durationLabel", "@", 0);
  [v3 validateClass:@"SeymourUI.DurationFilterCell" isKindOfClass:@"UICollectionViewCell"];
}

- (id)accessibilityLabel
{
  v2 = [(DurationFilterCellAccessibility *)self safeValueForKey:@"durationLabel"];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = v3;
  if (v3)
  {
    v5 = [v3 text];
    uint64_t v6 = [v5 intValue];

    v7 = NSString;
    v8 = accessibilityLocalizedString(@"duration.format");
    v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DurationFilterCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(DurationFilterCellAccessibility *)&v3 accessibilityTraits];
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
  v11.super_class = (Class)DurationFilterCellAccessibility;
  -[DurationFilterCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      unint64_t v7 = [(DurationFilterCellAccessibility *)self accessibilityTraits];
      [(DurationFilterCellAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF20] | v7];
    }
    else
    {
      [(DurationFilterCellAccessibility *)self setAccessibilityTraits:[(DurationFilterCellAccessibility *)self accessibilityTraits] & ~*MEMORY[0x263F1CF20]];
      if (v5)
      {
        unint64_t v8 = [(DurationFilterCellAccessibility *)self accessibilityTraits];
        unint64_t v9 = *MEMORY[0x263F1CF38] | v8;
LABEL_8:
        [(DurationFilterCellAccessibility *)self setAccessibilityTraits:v9];
        return;
      }
    }
    uint64_t v10 = *MEMORY[0x263F1CF38];
    unint64_t v9 = [(DurationFilterCellAccessibility *)self accessibilityTraits] & ~v10;
    goto LABEL_8;
  }
}

@end