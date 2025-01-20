@interface SUUIGiftTextFieldTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIGiftTextFieldTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIGiftTextFieldTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SUUIGiftTextFieldTableViewCellAccessibility *)self safeValueForKey:@"label"];
}

- (id)accessibilityValue
{
  v2 = [(SUUIGiftTextFieldTableViewCellAccessibility *)self safeValueForKey:@"textField"];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(SUUIGiftTextFieldTableViewCellAccessibility *)self safeValueForKey:@"textField"];
  uint64_t v4 = [v3 accessibilityTraits];

  v5 = [(SUUIGiftTextFieldTableViewCellAccessibility *)self safeValueForKey:@"isEnabled"];
  LODWORD(v3) = [v5 BOOLValue];

  uint64_t v6 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v6 = 0;
  }
  return v6 | v4;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(SUUIGiftTextFieldTableViewCellAccessibility *)self safeValueForKey:@"textField"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end