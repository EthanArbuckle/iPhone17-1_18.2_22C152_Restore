@interface VideosUI_CanonicalTitleBannerViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation VideosUI_CanonicalTitleBannerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.CanonicalTitleBannerViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end