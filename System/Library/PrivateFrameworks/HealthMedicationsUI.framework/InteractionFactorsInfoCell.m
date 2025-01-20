@interface InteractionFactorsInfoCell
- (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation InteractionFactorsInfoCell

- (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell *)sub_1C20FD37C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI26InteractionFactorsInfoCell *)sub_1C20FD4A8(a3);
}

- (void)awakeFromNib
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractionFactorsInfoCell();
  id v2 = v6.receiver;
  [(InteractionFactorsInfoCell *)&v6 awakeFromNib];
  sub_1C20FD68C();
  sub_1C20FD988();
  uint64_t v4 = sub_1C214A5F0();
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  swift_bridgeObjectRelease();
  sub_1C20FE814(v4, v5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell_item);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___criticalHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___criticalBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___seriousHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___seriousBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___moderateHeaderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___moderateBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___minorHeaderLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI26InteractionFactorsInfoCell____lazy_storage___minorBodyLabel);
}

@end