@interface SeparatorFooterCell
- (_TtC19HealthMedicationsUI19SeparatorFooterCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI19SeparatorFooterCell)initWithFrame:(CGRect)a3;
@end

@implementation SeparatorFooterCell

- (_TtC19HealthMedicationsUI19SeparatorFooterCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorFooterCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorFooterCell____lazy_storage___separatorView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SeparatorFooterCell();
  return -[SeparatorFooterCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI19SeparatorFooterCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorFooterCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorFooterCell____lazy_storage___separatorView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SeparatorFooterCell();
  return [(SeparatorFooterCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorFooterCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI19SeparatorFooterCell____lazy_storage___separatorView);
}

@end