@interface AUVisualizationView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit19AUVisualizationView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit19AUVisualizationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AUVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21E56BBB0(self, (uint64_t)a2, type metadata accessor for AUVisualizationView);
}

- (void)setTintColor:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AUVisualizationView();
  v4 = (char *)v11.receiver;
  id v5 = a3;
  [(AUVisualizationView *)&v11 setTintColor:v5];
  v6 = *(void **)&v4[OBJC_IVAR____TtC12CoreAudioKit19AUVisualizationView_mixLayer];
  id v7 = objc_msgSend(v4, sel_tintColor, v11.receiver, v11.super_class);
  if (v7)
  {
    v8 = v7;
    id v9 = objc_msgSend(v7, sel_colorWithAlphaComponent_, 0.25);

    id v10 = objc_msgSend(v9, sel_CGColor);
    objc_msgSend(v6, sel_setBackgroundColor_, v10);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC12CoreAudioKit19AUVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit19AUVisualizationView *)sub_21E5685E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit19AUVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit19AUVisualizationView *)sub_21E568728(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E568990();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit19AUVisualizationView_mixLayer));
}

@end