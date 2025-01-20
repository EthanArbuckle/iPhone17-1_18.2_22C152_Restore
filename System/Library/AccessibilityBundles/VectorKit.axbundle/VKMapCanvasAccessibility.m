@interface VKMapCanvasAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityElements;
@end

@implementation VKMapCanvasAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKMapCanvas";
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