@interface GEOCountryConfigurationRemoteProxy
@end

@implementation GEOCountryConfigurationRemoteProxy

void __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v5 = [v4 objectForKey:@"userInfo"];
    v6 = objc_msgSend(v5, "_geo_errorForKey:", @"err");
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke_2;
    v9[3] = &unk_1E53D7C50;
    id v11 = v7;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
}

void __67___GEOCountryConfigurationRemoteProxy_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained serverProxy:*(void *)(a1 + 32) countryCodeDidChange:*(void *)(a1 + 40)];
}

uint64_t __83___GEOCountryConfigurationRemoteProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke(uint64_t a1)
{
  v2 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Received country providers change notification. Informing delegate.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke_368;
    block[3] = &unk_1E53D79D8;
    v7 = WeakRetained;
    dispatch_async(v5, block);
  }
}

void __70___GEOCountryConfigurationRemoteProxy_initWithDelegate_delegateQueue___block_invoke_368(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained serverProxyProvidersDidChange:*(void *)(a1 + 32)];
}

@end