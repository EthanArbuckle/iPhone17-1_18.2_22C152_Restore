@interface IntervalPillView
- (_TtC24MenstrualCyclesAppPlugin16IntervalPillView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin16IntervalPillView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IntervalPillView

- (_TtC24MenstrualCyclesAppPlugin16IntervalPillView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_maxDays) = (Class)60;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin16IntervalPillView *)sub_241633038();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IntervalPillView(0);
  id v2 = v6.receiver;
  [(IntervalPillView *)&v6 layoutSubviews];
  objc_msgSend(v2, sel_frame, v6.receiver, v6.super_class);
  CGRectGetHeight(v7);
  if (qword_268CF9A70 != -1) {
    swift_once();
  }
  HKUIFloorToScreenScale();
  double v4 = v3;
  id v5 = objc_msgSend(v2, sel_layer);
  objc_msgSend(v5, sel_setCornerRadius_, v4);
}

- (_TtC24MenstrualCyclesAppPlugin16IntervalPillView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_startDate;
  uint64_t v4 = sub_24162B718();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView_endDate, v4);
  objc_super v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16IntervalPillView____lazy_storage___dateComponentLabel);
}

@end