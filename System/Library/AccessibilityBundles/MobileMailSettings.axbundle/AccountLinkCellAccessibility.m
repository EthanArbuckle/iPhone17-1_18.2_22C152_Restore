@interface AccountLinkCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AccountLinkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AccountLinkCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (CGRect)accessibilityFrame
{
  v2 = [(AccountLinkCellAccessibility *)self safeValueForKey:@"_linkButton"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(AccountLinkCellAccessibility *)self safeValueForKey:@"_linkButton"];
  double v3 = [v2 titleForState:0];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF10];
}

@end