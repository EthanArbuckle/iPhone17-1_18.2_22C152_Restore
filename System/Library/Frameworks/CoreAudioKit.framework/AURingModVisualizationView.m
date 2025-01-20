@interface AURingModVisualizationView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit26AURingModVisualizationView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit26AURingModVisualizationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AURingModVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21E56BBB0(self, (uint64_t)a2, type metadata accessor for AURingModVisualizationView);
}

- (void)setTintColor:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E56A194();
}

- (_TtC12CoreAudioKit26AURingModVisualizationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_freq1) = 1056964608;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_freq2) = 1056964608;
  uint64_t v8 = OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_modShape;
  id v9 = objc_allocWithZone(MEMORY[0x263F15880]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for AURingModVisualizationView();
  return -[AUVisualizationView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit26AURingModVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit26AURingModVisualizationView *)sub_21E56A37C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_modShape));
}

@end