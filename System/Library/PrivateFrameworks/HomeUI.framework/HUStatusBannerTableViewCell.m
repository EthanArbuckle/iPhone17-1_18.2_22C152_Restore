@interface HUStatusBannerTableViewCell
+ (Class)bannerViewClass;
@end

@implementation HUStatusBannerTableViewCell

+ (Class)bannerViewClass
{
  return (Class)objc_opt_class();
}

@end