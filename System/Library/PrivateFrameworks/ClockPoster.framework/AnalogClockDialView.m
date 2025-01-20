@interface AnalogClockDialView
- (_TtC11ClockPoster19AnalogClockDialView)initWithCoder:(id)a3;
- (_TtC11ClockPoster19AnalogClockDialView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnalogClockDialView

- (_TtC11ClockPoster19AnalogClockDialView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster19AnalogClockDialView *)sub_249FAAA30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster19AnalogClockDialView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_249FAD084();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_249FAB280();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_majorTickLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_minorTickMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_minorTickBackgroundLayer));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end