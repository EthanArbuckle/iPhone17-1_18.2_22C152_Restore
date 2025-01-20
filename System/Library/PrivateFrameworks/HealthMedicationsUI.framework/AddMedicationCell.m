@interface AddMedicationCell
- (_TtC19HealthMedicationsUI17AddMedicationCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI17AddMedicationCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)actionButtonTappedWithSender:(id)a3;
@end

@implementation AddMedicationCell

- (_TtC19HealthMedicationsUI17AddMedicationCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell____lazy_storage___addMedicationView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AddMedicationCell();
  v8 = -[AddMedicationCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1C1F8BA24();

  return v8;
}

- (_TtC19HealthMedicationsUI17AddMedicationCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell____lazy_storage___addMedicationView) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI17AddMedicationCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C1F8BD6C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)actionButtonTappedWithSender:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1C214B5A0();
  swift_unknownObjectRelease();
  sub_1C1F8C100();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void).cxx_destruct
{
  sub_1C1F8C99C((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationCell____lazy_storage___addMedicationView);
}

@end