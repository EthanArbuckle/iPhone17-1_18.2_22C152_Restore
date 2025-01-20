@interface HighlightCalendarDayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDate)axDate;
- (NSString)axProjectionKind;
- (_TtC19HealthVisualization24HighlightCalendarDayView)initWithCoder:(id)a3;
- (_TtC19HealthVisualization24HighlightCalendarDayView)initWithFrame:(CGRect)a3;
- (int64_t)axCircleState;
- (int64_t)axProbability;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
@end

@implementation HighlightCalendarDayView

- (NSDate)axDate
{
  sub_1C2A29BB0(0, &qword_1EBB92520, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - v4;
  v6 = self;
  sub_1C2A27DF0((uint64_t)v5);

  uint64_t v7 = sub_1C2A9C6E8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1C2A9C658();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (int64_t)axProbability
{
  sub_1C2A29BB0(0, (unint64_t *)&qword_1EBB90668, type metadata accessor for AXProjectionState, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v14 - v4;
  uint64_t v6 = type metadata accessor for AXProjectionState(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model;
  uint64_t v11 = type metadata accessor for HighlightCalendarDayViewModel(0);
  sub_1C2A299CC((uint64_t)&v10[*(int *)(v11 + 52)], (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1C2A29A60((uint64_t)v5);
    return 0;
  }
  else
  {
    sub_1C2A29AEC((uint64_t)v5, (uint64_t)v9);
    int64_t v12 = *(void *)&v9[*(int *)(v6 + 20)];
    sub_1C2A29B50((uint64_t)v9, type metadata accessor for AXProjectionState);
  }
  return v12;
}

- (NSString)axProjectionKind
{
  sub_1C2A29BB0(0, (unint64_t *)&qword_1EBB90668, type metadata accessor for AXProjectionState, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v15 - v4;
  uint64_t v6 = type metadata accessor for AXProjectionState(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model;
  uint64_t v11 = type metadata accessor for HighlightCalendarDayViewModel(0);
  sub_1C2A299CC((uint64_t)&v10[*(int *)(v11 + 52)], (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1C2A29A60((uint64_t)v5);
  }
  else
  {
    sub_1C2A29AEC((uint64_t)v5, (uint64_t)v9);
    uint64_t v12 = *(void *)&v9[*(int *)(v6 + 24) + 8];
    swift_bridgeObjectRetain();
    sub_1C2A29B50((uint64_t)v9, type metadata accessor for AXProjectionState);
    if (v12)
    {
      v13 = (void *)sub_1C2A9DCF8();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  v13 = 0;
LABEL_6:
  return (NSString *)v13;
}

- (int64_t)axCircleState
{
  return qword_1C2AADDE0[*((char *)&self->super._traitChangeRegistry
                         + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model)];
}

- (_TtC19HealthVisualization24HighlightCalendarDayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_dayLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_todayIndicatorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_activityRingsView) = 0;
  id v4 = a3;

  result = (_TtC19HealthVisualization24HighlightCalendarDayView *)sub_1C2A9E628();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = self;
  id v4 = [(HighlightCalendarDayView *)v3 traitCollection];
  id v5 = objc_msgSend(v4, sel_preferredContentSizeCategory);

  char v9 = *((unsigned char *)&v3->super._viewDelegate + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model + 1);
  double v6 = sub_1C2A29844((uint64_t)v5, &v9);

  double v7 = v6;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2A288F8();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HighlightCalendarDayView();
  id v4 = a3;
  id v5 = (char *)v8.receiver;
  [(HighlightCalendarDayView *)&v8 layoutSublayersOfLayer:v4];
  double v6 = *(void **)&v5[OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_todayIndicatorLayer];
  if (v6)
  {
    double v7 = v6;
    objc_msgSend(v5, sel_bounds, v8.receiver, v8.super_class);
    objc_msgSend(v7, sel_setFrame_);

    id v4 = v5;
    id v5 = v7;
  }
}

- (_TtC19HealthVisualization24HighlightCalendarDayView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC19HealthVisualization24HighlightCalendarDayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C2A29B50((uint64_t)self + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model, type metadata accessor for HighlightCalendarDayViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_todayIndicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_ringsRenderer));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_activityRingsView);
}

@end