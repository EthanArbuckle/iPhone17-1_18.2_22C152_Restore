@interface AppleIDPasskeyVerificationProvider
- (_TtC3akd34AppleIDPasskeyVerificationProvider)initWithServiceController:(id)a3 accountManager:(id)a4;
- (void)performVerificationRequestWith:(AKAppleIDPasskeySetupContext *)a3 completionHandler:(id)a4;
@end

@implementation AppleIDPasskeyVerificationProvider

- (_TtC3akd34AppleIDPasskeyVerificationProvider)initWithServiceController:(id)a3 accountManager:(id)a4
{
  *(void *)self->serviceController = a3;
  *(void *)self->accountManager = a4;
  id v6 = a3;
  id v7 = a4;
  return self;
}

- (void)performVerificationRequestWith:(AKAppleIDPasskeySetupContext *)a3 completionHandler:(id)a4
{
  sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10026FD28;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10026FD30;
  v13[5] = v12;
  v14 = a3;
  swift_retain();
  sub_1001538E0((uint64_t)v8, (uint64_t)&unk_1002701D0, (uint64_t)v13);
  swift_release();
}

@end