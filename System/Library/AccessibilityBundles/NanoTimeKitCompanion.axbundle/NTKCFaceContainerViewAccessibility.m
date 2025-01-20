@interface NTKCFaceContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
@end

@implementation NTKCFaceContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end