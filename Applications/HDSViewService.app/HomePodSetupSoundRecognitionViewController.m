@interface HomePodSetupSoundRecognitionViewController
- (_TtC14HDSViewService42HomePodSetupSoundRecognitionViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupSoundRecognitionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000938D8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupSoundRecognitionViewController();
  id v4 = v5.receiver;
  [(HomePodSetupSoundRecognitionViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC14HDSViewService42HomePodSetupSoundRecognitionViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  objc_super v5 = (_TtC14HDSViewService42HomePodSetupSoundRecognitionViewController *)sub_100094FAC((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupSoundRecognitionViewController_presenter]);
  sub_10000F674((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupSoundRecognitionViewController_viewModel], &qword_1000EF130);

  swift_bridgeObjectRelease();
  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService42HomePodSetupSoundRecognitionViewController_myContentView];
}

@end