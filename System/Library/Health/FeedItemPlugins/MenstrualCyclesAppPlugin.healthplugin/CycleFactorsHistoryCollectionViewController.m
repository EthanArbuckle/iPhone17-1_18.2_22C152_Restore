@interface CycleFactorsHistoryCollectionViewController
- (_TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController)initWithCoder:(id)a3;
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)pushAddFactorView;
- (void)viewDidLoad;
@end

@implementation CycleFactorsHistoryCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_collectionViewSections) = (Class)MEMORY[0x263F8EE78];
  v4 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_numOngoingFactors;
  *(void *)v4 = 0;
  v4[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_collectionViewSource) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(CycleFactorsHistoryCollectionViewController *)&v3 viewDidLoad];
  sub_2415BF1C8();
  sub_2413E77B8();
}

- (void)pushAddFactorView
{
  id v2 = self;
  sub_2415BFD98();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleFactorsHistoryCollectionViewController_collectionViewSource);
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2415C1A80(v7);
}

@end