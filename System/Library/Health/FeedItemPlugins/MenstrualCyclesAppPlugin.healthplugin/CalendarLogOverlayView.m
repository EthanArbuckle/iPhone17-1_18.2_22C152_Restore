@interface CalendarLogOverlayView
- (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)toggleFlow;
- (void)toggleSpotting;
@end

@implementation CalendarLogOverlayView

- (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView *)sub_2412A5FC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2412A72DC(v4);
}

- (void)toggleFlow
{
  v2 = self;
  sub_2412A74B4(&OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_flowToggle, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_spottingToggle, (void (*)(void))sub_2411DEB00, (void (*)(void))sub_2411DEF40);
}

- (void)toggleSpotting
{
  v2 = self;
  sub_2412A74B4(&OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_spottingToggle, &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_flowToggle, (void (*)(void))sub_2411DEF40, (void (*)(void))sub_2411DEB00);
}

- (_TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2412A93CC();
}

- (void).cxx_destruct
{
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_flowToggle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_spottingToggle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_header));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin22CalendarLogOverlayView_separator);
}

@end