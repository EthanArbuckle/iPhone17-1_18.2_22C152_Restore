@interface FAResendChildTransferRequestOperation
- (FAResendChildTransferRequestOperation)init;
- (FAResendChildTransferRequestOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 email:(id)a6 isResend:(BOOL)a7;
- (void)cancelChildTransferWithCompletionHandler:(id)a3;
- (void)resendChildTransferWithCompletionHandler:(id)a3;
@end

@implementation FAResendChildTransferRequestOperation

- (FAResendChildTransferRequestOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5 email:(id)a6 isResend:(BOOL)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___FAResendChildTransferRequestOperation_email);
  uint64_t *v13 = v12;
  v13[1] = v14;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_aaGrandSlamSigner) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_familyGrandSlamSigner) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_networkService) = (Class)a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_isResend) = a7;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for FAResendChildTransferRequestOperation();
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  return [(FAResendChildTransferRequestOperation *)&v19 init];
}

- (void)resendChildTransferWithCompletionHandler:(id)a3
{
  sub_100006CB4(&qword_10005E7B8);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_10005E7E8;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10005E7F0;
  v11[5] = v10;
  uint64_t v12 = self;
  sub_100033A4C((uint64_t)v6, (uint64_t)&unk_10005E7F8, (uint64_t)v11);
  swift_release();
}

- (void)cancelChildTransferWithCompletionHandler:(id)a3
{
  sub_100006CB4(&qword_10005E7B8);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_10005E7C8;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10005E7D0;
  v11[5] = v10;
  uint64_t v12 = self;
  sub_100033A4C((uint64_t)v6, (uint64_t)&unk_10005E7D8, (uint64_t)v11);
  swift_release();
}

- (FAResendChildTransferRequestOperation)init
{
  result = (FAResendChildTransferRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAResendChildTransferRequestOperation_familyGrandSlamSigner);
}

@end