@interface WebViewRepresentableProvider.Coordinator
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (_TtCV20AppleMediaServicesUI28WebViewRepresentableProvider11Coordinator)init;
- (void)webViewController:(id)a3 didEncodeNetworkRequest:(id)a4;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation WebViewRepresentableProvider.Coordinator

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_21C2BF220();
  *(void *)(swift_allocObject() + 16) = v7;
  id v8 = a3;
  v9 = self;
  LOBYTE(self) = sub_21C2B6270();

  swift_bridgeObjectRelease();
  swift_release();
  return self & 1;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  if (a4) {
    sub_21C2BF220();
  }
  *(void *)(swift_allocObject() + 16) = v10;
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  sub_21C2B66B0();

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)webViewController:(id)a3 didEncodeNetworkRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_21C2B689C((uint64_t)v8, (uint64_t)v7);
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_21C2B69F8((uint64_t)v11, (uint64_t)a4, (uint64_t)a5);
}

- (_TtCV20AppleMediaServicesUI28WebViewRepresentableProvider11Coordinator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV20AppleMediaServicesUI28WebViewRepresentableProvider11Coordinator_edgesPropagatingSafeAreaInsetsToSubviewsObservation));
  swift_release();
  swift_release();
  swift_release();
}

@end