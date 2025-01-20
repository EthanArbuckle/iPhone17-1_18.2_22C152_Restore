@interface CycleStatisticsCell
- (BOOL)isHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CycleStatisticsCell

- (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell *)sub_2414F2084(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___valueLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___captionLabel) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2414F24C8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_2414F2A50(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleStatisticsCell();
  return [(CycleStatisticsCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CycleStatisticsCell();
  id v4 = v5.receiver;
  [(CycleStatisticsCell *)&v5 setHighlighted:v3];
  sub_2414F2F50();
}

- (void).cxx_destruct
{
  sub_241299DB8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___valueLabel));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19CycleStatisticsCell____lazy_storage___captionLabel);
}

@end