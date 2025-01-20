@interface InteractionFactorsHeaderCell
- (_TtC19HealthMedicationsUI28InteractionFactorsHeaderCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI28InteractionFactorsHeaderCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)awakeFromNib;
@end

@implementation InteractionFactorsHeaderCell

- (_TtC19HealthMedicationsUI28InteractionFactorsHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell____lazy_storage___subtitleLabel) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionFactorsHeaderCell();
  v8 = -[InteractionFactorsHeaderCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1C1F9C25C();

  return v8;
}

- (_TtC19HealthMedicationsUI28InteractionFactorsHeaderCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell____lazy_storage___subtitleLabel) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractionFactorsHeaderCell();
  return [(InteractionFactorsHeaderCell *)&v6 initWithCoder:a3];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionFactorsHeaderCell();
  id v2 = v3.receiver;
  [(InteractionFactorsHeaderCell *)&v3 awakeFromNib];
  sub_1C1F9C25C();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C1F9C75C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1C1F1CD00((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell____lazy_storage___titleLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionFactorsHeaderCell____lazy_storage___subtitleLabel);
}

@end