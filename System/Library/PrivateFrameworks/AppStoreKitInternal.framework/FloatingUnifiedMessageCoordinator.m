@interface FloatingUnifiedMessageCoordinator
- (_TtC19AppStoreKitInternal33FloatingUnifiedMessageCoordinator)init;
- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5;
@end

@implementation FloatingUnifiedMessageCoordinator

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_1E1D5BE58();
  v11 = v10;
  v12 = (void (*)(char *, uint64_t))sub_1E1D5BE58();
  uint64_t v14 = v13;
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  FloatingUnifiedMessageCoordinator.engagement(_:didUpdate:placement:serviceType:)(v15, a4, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  FloatingUnifiedMessageCoordinator.messageViewController(_:didSelectActionWith:)(v6, v7);
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8 = sub_1E1D5BCB8();
  if (a5) {
    sub_1E1D5BE58();
  }
  id v9 = a3;
  v10 = self;
  _s19AppStoreKitInternal33FloatingUnifiedMessageCoordinatorC21messageViewController_22enqueueEventWithFields7inTopicySo012AMSUIMessagejK0_So06UIViewK0CXc_SDys11AnyHashableVypGSSSgtF_0(v9, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  _s19AppStoreKitInternal33FloatingUnifiedMessageCoordinatorC21messageViewController_16didFailWithErrorySo012AMSUIMessagejK0_So06UIViewK0CXc_s0O0_pSgtF_0(v6, (uint64_t)a4);
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = self;
  _s19AppStoreKitInternal33FloatingUnifiedMessageCoordinatorC21messageViewController_9didUpdateySo012AMSUIMessagejK0_So06UIViewK0CXc_So6CGSizeVtF_0(v7, width, height);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_1E1D5BE58();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1E1D5BE58();
  uint64_t v16 = v15;
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  _s19AppStoreKitInternal33FloatingUnifiedMessageCoordinatorC10engagement_9didUpdate9placement11serviceType10completionySo13AMSEngagementC_So0P7RequestCSgS2SySo0P6ResultCSg_s5Error_pSgtctF_0(v17, a4, v11, v13, v14, v16);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal33FloatingUnifiedMessageCoordinator)init
{
  result = (_TtC19AppStoreKitInternal33FloatingUnifiedMessageCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal33FloatingUnifiedMessageCoordinator_actionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal33FloatingUnifiedMessageCoordinator_engagement));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal33FloatingUnifiedMessageCoordinator_metricsPipeline;
  uint64_t v4 = sub_1E1D5A498();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end