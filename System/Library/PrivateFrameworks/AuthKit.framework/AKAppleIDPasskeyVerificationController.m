@interface AKAppleIDPasskeyVerificationController
- (AKAppleIDPasskeyVerificationController)init;
- (AKAppleIDPasskeyVerificationController)initWithPasskeyValidator:(id)a3 verificationProvider:(id)a4;
@end

@implementation AKAppleIDPasskeyVerificationController

- (AKAppleIDPasskeyVerificationController)initWithPasskeyValidator:(id)a3 verificationProvider:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyVerificationController_passkeyValidator) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyVerificationController_verificationProvider) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(AKAppleIDPasskeyVerificationController *)&v9 init];
}

- (AKAppleIDPasskeyVerificationController)init
{
  result = (AKAppleIDPasskeyVerificationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end