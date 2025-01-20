@interface MTAWorldClockCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (MTAWorldClockCollectionCellAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axModifyDeleteButton;
@end

@implementation MTAWorldClockCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAWorldClockCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTAWorldClockCollectionCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockCollectionCell", @"worldClockView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockCollectionCell", @"deleteButton", "@", 0);
}

- (MTAWorldClockCollectionCellAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTAWorldClockCollectionCellAccessibility;
  id v3 = -[MTAWorldClockCollectionCellAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MTAWorldClockCollectionCellAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionCellAccessibility;
  [(MTAWorldClockCollectionCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MTAWorldClockCollectionCellAccessibility *)self _axModifyDeleteButton];
}

- (id)accessibilityLabel
{
  v2 = [(MTAWorldClockCollectionCellAccessibility *)self safeValueForKey:@"worldClockView"];
  objc_super v3 = [v2 safeValueForKey:@"cityNameLabel"];
  v4 = [v3 accessibilityLabel];

  return v4;
}

- (BOOL)canBecomeFocused
{
  if ([(MTAWorldClockCollectionCellAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)MTAWorldClockCollectionCellAccessibility;
  return [(MTAWorldClockCollectionCellAccessibility *)&v4 canBecomeFocused];
}

- (void)_axModifyDeleteButton
{
  id v3 = [(MTAWorldClockCollectionCellAccessibility *)self safeValueForKey:@"deleteButton"];
  v2 = accessibilityLocalizedString(@"clock.delete");
  [v3 setAccessibilityLabel:v2];
}

@end