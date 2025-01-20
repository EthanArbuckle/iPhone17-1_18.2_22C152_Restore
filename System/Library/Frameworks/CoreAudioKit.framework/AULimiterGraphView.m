@interface AULimiterGraphView
- (_TtC12CoreAudioKit18AULimiterGraphView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit18AULimiterGraphView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
@end

@implementation AULimiterGraphView

- (_TtC12CoreAudioKit18AULimiterGraphView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_levels) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_lines) = v8;
  uint64_t v9 = OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_peaks;
  id v10 = objc_allocWithZone(MEMORY[0x263F15880]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for AULimiterGraphView();
  v12 = -[AULimiterGraphView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_21E5A5490();

  return v12;
}

- (_TtC12CoreAudioKit18AULimiterGraphView)initWithCoder:(id)a3
{
  v5 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_levels) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_lines) = v5;
  uint64_t v6 = OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_peaks;
  id v7 = objc_allocWithZone(MEMORY[0x263F15880]);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC12CoreAudioKit18AULimiterGraphView *)sub_21E5B6A78();
  __break(1u);
  return result;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v5 = self;
  id v6 = a3;
  id v7 = self;
  objc_msgSend(v5, sel_begin);
  objc_msgSend(v5, sel_setDisableActions_, 1);
  sub_21E5A5B08();
  objc_msgSend(v5, sel_commit);
}

- (void)tintColorDidChange
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_peaks);
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_tintColor);
  id v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.5);

  id v8 = objc_msgSend(v7, sel_CGColor);
  objc_msgSend(v3, sel_setFillColor_, v8);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_peaks);
}

@end