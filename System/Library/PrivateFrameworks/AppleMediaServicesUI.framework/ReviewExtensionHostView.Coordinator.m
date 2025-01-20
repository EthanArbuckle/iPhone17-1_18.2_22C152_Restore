@interface ReviewExtensionHostView.Coordinator
- (_TtCV20AppleMediaServicesUI23ReviewExtensionHostView11Coordinator)init;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
@end

@implementation ReviewExtensionHostView.Coordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C29A194(v4);
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_21C29A298((uint64_t)v8, a4);
}

- (_TtCV20AppleMediaServicesUI23ReviewExtensionHostView11Coordinator)init
{
}

- (void).cxx_destruct
{
}

@end