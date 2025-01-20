@interface HearingTestDetailedResultsViewController
- (_TtC13HearingTestUI40HearingTestDetailedResultsViewController)initWithCoder:(id)a3;
- (_TtC13HearingTestUI40HearingTestDetailedResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation HearingTestDetailedResultsViewController

- (_TtC13HearingTestUI40HearingTestDetailedResultsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2513FE784();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2513FC7D4();
}

- (_TtC13HearingTestUI40HearingTestDetailedResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13HearingTestUI40HearingTestDetailedResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI40HearingTestDetailedResultsViewController_audiogramSample));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI40HearingTestDetailedResultsViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI40HearingTestDetailedResultsViewController_chartController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI40HearingTestDetailedResultsViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI40HearingTestDetailedResultsViewController_scrollViewContainer));

  swift_bridgeObjectRelease();
}

@end