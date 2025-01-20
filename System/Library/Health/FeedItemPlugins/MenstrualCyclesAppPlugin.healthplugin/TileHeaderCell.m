@interface TileHeaderCell
- (BOOL)isHighlighted;
- (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TileHeaderCell

- (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell *)sub_241439D64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell____lazy_storage___tileHeaderView) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin14TileHeaderCell *)sub_241633038();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TileHeaderCell();
  return [(TileHeaderCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_24143A28C(a3);
}

- (void).cxx_destruct
{
  sub_241230E38((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell_item, (unint64_t *)&qword_268CFFE30, (unint64_t *)&qword_268CFF090);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14TileHeaderCell____lazy_storage___tileHeaderView);
}

@end