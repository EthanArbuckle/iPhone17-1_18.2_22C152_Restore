@interface ActivitySceneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsSecure;
@end

@implementation ActivitySceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ActivityUIServices.ActivityScene";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsSecure
{
  return 1;
}

@end