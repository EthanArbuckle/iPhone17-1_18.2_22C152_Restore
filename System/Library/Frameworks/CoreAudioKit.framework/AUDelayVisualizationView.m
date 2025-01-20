@interface AUDelayVisualizationView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit24AUDelayVisualizationView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit24AUDelayVisualizationView)initWithFrame:(CGRect)a3;
- (void)setTintColor:(id)a3;
@end

@implementation AUDelayVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21E56BBB0(self, (uint64_t)a2, type metadata accessor for AUDelayVisualizationView);
}

- (void)setTintColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_21E5698A0(a3);
}

- (_TtC12CoreAudioKit24AUDelayVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit24AUDelayVisualizationView *)sub_21E569A0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit24AUDelayVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit24AUDelayVisualizationView *)sub_21E569B58(a3);
}

- (void).cxx_destruct
{
}

@end