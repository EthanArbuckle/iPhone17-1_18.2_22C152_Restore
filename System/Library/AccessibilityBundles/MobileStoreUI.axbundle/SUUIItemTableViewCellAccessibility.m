@interface SUUIItemTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestReverseOrder;
- (id)accessibilityLabel;
@end

@implementation SUUIItemTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIItemTableViewCell";
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
  v2 = [(SUUIItemTableViewCellAccessibility *)self safeValueForKey:@"layout"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end