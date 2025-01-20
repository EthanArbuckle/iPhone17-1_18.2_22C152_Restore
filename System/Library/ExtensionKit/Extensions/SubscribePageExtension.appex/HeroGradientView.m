@interface HeroGradientView
- (_TtC22SubscribePageExtension16HeroGradientView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension16HeroGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroGradientView

- (_TtC22SubscribePageExtension16HeroGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension16HeroGradientView *)sub_1004528B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension16HeroGradientView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_gradient;
  id v6 = objc_allocWithZone((Class)CAGradientLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_wantsTopGradient) = 1;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_wantsBottomGradient) = 1;

  result = (_TtC22SubscribePageExtension16HeroGradientView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroGradientView();
  v2 = (char *)v4.receiver;
  [(HeroGradientView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_gradient];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
  sub_100452C14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16HeroGradientView_gradient));
}

@end