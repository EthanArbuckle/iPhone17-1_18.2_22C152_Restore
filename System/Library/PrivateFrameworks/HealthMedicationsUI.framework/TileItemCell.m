@interface TileItemCell
- (_TtC19HealthMedicationsUI12TileItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI12TileItemCell)initWithFrame:(CGRect)a3;
@end

@implementation TileItemCell

- (_TtC19HealthMedicationsUI12TileItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI12TileItemCell *)sub_1C1FC9370(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI12TileItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_didTapDismiss);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell____lazy_storage___tileTipView) = 0;
  id v6 = a3;

  result = (_TtC19HealthMedicationsUI12TileItemCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1FCE1E0((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_item, (uint64_t (*)(void))sub_1C1F24488);
  swift_release();
  sub_1C1F31118(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell_didTapDismiss));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI12TileItemCell____lazy_storage___tileTipView);
}

@end