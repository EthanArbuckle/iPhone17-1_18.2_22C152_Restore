@interface MedicationSearchFieldCell
- (_TtC19HealthMedicationsUI25MedicationSearchFieldCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI25MedicationSearchFieldCell)initWithFrame:(CGRect)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
@end

@implementation MedicationSearchFieldCell

- (_TtC19HealthMedicationsUI25MedicationSearchFieldCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell____lazy_storage___searchBar) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationSearchFieldCell();
  v8 = -[MedicationSearchFieldCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  sub_1C2147DE0();
  id v9 = (id)*MEMORY[0x1E4F39EA8];
  sub_1C214B0D0();

  sub_1C1F935A0();
  return v8;
}

- (_TtC19HealthMedicationsUI25MedicationSearchFieldCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell____lazy_storage___searchBar) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI25MedicationSearchFieldCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationSearchFieldCell____lazy_storage___searchBar);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C1F93A28(v4);
}

@end