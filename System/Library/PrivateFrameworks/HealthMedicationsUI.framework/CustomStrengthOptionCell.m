@interface CustomStrengthOptionCell
- (_TtC19HealthMedicationsUI24CustomStrengthOptionCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI24CustomStrengthOptionCell)initWithFrame:(CGRect)a3;
- (void)actionButtonTapped;
@end

@implementation CustomStrengthOptionCell

- (_TtC19HealthMedicationsUI24CustomStrengthOptionCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI24CustomStrengthOptionCell *)sub_1C20D3B0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI24CustomStrengthOptionCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  uint64_t v5 = OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_titleLabel;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)sub_1C20D3938();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell____lazy_storage___actionButton) = 0;

  result = (_TtC19HealthMedicationsUI24CustomStrengthOptionCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)actionButtonTapped
{
  v2 = self;
  sub_1C20D451C();
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell____lazy_storage___actionButton);
}

@end