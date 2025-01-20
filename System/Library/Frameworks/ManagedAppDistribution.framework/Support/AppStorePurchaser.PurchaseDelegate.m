@interface AppStorePurchaser.PurchaseDelegate
- (_TtCO28ManagedAppDistributionDaemon17AppStorePurchaserP33_6AF5BC28C396296C07C418EBE9C0A1DE16PurchaseDelegate)init;
- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5;
@end

@implementation AppStorePurchaser.PurchaseDelegate

- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10065F970;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10065F978;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100451B68((uint64_t)v11, (uint64_t)&unk_10065F980, (uint64_t)v16);
  swift_release();
}

- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10065F930;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10065D380;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100451B68((uint64_t)v11, (uint64_t)&unk_10065F940, (uint64_t)v16);
  swift_release();
}

- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000172F8(&qword_10065B220);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10065F918;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10065D320;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100451B68((uint64_t)v11, (uint64_t)&unk_10065D328, (uint64_t)v16);
  swift_release();
}

- (_TtCO28ManagedAppDistributionDaemon17AppStorePurchaserP33_6AF5BC28C396296C07C418EBE9C0A1DE16PurchaseDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppStorePurchaser.PurchaseDelegate();
  return [(AppStorePurchaser.PurchaseDelegate *)&v3 init];
}

@end