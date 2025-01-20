@interface InteractiveBackgroundContentView
- (UIColor)backgroundColor;
- (_TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation InteractiveBackgroundContentView

- (_TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView *)sub_100459934(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView_artworkView;
  sub_100758360();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView *)sub_100768A40();
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  v2 = [(InteractiveBackgroundContentView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v4 = a3;
  id v5 = v7.receiver;
  [(InteractiveBackgroundContentView *)&v7 setBackgroundColor:v4];
  id v6 = objc_msgSend(v5, "backgroundColor", v7.receiver, v7.super_class);
  sub_1007581B0();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v2 = v3.receiver;
  [(InteractiveBackgroundContentView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_1007582C0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_8DA30027F2CC80FAC5FE2DBE0813F10F32InteractiveBackgroundContentView_artworkView));
}

@end