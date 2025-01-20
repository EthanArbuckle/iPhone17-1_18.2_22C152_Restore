@interface SVSCardContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation SVSCardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SVSCardContainerView";
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