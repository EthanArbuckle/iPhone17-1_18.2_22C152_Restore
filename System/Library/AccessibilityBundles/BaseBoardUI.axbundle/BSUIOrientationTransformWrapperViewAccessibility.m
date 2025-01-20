@interface BSUIOrientationTransformWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsUserInteractionEnabled;
@end

@implementation BSUIOrientationTransformWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BSUIOrientationTransformWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return 0;
}

@end