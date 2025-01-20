@interface AlertDeliveryTypeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AlertDeliveryTypeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AlertDeliveryTypeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return 0;
}

@end