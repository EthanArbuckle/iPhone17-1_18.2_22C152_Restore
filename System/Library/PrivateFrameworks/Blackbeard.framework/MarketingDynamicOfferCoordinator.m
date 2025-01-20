@interface MarketingDynamicOfferCoordinator
- (_TtC10Blackbeard32MarketingDynamicOfferCoordinator)init;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
@end

@implementation MarketingDynamicOfferCoordinator

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  uint64_t v9 = sub_249254F60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x24C59AA00]((char *)self + OBJC_IVAR____TtC10Blackbeard32MarketingDynamicOfferCoordinator_eventHub))
  {
    swift_getObjectType();
    id v17 = a5;
    id v13 = a3;
    id v14 = a4;
    v15 = self;
    sub_249254F50();
    sub_248BC8474((unint64_t *)&unk_269680370, MEMORY[0x263F6B680]);
    sub_249257440();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
}

- (_TtC10Blackbeard32MarketingDynamicOfferCoordinator)init
{
  *(void *)&self->eventHub[OBJC_IVAR____TtC10Blackbeard32MarketingDynamicOfferCoordinator_eventHub] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingDynamicOfferCoordinator();
  return [(MarketingDynamicOfferCoordinator *)&v4 init];
}

- (void).cxx_destruct
{
  sub_248BC60C4((uint64_t)self + OBJC_IVAR____TtC10Blackbeard32MarketingDynamicOfferCoordinator_eventHub);
  swift_unknownObjectWeakDestroy();
}

@end