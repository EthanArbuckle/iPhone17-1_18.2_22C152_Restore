@interface MFMailboxFilterPickerControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MFMailboxFilterPickerControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMailboxFilterPickerControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFMailboxFilterPickerControl" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"MFMailboxFilterPickerControl" hasInstanceVariable:@"_filtersLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v2 = [(MFMailboxFilterPickerControlAccessibility *)self safeValueForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(MFMailboxFilterPickerControlAccessibility *)self safeValueForKey:@"_filtersLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGRect)accessibilityFrame
{
  id v3 = [(MFMailboxFilterPickerControlAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v3 accessibilityFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(MFMailboxFilterPickerControlAccessibility *)self safeValueForKey:@"_filtersLabel"];
  [v12 accessibilityFrame];
  v28.origin.CGFloat x = v13;
  v28.origin.CGFloat y = v14;
  v28.size.CGFloat width = v15;
  v28.size.CGFloat height = v16;
  v25.origin.CGFloat x = v5;
  v25.origin.CGFloat y = v7;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v11;
  CGRect v26 = CGRectUnion(v25, v28);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

@end