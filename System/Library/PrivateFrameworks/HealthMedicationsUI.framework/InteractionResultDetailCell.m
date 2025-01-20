@interface InteractionResultDetailCell
- (_TtC19HealthMedicationsUI27InteractionResultDetailCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI27InteractionResultDetailCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation InteractionResultDetailCell

- (_TtC19HealthMedicationsUI27InteractionResultDetailCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___firstFactorView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___separatorView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___secondFactorView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionResultDetailCell();
  v8 = -[InteractionResultDetailCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  [(InteractionResultDetailCell *)v8 setUserInteractionEnabled:0];
  sub_1C1FFE6D8();
  sub_1C1FFE7EC();

  return v8;
}

- (_TtC19HealthMedicationsUI27InteractionResultDetailCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI27InteractionResultDetailCell *)sub_1C1FFE46C(a3);
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for InteractionResultDetailCell();
  [(InteractionResultDetailCell *)&v2 awakeFromNib];
}

- (void).cxx_destruct
{
  sub_1C1F23854((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell_item, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___firstFactorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___separatorView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionResultDetailCell____lazy_storage___secondFactorView);
}

@end