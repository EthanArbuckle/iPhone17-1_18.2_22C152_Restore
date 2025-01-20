@interface AnalogClockFaceAlarmComplicationView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)tintColor;
- (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView)initWithCoder:(id)a3;
- (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTintColor:(id)a3;
@end

@implementation AnalogClockFaceAlarmComplicationView

- (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView)initWithFrame:(CGRect)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label) = 0;

  result = (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label) = 0;
  id v4 = a3;

  result = (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  v2 = [(AnalogClockFaceAlarmComplicationView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AnalogClockFaceAlarmComplicationView *)&v6 setTintColor:v4];
  sub_24A04AAAC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24A04AD3C();
}

- (CGSize)intrinsicContentSize
{
  -[AnalogClockFaceAlarmComplicationView sizeThatFits:](self, sel_sizeThatFits_, 9.22337204e18, 9.22337204e18);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_24A04AF54(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label);
}

@end