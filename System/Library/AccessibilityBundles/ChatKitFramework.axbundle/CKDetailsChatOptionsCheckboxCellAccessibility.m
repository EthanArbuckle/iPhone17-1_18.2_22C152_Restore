@interface CKDetailsChatOptionsCheckboxCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CKDetailsChatOptionsCheckboxCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsChatOptionsCheckboxCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKDetailsChatOptionsCheckboxCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsChatOptionsCheckboxCell", @"controlSwitch", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CKDetailsChatOptionsCheckboxCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CKDetailsChatOptionsCheckboxCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(CKDetailsChatOptionsCheckboxCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(CKDetailsChatOptionsCheckboxCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
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