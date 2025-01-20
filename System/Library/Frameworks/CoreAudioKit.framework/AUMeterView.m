@interface AUMeterView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit11AUMeterView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit11AUMeterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AUMeterView

- (_TtC12CoreAudioKit11AUMeterView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit11AUMeterView *)sub_21E5331A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit11AUMeterView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit11AUMeterView *)sub_21E5332F8(a3);
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUMeterView();
  v2 = [(AUMeterView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUMeterView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AUMeterView *)&v6 setTintColor:v4];
  sub_21E533508();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E533848();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit11AUMeterView____lazy_storage___meterFillLayer));
}

@end