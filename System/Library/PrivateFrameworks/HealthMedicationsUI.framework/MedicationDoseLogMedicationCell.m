@interface MedicationDoseLogMedicationCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationDoseLogMedicationCell

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell *)sub_1C1F7A114(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  [(MedicationDoseLogMedicationCell *)v9 layoutIfNeeded];
  v18.receiver = v9;
  v18.super_class = (Class)type metadata accessor for MedicationDoseLogMedicationCell();
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[MedicationDoseLogMedicationCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v18, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell____lazy_storage___logView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  CGSize result = (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell____lazy_storage___logView));
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationCell_item;

  sub_1C1F374E4((uint64_t)v3);
}

@end