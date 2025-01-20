@interface SignInOptionAuthenticationController
- (_TtC14AppleIDSetupUI36SignInOptionAuthenticationController)init;
@end

@implementation SignInOptionAuthenticationController

- (_TtC14AppleIDSetupUI36SignInOptionAuthenticationController)init
{
  result = (_TtC14AppleIDSetupUI36SignInOptionAuthenticationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController_aidaOwnersManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController_aidaSignInController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController_navigationController));
  v3 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI36SignInOptionAuthenticationController__isBluetoothDisabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269312EC0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end