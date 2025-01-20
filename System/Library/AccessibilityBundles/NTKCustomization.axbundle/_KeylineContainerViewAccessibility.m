@interface _KeylineContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesInvalidFrames;
@end

@implementation _KeylineContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_KeylineContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end