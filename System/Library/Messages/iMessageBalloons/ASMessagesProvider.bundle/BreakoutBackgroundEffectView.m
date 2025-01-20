@interface BreakoutBackgroundEffectView
- (_TtC18ASMessagesProvider28BreakoutBackgroundEffectView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BreakoutBackgroundEffectView

- (_TtC18ASMessagesProvider28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider28BreakoutBackgroundEffectView *)sub_3242B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider28BreakoutBackgroundEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_324E08();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_324AE8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28BreakoutBackgroundEffectView_topGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28BreakoutBackgroundEffectView_blurGradientMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28BreakoutBackgroundEffectView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider28BreakoutBackgroundEffectView_bottomGradient);
}

@end