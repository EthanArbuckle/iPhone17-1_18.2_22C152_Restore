@interface AuthenticationUIServiceViewController
- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)init;
- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)initWithCoder:(id)a3;
- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AuthenticationUIServiceViewController

- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)init
{
  return (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController *)sub_10000E6C4();
}

- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100012F40();
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_100012E94;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10000E7CC(a3, v6, v7);
  sub_100012E4C((uint64_t)v6);
}

- (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AuthenticationUIServiceViewController();
  id v4 = v5.receiver;
  [(AuthenticationUIServiceViewController *)&v5 viewDidDisappear:v3];
  sub_10001002C();
}

@end