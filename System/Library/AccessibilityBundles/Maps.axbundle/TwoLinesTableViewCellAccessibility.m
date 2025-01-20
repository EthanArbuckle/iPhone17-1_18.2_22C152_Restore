@interface TwoLinesTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TwoLinesTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TwoLinesTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(TwoLinesTableViewCellAccessibility *)self safeValueForKey:@"_twoLinesContentView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end