@interface ScheduleIntervalCell
- (_TtC19HealthMedicationsUI20ScheduleIntervalCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI20ScheduleIntervalCell)initWithFrame:(CGRect)a3;
@end

@implementation ScheduleIntervalCell

- (_TtC19HealthMedicationsUI20ScheduleIntervalCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___frequencyTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___timesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___dosesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___containerStackView) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell_item;
  v9 = (objc_class *)type metadata accessor for ScheduleIntervalCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[ScheduleIntervalCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C207FF7C();

  return v10;
}

- (_TtC19HealthMedicationsUI20ScheduleIntervalCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___frequencyTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___timesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___dosesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___containerStackView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI20ScheduleIntervalCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___frequencyTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___timesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___dosesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___containerStackView));
  sub_1C2081350((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell_item, (unint64_t *)&qword_1EBF0C300, (uint64_t (*)(uint64_t))sub_1C1F1CB5C);
}

@end