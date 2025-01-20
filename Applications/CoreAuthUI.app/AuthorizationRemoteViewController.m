@interface AuthorizationRemoteViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (AuthorizationRemoteViewController)initWithCoder:(id)a3;
- (AuthorizationRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges;
- (void)startWithConfiguration:(id)a3 reply:(id)a4;
- (void)stopWithReply:(id)a3;
- (void)viewModel:(id)a3 didReceiveCustomPassword:(id)a4 handler:(id)a5;
@end

@implementation AuthorizationRemoteViewController

+ (id)_exportedInterface
{
  return sub_10003D87C((uint64_t)a1, (uint64_t)a2, &protocolRef_LACUIAuthenticatorService);
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  return sub_10003D87C((uint64_t)a1, (uint64_t)a2, &protocolRef_LACUIAuthenticatorHost);
}

- (AuthorizationRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (AuthorizationRemoteViewController *)AuthorizationRemoteViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (AuthorizationRemoteViewController)initWithCoder:(id)a3
{
  return (AuthorizationRemoteViewController *)AuthorizationRemoteViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion));
  v3 = (char *)self + OBJC_IVAR___AuthorizationRemoteViewController_log;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)startWithConfiguration:(id)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(void *, void *))_Block_copy(a4);
  id v11 = a3;
  uint64_t v7 = self;
  id v8 = [v11 validateConfiguration];
  if (v8)
  {
    id v9 = v8;
    v10 = (void *)_convertErrorToNSError(_:)();
    v6[2](v6, v10);
  }
  else
  {
    AuthorizationRemoteViewController.presentUI(configuration:)(v11);
    v6[2](v6, 0);
  }
  _Block_release(v6);
}

- (void)stopWithReply:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10003E6F8((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)viewModel:(id)a3 didReceiveCustomPassword:(id)a4 handler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = a3;
  v13 = self;
  sub_10003E7B8(v8, v10, (uint64_t)sub_10002F2D8, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

@end