@interface AKAppleIDPasskeyCleanupController
- (AKAppleIDPasskeyCleanupController)init;
- (AKAppleIDPasskeyCleanupController)initWithPasskeyValidator:(id)a3 authenticationController:(id)a4 accountManager:(id)a5;
- (void)cleanupPasskeysFromKeychainWithcompletion:(id)a3;
@end

@implementation AKAppleIDPasskeyCleanupController

- (AKAppleIDPasskeyCleanupController)initWithPasskeyValidator:(id)a3 authenticationController:(id)a4 accountManager:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyCleanupController_passkeyValidator) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyCleanupController_authenticationController) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyCleanupController_accountManager) = (Class)a5;
  v12.receiver = self;
  v12.super_class = ObjectType;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v10 = a5;
  return [(AKAppleIDPasskeyCleanupController *)&v12 init];
}

- (void)cleanupPasskeysFromKeychainWithcompletion:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002701C0;
  v11[5] = v9;
  objc_super v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10026FD30;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_1002701D0, (uint64_t)v12);
  swift_release();
}

- (AKAppleIDPasskeyCleanupController)init
{
  result = (AKAppleIDPasskeyCleanupController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyCleanupController_accountManager);
}

@end