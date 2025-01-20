@interface CommerceDialogHandler
- (_TtC19AppStoreKitInternal21CommerceDialogHandler)init;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)handleViewPresentationRequest:(id)a3 resultHandler:(id)a4;
@end

@implementation CommerceDialogHandler

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v8 = a3;
  v7 = self;
  sub_1E1973700(v8, (uint64_t)v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
}

- (_TtC19AppStoreKitInternal21CommerceDialogHandler)init
{
  result = (_TtC19AppStoreKitInternal21CommerceDialogHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal21CommerceDialogHandler_bag, (uint64_t *)&unk_1EBF406A8);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end