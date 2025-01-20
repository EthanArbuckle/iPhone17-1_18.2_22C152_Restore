@interface PregnancyModeTimelineCell
- (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell)initWithFrame:(CGRect)a3;
@end

@implementation PregnancyModeTimelineCell

- (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell *)sub_241493E64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_updateCurrentDayOperation) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_updateCurrentDayOperation));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25PregnancyModeTimelineCell_item;

  sub_241299DB8((uint64_t)v3);
}

@end