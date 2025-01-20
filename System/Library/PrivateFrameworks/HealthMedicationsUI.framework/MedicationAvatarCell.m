@interface MedicationAvatarCell
- (_TtC19HealthMedicationsUI20MedicationAvatarCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI20MedicationAvatarCell)initWithFrame:(CGRect)a3;
- (void)editButtonTappedWithSender:(id)a3;
@end

@implementation MedicationAvatarCell

- (_TtC19HealthMedicationsUI20MedicationAvatarCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___pillImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___editButton) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationAvatarCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicationAvatarCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C1F69D6C();

  return v10;
}

- (_TtC19HealthMedicationsUI20MedicationAvatarCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___pillImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___editButton) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI20MedicationAvatarCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)editButtonTappedWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C214B5A0();
  swift_unknownObjectRelease();
  sub_1C1F6A750();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___pillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell____lazy_storage___editButton));
  sub_1C1F6B138((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationAvatarCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

@end