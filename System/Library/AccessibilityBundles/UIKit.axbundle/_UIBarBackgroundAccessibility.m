@interface _UIBarBackgroundAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation _UIBarBackgroundAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBarBackground";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end