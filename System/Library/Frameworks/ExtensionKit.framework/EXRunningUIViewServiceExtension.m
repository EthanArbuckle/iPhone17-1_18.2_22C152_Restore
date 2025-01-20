@interface EXRunningUIViewServiceExtension
@end

@implementation EXRunningUIViewServiceExtension

void __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"XPCService"];
  [v3 setService:@"InternalService"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 setDelegate:WeakRetained];
}

void __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"XPCService"];
  [v3 setService:@"MainService"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 setDelegate:WeakRetained];
}

uint64_t __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_2(uint64_t a1)
{
  v2 = _EXSignpostLog();
  if ([*(id *)(a1 + 32) signpost] && os_signpost_enabled(v2))
  {
    id v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 32) signpost];
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_2156DD000, v3, OS_SIGNPOST_EVENT, v5, "extensionkit-lifecycle", "Runloop started", v7, 2u);
      }
    }
  }
  return [*(id *)(a1 + 32) didFinishLaunching];
}

void __78___EXRunningUIViewServiceExtension_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setActivateOnResume];
  [v2 setFaultOnSuspend];
}

@end