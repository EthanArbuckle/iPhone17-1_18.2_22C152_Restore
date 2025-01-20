@interface ActivitySetupThreeRingsOnboardingVideoView
- (CGSize)intrinsicContentSize;
- (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView)init;
- (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView)initWithCoder:(id)a3;
- (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivitySetupThreeRingsOnboardingVideoView

- (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingVideoView();
  v2 = -[ActivitySetupThreeRingsOnboardingVideoView initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1B3FC();

  return v2;
}

- (CGSize)intrinsicContentSize
{
  v3 = self;
  objc_super v4 = self;
  id v5 = [v3 mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  CGFloat v14 = CGRectGetWidth(v21) + -160.0;
  id v15 = [v3 mainScreen];
  [v15 scale];

  UIRoundToScale();
  double v17 = v16;

  double v18 = v14;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingVideoView();
  v2 = (char *)v5.receiver;
  [(ActivitySetupThreeRingsOnboardingVideoView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer];
  if (v3)
  {
    objc_super v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }
}

- (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer) = 0;
  id v4 = a3;

  CGSize result = (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView *)sub_254E0();
  __break(1u);
  return result;
}

- (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_player));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer);
}

@end