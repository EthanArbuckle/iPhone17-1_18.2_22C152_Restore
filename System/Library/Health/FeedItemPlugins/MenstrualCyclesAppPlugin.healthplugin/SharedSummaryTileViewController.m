@interface SharedSummaryTileViewController
- (NSString)title;
- (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation SharedSummaryTileViewController

- (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController *)sub_241277230(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24127A554();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_241277614();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24127A688();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_valueLabel));
  sub_24127AD3C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_projectionViewModel, &qword_26B00E948, (void (*)(uint64_t))type metadata accessor for SharedProjectionHighlightTileViewModelContextData);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___dayDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___monthDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___yearDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___longMonthDayDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___monthDayYearDateFormatter));
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_context;

  sub_24125DCE8((uint64_t)v3);
}

- (NSString)title
{
  v2 = self;
  sub_241279FC4();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

@end