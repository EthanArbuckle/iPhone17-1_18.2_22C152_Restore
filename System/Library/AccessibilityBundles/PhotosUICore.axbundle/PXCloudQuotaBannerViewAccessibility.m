@interface PXCloudQuotaBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation PXCloudQuotaBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCloudQuotaBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end