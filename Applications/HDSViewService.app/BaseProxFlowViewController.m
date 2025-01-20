@interface BaseProxFlowViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)shouldAutorotate;
- (_TtC14HDSViewService26BaseProxFlowViewController)initWithCoder:(id)a3;
- (_TtC14HDSViewService26BaseProxFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_willAppearInRemoteViewController;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BaseProxFlowViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100099800(a3);
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  id v2 = v4.receiver;
  [(BaseProxFlowViewController *)&v4 _willAppearInRemoteViewController];
  v3 = (void *)sub_100099744();
  if (v3)
  {
    [v3 setAllowsAlertStacking:1];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  return SFDeviceClassCodeGet() == 3;
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = self;
  if (SFDeviceClassCodeGet() == 3) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = PRXSupportedInterfaceOrientations();
  }

  return v3;
}

- (_TtC14HDSViewService26BaseProxFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  v9 = [(BaseProxFlowViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC14HDSViewService26BaseProxFlowViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  return [(BaseProxFlowViewController *)&v5 initWithCoder:a3];
}

@end