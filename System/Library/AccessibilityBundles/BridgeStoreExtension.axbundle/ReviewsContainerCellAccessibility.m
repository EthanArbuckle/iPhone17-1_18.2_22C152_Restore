@interface ReviewsContainerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsScannerGroup;
@end

@implementation ReviewsContainerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.ReviewsContainerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

@end