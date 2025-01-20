@interface PaymentTransactionProcessor
- (_TtC10FinanceKit27PaymentTransactionProcessor)init;
- (void)deleteTransactionWithIdentifier:(id)a3 forPrimaryAccountIdentifier:(id)a4;
- (void)insertOrUpdateTransaction:(id)a3 forPrimaryAccountIdentifier:(id)a4;
@end

@implementation PaymentTransactionProcessor

- (_TtC10FinanceKit27PaymentTransactionProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaymentTransactionProcessor();
  return [(PaymentTransactionProcessor *)&v3 init];
}

- (void)insertOrUpdateTransaction:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  uint64_t v6 = sub_2439582D0();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  _s10FinanceKit27PaymentTransactionProcessorC14insertOrUpdate11transaction3forySo09FKPaymentD0C_SStF_0(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)deleteTransactionWithIdentifier:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  uint64_t v5 = sub_2439582D0();
  unint64_t v7 = v6;
  uint64_t v8 = sub_2439582D0();
  unint64_t v10 = v9;
  uint64_t v11 = qword_26B0C5D00;
  v12 = self;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = *((void *)off_26B0C5CF8 + 2);
  type metadata accessor for BankConnectPassKitTransactionsDeleter();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v13;
  swift_retain();
  _s10FinanceKit27PaymentTransactionProcessorC06deleteD04with3for18bankConnectDeleterySS_SSAA04Bankj4Passb12TransactionsK0CtF_0(v5, v7, v8, v10, inited);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end