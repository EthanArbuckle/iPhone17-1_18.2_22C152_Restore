@interface HUServiceDetailsHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityHomeUIIsMessageTextViewVisible;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUServiceDetailsHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUServiceDetailsHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityElementsHidden
{
  return ![(HUServiceDetailsHeaderCellAccessibility *)self accessibilityHomeUIIsMessageTextViewVisible];
}

- (id)accessibilityLabel
{
  if ([(HUServiceDetailsHeaderCellAccessibility *)self accessibilityHomeUIIsMessageTextViewVisible])
  {
    v3 = [(HUServiceDetailsHeaderCellAccessibility *)self safeUIViewForKey:@"messageTextView"];
    v4 = [v3 safeValueForKey:@"text"];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HUServiceDetailsHeaderCellAccessibility;
    v4 = [(HUServiceDetailsHeaderCellAccessibility *)&v6 accessibilityLabel];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  if ([(HUServiceDetailsHeaderCellAccessibility *)self accessibilityHomeUIIsMessageTextViewVisible])
  {
    return *MEMORY[0x263F1CEE8];
  }
  v4.receiver = self;
  v4.super_class = (Class)HUServiceDetailsHeaderCellAccessibility;
  return [(HUServiceDetailsHeaderCellAccessibility *)&v4 accessibilityTraits];
}

- (BOOL)accessibilityHomeUIIsMessageTextViewVisible
{
  v2 = [(HUServiceDetailsHeaderCellAccessibility *)self safeUIViewForKey:@"messageTextView"];
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

@end