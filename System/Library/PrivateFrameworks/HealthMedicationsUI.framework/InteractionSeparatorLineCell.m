@interface InteractionSeparatorLineCell
- (_TtC19HealthMedicationsUI28InteractionSeparatorLineCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI28InteractionSeparatorLineCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation InteractionSeparatorLineCell

- (_TtC19HealthMedicationsUI28InteractionSeparatorLineCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell____lazy_storage___separatorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionSeparatorLineCell();
  v8 = -[InteractionSeparatorLineCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1C1FB2628();

  return v8;
}

- (_TtC19HealthMedicationsUI28InteractionSeparatorLineCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell____lazy_storage___separatorView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractionSeparatorLineCell();
  return [(InteractionSeparatorLineCell *)&v6 initWithCoder:a3];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionSeparatorLineCell();
  id v2 = v3.receiver;
  [(InteractionSeparatorLineCell *)&v3 awakeFromNib];
  sub_1C1FB2628();
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell_item);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionSeparatorLineCell____lazy_storage___separatorView);
}

@end