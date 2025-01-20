@interface MaterialGradientSectionBackgroundView
- (BOOL)_disableRasterizeInAnimations;
- (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MaterialGradientSectionBackgroundView

- (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView *)sub_1001B0FF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_gradientView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_materialView;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIVisualEffectView) init];

  result = (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(MaterialGradientSectionBackgroundView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_gradientView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  id v4 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_materialView];
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_gradientView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_materialView);
}

@end