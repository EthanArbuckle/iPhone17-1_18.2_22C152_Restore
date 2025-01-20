@interface PRXCardContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation PRXCardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRXCardContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 6;
}

@end