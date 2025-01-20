@interface AXRemoteNearbyDevicesViewController
@end

@implementation AXRemoteNearbyDevicesViewController

void __113___AXRemoteNearbyDevicesViewController_presentNearbyDevicesViewControllerWithConnectionHandler_dismissalHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v9 = v7;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v7, "setDismissHandler:");
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v6);
  }
}

@end