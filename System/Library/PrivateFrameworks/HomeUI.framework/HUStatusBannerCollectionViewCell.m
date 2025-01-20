@interface HUStatusBannerCollectionViewCell
+ (Class)bannerViewClass;
@end

@implementation HUStatusBannerCollectionViewCell

+ (Class)bannerViewClass
{
  return (Class)objc_opt_class();
}

@end