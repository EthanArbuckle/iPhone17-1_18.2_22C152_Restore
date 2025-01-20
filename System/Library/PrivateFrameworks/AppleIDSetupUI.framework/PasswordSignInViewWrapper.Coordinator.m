@interface PasswordSignInViewWrapper.Coordinator
- (_TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator)init;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
- (void)signInControllerDidSelectChildSignIn:(id)a3;
- (void)signInControllerDidSkip:(id)a3;
@end

@implementation PasswordSignInViewWrapper.Coordinator

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  sub_2482F827C();
  uint64_t v6 = sub_24835D3A8();
  id v7 = a3;
  v8 = self;
  sub_2482F7F88(v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidSkip:(id)a3
{
  v3 = (void (*)(uint64_t))(*(void **)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator_settings))[5];
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_2482F5D48((uint64_t)v3);
    v3(v6);
    sub_2482F50B4((uint64_t)v3);
  }
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2482F807C();
}

- (void)signInControllerDidSelectChildSignIn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2482F6F70(v4);
}

- (_TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator)init
{
  result = (_TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2482F7C64((uint64_t)self+ OBJC_IVAR____TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator__navigationPath);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV14AppleIDSetupUIP33_85689B8AC63EBED6BFEFA05FE764FEC725PasswordSignInViewWrapper11Coordinator_childSetupController);
}

@end