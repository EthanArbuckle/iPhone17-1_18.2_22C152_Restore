@interface AKPrivateEmailRegistrationService
- (AKPrivateEmailRegistrationService)init;
- (AKPrivateEmailRegistrationService)initWithServiceController:(id)a3;
- (void)fetchSignInWithApplePrivateEmailWith:(AKPrivateEmailContext *)a3 completionHandler:(id)a4;
- (void)performRegistrationWith:(AKPrivateEmailContext *)a3 completionHandler:(id)a4;
@end

@implementation AKPrivateEmailRegistrationService

- (AKPrivateEmailRegistrationService)initWithServiceController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKPrivateEmailRegistrationService_serviceController) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(AKPrivateEmailRegistrationService *)&v8 init];
}

- (void)performRegistrationWith:(AKPrivateEmailContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270860;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100270868;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100270870, (uint64_t)v14);
  swift_release();
}

- (void)fetchSignInWithApplePrivateEmailWith:(AKPrivateEmailContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100270840;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10026FD30;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002701D0, (uint64_t)v14);
  swift_release();
}

- (AKPrivateEmailRegistrationService)init
{
  result = (AKPrivateEmailRegistrationService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end