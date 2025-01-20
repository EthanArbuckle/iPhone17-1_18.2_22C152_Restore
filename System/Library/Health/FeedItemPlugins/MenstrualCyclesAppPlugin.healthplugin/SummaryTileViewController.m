@interface SummaryTileViewController
- (NSString)title;
- (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)respondToTraitCollectionChanges;
- (void)significantTimeChangeDidOccur;
- (void)userPreferredUnitChanged;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SummaryTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2415D1B20();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SummaryTileViewController();
  id v2 = v3.receiver;
  [(SummaryTileViewController *)&v3 viewDidLayoutSubviews];
  sub_2415D3B4C();
}

- (void)respondToTraitCollectionChanges
{
  id v2 = self;
  sub_2415D3098();
}

- (void)userPreferredUnitChanged
{
  id v2 = self;
  sub_2415D488C();
}

- (void)significantTimeChangeDidOccur
{
  id v2 = self;
  sub_2415D48FC();
}

- (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *)sub_2415D5084(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *)sub_2415D5254(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_supplementaryValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_valueLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_valueLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_supplementaryLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_pillViewHiddenConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_relativeLabelHiddenConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_pregnancyModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_daySummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_calendarCache));
  sub_2415D6A94((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_context, (uint64_t (*)(void))sub_2415D6414);

  swift_release();
}

- (NSString)title
{
  id v2 = self;
  sub_2415D56FC();
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