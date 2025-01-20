@interface CycleFactorsDaySummaryCollectionViewController
- (_TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController)initWithCoder:(id)a3;
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)pushAddFactorView;
- (void)viewDidLoad;
- (void)viewModelProviderDidUpdate:(id)a3;
@end

@implementation CycleFactorsDaySummaryCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_ongoingCycleFactors) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_collectionViewSource) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(CycleFactorsDaySummaryCollectionViewController *)&v3 viewDidLoad];
  sub_2414CCE00();
  sub_2414CD588();
}

- (void)pushAddFactorView
{
  id v2 = self;
  sub_2414CD7A0();
}

- (void)viewModelProviderDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2414CD960(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_viewModelProvider));
  swift_release();
  swift_release();
  sub_241361C9C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_cycleDay);
  objc_super v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_gregorianCalendar;
  uint64_t v4 = sub_24162BA08();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46CycleFactorsDaySummaryCollectionViewController_collectionViewSource);
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2414CE738(v7);
}

@end