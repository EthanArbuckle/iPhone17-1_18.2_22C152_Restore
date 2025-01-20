@interface _UIDICActivityViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityPresentedControllerModalizes;
@end

@implementation _UIDICActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDICActivityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityPresentedControllerModalizes
{
  return 1;
}

@end