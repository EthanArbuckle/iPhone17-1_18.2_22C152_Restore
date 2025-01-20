@interface APWelcomeControllerWithBraveButtonTrayView
- (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView)initWithCoder:(id)a3;
- (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation APWelcomeControllerWithBraveButtonTrayView

- (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView) = 0;
  uint64_t v5 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray;
  id v6 = objc_allocWithZone((Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView *)sub_247E1A468();
  __break(1u);
  return result;
}

- (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView)initWithFrame:(CGRect)a3
{
  return (_TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView *)sub_247E11970(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_247E11A84();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray);
}

@end