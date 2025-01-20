@interface AUDecimationVisualizationView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit29AUDecimationVisualizationView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit29AUDecimationVisualizationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AUDecimationVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21E56BBB0(self, (uint64_t)a2, type metadata accessor for AUDecimationVisualizationView);
}

- (void)setTintColor:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E56AB2C();
}

- (_TtC12CoreAudioKit29AUDecimationVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit29AUDecimationVisualizationView *)sub_21E56AEB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit29AUDecimationVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit29AUDecimationVisualizationView *)sub_21E56AFE4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit29AUDecimationVisualizationView_decimationShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit29AUDecimationVisualizationView_sineShape));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit29AUDecimationVisualizationView_midLine);
}

@end