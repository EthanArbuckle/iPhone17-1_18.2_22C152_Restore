@interface RemoteAlertServiceViewController
- (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController)initWithCoder:(id)a3;
- (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)extensionDeviceLostWithNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RemoteAlertServiceViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(void))sub_100005940;
  }
  id v7 = a3;
  v8 = self;
  sub_1000038D0(a3, v6);
  sub_1000058F8((uint64_t)v6);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  id v2 = v7.receiver;
  [(RemoteAlertServiceViewController *)&v7 viewDidLoad];
  if (qword_100015C10 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000520C(v3, (uint64_t)qword_100015D58);
  v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting HomeCaptiveViewService", v6, 2u);
    swift_slowDealloc();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100003F3C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000040F0(a3);
}

- (void)didInvalidateForRemoteAlert
{
  uint64_t v2 = qword_100015C10;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000520C(v4, (uint64_t)qword_100015D58);
  oslog = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "Invalidated HomeCaptiveViewService", v6, 2u);
    swift_slowDealloc();
  }
}

- (void)extensionDeviceLostWithNotification:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = self;
  sub_1000043C0(v4);
}

- (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController *)sub_100004E84(v5, v7, a4);
}

- (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController)initWithCoder:(id)a3
{
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController] = 1;
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator] = 0;
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  return [(RemoteAlertServiceViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1000058D8(*(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController]);

  uint64_t v3 = *(void **)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter];
}

@end