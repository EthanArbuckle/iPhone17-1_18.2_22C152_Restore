@interface CalendarDayLabel
- (UIView)viewForLastBaselineLayout;
- (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation CalendarDayLabel

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CalendarDayLabel();
  id v2 = v9.receiver;
  [(CalendarDayLabel *)&v9 didMoveToWindow];
  id v3 = objc_msgSend(v2, sel_window, v9.receiver, v9.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, sel_layer);
    id v6 = objc_msgSend(v4, sel_screen);
    objc_msgSend(v6, sel_scale);
    double v8 = v7;

    objc_msgSend(v5, sel_setRasterizationScale_, v8);
    id v2 = v5;
  }
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_2411E47AC();
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_label));
}

- (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_label;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  double v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_lastSize);
  *double v8 = 0;
  v8[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel *)sub_241633038();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel)initWithFrame:(CGRect)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin16CalendarDayLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_label));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CalendarDayLabel_circleMask);
}

@end