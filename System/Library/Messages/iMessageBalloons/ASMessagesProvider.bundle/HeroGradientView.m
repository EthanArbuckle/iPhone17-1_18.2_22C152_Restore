@interface HeroGradientView
- (_TtC18ASMessagesProvider16HeroGradientView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider16HeroGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroGradientView

- (_TtC18ASMessagesProvider16HeroGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider16HeroGradientView *)sub_42CA7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider16HeroGradientView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider16HeroGradientView_gradient;
  id v6 = objc_allocWithZone((Class)CAGradientLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider16HeroGradientView_wantsTopGradient) = 1;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider16HeroGradientView_wantsBottomGradient) = 1;

  result = (_TtC18ASMessagesProvider16HeroGradientView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroGradientView();
  v2 = (char *)v4.receiver;
  [(HeroGradientView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider16HeroGradientView_gradient];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
  sub_42CDE0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider16HeroGradientView_gradient));
}

@end