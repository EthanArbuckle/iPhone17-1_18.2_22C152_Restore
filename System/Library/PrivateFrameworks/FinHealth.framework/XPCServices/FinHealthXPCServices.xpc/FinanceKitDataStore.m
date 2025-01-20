@interface FinanceKitDataStore
- (_TtC20FinHealthXPCServices19FinanceKitDataStore)init;
- (void)fetchAccountsWithCompletionHandler:(id)a3;
- (void)streamTransactionsSince:(_TtC20FinHealthXPCServices19FinanceKitDataStore *)self transactionHandler:(SEL)a2 accountHandler:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation FinanceKitDataStore

- (void)streamTransactionsSince:(_TtC20FinHealthXPCServices19FinanceKitDataStore *)self transactionHandler:(SEL)a2 accountHandler:(NSString *)a3 completionHandler:(id)a4
{
  v6 = v5;
  v7 = v4;
  sub_1000188B8(&qword_1000378E0);
  __chkstk_darwin();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(v7);
  v15 = _Block_copy(v6);
  v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = v13;
  v16[4] = v14;
  v16[5] = v15;
  v16[6] = self;
  uint64_t v17 = sub_100021E70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100037930;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_100037938;
  v19[5] = v18;
  v20 = a3;
  v21 = self;
  sub_10001D7BC((uint64_t)v12, (uint64_t)&unk_100037940, (uint64_t)v19);
  swift_release();
}

- (void)fetchAccountsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000188B8(&qword_1000378E0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_100021E70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000378F0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100037900;
  v12[5] = v11;
  v13 = self;
  sub_10001D7BC((uint64_t)v7, (uint64_t)&unk_100037910, (uint64_t)v12);
  swift_release();
}

- (_TtC20FinHealthXPCServices19FinanceKitDataStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FinanceKitDataStore();
  return [(FinanceKitDataStore *)&v3 init];
}

@end