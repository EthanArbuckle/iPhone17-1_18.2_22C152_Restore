@interface StoreKitPaymentDelegate
- (_TtC8StoreKit23StoreKitPaymentDelegate)init;
- (void)handleEngagementRequest:(id)a3 replyBlock:(id)a4;
- (void)handlePaymentSheetRequest:(id)a3 replyBlock:(id)a4;
- (void)shouldContinueTransactionWithNewStorefront:(id)a3 replyBlock:(id)a4;
@end

@implementation StoreKitPaymentDelegate

- (void)handlePaymentSheetRequest:(id)a3 replyBlock:(id)a4
{
  v5 = _Block_copy(a4);
  id v6 = a3;
  swift_retain();
  uint64_t v7 = sub_1B01DB440();
  unint64_t v9 = v8;

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v5;
  sub_1B016D3D8(v10, v11, (uint64_t)sub_1B016F1B4, v10);
  swift_release();
  sub_1B00AD804(v7, v9);

  swift_release();
}

- (void)shouldContinueTransactionWithNewStorefront:(id)a3 replyBlock:(id)a4
{
  v4 = _Block_copy(a4);
  sub_1B01DBB50();
  *(void *)(swift_allocObject() + 16) = v4;
  swift_retain();
  sub_1B016DA30();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)handleEngagementRequest:(id)a3 replyBlock:(id)a4
{
  v5 = _Block_copy(a4);
  id v6 = a3;
  swift_retain();
  uint64_t v7 = sub_1B01DB440();
  unint64_t v9 = v8;

  *(void *)(swift_allocObject() + 16) = v5;
  sub_1B016E1AC();
  swift_release();
  sub_1B00AD804(v7, v9);

  swift_release();
}

- (_TtC8StoreKit23StoreKitPaymentDelegate)init
{
}

@end