@interface AUClippingVisualizationView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit27AUClippingVisualizationView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit27AUClippingVisualizationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AUClippingVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21E56BBB0(self, (uint64_t)a2, type metadata accessor for AUClippingVisualizationView);
}

- (void)setTintColor:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E56C9F8();
}

- (_TtC12CoreAudioKit27AUClippingVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit27AUClippingVisualizationView *)sub_21E56CCA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit27AUClippingVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit27AUClippingVisualizationView *)sub_21E56CE2C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_sineWave));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_midLine));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipLines);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipLines));

  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipAreas);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipAreas));
}

@end