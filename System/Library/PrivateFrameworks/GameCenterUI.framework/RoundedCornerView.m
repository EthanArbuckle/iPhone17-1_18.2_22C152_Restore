@interface RoundedCornerView
- (_TtC12GameCenterUI17RoundedCornerView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17RoundedCornerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoundedCornerView

- (_TtC12GameCenterUI17RoundedCornerView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17RoundedCornerView *)sub_1AF486BBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI17RoundedCornerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF486CF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF486DE0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF486EA0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17RoundedCornerView_borderView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI17RoundedCornerView_borderColor);
}

@end