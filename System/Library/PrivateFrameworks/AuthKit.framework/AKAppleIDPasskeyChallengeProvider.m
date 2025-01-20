@interface AKAppleIDPasskeyChallengeProvider
- (AKAppleIDPasskeyChallengeProvider)init;
- (AKAppleIDPasskeyChallengeProvider)initWithServiceController:(id)a3 accountManager:(id)a4;
- (void)performChallengeRequestWithCompletionHandler:(id)a3;
@end

@implementation AKAppleIDPasskeyChallengeProvider

- (AKAppleIDPasskeyChallengeProvider)initWithServiceController:(id)a3 accountManager:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyChallengeProvider_serviceController) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyChallengeProvider_accountManager) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v8 = a3;
  id v9 = a4;
  return [(AKAppleIDPasskeyChallengeProvider *)&v11 init];
}

- (void)performChallengeRequestWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  objc_super v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002712C0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10026FD30;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_1002701D0, (uint64_t)v12);
  swift_release();
}

- (AKAppleIDPasskeyChallengeProvider)init
{
  result = (AKAppleIDPasskeyChallengeProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyChallengeProvider_accountManager);
}

@end