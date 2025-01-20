@interface HomePodSetupSiriWelcomeViewController
- (_TtC14HDSViewService37HomePodSetupSiriWelcomeViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HomePodSetupSiriWelcomeViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006C39C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupSiriWelcomeViewController();
  id v4 = v5.receiver;
  [(HomePodSetupSiriWelcomeViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomePodSetupSiriWelcomeViewController();
  id v4 = v9.receiver;
  [(HomePodSetupSiriWelcomeViewController *)&v9 viewWillDisappear:v3];
  if (qword_1000ED810 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000133A0(v5, (uint64_t)qword_1000EF790);
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "HomePodSetupSiriWelcome: viewWillDisappear was called.", v8, 2u);
    swift_slowDealloc();
  }
}

- (_TtC14HDSViewService37HomePodSetupSiriWelcomeViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC14HDSViewService37HomePodSetupSiriWelcomeViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupSiriWelcomeViewController_viewModel];
  uint64_t v6 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomePodSetupSiriWelcomeViewController();
  return [(HomePodSetupSiriWelcomeViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end