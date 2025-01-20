@interface MedicationDayScheduleCell
- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation MedicationDayScheduleCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_24115F830();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115F820();
  v8 = self;
  sub_24110A670();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell *)sub_24110AE50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell____lazy_storage___scheduleView) = 0;
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell_item;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell *)sub_2411616B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell____lazy_storage___scheduleView));
  sub_24110C1EC((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin25MedicationDayScheduleCell_item, (unint64_t *)&qword_26B0069B0, (unint64_t *)&qword_26B0069A8);
}

@end