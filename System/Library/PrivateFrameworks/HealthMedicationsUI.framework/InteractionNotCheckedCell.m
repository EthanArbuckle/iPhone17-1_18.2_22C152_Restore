@interface InteractionNotCheckedCell
- (_TtC19HealthMedicationsUI25InteractionNotCheckedCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI25InteractionNotCheckedCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation InteractionNotCheckedCell

- (_TtC19HealthMedicationsUI25InteractionNotCheckedCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___titleLabel) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionNotCheckedCell();
  v8 = -[InteractionNotCheckedCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1C1F467A4();

  return v8;
}

- (_TtC19HealthMedicationsUI25InteractionNotCheckedCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___titleLabel) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractionNotCheckedCell();
  return [(InteractionNotCheckedCell *)&v6 initWithCoder:a3];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionNotCheckedCell();
  id v2 = v3.receiver;
  [(InteractionNotCheckedCell *)&v3 awakeFromNib];
  sub_1C1F467A4();
}

- (void).cxx_destruct
{
  sub_1C1F474F4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___medicationView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionNotCheckedCell____lazy_storage___titleLabel);
}

@end