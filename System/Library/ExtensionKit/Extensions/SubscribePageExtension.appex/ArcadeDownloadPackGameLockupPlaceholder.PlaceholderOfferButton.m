@interface ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_2B2BB10913508E2A058F94A86923FF2222PlaceholderOfferButton)initWithCoder:(id)a3;
- (_TtCC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_2B2BB10913508E2A058F94A86923FF2222PlaceholderOfferButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1006A949C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006A8720();
}

- (_TtCC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_2B2BB10913508E2A058F94A86923FF2222PlaceholderOfferButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholderP33_2B2BB10913508E2A058F94A86923FF2222PlaceholderOfferButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton *)&v5 initWithCoder:a3];
}

@end