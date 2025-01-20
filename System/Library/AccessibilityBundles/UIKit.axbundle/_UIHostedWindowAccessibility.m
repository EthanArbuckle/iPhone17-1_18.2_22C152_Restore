@interface _UIHostedWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityWindowIgnoresEntityTransform;
@end

@implementation _UIHostedWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIHostedWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowIgnoresEntityTransform
{
  return 1;
}

@end