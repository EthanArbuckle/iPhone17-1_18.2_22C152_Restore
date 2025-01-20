@interface FMRemoteUIAlertServiceViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController)initWithCoder:(id)a3;
- (_TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation FMRemoteUIAlertServiceViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(void))sub_10000E20C;
  }
  id v7 = a3;
  v8 = self;
  sub_10000BE38(a3, v6);
  sub_10000D990((uint64_t)v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    id v7 = sub_10000D9D8;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = qword_100019620;
  id v9 = a3;
  v14 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_1000075A4(v10, (uint64_t)qword_1000198B0);
  v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "prepareForActivation(with context:, completion:) being called", v13, 2u);
    swift_slowDealloc();
  }

  if (v6)
  {
    v7();
    sub_10000D990((uint64_t)v7);
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(FMRemoteUIAlertServiceViewController *)&v3 viewDidLoad];
  sub_10000C2C8();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_10000C8F4();
}

- (_TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
    *(void *)uint64_t v8 = 0;
    *((void *)v8 + 1) = 0;
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = 0;
    id v9 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
    *(void *)uint64_t v10 = 0;
    *((void *)v10 + 1) = 0;
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = 0;
    id v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  os_log_type_t v12 = [(FMRemoteUIAlertServiceViewController *)&v14 initWithNibName:a3 bundle:a4];

  return v12;
}

- (_TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(FMRemoteUIAlertServiceViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_release();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end