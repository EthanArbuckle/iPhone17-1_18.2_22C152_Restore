@interface CKDetailsChatOptionsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CKDetailsChatOptionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsChatOptionsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKDetailsChatOptionsCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKDetailsChatOptionsCell", @"controlSwitch", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CKDetailsChatOptionsCellAccessibility *)self safeUIViewForKey:@"textLabel"];
  v4 = [v3 accessibilityLabel];

  if (![v4 length])
  {
    v5 = [(CKDetailsChatOptionsCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
    uint64_t v6 = [v5 accessibilityLabel];

    v4 = (void *)v6;
  }

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(CKDetailsChatOptionsCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(CKDetailsChatOptionsCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(CKDetailsChatOptionsCellAccessibility *)self safeUIViewForKey:@"controlSwitch"];
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