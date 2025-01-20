@interface SKUIItemTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestReverseOrder;
- (id)accessibilityLabel;
@end

@implementation SKUIItemTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIItemTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SKUIItemTableViewCellAccessibility *)self safeValueForKey:@"layout"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end