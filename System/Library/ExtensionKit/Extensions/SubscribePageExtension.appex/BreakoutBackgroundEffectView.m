@interface BreakoutBackgroundEffectView
- (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BreakoutBackgroundEffectView

- (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView *)sub_10032159C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003220EC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100321DCC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_topGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_blurGradientMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_bottomGradient);
}

@end