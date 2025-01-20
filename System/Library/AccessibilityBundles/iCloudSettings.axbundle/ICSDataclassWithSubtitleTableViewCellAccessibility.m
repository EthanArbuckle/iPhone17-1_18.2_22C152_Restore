@interface ICSDataclassWithSubtitleTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation ICSDataclassWithSubtitleTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ICSDataclassWithSubtitleTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
  unint64_t v3 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)&v7 accessibilityTraits];
  objc_opt_class();
  v4 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)self safeValueForKey:@"toggle"];
  v5 = __UIAccessibilityCastAsClass();

  if ([v5 _accessibilityViewIsVisible]) {
    v3 |= [v5 accessibilityTraits];
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  char v8 = 0;
  objc_opt_class();
  unint64_t v3 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)self safeValueForKey:@"toggle"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
    BOOL v5 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)&v7 isAccessibilityElement];
  }

  return v5;
}

- (id)automationElements
{
  v11.receiver = self;
  v11.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
  unint64_t v3 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)&v11 automationElements];
  v4 = (void *)[v3 mutableCopy];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  objc_super v7 = v6;

  objc_opt_class();
  char v8 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)self safeValueForKey:@"toggle"];
  v9 = __UIAccessibilityCastAsClass();

  if ([v9 _accessibilityViewIsVisible]
    && ([v7 containsObject:v9] & 1) == 0)
  {
    [v7 axSafelyAddObject:v9];
  }

  return v7;
}

- (id)accessibilityValue
{
  char v9 = 0;
  objc_opt_class();
  unint64_t v3 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)self safeValueForKey:@"toggle"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible])
  {
    uint64_t v5 = [v4 accessibilityValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
    uint64_t v5 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)&v8 accessibilityValue];
  }
  id v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  char v12 = 0;
  objc_opt_class();
  unint64_t v3 = [(ICSDataclassWithSubtitleTableViewCellAccessibility *)self safeValueForKey:@"toggle"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible])
  {
    [v4 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICSDataclassWithSubtitleTableViewCellAccessibility;
    [(ICSDataclassWithSubtitleTableViewCellAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end