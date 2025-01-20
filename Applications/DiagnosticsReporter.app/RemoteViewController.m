@interface RemoteViewController
- (_TtC19DiagnosticsReporter20RemoteViewController)initWithCoder:(id)a3;
- (_TtC19DiagnosticsReporter20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RemoteViewController

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_10000D294();
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)didInvalidateForRemoteAlert
{
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10000D98C;
  }
  id v7 = a3;
  v8 = self;
  sub_10000D590(v6);
  sub_10000D8C8((uint64_t)v6);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10000D98C;
  }
  id v7 = a3;
  v8 = self;
  sub_10000C28C(a3, v6);
  sub_10000D8C8((uint64_t)v6);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v6 = sub_10000D910;
  }
  else
  {
    v6 = 0;
  }
  id v7 = self;
  sub_10000D724();
  sub_10000D8C8((uint64_t)v6);
}

- (_TtC19DiagnosticsReporter20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((void *)v6 + 4) = 0;
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = 0;
    id v7 = a4;
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((void *)v9 + 4) = 0;
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = 0;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RemoteViewController();
  v11 = [(RemoteViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC19DiagnosticsReporter20RemoteViewController)initWithCoder:(id)a3
{
  v4 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteViewController();
  return [(RemoteViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100006D54((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog], &qword_10001DE28);

  swift_release();
}

@end