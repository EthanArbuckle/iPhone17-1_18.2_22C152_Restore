@interface DetailCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axAccessoryView;
- (id)_axSwitch;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation DetailCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.DetailCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.DetailCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.DetailCollectionViewCell", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.DetailCollectionViewCell", @"accessibilityAccessoryView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(DetailCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySubtitleLabel"];
}

- (id)_axSwitch
{
  v2 = [(DetailCollectionViewCellAccessibility *)self _axAccessoryView];
  MEMORY[0x24564DC30](@"UISwitch");
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)_axAccessoryView
{
  return (id)[(DetailCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityAccessoryView"];
}

- (id)accessibilityValue
{
  id v3 = [(DetailCollectionViewCellAccessibility *)self _axSwitch];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 accessibilityValue];
  }
  else
  {
    v6 = [(DetailCollectionViewCellAccessibility *)self _axAccessoryView];
    v5 = [v6 accessibilityLabel];
  }

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(DetailCollectionViewCellAccessibility *)self _axSwitch];
  if (v3)
  {
    id v4 = [(DetailCollectionViewCellAccessibility *)self _axSwitch];
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DetailCollectionViewCellAccessibility;
    [(DetailCollectionViewCellAccessibility *)&v13 accessibilityActivationPoint];
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(DetailCollectionViewCellAccessibility *)self _axSwitch];
  if (v3)
  {
    id v4 = [(DetailCollectionViewCellAccessibility *)self _axSwitch];
    uint64_t v5 = [v4 accessibilityTraits];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DetailCollectionViewCellAccessibility;
    uint64_t v5 = *MEMORY[0x263F1CEE8] | [(DetailCollectionViewCellAccessibility *)&v7 accessibilityTraits];
  }

  return v5;
}

@end