@interface HistoricalSampleCell
- (BOOL)isHighlighted;
- (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation HistoricalSampleCell

- (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell *)sub_241261EA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_dateRangeLabel;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell____lazy_storage___chevronImage) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell *)sub_241633038();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HistoricalSampleCell();
  return [(HistoricalSampleCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HistoricalSampleCell();
  id v4 = v8.receiver;
  [(HistoricalSampleCell *)&v8 setHighlighted:v3];
  LODWORD(v3) = objc_msgSend(v4, sel_isHighlighted, v8.receiver, v8.super_class);
  uint64_t v5 = self;
  id v6 = &selRef_quaternarySystemFillColor;
  if (!v3) {
    id v6 = &selRef_secondarySystemGroupedBackgroundColor;
  }
  id v7 = [v5 *v6];
  objc_msgSend(v4, sel_setBackgroundColor_, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_dateRangeLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell____lazy_storage___chevronImage);
}

@end