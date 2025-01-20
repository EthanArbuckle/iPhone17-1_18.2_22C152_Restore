@interface AKAppleIDPasskeyValidator
- (AKAppleIDPasskeyValidator)init;
- (AKAppleIDPasskeyValidator)initWithAccount:(id)a3 accountManager:(id)a4 featureManager:(id)a5 configuration:(id)a6 device:(id)a7 cdpFactory:(id)a8 authenticationController:(id)a9;
- (BOOL)canVerifyPasskey;
- (void)canCreatePasskeyWithForced:(BOOL)a3 completionHandler:(id)a4;
- (void)canDeleteAllPasskeysWithCompletionHandler:(id)a3;
- (void)canUnenrollPasskeyWithForced:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation AKAppleIDPasskeyValidator

- (AKAppleIDPasskeyValidator)initWithAccount:(id)a3 accountManager:(id)a4 featureManager:(id)a5 configuration:(id)a6 device:(id)a7 cdpFactory:(id)a8 authenticationController:(id)a9
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_account) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_accountManager) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_featureManager) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_configuration) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_device) = (Class)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_cdpFactory) = (Class)a8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyValidator_authenticationController) = (Class)a9;
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for AppleIDPasskeyValidator();
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  swift_unknownObjectRetain();
  return [(AKAppleIDPasskeyValidator *)&v22 init];
}

- (void)canCreatePasskeyWithForced:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270078;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100270080;
  v14[5] = v13;
  id v15 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271FA0, (uint64_t)v14);
  swift_release();
}

- (void)canUnenrollPasskeyWithForced:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270058;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100270060;
  v14[5] = v13;
  id v15 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100270068, (uint64_t)v14);
  swift_release();
}

- (BOOL)canVerifyPasskey
{
  v2 = self;
  char v3 = sub_1000DD6A4();

  return v3 & 1;
}

- (void)canDeleteAllPasskeysWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100270048;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10026FD30;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_1002701D0, (uint64_t)v12);
  swift_release();
}

- (AKAppleIDPasskeyValidator)init
{
  result = (AKAppleIDPasskeyValidator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end