@interface HUQuickControlCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)accessibilityContainerType;
@end

@implementation HUQuickControlCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (int64_t)accessibilityContainerType
{
  return 0;
}

@end