@interface RemoteEngagementViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithCoder:(id)a3;
- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)handleButtonActions:(id)a3;
- (void)loadView;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RemoteEngagementViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_10000E800;
  }
  id v7 = a3;
  v8 = self;
  sub_100008D18();
  sub_100004A54((uint64_t)v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_10000E7F0;
  }
  id v7 = a3;
  v8 = self;
  sub_100009318();
  sub_100004A54((uint64_t)v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_1000079A8(0, &qword_10001E8C8);
    sub_10000DB58();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_10000978C(v4);

  swift_bridgeObjectRelease();
}

- (void)loadView
{
  v2 = self;
  sub_100009B28();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100009C10();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100009F78(a3, (SEL *)&selRef_viewWillAppear_, (uint64_t (*)(uint64_t, uint64_t))&ViewControllerPresenter.viewWillAppear());
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100009D60(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100009E0C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100009F78(a3, (SEL *)&selRef_viewDidDisappear_, (uint64_t (*)(uint64_t, uint64_t))&ViewControllerPresenter.viewDidDisappear());
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_10000A094();
}

- (void)dealloc
{
  v2 = self;
  sub_10000B338();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(void **)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task];
}

- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24AMSEngagementViewService30RemoteEngagementViewController *)sub_10000D3A0(v5, v7, a4);
}

- (_TtC24AMSEngagementViewService30RemoteEngagementViewController)initWithCoder:(id)a3
{
  return (_TtC24AMSEngagementViewService30RemoteEngagementViewController *)sub_10000D4EC(a3);
}

@end