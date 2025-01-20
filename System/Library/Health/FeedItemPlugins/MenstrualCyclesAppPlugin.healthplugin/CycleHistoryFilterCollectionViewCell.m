@interface CycleHistoryFilterCollectionViewCell
- (BOOL)isSelected;
- (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CycleHistoryFilterCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell *)sub_2414480D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_label;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_highlightColor;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(self, sel_hkmc_cycleHistoryFilterBackgroundColor);
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_labelString);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryFilterCollectionViewCell();
  return [(CycleHistoryFilterCollectionViewCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CycleHistoryFilterCollectionViewCell();
  id v4 = v5.receiver;
  [(CycleHistoryFilterCollectionViewCell *)&v5 setSelected:v3];
  sub_241448378();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_highlightColor));

  swift_bridgeObjectRelease();
}

@end