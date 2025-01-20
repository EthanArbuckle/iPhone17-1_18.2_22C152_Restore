@interface MarketingWebViewCoordinator
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (_TtC16FitnessMarketing27MarketingWebViewCoordinator)init;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation MarketingWebViewCoordinator

- (_TtC16FitnessMarketing27MarketingWebViewCoordinator)init
{
  result = (_TtC16FitnessMarketing27MarketingWebViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24F0B61C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase));
  v3 = (char *)self + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_presentingViewController;
  MEMORY[0x270FA05E8](v3);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_24F0EC7E8(a4, a5);
}

@end