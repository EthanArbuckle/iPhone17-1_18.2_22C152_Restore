@interface HomePodSetupFileTransferViewController
- (_TtC14HDSViewService38HomePodSetupFileTransferViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupFileTransferViewController

- (_TtC14HDSViewService38HomePodSetupFileTransferViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  return (_TtC14HDSViewService38HomePodSetupFileTransferViewController *)sub_100011074(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100011248();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupFileTransferViewController();
  id v4 = v5.receiver;
  [(HomePodSetupFileTransferViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_presenter]);
  sub_10000F674((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_viewModel], &qword_1000EF130);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end