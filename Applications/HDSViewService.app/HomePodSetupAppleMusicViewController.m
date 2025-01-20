@interface HomePodSetupAppleMusicViewController
- (_TtC14HDSViewService36HomePodSetupAppleMusicViewController)initWithContentView:(id)a3;
- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HomePodSetupAppleMusicViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000690D0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100069504(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupAppleMusicViewController();
  id v4 = v5.receiver;
  [(HomePodSetupAppleMusicViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC14HDSViewService36HomePodSetupAppleMusicViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC14HDSViewService36HomePodSetupAppleMusicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupAppleMusicViewController_presenter]);
  sub_100017068((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupAppleMusicViewController_viewModel]);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  uint64_t v4 = qword_1000ED800;
  id v5 = a3;
  v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000133A0(v6, (uint64_t)qword_1000EF640);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "HomePodSetupAppleMusicViewController: SKCloudServiceSetupViewController dismissed.\n", v9, 2u);
    swift_slowDealloc();
  }

  sub_10006A470();
}

@end