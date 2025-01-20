@interface TodayCardProtectionLayerView
- (_TtC18ASMessagesProvider28TodayCardProtectionLayerView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28TodayCardProtectionLayerView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation TodayCardProtectionLayerView

- (_TtC18ASMessagesProvider28TodayCardProtectionLayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_321540();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_320E54();
}

- (void)didMoveToSuperview
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider28TodayCardProtectionLayerView_gradientMaskView);
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC18ASMessagesProvider28TodayCardProtectionLayerView_includeTopGradientFade) == 1)
    [(TodayCardProtectionLayerView *)self insertSubview:v3 aboveSubview:*(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider28TodayCardProtectionLayerView_effectsView)];
  else {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider28TodayCardProtectionLayerView_gradientMaskView), "removeFromSuperview", v3, v2);
  }
}

- (_TtC18ASMessagesProvider28TodayCardProtectionLayerView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider28TodayCardProtectionLayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28TodayCardProtectionLayerView_effectsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28TodayCardProtectionLayerView_gradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28TodayCardProtectionLayerView_gradientType));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end