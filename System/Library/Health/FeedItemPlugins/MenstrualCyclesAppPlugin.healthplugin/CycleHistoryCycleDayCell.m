@interface CycleHistoryCycleDayCell
+ (Class)layerClass;
- (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation CycleHistoryCycleDayCell

+ (Class)layerClass
{
  sub_2411B9D00(0, &qword_268CFDB50);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell *)sub_2413605A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_241361CF8();
}

- (void)applyLayoutAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(CycleHistoryCycleDayCell *)&v6 applyLayoutAttributes:v4];
  sub_24136164C();
}

- (void).cxx_destruct
{
  sub_241361C9C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_day);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_backgroundCapsule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_flowDot));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24CycleHistoryCycleDayCell_supplementaryDataLoggedDot);
}

@end