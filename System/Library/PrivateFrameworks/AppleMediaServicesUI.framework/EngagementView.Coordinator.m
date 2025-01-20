@interface EngagementView.Coordinator
- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5;
- (_TtCV20AppleMediaServicesUI14EngagementView11Coordinator)init;
- (void)engagementViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)engagementViewControllerShouldDismiss:(id)a3;
@end

@implementation EngagementView.Coordinator

- (void)engagementViewControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C2409C4();
}

- (void)engagementViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_21C240AAC((uint64_t)v11, a4, a5);
}

- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  LOBYTE(self) = sub_21C240D3C((uint64_t)v12, (uint64_t)v11, (uint64_t)sub_21C235820, v9);

  swift_release();
  return self & 1;
}

- (_TtCV20AppleMediaServicesUI14EngagementView11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end