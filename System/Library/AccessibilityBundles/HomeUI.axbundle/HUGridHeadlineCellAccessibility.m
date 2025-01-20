@interface HUGridHeadlineCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUGridHeadlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUGridHeadlineCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (id)accessibilityLabel
{
  v2 = [(HUGridHeadlineCellAccessibility *)self safeValueForKey:@"headlineLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v3 = [(HUGridHeadlineCellAccessibility *)self safeValueForKey:@"headlineLabel"];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HUGridHeadlineCellAccessibility;
    [(HUGridHeadlineCellAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end