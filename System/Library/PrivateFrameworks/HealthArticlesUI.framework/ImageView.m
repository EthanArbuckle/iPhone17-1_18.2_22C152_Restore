@interface ImageView
- (_TtC16HealthArticlesUI9ImageView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI9ImageView)initWithFrame:(CGRect)a3;
@end

@implementation ImageView

- (_TtC16HealthArticlesUI9ImageView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI9ImageView *)sub_1C290E6A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI9ImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C290EBEC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI9ImageView_imageView);
}

@end