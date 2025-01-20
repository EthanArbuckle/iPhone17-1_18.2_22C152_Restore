@interface HomePodSetupSiriVoiceSelectionViewController
- (_TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4;
- (void)voiceSelectionControllerRequestsDismissal:(id)a3;
@end

@implementation HomePodSetupSiriVoiceSelectionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10005BB20();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10005C1E8(a3, (SEL *)&selRef_viewWillAppear_, "HomePod Setup %@ viewWillAppear");
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupSiriVoiceSelectionViewController();
  id v4 = v5.receiver;
  [(HomePodSetupSiriVoiceSelectionViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10005C1E8(a3, (SEL *)&selRef_viewDidDisappear_, "HomePod Setup %@ viewDidDisappear");
}

- (_TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController_presenter]);

  sub_100017068((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController_viewModel]);
  id v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController_voiceSelectionViewController];
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10005CC1C(v7);
}

- (void)voiceSelectionControllerRequestsDismissal:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10005CE90();
}

@end