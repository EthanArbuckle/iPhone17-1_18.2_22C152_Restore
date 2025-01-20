@interface HomePodSetupAMSUpsellViewController
- (_TtC14HDSViewService35HomePodSetupAMSUpsellViewController)initWithContentView:(id)a3;
- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupAMSUpsellViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100060BDC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupAMSUpsellViewController();
  id v4 = v5.receiver;
  [(HomePodSetupAMSUpsellViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC14HDSViewService35HomePodSetupAMSUpsellViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC14HDSViewService35HomePodSetupAMSUpsellViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001371C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupAMSUpsellViewController_presenter]);
  sub_100017068((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupAMSUpsellViewController_viewModel]);

  id v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupAMSUpsellViewController_marketingItem];
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  if (a4) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_100061E0C(v9, v8, (uint64_t)a5);

  swift_bridgeObjectRelease();
}

@end