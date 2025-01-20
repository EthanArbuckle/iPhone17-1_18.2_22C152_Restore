@interface _UIContentUnavailableWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation _UIContentUnavailableWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContentUnavailableWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end