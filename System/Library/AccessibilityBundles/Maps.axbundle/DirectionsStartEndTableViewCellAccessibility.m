@interface DirectionsStartEndTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityTableViewCellText;
@end

@implementation DirectionsStartEndTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DirectionsStartEndTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DirectionsStartEndTableViewCell" hasInstanceVariable:@"_startEndView" withType:"DirectionsStartEndContentView"];
  [v3 validateClass:@"DirectionsStartEndContentView" hasInstanceVariable:@"_overviewLabel" withType:"UILabel"];
}

- (id)accessibilityTableViewCellText
{
  v2 = [(DirectionsStartEndTableViewCellAccessibility *)self safeValueForKey:@"_startEndView"];
  id v3 = [v2 safeValueForKey:@"_overviewLabel"];
  v4 = [v3 accessibilityLabel];

  return v4;
}

@end