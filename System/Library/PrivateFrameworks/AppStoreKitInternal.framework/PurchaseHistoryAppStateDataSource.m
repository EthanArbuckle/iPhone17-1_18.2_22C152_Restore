@interface PurchaseHistoryAppStateDataSource
- (_TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource)init;
- (void)accountsDidChange;
- (void)dealloc;
- (void)purchaseHistoryUpdated:(id)a3;
@end

@implementation PurchaseHistoryAppStateDataSource

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PurchaseHistoryAppStateDataSource();
  [(PurchaseHistoryAppStateDataSource *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1E15F6A98((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_accessQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_callbackQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource_purchaseHistory);
  swift_release();
  swift_release();
}

- (void)purchaseHistoryUpdated:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E1CCD010((uint64_t)sub_1E1CCD2D4, (uint64_t)&block_descriptor_52);
}

- (void)accountsDidChange
{
  v2 = self;
  sub_1E1CCAD68();
}

- (_TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource)init
{
  result = (_TtC19AppStoreKitInternal33PurchaseHistoryAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end