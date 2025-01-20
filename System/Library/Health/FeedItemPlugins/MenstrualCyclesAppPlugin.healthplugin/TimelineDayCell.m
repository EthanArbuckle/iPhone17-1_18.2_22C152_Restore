@interface TimelineDayCell
- (HKMCDayViewModel)axCycleDayViewModel;
- (NSDate)axCycleDay;
- (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell)initWithFrame:(CGRect)a3;
- (void)adaptToColorSchemeChanges;
- (void)adaptToContentSizeChanges;
- (void)adaptToHorizontalSizeChanges;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation TimelineDayCell

- (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell *)sub_241369688(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin15TimelineDayCell *)sub_2413699B8(a3);
}

- (void)adaptToContentSizeChanges
{
  v2 = self;
  sub_24136C228();
}

- (void)adaptToColorSchemeChanges
{
  v2 = self;
  sub_24136C414();
}

- (void)adaptToHorizontalSizeChanges
{
  v2 = self;
  sub_24136BEDC();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24136C5F8(v4);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TimelineDayCell(0);
  v2 = v4.receiver;
  [(TimelineDayCell *)&v4 layoutSubviews];
  uint64_t v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_didUpdateFromCycleDay;
  if (v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_didUpdateFromCycleDay] == 1)
  {
    sub_24136C7C8();
    v2[v3] = 0;
  }
}

- (HKMCDayViewModel)axCycleDayViewModel
{
  v2 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_cycleDay;
  swift_beginAccess();
  return (HKMCDayViewModel *)objc_retainAutoreleaseReturnValue(*(id *)&v2[*(int *)(type metadata accessor for CycleDay()
                                                                                 + 20)]);
}

- (NSDate)axCycleDay
{
  uint64_t v3 = sub_24162B718();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_startDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_24162B668();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___dayOfWeekLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___formatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___logIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___bleedingIndicator));
  sub_24136EBDC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_gregorianCalendar);
  swift_bridgeObjectRelease();
  sub_241361C9C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_cycleDay);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell_startDate;
  uint64_t v4 = sub_24162B718();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___fertilityProjectionReversed));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___menstruationProjectionHighReversed));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15TimelineDayCell____lazy_storage___menstruationProjectionLowReversed);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_24136DA18(v6, v4);
}

@end