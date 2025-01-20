@interface MedicationsDayHistoryHeaderCell
- (_TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation MedicationsDayHistoryHeaderCell

- (_TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell *)sub_1C1F19628(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell____lazy_storage___titleLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell *)sub_1C214B910();
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
  sub_1C1F19A98();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell____lazy_storage___titleLabel));
  sub_1C1F1CD00((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationsDayHistoryHeaderCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

@end