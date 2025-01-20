@interface MedicationSummaryCollectionViewHeaderCell
- (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationSummaryCollectionViewHeaderCell

- (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  v8 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary);
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummaryView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MedicationSummaryCollectionViewHeaderCell();
  return -[MedicationSummaryCollectionViewHeaderCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummaryView) = 0;
  id v6 = a3;

  result = (_TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_item);
  sub_1C20215D4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary), *(void *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummary));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI41MedicationSummaryCollectionViewHeaderCell_medicationSummaryView);
}

@end