@interface ScheduleDurationCell
- (_TtC19HealthMedicationsUI20ScheduleDurationCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI20ScheduleDurationCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation ScheduleDurationCell

- (_TtC19HealthMedicationsUI20ScheduleDurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI20ScheduleDurationCell *)ScheduleDurationCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI20ScheduleDurationCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___mainStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___startDateStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___endDateStackView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI20ScheduleDurationCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C1FFB550();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___mainStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___startDateStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___endDateStackView));
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell_item;

  sub_1C1F374E4((uint64_t)v3);
}

@end