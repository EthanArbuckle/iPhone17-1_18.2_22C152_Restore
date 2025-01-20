@interface AKAppleIDPasskeyUnenrollController
- (AKAppleIDPasskeyUnenrollController)init;
- (AKAppleIDPasskeyUnenrollController)initWithPasskeyValidator:(id)a3 unenrollProvider:(id)a4;
@end

@implementation AKAppleIDPasskeyUnenrollController

- (AKAppleIDPasskeyUnenrollController)initWithPasskeyValidator:(id)a3 unenrollProvider:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyUnenrollController_passkeyValidator) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyUnenrollController_unenrollProvider) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(AKAppleIDPasskeyUnenrollController *)&v9 init];
}

- (AKAppleIDPasskeyUnenrollController)init
{
  result = (AKAppleIDPasskeyUnenrollController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end