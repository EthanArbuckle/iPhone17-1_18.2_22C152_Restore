@interface SBHLibraryAdditionalItemsIndicatorIconAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
@end

@implementation SBHLibraryAdditionalItemsIndicatorIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHLibraryAdditionalItemsIndicatorIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return 0;
}

@end