@interface IPadMediumAdLockupWithScreenshotsBackgroundView
- (_TtC20ProductPageExtension47IPadMediumAdLockupWithScreenshotsBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IPadMediumAdLockupWithScreenshotsBackgroundView

- (void)layoutSubviews
{
  v2 = self;
  sub_1005E5498();
}

- (_TtC20ProductPageExtension47IPadMediumAdLockupWithScreenshotsBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for IPadMediumAdLockupWithScreenshotsBackgroundView();
  return -[MediumAdLockupWithScreenshotsBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end