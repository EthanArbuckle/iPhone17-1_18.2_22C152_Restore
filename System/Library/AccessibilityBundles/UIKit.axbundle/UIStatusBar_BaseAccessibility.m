@interface UIStatusBar_BaseAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation UIStatusBar_BaseAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBar_Base";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 25;
}

@end