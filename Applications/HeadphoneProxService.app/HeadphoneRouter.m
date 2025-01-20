@interface HeadphoneRouter
- (_TtC20HeadphoneProxService15HeadphoneRouter)init;
- (void)proxCardFlowDidDismiss;
@end

@implementation HeadphoneRouter

- (_TtC20HeadphoneProxService15HeadphoneRouter)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->currentView[OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_currentView] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_navigationController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_presenter;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_initialCardDisplayUpTicks) = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_marketingUpsell);
  void *v5 = 0;
  v5[1] = 0;
  *(void *)&self->currentView[OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_delegate] = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneRouter *)&v7 init];
}

- (void).cxx_destruct
{
  sub_100008F00((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_currentView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_navigationController));
  sub_10001A2AC((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_presenter, &qword_1000D5668);
  sub_10001F71C(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_marketingUpsell), *(void **)&self->currentView[OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_marketingUpsell]);
  v3 = (char *)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_delegate;

  sub_100008F00((uint64_t)v3);
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10003F678();
}

@end