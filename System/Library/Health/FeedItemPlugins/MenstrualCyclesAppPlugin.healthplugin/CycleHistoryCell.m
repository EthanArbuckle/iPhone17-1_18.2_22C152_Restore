@interface CycleHistoryCell
- (BOOL)isHighlighted;
- (UIColor)backgroundColor;
- (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CycleHistoryCell

- (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_item;
  v9 = (objc_class *)type metadata accessor for CycleHistorySingleCycleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  id v10 = objc_allocWithZone(v9);
  v11 = self;
  v12 = (objc_class *)objc_msgSend(v10, sel_init);
  *(Class *)((char *)&v11->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_singleCycleView) = v12;

  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for CycleHistoryCell();
  v13 = -[CycleHistoryCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_2414C01BC();

  return v13;
}

- (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell *)sub_241633038();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryCell();
  return [(CycleHistoryCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_2414BFFA0(a3);
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CycleHistoryCell();
  v2 = [(CycleHistoryCell *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_2414C0700((uint64_t)a3);
}

- (void).cxx_destruct
{
  sub_241299DB8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_item);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_singleCycleView);
}

@end