@interface InteractionResultDetailEducationCell
- (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation InteractionResultDetailEducationCell

- (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell *)sub_1C21121D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___stackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___attributionLabel) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI36InteractionResultDetailEducationCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for InteractionResultDetailEducationCell();
  [(InteractionResultDetailEducationCell *)&v2 awakeFromNib];
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___stackView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI36InteractionResultDetailEducationCell____lazy_storage___attributionLabel);
}

@end