@interface MedicationDayScheduleView
- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView)initWithFrame:(CGRect)a3;
- (void)didTapLog:(id)a3;
@end

@implementation MedicationDayScheduleView

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView *)sub_241109134(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24110B7F8();
}

- (void)didTapLog:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_2411614D0();
  swift_unknownObjectRelease();
  v5 = *(void (**)(uint64_t))((char *)&v4->super.super.super.isa
                                      + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_logActionHandler);
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_241032B54((uint64_t)v5);
  }

  sub_24101F178((uint64_t)&v7);
}

- (void).cxx_destruct
{
  sub_241032B54(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_logActionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_logButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleView_lineItemsStackView);
}

@end