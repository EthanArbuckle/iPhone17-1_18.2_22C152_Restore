@interface NonRotatingARSCNViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityElements;
@end

@implementation NonRotatingARSCNViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NonRotatingARSCNView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  return 0;
}

@end