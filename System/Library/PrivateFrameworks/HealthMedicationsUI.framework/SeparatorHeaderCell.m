@interface SeparatorHeaderCell
- (_TtC19HealthMedicationsUI19SeparatorHeaderCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI19SeparatorHeaderCell)initWithFrame:(CGRect)a3;
@end

@implementation SeparatorHeaderCell

- (_TtC19HealthMedicationsUI19SeparatorHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell____lazy_storage___separatorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SeparatorHeaderCell();
  v8 = -[SeparatorHeaderCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1C200D020();

  return v8;
}

- (_TtC19HealthMedicationsUI19SeparatorHeaderCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell____lazy_storage___separatorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SeparatorHeaderCell();
  id v5 = a3;
  v6 = [(SeparatorHeaderCell *)&v10 initWithCoder:v5];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1C200D020();
  }
  return v7;
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorHeaderCell____lazy_storage___separatorView);
}

@end