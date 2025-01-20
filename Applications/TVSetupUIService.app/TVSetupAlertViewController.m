@interface TVSetupAlertViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (_TtC16TVSetupUIService26TVSetupAlertViewController)initWithCoder:(id)a3;
- (_TtC16TVSetupUIService26TVSetupAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSetupAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (uint64_t (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(void))sub_10000C39C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100007FD0(a3, v6, v7);
  sub_10000C354((uint64_t)v6);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TVSetupAlertViewController();
  id v4 = v6.receiver;
  [(TVSetupAlertViewController *)&v6 viewWillAppear:v3];
  v5 = (void *)sub_100007E54();
  if (v5)
  {
    [v5 setStatusBarHidden:1 withDuration:0.0];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000089B4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100008E18(a3);
}

- (_TtC16TVSetupUIService26TVSetupAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16TVSetupUIService26TVSetupAlertViewController *)sub_10000AD54(v5, v7, a4);
}

- (_TtC16TVSetupUIService26TVSetupAlertViewController)initWithCoder:(id)a3
{
  return (_TtC16TVSetupUIService26TVSetupAlertViewController *)sub_10000AF58(a3);
}

- (void).cxx_destruct
{
  sub_10000C458((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier], (uint64_t *)&unk_10001E440);
  swift_bridgeObjectRelease();

  BOOL v3 = *(void **)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController];
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10000BB60((uint64_t)&unk_100018948, (uint64_t)sub_10000B9E0, (uint64_t)&unk_100018960);
}

@end