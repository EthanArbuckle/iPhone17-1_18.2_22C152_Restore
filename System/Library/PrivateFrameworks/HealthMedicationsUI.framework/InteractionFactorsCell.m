@interface InteractionFactorsCell
- (_TtC19HealthMedicationsUI22InteractionFactorsCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI22InteractionFactorsCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)awakeFromNib;
- (void)editButtonTapped:(id)a3;
- (void)layoutSubviews;
@end

@implementation InteractionFactorsCell

- (_TtC19HealthMedicationsUI22InteractionFactorsCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI22InteractionFactorsCell *)sub_1C207D0F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI22InteractionFactorsCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI22InteractionFactorsCell *)sub_1C207D1F8(a3);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionFactorsCell();
  id v2 = v3.receiver;
  [(InteractionFactorsCell *)&v3 awakeFromNib];
  sub_1C207D324();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C207D750();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1C207DA34();
}

- (void)editButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1C214B5A0();
  swift_unknownObjectRelease();
  sub_1C207F320();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22InteractionFactorsCell____lazy_storage___editButton));

  swift_bridgeObjectRelease();
}

@end