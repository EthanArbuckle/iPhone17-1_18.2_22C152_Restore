@interface BaseProxFlowViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (_TtC21AppleIDSetupUIService26BaseProxFlowViewController)initWithCoder:(id)a3;
- (_TtC21AppleIDSetupUIService26BaseProxFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_willAppearInRemoteViewController;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BaseProxFlowViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10000458C(a3);
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  id v2 = v4.receiver;
  [(BaseProxFlowViewController *)&v4 _willAppearInRemoteViewController];
  v3 = (void *)sub_1000044C8();
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

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 0);
}

- (_TtC21AppleIDSetupUIService26BaseProxFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController____lazy_storage___device] = 1;
    self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController_homeButtonPressedWhileLocked] = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController____lazy_storage___device] = 1;
    self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController_homeButtonPressedWhileLocked] = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  v9 = [(BaseProxFlowViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC21AppleIDSetupUIService26BaseProxFlowViewController)initWithCoder:(id)a3
{
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController____lazy_storage___device] = 1;
  self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController_homeButtonPressedWhileLocked] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  return [(BaseProxFlowViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end