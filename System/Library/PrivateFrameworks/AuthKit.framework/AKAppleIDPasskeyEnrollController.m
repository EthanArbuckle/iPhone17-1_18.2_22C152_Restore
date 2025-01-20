@interface AKAppleIDPasskeyEnrollController
+ (id)challengeProviderWithContext:(id)a3 client:(id)a4;
+ (id)registrationProviderWithContext:(id)a3 client:(id)a4;
- (AKAppleIDPasskeyEnrollController)init;
- (AKAppleIDPasskeyEnrollController)initWithPasskeyValidator:(id)a3 challengeProvider:(id)a4 credentialProvider:(id)a5 registrationProvider:(id)a6;
- (void)setupPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 forced:(BOOL)a4 completion:(id)a5;
@end

@implementation AKAppleIDPasskeyEnrollController

- (AKAppleIDPasskeyEnrollController)initWithPasskeyValidator:(id)a3 challengeProvider:(id)a4 credentialProvider:(id)a5 registrationProvider:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyEnrollController_passkeyValidator) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyEnrollController_challengeProvider) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyEnrollController_credentialProvider) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyEnrollController_registrationProvider) = (Class)a6;
  v13.receiver = self;
  v13.super_class = ObjectType;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(AKAppleIDPasskeyEnrollController *)&v13 init];
}

- (void)setupPasskeyWithContext:(AKAppleIDPasskeySetupContext *)a3 forced:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10026FF68;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10026FD30;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_1001538E0((uint64_t)v11, (uint64_t)&unk_1002701D0, (uint64_t)v16);
  swift_release();
}

+ (id)challengeProviderWithContext:(id)a3 client:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1000DB200(v5, (uint64_t)a4);

  return v7;
}

+ (id)registrationProviderWithContext:(id)a3 client:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1000DB6D0(v5, (uint64_t)a4);

  return v7;
}

- (AKAppleIDPasskeyEnrollController)init
{
  result = (AKAppleIDPasskeyEnrollController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end