@interface AUOverdriveVisualizationView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit28AUOverdriveVisualizationView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit28AUOverdriveVisualizationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AUOverdriveVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21E56BBB0(self, (uint64_t)a2, type metadata accessor for AUOverdriveVisualizationView);
}

- (void)setTintColor:(id)a3
{
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AUOverdriveVisualizationView();
  v2 = (char *)v7.receiver;
  [(AUVisualizationView *)&v7 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_overdriveShape];
  objc_msgSend(v2, sel_frame, v7.receiver, v7.super_class);
  double v5 = v4 * 0.5;
  objc_msgSend(v2, sel_frame);
  objc_msgSend(v3, sel_setPosition_, v5, v6 * 0.5);
  sub_21E56B3E0();
}

- (_TtC12CoreAudioKit28AUOverdriveVisualizationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_overdriveShape;
  id v9 = objc_allocWithZone(MEMORY[0x263F15880]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  *(_DWORD *)((char *)&v10->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_linear) = 1065353216;
  *(_DWORD *)((char *)&v10->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_square) = 1065353216;
  *(_DWORD *)((char *)&v10->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_cubic) = 1065353216;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for AUOverdriveVisualizationView();
  return -[AUVisualizationView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit28AUOverdriveVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit28AUOverdriveVisualizationView *)sub_21E56BA54(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_overdriveShape));
}

@end