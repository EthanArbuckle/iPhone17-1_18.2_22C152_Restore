@interface STStorageHeaderLabelCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STStorageHeaderLabelCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageHeaderLabelCell";
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
  v2 = [(STStorageHeaderLabelCellAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end