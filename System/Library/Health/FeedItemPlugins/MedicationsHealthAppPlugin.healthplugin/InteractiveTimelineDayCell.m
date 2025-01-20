@interface InteractiveTimelineDayCell
- (NSDate)axTimelineDay;
- (NSDate)startDate;
- (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell)initWithFrame:(CGRect)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation InteractiveTimelineDayCell

- (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell *)sub_2410D6EF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell)initWithCoder:(id)a3
{
  return (_TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell *)sub_2410D7274(a3);
}

- (NSDate)startDate
{
  uint64_t v3 = sub_24115CB10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_24115CAA0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v8;
}

- (void)setStartDate:(id)a3
{
  uint64_t v4 = sub_24115CB10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CAE0();
  v8 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2410D9894(v4);
}

- (NSDate)axTimelineDay
{
  uint64_t v3 = sub_24115CB10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_24115CAA0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2410DB514((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_gregorianCalendar, &qword_26B007210, MEMORY[0x263F07920]);
  sub_2410DB374((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_timelineDay, (uint64_t (*)(void))type metadata accessor for TimelineDay);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_startDate;
  uint64_t v4 = sub_24115CB10();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___dayOfWeekLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___formatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___logIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell____lazy_storage___pill));
  uint64_t v5 = *(CALayer **)((char *)&self->super.super.super._layerRetained
                   + OBJC_IVAR____TtC26MedicationsHealthAppPlugin26InteractiveTimelineDayCell_configuration);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_2410DA3D4(v6, v4);
}

@end