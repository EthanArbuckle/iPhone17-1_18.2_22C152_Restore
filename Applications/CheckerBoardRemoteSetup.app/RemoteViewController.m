@interface RemoteViewController
- (RemoteViewController)initWithCoder:(id)a3;
- (RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_passwordAccepted;
- (void)_passwordPresented:(id)a3;
- (void)_passwordRequested:(id)a3;
- (void)_setupCancelled:(id)a3;
- (void)_setupComplete;
- (void)_setupFailed;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation RemoteViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(void))sub_100009164;
  }
  id v7 = a3;
  v8 = self;
  sub_1000067FC(a3, v6);
  sub_10000911C((uint64_t)v6);
}

- (void)didInvalidateForRemoteAlert
{
  sub_1000063A8(0, (unint64_t *)&qword_100027A40);
  v3 = self;
  id v4 = (id)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_10000707C(a3);
}

- (void)proxCardFlowWillPresent
{
  v3 = self;
  v2 = (void *)sub_100006740();
  if (v2)
  {
    [v2 setStatusBarHidden:1 withDuration:0.0];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10000761C();
}

- (void)_setupComplete
{
  v2 = self;
  sub_1000079FC();
}

- (void)_setupCancelled:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007ACC(v4);
}

- (void)_setupFailed
{
  v2 = self;
  sub_100007E80();
}

- (void)_passwordRequested:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007EE0(v4);
}

- (void)_passwordPresented:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000082B0(v4);
}

- (void)_passwordAccepted
{
  v2 = self;
  sub_100008894();
}

- (RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (RemoteViewController *)sub_100008984(v5, v7, a4);
}

- (RemoteViewController)initWithCoder:(id)a3
{
  return (RemoteViewController *)sub_100008B04(a3);
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___RemoteViewController_remoteSetupManager];
}

@end