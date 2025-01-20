@interface GCVirtualControllerImpl
@end

@implementation GCVirtualControllerImpl

void __52___GCVirtualControllerImpl_connectWithReplyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 24))
  {
LABEL_4:
    _publishCustomController();
    v7 = GCLookupService();
    v8 = [*(id *)(*(void *)(a1 + 32) + 8) elements];
    GCAnalyticsSendVirtualControllerConnectedEvent(v7, v8, (char)[*(id *)(*(void *)(a1 + 32) + 8) isHidden]);

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
      v10();
    }
    return;
  }
  v3 = -[_GCVirtualControllerImpl findKeyWindow](v2);
  if (v3)
  {
    v4 = v3;
    [v3 bounds];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setFrame:");
    [*(id *)(*(void *)(a1 + 32) + 24) setAutoresizingMask:18];
    v5 = [v4 rootViewController];
    v6 = [v5 view];
    [v6 addSubview:*(void *)(*(void *)(a1 + 32) + 24)];

    goto LABEL_4;
  }
  atomic_store(0, &s_connected);
  if (*(void *)(a1 + 40))
  {
    v13[0] = NSLocalizedDescriptionKey;
    v13[1] = NSLocalizedFailureReasonErrorKey;
    v14[0] = @"Virtual game controller setup failed.";
    v14[1] = @"No UIKit window found.";
    v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    v12 = +[NSError gc_VirtualControllerError:userInfo:]((uint64_t)NSError, 4, v11);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __38___GCVirtualControllerImpl_disconnect__block_invoke(uint64_t a1)
{
  _unpublishCustomController();
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 removeFromSuperview];
}

void __61___GCVirtualControllerImpl_Internal__refreshViewForKeyWindow__block_invoke(uint64_t a1)
{
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)&s_connected, memory_order_acquire);
  uint64_t v2 = *(void *)(a1 + 32);
  if (explicit == v2)
  {
    [*(id *)(v2 + 24) removeFromSuperview];
    v4 = -[_GCVirtualControllerImpl findKeyWindow](*(void *)(a1 + 32));
    id v7 = v4;
    if (v4)
    {
      v5 = [v4 rootViewController];
      v6 = [v5 view];
      [v6 addSubview:*(void *)(*(void *)(a1 + 32) + 24)];
    }
    else
    {
      [*(id *)(a1 + 32) disconnect];
    }
  }
}

void __60___GCVirtualControllerImpl_Internal__forceVirtualController__block_invoke(id a1, NSNotification *a2)
{
  SEL v2 = NSSelectorFromString(@"refreshViewForKeyWindow");
  if (objc_opt_respondsToSelector())
  {
    v3 = (void *)forceVirtualController_ForcedVirtualController;
    [v3 performSelector:v2];
  }
}

@end