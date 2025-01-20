@interface InteractionSummaryItemCell
- (_TtC19HealthMedicationsUI26InteractionSummaryItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI26InteractionSummaryItemCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)awakeFromNib;
@end

@implementation InteractionSummaryItemCell

- (_TtC19HealthMedicationsUI26InteractionSummaryItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI26InteractionSummaryItemCell *)sub_1C21099CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI26InteractionSummaryItemCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI26InteractionSummaryItemCell *)sub_1C2109AE4(a3);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionSummaryItemCell();
  id v2 = v3.receiver;
  [(InteractionSummaryItemCell *)&v3 awakeFromNib];
  sub_1C2109C28();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C210A2E8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1C1F1CD00((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell_chevronView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionSummaryItemCell____lazy_storage___subtitleView);
}

@end