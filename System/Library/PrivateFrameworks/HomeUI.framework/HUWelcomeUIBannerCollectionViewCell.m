@interface HUWelcomeUIBannerCollectionViewCell
+ (Class)bannerViewClass;
@end

@implementation HUWelcomeUIBannerCollectionViewCell

+ (Class)bannerViewClass
{
  return (Class)objc_opt_class();
}

@end