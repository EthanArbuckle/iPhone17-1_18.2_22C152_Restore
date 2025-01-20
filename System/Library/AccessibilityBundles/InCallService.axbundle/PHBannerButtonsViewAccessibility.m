@interface PHBannerButtonsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)_accessibilitySortPriority;
@end

@implementation PHBannerButtonsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHBannerButtonsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  return -1;
}

@end