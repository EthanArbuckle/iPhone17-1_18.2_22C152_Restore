@interface AULimiterControlsView
- (CGRect)bounds;
- (_TtC12CoreAudioKit21AULimiterControlsView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit21AULimiterControlsView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation AULimiterControlsView

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AULimiterControlsView();
  [(AULimiterControlsView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_21E56DF90(x, y, width, height);
}

- (_TtC12CoreAudioKit21AULimiterControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit21AULimiterControlsView *)sub_21E56E044(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit21AULimiterControlsView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_meter;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_21E56DB20();
  objc_super v6 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_knobs) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_previousWidth) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_spacingConstraints) = v6;

  CGRect result = (_TtC12CoreAudioKit21AULimiterControlsView *)sub_21E5B6A78();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end