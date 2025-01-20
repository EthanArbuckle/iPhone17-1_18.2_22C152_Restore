@interface UIPrintOrientationOptionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)printOptionTableViewCell;
@end

@implementation UIPrintOrientationOptionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPrintOrientationOption";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)printOptionTableViewCell
{
  v10.receiver = self;
  v10.super_class = (Class)UIPrintOrientationOptionAccessibility;
  v2 = [(UIPrintOrientationOptionAccessibility *)&v10 printOptionTableViewCell];
  objc_opt_class();
  v3 = [v2 safeValueForKey:@"accessoryView"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 numberOfSegments] == 2)
  {
    v5 = [v4 imageForSegmentAtIndex:0];
    v6 = accessibilityLocalizedString(@"print.portrait.button.label");
    [v5 setAccessibilityLabel:v6];

    v7 = [v4 imageForSegmentAtIndex:1];
    v8 = accessibilityLocalizedString(@"print.landscape.button.label");
    [v7 setAccessibilityLabel:v8];
  }

  return v2;
}

@end