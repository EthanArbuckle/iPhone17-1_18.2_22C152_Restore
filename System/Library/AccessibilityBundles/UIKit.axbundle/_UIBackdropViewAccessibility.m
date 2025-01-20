@interface _UIBackdropViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation _UIBackdropViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBackdropView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 0;
}

@end