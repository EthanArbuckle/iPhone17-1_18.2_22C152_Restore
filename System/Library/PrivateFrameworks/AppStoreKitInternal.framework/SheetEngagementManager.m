@interface SheetEngagementManager
- (BOOL)engagementTaskViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5;
- (_TtC19AppStoreKitInternal22SheetEngagementManager)init;
- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation SheetEngagementManager

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  id v11 = a3;
  id v9 = a4;
  v10 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_6handle10completionySo13AMSEngagementC_So0K7RequestCSgySo0K6ResultCSg_s5Error_pSgtctF_0(v11, a4);
  _Block_release(v8);
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_1E1D5BE58();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1E1D5BE58();
  uint64_t v16 = v15;
  id v19 = a3;
  id v17 = a4;
  v18 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_9didUpdate9placement11serviceType10completionySo13AMSEngagementC_So0O7RequestCSgS2SySo0O6ResultCSg_s5Error_pSgtctF_0(v19, a4, v11, v13, v14, v16);
  _Block_release(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_6handle10completionySo13AMSEngagementC_So16AMSDialogRequestCSgySo0L6ResultCSg_s5Error_pSgtctF_0(v9, a4);
  _Block_release(v8);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_1E1D5BE58();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1E1D5BE58();
  uint64_t v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_9didUpdate9placement11serviceTypeySo13AMSEngagementC_So16AMSDialogRequestCSgS2StF_0(v15, a4, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)engagementTaskViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  LOBYTE(self) = SheetEngagementManager.engagementTaskViewController(_:handleDynamicDelegateAction:completionHandler:)(v10, v11, (uint64_t)sub_1E189C318, v9);
  swift_release();

  return self & 1;
}

- (_TtC19AppStoreKitInternal22SheetEngagementManager)init
{
  result = (_TtC19AppStoreKitInternal22SheetEngagementManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_engagement));
  swift_unknownObjectWeakDestroy();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  sub_1E1897594(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_previousArcadeSubscriptionState), self->engagement[OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_previousArcadeSubscriptionState]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_flowActionViewControllerFactory);
  sub_1E160EDD8(v3);
}

@end