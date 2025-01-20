@interface MapsAppAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MapsAppAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapsApp";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return AXMapsLocString(@"APPLICATION_NAME");
}

@end