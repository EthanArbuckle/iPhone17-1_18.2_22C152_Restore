@interface SubscriptionPurchasePresenter
- (_TtC10Blackbeard29SubscriptionPurchasePresenter)init;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation SubscriptionPurchasePresenter

- (_TtC10Blackbeard29SubscriptionPurchasePresenter)init
{
  result = (_TtC10Blackbeard29SubscriptionPurchasePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10Blackbeard29SubscriptionPurchasePresenter_accountProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

@end