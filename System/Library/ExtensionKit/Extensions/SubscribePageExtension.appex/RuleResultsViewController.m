@interface RuleResultsViewController
- (_TtC22SubscribePageExtension25RuleResultsViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension25RuleResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RuleResultsViewController

- (_TtC22SubscribePageExtension25RuleResultsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension25RuleResultsViewController_textView) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension25RuleResultsViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100338258();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1003383E0(a3);
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RuleResultsViewController();
  [(RuleResultsViewController *)&v2 didReceiveMemoryWarning];
}

- (_TtC22SubscribePageExtension25RuleResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension25RuleResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension25RuleResultsViewController_textView);
}

@end