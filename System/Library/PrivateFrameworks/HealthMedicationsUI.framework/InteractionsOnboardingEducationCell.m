@interface InteractionsOnboardingEducationCell
- (_TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell)initWithFrame:(CGRect)a3;
@end

@implementation InteractionsOnboardingEducationCell

- (_TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[InteractionsOnboardingEducationCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(InteractionsOnboardingEducationCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI35InteractionsOnboardingEducationCell____lazy_storage___labelView);
}

@end