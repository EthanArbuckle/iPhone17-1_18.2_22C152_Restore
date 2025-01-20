@interface ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholderP33_6CEF76E38F5CB667DC93C3F3789776FD22PlaceholderOfferButton)initWithCoder:(id)a3;
- (_TtCC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholderP33_6CEF76E38F5CB667DC93C3F3789776FD22PlaceholderOfferButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_F1C64();
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
  sub_F0E8C();
}

- (_TtCC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholderP33_6CEF76E38F5CB667DC93C3F3789776FD22PlaceholderOfferButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholderP33_6CEF76E38F5CB667DC93C3F3789776FD22PlaceholderOfferButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ArcadeDownloadPackGameLockupPlaceholder.PlaceholderOfferButton *)&v5 initWithCoder:a3];
}

@end