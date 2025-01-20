@interface TransactionReceiver
- (_TtC8StoreKit19TransactionReceiver)init;
- (void)receivedTransactions:(id)a3;
@end

@implementation TransactionReceiver

- (void)receivedTransactions:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1B01DBDF0();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  sub_1B00BF4BC(v3);
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC8StoreKit19TransactionReceiver)init
{
}

@end