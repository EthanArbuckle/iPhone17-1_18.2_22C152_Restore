@interface HUWelcomeUIBannerTableViewCell
+ (Class)bannerViewClass;
@end

@implementation HUWelcomeUIBannerTableViewCell

+ (Class)bannerViewClass
{
  return (Class)objc_opt_class();
}

@end