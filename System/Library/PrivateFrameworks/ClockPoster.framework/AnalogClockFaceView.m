@interface AnalogClockFaceView
- (UIColor)tintColor;
- (_TtC11ClockPoster19AnalogClockFaceView)initWithCoder:(id)a3;
- (_TtC11ClockPoster19AnalogClockFaceView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AnalogClockFaceView

- (_TtC11ClockPoster19AnalogClockFaceView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster19AnalogClockFaceView *)sub_24A016E74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster19AnalogClockFaceView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24A018E84();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24A016FEC();
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  v2 = [(AnalogClockFaceView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AnalogClockFaceView *)&v6 setTintColor:v4];
  sub_24A017F50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView));

  swift_release();
}

@end