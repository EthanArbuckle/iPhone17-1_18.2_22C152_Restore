@interface AnalogClockFaceDateComplicationView
- (UIColor)tintColor;
- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithCoder:(id)a3;
- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithFrame:(CGRect)a3;
- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithFrame:(CGRect)a3 options:(unint64_t)a4;
- (void)setTintColor:(id)a3;
@end

@implementation AnalogClockFaceDateComplicationView

- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithFrame:(CGRect)a3 options:(unint64_t)a4
{
  return (_TtC11ClockPoster35AnalogClockFaceDateComplicationView *)sub_24A04CFC4(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster35AnalogClockFaceDateComplicationView_dateTextProvider) = 0;
  id v4 = a3;

  result = (_TtC11ClockPoster35AnalogClockFaceDateComplicationView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AnalogClockFaceDateComplicationView();
  v2 = [(AnalogClockFaceDateComplicationView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalogClockFaceDateComplicationView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AnalogClockFaceDateComplicationView *)&v6 setTintColor:v4];
  sub_24A04DB58();
}

- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithFrame:(CGRect)a3
{
  result = (_TtC11ClockPoster35AnalogClockFaceDateComplicationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster35AnalogClockFaceDateComplicationView_dateTextProvider));
}

@end