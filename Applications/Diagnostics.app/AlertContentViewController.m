@interface AlertContentViewController
- (_TtC11Diagnostics26AlertContentViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics26AlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation AlertContentViewController

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AlertContentViewController();
  id v2 = v11.receiver;
  [(AlertContentViewController *)&v11 viewDidLayoutSubviews];
  id v3 = [v2 view];
  if (v3)
  {
    v6 = v3;
    LODWORD(v4) = 1112014848;
    LODWORD(v5) = 1112014848;
    [v3 systemLayoutSizeFittingSize:1.79769313e308 withHorizontalFittingPriority:1.79769313e308 verticalFittingPriority:v4 v5];
    double v8 = v7;
    double v10 = v9;

    [v2 preferredContentSize];
    v13.width = v8;
    v13.height = v10;
    if (!CGSizeEqualToSize(v12, v13)) {
      [v2 setPreferredContentSize:v8, v10];
    }
  }
  else
  {
    __break(1u);
  }
}

- (_TtC11Diagnostics26AlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AlertContentViewController();
  double v9 = [(AlertContentViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC11Diagnostics26AlertContentViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AlertContentViewController();
  return [(AlertContentViewController *)&v5 initWithCoder:a3];
}

@end