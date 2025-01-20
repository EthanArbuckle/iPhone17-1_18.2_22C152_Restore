@interface ArcadeSubscriptionManager
- (_TtC19AppStoreKitInternal25ArcadeSubscriptionManager)init;
- (void)dealloc;
- (void)entitlementsDidChange;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4;
@end

@implementation ArcadeSubscriptionManager

- (void)dealloc
{
  v2 = self;
  ArcadeSubscriptionManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_paymentQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_dialogHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_activeStoreAccountProvider);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_stateLock));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_subscriptionEntitlements);
  sub_1E163EE1C(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_subscriptionState), self->paymentQueue[OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_subscriptionState]);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal25ArcadeSubscriptionManager_logger;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)entitlementsDidChange
{
  v2 = self;
  sub_1E18DB29C();
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1E18E241C(v7, (uint64_t)v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC19AppStoreKitInternal25ArcadeSubscriptionManager)init
{
  result = (_TtC19AppStoreKitInternal25ArcadeSubscriptionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4
{
  sub_1E15E9E84(0, &qword_1EAD85AE8);
  v6 = (void *)sub_1E1D5C248();
  id v7 = (objc_class *)a3;
  v8 = self;
  v9.super.isa = v7;
  v9._internal = v6;
  ArcadeSubscriptionManager.paymentQueue(_:updatedTransactions:)(v9, v10);

  swift_bridgeObjectRelease();
}

@end