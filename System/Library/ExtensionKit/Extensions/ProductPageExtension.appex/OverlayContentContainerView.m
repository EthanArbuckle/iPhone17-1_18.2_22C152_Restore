@interface OverlayContentContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC20ProductPageExtensionP33_6A71258C4AC1210CF42C9BD2D8D5111D27OverlayContentContainerView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_6A71258C4AC1210CF42C9BD2D8D5111D27OverlayContentContainerView)initWithFrame:(CGRect)a3;
@end

@implementation OverlayContentContainerView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_10033BF68(v4, x, y);

  return v4 & 1;
}

- (_TtC20ProductPageExtensionP33_6A71258C4AC1210CF42C9BD2D8D5111D27OverlayContentContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[OverlayContentContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ProductPageExtensionP33_6A71258C4AC1210CF42C9BD2D8D5111D27OverlayContentContainerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(OverlayContentContainerView *)&v5 initWithCoder:a3];
}

@end