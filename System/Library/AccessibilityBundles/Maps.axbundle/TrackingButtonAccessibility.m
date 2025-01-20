@interface TrackingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TrackingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TrackingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return 0;
}

@end