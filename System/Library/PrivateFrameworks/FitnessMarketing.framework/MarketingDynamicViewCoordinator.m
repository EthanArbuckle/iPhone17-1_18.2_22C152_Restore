@interface MarketingDynamicViewCoordinator
- (_TtC16FitnessMarketing31MarketingDynamicViewCoordinator)init;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
@end

@implementation MarketingDynamicViewCoordinator

- (_TtC16FitnessMarketing31MarketingDynamicViewCoordinator)init
{
  result = (_TtC16FitnessMarketing31MarketingDynamicViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24F0B61C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss));
  sub_24F0B61C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink);
  sub_24F0B61C4(v3);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
}

@end