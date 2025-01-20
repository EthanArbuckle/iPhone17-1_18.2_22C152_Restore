@interface BreakoutBackgroundEffectView
- (_TtC20ProductPageExtension28BreakoutBackgroundEffectView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BreakoutBackgroundEffectView

- (_TtC20ProductPageExtension28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28BreakoutBackgroundEffectView *)sub_10032A6D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28BreakoutBackgroundEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10032B228();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10032AF08();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_topGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_blurGradientMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_bottomGradient);
}

@end