@interface AKAppleIDPasskeyStatusController
- (AKAppleIDPasskeyStatusController)init;
- (AKAppleIDPasskeyStatusController)initWithAccountManager:(id)a3;
@end

@implementation AKAppleIDPasskeyStatusController

- (AKAppleIDPasskeyStatusController)initWithAccountManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyStatusController_accountManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(AKAppleIDPasskeyStatusController *)&v8 init];
}

- (AKAppleIDPasskeyStatusController)init
{
  result = (AKAppleIDPasskeyStatusController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end