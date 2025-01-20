@interface AXUIPoliteBannerView
- (BOOL)shouldMimicNotificationBannerTopOffset;
- (double)defaultPlatterToTextVerticalSpacing;
- (double)defaultTitleToSubtitleVerticalSpacing;
- (double)platterToTextHorizontalSpacing;
@end

@implementation AXUIPoliteBannerView

- (BOOL)shouldMimicNotificationBannerTopOffset
{
  return 1;
}

- (double)defaultPlatterToTextVerticalSpacing
{
  return 15.0;
}

- (double)platterToTextHorizontalSpacing
{
  return 20.0;
}

- (double)defaultTitleToSubtitleVerticalSpacing
{
  v3.receiver = self;
  v3.super_class = (Class)AXUIPoliteBannerView;
  [(AXUIBannerView *)&v3 defaultTitleToSubtitleVerticalSpacing];
  return result;
}

@end